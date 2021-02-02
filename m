Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD330C32B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 16:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80593.147476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xNg-0000di-JB; Tue, 02 Feb 2021 15:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80593.147476; Tue, 02 Feb 2021 15:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6xNg-0000dJ-G1; Tue, 02 Feb 2021 15:14:16 +0000
Received: by outflank-mailman (input) for mailman id 80593;
 Tue, 02 Feb 2021 15:14:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6xNe-0000dD-GI
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 15:14:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6c7ac7e-148c-4287-b701-906a1675bf95;
 Tue, 02 Feb 2021 15:14:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F69AABDA;
 Tue,  2 Feb 2021 15:14:13 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f6c7ac7e-148c-4287-b701-906a1675bf95
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612278853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSUSrC4kKy6M1cRdxifAihMQi5w0aWPsjPzG6ahbp9A=;
	b=geWPBSFwqPxOveS6dUnWc6g8a63zMCzhOtwQlN3hxjI+eGjS5EOTOzCOWt3krAZppoOEkT
	HhLXIYA+ZkEkDFVcKG2xKzoEPMT/qjmp1OuOuOTMR6LRpxIFfF2iuIBiDttGXOVcKXUSxB
	OCvBq5W/j2ABhIXZoyts+dOBGK9qJtM=
Subject: [PATCH v2 1/2] IOREQ: fix waiting for broadcast completion
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com>
Message-ID: <3365a9a1-92c0-8917-1632-b88f1c055392@suse.com>
Date: Tue, 2 Feb 2021 16:14:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Checking just a single server is not enough - all of them must have
signaled that they're done processing the request.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -213,9 +213,9 @@ bool vcpu_ioreq_handle_completion(struct
         return false;
     }
 
-    sv = get_pending_vcpu(v, &s);
-    if ( sv && !wait_for_io(sv, get_ioreq(s, v)) )
-        return false;
+    while ( (sv = get_pending_vcpu(v, &s)) != NULL )
+        if ( !wait_for_io(sv, get_ioreq(s, v)) )
+            return false;
 
     vio->req.state = ioreq_needs_completion(&vio->req) ?
         STATE_IORESP_READY : STATE_IOREQ_NONE;


