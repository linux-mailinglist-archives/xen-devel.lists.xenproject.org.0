Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89775814A55
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655137.1022893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92d-0000ZI-JS; Fri, 15 Dec 2023 14:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655137.1022893; Fri, 15 Dec 2023 14:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92d-0000VQ-EO; Fri, 15 Dec 2023 14:19:51 +0000
Received: by outflank-mailman (input) for mailman id 655137;
 Fri, 15 Dec 2023 14:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE92b-0007Jp-7c
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:19:49 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0166d80-9b54-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:18:53 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c2c5a8150so6716615e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:18:53 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 jb4-20020a05600c54e400b0040c5cf930e6sm10304639wmb.19.2023.12.15.06.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:18:52 -0800 (PST)
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
X-Inumbo-ID: e0166d80-9b54-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702649933; x=1703254733; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDw1hBjsMh2mJKl/ow003iacu/0pNjCq+t0PtXkwl9g=;
        b=MA9kWeo8D7n3EFjRQHy72QWjaVBKDBDkyJ8xGyQ02Y/M3Dq5E64UoPpFroWejcvD98
         qMFgJ1G8lG9jdN5RS9xnwL9A7XwjbRHbc+hbfWEQWYdcvYwGQTbtktEefHajCejCZuxv
         YmL+lmOZRo49+Tsoyytqzvopnsdv32S8YPO8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649933; x=1703254733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDw1hBjsMh2mJKl/ow003iacu/0pNjCq+t0PtXkwl9g=;
        b=pEXLA/ORfObDc+ZVoAPpXnJ2WLLCom72LjAGqfbHB626XuRbL8x8xvcorbrHzFAL6A
         Y/QmdsHkRuQv0Z8byHOrFQcodUiU536JPkvqYbCmPHXL+yxazVI4V6F5dofuQ6nI7/9f
         jtCVah7nY7BsuOk/kjahYIlLv6po60dRuPgvE3Xp1Uhwvwz2TTLgUVUfzkCw5p3weIu0
         tkyRG78T9SIEZDdpDDuW4RD0mC6K63e9BnfSBhmzKh48dxAhGf61G/neq9eoO7c4aYUL
         dfpTfobxzEXDtvqmX/BY6OfIVnTAwbcFruRD/7r2Dbv2Jchej0cbxq1WWeYv5QgaVhMc
         dIIA==
X-Gm-Message-State: AOJu0YxYqty5jJTvK89u1QxROx2/ZJ7N2eNiIK1l5ITxUwf77UYwASKO
	uI3jBtcAefAZsuI6kWiDPshDql+LLYDx+X6Socw=
X-Google-Smtp-Source: AGHT+IEKFd55/ZjZslr+01W7mD8pITw5hJ9VLgKPE1npdtdCJtacXmzMitWqw+BqgZzK1lArug7B/w==
X-Received: by 2002:a05:600c:1705:b0:40b:3fc7:c887 with SMTP id c5-20020a05600c170500b0040b3fc7c887mr6586131wmn.20.1702649932808;
        Fri, 15 Dec 2023 06:18:52 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 3/7] amd-vi: set IOMMU page table levels based on guest reported paddr width
Date: Fri, 15 Dec 2023 15:18:28 +0100
Message-ID: <20231215141832.9492-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215141832.9492-1-roger.pau@citrix.com>
References: <20231215141832.9492-1-roger.pau@citrix.com>
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
---
Changes since v2:
 - Use the renamed domain_max_paddr_bits().

Changes since v1:
 - Use paging_max_paddr_bits() instead of hardcoding
   DEFAULT_DOMAIN_ADDRESS_WIDTH.
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 6bc73dc21052..cc3e2ccd5ed7 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
 static int cf_check amd_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    int pglvl = amd_iommu_get_paging_mode(
+                PFN_DOWN(1UL << domain_max_paddr_bits(d)));
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


