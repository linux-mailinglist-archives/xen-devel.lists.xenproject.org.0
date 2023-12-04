Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA335802EFA
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646677.1009202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tu-0003as-KG; Mon, 04 Dec 2023 09:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646677.1009202; Mon, 04 Dec 2023 09:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tu-0003Ux-FV; Mon, 04 Dec 2023 09:43:14 +0000
Received: by outflank-mailman (input) for mailman id 646677;
 Mon, 04 Dec 2023 09:43:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA5Ts-0003MS-OW
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:43:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89435b09-9289-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:43:10 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3332ad5b3e3so2854818f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:43:10 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z18-20020a5d44d2000000b003333dd777a4sm5331294wrr.46.2023.12.04.01.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:43:09 -0800 (PST)
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
X-Inumbo-ID: 89435b09-9289-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701682989; x=1702287789; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULwH7EoidMy9ekcGhF87RMh2vNMamy8OPFxqY9qAnWs=;
        b=I9WrZTr/Ll8kQrt9BXZZyPifFQV6V6hSXqhGIkEP9L3E/Pak6FSoK3cugnqhMOGE1e
         Db78y/SvSsc+VrCNZsjQIv6rLuddlhp5fi+maNv3FvwEz4KHOA7aXzYbp+aYftnREFri
         XPmp5GpYJNnCwlJon8Daj4fUL86x0zUNmIOOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682989; x=1702287789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULwH7EoidMy9ekcGhF87RMh2vNMamy8OPFxqY9qAnWs=;
        b=gPbXUwUtozs3CMciTnfBHI8G9quj0/XmpwgyfEdBfRtpwatDzQKKWB2y0FNEJp9cEA
         YeQtSkaKrIqi/XtpYml1hm8+iLQI0QjEyNYfD/s82AXWT+HsNdXuI3qOMBiguH3E9oVq
         cH3aoGrQ0rAIS+6Eu2K7nEE+S+Aq2N1ekG4498gG8Tkw7g7trCnYBP6D82Ng5UvM/cGV
         cqZLSLprhhxiTmKyzk+6xpYY4Qz6H1hrP60OCZm7mQMe4hcvFo3zAsT/A1BsHrH7cbEQ
         h22vyais9RLnLY1dG1Upzz995HW6bHaHTDrII4OpmPYI8T5q5MNUm/JROikwTacr1WiD
         b/KA==
X-Gm-Message-State: AOJu0YxqUqdPjwqrw666ItW5GfDO60cYPdrc2lWJMduO6ymoT0kpSJPN
	CmFgdM8GUzfggGcKmB3OyAV91kYvRnMfzYVG8Ew=
X-Google-Smtp-Source: AGHT+IHtmHJlmpV7+cbxj7f0oOEvGeRQshSi1pJpnGVGwoy79El2rTGA1sxG4112l88AgAbSsmcxGw==
X-Received: by 2002:a05:6000:100d:b0:333:2fd2:51e6 with SMTP id a13-20020a056000100d00b003332fd251e6mr2920439wrx.95.1701682989550;
        Mon, 04 Dec 2023 01:43:09 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 1/6] iommu/vt-d: do not assume page table levels for quarantine domain
Date: Mon,  4 Dec 2023 10:43:00 +0100
Message-ID: <20231204094305.59267-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204094305.59267-1-roger.pau@citrix.com>
References: <20231204094305.59267-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Like XSA-445, do not assume IOMMU page table levels on VT-d are always set
based on DEFAULT_DOMAIN_ADDRESS_WIDTH and instead fetch the value set by
intel_iommu_hwdom_init() from the domain iommu structure.  This prevents
changes to intel_iommu_hwdom_init() possibly getting the levels out of sync
with what intel_iommu_quarantine_init() expects.

No functional change, since on Intel domains are hardcoded to use
DEFAULT_DOMAIN_ADDRESS_WIDTH.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/drivers/passthrough/vtd/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index e13b7d99db40..bc6181c9f911 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -3162,7 +3162,7 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
 {
     struct domain_iommu *hd = dom_iommu(dom_io);
     struct page_info *pg;
-    unsigned int agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
+    unsigned int agaw = hd->arch.vtd.agaw;
     unsigned int level = agaw_to_level(agaw);
     const struct acpi_drhd_unit *drhd;
     const struct acpi_rmrr_unit *rmrr;
-- 
2.43.0


