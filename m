Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dVsqAOIzoGnyggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79911A55A2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241456.1542527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu2-0007Q8-Gg; Thu, 26 Feb 2026 11:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241456.1542527; Thu, 26 Feb 2026 11:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu2-0007Kh-CD; Thu, 26 Feb 2026 11:51:34 +0000
Received: by outflank-mailman (input) for mailman id 1241456;
 Thu, 26 Feb 2026 11:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZu0-0006E8-Mf
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:32 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd91581-1309-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 12:51:29 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so9650385e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:29 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:28 -0800 (PST)
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
X-Inumbo-ID: 7cd91581-1309-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106689; x=1772711489; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33kKmz90cEezZ0SKbWH5QuCoRKJPXKUuazyZn8mlTZE=;
        b=XEGGpl0sBwW93wLua95wUwjmqlZS6NVG6Ultc/synH70ofdyRA31yeJS90QDCSW0K2
         GF11xwcRaN6N7QcQFZTu+EF5/VZ5fqwJl1ad1K7YLCm2mHP2EmTFbdepepEJhrROHpJr
         VMXqRePfXWtTZDWVL9xYxU0YBjHhg86s1sc8Bbe3NvW9p9gaTgP9jslxS2xM1wkc1uVq
         u7BcxqlQa+B/QkbhPLdMP8iozGRRkGYSmT/Pg1ZEAddUbVvWYfDdFqdkqX5sMOEDL4xa
         OUXBnuBKQ93QWMVi1t6qKm+2nqQpKlyNTAuoBnQghoWrM+XlAu76vMD7/TuzvCouPVr/
         tjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106689; x=1772711489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=33kKmz90cEezZ0SKbWH5QuCoRKJPXKUuazyZn8mlTZE=;
        b=OoFmymOd3WJyz+ZiJp5tPpWlPb9sA3HpHySwEGIAr5gN3buDPLpbamtMDxjE4ISIZB
         q5V+fNb/qVNj2MG30GjTOL1qiD5A/zptvyQc0MGstJmR6dvUzZ3i75JBhBR4lGNm1x9o
         LhiR+JVmWWSC48jvHSg/12qJY4t9+6zGq/6IH+QJjYJfRSSRMcxiXe4uK2xCQ4sHLuwR
         xlN80MVHqgiffPdJX3/45brD8TCBwvubfxv2xYR2S89LMEKi8IpsrfKSfdmpdEL3feha
         Ld57RSWQmPOiMmLAkw6Eci2fEEtMrVbl8Z1a4K9GjjZ3Ya+p2Ru9DCz5BXqyln6guSg4
         0zhA==
X-Gm-Message-State: AOJu0Yy4kYMeU8knqexZ9lBI8yt3fjRehjChiQJTGhb2f/GtnFKWfGxi
	KwTQHkFRtB3hT0/z3y7ikBy67w5q6fH8Ix4H41WNxNC+bddgeN5CG+fvMH7FBA==
X-Gm-Gg: ATEYQzzAW1Kw721AmNj9JSA0TjL2F8q1rzilRctwL/2CReJt//mCs3nwZeBiduhyc7Y
	blvkfLfa8KYqAO6qx29E9Eg7904ehRxovFvS/JtZpg3YhgjNg28XHx7R42VsDdT6H4zQPBV3kKc
	AtMZb7E2r9oIPxIt5AhvLQ2vfF/vVZESwb5KtbzgLpL3MoTW6fKQunGN0sXVMB/0o59KCeckNu5
	h4oQzL+XxDIVMaDpyh1mGMiFuc9Qckp0LjeOCKRYO3mZwGYY6EPgQ/xThSKzSelD8XqunDeDeRR
	eScEyNGFYVhm+w8f4PPlDt62KSplIvW+yV/RNos/+qLRTeEb4HIs+wuk3s/HnKigYzOgVSE+ViN
	o4ZtGzghEUAxQHKTHkFcTq2uw5ZRCiHpAllyDEEGn4covrXFKLBjUkLk9A/uku1c2+cR2tGGePn
	QGvcAsBw0lr6WCQA2z08s1/BiiN/dBCSVUmpL7U37FWO+0EYavU5QgvS5DaTzTg1r1Ww==
X-Received: by 2002:a05:600c:470f:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-483a95a852cmr341721945e9.4.1772106688743;
        Thu, 26 Feb 2026 03:51:28 -0800 (PST)
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
Subject: [PATCH v6 04/14] xen/riscv: introduce tracking of pending vCPU interrupts, part 2
Date: Thu, 26 Feb 2026 12:51:04 +0100
Message-ID: <07a3750bf152f31ef8013194536f199ac3540dcf.1772016457.git.oleksii.kurochko@gmail.com>
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
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A79911A55A2
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
 xen/arch/riscv/domain.c             | 30 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/traps.c              |  2 ++
 3 files changed, 33 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 047dbebc1a09..6988d7032059 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -229,6 +229,36 @@ void vcpu_sync_interrupts(struct vcpu *v)
 #endif
 }
 
+static void vcpu_update_hvip(const struct vcpu *v)
+{
+    csr_write(CSR_HVIP, v->arch.hvip);
+}
+
+void vcpu_flush_interrupts(struct vcpu *v)
+{
+    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
+    {
+        unsigned long mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
+        unsigned long val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
+        register_t *hvip = &v->arch.hvip;
+
+        *hvip &= ~mask;
+        *hvip |= val;
+
+        vcpu_update_hvip(v);
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
index e19365c6fb77..5373a498d80b 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -115,6 +115,7 @@ int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
 int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 
 void vcpu_sync_interrupts(struct vcpu *v);
+void vcpu_flush_interrupts(struct vcpu *v);
 
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


