Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5EB7188D5
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 19:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541917.845187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Pyn-0004bk-0r; Wed, 31 May 2023 17:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541917.845187; Wed, 31 May 2023 17:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Pym-0004a5-U8; Wed, 31 May 2023 17:51:24 +0000
Received: by outflank-mailman (input) for mailman id 541917;
 Wed, 31 May 2023 17:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOFA=BU=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q4Pyl-0004Zx-OD
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 17:51:23 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1414dcc-ffdb-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 19:51:22 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6042d610fso62654015e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 10:51:22 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x4-20020a05600c21c400b003f0aefcc457sm25322982wmj.45.2023.05.31.10.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 10:51:21 -0700 (PDT)
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
X-Inumbo-ID: c1414dcc-ffdb-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685555482; x=1688147482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mua9IhVSN1OtRUUfoVQkh1/qlL0MpIq8e2mssvEX7SI=;
        b=RHqXNyePvzey2ogCJkNO6uqvvpqkm1iFCi3nA0zJCX2bLqpQQ0YNIg/vZ+7GbraBkS
         JzTYlZna6OQ4NsLI/mlsGI5pcWJF9xguqb2LJL69ehoqiBWIGzsMy0hsRkZO75QQ/b/f
         Pi6XctmR4dETXH1FgZJTF8npdCMS67lKzPh2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685555482; x=1688147482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mua9IhVSN1OtRUUfoVQkh1/qlL0MpIq8e2mssvEX7SI=;
        b=dRW1M+NysPqRUF5cNVOaX7m4sSX55QaqwiphHvvpfvorsHhu0Ctj4JiMgcTv9TXnu7
         G87uefJi9tCbDG+eKrFS6JFyxihbn732rYzv9NJodSq7P6UP0JQlo1+F2oVJwNyqN1qB
         0ZMDELd39pU+XaYjG6kJPMkZXt93IlNGRgsiB80p6Y/cNxftBqRjzywil9FiGXQozXmk
         v/GLlWruzlGv2RGI7BDxcIVlScVgl8u1FVKc8uy8C91b5trU3kfjhXVz/rHJ7PwYXIiQ
         VX/IoZey9VdIbqA7TFI8K/socu6TXtVOrK3L7i2f9OfAtyrbw/p4EMkYu004NvDzBrCZ
         HVtA==
X-Gm-Message-State: AC+VfDzz/dtvVpv3kmzurYxWVbwaRloOkFLHr8ehg/aJ7mGqtLtVQpe2
	CkGGeGsVfrJB4owFnyxvdeWtSTx2KyWtYu+5gmM=
X-Google-Smtp-Source: ACHHUZ4sFxg4zHRjRHHQq7oKOt2KFUbEVgewfmEwDCdJXxazOJ98aQv4Rpakwovg8iEuMUJ09+bZzg==
X-Received: by 2002:a7b:cbd6:0:b0:3f6:cdf7:a741 with SMTP id n22-20020a7bcbd6000000b003f6cdf7a741mr5157859wmi.25.1685555481838;
        Wed, 31 May 2023 10:51:21 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/microcode: Prevent attempting updates known to fail
Date: Wed, 31 May 2023 18:51:19 +0100
Message-Id: <20230531175119.10830-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If IA32_MSR_MCU_CONTROL exists, then it's possible a CPU may be unable to
perform microcode updates. This is controlled through the DIS_MCU_LOAD bit.

This patch checks that the CPU that got the request is capable of doing an
update. If it is, then we let the procedure go through. While not enough
for the general case (different CPUs with different settings), this patch
copes with the far more common scenario of all CPUs being locked.

Note that for the uncommon general case, we already have some logic in
place to emit a message on xl-dmseg in order to notify the admin that they
should reboot the machine ASAP.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/cpu/microcode/core.c     | 27 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 3 files changed, 33 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index cd456c476f..e507945932 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -697,6 +697,17 @@ static long cf_check microcode_update_helper(void *data)
     return ret;
 }
 
+static bool this_cpu_can_install_update(void)
+{
+    uint64_t mcu_ctrl;
+
+    if ( !cpu_has_mcu_ctrl )
+        return true;
+
+    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
+    return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
+}
+
 int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
 {
     int ret;
@@ -708,6 +719,22 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
     if ( !ucode_ops.apply_microcode )
         return -EINVAL;
 
+    if ( !this_cpu_can_install_update() )
+    {
+        /*
+         * This CPU can't install microcode, so it makes no sense to try to
+         * go on. We're implicitly trusting firmware sanity in that all
+         * CPUs are expected to have a homogeneous setting. If, for some
+         * reason, another CPU happens to be locked down when this one
+         * isn't then unpleasantness will follow. In particular, some CPUs
+         * will be updated while others will not. A very stern message will
+         * be displayed in xl-dmesg that case, strongly advising to reboot the
+         * machine.
+         */
+        printk("WARNING: microcode not installed due to DIS_MCU_LOAD=1");
+        return -EACCES;
+    }
+
     buffer = xmalloc_flex_struct(struct ucode_buf, buffer, len);
     if ( !buffer )
         return -ENOMEM;
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ace31e3b1f..0118171d7e 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -192,6 +192,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 
 /* Synthesized. */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2749e433d2..5c1350b5f9 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -165,6 +165,11 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_MCU_CONTROL                     0x00001406
+#define  MCU_CONTROL_LOCK                   (_AC(1, ULL) <<  0)
+#define  MCU_CONTROL_DIS_MCU_LOAD           (_AC(1, ULL) <<  1)
+#define  MCU_CONTROL_EN_SMM_BYPASS          (_AC(1, ULL) <<  2)
+
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
-- 
2.34.1


