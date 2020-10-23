Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE5296B52
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10785.28788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsbJ-0006oO-4w; Fri, 23 Oct 2020 08:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10785.28788; Fri, 23 Oct 2020 08:39:05 +0000
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
	id 1kVsbJ-0006ny-0Y; Fri, 23 Oct 2020 08:39:05 +0000
Received: by outflank-mailman (input) for mailman id 10785;
 Fri, 23 Oct 2020 08:39:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVsbH-0006no-Go
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:39:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37783b02-83e7-45ee-8acf-b93102008a45;
 Fri, 23 Oct 2020 08:39:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1ADBBABF4;
 Fri, 23 Oct 2020 08:39:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVsbH-0006no-Go
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:39:03 +0000
X-Inumbo-ID: 37783b02-83e7-45ee-8acf-b93102008a45
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 37783b02-83e7-45ee-8acf-b93102008a45;
	Fri, 23 Oct 2020 08:39:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603442342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/CSsTj+azQBJhNlEDi7dDTrUxCNiHutJMIEl+th0O8=;
	b=t7vu6KTaiVJ6LAEIUaAxtoG8+NhI8Z8DpVtQ5GaRcQT7OaulrKF+4IKkvmuTJxQfjPw+j4
	kMJcvCLPepqJr/VsbKU0Yc9/cAwiqrkeWO1OnHOz8snflj7F6sO2dIlDAvwZWwh6oY7xz1
	nBtGBZ2uGOcV/R9ab/CRWbfROzGIU3A=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1ADBBABF4;
	Fri, 23 Oct 2020 08:39:02 +0000 (UTC)
Subject: [PATCH v3 7/7] x86: make guarding against straight-line speculation
 optional
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Message-ID: <06067023-0f61-3e37-a0a4-4254df1f5c16@suse.com>
Date: Fri, 23 Oct 2020 10:39:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Put insertion of INT3 behind CONFIG_SPECULATIVE_HARDEN_BRANCH
conditionals.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -11,8 +11,10 @@
 
 #include <asm/asm_defns.h>
 
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
 /* Don't transform the "ret" further down. */
 .purgem ret
+#endif
 
 .macro IND_THUNK_RETPOLINE reg:req
         call 2f
@@ -45,7 +47,9 @@ ENTRY(__x86_indirect_thunk_\reg)
         __stringify(IND_THUNK_LFENCE \reg), X86_FEATURE_IND_THUNK_LFENCE, \
         __stringify(IND_THUNK_JMP \reg),    X86_FEATURE_IND_THUNK_JMP
 
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
         int3 /* Halt straight-line speculation */
+#endif
 
         .size __x86_indirect_thunk_\reg, . - __x86_indirect_thunk_\reg
         .type __x86_indirect_thunk_\reg, @function
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -51,6 +51,8 @@
     INDIRECT_BRANCH jmp \arg
 .endm
 
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
+
 /*
  * To guard against speculation past RET, insert a breakpoint insn
  * immediately after them.
@@ -66,3 +68,5 @@
     .word \operand
     .endif
 .endm
+
+#endif


