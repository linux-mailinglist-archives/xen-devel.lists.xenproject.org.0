Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA4DCDCEB7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192950.1511980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH1-0003gZ-Km; Wed, 24 Dec 2025 17:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192950.1511980; Wed, 24 Dec 2025 17:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH1-0003dj-FZ; Wed, 24 Dec 2025 17:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1192950;
 Wed, 24 Dec 2025 17:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH0-0003b7-9u
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eb2c3c4-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:40 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so1149468466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:40 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:38 -0800 (PST)
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
X-Inumbo-ID: 7eb2c3c4-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595819; x=1767200619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYGyfRUWi6/uVVhXroMlu9Z8bL0jkMCNXbGuPR68cNM=;
        b=A5WHCck/eKEbkoPJFUqyonrxJpV/dU0mZpjhYrHB9cuNLTU8I2OG6eFj6//lf5JJz6
         DIJOZCs4bmSGP1UTV7LeMsSW1XEp5H+mPAB56NC1ksB74Cq4b1E3zyuMNrQgp5rzBD7b
         2OtT22u2v/Wg3fHd58yw2+bD5E/8/YkIrs8H+m4IVu1dGOufyX0n4oxLCQ0sHzLkABip
         +gCbz6EhpfCkKghssBNEYfG6rnO7yAd9Foz7m2kEhFZ50YbVtuH32XaqcORWBWMpZU+k
         QU6TrdGDThLDauqe1EldA1ef94h3YdyT2s7JxW8FpyRdb+OYG3ExOW2sHunZuEhMG6LV
         nuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595819; x=1767200619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eYGyfRUWi6/uVVhXroMlu9Z8bL0jkMCNXbGuPR68cNM=;
        b=FMSY0ZIHsiDBJ4uUfy3nkbhkmAo9qkkGCjl6dRqSf4WlaainKZczRO8QV0xmqlmvUL
         jtwPvjbD0GWWb2c3qABXhIIt4eMBtoS4ElLUH8IQopYWj1knyen63Bb8/MrPS7yB3zDh
         k5ri6Qn1gWk94Ese3+hwXI3/4lx+p29dMAVNn7KhN/yZBByCyIiA6KHbQ/MSLjx8aDZp
         vKn/zfcrCTsfOt/uKFMv3bTOlAY1cVJX+6XIE9w3lkoUFv6g69TJmKuAAxBGq7/3QWX6
         4Bjty4go2DpRFuuQXghNkMQBhrS9aitslUNDzRGNqJHCHj9uVZ5Bv5DG8pC9IJvHn9kd
         wE4w==
X-Gm-Message-State: AOJu0YzGI+/sYFPcKzNt1S/y1mprhqU7pqDjQKzSzM64EYMMLfupv7fi
	parZV/JoSBEKPX4qXwZEkLVKVgOrBEIJvGtBjHg0WV2zaONtCV7p5GaWru7qQw==
X-Gm-Gg: AY/fxX4jyE4749i5Lo7GfnHVjVyocMOKKtkC0cm9OjCINrAV7r/hI1n4WTFMbgMjwzr
	mFzUff0nWd894gz4MxRObk2kurp+fVioYvmqiUVQV52HBolVCT38eZueDqJ2rfNDIN6QFhVa5zv
	ftefum2dYbBFRA29DyuKKVmHjgAgb50DFhscrL8jWW/7gw35WB0gtztbqTlooOW4l13E+bqvBFc
	N3qOQOlBRGoWfggKKufMPd04FKp6NluDo0aV/0S45Nyt9zPvb+v2zdlzpWaRtbg17d5BLAuBIrc
	egDnx1V0p+AJt0dRjIvsEuTiggCFsCv5VRLfWfBGlfzD8FgLGo3mGje+Hs4iqHytB/rUwPUJMfr
	xBnZF9FdEYsQXvPg4DIKFqwkdSCN/D4fBPpXRjG1gA8jFce2tB9AfeXEShW//1IbGwQ6+P3XC6O
	LpdSpVil5evk9KwHLN5KEriqKpNAAJYfjWoQBeMbs7Blg0LSNNeyBAZ5bvxb+SQEDVJw==
X-Google-Smtp-Source: AGHT+IGUckCWnWYOyuXH1beDmWPjVW2NAXJIsIoFW1Mos5tgYOhXiz+lRYQn8/fskyhC+hA73E/MOA==
X-Received: by 2002:a17:907:602f:b0:b83:1341:b656 with SMTP id a640c23a62f3a-b831341b7f3mr161394466b.22.1766595819157;
        Wed, 24 Dec 2025 09:03:39 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 03/15] xen/riscv: implement vcpu_csr_init()
Date: Wed, 24 Dec 2025 18:03:16 +0100
Message-ID: <bf617d77bb9e75bbd2930614bb86ff83b80adcfc.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement function to initialize VCPU's CSR registers to delegate handling
of some traps to VS-mode ( guest ), enable vstimecmp for VS-mode, and
allow some AIA-related register (thier vs* copies ) for VS-mode.

Add detection of Smstateen extension to properly initialize hstateen0 to
allow guest to access AIA-added state.

Add call of vcpu_csr_init() in arch_vcpu_create().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/cpufeature.c                 |  1 +
 xen/arch/riscv/domain.c                     | 63 +++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h     |  1 +
 xen/arch/riscv/include/asm/riscv_encoding.h |  2 +
 4 files changed, 67 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 02b68aeaa49f..03e27b037be0 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -137,6 +137,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(zbb),
     RISCV_ISA_EXT_DATA(zbs),
     RISCV_ISA_EXT_DATA(smaia),
+    RISCV_ISA_EXT_DATA(smstateen),
     RISCV_ISA_EXT_DATA(ssaia),
     RISCV_ISA_EXT_DATA(svade),
     RISCV_ISA_EXT_DATA(svpbmt),
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index e5fda1af4ee9..44387d056546 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -3,6 +3,67 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 
+#include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/riscv_encoding.h>
+
+static void vcpu_csr_init(struct vcpu *v)
+{
+    unsigned long hedeleg, hideleg, hstatus;
+
+    hedeleg = 0;
+    hedeleg |= (1U << CAUSE_MISALIGNED_FETCH);
+    hedeleg |= (1U << CAUSE_FETCH_ACCESS);
+    hedeleg |= (1U << CAUSE_ILLEGAL_INSTRUCTION);
+    hedeleg |= (1U << CAUSE_MISALIGNED_LOAD);
+    hedeleg |= (1U << CAUSE_LOAD_ACCESS);
+    hedeleg |= (1U << CAUSE_MISALIGNED_STORE);
+    hedeleg |= (1U << CAUSE_STORE_ACCESS);
+    hedeleg |= (1U << CAUSE_BREAKPOINT);
+    hedeleg |= (1U << CAUSE_USER_ECALL);
+    hedeleg |= (1U << CAUSE_FETCH_PAGE_FAULT);
+    hedeleg |= (1U << CAUSE_LOAD_PAGE_FAULT);
+    hedeleg |= (1U << CAUSE_STORE_PAGE_FAULT);
+    v->arch.hedeleg = hedeleg;
+
+    hstatus = HSTATUS_SPV | HSTATUS_SPVP;
+    v->arch.hstatus = hstatus;
+
+    hideleg = MIP_VSTIP |  MIP_VSEIP | MIP_VSSIP;
+    v->arch.hideleg = hideleg;
+
+    /*
+     * VS should access only the time counter directly.
+     * Everything else should trap.
+     */
+    v->arch.hcounteren |= HCOUNTEREN_TM;
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svpbmt) )
+        v->arch.henvcfg |= ENVCFG_PBMTE;
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+    {
+        /*
+         * If the hypervisor extension is implemented, the same three bitsare
+         * defined also in hypervisor CSR hstateen0 but concern only the state
+         * potentially accessible to a virtual machine executing in privilege
+         * modes VS and VU:
+         *      bit 60 CSRs siselect and sireg (really vsiselect and vsireg)
+         *      bit 59 CSRs siph and sieh (RV32 only) and stopi (really vsiph,
+         *             vsieh, and vstopi)
+         *      bit 58 all state of IMSIC guest interrupt files, including CSR
+         *             stopei (really vstopei)
+         * If one of these bits is zero in hstateen0, and the same bit is one
+         * in mstateen0, then an attempt to access the corresponding state from
+         * VS or VU-mode raises a virtual instruction exception.
+        */
+        v->arch.hstateen0 = SMSTATEEN0_AIA | SMSTATEEN0_IMSIC | SMSTATEEN0_SVSLCT;
+
+        /* Allow guest to access CSR_ENVCFG */
+        v->arch.hstateen0 |= SMSTATEEN0_HSENVCFG;
+    }
+}
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
     BUG_ON("unimplemented\n");
@@ -30,6 +91,8 @@ int arch_vcpu_create(struct vcpu *v)
            v->arch.xen_saved_context.sp, v->arch.xen_saved_context.ra,
            (unsigned long)v->arch.cpu_info);
 
+    vcpu_csr_init(v);
+
     /* Idle VCPUs don't need the rest of this setup */
     if ( is_idle_vcpu(v) )
         return rc;
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index b69616038888..ef02a3e26d2c 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -36,6 +36,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zbb,
     RISCV_ISA_EXT_zbs,
     RISCV_ISA_EXT_smaia,
+    RISCV_ISA_EXT_smstateen,
     RISCV_ISA_EXT_ssaia,
     RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 1f7e612366f8..dd15731a86fa 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -228,6 +228,8 @@
 #define ENVCFG_CBIE_INV			_UL(0x3)
 #define ENVCFG_FIOM			_UL(0x1)
 
+#define HCOUNTEREN_TM BIT(1, U)
+
 /* ===== User-level CSRs ===== */
 
 /* User Trap Setup (N-extension) */
-- 
2.52.0


