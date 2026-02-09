Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONoKJPsQimnZGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F483112B76
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225787.1532382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVA-00082k-Ab; Mon, 09 Feb 2026 16:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225787.1532382; Mon, 09 Feb 2026 16:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVA-0007yY-4t; Mon, 09 Feb 2026 16:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1225787;
 Mon, 09 Feb 2026 16:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUV8-0007Zo-Sv
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfbf3b32-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:42 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b885e8c6727so487877666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:41 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:40 -0800 (PST)
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
X-Inumbo-ID: bfbf3b32-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655961; x=1771260761; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u33CKgrUFdgsGpUw8x9D4VJJRV1mttKFRSeG1+lahcw=;
        b=b8Nd+ojWbI8XN2n5eAKILcx6uqvdDJKfbggqnaTqo7ApKHvcDbPfx2MyFigUqmmyrz
         klTR7uMuoEO1VAEuiElllK/5ni1ezrnrhcwHsAnrqJSZZDVMFR2U+ZcM3Kwydhval5f9
         jH39wyueqqPpL+Hcypj4BXKsvIv2xOAsf7X2DqHw266UvUgNgHeI467n8cxpFeXPg6V0
         ieW1N46VeQGeq85Pn/AnW25N9w+bz3VvmfIt8kla9JvDvWPWxPCg5vuZ6SUJa1Kf7XHw
         ZYKhSZP04T1RNNWssE7e9YkkDzRbsZz1BDp6wn/dDNdZd71ZpVLNKFcSyveYaTkYpk9J
         tzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655961; x=1771260761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u33CKgrUFdgsGpUw8x9D4VJJRV1mttKFRSeG1+lahcw=;
        b=AL6bGU+kKig8Mp7A/f0MUlhCiACxa4D4nxRUoltnbeE88LMFCD07f9+n7QNr6zQvlK
         EFRNY67ji+ELWndFN9zjybm+7CDFS8Y9BtWbBvp6zXKWAoCJj5OmKdU/Z4IqKX4iOhUV
         b61UODt3LtBGhefi7f7O9RZ02lows/Vz24+0CPp44+e+Ru2UTaYNrSi40SPkU0BSASFC
         g104SLKqEDuH7UMOz0B9u1FZIjXWGeZ/Y+dokY7GZ4r1AL2/YiQqmNu+vYPBAwgpUXMv
         6FUEELhHKBC7DAJDHTixREZRHt3UtxRmXFgbTnz5DvYX0ymxjVqrw+PE6cQBcwiFP0CP
         ERVA==
X-Gm-Message-State: AOJu0Yxd7ZzaX8x62qo4qEieZiOHrd2s+BmwDRW0A2C9fREeZcq0i4Vi
	C5wuPBM9W+KLPskwCMVzsxTaBfb5wq3S2d7VqPh9TOpfHUPhdbIUOLe+j2UoUos+
X-Gm-Gg: AZuq6aIaRyiaxM+dYFVfmw3aWvSxJW59v7a+BMAslgI27eaB1/D0KqVwzGDc8cunb/W
	vt5n7mWlNvY6/HmALj7rzRjZobHpJsImfQjew1PLUzBLVlZgzZjzsUB1e7bDmO9fSVbnA+AybA3
	BPQIbpN8g82dX1lvceuswHTs67en2a/vKPYr64pf4N5x3IbdVcYTj1d0qxW2OnJj9+Mwpz8Fq2I
	+o7JPwqUhEF0oJMka6FpxWsG58Evaq3Wo1dUJ+sZCHAEQLLCCCscIdysLUMc0tLbnDECcwkIFRP
	rwFALI+5v0gm8zDvkZ9KFqRcxNltC5QgxHugZGyRDwcHSGwy6SERhr3yLwxTCDxyWk1zHJd83wj
	frslqnH2beXk9QsyQ7oVathygRMPVbzdPzTGVdye5+JRNqe/uOswO/gtN3E5ROfmQW+UUdc0Amv
	tjoy9WuUr1SWWMkPHoXyrrduYJc4gGt3/VbkqDPsGjzFhGmC9K9fFIww==
X-Received: by 2002:a17:907:9409:b0:b88:5a61:5461 with SMTP id a640c23a62f3a-b8f4d34f084mr6259266b.2.1770655960777;
        Mon, 09 Feb 2026 08:52:40 -0800 (PST)
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
Subject: [PATCH v3 03/16] xen/riscv: detect and store supported hypervisor CSR bits at boot
Date: Mon,  9 Feb 2026 17:52:16 +0100
Message-ID: <cfb2bd81ca9c43f29f5d77a918e1da7a8c55318e.1770650552.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 3F483112B76
X-Rspamd-Action: no action

Some hypervisor CSRs expose optional functionality and may not implement
all architectural bits. Writing unsupported bits can either be ignored
or raise an exception depending on the platform.

Detect the set of writable bits for selected hypervisor CSRs at boot and
store the resulting masks for later use. This allows safely programming
these CSRs during vCPU context switching and avoids relying on hardcoded
architectural assumptions.

Note that csr_set() is used instead of csr_write() to write all ones to
the mask, as the CSRRS instruction, according to the RISC-V specification,
sets only those bits that are writable:
    Any bit that is high in rs1 will cause the corresponding bit to be set
    in the CSR, if that CSR bit is writable.
In contrast, the CSRRW instruction does not take CSR bit writability into
account, which could lead to unintended side effects when writing all ones
to a CSR.

Masks are calculated at the moment only for hdeleg, henvcfg, hideleg,
hstateen0 registers as only them are going to be used in the follow up
patch.

If the Smstateen extension is not implemented, hstateen0 cannot be read
because the register is considered non-existent. Instructions that attempt
to access a CSR that is not implemented or not visible in the current mode
are reserved and will raise an illegal-instruction exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - New patch.
---
 xen/arch/riscv/include/asm/setup.h |  9 +++++++++
 xen/arch/riscv/setup.c             | 26 ++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index c9d69cdf5166..d54f6a2d1d29 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,6 +5,15 @@
 
 #include <xen/types.h>
 
+struct csr_masks {
+    register_t hedeleg;
+    register_t henvcfg;
+    register_t hideleg;
+    register_t hstateen0;
+};
+
+extern struct csr_masks csr_masks;
+
 #define max_init_domid (0)
 
 void setup_mm(void);
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9b4835960d20..010489f0b713 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -32,6 +32,8 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+struct csr_masks __ro_after_init csr_masks;
+
 /**
  * copy_from_paddr - copy data from a physical address
  * @dst: destination virtual address
@@ -70,6 +72,28 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
+void __init init_csr_masks(void)
+{
+    register_t old;
+
+#define X(csr, field) \
+        old = csr_read(CSR_##csr); \
+        csr_set(CSR_##csr, ULONG_MAX); \
+        csr_masks.field = csr_read(CSR_##csr); \
+        csr_write(CSR_##csr, old)
+
+    X(HEDELEG, hedeleg);
+    X(HENVCFG, henvcfg);
+    X(HIDELEG, hideleg);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+    {
+        X(HSTATEEN0, hstateen0);
+    }
+
+#undef X
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
@@ -137,6 +161,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     riscv_fill_hwcap();
 
+    init_csr_masks();
+
     preinit_xen_time();
 
     intc_preinit();
-- 
2.52.0


