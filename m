Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE98CC946
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 01:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727904.1132603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uw5-0007gG-Qg; Wed, 22 May 2024 22:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727904.1132603; Wed, 22 May 2024 22:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uw5-0007eT-NF; Wed, 22 May 2024 22:59:53 +0000
Received: by outflank-mailman (input) for mailman id 727904;
 Wed, 22 May 2024 22:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31Ro=MZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s9uw4-0007HJ-7G
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 22:59:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6007c1-188e-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 00:59:51 +0200 (CEST)
Received: from MN2PR04CA0035.namprd04.prod.outlook.com (2603:10b6:208:d4::48)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 22:59:45 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::11) by MN2PR04CA0035.outlook.office365.com
 (2603:10b6:208:d4::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 22:59:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:59:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:59:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:59:44 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 17:59:38 -0500
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
X-Inumbo-ID: fe6007c1-188e-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSWqwj34lnSTz24C5X/+EHE/FPg2TljQtm89RzfiE1VKHedCnedBCw8ut4lHusSeYPRK6Ps/vDPnTm3xQAe9pEQqpe5tSD+NI5KGYK8re6VP9FbEiJNEZGxVGdIIueDqcyGow7oi1l0WNwxb3MIuA6X0F4RVXbvhmGbFrnPOFzhVMeKTibKg0Pal1Xy4IOnp69nVrIclj3mFdGEfz/cgenj7hvMnUyvamCjh2XuNpZZ9Ge0JuUGXsT6CLmf8d5Jr4oT4dWV9O8rcwlFetzIrPIWXDUKcyMt8mCBd8lgawi8+nYgfBZs2ymNSjO0I7So1Bc8Le1yC5XX7TUBOezYw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8+/xJpZRZsK6+RKr2c/38/ePPkO2ljT1mguCOagC4g=;
 b=Z9ZfhUPdEEEFkmrZExIslnLi2/EYu5qEpVyaQoxlo/UwEEBUFO+oz13p6lExGxOo2j1rORaU1MAdqFBK5jqpI0X6ZWNVQEB8oL2EZWmcagnkpm2GgAUTJG+xEIjWeeG8qEhdC9Y2U/J8/WQaUPkaFj+fXjUIvZqWl134mVvwM/BVE1Wn+tl69RQN2Upyfkh5GGjCyInRvjYt8PT8ZliaSJywl1UsO+hMTVKBCA+km/FJ9OIrmofegy+UwuhZV69seuHFbIaFAhCs8zwbKwQg586X7OOb8ft0yB6pVYI77YqP0jlPzHuC1gBOQBti6RRFlFBj5hZbCevzJvwWJuUOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8+/xJpZRZsK6+RKr2c/38/ePPkO2ljT1mguCOagC4g=;
 b=F8xSekaFfvRxCBuE4BX5RQahAK8ZR/fBn72L/nuol54TDUUfQbOAwSQVtpWKa9CDOr8kRAjmqoieCMsHSQhjVJYfVn2TUt+Q0GIwqogx7bPZBqwIKV8yFroHHyf5o6E5YXmDZlkjQ0+V639DFe4VnzHuXAHLpuBESWJ0WSuoB9o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v16 1/5] arm/vpci: honor access size when returning an error
Date: Wed, 22 May 2024 18:59:20 -0400
Message-ID: <20240522225927.77398-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522225927.77398-1-stewart.hildebrand@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ffd48ec-c467-4d07-6ea5-08dc7ab2df95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ngdG/B6/V0+aQxwTnZmyampS69xAgxf0RITFUzCdtvnbpqKPFLIB5KOYHe6B?=
 =?us-ascii?Q?c6BOJTM3bL4z5wN3ern9RKVPRTkXSEwQbx/klzQdmCMUWlkkUgsajFhMGR0g?=
 =?us-ascii?Q?Y1JfwYi4Tqd0jTTclXR53b33XPHx0R87MluOoGG8D1M7WUWnI5LCxfaHMKMO?=
 =?us-ascii?Q?LtLET4D7ixKK8DwoRodnYCAXcRZccesxIHTohZgESW6c/oOI/IvrtXNhQFS1?=
 =?us-ascii?Q?5WMLssChU0r39DcVgFs8+xDuMLiclMrKxwOHI+Ct3gNg46pXvWMQpaK35i/C?=
 =?us-ascii?Q?9OsSR+dZ5NG563QXty2AQUcD0peU29brq7c2vpzZMV0K3RKavw8lhSD7xjKk?=
 =?us-ascii?Q?iog/fvGnngTBfZqV7gKiZSx87r9JzcDgeAAt8bsMgxfZUYXNeZ3Djl5HEjgH?=
 =?us-ascii?Q?0yrR8DglBlTg82w3SO0P8/SSgc4iu9/LSbkf7bYNaEgS+VHiLS5s5pglT73Y?=
 =?us-ascii?Q?dbw4sTKg0pmIXUYj/1kPantHg/BqFYIBXHbZ/sNH4/XP43t7Ntu7uDwcr/qw?=
 =?us-ascii?Q?iqeYlfCnIov83B4DgVKJuGY03sKBGi+c+QxiYpQN8QdEQpFBmuXR21TWqSlx?=
 =?us-ascii?Q?q16UC8J9lUogorgtsKYlswA+vhsdORtuyMeSmcHgbvWioebscMxn0LoQFHoe?=
 =?us-ascii?Q?HSnLkpAsIZ/HlXy6m8zm/XnCgOfMZvoZ1G+i5mkDXqXv4UW0+55Aoesx9lfi?=
 =?us-ascii?Q?IApk10yBAFj4m9dzZ3+gsWwGQVRE29gISLamqxHJMbwYI9giDAJJyAoVLE/h?=
 =?us-ascii?Q?0najPYzC7+ku1icdugIvtHMIMStGuMPSkIWcg6GnoQD2jOzG9hVSswbqw0oz?=
 =?us-ascii?Q?uNX8UM/HnyXTM4aEnFr9hCpTw6GU0qG06+3NmSn5E0DWMbhInyxC/R3flQdX?=
 =?us-ascii?Q?mkkD/3C1cL2djnb1QwJoyNRsYh5AV/IPKVAqjLVnI4LrhLw9f/xO3yxUq/e2?=
 =?us-ascii?Q?fjVGq4BvB2TIhvDnBtMPqAiXyBzZAzxlAQi5G6EeB1IB4QXf3Fu9ifwkFfwZ?=
 =?us-ascii?Q?YlCftC+6eviuQ1AOTuQpXDJcHZftJ9sOyDArAYfe9SR28dSaE1uDwJSef1PU?=
 =?us-ascii?Q?E2PBzBya8xKLuIgYAxqeqAL4E+SKd0eaflIJJdu39ih1oKJiApIRpLEijz7f?=
 =?us-ascii?Q?VZmsG/csNGVSzFnronDM0/qlz8IBiEkSxW94/2x4T1K69ZyDvdPRFl087VZ2?=
 =?us-ascii?Q?18oy/j33F7fjstDzoOoYNjK/dlaEg4W1Mc6DG/ACnxh3KqzxKSQ+2flLmlvU?=
 =?us-ascii?Q?owxq5YSuYrMKzV5AU2tPXkxYhsSbYlwjxwsD2G055QWlD2vsRmRXGc0qMlpn?=
 =?us-ascii?Q?Q7UFE6HepFOsnDe7ZFAjZvLweF4BOZQsu9h1G6OUYXhXL8kVpyJJey/z59YX?=
 =?us-ascii?Q?By3opQ/fK9u7RbSYVLhP7iZglIit?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:59:45.3178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffd48ec-c467-4d07-6ea5-08dc7ab2df95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Guest can try to read config space using different access sizes: 8,
16, 32, 64 bits. We need to take this into account when we are
returning an error back to MMIO handler, otherwise it is possible to
provide more data than requested: i.e. guest issues LDRB instruction
to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
register.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v14->v15:
* re-order so this patch comes before ("xen/arm: translate virtual PCI
  bus topology for guests")
* s/access_mask/invalid/
* add U suffix to 1
* s/uint8_t/unsigned int/
* s/uint64_t/register_t/
* although Julien gave an Acked-by on v14, I omitted it due to the
  changes made in v15

v9->10:
* New patch in v10.
---
 xen/arch/arm/vpci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb55082a..b63a356bb4a8 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -29,6 +29,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 {
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    const unsigned int access_size = (1U << info->dabt.size) * 8;
+    const register_t invalid = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
@@ -39,7 +41,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0ul;
+    *r = invalid;
 
     return 0;
 }
-- 
2.45.1


