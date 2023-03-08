Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8A46B04F4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 11:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507997.782232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrMZ-0005nn-7a; Wed, 08 Mar 2023 10:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507997.782232; Wed, 08 Mar 2023 10:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrMZ-0005km-4h; Wed, 08 Mar 2023 10:49:39 +0000
Received: by outflank-mailman (input) for mailman id 507997;
 Wed, 08 Mar 2023 10:49:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxYi=7A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pZrMX-0005kg-Jh
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 10:49:37 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea1dbc04-bd9e-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 11:49:35 +0100 (CET)
Received: from CYZPR05CA0004.namprd05.prod.outlook.com (2603:10b6:930:89::25)
 by MW4PR12MB7262.namprd12.prod.outlook.com (2603:10b6:303:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 10:49:32 +0000
Received: from CY4PEPF0000C981.namprd02.prod.outlook.com
 (2603:10b6:930:89:cafe::b8) by CYZPR05CA0004.outlook.office365.com
 (2603:10b6:930:89::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17 via Frontend
 Transport; Wed, 8 Mar 2023 10:49:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C981.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Wed, 8 Mar 2023 10:49:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Mar
 2023 04:49:30 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Mar 2023 04:49:29 -0600
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
X-Inumbo-ID: ea1dbc04-bd9e-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frnlPcuhR7XV7yKljEQOkJdKoJH9ZPKEvwPOWf0R3lBt6rWOHCxnJRZvNrRaS5vrwM3DVDxbRLpnHrwvMzMx1LIE8loS8BOfDf8O9dM1/t9hBqzEmcDN6dugO2Ejndtk8eGcuMtSQ1GchPameAhsw3EeS6dMyRSR5mTiulZOy3sW10i3DudRPdxUm778RJMNn10ue1ejoxFcAhaGPdVdkROOMm2VcWca3LdfLyeChWedYzmtpq9FqiFq66KS5rVEvHoXrJkUa6DKNMoaqbDwjwazl+PXNBShNp/j+LPJ9m5HYIajWsiNJMrJham/1zZRU2Z7f+fyTY1KOjG5qplUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR4T2rVnujEKZRqweJsHG1eLhjrxQCnqKPb0MvKT94k=;
 b=k2ceXWFYbDE8P5UO4oCGA6iTyu2WBoZDlBsTYX+rEvE/AryRyMH+JqZ2XxDWx0PhJhcGP5xM+ZhGtBkldzKSmcZpk+m9P7A13v9rKiG5X5M7Lxvr6pxsOwio7OG1OlX5cvMb5SVAeBf59qZ2X8KsCc1aa0PPWzTRpeMJXosbpNXbsp3gxVHJYnKoO4xecQk1Z3Wp3FCZBk2CP1J+TD5IKvUVTNHzWp7KVAZn4jiAxkk+hdB3SXRgdoeEsK+jiWVViK4Pf1p+pZq6x7CeRcMCMvwf/V6hGgYXGGkKd4VFJpNMXiW6eShnw9o7AFk0AnujXAXICuPeYf1Jw0vM6Q4LFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR4T2rVnujEKZRqweJsHG1eLhjrxQCnqKPb0MvKT94k=;
 b=G5Ge6dHBUuTKBb6762Bra1W3DgeKwpMAkqgOMrzTEPuLEhSkU5WfdTo5agbX0UoOpaeks0ssfq0br15UgbcZSQ+rmK/1lKBaUHsBvd9Dgl4+2NgE1vF+xJTAfwT2WPttc+V/5Lr/vr3+l6GJkHdP0cAzOSPdvrztyNCM4PB6BUM=
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
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] build: run targets cscope,tags,... using tree-wide approach
Date: Wed, 8 Mar 2023 11:49:27 +0100
Message-ID: <20230308104927.18078-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C981:EE_|MW4PR12MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf2393c-ad04-4081-15c3-08db1fc2cc31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PSUzTsfbJ2cQ6iyLfJY5wE1cDozUfHo1imO+hFZB7q0xgYOrsOdyhy50WAZ2m3SrLl+4itnAbKCCBEpS6iBdNU/OfmZPc+XdTN8GqgSu5DjKou4QXCqb7it9koBM/pXO5eO3QVXzjCEcZLyUjGaFVaAldcmyYoU/MyBfcYeTvhlkYoIcUjqIPLrR1Ae4C1jyBrIgjm4zas2JIFJ/mL5JRk5iSwM+U3EFGquOVkjgYA9Z2kqBNzJ5C8JbJWmswN1KDAmWiu2h7Qq7YKGKXjspp19QBFweMv5QaIOTXtfO5cueRXYvs+r66T12JjLcIiNs0RXSjSgvKQoXwz2tFxNn2/n09D8b8DRORXkILyMJTiOFqCemO44EqEMGOkijI/8I5CUjFL66F7EKpF7Iao+juYJ3Y50A5saU/139/pOV62BRMxR/Z8+183IrZG4aIy9UbM840+zG+HQ+1hQf+KzjVuDSoFN8zvy3ijttEeN64a6/IuqeECJkjpH+1Xdh36wyglDXcnE61YJK58BFoSqJpfRYaNxfBKLsZbXPrS0irsLPLk13KJaiIUJnADetSWd+3lIQQfJZPPTXt3tMoeWdwOtkXejpTZjrOALPHY8ml3gmoBMft7HAOB3eaq3JEkExgyhSX0jOQQ6UMfP7G99VH4hZh7Qj6ZQr5nwkMpwsJ5NHZ6uCDIIyBLILBhaxWIvlGulrC1kK68pSjAlLmqIawXGmpLGPBSpdAviwdHrRKYg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199018)(40470700004)(46966006)(36840700001)(5660300002)(86362001)(8676002)(36860700001)(70206006)(356005)(81166007)(36756003)(4326008)(70586007)(1076003)(82740400003)(6916009)(41300700001)(40480700001)(2906002)(8936002)(44832011)(82310400005)(47076005)(186003)(2616005)(26005)(336012)(40460700003)(426003)(83380400001)(54906003)(478600001)(966005)(316002)(66899018)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 10:49:31.1849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf2393c-ad04-4081-15c3-08db1fc2cc31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C981.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7262

Despite being a matter of taste, in general, there are two main approaches
when dealing with code tagging: tree-wide, where all the sources are taken
into account or config-wide, when considering Kconfig options and actually
built files. At the moment, all_sources variable is defined using SUBDIRS,
which lists all the directories except arch/, where only $(TARGET_ARCH)
is taken into account. This makes it difficult to reason about and creates
fuzzy boundaries being a blocker when considering new directories that
might be config-dependent (like crypto/ which is missing in SUBDIRS).

For now, switch to the intermediate solution to list all the directories
in SUBDIRS without exceptions (also include crypto/). This way, the
approach taken is clear allowing new directories to be listed right away
without waiting to fix the infrastructure first. In the future, we can
then add support for config-wide approach.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - was: [PATCH] build: add crypto/ to SUBDIRS
 - use tree-wide approach to remove ambiguities

Based on the following discussion:
https://lore.kernel.org/xen-devel/874a28ac-3ae4-a6c6-c230-570be3672441@suse.com/T/#t
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 2d55bb9401f4..2710d7327e35 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
 
-SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
+SUBDIRS = xsm arch common crypto drivers lib test
 define all_sources
     ( find include -type f -name '*.h' -print; \
       find $(SUBDIRS) -type f -name '*.[chS]' -print )
-- 
2.25.1


