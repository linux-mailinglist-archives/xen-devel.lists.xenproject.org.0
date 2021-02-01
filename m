Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B530AB01
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79967.145929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b1h-0006CH-FF; Mon, 01 Feb 2021 15:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79967.145929; Mon, 01 Feb 2021 15:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b1h-0006Bo-Bf; Mon, 01 Feb 2021 15:22:05 +0000
Received: by outflank-mailman (input) for mailman id 79967;
 Mon, 01 Feb 2021 15:22:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6b1f-0006Bi-Nl
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:22:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6f1b027-791e-4140-974e-c648fca96b60;
 Mon, 01 Feb 2021 15:22:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E35BFABD5;
 Mon,  1 Feb 2021 15:22:01 +0000 (UTC)
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
X-Inumbo-ID: e6f1b027-791e-4140-974e-c648fca96b60
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612192922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sG4LHCqEmYFjhoTglfEjWuO4Ko9nlkVCLkCQZ2mXyvQ=;
	b=TZaxPwXJc9p7X5Y5dAK8oDDnqIoxoXRR1di1ZUM/J+qC5u5UAUprwAj1HsmqdQycnhc6Dt
	eFsQoW/g4OP/OsY4N21zUfIW8aOxIlnMEk3QyHUGRjy2WmthSoSgljCnE4e5XckWEt3R/f
	S7c07wUCIwLED6np/nBKLWDW/9EEKys=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ioreq: don't (deliberately) crash Dom0
Message-ID: <1dc6fe4c-3435-462d-a339-085014ae0deb@suse.com>
Date: Mon, 1 Feb 2021 16:22:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We consider this error path of hvm_alloc_ioreq_mfn() to not be possible
to be taken, or otherwise to indicate abuse or a bug somewhere. If there
is abuse of some kind, crashing Dom0 here would mean a system-wide DoS.
Only crash the emulator domain if it's not the (global) control domain;
crash only the guest being serviced otherwise.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -274,7 +274,7 @@ static int hvm_alloc_ioreq_mfn(struct hv
          * The domain can't possibly know about this page yet, so failure
          * here is a clear indication of something fishy going on.
          */
-        domain_crash(s->emulator);
+        domain_crash(is_control_domain(s->emulator) ? s->target : s->emulator);
         return -ENODATA;
     }
 

