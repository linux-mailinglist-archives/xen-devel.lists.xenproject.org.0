Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874565CE90
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470986.730700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOd-00014m-CT; Wed, 04 Jan 2023 08:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470986.730700; Wed, 04 Jan 2023 08:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOd-00010r-7s; Wed, 04 Jan 2023 08:45:15 +0000
Received: by outflank-mailman (input) for mailman id 470986;
 Wed, 04 Jan 2023 08:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOc-0008Pf-0S
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19fa257a-8c0c-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 09:45:12 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id u19so80869654ejm.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:12 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:11 -0800 (PST)
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
X-Inumbo-ID: 19fa257a-8c0c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdM0GT8K2NEubn6wx1wh2HmFlgRPGL3ox7yjkbP2cHM=;
        b=IlyAPSqkdHW7+9UwD5gXGVtDULbpYhhfd0Gx3yvhyrN1hcnLLYpk/M8pLuZh3YGQA5
         RsVx5uaz+bOugElYhIBMhtGc3tqbn9YBkmVDrxuCMqWWX/W5oNuPk6DW0mfx8vmvL3HF
         ENubWWJaVNiyKeqpPIwwuejdwmsFxhgpxr1B0qOLb/mJ/yQinsTqM9N5w7duefO33xzh
         CxrIrX8vsDWj7A9Pvq8nOW5W7QBLF+SVPuTuHzx+86VaMLDiZtwdhK3Musr1DWA3roXi
         SaRmbzkQydU5DN5adQlyaJo10MX9fRjb3UDxkTH2wFOytbtjR6qE6Ebm4ZmQd2sZty00
         eE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdM0GT8K2NEubn6wx1wh2HmFlgRPGL3ox7yjkbP2cHM=;
        b=ujVkcSyvyXqPUEzNnTKz9NEDyz6evmAWdfIEWrtANAzNhQa+VFsLYIoN81nofZI6hO
         J9yPis4/OgPsLufkJFyLb8MMX/WTpu4KZX6q6PqcvQBsPHS9G8ApWIu3bFNlNh9aBcMd
         fpD75xnB0RWP9aD43mDdwSopD5WtKV3ZmHYIV0M8AsCMYzj1EeM+bySilgzzN7SznPnK
         qFmtD3DAsPVBdvNn9Q28pdP6jYvVofAaBCc8FTsp66rShvPRnHBfgeHrPDc8q+F0mTQ1
         mkWNhLyq0c/Ku47e60sy5pQHjEeAVaxuhwAflQrUH/5/94/ASkOcTrN4MPvxXW5kbWYm
         o7rA==
X-Gm-Message-State: AFqh2krDHKuaSvEMjWKXTJOVpOfbxAE0OgnG+FAVj0A6RLn67shxDH7h
	Lr6frMdaxd8qZBJkYusiGnKOga9DAT8=
X-Google-Smtp-Source: AMrXdXsZZgpByDZtDx+HjsyiTiwAs0G3noW3D/xTiatDsGRWMUyXQVuGvHA8kTWk4IDuO3qsJCn9ZA==
X-Received: by 2002:a17:907:20b0:b0:7d3:8159:f361 with SMTP id pw16-20020a17090720b000b007d38159f361mr40554936ejb.36.1672821911636;
        Wed, 04 Jan 2023 00:45:11 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/8] x86/acpi: separate AMD-Vi and VT-d specific functions
Date: Wed,  4 Jan 2023 10:44:58 +0200
Message-Id: <20230104084502.61734-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions acpi_dmar_init() and acpi_dmar_zap/reinstate() are
VT-d specific while the function acpi_ivrs_init() is AMD-Vi specific.
To eliminate dead code, they need to be guarded under CONFIG_INTEL_IOMMU
and CONFIG_AMD_IOMMU, respectively.

Instead of adding #ifdef guards around the function calls, implement them
as empty static inline functions.

Take the opportunity to move the declarations of acpi_dmar_zap/reinstate() to
the arch specific header.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - replace CONFIG_INTEL_VTD with CONFIG_INTEL_IOMMU

 xen/arch/x86/include/asm/acpi.h | 14 ++++++++++++++
 xen/include/xen/acpi.h          |  3 ---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index c453450a74..ca8529a7c8 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -140,8 +140,22 @@ extern u32 pmtmr_ioport;
 extern unsigned int pmtmr_width;
 
 void acpi_iommu_init(void);
+
+#ifdef CONFIG_INTEL_IOMMU
 int acpi_dmar_init(void);
+void acpi_dmar_zap(void);
+void acpi_dmar_reinstate(void);
+#else
+static inline int acpi_dmar_init(void) { return -ENODEV; }
+static inline void acpi_dmar_zap(void) {}
+static inline void acpi_dmar_reinstate(void) {}
+#endif
+
+#ifdef CONFIG_AMD_IOMMU
 int acpi_ivrs_init(void);
+#else
+static inline int acpi_ivrs_init(void) { return -ENODEV; }
+#endif
 
 void acpi_mmcfg_init(void);
 
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 1b9c75e68f..82b24a5ef0 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -206,9 +206,6 @@ static inline int acpi_get_pxm(acpi_handle handle)
 
 void acpi_reboot(void);
 
-void acpi_dmar_zap(void);
-void acpi_dmar_reinstate(void);
-
 #endif /* __ASSEMBLY__ */
 
 #endif /*_LINUX_ACPI_H*/
-- 
2.37.2


