Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A3687FA27
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 09:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695267.1084895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmVBZ-000639-OK; Tue, 19 Mar 2024 08:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695267.1084895; Tue, 19 Mar 2024 08:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmVBZ-00061K-LH; Tue, 19 Mar 2024 08:51:05 +0000
Received: by outflank-mailman (input) for mailman id 695267;
 Tue, 19 Mar 2024 08:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UIi=KZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rmVBY-00061E-3x
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 08:51:04 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdd2cea0-e5cd-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 09:50:58 +0100 (CET)
Received: from SJ0PR03CA0183.namprd03.prod.outlook.com (2603:10b6:a03:2ef::8)
 by MN0PR12MB6366.namprd12.prod.outlook.com (2603:10b6:208:3c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 08:50:55 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a6) by SJ0PR03CA0183.outlook.office365.com
 (2603:10b6:a03:2ef::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Tue, 19 Mar 2024 08:50:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 08:50:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 03:50:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 01:50:49 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 19 Mar 2024 03:50:47 -0500
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
X-Inumbo-ID: cdd2cea0-e5cd-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkDKMetPCb+IiWrMHQAzXdbIXIvP0u5RHWVjHVHdABOQn/hWSk/u384nZZES7rNd0Jv2ZhWC8wDWc/VJ+pVvvLh67f2fMCtB9jrXkcihKdksTw6iL4cJdmYG6zSp7ApSxrDYjFn9joebLj2FIRkEviXZFDy8jW8wkg2LHfx1Pbr7SJvFi1MiJRPhRi+zwJv6T43+2XiKMs5GCALAYJhokXLebaUXltqe3mFnRwYDvJFBEbxqh+zV372GaGGeFYsbg/aQRBW07p0qrpTzG8tKbmIwtW+K5CcBTM3ud5zopNRUnXcI8kyLzZsrPX6G3YwuTeoz6w0KueJvPj6I6rfpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdDJYdknS09+FYwajqYMbDGtPefBjlnA7m8a0jJp1AM=;
 b=MGPk7g1yX3SetnZ15KTDxMnEUr3Ib/yqdqF12GrdN3FIjv/LsOijUhhUaw6x1i/urVMav9N07wU7rxFZMc62s45ETphB4HSSBWDO4t15YlFseTl+lRXvIXkWiZRYpjrkddEWlAg/zRjqueUGtSpfQrgqTUW/xzowuA33PSse8GvACIV83b0pOIWafnv8fn53UtNE+bQ0lq3UlVlibKxXzAV8lZQn+GJcpIOxAS2nKMTBQBW+QAUxxA0BbW2f7gFkQyY8uMPftjImTcWXG+O1FWa5zOoBgxPcKMN3btLLBjoEsYeQu/fM8g07hoWiMnNda6qWEwZqMY0i+Zji+VoS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdDJYdknS09+FYwajqYMbDGtPefBjlnA7m8a0jJp1AM=;
 b=a/5y/Tzv933nrSz3J8EQ8YNmyLC53rXEG9CzDLy9JLnDgg7PBozVuv8nU611tYZIVIBFUNF+/VSA7NEaxOwv5nLY5+GHrvyv07u66cBdnVgkBioA0mtgFEGet7ValdBjjwLVifDqmjF6ZTwjQaaI1cPsy9nmFzfgcp3OoIdNO+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH] xen/nospec: Include <xen/stdbool.h>
Date: Tue, 19 Mar 2024 09:50:42 +0100
Message-ID: <20240319085042.28470-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|MN0PR12MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 74134a8b-c3de-4ecf-7418-08dc47f1afbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0nXG0hNw7Pwn0YRZdurIzE1JGZn2lZU4oDEb8Ci+WAHRABfTuwNqD//vTFs2Lc/ZUEcN0opQMX1Mlxwj3LvD7M0nvY5v/4LIahsy7o1JeUhc2ae7WOPqKW7ELMwdg+L6qvGKllMlMnzH1c3S9cfgZ4/8VQ1clJ4z39Ekcy6bwZ0SaBOwEQgWXvrCp6q+lSVz0WciYImB3CrNKDEpfucyRvhtBiCf933OwEKYWBh9iesR5inKUOnIsThFMuUUssY68zfEw/iNPcTUS90UFRHAIDU/zhjC7BB5E7dbyGZLASKB6lpN7/BShBamtFTSWPqpzPcqPVE5pcOZeZeQSKXwBZKcS/FSlokt90Lu+RIBrtqkJrd5MguUcHjtltK2i1WSY3IGfqqqcUXTb2tUSLzI4KGm1u8jRgtUoxObNF6Jbg8T09yndSQ+LmiD1W3ch78mea3UuyJn471wXutr11QvLUJtHeZad9JqsjOo9V9wbPf2MXYGjlw9cGJoS4U/h8G/Jf+YOAy3n9Ido+4L8a0FBQJ9/Wgiibdu8rq/fe9xckGM3I+lSfAjfv3WaDeXxjwjYDHRU/y8YR5ORZJ2VIH9TWSo73GICpIAgERWqppmrFAhO4y2cJonsdiGNSUS5MwHmhp2KYsPe/+r4QnL1Q02eSuo/uzYGB8jzA1LaAQzfU0P36GshVAyI5c++PAvkf++aFCY3f6D/YW+s+HLIA/myLS1e1dkVkSkjoQE7s9w0lcc9Dmi6PiJ1HSvg6/HpJad
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 08:50:53.9455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74134a8b-c3de-4ecf-7418-08dc47f1afbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6366

After introduction of lock_evaluate_nospec() using bool type, building
Xen on Arm with UBSAN enabled fails:

In file included from ./include/xen/spinlock.h:4,
                 from common/ubsan/ubsan.c:13:
./include/xen/nospec.h:79:22: error: unknown type name ‘bool’
   79 | static always_inline bool lock_evaluate_nospec(bool condition)

There is no issue on x86, as xen/stdbool.h is included somewhere along
the asm/nospec.h path, which is not the case for other architectures.

Fixes: 7ef0084418e1 ("x86/spinlock: introduce support for blocking speculation into critical regions")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/include/xen/nospec.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
index e8d73f9538e5..9fb15aa26aa9 100644
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -7,6 +7,8 @@
 #ifndef XEN_NOSPEC_H
 #define XEN_NOSPEC_H
 
+#include <xen/stdbool.h>
+
 #include <asm/nospec.h>
 
 /**
-- 
2.25.1


