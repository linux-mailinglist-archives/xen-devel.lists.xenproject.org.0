Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA521673B4B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481131.745844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZq-0003U7-IJ; Thu, 19 Jan 2023 14:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481131.745844; Thu, 19 Jan 2023 14:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZq-0003SU-Eh; Thu, 19 Jan 2023 14:07:38 +0000
Received: by outflank-mailman (input) for mailman id 481131;
 Thu, 19 Jan 2023 14:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIVZo-0002xN-Vm
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:07:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fa18b36-9802-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 15:07:35 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id k16so1634377wms.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 06:07:35 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm7710178wms.2.2023.01.19.06.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:07:34 -0800 (PST)
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
X-Inumbo-ID: 9fa18b36-9802-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8pOiu1yPNSj0fET51Dhdg4Hqst86W5gYJV+0AgZfn8=;
        b=ii88x7Zl7GGceAEXg9iarLk3km8FnYT72UZRcKT2fhJpYkTI/1yTzFl4YkJcicHD65
         KWK+1UfNupnjdr/cs5hc4vWblf5XrbdVWV6uLn27qz5hC7oJSjzs9dipdiCXtQFPIxxQ
         AaH8jH1u6Mdi/wqVY8BDDBrLr5y80aTzr0OspQjc1reoua6HeM6dNS9+MIFD0vkVtT4x
         oJcWWnOAMmr0FE82y2IzoUA4iYLCjH8JAzmM+e14A085e2kO9Z15tn/47qtUbxhqYBYP
         mW9qMII/B24ilbyiE4AZfDOS5TmgbLjgzZkb6DWP8vg5gz9o19b4nyPUIa5iuXMo0GxU
         Gujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8pOiu1yPNSj0fET51Dhdg4Hqst86W5gYJV+0AgZfn8=;
        b=T3bSgFhVQeIEOVoArsjVuDA8aAoIr0vfmbVotFDW10qbGnXxAdBKHSwU7aWzWpEMUZ
         c0PBdPYQHyhlcv+7Yd918O2KaFtvqslmwMaPT+z/+uXtycpFmPmOFBiTg3gX+4ut4JPI
         +e26IWS60PBz0jJPW6FWn/N/lNwQ3p7sPfUsZ111fhJNjjhouCnTp6YItgZHeqmfZ5V2
         zL0oY62RYLxkJJmTC6++8jZPmaIckMENZPXNDXuCuiZj68P4MmPtrP+RpWpX4XyEYl68
         iy+HA+WBoSe70lEtgPS6ONR3mVtD3a1Co21J0LIY93B2JvMpJF6QIVewzyAvTSd973Si
         GCAw==
X-Gm-Message-State: AFqh2koZfHa4owGicX8+mMRKbJqbDJPDk3AtXLZDdgu6tQWqDxEhoD5f
	XiOqYLjeiUSV2mOCgKgTbedLDm8eKO2V9A==
X-Google-Smtp-Source: AMrXdXu2jRTRlqhR6G4xk/Yl7264yLf/lnMngbJTPksZ+MSKGQzblfXCAWUVVp4mip3kSMfYY9K4qg==
X-Received: by 2002:a05:600c:6014:b0:3db:127e:403 with SMTP id az20-20020a05600c601400b003db127e0403mr5688209wmb.37.1674137254807;
        Thu, 19 Jan 2023 06:07:34 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 2/5] xen/riscv: introduce asm/types.h header file
Date: Thu, 19 Jan 2023 16:07:19 +0200
Message-Id: <851a3fa74defe5174335646e2a79096bd8d432f8.1674131459.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674131459.git.oleksii.kurochko@gmail.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
    - Remove size_t from asm/types after rebase on top of the patch
	  "include/types: move stddef.h-kind types to common header" [1].
	- All other types were back as they are used in <xen/types.h> and
      in xen/common.
---
Changes in V4:
    - Clean up types in <asm/types.h> and remain only necessary.
      The following types was removed as they are defined in <xen/types.h>:
      {__|}{u|s}{8|16|32|64}
---
Changes in V3:
    - Nothing changed
---
Changes in V2:
    - Remove unneeded now types from <asm/types.h>
---
 xen/arch/riscv/include/asm/types.h | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/types.h

diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
new file mode 100644
index 0000000000..64976f118d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/types.h
@@ -0,0 +1,70 @@
+#ifndef __RISCV_TYPES_H__
+#define __RISCV_TYPES_H__
+
+#ifndef __ASSEMBLY__
+
+typedef __signed__ char __s8;
+typedef unsigned char __u8;
+
+typedef __signed__ short __s16;
+typedef unsigned short __u16;
+
+typedef __signed__ int __s32;
+typedef unsigned int __u32;
+
+#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+#if defined(CONFIG_RISCV_32)
+typedef __signed__ long long __s64;
+typedef unsigned long long __u64;
+#elif defined (CONFIG_RISCV_64)
+typedef __signed__ long __s64;
+typedef unsigned long __u64;
+#endif
+#endif
+
+typedef signed char s8;
+typedef unsigned char u8;
+
+typedef signed short s16;
+typedef unsigned short u16;
+
+typedef signed int s32;
+typedef unsigned int u32;
+
+#if defined(CONFIG_RISCV_32)
+
+typedef signed long long s64;
+typedef unsigned long long u64;
+typedef u32 vaddr_t;
+#define PRIvaddr PRIx32
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0ULL)
+#define PRIpaddr "016llx"
+typedef u32 register_t;
+#define PRIregister "x"
+
+#elif defined (CONFIG_RISCV_64)
+
+typedef signed long s64;
+typedef unsigned long u64;
+typedef u64 vaddr_t;
+#define PRIvaddr PRIx64
+typedef u64 paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "016lx"
+typedef u64 register_t;
+#define PRIregister "lx"
+
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __RISCV_TYPES_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.39.0


