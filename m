Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979282B970A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 16:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31022.61219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmJJ-0005GO-P8; Thu, 19 Nov 2020 15:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31022.61219; Thu, 19 Nov 2020 15:57:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmJJ-0005Fz-Lg; Thu, 19 Nov 2020 15:57:25 +0000
Received: by outflank-mailman (input) for mailman id 31022;
 Thu, 19 Nov 2020 15:57:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfmJI-0005Fu-A6
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:57:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3867198-9c2b-432e-ada4-86bb1306e479;
 Thu, 19 Nov 2020 15:57:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9A0FABD6;
 Thu, 19 Nov 2020 15:57:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfmJI-0005Fu-A6
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 15:57:24 +0000
X-Inumbo-ID: f3867198-9c2b-432e-ada4-86bb1306e479
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f3867198-9c2b-432e-ada4-86bb1306e479;
	Thu, 19 Nov 2020 15:57:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605801442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q8pTdAyL07uOku06xGXBXqPxNVKB/ssYIkgqBhIqPsU=;
	b=LLQSGZkT9aqqj2o8h+ACvcUTcwchDxG9wWIdn/N5GKlBQZpg1TmOJ8h/XPhaLaA7oWhuq3
	VG/ig9UZs8oPWKlhcgiX8Jg0oo39BpGg5r6uj/1gXHE4RXu8oHTb+Vlx+rN+HFSTv0Us1s
	nsGTmEL6SbeQzoSjTzig8Un6NxwOe88=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C9A0FABD6;
	Thu, 19 Nov 2020 15:57:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] SVM: avoid UB in intercept mask definitions
Message-ID: <eaef863f-a396-58be-cb32-7a9e2535d9e2@suse.com>
Date: Thu, 19 Nov 2020 16:57:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Found by looking for patterns similar to the one Julien did spot in
pci_vtd_quirks().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -55,7 +55,7 @@ enum GenericIntercept1bits
     GENERAL1_INTERCEPT_MSR_PROT      = 1 << 28,
     GENERAL1_INTERCEPT_TASK_SWITCH   = 1 << 29,
     GENERAL1_INTERCEPT_FERR_FREEZE   = 1 << 30,
-    GENERAL1_INTERCEPT_SHUTDOWN_EVT  = 1 << 31
+    GENERAL1_INTERCEPT_SHUTDOWN_EVT  = 1u << 31
 };
 
 /* general 2 intercepts */
@@ -112,7 +112,7 @@ enum CRInterceptBits
     CR_INTERCEPT_CR12_WRITE = 1 << 28,
     CR_INTERCEPT_CR13_WRITE = 1 << 29,
     CR_INTERCEPT_CR14_WRITE = 1 << 30,
-    CR_INTERCEPT_CR15_WRITE = 1 << 31,
+    CR_INTERCEPT_CR15_WRITE = 1u << 31,
 };
 
 
@@ -150,7 +150,7 @@ enum DRInterceptBits
     DR_INTERCEPT_DR12_WRITE = 1 << 28,
     DR_INTERCEPT_DR13_WRITE = 1 << 29,
     DR_INTERCEPT_DR14_WRITE = 1 << 30,
-    DR_INTERCEPT_DR15_WRITE = 1 << 31,
+    DR_INTERCEPT_DR15_WRITE = 1u << 31,
 };
 
 enum VMEXIT_EXITCODE

