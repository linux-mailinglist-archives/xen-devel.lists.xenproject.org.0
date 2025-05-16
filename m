Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941DABA680
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987719.1372981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NL-0007LL-Tn; Fri, 16 May 2025 23:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987719.1372981; Fri, 16 May 2025 23:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NL-0007Hb-PL; Fri, 16 May 2025 23:21:59 +0000
Received: by outflank-mailman (input) for mailman id 987719;
 Fri, 16 May 2025 23:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQOe=YA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG4NJ-0005s2-MK
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:21:57 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2413::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dfec691-32ac-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:21:55 +0200 (CEST)
Received: from MW4PR03CA0179.namprd03.prod.outlook.com (2603:10b6:303:8d::34)
 by LV3PR12MB9093.namprd12.prod.outlook.com (2603:10b6:408:19d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 23:21:51 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::33) by MW4PR03CA0179.outlook.office365.com
 (2603:10b6:303:8d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 23:21:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 23:21:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:48 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 18:21:47 -0500
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
X-Inumbo-ID: 8dfec691-32ac-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVQKfLMh5iuSxX7mG4fUMwovR6UhXUUhvjuA8rXPOmL4BHVE2j7NGiXKK6zqz5nuJmcK2v0xHDwVwsHSxgS54ibdgxTTSv30o5TyEuW92IDFdJxxUocdSFWVizlOUKeNU/kRdQbgtBz2MHb+DNbLRBi0PZa/NWW5kgiSHol4EQ4ZDJAH3JxELhKdzIbTHARINwmYONhHcFC0Frkxjxdfl14xZgfeAbijEUUy24AyhLzu/MC/eUTe8y6IfCHbehyc2LaEW9Tc5sFA+PvgTqKJKSE9ZopWhCtC8TTnrj0jHgFw08orGjSP3jujDOKoTXeuBPFfIEv06OxWFGtEEia0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK+KHWKqgLBHIw14tu9e6rDx3z6/no2a/sVRmU5bVsQ=;
 b=MWB/cqI9w8folzAL5D1YgY1GgMxC+u4FcHVyczq6bxtdDH2gr5xZqTKEn8hju4nQyKx5ziEX19Y5/b33Wt2Qg7EnuY51zghpOTRwzTaLh9bZBsDvnE7VUKeS4kG0cvDOOaZ3kTTj7E3Wb+zYpNagrPMkQg72n2rZZCtpfbmrDfNxNjTda/SIxDit01jMrB+ygbzg0r1eHW93ojSaZxN7PdClbW80MSpVTQ9m/71H/1ziuAhPy3oyKPVW3YWZep28ajC2snN7Z4DUiEJwt5N8QYLr1e7fQz4+MhnvjouyJ476skxj6QgSg1XjA1NsfzWEwV2FM9rJaM59nXIfCzu6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK+KHWKqgLBHIw14tu9e6rDx3z6/no2a/sVRmU5bVsQ=;
 b=a4jSFM/Yhfi7AaMtv7DlXmM7QRTwDjPGunXVWYjNUMwtNjiReP6IN1oGclEO0F7qN3pwXl6EDgy7EbbO8n5juxfwOctCUK0W9rCQ4P1+zce3e18coF+LBIBFyPPO2JHKZi9Yt/a7OYS7WQbgFPTmkckvxaMMLNyyVQkACtciTIo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH 5/6] x86/asm: refactor inclusion guards
Date: Fri, 16 May 2025 16:21:29 -0700
Message-ID: <20250516232130.835779-5-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|LV3PR12MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c262b4-0e9b-4bb1-6e45-08dd94d06f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XqYaRiVgtYC3IH4lCswyyD1yTDk9EXcntlAD4v8+DAz2RE7YbQYiwQzVOnyh?=
 =?us-ascii?Q?RkRFJrosUh7bvZmjHEOmyMyydRqi8WXensNxyHvyZQxYnMyJc/fYqZbCJMHN?=
 =?us-ascii?Q?Taey6QE53Zh4XAcEL10qgCooazax81u9P2BQD5ylji6OfGf2+4Qau4CgvsCh?=
 =?us-ascii?Q?UWKN9mg8PFYcIIsfZBqmqjDElCYDS8dXuUDslvadBiqVJxFU0pvdEGyuPG1S?=
 =?us-ascii?Q?lsQxxXgfKy0jEYnNOohVOfKN4vrgfc7k+KorI5zD58tuLx8T+OxaqfNDyn54?=
 =?us-ascii?Q?JDjUd7bufHHeZ3XdMovcGR4qpfaChUqpfmO6yTrJsygQzbR4POzJvSqvCU1h?=
 =?us-ascii?Q?YHzlArQH83vTQtjUDzwfU3d6RNeODsViKjBwPzUW5mO29jWr03KDFfzWKuio?=
 =?us-ascii?Q?4BZ6dCcupbdXnHUDEg1559z8bDjOelbSp9zBKJBrzdccnugDPwC2vRDpjIjK?=
 =?us-ascii?Q?/vFupmeL5IKy29wOoojShIq4lzNPFWoGx164rhExSOhM1Bar09CYT+uwkd6C?=
 =?us-ascii?Q?fH2VVe6rJJGuBwfDhMh1EZxies61QWcfT1wec67sEPDC+P4h/bFuAG/PyXfn?=
 =?us-ascii?Q?BlKCQS+nn4Mv9zFW5Y0eVbieFHN5HWOvjGZMUKTay0+YpY9KikTMWGtje4k4?=
 =?us-ascii?Q?DFoNxUX4HTYVJAbBBc4xvULmVyYsd3DiK86QbERhjayibf5+i4ysHNE95fx7?=
 =?us-ascii?Q?HRGgHZos00OEnfw70HzqMgjMtIwJtM9oleUtBCrSP1YuQinBa3vC4tr6rnsg?=
 =?us-ascii?Q?HESXcCufbZlH/pqrx0XzUidPYlTtmKthI261nhgJsiuIeewssWbB/S7etYbT?=
 =?us-ascii?Q?lDI9RJxWvh3xMUJ56iZTirh8SLce3IYFMbvmS6ZL0uwUIDeqNmkW3TNLUa0U?=
 =?us-ascii?Q?lkHuQrckg4zEAGhgolS/M+3HcQIcvgA2J30dJODP5fa5v1+K+i8qJzVQGjoT?=
 =?us-ascii?Q?WBNLrn4BE71vQSwMao/+5Nn66HnRXxeTYqVT4gx3reVd+Kx3P6APf0YC7UCg?=
 =?us-ascii?Q?qRWeu3WrorUU9FCKRz6yD8cGjc10/S3m3YDmcTiEYbrqX6tDIOUYyX7s+gyo?=
 =?us-ascii?Q?+LjRVS7KBYwoDKIuqmFYlGoqy9eCBWGyFiVwQz2UcUMLCAvSemE3LMP6QHFn?=
 =?us-ascii?Q?iOs5oqYxCPO0ZUAmn3CeFhnT+hapF5jF8akTPHD6ute6lz8fBsJZ64i/qyDd?=
 =?us-ascii?Q?Id2VNJrorVkl5NG3hC9i5NKeZKe458JFwORoASuKsBot5JZ84HLi0e9JmP+i?=
 =?us-ascii?Q?inNquz6osiErf5YBDrbHsqmIQOPSkD4OgyQm8PilkHK1EuAto0Bii3pU4y2R?=
 =?us-ascii?Q?ayjo0dr0mPynGlyOaHWkqAxDFcmSuOadkryegxLcqkpbzrrog8Vu2oaJwa3x?=
 =?us-ascii?Q?OHUij3NgI0cLt9G1duB/xnjICSXO1ggD6USYVLYAKEnfUVbCtwao80hFY4nJ?=
 =?us-ascii?Q?69qvqb5T+8xfvmSTEimm2K9qwe2HnRF+ofi0+i9HUNqdLSlg5QJypjEPj2ui?=
 =?us-ascii?Q?F4uqxt3s3DngOFeWeV/LdgMwE40OcmzRvqcE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 23:21:49.3256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c262b4-0e9b-4bb1-6e45-08dd94d06f19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9093

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Directive 4.10 states that "Precautions shall be taken in order
to prevent the contents of a header file being included more than
once".

Refactor inclusion guards to address a violation of Directive 4.10
and follow CODING_STYLE.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index bedb97cbee..ce724a9daa 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -261,17 +261,17 @@ $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefil
 	$(call filechk,asm-macros.h)
 
 define filechk_asm-macros.h
+    echo '#ifndef X86_MACROS_H'; \
+    echo '#define X86_MACROS_H'; \
     echo '#if 0'; \
     echo '.if 0'; \
     echo '#endif'; \
-    echo '#ifndef __ASM_MACROS_H__'; \
-    echo '#define __ASM_MACROS_H__'; \
     echo 'asm ( ".include \"$@\"" );'; \
-    echo '#endif /* __ASM_MACROS_H__ */'; \
     echo '#if 0'; \
     echo '.endif'; \
     cat $<; \
-    echo '#endif'
+    echo '#endif'; \
+    echo '#endif /* X86_MACROS_H */'
 endef
 
 $(obj)/efi.lds: AFLAGS-y += -DEFI
-- 
2.25.1


