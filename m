Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C0A79A7F5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 14:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599379.934772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfg7Y-00025C-An; Mon, 11 Sep 2023 12:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599379.934772; Mon, 11 Sep 2023 12:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfg7Y-00022w-7w; Mon, 11 Sep 2023 12:34:28 +0000
Received: by outflank-mailman (input) for mailman id 599379;
 Mon, 11 Sep 2023 12:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yA6l=E3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qfg7X-00022q-FQ
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 12:34:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 895af655-509f-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 14:34:24 +0200 (CEST)
Received: from DS7PR03CA0177.namprd03.prod.outlook.com (2603:10b6:5:3b2::32)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Mon, 11 Sep
 2023 12:34:20 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::6e) by DS7PR03CA0177.outlook.office365.com
 (2603:10b6:5:3b2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 12:34:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.17 via Frontend Transport; Mon, 11 Sep 2023 12:34:19 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 07:34:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 05:34:19 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Mon, 11 Sep 2023 07:34:17 -0500
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
X-Inumbo-ID: 895af655-509f-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoV2gTOG+j6rHA/7Eq967wss8o6VnWyiAe1toV64z5uackFtlO6zrELjaVUG5S7ZXkMtvW1bq0+alTMJNSbEoS9KDdKTxvqcEVNiUkOV2ca05o08EDqAMHz+P56yUhiVF7Xq3a/YDuWx4buhXFgpzu8siPZS0pfnwgNmvZYW76Y/rjmp25WhxkfuVLvS7DxQd3SW+aSCFe1N7XZPc6WMce9ZfEkIdJC3nT7SHZpMF3p7LLPYUCJeGmuSIL43ubAyI8YJUnW0gK6cj8BGn6JL7C6OhKqBXtUCk5bcIG+GcBYRMzVqWdZmsVZNveLoKDwu65jBsuawu4hN8Qsch76OCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3rxnRxg4T/QWKz8RRRZwEXtnuZGA3bWlO0H/O1Bs6s=;
 b=obXmBrjOBa4hUh9pVJ9QwRFYUMqaQcig98qnGiyBYVUiuc4UfEJNjyusRcy+gQ30PkgEkTiHFxytWq3ntixhfn/B29G/HxqUyQAdO6nFku+QIVPzb8j/Wf6h7Hr18xSDKm28e24XUdwrdLarCzJyjxN71E97C2SFYZAdCBsBOsE0i3yPa8zKaifE6SCZQTKVG4nJb4ey3ienuSA1zjdclW0DebM8KZooW1CMiyvIuJfJ/t5NEBAGKA5bGPd01RczjviyFX3G+AqMvfnXZun44+Wsob05KpZVC/9QFkzoq3KmocKBekp/yof1V3kyoiuLlWaQPRS3c9s91k1hUcmf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3rxnRxg4T/QWKz8RRRZwEXtnuZGA3bWlO0H/O1Bs6s=;
 b=J0jnJXl6v8pcuv9nmjxlKFhOj+RH2bj4objGB7U8aHwCwf8syZVB+wtxkJraCR0z74gTr1gzMcMQptbQV19LRFfEZxvgbWietqc19d+mEOXGxdAe5mmj0g8jCLrJ7MDMYDhBaWwXhM6orxqAfbVBIRJo3j9LRhE6ci2tdXn0+vQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Skip Xen specific nodes/properties from hwdom /chosen node
Date: Mon, 11 Sep 2023 14:34:01 +0200
Message-ID: <20230911123401.27659-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: c9248225-8f91-4780-eb0e-08dbb2c36bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w0nXrEJlPtPnm59H14bf2Sazv5yg3dvsBf1jvlOlNlb7RdRK+tfwvdPC4ftXHtCnLS96IzEI6vWk4WfMPXvMog5bgfBDcfYsFm0OvnPr9W1j4HXX2pNFO6vyX6AOr/htB5K3ekj9hXr7AgNYC0YTw8oCS51Azg9PzbgpQEiglbBL35cpuIIclj+3kZYFeiFbXC5LMIuirOnO5NOrhqxl8GpQBAi9vvaZYRgbtsbXNY5BTwFkSq9NZQCizLvfVkaE6hIpqb5PYggCFtzBHXkefAgN5fnaSUzJahrerB+dkrEEo7fhpLwjAABjiJBOECMemJ31mcSIqNF6iISzLBjIq353wFmdHVDXGrY54KWNc0ytcp7/CuaZeEksc7kNZfWIROUW7atsjlitGFOlvJMh6qwSSJtT2rGL/TeUGSS2fSpMZKz5BhdDRGNwBUfx9GKWzAMQn1YtOPJC02wq7WtgJVf1GT2s8Ky14PY/VQrpwBIxLXfKVTLCARdgJEpenIa9fhLK3+ddZwnSbajqeMzdLr8EYN5C4dyki/jifRSwzlmgzI7hK+DfN7UAC9k24EBmv//1VuY96TlswDDlYgzFa6r3iJOCcyI1hmBrUzAHChYps2BNwXGkhMOva6oePGktWusKXBOYC7FLl18SMb+zfB2ZBDim2AsxeeWuFQZHakmdPvqDAwVhCSaYEh4kliitIrxBs6JZtqiSAzaBYelV2CmZ2jPV3TOhbniI6hICivGKobjHwNFRsgxVFd6aIeAaLsv8ZiCuq8lnS435C9CKsQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(46966006)(40470700004)(6666004)(8936002)(82740400003)(86362001)(41300700001)(8676002)(356005)(81166007)(316002)(70206006)(6916009)(54906003)(44832011)(70586007)(4326008)(36860700001)(478600001)(2906002)(47076005)(426003)(336012)(40460700003)(40480700001)(26005)(1076003)(36756003)(5660300002)(83380400001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 12:34:19.9103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9248225-8f91-4780-eb0e-08dbb2c36bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282

Host device tree nodes under /chosen with compatible string
"xen,evtchn-v1", "xen,domain-shared-memory-v1" are Xen specific and not
meant to be exposed to hardware domain. The same applies to
"xen,static-heap" property. Skip them from being included into hwdom
/chosen node.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 29dcbb8a2ee6..413568c0e2fd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1149,7 +1149,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
          * * remember xen,dom0-bootargs if we don't already have
          *   bootargs (from module #1, above).
          * * remove bootargs,  xen,dom0-bootargs, xen,xen-bootargs,
-         *   linux,initrd-start and linux,initrd-end.
+         *   xen,static-heap, linux,initrd-start and linux,initrd-end.
          * * remove stdout-path.
          * * remove bootargs, linux,uefi-system-table,
          *   linux,uefi-mmap-start, linux,uefi-mmap-size,
@@ -1158,7 +1158,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
          */
         if ( dt_node_path_is_equal(node, "/chosen") )
         {
-            if ( dt_property_name_is_equal(prop, "xen,xen-bootargs") ||
+            if ( dt_property_name_is_equal(prop, "xen,static-heap") ||
+                 dt_property_name_is_equal(prop, "xen,xen-bootargs") ||
                  dt_property_name_is_equal(prop, "linux,initrd-start") ||
                  dt_property_name_is_equal(prop, "linux,initrd-end") ||
                  dt_property_name_is_equal(prop, "stdout-path") ||
@@ -2300,6 +2301,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     static const struct dt_device_match skip_matches[] __initconst =
     {
         DT_MATCH_COMPATIBLE("xen,domain"),
+        DT_MATCH_COMPATIBLE("xen,domain-shared-memory-v1"),
+        DT_MATCH_COMPATIBLE("xen,evtchn-v1"),
         DT_MATCH_COMPATIBLE("xen,xen"),
         DT_MATCH_COMPATIBLE("xen,multiboot-module"),
         DT_MATCH_COMPATIBLE("multiboot,module"),
-- 
2.25.1


