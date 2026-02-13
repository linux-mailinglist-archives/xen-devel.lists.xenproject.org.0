Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ+hBHNRj2kJQQEAu9opvQ:T2
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E113804D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231315.1536541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2i-0006q4-RQ; Fri, 13 Feb 2026 16:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231315.1536541; Fri, 13 Feb 2026 16:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2i-0006ks-L5; Fri, 13 Feb 2026 16:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1231315;
 Fri, 13 Feb 2026 16:29:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2g-0005Ws-9f
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 244823da-08f9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 17:29:17 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483487335c2so10283795e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:17 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:16 -0800 (PST)
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
X-Inumbo-ID: 244823da-08f9-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000157; x=1771604957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8aUJGUOJbQQ949TKJQepHTgKcmZAnEVr+LIZcPPPBc=;
        b=KkL7LK5dQ5g8FSkC6xwQI1ZqKu2evG06cl65FD/eGd6huINpxEtHMABnYwejVV5bFM
         PedOhtEbYOkEzcsCDtQyaoiNQrH+zsoA3C/8Xc/H5Z8BphJbswnezVQ1NXHsYTTwWZby
         vIFXVCjl6sWHkASFas1x2urQQTIoIB/VFhUt15uRbR1jkwhD3DjgiesWjVf81LVMt7Sn
         og6kA8D0bGSuMjdCAGJXkUYtrOvt9WXy91CgYLm7hPuNS3Gi6Z7KMLzXgKQJNhYgSn0c
         RMDsITiMTlPgY0S5zc6w7GNQ018qw+FvDjf4y897LEJi+j8L0l+uhTr8lVNkwWmczUVs
         xeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000157; x=1771604957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8aUJGUOJbQQ949TKJQepHTgKcmZAnEVr+LIZcPPPBc=;
        b=g2U541nKNuUhbGzKFTRkvkUbc7W7ZgPf/tbKWIA1bZF6pycmUnSSDIox34ztqcbYOK
         uxsx545SPZdH8IMKuX2pFKcTlLY2uBJ45bATrld+gtzbeg7GCBwT5Ie67x+Ix1jxxIgg
         yuunn7bcE4tXGK3VxhrjZJ5gGxPnX9t8RNpeeCljGm0ea+O/9NTkRv+qmA4BSyV+j2V5
         joZyAYg/ha+iGH6divNyDGySosxZdqCypxcVjvIk9eqia0jl9M+Y2bXfMkNWM9VeAW/n
         QVPQ2Eaz6L4FxPnwxKlgSAkrp0d55nr//Mt8fo6H60AfFUXBwhWJohXoKxdu+ojsIyu0
         Oxmg==
X-Gm-Message-State: AOJu0YwxanxZ8lSkDeaSiM4kV7Rnfc0BazuioEp6ZkmsTdIraNQJ7B2/
	acK6rKjt7GSiG0gjRiZYlwi4t2J5XOSMONeFQAeqt6Csk0bxbibDUw/7qvCH1mJS
X-Gm-Gg: AZuq6aIfnIZGLNvbGgGVzPQNDOOcw/nl8DBDgWPrfReGyab9lnHMs4a/SsvVLtXnb5q
	3xl1ighMHKS5I0SWK9pRH3PSIWlGfWJGo8LISFCovnLZYp4ju0zqabsiMS0Jow+34taVYm7Ud52
	4bGDWydH7vtsJuwEcWURzM7tzBk/aQgrvVki4H/naeXw+PhlJQdmhJA9aBjRUJkMp0uSSVeLgk1
	PzZkfpolEnFMpTQO9yZ+CrhxocpCctcsaC+I1hMnm7RnmqnQz/FTRQ667DANwKEgegESE2OUuza
	iFkcqwhtBaRr0eVpd43mZ0dJisFDysTXaOfcTjPLF0P9GQeAGlryA/0DWm6xEvm3osh1LKwy6Lu
	nOZ4raD2kggsjYMso1HF1M4dTwDvb1GOthyPrgUc/L16x9pfpDjqI9oX20+z4s8o/HGdqDKvv+g
	uZghj8uJv6HmISMAw5j26kWAtFowy1a15Sf0rgpcV5PCUN1Celvmw/UfFi2duDfSo/+Q==
X-Received: by 2002:a05:600c:19cc:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-483739fc385mr40414865e9.1.1771000156728;
        Fri, 13 Feb 2026 08:29:16 -0800 (PST)
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
Subject: [PATCH v4 06/16] xen/riscv: introduce tracking of pending vCPU interrupts, part 2
Date: Fri, 13 Feb 2026 17:28:52 +0100
Message-ID: <4e10c95d883c0d447b9e33a6d6a92e911aed6a23.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
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
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EB4E113804D
X-Rspamd-Action: no action

This patch is based on Linux kernel 6.16.0.

Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
interrupt tracking introduced in part 1 (for producers). According, to the
design only one consumer is possible, and it is vCPU itself.
vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
to the lack of functionality) before the hypervisor returns control to the
guest.

Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
irqs_pending_mask is performed only by the consumer via xchg() (with aquire
semantics). The consumer must not write to irqs_pending and must not act on
bits that are not set in the mask. Otherwise, extra synchronization should
be provided.
The worst thing which could happen with such approach is that a new pending
bit will be set to irqs_pending bitmap during update of hvip variable in
vcpu_flush_interrupt() but it isn't problem as the new pending bit won't
be lost and just be proceded during the next flush.

As AIA specs introduced hviph register which would want to be updated when
guest related AIA code vcpu_update_hvip() is introduced instead of just
open-code it in vcpu_flush_interrupts().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Move defintion of hvip local variable to narrower space in
   vcpu_flush_interrupts().
 - Use initializers for mask and val variables.
 - Use local variable c as an argument of vcpu_flush_interrupts() in
   check_for_pcpu_work().
---
Changes in v3:
 - Update the error message in case of RV32 from "hviph" to v->arch.hviph.
 - Make const argument of vcpu_update_hvip.
 - Move local variables mask and val inside if() in vcpu_flush_interrupts().
 - Call vcpu_flush_interrupts() in check_pcpu_work().
 - Move vcpu_update_hvip() inside if() in vcpu_flush_interrupts().
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/domain.c             | 31 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/traps.c              |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index edbac39a0b18..35d8d5db02d0 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -198,3 +198,34 @@ void vcpu_sync_interrupts(struct vcpu *v)
 #   error "Update v->arch.vsieh"
 #endif
 }
+
+static void vcpu_update_hvip(const struct vcpu *v)
+{
+    csr_write(CSR_HVIP, v->arch.hvip);
+}
+
+void vcpu_flush_interrupts(struct vcpu *v)
+{
+    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
+    {
+        register_t *hvip = &v->arch.hvip;
+
+        unsigned long mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
+        unsigned long val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
+
+        *hvip &= ~mask;
+        *hvip |= val;
+
+        vcpu_update_hvip(v);
+    }
+
+/*
+ * Flush AIA high interrupts.
+ *
+ * It is necessary to do only for CONFIG_RISCV_32 which isn't
+ * supported now.
+ */
+#ifdef CONFIG_RISCV_32
+#   error "Update v->arch.hviph"
+#endif
+}
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 2793f694d36f..5d25a884eea6 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -115,6 +115,7 @@ int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
 int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 
 void vcpu_sync_interrupts(struct vcpu *v);
+void vcpu_flush_interrupts(struct vcpu *v);
 
 #endif /* ASM__RISCV__DOMAIN_H */
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 366c3ff23e76..77738a01c8b5 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -174,6 +174,8 @@ static void check_for_pcpu_work(void)
     struct vcpu *c = current;
 
     vcpu_sync_interrupts(c);
+
+    vcpu_flush_interrupts(c);
 }
 
 void do_trap(struct cpu_user_regs *cpu_regs)
-- 
2.52.0


