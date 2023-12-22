Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFC81CBF0
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659413.1029059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDR-0000W1-Eb; Fri, 22 Dec 2023 15:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659413.1029059; Fri, 22 Dec 2023 15:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDR-0000QH-6o; Fri, 22 Dec 2023 15:13:33 +0000
Received: by outflank-mailman (input) for mailman id 659413;
 Fri, 22 Dec 2023 15:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDQ-0000EM-4g
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:32 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa03252b-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:30 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50e2d00f99cso2277740e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:30 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:28 -0800 (PST)
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
X-Inumbo-ID: aa03252b-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258009; x=1703862809; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODGnSpcmOiq+z7wR2YwRtk5YCjWAFHvC/ahjEF0s2+M=;
        b=KSHKBWvcqsyGVCrR4WSbi9IGM8/kFD6vWZ+friUtYacav88cfUk4aEWpRJbh1hLAZd
         7jMetzOK1e8WkEcjt0pVDDj5NOvCmVR1jK9KMsrp49qx2BfLsZRF1k5RwSpN+Lsu0tYe
         ndRbEZTl7y76FHzJ+cakpvNjfqZhRo6S0gF+07RJRor1TjaN7lV7v+h2EVwQGBIrHldN
         Qd7vIP1w54vGI/GPBSUpeGqRMPqGY7G0GZ+vxGF0Bpyc8i5exqfJROtnE3T9kM1bTCOa
         jqlF0umxqTrONYhEjksbRq8+s3ta19llqP4HKtLCQ1Wm9zyMkufUpbudlaUtmY5kDnWA
         cuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258009; x=1703862809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODGnSpcmOiq+z7wR2YwRtk5YCjWAFHvC/ahjEF0s2+M=;
        b=k5j4uAvRvoGD7RCXOQ0akzaIODrmtFkAH1HEa1DjKDQ7WjhWo8Mi3yS4EqEeTbZB6E
         B1Z7nKN8EyrC/gsc7p9GOdGNttiRHzE+a04BeSOJeHFhSlOqgONGSP9ZVQyMDZzBTq88
         9IZ7098S3qGu1+xt9wPel3V7noB4bvU4Z7LWe4dgYCPAEwdJuZfeJSwOdHV2MSMyE3VH
         FA+i1oGyh3DF0paw6Y/YvFoKcrNoxjq1DVR0xeIlfcXaZVdQmg1D5V2bvn+3tnWucTlN
         EHwYjvU6fLn3YiWGXGgRo2vDh3lr43Uzl3zQE/C2hmMfA9SaY+jmx1+s6NBQeTwynOxQ
         56Dg==
X-Gm-Message-State: AOJu0Yzz6t+jQUcZjYH46TltoFUm9enwoblzEKth6PnZFGwan209rsvj
	zwG0K1mjTbnZ8lQIavssr57KUAkK1pU=
X-Google-Smtp-Source: AGHT+IFpP2s6FBrAszxGjeeeFDkJndwkLyAsxHilcAwkZ/ITbUpLCmVdmFBej49keZF8X+HFho+ahw==
X-Received: by 2002:a05:6512:1252:b0:50e:6f8a:777b with SMTP id fb18-20020a056512125200b0050e6f8a777bmr114341lfb.66.1703258009530;
        Fri, 22 Dec 2023 07:13:29 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 06/34] xen: avoid generation of empty asm/iommu.h
Date: Fri, 22 Dec 2023 17:12:50 +0200
Message-ID: <e2a51f6197fce8f2ad636885ed231a6725d4cd8a.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch.
---
 xen/include/xen/iommu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index f53d045e2c..8adbf29d3b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -337,7 +337,9 @@ extern int iommu_add_extra_reserved_device_memory(unsigned long start,
 extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
                                                   void *ctxt);
 
+#ifdef CONFIG_HAS_PASSTHROUGH
 #include <asm/iommu.h>
+#endif
 
 #ifndef iommu_call
 # define iommu_call(ops, fn, args...) ((ops)->fn(args))
@@ -345,7 +347,9 @@ extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
 #endif
 
 struct domain_iommu {
+#ifdef CONFIG_HAS_PASSTHROUGH
     struct arch_iommu arch;
+#endif
 
     /* iommu_ops */
     const struct iommu_ops *platform_ops;
-- 
2.43.0


