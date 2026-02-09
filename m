Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD5QOPoQimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FD112B69
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225789.1532408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVD-0000Kg-Qd; Mon, 09 Feb 2026 16:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225789.1532408; Mon, 09 Feb 2026 16:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVD-0000IA-Ma; Mon, 09 Feb 2026 16:52:47 +0000
Received: by outflank-mailman (input) for mailman id 1225789;
 Mon, 09 Feb 2026 16:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVB-0007Zo-RU
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:45 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1bcfd39-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:45 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b8871718b05so750097466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:45 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:43 -0800 (PST)
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
X-Inumbo-ID: c1bcfd39-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655964; x=1771260764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3eDIzczLgQjn9FFXjHOFuYc8YqhLVGUUTFDMX/MKvY=;
        b=F73EzOUl3QVOu6ZynsmuNdlkdZCBZ5WDsmxfdMhr/PMW++kfraRBFEfNaDN33N20tJ
         sD2xgLA2pRnyz6x1PaRmb4aBo/YilpbLFkQo5fdhkZqgmMyjw9NWupP2cckch8LaLRGV
         8aOUOUjR6Uk3D/yNsBNuL/ljUwRCZmJB63qlHxPJe6vRRiAUvp+16TmkZXByYQvI8UFr
         HHYX/EO7ePtBRCwCT5BLsQTCaQc0IljUDOFCEtq8zCIe6FZ0rdqinqe7d159V48NpSNl
         J3Bra+JzIMMUSAL4zlIaiFBJu2fdGVBq0BA8XOZd7OrK4WWWtEbfAc8cY6gkYtilKI+d
         e1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655964; x=1771260764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3eDIzczLgQjn9FFXjHOFuYc8YqhLVGUUTFDMX/MKvY=;
        b=ON2ZK2z/VvEE1/z6FM3hMMvJ6dO807Ja1Xn4CRY4ics1ZOPkQwYsB+zWg/EGhb8HzE
         WiJujV/pAjfJQJc9SNEr9LRRwwuJ125kJ8+bQ4CPWSLiL7F/eo4UrfErd3sFZNAKVol9
         etNBDjgStP68wVrx5Co0tksIfx5np+YDp/TYsr8hBod566W9YGXGpsFsEZ201qebH6LO
         z6IxWjqUslawdakK988NmKXhz1IZbt5bEbzrmCiWem1SigxDBUFyTj/Ak4jafYso4bja
         5EW8M89MqWGltqPsW3gUJroKmINviC39UsrXxxq4VDbg83H6eaNi1xTPy4kwcRmTIakL
         cRug==
X-Gm-Message-State: AOJu0YxszFQ04loNBQit7bPERO1XV+hhKKT0beCTFC/avtfX5q68WxAz
	BWsRf7D/Led18G9D50AqOg5NBG834K2fLs09ArEkIq+nuT49WshJ7pNO8J1SBPmg
X-Gm-Gg: AZuq6aJlwpxdmqfA+LZHNEHfoyAUe3ERkzZgzpsZuQ+zojHfiw7aB+LsWDBkFoNOm6I
	wcB0U4q63NRvYKK3QPPTTnlAS8ngPidfMg4FVSxSIOCoCQvwr6JiDFawftI+3eU2SlsNlzc6JQH
	CEVaeSV+L1PEcsgf2pBw4K7FtBNOuh3qgg1jc2TuVR8+6a133O9bwxyUWX3vdwX3UT082O3ot2T
	M6DZQLGKLj8UjDYro8FOCV3GzNEvqMGG2vM1gSpqK4NN1ZxzZR/kX/o6DXagZF8mB1MmvSj/s/W
	NlAGpUvTpEQ9k0uf/g5mRL1PkUEg8rUo1TDxnZIrJc+AKb7+hgtWZvpSVc6kPEIIymKHT5qswp4
	I7YagQ/2y07Euvn7DEfAIpCzMZmF8xm/SleTNGkBemgZZp+hVqPCoaYQGUkQBV80KKf8DDAE9bi
	VQcGfAX3UmAkK34gksFsd7tcgaPr1PcX0vnfhg8h+a5iQY8mW4NuDmpA==
X-Received: by 2002:a17:907:1c9e:b0:b87:bb45:bd5c with SMTP id a640c23a62f3a-b8edf42c682mr810413966b.58.1770655964157;
        Mon, 09 Feb 2026 08:52:44 -0800 (PST)
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
Subject: [PATCH v3 06/16] xen/riscv: introduce tracking of pending vCPU interrupts, part 2
Date: Mon,  9 Feb 2026 17:52:19 +0100
Message-ID: <a81d2873c901c825a08f817d962a8cef09167447.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 988FD112B69
X-Rspamd-Action: no action

This patch is based on Linux kernel 6.16.0.

Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
interrupt tracking introduced in part 1 (for producers). According, to the
design only one consumer is possible, and it is vCPU itself.
vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
to the lack of functionality) before the hypervisor returns control to the
guest.

Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
irqs_pending_mask is performed only by the consumer via xchg() (with aquire &
release semantics). The consumer must not write to irqs_pending and must not
act on bits that are not set in the mask. Otherwise, extra synchronization
should be provided.
The worst thing which could happen with such approach is that a new pending
bit will be set to irqs_pending bitmap during update of hvip variable in
vcpu_flush_interrupt() but it isn't problem as the new pending bit won't
be lost and just be proceded during the next flush.

As AIA specs introduced hviph register which would want to be updated when
guest related AIA code vcpu_update_hvip() is introduced instead of just
open-code it in vcpu_flush_interrupts().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/domain.c             | 33 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/traps.c              |  2 ++
 3 files changed, 36 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 4513f778cdc4..67437912605a 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -194,3 +194,36 @@ void vcpu_sync_interrupts(struct vcpu *v)
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
+    register_t *hvip = &v->arch.hvip;
+
+    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
+    {
+        unsigned long mask, val;
+
+        mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
+        val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
+
+        *hvip &= ~mask;
+        *hvip |= val;
+
+        /*
+         * Flush AIA high interrupts.
+         *
+         * It is necessary to do only for CONFIG_RISCV_32 which isn't
+         * supported now.
+         */
+#ifdef CONFIG_RISCV_32
+        #   error "Update v->arch.hviph"
+#endif
+
+        vcpu_update_hvip(v);
+    }
+}
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 8d9432ec5a8b..de5aecb862b5 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -115,6 +115,7 @@ int vcpu_set_interrupt(struct vcpu *v, unsigned int irq);
 int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq);
 
 void vcpu_sync_interrupts(struct vcpu *v);
+void vcpu_flush_interrupts(struct vcpu *v);
 
 #endif /* ASM__RISCV__DOMAIN_H */
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 82e1dc59cdea..676a2da55811 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -172,6 +172,8 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
 static void check_for_pcpu_work(void)
 {
     vcpu_sync_interrupts(current);
+
+    vcpu_flush_interrupts(current);
 }
 
 void do_trap(struct cpu_user_regs *cpu_regs)
-- 
2.52.0


