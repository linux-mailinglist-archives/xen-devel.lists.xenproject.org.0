Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F70A66F34
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:00:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918689.1323344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSoN-0004xp-CO; Tue, 18 Mar 2025 09:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918689.1323344; Tue, 18 Mar 2025 09:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSoN-0004vc-9S; Tue, 18 Mar 2025 09:00:35 +0000
Received: by outflank-mailman (input) for mailman id 918689;
 Tue, 18 Mar 2025 09:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdr/=WF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tuSoL-0004tI-En
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:00:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2413::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71351d21-03d7-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 10:00:31 +0100 (CET)
Received: from MW4PR03CA0291.namprd03.prod.outlook.com (2603:10b6:303:b5::26)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 09:00:26 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::52) by MW4PR03CA0291.outlook.office365.com
 (2603:10b6:303:b5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Tue,
 18 Mar 2025 09:00:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 18 Mar 2025 09:00:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Mar
 2025 04:00:22 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 18 Mar 2025 04:00:21 -0500
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
X-Inumbo-ID: 71351d21-03d7-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U55miw6OYUKXddoZ1Njsdg5IOmu6vSqzFJk134iWNjeSdfDsqKCzrQl2qtRgmTct9eU2YLndkGTqbBsarYZu6jsvO4aaT/EgmPBqf8ewVMMm/U6FbWTTpuH01wp2Hb4LCdACzqyfx7AgjEiXI1fWGvrozd3CrilL9KhICdMmxM/gllURzDnMRdYDwTmKdMpnD2OT27JJOlOFtT7X5XGx7IbX9PK2IWSK0GRdi0tVHzZwKWgr5CNvoYXGzuggaFI3ZsZQT7KfdcH1YqtDlfIXHPUl5KC7CIFUslRWhEJ/PlKU3Cx6tZ0L0Z23DtnGmUob4lChjZ/NM6weR5m9rAEpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQaEApbmMehLvjYTVtsTKnJBdw3TLtrzLREEgfjDY+A=;
 b=QweClNOdPYc6D1v6ihgSYn+NlRn8Fx/d5V3QJrjAQKUm4IV4cyeEIHQPbAvdBBfresC2dnSDuQRHfY/Yr+J7RlN1ADSKr9s7/h6a6ZSumF64692ORYHV9ik/3cXZv3BaoyKvPVbCZJlFkh6s9fiC+E5BgQOpoeA9xRQDL5j8fe43k7BYK8Ha2kYgJ6gppru3XgWijzME25+dPyVlzOMo0ethopSd47yIAxmNH9K9px6t+3VcrPKZlh/2MXQnRcUkKQjFB/z6GQfC5LO32tLrjXln+Ua25HHRhyM3NL1VZSY2FJXrMMZaQTv3wRnk2Kd3rcXlEeKrs/IJ7grKV5Lu8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQaEApbmMehLvjYTVtsTKnJBdw3TLtrzLREEgfjDY+A=;
 b=QnWcdlxe/+fC0jC/KPwHW9XEG8FwBw2eG7hbck4JXjLfzclMJCccQbdYlrrqH98bcwgIsZlWHe2YgpLh6/RfkAZGuh91N1V1hnFafr6FGcTuZ8Yr3JFsrHmK6SFW0HdB04HKSio9go2T9XP1/MNvZvHPARFdW7uwMmKkQ+zLaNI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] tools/arm: Fix nr_spis handling v2
Date: Tue, 18 Mar 2025 10:00:13 +0100
Message-ID: <20250318090013.100823-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|PH7PR12MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: d30b29ce-4b71-489b-d3e3-08dd65fb52b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W08SNuseQqZ6mz7A20eb1hiGyOPxe2Ufe2ei3sqkOHwwP0P1uwd4pAAH0nsA?=
 =?us-ascii?Q?dFqGuDN3RtnRix1WbZYYT/CllcAE7j6nwb++5iQ/9FKfFu69+impoTmFmmLd?=
 =?us-ascii?Q?3hOF6+ba7vCAfopk6tcL4+x91Dn7Hz+lJlr+83XQ2s956NTTQE4r3vy79m5R?=
 =?us-ascii?Q?/0+voF8Bjc6iWEB3HpFp0I5fFcbRr26E5iw//TnTTaeYyVOXEh4/vHuCo/Gb?=
 =?us-ascii?Q?gfa5ZvDskBmYDhb6scXDiMl1QbEuTU0HXJwh5smsQjcRitvibl1Mx7Q582XJ?=
 =?us-ascii?Q?QBd7tvHgipHtkk9hCxzpq5tqN6I+HB7Vb8Wy75NLhYxMCe/xT2w5/H1+bDba?=
 =?us-ascii?Q?Q9ZAUztkH5IMzuYkNUh5DsxKCalR54UpQsgWx9tpdmE2FgodGTiMzwuSr4FO?=
 =?us-ascii?Q?PiRlN6DasYXCSZrttIsVw10v/AUzJWXFUKkfLBjgbMHZrGtpAwX9ZSeUkogG?=
 =?us-ascii?Q?+9baYrLFtuLG09oB2di7w2TJxUpSX7SuhZTNGo8lYRrGS9KZOlu9CY1WQpMp?=
 =?us-ascii?Q?iDlz7H5mZhIXcIIhpPr3H/bY49CUTTVo3ZufYnvq37JyUrdEanq/aK2cfotZ?=
 =?us-ascii?Q?wQEEjnT7qDfwNJMdODKovBSRoDD0BFnNJUfGLm2epdPSBSq9kVZe0licgMyt?=
 =?us-ascii?Q?3UXIUh29byfYduAdo8hdCeAOptYd8bNtqyIb/0QdnDvEJE6ax1gKD/R0GqJt?=
 =?us-ascii?Q?LbNw6uxNCd57p9ippFHYua5rrDZ9wImWSeIyv5C2lwc+AxuN3BTN0a7Z78Qb?=
 =?us-ascii?Q?/8UohaeFf1maCBun9/WG89iWFydlgC8gqT4aP5zQJ/YOetZnJhXtFbSOuddt?=
 =?us-ascii?Q?J4eei1vsTeD6grmPTgIa9qlYs5UdXxCHHTIbhSL8h53Mu7xcsZm2pUdNgo7l?=
 =?us-ascii?Q?tYikEvS8CDcpKUD67Bjim8c9mfZSAhe5/lsD9DoPgfKH89Aq2G8QYBOThkzY?=
 =?us-ascii?Q?1tX7eICdSJ2ZsnrKjAAxT+WwBFJoBADap33D9knqVa5e/rUL2j9HBFk3olSq?=
 =?us-ascii?Q?p9kSncdmsW1oZUbpJ27/Jw6ZeO16iPTu3Hf/c94aj4WfypEl9inIMwvqmxjm?=
 =?us-ascii?Q?e6/7V4SrdvMwDu83pYbq+IyXjQUj9jMEyKSZz5W4K3FxnNuI/X48jio7Z/iA?=
 =?us-ascii?Q?9EriHBvoCdrSXIqjB7OSddumnz70DsKbEz6LFngAspipVQ/LLJvD5v/XsmDv?=
 =?us-ascii?Q?4oeSbtzAOI0iPiVGDCLAj59h0XlftGm7ClUxWvGlvVr6fjO8eiEo2BaxiIHW?=
 =?us-ascii?Q?CsfG6Lc0ItuRxMMb+agF8X0l/rXd6y9URIfp5UDCkiKfbTn8Usl5e0iJC2Vl?=
 =?us-ascii?Q?GSRBg4SvZi+yJ/qL3QbBHYScFaUL/4ppizzz1XVFURhFSy5N4fy6yMJE2RTF?=
 =?us-ascii?Q?SBEQ7MLIg1eiRGX5UPVR+SoZOFMnwWMPwVDJ3RSaHYIOtOk9Le50IQ+gzKrj?=
 =?us-ascii?Q?W2QMo14n4C4h+Nk5fopO2NFPpIEmFNNk6jY/LRlfafHqMTRny+81hxlbebyW?=
 =?us-ascii?Q?4VsJ7A42hRaQlNQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 09:00:25.3720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d30b29ce-4b71-489b-d3e3-08dd65fb52b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805

We are missing a way to detect whether a user provided a value for
nr_spis equal to 0 or did not provide any value (default is also 0) which
can cause issues when calculated nr_spis is > 0 and the value from domain
config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
(max supported nr of SPIs is 960 anyway).

Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_spis value")
Reported-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 tools/libs/light/libxl_arm.c     | 7 ++++---
 tools/libs/light/libxl_types.idl | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 2d895408cac3..5bb5bac61def 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *config)
 {
-    uint32_t nr_spis = 0;
+    uint32_t nr_spis = 0, cfg_nr_spis = d_config->b_info.arch_arm.nr_spis;
     unsigned int i;
     uint32_t vuart_irq, virtio_irq = 0;
     bool vuart_enabled = false, virtio_enabled = false;
@@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 
     LOG(DEBUG, "Configure the domain");
 
-    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
+    /* We use UINT32_MAX to denote if a user provided a value or not */
+    if ((cfg_nr_spis != UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
         LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
             nr_spis);
         return ERROR_FAIL;
     }
 
-    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
+    config->arch.nr_spis = (cfg_nr_spis != UINT32_MAX) ? cfg_nr_spis : nr_spis;
     LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
 
     switch (d_config->b_info.arch_arm.gic_version) {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index bd4b8721ff19..129c00ce929c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -723,7 +723,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
-                               ("nr_spis", uint32),
+                               ("nr_spis", uint32, {'init_val': 'UINT32_MAX'}),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
-- 
2.25.1


