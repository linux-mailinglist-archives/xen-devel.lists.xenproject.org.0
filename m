Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016C7EEF30
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634961.990618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vSQ-0007t8-99; Fri, 17 Nov 2023 09:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634961.990618; Fri, 17 Nov 2023 09:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vSQ-0007r8-5Y; Fri, 17 Nov 2023 09:48:14 +0000
Received: by outflank-mailman (input) for mailman id 634961;
 Fri, 17 Nov 2023 09:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3vSP-0007p0-7m
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:48:13 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c50d818-852e-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 10:48:12 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507b9408c61so2482600e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 01:48:12 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p8-20020adff208000000b0032da75af3easm1754119wro.80.2023.11.17.01.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 01:48:11 -0800 (PST)
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
X-Inumbo-ID: 6c50d818-852e-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700214492; x=1700819292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14W9TQ4ErT83JuBFcjXmKlZRmBO8QnfuQD3+/1nam+w=;
        b=ICZXsxFvRV0OAbdY81cBVOmcrGyE/pGUzGkwlbwd2FstdBdUgFHWubNeba1IAyFfFZ
         D59YijrLDGs5SaLLJkco5H3CEK0ueBXW5VVXLTmYPXepe7/eKSZ32uPdI0QPXVyqAeRt
         aq+bUIZxZ6GuLM+G4A8qR6DQ1wQe+BxaXGFXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214492; x=1700819292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14W9TQ4ErT83JuBFcjXmKlZRmBO8QnfuQD3+/1nam+w=;
        b=Zrx1XtU6HmUyGW/UTg5lQi0T0FJaRunv+LdEUdUjB2L1AKZOHviA0dBNZ5qetNibld
         cIzXXC2DfM/7bXf3tF7IMv6qhuBbkXAIoxtzfPDyTntBvuynh8O9T3UxViEFkIXFZP9U
         y9foCyX9jiRRUx/WUSGZqlyHk48hXb7L+oA3YapIvFNCF9VV+2zOYafIaNyDfO4CdE83
         QsbJ83MS9QlrlMwnE7PG7oWne98UIPkl1TTV4F2FZe7Xx9fwUOI5yCjnjfCYdyaKfdhE
         HFTDLAwPjAxepvoXKbmPf4JIKvHk1z6qIViPplvevZGZlcWSP6+NRG3P3omHEeC+hwwh
         as2g==
X-Gm-Message-State: AOJu0YwYqxUHglr6jC99X6mrCRhdOb057+kGB93kD9JNXG/vCDyEr5aH
	x1638ZMc5uyEkBNQASgO8OugvsziJLITVM2i6Jk=
X-Google-Smtp-Source: AGHT+IG7BD7sg4RKTTHhLpcIXugWZZXYVgnmSbO2lXN/5DElldJzmOO33eb7CQCIUzUpHWXURaHP9g==
X-Received: by 2002:ac2:5e8b:0:b0:509:4587:bdd0 with SMTP id b11-20020ac25e8b000000b005094587bdd0mr13530628lfq.7.1700214492128;
        Fri, 17 Nov 2023 01:48:12 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV and HVM
Date: Fri, 17 Nov 2023 10:47:47 +0100
Message-ID: <20231117094749.81091-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094749.81091-1-roger.pau@citrix.com>
References: <20231117094749.81091-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Using different page table levels for HVM or PV guest is not helpful, and is
not inline with the IOMMU implementation used by the other architecture vendor
(VT-d).

Switch to uniformly use DEFAULT_DOMAIN_ADDRESS_WIDTH in order to set the AMD-Vi
page table levels.

Note using the max RAM address for PV was bogus anyway, as there's no guarantee
there can't be device MMIO or reserved regions past the maximum RAM region.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 6bc73dc21052..f9e749d74da2 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -359,21 +359,17 @@ int __read_mostly amd_iommu_min_paging_mode = 1;
 static int cf_check amd_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    int pgmode = amd_iommu_get_paging_mode(
+        1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT));
+
+    if ( pgmode < 0 )
+        return pgmode;
 
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
+    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);
 
     return 0;
 }
-- 
2.42.0


