Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMMtFdZlV2pCLAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 12:49:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8CD75D1A6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 12:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=b8yOywnh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1362914.1614714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjxAi-0005lw-E0; Wed, 15 Jul 2026 10:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362914.1614714; Wed, 15 Jul 2026 10:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjxAi-0005jI-B9; Wed, 15 Jul 2026 10:49:00 +0000
Received: by outflank-mailman (input) for mailman id 1362914;
 Wed, 15 Jul 2026 10:48:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wjxAg-0005jC-Mn
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 10:48:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjxAf-00EURi-Oo
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 12:48:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a576574-e002-0a2a0a5209dd-0a2a4506d290-46
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 12:48:57 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a576599-195a-0a2a45060019-d155dd34f06c-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 12:48:57 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f36a122fdso2132245f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 03:48:57 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a33a926sm131822985e9.15.2026.07.15.03.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2026 03:48:56 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1784112537; x=1784717337; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4GLNl1BI8/ACpqoyTSEggGlWWMo50rNk6LQnm3rlzg=;
        b=b8yOywnhf19zmHDwQqN6v4l6FykmmvskqO0rLVeWJCJ2pefioQZH6ZwUew/lUPu3QT
         XSibzJW9yZat+plia66QnL6rzH1y1K2EigNTm8Miwyjkz27uwn9eTdFLB4x7eWIbWoJJ
         DbXkjzzlCzBfb8ASudzRrF4ePnIaRLzob2htc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112537; x=1784717337;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4GLNl1BI8/ACpqoyTSEggGlWWMo50rNk6LQnm3rlzg=;
        b=KKQylpS6a7TK/ajj0/c9uw8O6t/MbLRnPeJwWjCooDkcG9KFADvbGPcq+zQnHjc+ao
         /QolrEDXV7Q0K+KsFW7BwEVxiLGEnEx+ZEv23xtVnKDk7hpF6XC9U8+r176O4pFG0pli
         1FFrkKijDj1Tv3DCX+EGf1m39yO0BqgwIftBV0aXr8iT3MF51eUAi7nhG5w96Z1OMdAz
         +lxkBAdFSVhHxPzOt9vknDeSySUPu9votGJufAZQxXBd8M9feU3UmDWH6kuw59LsYqNW
         zQ0P2ORSGaGc4x4A66NUwRnwl/9c0L9bdCTmQPMNrE+4FB310VMRstfPlrSFgSBXSQ3K
         wUHw==
X-Gm-Message-State: AOJu0Yzr7AyJ0MYcVARaHUllwQ5UW0AVCVP785gkGYaZuFquoELX9DUV
	xlBso5GYE8TQdrfSbU55QbW2TZLluPzORwBM5GC8zbH87lBHU+dq1F8eonXYlNQZU5ms+TaxI2q
	gtD9SFKw=
X-Gm-Gg: AfdE7cnlZm7f/Z9437nNvrjVDBhiDSTF3Ee2ZhfkDI8+jlWVrRX0G2w20RXp8Xj9J6H
	DUVcVNj/cqcg8mbPCi8MdI7NhzBURzswQxAy6R3Y8CLqTW+0N439BKTH7xP+Fxbf6tJi1lQW5hK
	bjv6mvl4VqKgyhQUWj+OAulDU9UD3cYSNSfTe0ukbhCUY9OpdTiiAkNh6aX6TZTHK7RPuRpyDZS
	gJsMMugsNH5AwMaR0lgc1AxRf5Bu3osYU8//VnbsR0wu32g63u+BI/YFXHtTtmNKjDjGopfCMay
	+GngB3MN/yTIGyzUivCtmavmTz8JnO1jvOGXpA812agSfeyxKvcRY6VyAOWuQHuHiAiCfzyB9ir
	Kla6KG8NXGmXXtvQqpS18WUfVwVDbRvEGQCYLdqrmmo1zqGArtwHScOnw+9OytZCsl/62Hj8qz2
	M06QTcqTAetCZnTqa8SIjDwiv5RnlTM1B//kwbCatCfkrBtXioDYqOJdyONwRbxOk=
X-Received: by 2002:a05:600c:34d0:b0:493:ee2b:c876 with SMTP id 5b1f17b1804b1-494eb1b6de3mr87737065e9.35.1784112536685;
        Wed, 15 Jul 2026 03:48:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/entry: Fix VERW offsets in restore_all_xen()
Date: Wed, 15 Jul 2026 11:48:54 +0100
Message-Id: <20260715104854.1813130-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784112537-F4E0677B-C64EB363/0/0
X-purgate-type: clean
X-purgate-size: 3872
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,vates.tech:email,citrix.com:from_mime,citrix.com:mid,citrix.com:email,citrix.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C8CD75D1A6

As explained in the comment partially in context, and contrary to what was
said in commit 8af337dfb8e2 ("x86/entry: Use POP_GPRS and remove
RESTORE_ALL"), the restore_all_xen() path cannot use default offsets for
SPEC_CTRL_COND_VERW.

Getting this wrong is surprisingly benign.  VERW doesn't fault for any limit
or descriptor reasons.

However, in SVM vCPU context LDTR is the guest's not Xen's.  When the segment
selector VERW uses happens to be an LDT selector, the CPU accesses the guest
LDTR in Xen context:

  (XEN) ----[ Xen-4.23.0  x86_64  debug=y  Not tainted ]----
  (XEN) CPU:    14
  (XEN) RIP:    e008:[<ffff82d0402007f2>] x86_64/entry.S#restore_all_xen+0x72/0x80
  (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor (d3v1)
  ...
  (XEN) Xen code around <ffff82d0402007f2> (x86_64/entry.S#restore_all_xen+0x72/0x80):
  (XEN)  5f f6 44 24 7c 08 74 05 <0f> 00 6c 24 44 48 83 c4 08 48 cf 0f 1f 00 fc 0f
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d0402007f2>] R x86_64/entry.S#restore_all_xen+0x72/0x80
  (XEN)    [<ffff82d0402e79f6>] F nestedhap_fix_p2m+0x5f/0xc9
  (XEN)    [<ffff82d0402e7c8f>] F nestedhvm_hap_nested_page_fault+0x11e/0x22e
  (XEN)    [<ffff82d0402cd59d>] F hvm_hap_nested_page_fault+0x1b8/0x5d2
  (XEN)    [<ffff82d0402ad7de>] F svm_vmexit_handler+0xbe9/0x18b3
  (XEN)    [<ffff82d040202542>] F svm_asm_do_resume+0x162/0x172
  (XEN)
  (XEN) Pagetable walk from 000000000000fff8:
  (XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 14:
  (XEN) FATAL PAGE FAULT
  (XEN) [error_code=0000]
  (XEN) Faulting linear address: 000000000000fff8
  (XEN) ****************************************

In this case, the guest's LDT obviously has a base of 0 and limit of 0xffff
for the segmentation checks to pass and a memory access to be attempted.

Fixes: 8af337dfb8e2 ("x86/entry: Use POP_GPRS and remove RESTORE_ALL")
Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/x86_64/asm-offsets.c | 1 +
 xen/arch/x86/x86_64/entry.S       | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 9d4536402661..baf266ab8013 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -64,6 +64,7 @@ void __dummy__(void)
     DEFINE(sym, offsetof(struct cpu_user_regs, mem) -                   \
                 offsetof(struct cpu_user_regs, error_code) __VA_ARGS__)
 
+    OFFSET_EF(EFRAME_error_code,      error_code);
     OFFSET_EF(EFRAME_entry_vector,    entry_vector);
     OFFSET_EF(EFRAME_rip,             rip);
     OFFSET_EF(EFRAME_cs,              cs);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 22729b1f43b8..59953c9f525a 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -765,7 +765,9 @@ UNLIKELY_END(exit_cr3)
          * scf and ver_sel above eflags, as we can't use any GPRs,
          * and we're at a random place on the stack, not in a CPUFINFO block.
          */
-        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
+        SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */ \
+            scf=STK_REL(EFRAME_shadow_scf, EFRAME_error_code),                      \
+            sel=STK_REL(EFRAME_shadow_sel, EFRAME_error_code)
 
         add     $8, %rsp        /* Pop ev/ec off the stack */
         iretq

base-commit: 1cc1f4d7a0471f3bf9126ee7b1956db66ee28b58
-- 
2.39.5


