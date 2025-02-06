Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB4A2A64D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 11:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882713.1292812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzRt-00023j-S9; Thu, 06 Feb 2025 10:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882713.1292812; Thu, 06 Feb 2025 10:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzRt-000214-OW; Thu, 06 Feb 2025 10:49:33 +0000
Received: by outflank-mailman (input) for mailman id 882713;
 Thu, 06 Feb 2025 10:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xST=U5=bounce.vates.tech=bounce-md_30504962.67a493b7.v1-c7b5e5191f3f44ddaecfd120a10a4d98@srs-se1.protection.inumbo.net>)
 id 1tfzRs-00020y-Dg
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 10:49:32 +0000
Received: from mail145-20.atl61.mandrillapp.com
 (mail145-20.atl61.mandrillapp.com [198.2.145.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09cfcd29-e478-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 11:49:29 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4YpYkv4Y13zCf9KCn
 for <xen-devel@lists.xenproject.org>; Thu,  6 Feb 2025 10:49:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c7b5e5191f3f44ddaecfd120a10a4d98; Thu, 06 Feb 2025 10:49:27 +0000
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
X-Inumbo-ID: 09cfcd29-e478-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1738838967; x=1739108967;
	bh=L4o2ZZgMga0nK/q0vLs6VvOXTbOpIP3PAVzgoEdo7vE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=YYAUZTOwsSYtRYYxAQqiBU8Hk3QzDLt4LkH6/u9P6feoaj31B8hm2mbs68PZUt1We
	 gWyxPGBH9GJCoubPSFuTIrJA4sTu86CqDEe/wHfPE5fFmTdnnkO55Gjq1nvJeJgZTY
	 HOQKxbf70ts6Q6C8+9tbf88bSvUt6zkKwY2dPjoR8YrGHDBXm/PMZqByrrLuu/wFol
	 zl21aYLobYMglFZXxAoyFAnA2VJR9NIAFcLA5v40+lPL0PSrSGpIj7TfjEjYxYLgwD
	 Yvlf6myEKYp8C9+XkzEexRDlI5bvz+Lo6yRi68Z62TuEbdaTLibDyVOft2wFlVBHhH
	 1CoQIGi2GVRvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1738838967; x=1739099467; i=teddy.astie@vates.tech;
	bh=L4o2ZZgMga0nK/q0vLs6VvOXTbOpIP3PAVzgoEdo7vE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Bui21VqQgjYCybM4iMw/deRmIsSiFZY8LAIiqW3ICeBwdoYiki2xQYmnqfQvukHVB
	 g7xpYTYejkJCuw51Ax/3eHx79tkNpLT5uoCPcNX8gJ1xdnnzPqxpIqjU55weasBoOJ
	 z5oAIh60LeCFtMkFwvSVP4QrPITOA17+EHtqbDQDgeKHijKItF4gz+HYHbPLVQSwhY
	 h1XmThbq4g+1GkEl3nNVhrhQ15xi2WmJpLew6bsosWRfwODAErM8zBk5IYDMTd/FKR
	 QhACFl1ddePM5vCO6Vz50tCmF9eyBb9aiOGlX0retxv8tS/ixxKYb5RNHXzIGQhjv/
	 WY4ahO5OsN4fA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20iommu/amd:=20Remove=20redundant=20values=20redefinitions?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1738838966668
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <bb95c2ffee689905293f73b6b71e8f5a5e666ec0.1738838825.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c7b5e5191f3f44ddaecfd120a10a4d98?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250206:md
Date: Thu, 06 Feb 2025 10:49:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In amd_iommu_setup_domain_device, we redefine req_id and ivrs_dev
without using it the first time we read it. This is effectively dead
logic that we can refactor.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index f96f59440b..1511a2a099 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -147,17 +147,14 @@ static int __must_check amd_iommu_setup_domain_device(
     if ( rc )
         return rc;
 
-    req_id = get_dma_requestor_id(iommu->seg, pdev->sbdf.bdf);
-    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
-    sr_flags = (iommu_hwdom_passthrough && is_hardware_domain(domain)
-                ? 0 : SET_ROOT_VALID)
-               | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
-
-    /* get device-table entry */
     req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
     table = iommu->dev_table.buffer;
+    /* get device-table entry */
     dte = &table[req_id];
     ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
+    sr_flags = (iommu_hwdom_passthrough && is_hardware_domain(domain)
+                ? 0 : SET_ROOT_VALID)
+               | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
 
     if ( domain != dom_io )
     {
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

