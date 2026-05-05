Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCigDcet+Wky+wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:43:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AA4C8CBC
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300339.1574862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBNG-0003vh-9Q; Tue, 05 May 2026 08:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300339.1574862; Tue, 05 May 2026 08:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBNG-0003ui-5t; Tue, 05 May 2026 08:43:26 +0000
Received: by outflank-mailman (input) for mailman id 1300339;
 Tue, 05 May 2026 08:43:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wKBNE-0003uc-RJ
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:43:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKBNE-004B1V-2D
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:43:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f9ada4-e002-0a2a0a5209dd-0a2a4508d7cc-16
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:43:23 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f9adab-63b5-0a2a45080019-d1558032cd22-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:43:23 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso43993305e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 01:43:23 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45055f2203csm3129448f8f.37.2026.05.05.01.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 01:43:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1777970603; x=1778575403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCEstcyqOgvtQBuu40Qq5pjD4taxfu2oU876lLvB0OE=;
        b=O7MuPv5ywFaS6KH9WSESkFehRLWy6B9+gIpsaydnGbbTojURYTp9596W6SETPnHHDz
         oyLL8vqEW0k2gSZx0gKLEhhnxfiwfMsWARCQPdxm+/8T8JA7DD57jAD9UOeNpM/dndbP
         e6AicyysjRqMfwEQwkaGTKgUbhfB4jiYMtqcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777970603; x=1778575403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCEstcyqOgvtQBuu40Qq5pjD4taxfu2oU876lLvB0OE=;
        b=WDEvq4/XLd3Fl/7NJV+g6kNq/q7CAK9SH0swDKiCJwjgsjeRLnNOGxL8xyajej+JAs
         U9XyDmofqzjfw502znTDx+YRS7v9aasLEfL4G64jEdXR41ZIFbzjbrllHV7pNbnnAIyy
         v3h9roAd87M8yfV5U7AFrUrVPrbWNAj/8e2CfBwM/pg9gup710a5aHr+cR328yMmxL1+
         aYzQnsfWCHw4S5lQepWSdEN4TPCL2iATXNNoqQP+wb643Fuk7ZeToVCJK/03i3j0emyi
         jo42ySDczSLHgI6svY9g4hHGmzl7jkMokl1kCSwjf8VZL6feUL3nfzQSgtfm4GuNW9Jm
         zICQ==
X-Gm-Message-State: AOJu0YxLOY/JV/raBEoYSADQ7iTlxUWUvwFtbgRB7EkSqOnKlnlC4m8q
	5oE4WQUcH4RDaFMUEFtKQRbid+9ShvPXdYjCfRmEkhCW/uCJFkbxCd3XoG5gw08YRlnswvHJ53m
	7S2Qp
X-Gm-Gg: AeBDieuxBWcX4250x5Ed+HG0sIP0EJ+I21wMCo/UwXK03lugmcJcYSGwKc++4SuWP/n
	7pwkrG7+AZa08jZqWyD1zX4zwbAgR4s3oDxRxmDmpB+rl8lyGgRB93fqsVKuM68Em221X8J4hJH
	M0HEJSn/U73mQ/irw3s/PoyIFdNZyryaxxA0VgctEsNrQvRPkpLKq7Nri+ilyXdnTB22We16Z2t
	jIM+vjXTIAiXZc6gfOwwB0EYl9y9NeezKpjjPonHqiFD0JcSZEoay2Ji6IdBNxMw5MM4oM5WffY
	mCLCoEpYanuecnyYaAPpjqkmO4uv/YO4ofrZOq6A/cGQLS9zkv9alurB152LvX5820hL/99yBa1
	oNvn9HAcuymjHtm36OvcGJQosQXqQo27UDG7t14prkcJaUAmccfP2goyBq0Xv+kRsLB7W7XjNo3
	cswCjZmHFjov117uMpN9Mnapc7zhbKLOCUZYJB1qK74EvazVPtlNsuiTTbmSMbIhbjRVEP2yA2q
	SHQjuLhNbLsL1poDIjXsywJJw==
X-Received: by 2002:a05:600d:8496:20b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48d18be5b3emr19816295e9.16.1777970602835;
        Tue, 05 May 2026 01:43:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/boot: Disable interrupts when establishing SSP
Date: Tue,  5 May 2026 09:43:15 +0100
Message-Id: <20260505084315.1350002-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777970603-C86D4DB1-ECDD6CBA/0/0
X-purgate-type: clean
X-purgate-size: 3366
X-Rspamd-Queue-Id: 801AA4C8CBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Gitlab CI reported a crash on boot on Alder Lake hardware.  The bug is years
old, making it an incredibly rare occurance:

  (XEN) *** DOUBLE FAULT ***
  (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
  (XEN) CPU:    0
  (XEN) RIP:    e008:[<ffff82d04077bbc4>] arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160
  (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
  (XEN) rax: 0000000000000007   rbx: ffff83049a4b0000   rcx: 00000000000006a2
  (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
  (XEN) rbp: ffff83049a4b7f00   rsp: ffff83049a4b7ef8   r8:  ffff830497e47000
  (XEN) r9:  00000000ffffffff   r10: 00000000900c2121   r11: 000000009a392956
  (XEN) r12: ffff830497e47000   r13: ffff830497e49f40   r14: 0000000000000000
  (XEN) r15: ffff82d0407dad10   cr0: 0000000080050033   cr4: 0000000000f526e0
  (XEN) cr3: 0000000043c16000   cr2: fffffffffffffffc
  (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
  (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
  (XEN) Xen code around <ffff82d04077bbc4> (arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160):
  (XEN)  00 b9 a2 06 00 00 0f 30 <80> 3d 71 26 f1 ff 00 74 3e 48 8d 93 f8 5f 00 00
  (XEN) Valid stack range: ffff83049a4b6000-ffff83049a4b8000, sp=ffff83049a4b7ef8, tss.rsp0=ffff83049a4b7fb0
  (XEN) No stack overflow detected. Skipping stack trace.
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) DOUBLE FAULT -- system shutdown
  (XEN) ****************************************

This is on the instruction boundary after enabling CET (writing MSR_S_CET) and
prior to establishing SSP.  Despite identifying this as a critical window
where any fault was deadly (the CPU tries to push a shadow stack frame at 0,
hence the CR2 value wrapping around to the top of the address space), I
clearly forgot that this meant interrupts too, which are enabled.

Disable interrupts during the critical period.

Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

v2:
 * Only disable regular interrupts.  NMIs are fine.
---
 xen/arch/x86/setup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d041cbd5f6f1..19ee857abfb8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -908,6 +908,13 @@ static void __init noreturn reinit_bsp_stack(void)
 
     if ( cpu_has_xen_shstk )
     {
+        /*
+         * Immediately after enabling CET, SSP is 0 and most interrupts and
+         * exceptions are fatal.  Like the SYSCALL/SYSENTER gaps, IST vectors
+         * (including NMI and #MC) are safe owing to IST switching the shstk.
+         */
+        local_irq_disable();
+
         wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
 
         /*
@@ -932,6 +939,8 @@ static void __init noreturn reinit_bsp_stack(void)
         }
         else
             asm volatile ( "setssbsy" ::: "memory" );
+
+        local_irq_enable();
     }
 
     reset_stack_and_jump(init_done);

base-commit: f4af571dd70bea97d8de82d7aa39c62c530db897
-- 
2.39.5


