Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27986A1B517
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 13:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876703.1287065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbINH-0007s5-0S; Fri, 24 Jan 2025 12:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876703.1287065; Fri, 24 Jan 2025 12:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbING-0007q7-Tw; Fri, 24 Jan 2025 12:01:22 +0000
Received: by outflank-mailman (input) for mailman id 876703;
 Fri, 24 Jan 2025 12:01:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbINF-0007hy-PJ
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 12:01:21 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec466dff-da4a-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 13:01:19 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so3917706a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 04:01:19 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc18619351sm1097563a12.5.2025.01.24.04.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:01:18 -0800 (PST)
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
X-Inumbo-ID: ec466dff-da4a-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737720079; x=1738324879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c2aZdvI/tbV2jY/GC3KfB8zoMuoAgzT2lT7lgwZi+o=;
        b=pLXBBQ8Yb1Ji0UKZVibD6anqwq5PmLrHcq6uBNaT287b7pBz/0DQ0tiEIMc+ZaWIOV
         32Dxj51cp9YNiFylI/H4qhwxEB/WDx/pQZsbW4g1J/WlfU2Fr8cXCW6N+UWTYdoiLW7C
         SxGctemr51Bm0ooktuc8o8Q1DTQf7Pg2GaduU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720079; x=1738324879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9c2aZdvI/tbV2jY/GC3KfB8zoMuoAgzT2lT7lgwZi+o=;
        b=TqIneucwXtEyog3tRl/6MSgr0aF9Cv0vRfItOWLRuFmX4eQNW32h2bhCMt2wXZUAv4
         LmeNY8g6k5AnBjWr1cbba4GFOFgVef2uej7fWBDMRC1F9fZtiXewHuTu2yA1pP8K4kyX
         h/H2t0TYIcLekVJEoEQv07Fp8uHJ2dr/EGxtFHFzUK1+inhUCiJmyEFp1lfggZqAtBGv
         cpKK8cdjhxcOxm0dfXblOMR4szJQ8EAVcqx5ldwZW6SZXcXIpbk6rvCEbz3n2zodE0kB
         v7+ROXSa9KhrIq89hkdUni4PTUeG4bDLylT4L2LQK8FVekez7yDh1802To0jUnRtv7OT
         dFNQ==
X-Gm-Message-State: AOJu0Yz1u8LmEw2YLNqpiZe4KzAfaCyiH5ddW6Gal7x8NHyPzJrRc+X0
	kSsFUZGc1HrxRLFmn/NAtm6uTXelIj2aX8/+gHti4Q51e3YuUszldwEQFOiRSd3y7ExrtPI8teh
	V
X-Gm-Gg: ASbGncvF+j/d0eO+ifBuSS8kYwTtbpD3EPNUigu2vb/kb2vxHTBnO5xDxCT1TU6Stlk
	p+ziDgHlKoI5Iq3BfB5T9+T66CN6qppJmVDFekHYiwGgNX4TokL8Jq19zbwKcvYkfMAWu4AU2+q
	Lnt7r18VZIqS8oVqOPVeGIanTb4cGS7zqFqLJcYI/JkAg0p2j52FQdmcdrOBMhHRmrJ4U7aA4kB
	AfmBDTy6OVlaSSuQm/DA0M7k2yHK7ooX89n2fkGSxGOhQCMqHI+Nlx6MeP7M3XIablpRqFlt6gU
	OdSg9mNEa8qEvy4=
X-Google-Smtp-Source: AGHT+IGtakv+VJopi6Jb6eXJ3iLF9dXAUCjJf06TVnJ0NdxUWVim75lvthE0amCrD/9kE8DxqYdmCQ==
X-Received: by 2002:a05:6402:348b:b0:5db:67a7:e75e with SMTP id 4fb4d7f45d1cf-5db7d2ec452mr27893397a12.5.1737720079038;
        Fri, 24 Jan 2025 04:01:19 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/5] x86/iommu: check for CMPXCHG16B when enabling IOMMU
Date: Fri, 24 Jan 2025 13:01:07 +0100
Message-ID: <20250124120112.56678-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124120112.56678-1-roger.pau@citrix.com>
References: <20250124120112.56678-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Teddy Astie <teddy.astie@vates.tech>

All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
initialisation time, and remove the effectively-dead logic for the
non-cx16 case.

If the local APICs support x2APIC mode the IOMMU support for interrupt
remapping will be checked earlier using a specific helper.  If no support
for CX16 is detected by that earlier hook disable the IOMMU at that point
and prevent further poking for CX16 later in the boot process, which would
also fail.

There's a possible corner case when running virtualized, and the underlying
hypervisor exposing an IOMMU but no CMPXCHG16B support.  In which case
ignoring the IOMMU is fine, albeit the most natural would be for the
underlying hypervisor to also expose CMPXCHG16B support if an IOMMU is
available to the VM.

Note this change only introduces the checks, but doesn't remove the now
stale checks for CX16 support sprinkled in the IOMMU code.  Further changes
will take care of that.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since pickup:
 - Unify all CX16 checks into a single patch.
---
 xen/drivers/passthrough/amd/iommu_intr.c    | 13 +++++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++++++
 xen/drivers/passthrough/vtd/intremap.c      | 13 +++++++++++++
 xen/drivers/passthrough/vtd/iommu.c         |  7 +++++++
 4 files changed, 39 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 7fc796dec25b..f07fd9e3d970 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -649,6 +649,19 @@ bool __init cf_check iov_supports_xt(void)
     if ( !iommu_enable || !iommu_intremap )
         return false;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        AMD_IOMMU_ERROR("no CMPXCHG16B support, disabling IOMMU\n");
+        /*
+         * Disable IOMMU support at once: there's no reason to check for CX16
+         * yet again when attempting to initialize IOMMU DMA remapping
+         * functionality or interrupt remapping without x2APIC support.
+         */
+        iommu_enable = false;
+        iommu_intremap = iommu_intremap_off;
+        return false;
+    }
+
     if ( amd_iommu_prepare(true) )
         return false;
 
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 73dcc4a2dd0c..f96f59440bcc 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -309,6 +309,12 @@ static int __init cf_check iov_detect(void)
     if ( !iommu_enable && !iommu_intremap )
         return 0;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        AMD_IOMMU_ERROR("no CMPXCHG16B support, disabling IOMMU\n");
+        return -ENODEV;
+    }
+
     if ( (init_done ? amd_iommu_init_late()
                     : amd_iommu_init(false)) != 0 )
     {
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index c504852eb818..233db5cb64de 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -150,6 +150,19 @@ bool __init cf_check intel_iommu_supports_eim(void)
     if ( !iommu_qinval || !iommu_intremap || list_empty(&acpi_drhd_units) )
         return false;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk(XENLOG_ERR VTDPREFIX "no CMPXCHG16B support, disabling IOMMU\n");
+        /*
+         * Disable IOMMU support at once: there's no reason to check for CX16
+         * yet again when attempting to initialize IOMMU DMA remapping
+         * functionality or interrupt remapping without x2APIC support.
+         */
+        iommu_enable = false;
+        iommu_intremap = iommu_intremap_off;
+        return false;
+    }
+
     /* We MUST have a DRHD unit for each IOAPIC. */
     for ( apic = 0; apic < nr_ioapics; apic++ )
         if ( !ioapic_to_drhd(IO_APIC_ID(apic)) )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 27a4d1640189..3daedc4f5593 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2633,6 +2633,13 @@ static int __init cf_check vtd_setup(void)
     int ret;
     bool reg_inval_supported = true;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk(XENLOG_ERR VTDPREFIX "no CMPXCHG16B support, disabling IOMMU\n");
+        ret = -ENODEV;
+        goto error;
+    }
+
     if ( list_empty(&acpi_drhd_units) )
     {
         ret = -ENODEV;
-- 
2.46.0


