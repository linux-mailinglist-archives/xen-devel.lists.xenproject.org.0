Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98D92A5EB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 17:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755511.1163899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqVw-0001Fj-Nz; Mon, 08 Jul 2024 15:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755511.1163899; Mon, 08 Jul 2024 15:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqVw-0001E7-KK; Mon, 08 Jul 2024 15:42:52 +0000
Received: by outflank-mailman (input) for mailman id 755511;
 Mon, 08 Jul 2024 15:42:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z6vo=OI=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sQqVw-0001Dn-0y
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 15:42:52 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bafb261c-3d40-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 17:42:49 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52ea929ea56so4375486e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 08:42:49 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6de0a2sm4779866b.54.2024.07.08.08.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 08:42:48 -0700 (PDT)
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
X-Inumbo-ID: bafb261c-3d40-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720453369; x=1721058169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOWHHJ/WLKag5d4dSpmArbqSpx+lbCaXcUbRJTR2rAE=;
        b=L7v7OPNrTX0vg8//+yxfd2/aF83omDwurZRO9bKetPlGoSSL+Rde4BXC3CPvypmc1t
         laoUfLbI737vkZxli/1gkOOjSo3S3GadBL31ZSy5840fDrKfjqDncf/idZCTlxxNewmk
         Q1Bgs6oxblUF2ZSv9cqyom3MuQQKGb3acjS/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720453369; x=1721058169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOWHHJ/WLKag5d4dSpmArbqSpx+lbCaXcUbRJTR2rAE=;
        b=lgZezHlXKQfZHZggPVCx0basBKfTXruu+e2OhOGMYKHcNpbEnxhDC9OrK5I+DSnRak
         9+9KSy1V4fT+iMCh+mueGIbya395hrSduXCZxr7teYsWpVw7i+feNYDvuSUJh24+XhlD
         +Wtwk1T4NwqlAGkOfGBK6gR5bJP2WmXNHkDaTSEXRkccsjppEqYs/NP4cjWrWYoct3Cn
         zNzFzvXwXMfOuSmLGMFf5VclqhjLoD2RocdBu1ydKQF3V3j8kBG4ATI6vRaP8Z82cqh+
         sZNq+1CEV3umTvrKEWiLvoIacGivuTMR1DeNGZsEWJR7XctZBXaQTigRpCKwR1syobj5
         rvYg==
X-Gm-Message-State: AOJu0YyXWFCT+0Dr8bDtU3ae9cIyq10tRDe9ieriajLpTXr0H2Luo/BL
	CHamWvLeKzabMoPPNtTOwdhI8Ox56fDMMP8aW0A2UUZg3jJkM6io9DsfeyyZWyYck87LsCyD38D
	b
X-Google-Smtp-Source: AGHT+IG2j6nH3diUoKAqvmeMFvNGrWzan3uyQjw6FifmbxYBEG1krlL42i0VBZH38zG2YGLgyT/0xw==
X-Received: by 2002:ac2:5e6c:0:b0:52e:9f1b:517 with SMTP id 2adb3069b0e04-52ea0622d10mr9929242e87.25.1720453368568;
        Mon, 08 Jul 2024 08:42:48 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [RFC XEN PATCH] x86/cpuid: Expose max_vcpus field in HVM hypervisor leaf
Date: Mon,  8 Jul 2024 16:42:21 +0100
Message-Id: <c0a9f52107e22957daaa5b1b0e05e4160db5f064.1720452354.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
startup.

There are efforts to support a maximum of 128 vCPUs, which would involve
bumping the OVMF constant from 64 to 128.

However, it would be more future-proof for OVMF to access the maximum
number of vCPUs for a domain and set itself up appropriately at
run-time.

For OVMF to access the maximum vCPU count, Xen will have to expose this
property via cpuid.

This patch exposes the max_vcpus field via cpuid on the HVM hypervisor
leaf in edx.

Tested on HVM guests running Ubuntu 22.04 LTS and Windows 10 x64.

GitLab ticket: https://gitlab.com/xen-project/xen/-/issues/191

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/traps.c                | 4 ++++
 xen/include/public/arch-x86/cpuid.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ee91fc56b125..b439ee94f562 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1169,6 +1169,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        /* Indicate presence of max vcpus and set it in edx */
+        res->a |= XEN_HVM_CPUID_MAX_VCPUS_PRESENT;
+        res->d = d->max_vcpus;
+
         /*
          * Per-vCPU event channel upcalls are implemented and work
          * correctly with PIRQs routed over event channels.
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 3bb0dd249ff9..a11c9b684308 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -87,6 +87,7 @@
  * Sub-leaf 0: EAX: Features
  * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT flag)
  * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT flag)
+ * Sub-leaf 0: EDX: max vcpus (iff EAX has XEN_HVM_CPUID_MAX_VCPUS_PRESENT flag)
  */
 #define XEN_HVM_CPUID_APIC_ACCESS_VIRT (1u << 0) /* Virtualized APIC registers */
 #define XEN_HVM_CPUID_X2APIC_VIRT      (1u << 1) /* Virtualized x2APIC accesses */
@@ -107,6 +108,8 @@
  */
 #define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
 
+#define XEN_HVM_CPUID_MAX_VCPUS_PRESENT (1u << 7) /* max vpcus is present in EDX */
+
 /*
  * Leaf 6 (0x40000x05)
  * PV-specific parameters
-- 
2.34.1


