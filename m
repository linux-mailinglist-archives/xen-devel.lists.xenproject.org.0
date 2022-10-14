Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9D5FF45C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 22:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423096.669541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojR0x-0005Ru-Rq; Fri, 14 Oct 2022 20:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423096.669541; Fri, 14 Oct 2022 20:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojR0x-0005Pb-PA; Fri, 14 Oct 2022 20:10:39 +0000
Received: by outflank-mailman (input) for mailman id 423096;
 Fri, 14 Oct 2022 20:10:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPLM=2P=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ojR0w-0005PV-Hr
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 20:10:38 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 431a2249-4bfc-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 22:10:36 +0200 (CEST)
Received: from BN9PR03CA0295.namprd03.prod.outlook.com (2603:10b6:408:f5::30)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 20:10:33 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::b0) by BN9PR03CA0295.outlook.office365.com
 (2603:10b6:408:f5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Fri, 14 Oct 2022 20:10:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 20:10:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 15:10:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 15:10:31 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 14 Oct 2022 15:10:29 -0500
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
X-Inumbo-ID: 431a2249-4bfc-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl4dkVEeo4/PvqwfzBVUPz/7e/2LmbPZ4PU+mtZzxMMpoORI6yhg+TYo9wnsnVN9qk5bZIxjbjXiwUq8HXV8pkMfe20ZY6fC9xkdwMqR/hPa4S2bY9X2MlFqkB3YiGzvbljNobFAf6xDpXsINbzfuM6VF6c1QdxJDTGxFpt2D6R0kGR2VI2XjixqtmPlgPyJh5OO6ZKh2AaXBdw59h2W1Ml5i9eC7GETfpVl3S2wJ6e/UEtWwQprcdgQm4zdvcYP/mhUyCdWBDwOAhCLAMVSpYVHocBQ1g7Tn36RhHg+Gi+oaR9muMV3LifSrdIU22pkj+GyX3APutTZ8C+y1OZEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaslOf9gtbGfA3c9R1C88IUpEPk+IJWusye9AlidDAA=;
 b=mQ7Nt5MqKjeuO6I1IG8k4HLBDrYNkIVkKnojGkJyYFBGMIe9EfJdOe1zgi4iuPbucGLjFBukZfB/hdyOMColCSM91f1lhT11bv96OUGQgaudfQCSlwDEh05DWAEQEIAQgNEeChXZLLIZZKadi6kgi9Z19w83WvMu7ShyzD4J0rurA7c/cobTXTUHocJpSP5++2VCQvOSr6KQlol9KzrV3V2CJx/wKprkwwAZa79TNOhwIwJSe+sMyWPEp/nXNJe7YxW4YhS0bmi0QgdTbb9zU4FkAAsvNo4YaNSTssBUKOssfGKCJ/nevad3UZ28eLwbI383Wcdi8hDaMT5aUCg1/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaslOf9gtbGfA3c9R1C88IUpEPk+IJWusye9AlidDAA=;
 b=SrU2zmpK08YxVL534oMNLjfo0YdUSINtfK3OpoqENPHqS0uNhQlXhmODOvHlvLfnKoROT4kYdZj7shUTDhbPvuQP3gfGCxhKi8w1xXIZc2jh9Wtrm6pblX0FbTiPFlP39/850CcilpmZUjVrTNOTQ/4tzLT0lzFZ3S0jew3FY18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v2] xen/arm: mark handle_linux_pci_domain() __init
Date: Fri, 14 Oct 2022 16:09:26 -0400
Message-ID: <20221014200926.15250-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221014025354.30248-1-stewart.hildebrand@amd.com>
References: <20221014025354.30248-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT054:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce85e39-73cc-4ab0-59ce-08daae2025fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VD+ZOLSFb4hFvZdLmqXO0/HG97LmXt3m8MZ6OB68WNvMGA9rQvsyxd5MjbB8lI3y6jVcEAMHcU4T7oxpVWIyFshWeBF8x3H/qLeznMOzlrLgFK2fQwKtLfFus4k4U9KLzh6ZwtVrziAkCWNktAx2VxYYyO3x10GK7dBJ3RcmerW2YLga1s1w9xnbT2ZDNPj5/W7O7+kumwipNFMek+HCLbOyqC44n2y0A9prxwBIbOdWXusKlOlnN/wMhg1TdUIiR7lmXTyfF6Tqhr1i4zzIhrT/FD7CmdV0mJ5O2p526PSfI6I6exBj58Ep2otadWWUj8ZRonhCT4PAi3u1jQ6UjJOkerevZ3Unyq3duWF6r6FtlN+AP0RiGK9agBXzFCkJMwrwTGAlDI7ozCyTuyd+qXIxyIRG/Czv8S2ZigIyALAekcrIazzfd8v4khARWFNFuKd8noDmHV8NB5FT/BZMCK4tCvjojWgLouxT2Fif/cd4koQUwzbEP5EiwxZ+22DhJv+EmeWrPZhBpE0FHOnp7qQe6HRHg2Zcycs9ujIWs0UemmwKcUPkFcIL+mKrnb/9pdKu/W7QOnRyOxBtStJmIIe+yxMkrxX1qO57CSMFS2yl2lZg2Ie+QZGf7VOjKFaWSI3WgD9clsvPoYPNs7RMwfgCRDlb1piDBTdC31QalbygRV22HiDZjmdz30hwUudCkyQ9q8EO8C0FQ0YSMGK+gdQ6xnAOorrCbLN85BGzeAfv72RAXX5J7pZzNw2HMUYxr+A5Dsr89Om04Xhn5UG/syIBdXZhD1WxXKi4CsUDP1RhTGEkFWS6wAT5PYFekbV/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(8676002)(70206006)(316002)(2906002)(8936002)(54906003)(41300700001)(4326008)(6916009)(356005)(81166007)(82740400003)(26005)(40460700003)(40480700001)(82310400005)(478600001)(6666004)(5660300002)(44832011)(36860700001)(2616005)(426003)(86362001)(47076005)(336012)(83380400001)(1076003)(36756003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 20:10:32.5384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce85e39-73cc-4ab0-59ce-08daae2025fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206

All functions in domain_build.c should be marked __init. This was
spotted when building the hypervisor with -Og.

Fixes: 1050a7b91c xen/arm: add pci-domain for disabled devices
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

---
v1 -> v2:
  Add Fixes: tag
  Add patch description
---
 xen/arch/arm/domain_build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 61cda8e843..fc2961895b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1051,8 +1051,8 @@ static void __init assign_static_memory_11(struct domain *d,
  * The current heuristic assumes that a device is a host bridge
  * if the type is "pci" and then parent type is not "pci".
  */
-static int handle_linux_pci_domain(struct kernel_info *kinfo,
-                                   const struct dt_device_node *node)
+static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
 {
     uint16_t segment;
     int res;
-- 
2.38.0


