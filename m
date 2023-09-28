Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A687B1B6B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 13:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609526.948644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpVf-0000L8-OA; Thu, 28 Sep 2023 11:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609526.948644; Thu, 28 Sep 2023 11:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlpVf-0000HS-L5; Thu, 28 Sep 2023 11:48:47 +0000
Received: by outflank-mailman (input) for mailman id 609526;
 Thu, 28 Sep 2023 11:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=baK2=FM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qlpVd-0000HM-PA
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 11:48:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e89::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f960d76a-5df4-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 13:48:44 +0200 (CEST)
Received: from DS7PR06CA0005.namprd06.prod.outlook.com (2603:10b6:8:2a::20) by
 SN7PR12MB7274.namprd12.prod.outlook.com (2603:10b6:806:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 11:48:40 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::41) by DS7PR06CA0005.outlook.office365.com
 (2603:10b6:8:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Thu, 28 Sep 2023 11:48:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 11:48:39 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 06:48:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 04:48:38 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via
 Frontend Transport; Thu, 28 Sep 2023 06:48:37 -0500
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
X-Inumbo-ID: f960d76a-5df4-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMPodM3XbNxASitkFfwSazORM1qeqtnUaLuw8rNyR8eE3VQ1oa+rs1TEkAclIEvwnQR0C1wUBzvZP/4q2NcyP8PuNehbMVfBytJCimXABboIKFkf1jkbOAjKdtVqHffw8BEcSLrHkUYEJH1xaWaOa9D0BXAo1fwBTMs8lA7oidzWGubHjKOVpnu2guJiiR9Vk+h3dDJ0cljcjvvH9d0FBnk6XZQ+YjH7UnM95NnrLX8uaLuZOfKqBhDRIYCjY9ANjM0SCXfr9h3xL3DZeLTSXyocZJ6DsgNK9x8af7jH6ZdQtriJ4xVgQ6rHvBgqlHx/fKEDpGHvBqS+6OKj2lEsDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuvlsZm4EMigaLXq8EkQf3gQOt40eTrodiYgA3KbH5s=;
 b=Z7b49BG9fFhByiHun3muTDtIzT+ZX9JvnQ5CwxksiHV39hIZ2WIs0/XhVSuyhcbv2tnTTDFWlPgnsBnUz60/MRUuty8Xep1Ei9O/lBC2AsQG5A48JWc8Ab0U8CHke3JGCxsGwEBdTMarOMsJRpxTb/OyXZGd4jFvN9kfQsncZmE7/of7D23IaSD2Wkk+pOZFmPaghI56KF1sZwpMQKXyNm/VwrbWnSy2I1hHfo+uy8+bK9zhafs2sVbbUHsvxw2hwXOczN2VNKMsdC9lH8cBgYJgajNEAUa2W3tNUxZTbUxVf/lCPbtotTl4WrcmDRum6v7fk1Yzwqz6Oqg7LjM1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuvlsZm4EMigaLXq8EkQf3gQOt40eTrodiYgA3KbH5s=;
 b=haYTRsgb6hrPYWOaZVl5vFsys7RTxpfmUNNRp1pszr3HvPzYDliG1+YHAVIgSGjxTCfZdu5BWRplh82gpL5arboFJVDafJbAaK08UVD6TrPCS91ELTwo4TPp0Gyxh26zEFaz27cJGvHISK2sHX28K2os7WavWkCaM7OYfMs1hH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1] xen: arm: procinfo.h: Fixed a typo
Date: Thu, 28 Sep 2023 12:48:35 +0100
Message-ID: <20230928114835.2592187-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|SN7PR12MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9ec272-aaee-414f-d53e-08dbc018db87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eCxCsNCnrUeZxkDWSTRN/n48mmI1qidBlRMUKre7OVryvWUfJXR/jsS07DLQeJoLcxznhgYqzDR1ELjTdQ3u1pI3gCnOEfUcqTCBEGtFxWGnvR9NdeJBTJ8z4Kl+xbd79inMsR2262JBUqVuMu0R3PvkT3tXCKTuXtKshADQTmVbBUldwRjqgHwFoF49wkdKfCtuM/K7UApHq81yfk8CW6Jj0qcbrTQxobucsah9aGutMO0sQjfUs7Hd5AphM581MkNJ2Z5kJLuMwhfe/ip1v7wBVbz8yvuTulGycz1+bGPY7PkqQZNkpBDf3+95TGj0LBdy8G+E5qIAxJ10ZMO+09V1komeJJQYg/eriQu8Vk6Ies/hL9GPd52wKpl2uWvY4OfYomcDM8KxBKSjQfzwohYzrB+d+IH3Jo4tJXe/ADTtq/DbkmBgBmo9RPDDuZkc9nQFjnMkG4j+6Ymu+YEKYDXXywKPbOP0rD39UCcmloLU8PrqAacOVhLQmcciBe08wB3Icmhktq6FgZM608iI1zQBz+4ZuEkfFu2gPauTiiXFKgoIBi5bxngbqrJxJC8dRcgMQZnM5bVVwkLdtni3C1gZw4KH01JY0epFNz3AWx1CDsOPCvpvpO6SaqIeQ5HzdWAvu9ZhICov/Cr9qS6l+j1ldSefGDl2s7T/8+LcAlSCqgOsSRppUZ0Zlvwj1Cj888QO7zCuQHg+vfRykpvMj2A9oveVCXqnUkXXmrG/9pPFn7evzF/hkMxuCU/wA1QBhGll+FqWc85gel4Vs+tHqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(70586007)(40480700001)(40460700003)(47076005)(356005)(83380400001)(36860700001)(4744005)(82740400003)(81166007)(70206006)(2616005)(26005)(5660300002)(478600001)(1076003)(316002)(8936002)(41300700001)(4326008)(2906002)(336012)(426003)(54906003)(8676002)(6916009)(86362001)(36756003)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 11:48:39.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9ec272-aaee-414f-d53e-08dbc018db87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7274

Change VPCU to VCPU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/include/asm/procinfo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/procinfo.h b/xen/arch/arm/include/asm/procinfo.h
index 02be56e348..8b8dae3dd4 100644
--- a/xen/arch/arm/include/asm/procinfo.h
+++ b/xen/arch/arm/include/asm/procinfo.h
@@ -24,7 +24,7 @@
 #include <xen/sched.h>
 
 struct processor {
-    /* Initialize specific processor register for the new VPCU*/
+    /* Initialize specific processor register for the new VCPU*/
     void (*vcpu_initialise)(struct vcpu *v);
 };
 
-- 
2.25.1


