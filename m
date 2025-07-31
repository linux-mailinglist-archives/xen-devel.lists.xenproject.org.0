Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E1BB1746B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065865.1431194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfu-0001Hk-NP; Thu, 31 Jul 2025 15:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065865.1431194; Thu, 31 Jul 2025 15:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfu-0001GK-Iw; Thu, 31 Jul 2025 15:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1065865;
 Thu, 31 Jul 2025 15:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVfs-0000zK-Pk
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:32 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3520d0fe-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:58:32 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-553d771435fso1122155e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:32 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:30 -0700 (PDT)
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
X-Inumbo-ID: 3520d0fe-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977512; x=1754582312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQKgU+Lnj9fqS+ICL+XL3aDj77hg68+WgDppr1D0Eyg=;
        b=HLjwoSxP0+eU6lRbcRVItyN1LYqfqruqlOhjxVBk/X2d2K2rWzjqxZwZFDmnRTJGu+
         LuRp8kIsUHDzXthQoYsr1Zjb48p+ezVifjQHcBOHNN26CnJNW4TgcGnzyHtCLTXLkWI7
         U1/zNfIm+soN6ELP3DCnmOWXl3WSLtDLtScy4698bxCaVbiJ/v/kso44rV9XjMm01nD6
         esXdrdmKpjEoaFTpvc9/+yXnM5QT0GxwMwdfE7ijx9V758WVVxhlLM5mKdBoXZ2g2Z3Y
         13gqT25o7+Ip82Ah5byiIFzfaopTkgY3cKbp7zRvLTRgqbWTXKp8/uj9bj/b83GDU/EL
         U2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977512; x=1754582312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQKgU+Lnj9fqS+ICL+XL3aDj77hg68+WgDppr1D0Eyg=;
        b=uqPlUHIgRRzgWM3iq5xEiu2h6Ko5n/AOATZZ8mMrVHMmrblj3he7lujO7i2OSQzS8h
         OyK2MlI7gK7fm3ntOK2ud0HW+p5BE/6pNBgQSAAOHYDspo5ErscCynv8Qag9ouzuo2tc
         YESE1C80nSWHmpWB9YtNmkF5ewSXLddyVAxJXW4x75ph9c+hcjrWTkmQ7FmNSgnCM1Cw
         61HhEd/gt9+e3Qr1tZ2tQhuPHA+zwFnWon/YBVQfrpGt/ZBGFwgt9yCOIEamNec904q7
         pb17sGFX8HyJCA/FXvcOWvRR0AI6MpxS49sHrlMba8k3TXszmYmx2TXeLcqNbPmaaEUk
         4fkQ==
X-Gm-Message-State: AOJu0YwMVxPCwgCT4+ueFmHU1KnNfGoiqBrSKjckHIjNKboZ5wl++3Ob
	+e48susSMjtxK4XhAKiLXxvnT/XVicqPsgnS51Vv8iDzOPMa50BgRiOjNH4dbw==
X-Gm-Gg: ASbGncvkFit8cwfPmZMZnbr7gzrk6hkMbm4WkSrzuy6jck/ZMIc40jYoH6B00oHR35k
	VeNS4Divuna5gYJLMbPJiXo52WyaPPJTmQH5Cy//DGn5QO3wleUVGVXSJCey8/+ML34TbffXG8/
	2S42RQqXNOAOTwQS+Mur4dqG+w4PGUgbrzbCnmvEamFbNpDoGg9OSuEz3BHafU4m0yep9sKv8La
	RF9svmRuXfAE22GdFIRd0uye+IWXVQL2EdzDORE7N2Wk86p3Py5jE/bnGDkGiLsVTlMNe16FNaV
	tx9TA7F6hByDTjGUBzmvNtAg5//ARzyuPfFMiHPLDMTKiiBr2ksK4XrAUqWT0AT9SX0Z6w1byqV
	vzhVj2Umjc1DnN72JUpWVQfqonw2at9HyuME+QVXfECQqcqhtnyglpteSAONlaw==
X-Google-Smtp-Source: AGHT+IG3Y8cbrf+MhbaTj7HO65vD5t1UDH9sQeDXs8qbfyuCWEZXPeqRxAnmW6f7W2tcCeyZbHuJlA==
X-Received: by 2002:a05:6512:ba1:b0:55b:8397:cffd with SMTP id 2adb3069b0e04-55b8397d195mr2182640e87.9.1753977511378;
        Thu, 31 Jul 2025 08:58:31 -0700 (PDT)
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
Subject: [PATCH v3 01/20] xen/riscv: implement sbi_remote_hfence_gvma()
Date: Thu, 31 Jul 2025 17:58:00 +0200
Message-ID: <b0649cf7b071d0a1cdd7fc9b8d73abea5d0646b4.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
covering the range of guest physical addresses between start_addr and
start_addr + size for all VMIDs.

The remote fence operation applies to the entire address space if either:
 - start_addr and size are both 0, or
 - size is equal to 2^XLEN-1.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Update the comment message above declaration of sbi_remote_hfence_gvma()
   and update the commit message in sync.
 - Drop ASSERT() in sbi_remote_hfence_gvma().
---
 xen/arch/riscv/include/asm/sbi.h | 19 +++++++++++++++++++
 xen/arch/riscv/sbi.c             |  7 +++++++
 2 files changed, 26 insertions(+)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 527d773277..0277aab747 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -89,6 +89,25 @@ bool sbi_has_rfence(void);
 int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                           size_t size);
 
+/*
+ * Instructs the remote harts to execute one or more HFENCE.GVMA
+ * instructions, covering the range of guest physical addresses
+ * between start_addr and start_addr + size for all VMIDs.
+ *
+ * Returns 0 if IPI was sent to all the targeted harts successfully
+ * or negative value if start_addr or size is not valid.
+ *
+ * The remote fence operation applies to the entire address space if either:
+ *  - start_addr and size are both 0, or
+ *  - size is equal to 2^XLEN-1.
+ *
+ * @cpu_mask a cpu mask containing all the target CPUs (in Xen space).
+ * @param start virtual address start
+ * @param size virtual address range size
+ */
+int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
+                           size_t size);
+
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 4209520389..1809f614c5 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -258,6 +258,13 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                       cpu_mask, start, size, 0, 0);
 }
 
+int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
+                           size_t size)
+{
+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+                      cpu_mask, start, size, 0, 0);
+}
+
 /* This function must always succeed. */
 #define sbi_get_spec_version()  \
     sbi_ext_base_func(SBI_EXT_BASE_GET_SPEC_VERSION)
-- 
2.50.1


