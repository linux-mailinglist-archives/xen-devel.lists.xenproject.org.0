Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB52814A51
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655132.1022838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92Y-0007Sm-Ho; Fri, 15 Dec 2023 14:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655132.1022838; Fri, 15 Dec 2023 14:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92Y-0007Mq-DK; Fri, 15 Dec 2023 14:19:46 +0000
Received: by outflank-mailman (input) for mailman id 655132;
 Fri, 15 Dec 2023 14:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE92W-0007Jp-Qd
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:19:44 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea13028-9b54-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:18:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso8281565e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:18:51 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 jb4-20020a05600c54e400b0040c5cf930e6sm10304507wmb.19.2023.12.15.06.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:18:50 -0800 (PST)
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
X-Inumbo-ID: dea13028-9b54-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702649930; x=1703254730; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=micbYiHo1/eCgvDXtChxHAYytkH71LDeDIW7HuEr1a4=;
        b=gHuIKTHMNPbo5fam2PXpRNXWTVdFAxLaQAfa95l5BshF7aMQIMVY58N3g2CTed6ABD
         lw6v+EOu7nOOq4uwdXCcS/tHTTUfwDEmtH3a4Pcd1CKvn/oLXf9s2KhQYYmywPvCD2sb
         kml/WhEBQN9S1uaXWRNYEo+c2Mzg9wQPVDi5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649930; x=1703254730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=micbYiHo1/eCgvDXtChxHAYytkH71LDeDIW7HuEr1a4=;
        b=vJgHS0V0bDqop2Q1dHFWTosuraE92p/c9d91Dp80KoU534VxZ+0ZuBGhz0MFivl1kR
         P6tQqhXr11zxNByQ+7gshWaPtSha6BMTcAjpPz/Y6gs0JHJg/409W4YDtGEzB6rMp5Dw
         UMwhnVTWkMrTkW/7fWBfpGvE4/JZssoGiXX8cQbAj1dbBQwp6MoyhPFBX4NhGIWMwIfO
         pcHnxPZDjBBB/eO9vrOSqpI0F+2FJw8DgE76otegfDJ5Lx77LGYr1c6pXDBjMPO+6hfW
         7jvyQ2Ctcpz7VpQoyjhrR4F5B/IgfFiKO7NzPTU2YCsBm0g6fnH1hP1RwEPqmLfS6y7R
         ErLQ==
X-Gm-Message-State: AOJu0Ywh4B5yJZY9rcEKrmgFMhejVNQvHhQo6R99NrHlFgdajcUpK7u5
	ukWlg+oWMTve4TmykgedpJwUMQiisgxsx4Crm14=
X-Google-Smtp-Source: AGHT+IGWmSEZYLoT7xDKGoqko8aP4/fZXUAfOWv+AmUwoE7mtuX1+6GMblkV4W+DGOpW3sm4PuQ7QQ==
X-Received: by 2002:a05:600c:1c05:b0:40c:3856:5e07 with SMTP id j5-20020a05600c1c0500b0040c38565e07mr6063639wms.9.1702649930379;
        Fri, 15 Dec 2023 06:18:50 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 1/7] iommu/vt-d: do not assume page table levels for quarantine domain
Date: Fri, 15 Dec 2023 15:18:26 +0100
Message-ID: <20231215141832.9492-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215141832.9492-1-roger.pau@citrix.com>
References: <20231215141832.9492-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Like XSA-445, do not assume IOMMU page table levels on VT-d are always set
based on DEFAULT_DOMAIN_ADDRESS_WIDTH and instead fetch the value set by
intel_iommu_domain_init() from the domain iommu structure.  This prevents
changes to intel_iommu_domain_init() possibly getting the levels out of sync
with what intel_iommu_quarantine_init() expects.

No functional change, since on Intel domains are hardcoded to use
DEFAULT_DOMAIN_ADDRESS_WIDTH.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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


