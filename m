Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAQDGOQzoGnwggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1861A55D3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241461.1542567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu8-0008UY-QD; Thu, 26 Feb 2026 11:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241461.1542567; Thu, 26 Feb 2026 11:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu8-0008PN-Jw; Thu, 26 Feb 2026 11:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1241461;
 Thu, 26 Feb 2026 11:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZu6-0006EH-Lf
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:38 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 809db19b-1309-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 12:51:36 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso6970295e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:36 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:34 -0800 (PST)
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
X-Inumbo-ID: 809db19b-1309-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106695; x=1772711495; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFgnfk1X0S+A5onGN+L4+G0+AM9Sn3RDBBYOWw2WVMo=;
        b=E3Kss6Zcnvblsyc1uOLtnoUHP+UPPmrBBdBsmyu5D4CKbFJr2M2SuviLhWOGz7VLKI
         MuL4a5UTYRjKNMsyFVvkS4J7bfDT3rF3lWkC8IohZIMbdsiNOzKEC1A/i1R+PZwGwC8O
         D+k4NaZUxiYnPbyG1gpyVkvgSA9l65JfUfQBnmNETolPpHfzCHDmpoukB6aWg4X4a8yF
         lAQDLNESI9oxDtavYCFrpB9Wq85ammFkP6ot76E0+yElZAxUXxSb0dlz7UNkspfr1EqZ
         obU+F7vT1ASxuKT4cNaUhaxXwWxjZbyWRsb7/fy+920e3XtemUFcuLaSlkYUatC7f1m1
         uQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106695; x=1772711495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MFgnfk1X0S+A5onGN+L4+G0+AM9Sn3RDBBYOWw2WVMo=;
        b=vc/upuElljvEiQcXxbfZs7jsEfG8uFPttFXVlT+xxVglo53ZKSTyiBsnA9ml23txGO
         Tl00GRnqDnFV7i2H9mlJUvQNRSbhPrLPbpSSoZmdqFglRWdK5uzlueqvL6dBff/wXR/B
         d7kzQ2dNpTDzHvrgPYJ7qUcrHwxqhnJUwFA4hPfNNvWuqh0uxISdyfe0gRYVh0ESZ3le
         JXPsBVERalIeLNXu+/y/Y16IFVHS1R3bJSp/GpjJGsnUgLR/SlgM8SGN7wLKV8fj60O4
         IMQXB9dapkjHj7QCX1Lf+g/PqWSrVfp3QRq6LakYpBh68jOC7+nvGn3SomlcgdPxOSQI
         8Sxw==
X-Gm-Message-State: AOJu0YxR6/7SLOwbDhmtwLcuqJzl+CswIVkgMucmYaQ9Hs/Ko3hmk4OC
	K8w9o/V/OIR/gVfhUu3dR2I3i50+2C4WWvNLd+wy6rt4yTBfR+8cKEKeWbkwjg==
X-Gm-Gg: ATEYQzxEm9v0NL8Cn0kZt/UiaSyuaQCaBPp46Y37SEuoFtmMutCmtXww/s/px8SO74E
	CdBvW7kYm8GL9EnCsMti/glvTrBNn+jWaKu7TKzJtoxTcuvDvSU1yPU4sotUwnkQC0tWCwUTTsO
	rL293MwxeULZbyTi3+8HjlYldOSJVbRoYdhkpgipX163rIchNa14X4PhmDTJNPLJevFuUodtnnN
	o7DRvHIWABVMEIeBflA42aVzrQFIXoMWtKXWXNBUBTj+8n+qNMOzg5Rg9GQck3dMEideYyBUojq
	JtmM7/3E9591vFSxAHozOqHRNrvNYe4VkbohUDCuCCDSH5PyNiRGxHSaujJo/qZ0Lmu3a04FErZ
	x+0wak8MOdfbOUhgLAWMmspxMAchDcgphuWbF3Ws21BCimnRx+rcINXgWv0etXiK86JIauq6wX/
	jP7CiYWQeToYVnPstPXzcQJCSYgM/2BsV40q39nVnMOxouZEdluYFMgQGlOFxj98evpQZEHWPDq
	PME
X-Received: by 2002:a05:600c:8b88:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-483a963d64bmr300451115e9.30.1772106695186;
        Thu, 26 Feb 2026 03:51:35 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 08/14] xen/riscv: add vtimer context switch helpers
Date: Thu, 26 Feb 2026 12:51:08 +0100
Message-ID: <36e4259c18bc09e47628e535401f97d518c0d0e4.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0F1861A55D3
X-Rspamd-Action: no action

Introduce vtimer_ctxt_switch_from() and vtimer_ctxt_switch_to() to handle
virtual timer state across vCPU context switches.

At present, vtimer_ctxt_switch_from() is a no-op because the RISC-V SSTC
extension, which provides a virtualization-aware timer, is not yet
supported. Xen therefore relies the virtual (SBI-based) timer.

The virtual timer uses Xen's internal timer infrastructure and must be
associated with the pCPU on which the vCPU is currently running so that
timer events can be delivered efficiently. As a result, vtimer_ctxt_switch_to()
migrates the timer to the target pCPU when a vCPU is scheduled in.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v6:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - s/vtimer_ctx_switch_to/vtimer_ctxt_switch_to
 - s/vtimer_ctx_switch_from/vtimer_ctxt_switch_from
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Align the parameters names for  vtimer_ctx_switch_from() and vtimer_ctx_switch_to() in
   declarations to match the ones in the defintions to make Misra happy.
 - s/vtimer_save/vtimer_ctx_switch_from.
 - s/vtimer_restore/vtimer_ctx_switch_to.
 - Update the commit message.
---
 xen/arch/riscv/include/asm/vtimer.h |  3 +++
 xen/arch/riscv/vtimer.c             | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
index 111863610a92..b4d48d1a1732 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -14,4 +14,7 @@ void vcpu_timer_destroy(struct vcpu *v);
 
 void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
 
+void vtimer_ctxt_switch_from(struct vcpu *p);
+void vtimer_ctxt_switch_to(struct vcpu *n);
+
 #endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index 32d142bcdfcd..afd8a53a7387 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/sched.h>
 #include <xen/timer.h>
 
@@ -69,3 +70,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
     migrate_timer(&t->timer, smp_processor_id());
     set_timer(&t->timer, expires);
 }
+
+void vtimer_ctxt_switch_from(struct vcpu *p)
+{
+    ASSERT(!is_idle_vcpu(p));
+
+    /* Nothing to do at the moment as SSTC isn't supported now. */
+}
+
+void vtimer_ctxt_switch_to(struct vcpu *n)
+{
+    ASSERT(!is_idle_vcpu(n));
+
+    migrate_timer(&n->arch.vtimer.timer, n->processor);
+}
-- 
2.53.0


