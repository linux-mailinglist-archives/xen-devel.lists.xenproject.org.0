Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLG5LPUBq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14B224F96
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247974.1546335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7X-0003Yc-7v; Fri, 06 Mar 2026 16:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247974.1546335; Fri, 06 Mar 2026 16:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7X-0003Uq-4Z; Fri, 06 Mar 2026 16:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1247974;
 Fri, 06 Mar 2026 16:33:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7V-00030j-JG
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:45 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e69eeb1-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:45 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439b94a19fdso5418564f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:45 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:43 -0800 (PST)
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
X-Inumbo-ID: 3e69eeb1-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814824; x=1773419624; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD32rUw8Jt+xF61vzNKRB9KoWMugslbXmkZ8IwQfvzs=;
        b=AcobrcEieugq1Opq15cYORGuZWYpQRlUUanh6S9bd9m7IQuTf3JBvT/A1BcS8/d0UG
         LsQ840KeUc8EH3HbxheP7Ranx1Z8ZBAcv3SVvkBuUOiHkhDfyEZpQ5MOOWHeUx467gfL
         Ssy4LnUH8FUFFTXe1kAkGF987gdkzhXSCHc9nSXIG6rdKaqgIeG89EtGa/QT0fvARKAu
         /mp+RLcaOZnZ32HLd5AWub44OmWQI0hh7KQk6Kxotsks8WP/hyLDNLv6PMQwwHRI3MrF
         0b4+Shab+PFqd8r+weFfgxuvQD1b+HJonySHMHm+xaP34nMEvCmr42h1o9F9PNYvVZSa
         QN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814824; x=1773419624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TD32rUw8Jt+xF61vzNKRB9KoWMugslbXmkZ8IwQfvzs=;
        b=t9+uvUPfJz0syFDs6yURlCt1my9su2XYm/s8lAk8bxn8aLO3FmQVZVU4pM7Jwl1qGf
         yUmCEbcEINQkZlNiFURGBOlOIt3i4usrq/iUw94WkBLHX62CkNkuRLwOn5renUW99/RI
         Sn0CPsxkMceaHUkZf3ub5Beo/Q7xbOIMD3g5lWVgMDVreC2+5hmPbMz3YWvNA0WZkbt3
         mX7VvCuNUjOBqgOHNzoKtMXLvgNEC79C/YXF4rzGojDyx8TNqFKPJHT9d2viV2xjECTJ
         tEfo3Ov0EBbIzbi/fb8mA1T/IA0ByXatxyAxdLGWmstbkvB8oXV3m+kEQFR7gtTJWxOP
         EHvg==
X-Gm-Message-State: AOJu0Yzametw9tZhZ0tfS3i8PJNe7ae/k4HNTueaxYidIfjr7tko0qMA
	992j97dDp06QKJRdt+TOcYuMGa+AoUpa+JZaDLsMrAGLcarcuTbTKDeA6L8VDw==
X-Gm-Gg: ATEYQzzC4PDOAC6sW3zUr0Q/YLY7hhMssIH4oM88K7ljfdtXUb3jk3906nrRh4auV1l
	RjfnM9HSkh52B5AYfCmumNbtvgoNzU1YXKOCF3NKfrIW7rLwwv2Tturv8NFdiLQgETxApk27mMb
	uO44lkOmk4dOXACDNMKcbDP0NKFRcF1lsUXJ5v401Z266mmWiYKQMzuclBoFX5xIm4qflrhESHz
	+EmJqF5+9pU1b45avDxQwtAtGfj4S+t8Xdf66jtEWaLz1j2N1d2MGhsDGcay5tdAbOAYTdkN1E9
	xv7IHFt8LGCiQqYeDxUhlsaNhpqbM7Yxk4KSCWgNV23NkqJvlkkXDJDZgmLJks+GOo1p8Py/6QY
	Bu3YwT1bvFAz3UISJ36n5zohXh3diKGYsd8E5zaZOYhhAVh61WSTlQJsBYdH+yWfmvrVWzxSTug
	oVMdfwWwVsbc/GUjWa0tR7va9qow1aoztWGvX2P9amqTlj5Pa4ur+DjyItBpPNa664xw==
X-Received: by 2002:a05:6000:1865:b0:439:cba2:2294 with SMTP id ffacd0b85a97d-439da88bc2dmr4437064f8f.37.1772814824070;
        Fri, 06 Mar 2026 08:33:44 -0800 (PST)
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
Subject: [PATCH v7 04/14] xen/riscv: introduce tracking of pending vCPU interrupts, part 2
Date: Fri,  6 Mar 2026 17:33:21 +0100
Message-ID: <9fe4e79428719cbf49442af0ab948e398861f27f.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5E14B224F96
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v7:
 - Rename argument v of vcpu_flush_interrupts() to curr.
 - Add ASSERT(curr == current) to be sure that this functions is called only
   for current vCPU as the whole vcpu_flush_interrupts() implemented to work 
   with current (at the moment, at least).
 - Drop vcpu_update_hvip() function and open code it in vcpu_flush_interrupt()
   as there is no more update of hvip unconditionally and hviph will be
   updated separately. (originally it was planned to update unconditionally
   both hvip and hviph inside vcpu_update_hvip() after if() conditions in
   vcpu_flush_interrupt())
---
Changes in v6:
 - Nothing changed. Only rebase.
---
Changes in v5:
 - Reorder the defintions of local variables (mask, val, hvip) in
   vcpu_flush_interrupts(). Also, drop a blank line between them.
 - Move #ifdef CONFIG_RISCV_32 above the comment in vcpu_flush_interrupts()
   and align the comment properly.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
 xen/arch/riscv/domain.c             | 27 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/traps.c              |  2 ++
 3 files changed, 30 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 5447c17402dd..f3e3ad149453 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -231,6 +231,33 @@ void vcpu_sync_interrupts(struct vcpu *curr)
     }
 }
 
+void vcpu_flush_interrupts(struct vcpu *curr)
+{
+    ASSERT(curr == current);
+
+    if ( ACCESS_ONCE(curr->arch.irqs_pending_mask[0]) )
+    {
+        unsigned long mask = xchg(&curr->arch.irqs_pending_mask[0], 0UL);
+        unsigned long val = ACCESS_ONCE(curr->arch.irqs_pending[0]) & mask;
+        register_t *hvip = &curr->arch.hvip;
+
+        *hvip &= ~mask;
+        *hvip |= val;
+
+        csr_write(CSR_HVIP, *hvip);
+    }
+
+#ifdef CONFIG_RISCV_32
+    /*
+     * Flush AIA high interrupts.
+     *
+     * It is necessary to do only for CONFIG_RISCV_32 which isn't
+     * supported now.
+     */
+#   error "Update v->arch.hviph"
+#endif
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 1ecfe18c8519..59d23e4f9247 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -115,6 +115,7 @@ int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
 int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 
 void vcpu_sync_interrupts(struct vcpu *curr);
+void vcpu_flush_interrupts(struct vcpu *curr);
 
 #endif /* ASM__RISCV__DOMAIN_H */
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 551f886e3a69..244264c92a79 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -175,6 +175,8 @@ static void check_for_pcpu_work(void)
 
     vcpu_sync_interrupts(curr);
 
+    vcpu_flush_interrupts(curr);
+
     p2m_handle_vmenter();
 }
 
-- 
2.53.0


