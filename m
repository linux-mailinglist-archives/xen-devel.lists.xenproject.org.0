Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6wYiK3FRj2kJQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B48138012
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231311.1536501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2e-0005oQ-JB; Fri, 13 Feb 2026 16:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231311.1536501; Fri, 13 Feb 2026 16:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2e-0005hC-C2; Fri, 13 Feb 2026 16:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1231311;
 Fri, 13 Feb 2026 16:29:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2d-0005Wn-3o
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:15 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21cb0b5b-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:13 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48370174e18so7721955e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:13 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:12 -0800 (PST)
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
X-Inumbo-ID: 21cb0b5b-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000152; x=1771604952; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGjLwQrf+g8EjtzlcMtYn8BP8ihLs5L3xQsqVVgUdSA=;
        b=YpcR4NKhnLMgC8gyh1hvUrWNutcdiUTO48SzpmCPjd6QG5J9BCx+94T4F9CuoS9ICl
         DHOmZcmw+wuX33dhuhgXIPg5Z3GdCmb+yU5nX+LVpVLS7ROP2iuXXgvP1ed53Z+I+XZ+
         lXgjPdLUV6/2Nq2ZE7MB+VTRFI7aK15pQs0wi3snpbl3zx3GF29YepaWJlTuHs/f/6CE
         ZXVIe1H8SKf/AvP4OX6y0ol+8T630ycnwjsTdYxtqYjxUTazKRSv5hsueoLVs7Qo+Idy
         rkM6fWLY+qJmvKNa672VWBf5o/LHvBkep79RbAbQc5BoNblI38HX6zY5XXlRg52PaoRq
         emfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000152; x=1771604952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGjLwQrf+g8EjtzlcMtYn8BP8ihLs5L3xQsqVVgUdSA=;
        b=t+HZBJ9L/d1+0mDcxZRC6RB5rz+kJsUUNhsovKkSjL8M3cPNL3RnopnI5VUkCHGduT
         2kqaYo2C03yqXPhlwNIFWBHgkGsSvUKF5LEDrb04z5xglM38ebl4SL8/vWu6xDLcYeYu
         eVAXryiAJuYBkD8lzQM0bDghWQhCjeJ8icXVZGT5XqtdONfPaC6bkqrZNScuBbht0+wO
         srAzJV1uEdrioTJ+4EvvYtvkmMEYxDV7krsLxXcg7F23jikWLrWwGpcUt4AU9hf6e0/P
         afGj+san41vNv0FL+r+nKSA4u1kwMkjgLzwUagfs45EWuVWa3vQ7qHzkZ2+FpogcMAMe
         +3oA==
X-Gm-Message-State: AOJu0YyTAmoo1TTsSv5XqcitUJ2hPEVN0Fk11gyPzvIMro6lyLyvVZI3
	IzLxacJgCOonKsvRO7nP71235Gw6r6C1eed9XuhqMQpUIhNn1jRjvcXTTDaRhjYa
X-Gm-Gg: AZuq6aJFuC2NAHDtZRLAp7+Js1qlSqTmfF6IwLMOkUpRuPu2CURFCflbsutULXgpCX4
	W/39N4vJeqvWcMxV42oQwgK0urMK5VZ5ouVf0gaPrhSRCnAht9bQpGW05ORDWpKjJo5dgqOVOBi
	243XoL3QxI5ftxDR+1Wy6UvDR3kSYED/JUTv9KKDoQapCGYQKWtuMDcZVPUKMxiQG1JTxxdpO9t
	+Fk900oSiQO+W4My3qXBMTv0/ZfeiTne9LlM1lYilsVhq+ugIlJcP9yb6RaZrX4qNp0MdQRXFdP
	E8y1koUVvKdm+nfEoaPzPBXzu0H0g1yDQZAob3nZyE2oxYGFExBp1C8sFRxMY/+sqsLhplTVMBj
	QcidcyqmPtlO/83fZRSuzpBm8+EuFpmhYq0Te5aUCt+4k5zxZPBsJpln1x4gUNbpG6NyFwFm8fZ
	KPcVQKsx6gSSUaGLshxTEo99BAtSp6vidMUxFPKIA7/8L8tx+vOEVq3+4lM0K8wjUF1Q==
X-Received: by 2002:a05:600c:45cc:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-48373a6c1f8mr37820645e9.35.1771000152350;
        Fri, 13 Feb 2026 08:29:12 -0800 (PST)
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
Subject: [PATCH v4 02/16] xen/riscv: detect and store supported hypervisor CSR bits at boot
Date: Fri, 13 Feb 2026 17:28:48 +0100
Message-ID: <06c3b8f88803039a3d900c8cb2f1fd9d05f44e3e.1770999383.git.oleksii.kurochko@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: F0B48138012
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
sets only those bits that are writable (note that the quote consider only
non-read-only CSRs as writing to read-only CSRs according to the spec.
will raise an exception):
    Any bit that is high in rs1 will cause the corresponding bit to be set
    in the CSR, if that CSR bit is writable.
In contrast, the CSRRW instruction does not take CSR bit writability into
account, which could lead to unintended side effects when writing all ones
to a CSR.

Masks are calculated at the moment only for hedeleg, henvcfg, hideleg,
hstateen0 registers as only them are going to be used in the follow up
patch.

If the Smstateen extension is not implemented, hstateen0 cannot be read
because the register is considered non-existent. Instructions that attempt
to access a CSR that is not implemented or not visible in the current mode
are reserved and will raise an illegal-instruction exception.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Move csr_masks defintion to domain.c. Make it static as at the moment
   it is going to be used only in domain.c.
 - Rename and refactor X macros inside init_csr_masks().
---
Changes in V3:
 - New patch.
---
 xen/arch/riscv/domain.c            |  5 +++++
 xen/arch/riscv/include/asm/setup.h |  9 +++++++++
 xen/arch/riscv/setup.c             | 21 +++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index f5c624ac92c7..5572e10bfaa9 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -2,9 +2,14 @@
 
 #include <xen/init.h>
 #include <xen/mm.h>
+#include <xen/sections.h>
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/setup.h>
+
+struct csr_masks __ro_after_init csr_masks;
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     BUG_ON("unimplemented\n");
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
index 9b4835960d20..dc469b49623f 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -70,6 +70,25 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
     return fdt;
 }
 
+void __init init_csr_masks(void)
+{
+    register_t old;
+
+#define INIT_CSR_MASK(csr, field) do { \
+        old = csr_read(CSR_##csr); \
+        csr_set(CSR_##csr, ULONG_MAX); \
+        csr_masks.field = csr_read(CSR_##csr); \
+        csr_write(CSR_##csr, old); \
+} while (0)
+
+    INIT_CSR_MASK(HEDELEG, hedeleg);
+    INIT_CSR_MASK(HENVCFG, henvcfg);
+    INIT_CSR_MASK(HIDELEG, hideleg);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        INIT_CSR_MASK(HSTATEEN0, hstateen0);
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
@@ -137,6 +156,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     riscv_fill_hwcap();
 
+    init_csr_masks();
+
     preinit_xen_time();
 
     intc_preinit();
-- 
2.52.0


