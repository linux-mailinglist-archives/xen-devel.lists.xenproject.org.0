Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288E83621B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669790.1042217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsf2-0001Mu-AK; Mon, 22 Jan 2024 11:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669790.1042217; Mon, 22 Jan 2024 11:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsf2-0001KE-6p; Mon, 22 Jan 2024 11:40:16 +0000
Received: by outflank-mailman (input) for mailman id 669790;
 Mon, 22 Jan 2024 11:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dZf3=JA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rRsf0-0001K5-I0
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:40:14 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0086a23b-b91b-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 12:40:13 +0100 (CET)
Received: from MW4P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::30)
 by IA0PR12MB8748.namprd12.prod.outlook.com (2603:10b6:208:482::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 11:40:09 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::42) by MW4P222CA0025.outlook.office365.com
 (2603:10b6:303:114::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34 via Frontend
 Transport; Mon, 22 Jan 2024 11:40:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 11:40:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 05:40:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 22 Jan
 2024 03:40:07 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 22 Jan 2024 05:40:05 -0600
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
X-Inumbo-ID: 0086a23b-b91b-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7GDoZNYT689a5cwnMO0Px01amYMVqj6OkSqGyz7nPCtRHD60MZZhDVGgsf6XttLgW0pWepiHvn8AbaRJR7iO24zEHYxCG02uc4v32LTlSBf8W0//gCc1R5atC8e9Unr5tD69FobQ3KoHH6QIP4GzftYLMgOTkNrPSeLEFGuX2QDiS3uj7a5jY8VA4SisI14VzWRpw/l+tjZ6LKyPqkSvxHb+2DVFUSb1k9SzltH//WyQ0slT/zLZvq3eQJCRWcUHuhkLTWg9tWhd2W/4F+QN45wNdHYhCxb5aSrTBgKAqpdHpK3Obazo71qOjct6BHjUHyzIpQddCvYt1IVhXnDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKpaq1f2ZKt5X7zi9tVRDBaw+aRO2JsQfZpUwyEgfbw=;
 b=HvC8TDauwwROw9LogFaJdmHItrpxZeRnIOHpxjkKE15QZ7VRgYe7yIqiMLs5cXGdGLRynt1bmINiNh4kiPAGmSqVUl+n++gFmB4rOPWLhhwOMgv+bFMZBmOo4fMT5nAOjYvmb1yPhWREjVfeAyk4Mz6k79F3Tii4FzSZlcPw59vtmaFAX9GMJJUaVTHlZ+jB4NPjLc2jniNt6wdawc814qvLkm1wcoJ/aMUnDedH7trRkX1MSi4w0zfc9uFjDW/jmG4W0P5EJfUmWvVez/K1jWMn6qVaSn550cQdv0una4+WYRZAzQtGx02mq0t8orWwbAblRAZyzv/qNfaPazDjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKpaq1f2ZKt5X7zi9tVRDBaw+aRO2JsQfZpUwyEgfbw=;
 b=O5SZR49i+5+BcwgK1FQH77/dBKt3HEoGkWBPBiZtvWxP3S3b2qSQ+3Jx0/qQIPWzStLZAUCCTtsNYqLYBEIBVyskQlJV67hlZTZA/EKSm+1nAbDkS2qs5Q4Tx4JsxatiZRL2pzl58tu8ANqFeI7vaA+6vtfOkpJpZB1QLPm+2RU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<anthony.perard@citrix.com>
Subject: [PATCH v2] lib{fdt,elf}: move lib{fdt,elf}-temp.o and their deps to $(targets)
Date: Mon, 22 Jan 2024 12:39:55 +0100
Message-ID: <20240122113955.45594-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|IA0PR12MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ddb282-b39d-493c-939a-08dc1b3ee30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cecJmQ9gbxV3Ho+pYblBGwSrbchucgXiD1+8H+zq4iWhdqPLphOvDzX5g4ttFeXZsJZnqo+jxILDPTYyZiOAWHJKJlO6aktBqeC6C+64kCsWQga9f1nNf4sC3LAF4neSLCSId7i/TWLKDJzU5O/WHZUDm68QqJD+cxwszKyBWabLCQXXfLBYPdk/PLDpAHmQo5SBiP9p56yr9lFTDDF3krRT5nRjtQ4BlRjD8+N0Ruo9towFsvbKbSmdmWsVNcIqU4/30AJtk2Zx6gqxzh3CfYuLr7EX5OWk1ehgSjjPzfQ5SZJ+J6rEGCuBUg6zE5AqTc2dx5fsJOKx7xXwVrDx2WOONdFfAzuHWC9+m08wU4fjOzuNIWOD6SlgBb3u+QNyqO5Y1uYNwcjZgne5Qm/BY7js53VUHxioJQID+r0zJaezlNsLMTu3qSuJ86i6SbkAOC7ss4hFudkYIRtrvl/tfKs1Vnv34JrS048EOARZS+6L1KQiH4rZt8kLR4dHpBi5SoGTzveMyIBOpNkFs9UIYkTHlME0TJf2mnwwhf/o80NoU2+ZFc27z/778SHkTbXGcZgrh/3txEGAJOhSDrW6kFqhVa0ZlR2QFaIQIdNmBmcAfWkr5XStWPpMHoIleKAvC6JNwqYq0qdeiPpwwMgwk9Px5/xsdeDtgW4p0NLE/xF5r8inunZ/dls9Q6hj9vhENFPbaU/8lEDj7J/dgAq1jvdQGoCoFt6YSY+mWwUOYmMBoAag5Wc23DkiHKvzTwjLe421FdvF2gJHaHjh0oh1Ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(36840700001)(40470700004)(46966006)(356005)(2616005)(1076003)(336012)(426003)(6666004)(36860700001)(83380400001)(47076005)(5660300002)(2906002)(44832011)(41300700001)(4326008)(8676002)(8936002)(70586007)(54906003)(478600001)(316002)(6916009)(70206006)(36756003)(86362001)(81166007)(82740400003)(26005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 11:40:08.9248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ddb282-b39d-493c-939a-08dc1b3ee30a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8748

At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
under the hood) results in a crash. This is due to a profiler trying to
access data in the .init.* sections (libfdt for Arm and libelf for x86)
that are stripped after boot. Normally, the build system compiles any
*.init.o file without COV_FLAGS. However, these two libraries are
handled differently as sections will be renamed to init after linking.

To override COV_FLAGS to empty for these libraries, lib{fdt,elf}.o were
added to nocov-y. This worked until e321576f4047 ("xen/build: start using
if_changed") that added lib{fdt,elf}-temp.o and their deps to extra-y.
This way, even though these objects appear as prerequisites of
lib{fdt,elf}.o and the settings should propagate to them, make can also
build them as a prerequisite of __build, in which case COV_FLAGS would
still have the unwanted flags. Fix it by switching to $(targets) instead.

Also, for libfdt, append libfdt.o to nocov-y only if CONFIG_OVERLAY_DTB
is not set. Otherwise, there is no section renaming and we should be able
to run the coverage.

Fixes: e321576f4047 ("xen/build: start using if_changed")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - was "coverage: filter out lib{fdt,elf}-temp.o"
 - switch to $(targets), update rationale
---
 xen/common/libelf/Makefile | 2 +-
 xen/common/libfdt/Makefile | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index 8a4522e4e141..917d12b006f7 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -13,4 +13,4 @@ $(obj)/libelf.o: $(obj)/libelf-temp.o FORCE
 $(obj)/libelf-temp.o: $(addprefix $(obj)/,$(libelf-objs)) FORCE
 	$(call if_changed,ld)
 
-extra-y += libelf-temp.o $(libelf-objs)
+targets += libelf-temp.o $(libelf-objs)
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index d50487aa6e32..6ce679f98f47 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -5,10 +5,10 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
 # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
 ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+nocov-y += libfdt.o
 endif
 
 obj-y += libfdt.o
-nocov-y += libfdt.o
 
 CFLAGS-y += -I$(srctree)/include/xen/libfdt/
 
@@ -18,4 +18,4 @@ $(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
 $(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
 	$(call if_changed,ld)
 
-extra-y += libfdt-temp.o $(LIBFDT_OBJS)
+targets += libfdt-temp.o $(LIBFDT_OBJS)
-- 
2.25.1


