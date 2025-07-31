Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58217B1746F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065867.1431207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfv-0001Ru-CN; Thu, 31 Jul 2025 15:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065867.1431207; Thu, 31 Jul 2025 15:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfv-0001NV-5j; Thu, 31 Jul 2025 15:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1065867;
 Thu, 31 Jul 2025 15:58:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVfu-0000zK-BG
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:34 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3606818c-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:58:33 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55b8bf653dfso513927e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:33 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:32 -0700 (PDT)
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
X-Inumbo-ID: 3606818c-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977513; x=1754582313; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gl1Hk+jNRlMZzMMWZPcd3JgviGxNJ9ge4Ig02sPFSnM=;
        b=SO7zGQ1YQEMBls2hAnykrzrCU4LP/mQSEPr44g/haVJ8x5QuF4VDGR6tjif0APtl9v
         dq5CB8fTYuYz2ffLqAQZOCNZMJ8dUAz9zSMe30yxAc9GtQe37JXqgPnzRJcRFxCcVo2K
         TrnEehmVwj0vNlhs+R+h0a9f7AMAc7m9rnhOfVtNpYFbinTo8lOYh1i53kCfkjAJF9oO
         iNnqHLBwt1nNc281xw+XqAzLYlzccHcs60IpfTIBqhr6jpvWeVoZUmvU9pbadlZzeeFR
         iRj8+7ibOTxF9ci3cWAC1R+CK+y8BELnmGeSaHpKDSsq8pKhTbJlpfSrrocHycVa/7H4
         jPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977513; x=1754582313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gl1Hk+jNRlMZzMMWZPcd3JgviGxNJ9ge4Ig02sPFSnM=;
        b=wy+F3hMpoNxA8CQ0MZtFugs2DZWWedeAk8tyjkCha6BmdACVZrd97sSXVAov3AbMyJ
         Ze1OgMZuohZwQLINbwKzXTXXHByVWQ3zLKSZOH6KwzTaybayP56CSmosdvolEFhjF/l6
         hD1FoCm/O2roF1edslNy1JXsJBYsYiMv2CUSjGIY/4pe4rRssh0LfHpzlTznMo0MYjyX
         tEkWJ5RV4CGDV1W/EDOOS+CwDK9PFA41heNbAUWb+NWwMFeaFtDKTjOXquifAiWfJJvu
         o+OOtZxjcDx5W0f4DeJXrobfouok3sM2CFibcIvuuswCX/NnAVIZTMqW8ZA+hsfOI8sM
         w2GA==
X-Gm-Message-State: AOJu0Yzu19bIdF5XXXMSQFa45T33rvVEwR8XnwJ0jbkC6anboVt5h4md
	9TOI8qmli7gkzOn7dvhucmnV2KqLpbkegqo/Fw85nFJEclrsrtbHth09xDmlOg==
X-Gm-Gg: ASbGnct+3WXCfVUOx64GNDFYByVSbPVe2TqWjMB6V3oljCJhMR/ViTBs5pDOMJv/j9D
	Zc0uqIKkmF8tdDVnnyjme0hW9bSLf87wdE7n2lVKB9kSjhV6YVv9b3g5iPRU7Qr0+VepV/pwbwm
	eBFCOysiXaRW8rAOk+f1BmF5AQ3pX9yFehLa+hUdyNKRR7hJci/bS2dZrluUnSVvjEBLUa76B3+
	I42Oqs9GftsTLB+WqsL0X1l9KDQY9WTaA1lZ5iOoirYe2h/hOj5TOUnakkOVJMa60anRjdyqeXG
	WzbDO9FhCs33JULLXUbtMDz3kMeA7vvbHVQgIFV+lV7fn/h+zMzK8Ckx+KW7wOTJiPd+DErz8Gw
	KZkQZEaFZZO0WQH7qyafCniV2m9aU7kKo27lk3cVwM1/cvlylubLTlTD0NeC9+3IygiErmicy
X-Google-Smtp-Source: AGHT+IE0Fc3QUbhAdd8idvdotZ5yCFEp8zJuYhTWhOvWRzqB3iUQNwMHtAj0W+LSopnzVDwN9CCORA==
X-Received: by 2002:a05:6512:63c9:10b0:55a:271e:9659 with SMTP id 2adb3069b0e04-55b7c085e8dmr1935607e87.27.1753977512819;
        Thu, 31 Jul 2025 08:58:32 -0700 (PDT)
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
Subject: [PATCH v3 02/20] xen/riscv: introduce sbi_remote_hfence_gvma_vmid()
Date: Thu, 31 Jul 2025 17:58:01 +0200
Message-ID: <de83ed75b0d7109d007389ec4809320c59c10bf7.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It instructs the remote harts to execute one or more HFENCE.GVMA instructions
by making an SBI call, covering the range of guest physical addresses between
start_addr and start_addr + size only for the given VMID.

The remote fence operation applies to the entire address space if either:
  - start_addr and size are both 0, or
  - size is equal to 2^XLEN-1.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Drop ASSERT() in sbi_remote_hfence_gvma_vmid() as failure will happen anyway if
   rfence isn't initialized.
 - Drop "This function call is only valid for harts implementing hypervisor
   extension." from the commit message and the comment above the declaration
   of sbi_remote_hfence_gvma_vmid().
 - Use proper FID for sbi_remote_hfence_gvma_vmid().
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/sbi.h | 13 +++++++++++++
 xen/arch/riscv/sbi.c             |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 0277aab747..10930dea93 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -108,6 +108,19 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
 int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
                            size_t size);
 
+/*
+ * Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
+ * covering the range of guest physical addresses between start_addr and
+ * start_addr + size only for the given VMID.
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
index 1809f614c5..425dce44c6 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -265,6 +265,13 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
                       cpu_mask, start, size, 0, 0);
 }
 
+int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
+                                size_t size, unsigned long vmid)
+{
+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
+                      cpu_mask, start, size, vmid, 0);
+}
+
 /* This function must always succeed. */
 #define sbi_get_spec_version()  \
     sbi_ext_base_func(SBI_EXT_BASE_GET_SPEC_VERSION)
-- 
2.50.1


