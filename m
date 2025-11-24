Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7CC82AB1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 23:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171535.1496551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNf9x-0006Oh-LU; Mon, 24 Nov 2025 22:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171535.1496551; Mon, 24 Nov 2025 22:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNf9x-0006Ma-Hz; Mon, 24 Nov 2025 22:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1171535;
 Mon, 24 Nov 2025 22:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvF/=6A=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vNf9v-0006MK-Mh
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 22:35:47 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e99a37b9-c985-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 23:35:46 +0100 (CET)
Received: from BL1P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::18)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 22:35:40 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::90) by BL1P222CA0013.outlook.office365.com
 (2603:10b6:208:2c7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 22:35:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 22:35:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 16:35:39 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 14:35:39 -0800
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 24 Nov 2025 14:35:39 -0800
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
X-Inumbo-ID: e99a37b9-c985-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6/ZhQIWZfsg+3XV83qk6mXwRFtzRW9pTfJAw3h084zYm6hfa/zQ22uLmWUw3G8BsKs27jJXrU9wQfcZpcRzJdmFYnCRmGp/BgpKxZp2wrl5MZy0Z/S0zukHXalpp+U9fuawPb9OR9OuzPbGebD/KDVKvdQrVDIwLIsvHEWljYA8dm5ff1v0JB3ZE2C9ATQUv/EQzWGfFETFz4BQybMOrT0xc16q4GVzlRPMQA4/YsWlK76uoEWjBr3SzL6D+OVS6VgKXCTJFNG5TV3N+XuqEFAu4GVGsWb37wURsS/Yv5ltmDna9kFPYCiS21Y32wkt/+UwcmegTDoW4VZKs1jD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khaXepjy+mj83tuBL39eaODPf2psvhrTF2r85Z9Phx8=;
 b=m1DxVODS1/tfk8fyQNJY4a91oBYeUulEBtUl5jAjp13dUeiQ1TYpCN8OD2AhHP1zebkejojSmkqb+F2vV3VuSmO/nieZrYR60qWsRc89wdZ14rJgOuEvGWyqQRuSuqSlq2pTEJXcpoSOz65Pu4w/79P73rL/r8IcD/BDI0613CPjDcm/LDdWSvPJ0mncHxlaBdVll9mbvTtD0kdCk15iYDOv/AMcjTabVIhTlX5xK/SnYzHPQGFlARW2BqUeMwtPRcVo1QjF9RKjoL7+mY1OaXKj5q2cGIHslXhIio/Zb1tdDp1m5AuwTxhWdHtDplHQYCnpamzFsNZCJEf/O0mnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khaXepjy+mj83tuBL39eaODPf2psvhrTF2r85Z9Phx8=;
 b=noTCTZ6a+HyE0eUCWEmvGwU1oP5ISmlZeKg63EskKidyfWaZ7YYyhYPvuT4uhO0ZYPp9bP7OKa/MmZ0pyOGQ4W2SnaWLPWfjdzA3ijhbeHk25zur5ifRV5Z9/WwcrNMXkKEshRfFAf4m5+FCR+YSPHbtN2/Ws/XuPc2RDb6rzHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN][PATCH 1/2] xenstored: Default priv_domid to store_domid
Date: Mon, 24 Nov 2025 17:35:32 -0500
Message-ID: <20251124223533.31613-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251124223533.31613-1-jason.andryuk@amd.com>
References: <20251124223533.31613-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b180a82-bb54-4930-dc98-08de2ba9cbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rYFwPunk+hpUjuNhtmDRzcFPslzLkfp2lNEKm5BbNkPbenFUhARZZRCqKQhG?=
 =?us-ascii?Q?wN8RihFhqbjV2caK8q5nBn2/ziVAT5u4dN2semqUHO9EJN9IGwD4ubGKs5uM?=
 =?us-ascii?Q?8BHjd6rxzWJFoGHvrmtDPsl9RtaReJOQQTAKYyI2klohWXmMDADoMaZpXsKt?=
 =?us-ascii?Q?qfwLbHw6eggcJ8CYwi9AKoD9eIodlQmUQ9jcCd0BPqj5pTagHT6wAhpGM6Ql?=
 =?us-ascii?Q?YHgQ9YGZl4kd1GWxxSgUxIjyX8OCSoU0kFXDrbvswbBATY9cACGzSsVYA2lD?=
 =?us-ascii?Q?XHLsw7nhG0XuAOk7M2unhbkYi04TNOPbnOkCFioE7H3b27JqFcpaCPErWhN9?=
 =?us-ascii?Q?SV7+OJMRdwzieaYMFaevvErFYebMTA1rJ9w26cTbEZvYAtHRkeTLISYifvPG?=
 =?us-ascii?Q?OYSb1cRUG34EUUPR7hNvY0D0WmXhduaiExhUU+VHYXs702SF3+lquQJVXi/S?=
 =?us-ascii?Q?W0NLlsZ795VGAmfDYh/vuQUYnEKGGKqj/Wj/XOJxILyJrLmKfQmAJjfhE/YV?=
 =?us-ascii?Q?8FyYeWVmC0XhGke4L2agAi683tP8t7cDUBIcQPjTfgDp7uQPdlAVRFlxQ8JM?=
 =?us-ascii?Q?S5V09QsaE7Qdct7TRQSY512Yuhk5Twokkk++KyJqGupOVyFPd6biDfXxJy08?=
 =?us-ascii?Q?i20m/fHUcuLJXNHk63HNDrVFDTIiZDqU8Ca4+Eqn8dHJdWwHw9iB4MVPcKVF?=
 =?us-ascii?Q?X8k1ERdkIZT8uiL488yZfBhAIXaq31o802g/taaLfWKGOHY5PTOI5q1bfpqB?=
 =?us-ascii?Q?mabEWOeOpJ9+2eNxnhrVwGxmrJWeEfBdVxOSx3rStaRwYBFjL+t2CUlklbhu?=
 =?us-ascii?Q?izNP4kupo5rRk/X68Aq7HTY2Q275+Td65+fCaE/owKKTFvxiulaHlaUOcJ7q?=
 =?us-ascii?Q?dEMN+OIRL6kB+wUOhPtM4MqrJCvZecvrBfLqj6IDC5L3XbcspGEZRHa0dRiv?=
 =?us-ascii?Q?vNHP5gsNzfnEUc1CLL9ZCKcYNjrONljL6/t91gWWReOj6vIwCzmT397ukz9q?=
 =?us-ascii?Q?VnudDIk65curZ4/BS704RTTI5vwCJ3ThJabAIvkVfzfhyneZ/F+rjaSPpFFx?=
 =?us-ascii?Q?QiD52W1SnXziQcsKjjN4VmX5wyYE+/6GXOWuTtf2jU4wUuL9cJK4HKP0cqj2?=
 =?us-ascii?Q?9VuEM8GjBjjo6y9CUFXZw0amxG3+FMsokRBI+xs13g8B58FdqHR777NMyXWc?=
 =?us-ascii?Q?gbV8IU74mYYOAiPQoMHZqnAVT6iaeerGDzO+O1VB0QHXJ6Cz4+ePmwouPqga?=
 =?us-ascii?Q?12dY/RSNAVGYSHUalYAd39IPCoqQ6Ie24UCrPX/1FKsrlJ5zOdbjyDPw1SoS?=
 =?us-ascii?Q?eTfAFaaAaKxct/3EMs9CfdqxZswTEd7Bgp3bwadHSxprUKXfrftyc93o1Chx?=
 =?us-ascii?Q?Kq6qWeA2ASq/3V+gLbj9ipx8lb3hLIVnzPuFQlZXmXYK8rdUIMykw3oJSEKM?=
 =?us-ascii?Q?HeCmChtvV/6O4botfuRD7ZiHoqApWWSCSDMOspFNBLnPGn8nmpIfckwO+jAS?=
 =?us-ascii?Q?7jslkb/R5dM5EFa8HryAKYXtQqkSnsfsXyHN8mneIIxjwVGBCxsDxByjj5yQ?=
 =?us-ascii?Q?nW9SPSEXZcSJQJ629rY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 22:35:40.3450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b180a82-bb54-4930-dc98-08de2ba9cbeb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958

On a system without a control domain, a hardware|xenstore domain
starting xenstored shows:
common/grant_table.c:1041:d2v0 Could not find domain 32756
gnttab: error: mmap failed: Invalid argument
Could not initialize dom32756

setup_structure() does not get called without priv_domid.  Subsequent
introduce_domain() calls will fault when calling fire_special_watches().

Default priv_domid to store_domid when there is no control domain.

Fixes: e5b0a9405571 ("tools/xenstored: Auto-introduce domains")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I didn't verify the segfault in fire_watches() in this situation, but I
saw that previously when working on this.  Regardless of the specific
error, xenstored was not working properly without this change.
---
 tools/xenstored/domain.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 5ce539d640..d504e9994b 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1388,6 +1388,12 @@ void init_domains(void)
 	if (store_domid == DOMID_INVALID)
 		barf("Could not determine xenstore domid\n");
 
+	if (priv_domid == DOMID_INVALID)
+	{
+		priv_domid = store_domid;
+		xprintf("priv_domid defaulted to %u\n", priv_domid);
+	}
+
 	snprintf(store_domain_path, sizeof(store_domain_path),
 		 "/local/domain/%u", store_domid);
 
-- 
2.51.1


