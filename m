Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C313784AB7B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 02:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676579.1052759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8w-0007gJ-7p; Tue, 06 Feb 2024 01:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676579.1052759; Tue, 06 Feb 2024 01:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8w-0007dS-3V; Tue, 06 Feb 2024 01:20:58 +0000
Received: by outflank-mailman (input) for mailman id 676579;
 Tue, 06 Feb 2024 01:20:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXA8v-0007Zy-6V
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 01:20:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f96eec07-c48d-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 02:20:55 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a271a28aeb4so714699466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 17:20:55 -0800 (PST)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a3726a5e5fdsm486803ejd.95.2024.02.05.17.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 17:20:53 -0800 (PST)
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
X-Inumbo-ID: f96eec07-c48d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707182453; x=1707787253; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/yrXJJsJhqpr0r2UtYZz4VSbTISscV6gheiVUuHW1M=;
        b=O3hzLTzQltj0zjGpOT5vQMX96rLR3LiJlBi++aF/6sjc7DYBSFjKBKDPTopZ5HRvrw
         JFP80InIu+spPZqtxfnx6bGXPq+XnkOuutWnPqDxyYbmWQUdZMcX6S7kHISQ7qvPhG/W
         Oq2vPAEBBhI8/6rihjec6GIqVZht7nHz64h18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707182453; x=1707787253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/yrXJJsJhqpr0r2UtYZz4VSbTISscV6gheiVUuHW1M=;
        b=E9GWTo1n5dllHFX/LTI2EaF9yQ3WvySuPCv7eTc8FE4KqXe+pRcAb9KLzz+tKtKNzK
         qBZ6A1kvo4wxhqIME95/gBys27PtY+Yem7cD4KHCzmsD/1E9rSRbZd33r+BxASbiAhqv
         UWzz+Md4RwxeyI+dlJI76pPGpNwxZu3pcn+olHya2ltVDx196dvuClMMaBg7XtH+wcvO
         vxTFhsEVWbx5Fz1T1P9WCYUyZB680O5EUYnHTOlStt4DtCk0P46uHeAoKz4LVkVUBxHv
         Wtvg/WC0ceN3ITxjK2uLcJaU0FjRIe8PCVbSOYAptHGGGZrOAszkm447ZXEXaVNGxXdq
         rFBw==
X-Gm-Message-State: AOJu0YzTKy/LJpqfTDsGZQOaa+jcmFA8Ynn1MXgsTARO1c0RF0UYHk48
	tcP706Gq2PYaZxdxiuVwTXqLC9I4+NFRXEOlxrWcCoe8V+PhH94e+mlw9EKDqy2eqLlKwke3UcP
	twho=
X-Google-Smtp-Source: AGHT+IFz7wN1YZXcim1jMkDN2nlXE79nJzM5CRYWjwIr9wKdmhWJhE07gZMct6I6hchSFwuOHrq0Jg==
X-Received: by 2002:a17:906:f149:b0:a35:42d0:5d61 with SMTP id gw9-20020a170906f14900b00a3542d05d61mr742736ejb.58.1707182453601;
        Mon, 05 Feb 2024 17:20:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUlrbboXAtOCOdIpCONVHZAzqIuLKcoSWYRquXj2dK9z5g87ypseXi3osVX17hipHn9hXCYvSjhOaBcru5PZs50K4ShNJ0O+YxgOktx8rPzXUOBWsHWlB/xkTgkZojHWu0RPuZIBFOs+vMnIXILW30W/fldC8dfXlZzQ0hd7fM=
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/6] svm: Improve type of cpu_has_svm_feature
Date: Tue,  6 Feb 2024 01:20:47 +0000
Message-Id: <20240206012051.3564035-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240206012051.3564035-1-george.dunlap@cloud.com>
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The "effective type" of the cpu_has_svm_feature macro is effectively
an unsigned log with one bit set (or not); at least one place someone
felt compelled to do a !! to make sure that they got a boolean out of
it.

Ideally the whole of this would be folded into the cpufeature.h
infrastructure.  But for now, duplicate the more type-safe static
inlines in that file, and remove the !!.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/svm.c             | 2 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 5741287355..40bc1ffbc6 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2580,7 +2580,7 @@ const struct hvm_function_table * __init start_svm(void)
     if ( !printed )
         printk(" - none\n");
 
-    svm_function_table.hap_supported = !!cpu_has_svm_npt;
+    svm_function_table.hap_supported = cpu_has_svm_npt;
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 687d35be40..9e9a148845 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -38,7 +38,10 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
 
-#define cpu_has_svm_feature(f) (svm_feature_flags & (1u << (f)))
+static inline bool cpu_has_svm_feature(unsigned int feat)
+{
+    return svm_feature_flags & (1u << (feat));
+}
 #define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
 #define cpu_has_svm_lbrv      cpu_has_svm_feature(SVM_FEATURE_LBRV)
 #define cpu_has_svm_svml      cpu_has_svm_feature(SVM_FEATURE_SVML)
-- 
2.25.1


