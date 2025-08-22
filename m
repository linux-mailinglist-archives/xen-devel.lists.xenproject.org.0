Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBBAB324AC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 23:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090517.1447680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXG-0003gp-8E; Fri, 22 Aug 2025 21:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090517.1447680; Fri, 22 Aug 2025 21:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upZXG-0003fL-4T; Fri, 22 Aug 2025 21:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1090517;
 Fri, 22 Aug 2025 21:42:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21kD=3C=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1upZXE-0003fE-K0
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 21:42:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2406::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4be28f6-7fa0-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 23:42:53 +0200 (CEST)
Received: from BN9PR03CA0238.namprd03.prod.outlook.com (2603:10b6:408:f8::33)
 by PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 21:42:49 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::a4) by BN9PR03CA0238.outlook.office365.com
 (2603:10b6:408:f8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.19 via Frontend Transport; Fri,
 22 Aug 2025 21:42:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 21:42:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:42:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 22 Aug
 2025 14:42:47 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 16:42:46 -0500
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
X-Inumbo-ID: f4be28f6-7fa0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/niGyqR16MjsluXufgZdJ0m48OUap3sWQzqZ4d+QK/rWPrRv+/VaJDQZFTWAjyZxYVnLBgWPBYwx7KECChh609n9Ds+4hYb8vJyHA5orPn89OTv6IcmVhBr0kdiSjgfx66a9h1rIzTS89WNMXnu4rZ/tCnaU3UzovgPaIFOsGf/m/VE2leIERuosram0eW7Rcx7xBhxXtwpDWpeTB+otW1qagPJcAf0JpytFKwgAL8G219dDiNPwxN38c/eXT1//HBsy+VVP6xvPpDg+IXrgWJRdf5qPLY4uhatjBrty6wNti/mgR8NG6bQlSWgL/rHgL9FKfpQH74Z5TaPH7PNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbu73Ej5KNKqR0pfX9Z8GFKRQCNCPPS1IS5IJ85PqyI=;
 b=elEQ+ZgCSHe4GwCbXmfqCxuWE3OaBJUexAlRVtCt5ToebhsmySjTUbw1KseGXR4hfLsrvWUYoYAqa8gUK10bQJWEbnILmG+aONDlXMQ4+Ym4ckLDvtrt2awwQzCV0Q264Cd+GqKU0MCdsHQUXR82ss1C9+cFmQu4RV1uK5sTnQfPItHco3oGo+yX8rjwlD6SxjldP2jthgKamV/N56HF2724qIs0QX+Cy2IDvqqd+4UWeJXvrNkpEeWYGXBsASFa+5PcI4x1qc7jiGQ3Moe0GuFO32UTqxkuIIQDcEOG0/Rs1tPyl23zprTeSs/33JCY9rDmUniYKx9vif3LwWT1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbu73Ej5KNKqR0pfX9Z8GFKRQCNCPPS1IS5IJ85PqyI=;
 b=zL3uc3d46h6iYO93fk0b7m9Xmf8g7fXaflrz3shnFIH05N0hCS54imlR7SZFOI8+iKJq/4Nses61ytHnaKsnEB9i9EsIQyj/B6hK7TnOkll7+rxIvfpM02Y9fLQJ/h1BAxdoljjFLxsu1Bqa66SEmfnuOGkT/RhRSkHaTzRzJKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 0/3] xenconsole: Add connection flag
Date: Fri, 22 Aug 2025 17:39:42 -0400
Message-ID: <20250822213946.245307-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: a237f625-be7d-402a-9bf8-08dde1c4d635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CZxzREXod1wiql8ocNt7+c54aC4qmZqLFTpV+ZpLrgAZK2Cxdq4XNh832O44?=
 =?us-ascii?Q?9zmF2VjQ83b0YeUFE4DWXJ20kGwhSjj2FAMY4FaQGWkMYdL63DIu+sPKaOgg?=
 =?us-ascii?Q?Qe4wteKKIt3t4n2z+nxSXf+wIXvDSR1a9MneU2za0LD6HRGTooLJeX2zvthf?=
 =?us-ascii?Q?YsguoTye9Ygtq21J3cPwAnbcwIF4koBHwqTDZy1a7aux5IT+LWkdi+pCZN4U?=
 =?us-ascii?Q?PhLBTCFtLy/fhrnawRhK7Gar+D4xlvD8T8fCQZ4shp3OqShZ0lqmSUd7t3J5?=
 =?us-ascii?Q?6V55olTdmQkgBi/l+M+4swbkrqeoiWh2MPYZbv9cOkYZie8pnu/+vu9eupo6?=
 =?us-ascii?Q?Rv0peBMKZRxoLid6akqRgcxUTIb1FncujYNEjqlzmW2FajZGml2HfJHo2rkl?=
 =?us-ascii?Q?I0BKfHp3fELQyrUoKmuPSk2ifKqjXiYQXszd0lY6PlHmE4O/rRswJvV1oamL?=
 =?us-ascii?Q?JtwVf/a2GUaywgK+Krqb81JOE5T1swG9m4ipm+5nq4ipmBEFXB7uT/SXugPx?=
 =?us-ascii?Q?HKZxl2dqrn2iU4hAri0U1NS3m7M3nOSVc9A8RCMdhMA9rgP68KH/JRv3fPOh?=
 =?us-ascii?Q?CL+20WM0W4TVKwD5Cq6C6wn5M47IbMJ7QYWYP778FhDmroCElInls3i217N5?=
 =?us-ascii?Q?JFvS9DYGUyGuqspdmo1ROyksIVN8aOm2eIGwDCymVFiT3ew2yA7gNYwa4Non?=
 =?us-ascii?Q?k3csa5hTBTjvvD9AIWFenf0FNVI/rOsa+hiecSiQpa3IHPB57cEwhMM86fFV?=
 =?us-ascii?Q?W7oRXcJ4lD92kwKhkAyBu4PLdiJB48AjMPzKXzg3+ElVQVpbd61fLTe3uxrz?=
 =?us-ascii?Q?yvJMT10TBCIWh/gzgENySz9XHXxcYBK/m+ikhDOfftTckDqc0JOiQxR1PxKC?=
 =?us-ascii?Q?JPpSFxscSistrM8/3VFsRRleBuOTXKfK04APZB9Qi+eOb6TMLf6Tn7OEMOTq?=
 =?us-ascii?Q?CMG+FZu5yMoEJZAhVG6zcK1frd03o2bttOLvHNTQ/NfA2IJP7MsnSSLcwb2T?=
 =?us-ascii?Q?uMw0yO5g1o4kM4WK2DukrCqKCmD7bdGdx9Cr4MjVrUXg52lHuliQhSftO2qL?=
 =?us-ascii?Q?zmipKGyTFzNChFc6A0n6iEBgyMfxhrjOzwjKFNz5tzbozqs6OTXLTkVS6U84?=
 =?us-ascii?Q?2GLRz2vZn2NjTPg1TIsiWKFHRCg7ijPNsWZCz1PEH+m7WMl5Bdn8I5ZJr7hu?=
 =?us-ascii?Q?SmUwLXElBRyuZeAnC7mkiy9hKJrS2QoFav+XBa7E9c+OaU6Cl0yNZIqF9rZ5?=
 =?us-ascii?Q?wYV8BKfQSnTyqGtVbQNOpccaiXxCZxwA2+3MevJPP1jaw2OT7/f9xSq5t8UU?=
 =?us-ascii?Q?79KeaRy9tEHfbLH9STUH0fP6WDkF0453negKlIK/UVBQzAb08nGCqJ2T5ElD?=
 =?us-ascii?Q?mYCd1Fn7Aqy1UfIv4+7jD/92oG97bRUH8abAlUB6Ki/MZDQwoJTh/Y3MCxqb?=
 =?us-ascii?Q?XH0ctCJkmhkSmcjKjGYXeLSM9rfZ1DzzgdG9g7IFiX6VFLdWcYz2+ie7JePW?=
 =?us-ascii?Q?TW95UR7WsBRRhoM/yCBEWjnNXbtlkJJMdXlU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:42:47.9712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a237f625-be7d-402a-9bf8-08dde1c4d635
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539

Add a connection flag to the console interface page so a domain can tell
if it is connected or not.  This became a series in v2 to add flag
setting to libxenguest.

Jason Andryuk (3):
  xenconsole: Add connection flag
  libs/guest: Set console page to disconnected
  libs/guest: Set console as disconnected on resume

 tools/console/daemon/io.c                |  4 +++
 tools/include/xenguest.h                 |  4 +++
 tools/libs/guest/xg_dom_arm.c            |  2 +-
 tools/libs/guest/xg_dom_boot.c           | 36 ++++++++++++++++++++++++
 tools/libs/guest/xg_dom_x86.c            |  6 ++--
 tools/libs/guest/xg_sr_restore_x86_hvm.c |  2 +-
 tools/libs/guest/xg_sr_restore_x86_pv.c  |  1 +
 xen/include/public/io/console.h          | 13 +++++++++
 8 files changed, 63 insertions(+), 5 deletions(-)

-- 
2.50.1


