Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E668EE80
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491729.761065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDS-0008AK-IH; Wed, 08 Feb 2023 12:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491729.761065; Wed, 08 Feb 2023 12:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDS-00083L-2f; Wed, 08 Feb 2023 12:06:22 +0000
Received: by outflank-mailman (input) for mailman id 491729;
 Wed, 08 Feb 2023 12:06:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDP-0006aK-Un
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdc4f3d6-a7a8-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 13:06:18 +0100 (CET)
Received: from BN9PR03CA0469.namprd03.prod.outlook.com (2603:10b6:408:139::24)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 12:06:15 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::96) by BN9PR03CA0469.outlook.office365.com
 (2603:10b6:408:139::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 12:06:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 12:06:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:14 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:14 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:06:12 -0600
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
X-Inumbo-ID: fdc4f3d6-a7a8-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGEv6hVeXIIaSDJ7ZI7lRscV9T7gAOwT3N6VlGYQr2TqzIMmPek2KTPGN7zwzVgYCqDV1QsVpyKWlqC4t37dFSt6hsLVZmFb8Id5ILTQCcy/WuTmw0YfuRq96Vti0XoMjtn4yzZVC6sKKiG2VO7uyW3rZblTEbmEdsRSPcaDIRbWMuY/NGm8DcTGZn9KCJh6lEgwW3GT71hnO0FDN5ynBlVnU/NAnfcU+ivlGPRJkdYJ/+o0mKo2faOd5jd8BsPSZg7cRDxEY800AbzlYh1IUkPW8asBl3d0bUFvKjZoVztmfBYwK/C4XYF5hWqDnxnEaif4RbSi0FmQRiydJ2effg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LXD4lI8ekDQUSE6zCy/ebroVeYXJn+F4RC8ggf+pIc=;
 b=Lj11pQd7lgsj9ngTwgMVlWmPia7xcbBzN6WbkQ7yDOWNCUMAu0074oasZSYhEiICH1DYfpYVdEQ6y3k8X1GE3a/I6xlCIOTNdsyj0vG2Wv6sIZv+qU1BU7mclQLJc7EUYbxisWEZks0oZbGO64JhNM9hY8kWrD6eygyO8NLSnc1yzVn6KyKvNLgryEfpp/7o6gjfJ3HpgOEkde7lj6JPd8ax329q8gEMPQJ66UwYFFMZI/8WjWviSW+HIKCu9zHpli2onD+yjVfpB9TMiFe+2JpfunbX8lZJLD0fgiX2JOmf52Piwmew2Nl0qF1jYnwg2MChognj0DcMiVBnR4cfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LXD4lI8ekDQUSE6zCy/ebroVeYXJn+F4RC8ggf+pIc=;
 b=ErQ4AwfQw4+2h9qn4hteiAL0q68cc6ah+VO5+qp7oBqWstMinN+wyDsMETqjDI+wupSXAKLwhlYVZX7ol8TMkwtO3fR7yjQDcXDp/H3dT6T5C67hSlFykbs0nmbMwxwo7+mt503HAHkUbt5yG7b4UHVVeA1zl8eSzuiZjZD2uHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 9/9] xen/arm: p2m: Enable support for 32bit IPA
Date: Wed, 8 Feb 2023 12:05:29 +0000
Message-ID: <20230208120529.22313-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: cb541ae0-5344-43f2-5281-08db09cce097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jMx+nu47epA0QL6HRtvziQrm6JLf5MYr0IGtyYhZN/lG/5bEwLBQpHQtT5sbooeEE8bGQd9m/kLfPLCY4Enjxlu+JYF9GOzeFKtwgojPADBe/FLY5FYRcs99G4RIsIfjH5eswgaUo75/VHXDpeZj1yMopYWmH0fiL+dFVo/DtoGVIuCngeFbhnmcyxxvvsQSOv95vo0WasmVSRLLl8Tcj+D6s9a+TDQKSvQVOvkd+SKB7pHH6Zb/LF+VKZZ5b1cDmfNAmgH91D4qwrCqDaxdGTtZWK9tfqvpp2ba/bVkhxrFobqrrGAM84W2BbLZyQCgkgVH2nQZlwo+oANbmUkdUj6yjwg4TPlsYkrxduLV1yd9yq90d3iRQH/6pYmsD/p45L60SNGP1QKDZp2OJt8ue2XaQd7hHZ8AtEJfYZlCg7GWr8pvjbrn8gs2jNKVcw52Lix+s07nDvIPf5UXP+UyMvb7opZ3m269mE9+IYQTowwDQ9QeCxZEQeV/PQh8KcXlsAdKDRz8/GPy53vkkde2weK0oOuKiLVNVH6lVqFdQidzkG2ObKSUZFY3doch3MKDR8zZTT5ZTt7M9NZ+xRrf853tHChbWGoch63N3y+s2+/Qy//967eIcFfFWM86HFd1jiRN1xTtKFnoNWRO7zZipbqlgwabBsOTDReMT9UVcMpjGFThjFJASgO9ovF/p6bZDN+mvW76V8EW1BfE/BIzQzQ/hNKLv4sTwaImh4YcYvM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(316002)(83380400001)(54906003)(47076005)(426003)(36756003)(82740400003)(8936002)(40480700001)(2906002)(41300700001)(36860700001)(7416002)(5660300002)(103116003)(356005)(86362001)(82310400005)(81166007)(6916009)(40460700003)(70586007)(70206006)(8676002)(4326008)(26005)(478600001)(186003)(336012)(1076003)(2616005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:06:14.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb541ae0-5344-43f2-5281-08db09cce097
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
"Virtualization Translation Control Register" for the bit descriptions.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from -

v1 - New patch.

v2 - 1. Added Ack.

 xen/arch/arm/p2m.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..cfdea55e71 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
     register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
 
 #ifdef CONFIG_ARM_32
-    if ( p2m_ipa_bits < 40 )
+    if ( p2m_ipa_bits < PADDR_BITS )
         panic("P2M: Not able to support %u-bit IPA at the moment\n",
               p2m_ipa_bits);
 
-    printk("P2M: 40-bit IPA\n");
-    p2m_ipa_bits = 40;
+    printk("P2M: %u-bit IPA\n",PADDR_BITS);
+    p2m_ipa_bits = PADDR_BITS;
+#ifdef CONFIG_ARM_PA_32
+    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
+#else
     val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
+#endif
     val |= VTCR_SL0(0x1); /* P2M starts at first level */
 #else /* CONFIG_ARM_64 */
     static const struct {
-- 
2.17.1


