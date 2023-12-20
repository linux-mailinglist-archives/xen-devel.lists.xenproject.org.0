Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F981A011
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657804.1026925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws4-0003pk-Ag; Wed, 20 Dec 2023 13:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657804.1026925; Wed, 20 Dec 2023 13:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFws4-0003nE-6r; Wed, 20 Dec 2023 13:44:24 +0000
Received: by outflank-mailman (input) for mailman id 657804;
 Wed, 20 Dec 2023 13:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFws2-0003i3-Qx
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:44:22 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ba08ec-9f3d-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 14:44:20 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c6ea99429so58016745e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 05:44:20 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 w20-20020a05600c475400b0040b4fca8620sm7448052wmo.37.2023.12.20.05.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 05:44:19 -0800 (PST)
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
X-Inumbo-ID: e0ba08ec-9f3d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703079860; x=1703684660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUEnh4ySfa83i4PpobooNYikWrP4B6C0g81JCycd+/A=;
        b=ZeDLtGY4YI/tDOV+sfLBFFXoOQ3bFeRAvnhAbVVhTbvDmWW/MMOLLaBFWHfJEKwX0T
         6L4WMnATH6sWDDi8wAk0ZrQ9VNZqhpSBZdiolgL47XnpWrhpLDBR7vRmcmDhzZNV+UWw
         H0qzUvjDtR4IfilaDjO9RWcLgIuFC13L5yTuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703079860; x=1703684660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUEnh4ySfa83i4PpobooNYikWrP4B6C0g81JCycd+/A=;
        b=sD6CAqghNmJ6Ot1DLrsbiPZB+F4+Lp6q6Pr1ibwPgHR/7JmzcE08K2KgAnEb1+TAqq
         PYg0MdnOcc/cZCpMNrs87Tc09ch2xaGgZq+b1P6JHXLyp3St9bypD6vMjLp2lE9r7Ox4
         bmzbfCqZP/bDXTmwEh/SDPBoBTRFIy3DDYKV7lvoR2YX5F38Mdl/di1ass4SvktglRLK
         f5OdeLNed2/XIucDZ6eW40UcxaEWVpm9RAX3VFN/Um6m8Ab+NcBcNkAkqaen6xeom0PP
         VrPtPwGrkcYkzjOeuhOSoXbym+JH53fPJmALpAXIyIEnFZdakszZzIuQp3Od5j8pPfxU
         /tNg==
X-Gm-Message-State: AOJu0YwygrjQyNTncQB8I18+jFYg3vTu3CzATs6ixfYirocGdFQVntL2
	Duvo8ps/Yl5bk/XxDtq2JCB89Dpi4H6MKHKR+8M=
X-Google-Smtp-Source: AGHT+IFgkqe7gQD+UyN1PxMXVqucq08UDnelSZ/xbqtJuMa2X3dBbXZzvpJzuUkoCZOVF0KuQN2Nqg==
X-Received: by 2002:a05:600c:3c8e:b0:40c:617b:16ae with SMTP id bg14-20020a05600c3c8e00b0040c617b16aemr3893367wmb.67.1703079860193;
        Wed, 20 Dec 2023 05:44:20 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 2/6] amd-vi: set IOMMU page table levels based on guest reported paddr width
Date: Wed, 20 Dec 2023 14:43:42 +0100
Message-ID: <20231220134346.22430-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134346.22430-1-roger.pau@citrix.com>
References: <20231220134346.22430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

However take into account the minimum number of levels required by unity maps
when setting the page table levels.

The previous setting of the page table levels for PV guests based on the
highest RAM address was bogus, as there can be other non-RAM regions past the
highest RAM address that need to be mapped, for example device MMIO.

For HVM we also take amd_iommu_min_paging_mode into account, however if unity
maps require more than 4 levels attempting to add those will currently fail at
the p2m level, as 4 levels is the maximum supported.

Fixes: 0700c962ac2d ('Add AMD IOMMU support into hypervisor')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Avoid possible UB if domain_max_paddr_bits() ever returns 64.

Changes since v2:
 - Use the renamed domain_max_paddr_bits().

Changes since v1:
 - Use paging_max_paddr_bits() instead of hardcoding
   DEFAULT_DOMAIN_ADDRESS_WIDTH.
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 6bc73dc21052..146cf60084f4 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
 static int cf_check amd_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    int pglvl = amd_iommu_get_paging_mode(
+                1UL << (domain_max_paddr_bits(d) - PAGE_SHIFT));
+
+    if ( pglvl < 0 )
+        return pglvl;
 
     /*
-     * Choose the number of levels for the IOMMU page tables.
-     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
-     *   RAM) above the 512G boundary.
-     * - HVM could in principle use 3 or 4 depending on how much guest
-     *   physical address space we give it, but this isn't known yet so use 4
-     *   unilaterally.
-     * - Unity maps may require an even higher number.
+     * Choose the number of levels for the IOMMU page tables, taking into
+     * account unity maps.
      */
-    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
-            is_hvm_domain(d)
-            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
-            : get_upper_mfn_bound() + 1),
-        amd_iommu_min_paging_mode);
+    hd->arch.amd.paging_mode = max(pglvl, amd_iommu_min_paging_mode);
 
     return 0;
 }
-- 
2.43.0


