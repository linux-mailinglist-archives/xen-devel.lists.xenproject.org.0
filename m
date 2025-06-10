Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001AAD3805
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010784.1389002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfg-0005F5-KW; Tue, 10 Jun 2025 13:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010784.1389002; Tue, 10 Jun 2025 13:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfg-0005Cd-GN; Tue, 10 Jun 2025 13:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1010784;
 Tue, 10 Jun 2025 13:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyff-0004iH-2y
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d2d16e2-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so866686166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:42 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:41 -0700 (PDT)
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
X-Inumbo-ID: 9d2d16e2-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560742; x=1750165542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAFeKVvcyVUEFDWmR2Xc6msb8cPqppULN4b4iFqQNWg=;
        b=N/dhPzTebFgNqD2AE+nSlfRJE5UoXHfP4LZkN86b3qdQ/n7+/Door439K/Scd4OJs9
         jE0SdWpaQ8okUxCsUMynvzbt16AOzp4j+oRQMo2ge2IZdAxcSL0rR/uSACOIwraqAqHo
         ZY6xaViOYvEqum4qN24LWQuouGLWue7DRJPQDsdhXmIzsVjeIUBnUpYxOqwPpIV1we0Q
         ZRS46GiLYNon0S510qSlYgrz2AcTtJwDi8Z4KMo09dB5lt4h/GcYOtupxLGzmjahhsUT
         L+aS7bXgSPSvHddsJVnSiTSMhZJzEfk7iHBogAUtKLmQeCATOeovPKPeVQn3x0dzEwOd
         BDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560742; x=1750165542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAFeKVvcyVUEFDWmR2Xc6msb8cPqppULN4b4iFqQNWg=;
        b=fvP5pqC4RCIE7li21xGZwmLEs2inmiCwiC7Hxtn7n9i+94rshUHMPxCN2X/d3FjAME
         06p+FFlHuhA0yh/RSu9osvpE9vTzQ4UvtLtRctxfyEHfvyvlcwc+BnEHDYm3M9HbX3I9
         ABlcKMqCwea61zx+TcV5K+ycknN53PR/KuwLDpu6qzgduTI1iNlzLVzJye3rvuDYdtUs
         /9t7CMcRT61/ClzjbH1kDJ0f+DocZpF9ft24J516fs8Udj7bbq37AelY3UCGiqoiiaUh
         ZULOBPq/Lq+LaBmyNNEBhoH1h0EFDYButTwDMyp7YDDu2nHUg0MCPY86by4lSsUix2M2
         qg/Q==
X-Gm-Message-State: AOJu0YzHepDHBXwahLFAi6eCW0J1VRhbKrYwI/WTybrMawWcn+VghsWY
	guT79cBteAYc9wLED8+wHdsvCgvwz4UnMkbGjRpzQ4GPOg94xkRN1sw5VH8MaA==
X-Gm-Gg: ASbGncv9NU7OIMMW/wGbSkOvX5TUorMindN1dkntUkMMCN/ZNviyN4TaRYu+3VW5lNj
	CQvcldiT2gvMxAk/OGua9Rd/42ktKeGxFQYIp0mHUywU3o/en0lMLs6BcRdxeeWtiqSZ8FZIIre
	gDTTnquPzgm+eONQhJlpb/+a0bQ4VQo+CJwZ59+cfZwb7CBpG20K/6Mx7XWqkSs3pmqifHNp3B/
	GNzgQCw/N/5tP/QO65ZDzaZ9ChMndXR1tMgFob+CvEpdHq56vspFzyyhoKxM275CyEnuxXcRsci
	CCzSyL4xlxP04URnLLMabnmR5BUml7PUVaY6xHu3fvakQAKKU+jsYbvAN9ldPmxiOdj0l5Dg7o+
	YS4PtA+ODMTTBFweWu01ZEUZZ0tlD
X-Google-Smtp-Source: AGHT+IHUecsZq3dhiCGc3K0O1u9og5INZT4pEdguTRCMHQSuZgHcV8qFojdIwwPPw3t0uFrzvAeBnA==
X-Received: by 2002:a17:907:5c1:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-ade1abc5eb0mr1502731266b.54.1749560741282;
        Tue, 10 Jun 2025 06:05:41 -0700 (PDT)
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
Subject: [PATCH v2 02/17] xen/riscv: introduce sbi_remote_hfence_gvma_vmid()
Date: Tue, 10 Jun 2025 15:05:17 +0200
Message-ID: <5c614593a1710c737f5509ebb165efd8f857df30.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It instructs the remote harts to execute one or more HFENCE.GVMA instructions
by making an SBI call, covering the range of guest physical addresses between
start_addr and start_addr + size only for the given VMID.

This function call is only valid for harts implementing hypervisor extension.

The remote fence operation applies to the entire address space if either:
  - start_addr and size are both 0, or
  - size is equal to 2^XLEN-1.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/sbi.h | 17 +++++++++++++++++
 xen/arch/riscv/sbi.c             |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 8e346347af..2644833eb4 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -110,6 +110,23 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
 int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
                            size_t size);
 
+/*
+ * Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
+ * covering the range of guest physical addresses between start_addr and
+ * start_addr + size only for the given VMID. This function call is only
+ * valid for harts implementing hypervisor extension.
+ * The remote fence operation applies to the entire address space if either:
+ *  - start_addr and size are both 0, or
+ *  - size is equal to 2^XLEN-1.
+ *
+ * @cpu_mask a cpu mask containing all the target CPUs (in Xen space).
+ * @param start virtual address start
+ * @param size virtual address range size
+ * @param vmid virtual machine id
+ */
+int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
+                                size_t size, unsigned long vmid);
+
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 0613ad1cb0..bfd1193509 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -267,6 +267,15 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
                       cpu_mask, start, size, 0, 0);
 }
 
+int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
+                           size_t size, unsigned long vmid)
+{
+    ASSERT(sbi_rfence);
+
+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+                      cpu_mask, start, size, vmid, 0);
+}
+
 /* This function must always succeed. */
 #define sbi_get_spec_version()  \
     sbi_ext_base_func(SBI_EXT_BASE_GET_SPEC_VERSION)
-- 
2.49.0


