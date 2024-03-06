Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13079873FFA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689470.1074484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwLz-00083Y-Vk; Wed, 06 Mar 2024 18:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689470.1074484; Wed, 06 Mar 2024 18:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwLz-000815-T6; Wed, 06 Mar 2024 18:50:59 +0000
Received: by outflank-mailman (input) for mailman id 689470;
 Wed, 06 Mar 2024 18:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toy5=KM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rhwLy-0007k1-Jm
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:50:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76ba7427-dbea-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 19:50:57 +0100 (CET)
Received: from SJ0PR03CA0115.namprd03.prod.outlook.com (2603:10b6:a03:333::30)
 by PH7PR12MB6393.namprd12.prod.outlook.com (2603:10b6:510:1ff::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 18:50:51 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::41) by SJ0PR03CA0115.outlook.office365.com
 (2603:10b6:a03:333::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 18:50:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 18:50:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 12:50:50 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 12:50:49 -0600
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
X-Inumbo-ID: 76ba7427-dbea-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHlGKkbhfi7Hno1lfkBcEycr8YCl+rP1+Fn8GGHHSAaSw6tYYTXPceyeAWBVx+OcoH1DPyLltbJvAII5Gi4RDlzJEYUjOz03gkA3WUFQhlqyoOqQAnYVNjynKvhJyHdq646IPwoF5FSUoFIHkwUo8XmbzudXdZxkHRznj8RRxCISOVdlTVCMteA8RYySPyEjmSAg8/tMq3bMe0tQtagBg9W+YoAr9henhTIX/UTeBIZTA21p4E4hRUoUuof+m6yXab5PwTzCZfhSvORpp0Sj58o9hLKNjBctjf1B3xx4skFHM+RCk5EcYSvk0ljnliYKYcnKen6ENIjFwAlOlNG5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI4hrktpx/kWTNvhDVvDVjPbshJv3KJBlQbf2ujpAwE=;
 b=YOg9uJzfvyraoU5rWhFC90dXk4cyqI1NfB/oLyMp5ilzlW0j2AeN6cXvgg/weyMr8u9TyY7Sn1+adXNIcVqQ6Eba7loAESyPmOGG6p/9xhfYRgKz0Vhf8BdZZUCGuYWyFatfh/rWiG3nS+OQa2TXtdMSE06/pbkXv7b8Ijdv8o7VyjctD5I9ao029o1cWjPEpvCVNK1OaBWijDRq9/sDekoPOGrz7cto0XTtjoJAfjItTUC+XJzFZ+C8MTTcbaAWNTojyardwCdGt6BIO1VPruWGDHLxUVa1GIWSS8USLsccOL8YiMvLGXK2zWvvyKV/YcNdq8BCb3M+PU0WXC3wAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI4hrktpx/kWTNvhDVvDVjPbshJv3KJBlQbf2ujpAwE=;
 b=F5pxZkdpyntkA89+NaICWhOxyjVJ8Q5jfDN3PuXiHHok7ReO50KGp2ZDQ81CIcvROjlDriGQPXQ8NK2Oj9YTLwpcCg7mDLuVvaSh4LYO8VO23hgRqdAdeOuXNPPN4kcaSyJPZsk2xKVugOJ3JvD76eDvxbNlAM+kscBpoIl/KOI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] features.h: Replace hard tabs
Date: Wed, 6 Mar 2024 13:50:30 -0500
Message-ID: <20240306185032.103216-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306185032.103216-1-jason.andryuk@amd.com>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|PH7PR12MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: daa1f0f3-b79f-4560-aa91-08dc3e0e582a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+E05yt9dPVP8ofr53jEtvKaCBFI/G/YO42q/37LEL6XbUxv1xfxpyoWIZkBk3GdaBxbjQaZQLSz2sFVxgEPXo/xXt+ObELXOqOUX3cnJUgkwGO+8H9NNzvKkafc2DwztYuo4dzItFfiSNpRCQ/G5UbbslukzWZ6Usv23uWHmiEYV1jOyPaCq/MQ7pj3zxQxx65I33qrhp7e/fgwfqeq8TYaOxLN/Qle7l9EPlB2EoE3vyJpbY3mCB34hDlMVQo9l5a91jROOgsQfbyc34JyVzlszEy8EyNyGqmQ/UuZbpxi+iup+2yFgqYnGU4M53Zcduo2YneRc321WhP3gN2mYzWliVWEd+EQupnCHlW2Bbd5VXgXQLd2DhPKnoKwiwe4YUWUb1q733LrSqxe6Jp8P68EDIttrp7fE2WsVUIH8Wv1g9QKMZIdXmxED7E1Z5iHj9cSBuhSgiAz6uCIqZjV4b+N9W6cp1bJ23IiTmw1BBvFA1a6zPAWNNXul8iJolpo7IAXffonZu1H0WCPMfozdg530zjgDDNMaA7xHz7itU+DNmaJaCRjrfgvVW2KcHlzS9JKaNQT6DrMRL4SBEqvoIBNPHzcLhbvIRD18jnTXqoZvGwisTSG4XwoUVIH1M+wRYyQVAXXugzSndg34hXaJZMYvhsJzmPiGf3kIipJtZiqEO6c+Pp7Tu1t8ph6tDQeRT5SUD8v7iPDkGMpka99yMEOaHRawUTAJeyOvwLlmMqOMO/Lfbg7E81E2ze7sh5Vf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:50:50.8173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa1f0f3-b79f-4560-aa91-08dc3e0e582a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6393

Replace hard tabs to match the rest of the file.

Fixes: 48a3fd1432 ("domain: expose newly introduced hypercalls as XENFEAT")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/include/public/features.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 36936f6a4e..4437f25d25 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -117,8 +117,8 @@
  * VCPUOP_register_runstate_phys_area
  * VCPUOP_register_vcpu_time_phys_area
  */
-#define XENFEAT_runstate_phys_area	  18
-#define XENFEAT_vcpu_time_phys_area	  19
+#define XENFEAT_runstate_phys_area        18
+#define XENFEAT_vcpu_time_phys_area       19
 
 #define XENFEAT_NR_SUBMAPS 1
 
-- 
2.44.0


