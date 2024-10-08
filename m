Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE29945C7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 12:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812995.1225758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7kS-0006Z0-5b; Tue, 08 Oct 2024 10:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812995.1225758; Tue, 08 Oct 2024 10:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy7kS-0006Vr-1S; Tue, 08 Oct 2024 10:47:24 +0000
Received: by outflank-mailman (input) for mailman id 812995;
 Tue, 08 Oct 2024 10:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rYz=RE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sy7kP-0006Vl-MZ
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 10:47:21 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b10a8d1c-8562-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 12:47:19 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5398e3f43f3so6250916e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 03:47:19 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7860cbsm489760866b.120.2024.10.08.03.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 03:47:18 -0700 (PDT)
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
X-Inumbo-ID: b10a8d1c-8562-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728384439; x=1728989239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eg++UNuGwihTMeqEph3/1UZvbpjvouqeJeWvfpFRaaM=;
        b=HQemkBrRZWXGEUq/6WYk4p1r9ean4Wzmi/mg1WUQolZqY7m1mGcpmCUgXPc42dWa2E
         U/V33Tah0S/O5KhwOYmxJtW93Gij3+7MfiE0RyXPZX1s9a+ihFEQudd3jeYMhQbIOb+d
         1jHsiq8gGeDyvDwW5cMf+p+NWEbdrSGyxsyMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728384439; x=1728989239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eg++UNuGwihTMeqEph3/1UZvbpjvouqeJeWvfpFRaaM=;
        b=I0h1vuyiDxF2hRj0n7EfWSyRsq4MwiLdgkzirwKtc0kuXfBhgk8zF369wqEuwwUZwE
         vHRyHbohYM8tjt3aO91OXTzQFnZ0SUBzJ0CNSBfQwQlWaFX6EJnAFw3K/YxD1ghoNGSf
         JYWjxlbEJCDtb06pNwBYvU5lLRQgmEuxIe85SBX7Uleoe187U4i+xFtJ+L+FgSjKrru1
         CsOD/3mlZM7icmepVumWZLJTaKmL+cPH4Y0nWae/IspeZodV173idmnLeN+tMhVqZB32
         3YenErm0amsIU/Waxzr6zijjRrfPEuKt35MD+QeclqgPPVVIMvrFuWfmfZwWa2KkzoEJ
         eyGA==
X-Gm-Message-State: AOJu0YytuGQfQwFApJAa/GD9v0OP6q4bICTHdLfTnP9czaI5gHOUWZcv
	CFkCOQSwIQ3l6/ADR/eFkKGkWTkdkeatvinI2DvDZH8Wo1f3hJUeLGlAMAm4OsFJXnHidZvrlCG
	8
X-Google-Smtp-Source: AGHT+IGlsedWb3JNFYZnMZpvr0kKZ/pocJ/gYOQya5Hsh1jDsWYIZfdaQ3OJN3v/n8LnEGgFWTdUmg==
X-Received: by 2002:a05:6512:3d93:b0:52c:e326:f4cf with SMTP id 2adb3069b0e04-539ab84e3a7mr8146475e87.3.1728384438751;
        Tue, 08 Oct 2024 03:47:18 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>
Subject: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD is not behind any IOMMU
Date: Tue,  8 Oct 2024 12:47:06 +0200
Message-ID: <20241008104706.74001-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

IVMD table contains restrictions about memory which must be mandatory assigned
to devices (and which permissions it should use), or memory that should be
never accessible to devices.

Some hardware however contains ranges in IVMD that reference devices outside of
the IVHD tables (in other words, devices not behind any IOMMU).  Such mismatch
will cause Xen to fail in register_range_for_device(), ultimately leading to
the IOMMU being disabled, and Xen crashing as x2APIC support might be already
enabled and relying on the IOMMU functionality.

Relax IVMD parsing: allow IVMD blocks to reference devices not assigned to any
IOMMU.  It's impossible for Xen to fulfill the requirement in the IVMD block if
the device is not behind any IOMMU, but it's no worse than booting without
IOMMU support, and thus not parsing ACPI IVRS in the first place.

Reported-by: Willi Junga <xenproject@ymy.be>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 3f5508eba049..c416120326c9 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -248,8 +248,9 @@ static int __init register_range_for_device(
     iommu = find_iommu_for_device(seg, bdf);
     if ( !iommu )
     {
-        AMD_IOMMU_ERROR("IVMD: no IOMMU for Dev_Id %#x\n", bdf);
-        return -ENODEV;
+        AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",
+                       &PCI_SBDF(seg, bdf));
+        return 0;
     }
     req = ivrs_mappings[bdf].dte_requestor_id;
 
-- 
2.46.0


