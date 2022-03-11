Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8244D5B63
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288720.489750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWE-0002XN-MN; Fri, 11 Mar 2022 06:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288720.489750; Fri, 11 Mar 2022 06:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWE-0002Qy-CE; Fri, 11 Mar 2022 06:12:54 +0000
Received: by outflank-mailman (input) for mailman id 288720;
 Fri, 11 Mar 2022 06:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYWC-0008Q3-Kk
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe05::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47ad5f6c-a102-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 07:12:51 +0100 (CET)
Received: from AS9PR06CA0215.eurprd06.prod.outlook.com (2603:10a6:20b:45e::22)
 by AM8PR08MB6339.eurprd08.prod.outlook.com (2603:10a6:20b:317::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 06:12:24 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::87) by AS9PR06CA0215.outlook.office365.com
 (2603:10a6:20b:45e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:23 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Fri, 11 Mar 2022 06:12:23 +0000
Received: from ae69decf3fdd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2D83D3B-8822-4D16-9F53-9D9A93EEF755.1; 
 Fri, 11 Mar 2022 06:12:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae69decf3fdd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:17 +0000
Received: from AS8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:310::6)
 by VI1PR0802MB2207.eurprd08.prod.outlook.com (2603:10a6:800:9c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.20; Fri, 11 Mar
 2022 06:12:14 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::a4) by AS8PR04CA0001.outlook.office365.com
 (2603:10a6:20b:310::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:13 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:13 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:12 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:10 +0000
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
X-Inumbo-ID: 47ad5f6c-a102-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU8NQceo5M7S7uNB+SFlZP2PMMWPBqpC6eRiMideGyc=;
 b=DoqDXPA0eJHypZxGSfKZbJTh+MXH310v6E6lz3ap1acAK2fCW8VbITDEJmARSzk8HS7RDu894g/dZwZd+AS0Nf8Q/P4cddpjbqfiED1bY2X7RO/6rkWwfwaCWfIg760mhaKW+DV0lYR55t6Qi1DaK/ByC01f1YitzfZXuNcq3ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d83c625b8f15de6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9pdQ7chCVD8BMA8INgpDupFWsWqQNUfq7QUWufHDz+QR8LCsnaF/yU2E2ZlbCeh4FpLdHopebq9VQ/TO/H5Q8iN9ztFzCWUpFxTH+oZR8PdZt7pNBYb5k8/XzBjCLiEuubKpv5Fe7p1xJdP1aeqazzpq2qcq7EpQULst9FlJoztnaFQ/0up+isbsmGek917Rw5dDDHqGpnulTdXou+okWAAR0UaUHYCeajXuk47nvL3pUb3IfqQ5RMuacK1aCEtt+upj3/Nr3hFap1ouKY/PnZO3WycdOc7LLV8JFFnw4cV4TGnUrX/2PQKGhBWIZ5KrOJC0OAJKy/xzaV5FF1vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU8NQceo5M7S7uNB+SFlZP2PMMWPBqpC6eRiMideGyc=;
 b=VHh9/W1KYNP0zTrtMoSHnaKiBAV0yrrjDuVTviVfYjJIIdUxAN8xhOCIMulGSvGUO7L/jYKS0p92HCBvKvqrJ72Wole4B1Wa1rH/wncnHa03USP8zqjLJWMhTtJbFBw7g8aV67Z53ZX0mtpfDiJATT69aMD2oK+s1hFaIy/oRWb3VmjKghJelJOvYRcTijiSm2HCJN5RnOsvY/lam1yBI8SYIBrbansTsALgIMFqx/aiYvLgTzQCuPlI2xmeo+f5PmkfZyNI6tKzQHYsW20GoxYYyPgVkIcSgTze4IwyWQGTV6r8EQZkTpbUoM6MpLIBfJQ7vgQig9OiIYiTs90c1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU8NQceo5M7S7uNB+SFlZP2PMMWPBqpC6eRiMideGyc=;
 b=DoqDXPA0eJHypZxGSfKZbJTh+MXH310v6E6lz3ap1acAK2fCW8VbITDEJmARSzk8HS7RDu894g/dZwZd+AS0Nf8Q/P4cddpjbqfiED1bY2X7RO/6rkWwfwaCWfIg760mhaKW+DV0lYR55t6Qi1DaK/ByC01f1YitzfZXuNcq3ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 01/13] xen/arm: introduce static shared memory
Date: Fri, 11 Mar 2022 14:11:11 +0800
Message-ID: <20220311061123.1883189-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 070ca016-3acc-4d1f-c401-08da03261bff
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2207:EE_|AM5EUR03FT007:EE_|AM8PR08MB6339:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6339E710DDC8DCC1BA53B7AAF70C9@AM8PR08MB6339.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TOwcCHJ+mhaf8ew7f+NJbY3YrymNNZXPh5I+RUnSGsWEGLDpS0/g4+a/pBbHozyX+CulP8PShD3oSFQEMuYYC+zwgJN9+ZGuiu4FDP70efirkgSaRn8fjFinwFZFB3I81falTKZ+CYFASmHiW0WElVMXzQk0/Tjf5CrJQ5r+U5OvhywppuXnO/TZNNFHvF93Blu7/lmUKoC0adL9CM7E/fXQApiFcGKhQ64nAo79tmTc2jh7Oc8yFMDQtYGcc/Q3hAyPRaNEaltwhTyx4ZICCRhB8dakTTOAI2htLF4Ux4/Y0gymqAU7ppMGdaoAbHdP/m4S2Xmr3a5Mo7CKuwh/H3eBF+2SPWb0nJPZDyFpxUv9BuSWkYSmvK1o832vEEE79yov/snWKg3CfeF3s2fls3hKV5tNNd8rIeeCQu0sCDZUsQcGni4REQcpkqYLg58fjrufupoE7SE91ng2StbEi5+B6rhNkVdg7bv4nJ1lOdMxBjdeHiUwOFr0PfFctjiUCWnBF+7J+O+9fPd4FOJMm7Nf2kt5LpZvv/NaeR/9nTtunWcrLUKNgvTFjpOQSlyei8mZd6zsOcISxn7tQNAZrQ2GIffBbY3oK1kR4AGMiFy9EB8MpZr9NsZlfKFEGFcDXwPgdOxvhFOWlQe819dMucxFTvajQw0sAwQfyLwaMRZ3OgxUCVP1Za85JOCVC1G4IDXhnORUSC3/60BLtbxWsg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(83380400001)(186003)(26005)(316002)(8936002)(81166007)(54906003)(336012)(36860700001)(7696005)(356005)(47076005)(40460700003)(82310400004)(426003)(70206006)(4326008)(2906002)(70586007)(86362001)(5660300002)(36756003)(1076003)(2616005)(508600001)(6916009)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2207
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	167916f2-5630-48c5-bfbc-08da032615c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnPzKIL2dyU5GwQ5gnZLVSPcsOGgnpCxgieXKOhWLCqlBoJwHnJmnayiLvIwSMg5mure9Ju/NB+gi1dnWeOYApFHNqH2yw2B5CCAI9FvMxNoNxv9u2+EYmSU0B26P308eY2Qyt2HdhV50sUKMLmzMDNBeikDSPHNaAuiEn7ATiZAHp/aORV4aw4PW1FZj++sqnh5dEoWQCUgJfFHrtR9OyQP8ORo+r5oLUXjsA4V2wyCIRCYHNQA5manwXz7/AjimGiMD0j2wS3Va80jqMQIgiOJ4TT0eTSQ1vPL1Wa62RcqkmtM/Gt/dxLMjR2ClstDKS3JLBC6eNNjMRU76adSophwamu6UA6wKdRQjebdEGtCMYBzwk7FjT4AGom75n0NEXYCw9P9fEsqgyhU4QO53fvrs+JyG6MdLsfYlXIyAMzkWXeYsDd/z0OLCY3zfWZPWkRWAiociF1PD03MwjW+VtKqexJgIrl+/Ihu3QVRXnn/2YABCgK9JL5CuEmfBiddpNpBSadgBqo4/EzQvzFckDalMpJpcK4i00Bh2TZFskI7aKiRvW1BwVOPpWWDiuOkepDoo0ZaTyc+WeH3wlcxIwcefUPjhCfJPlW3QXpyJWhjMJMHXRG43nm56KfzBpgmdZHq7pVBjgmLbZmh+OU1wHjbSdgcDrJknViOavz8nb9H6x+II3sU4TAkfIN6gaLB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(83380400001)(508600001)(54906003)(5660300002)(82310400004)(8936002)(7696005)(70206006)(36860700001)(2906002)(107886003)(426003)(70586007)(1076003)(8676002)(4326008)(2616005)(336012)(26005)(186003)(86362001)(36756003)(40460700003)(316002)(6916009)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:23.8796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 070ca016-3acc-4d1f-c401-08da03261bff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6339

From: Penny Zheng <penny.zheng@arm.com>

This patch serie introduces a new feature: setting up static
shared memory on a dom0less system, through device tree configuration.

This commit parses shared memory node at boot-time, and reserve it in
bootinfo.reserved_mem to avoid other use.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 118 ++++++++++++++++++++++++++
 xen/arch/arm/bootfdt.c                |  52 ++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index a94125394e..f702ade817 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -355,3 +355,121 @@ device-tree:
 
 This will reserve a 512MB region starting at the host physical address
 0x30000000 to be exclusively used by DomU1.
+
+Static Shared Memory
+=============
+
+The static shared memory device tree nodes allow users to statically set up
+shared memory on dom0less system, enabling domains to do shm-based
+communication.
+
+- compatible
+
+    "xen,domain-shared-memory-v1"
+
+- xen,shm-id
+
+    An u8 value represents the unique identifier of the shared memory region.
+    The maximum identifier shall be "xen,shm-id = <0xff>".
+
+- xen,shared-mem
+
+    An array takes a physical address, which is the base address of the
+    shared memory region in host physical address space, a size, and a guest
+    physical address, as the target address of the mapping.
+
+- role (Optional)
+
+    A string property specifying the ownership of a shared memory region,
+    the value must be one of the following: "owner", or "borrower"
+    A shared memory region could be explicitly backed by one domain, which is
+    called "owner domain", and all the other domains who are also sharing
+    this region are called "borrower domain".
+    If not specified, the default value is "borrower" and owner is
+    "dom_shared", a system domain.
+
+As an example:
+
+chosen {
+    #address-cells = <0x1>;
+    #size-cells = <0x1>;
+    xen,xen-bootargs = "console=dtuart dtuart=serial0 bootscrub=0";
+
+    ......
+
+    /* this is for Dom0 */
+    dom0-shared-mem@10000000 {
+        compatible = "xen,domain-shared-memory-v1";
+        role = "owner";
+        xen,shm-id = <0x0>;
+        xen,shared-mem = <0x10000000 0x10000000 0x10000000>;
+    }
+
+    domU1 {
+        compatible = "xen,domain";
+        #address-cells = <0x1>;
+        #size-cells = <0x1>;
+        memory = <0 131072>;
+        cpus = <2>;
+        vpl011;
+
+        /*
+         * shared memory region identified as 0x0(xen,shm-id = <0x0>)
+         * is shared between Dom0 and DomU1.
+         */
+        domU1-shared-mem@10000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            role = "borrower";
+            xen,shm-id = <0x0>;
+            xen,shared-mem = <0x10000000 0x10000000 0x50000000>;
+        }
+
+        /*
+         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
+         * is shared between DomU1 and DomU2.
+         */
+        domU1-shared-mem@50000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = <0x1>;
+            xen,shared-mem = <0x50000000 0x20000000 0x60000000>;
+        }
+
+        ......
+
+    };
+
+    domU2 {
+        compatible = "xen,domain";
+        #address-cells = <0x1>;
+        #size-cells = <0x1>;
+        memory = <0 65536>;
+        cpus = <1>;
+
+        /*
+         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
+         * is shared between domU1 and domU2.
+         */
+        domU2-shared-mem@50000000 {
+            compatible = "xen,domain-shared-memory-v1";
+            xen,shm-id = <0x1>;
+            xen,shared-mem = <0x50000000 0x20000000 0x70000000>;
+        }
+
+        ......
+    };
+};
+
+This is an example with two static shared memory regions.
+
+For the static shared memory region identified as 0x0, host physical
+address starting at 0x10000000 of 256MB will be reserved to be shared between
+Dom0 and DomU1.It will get mapped at 0x10000000 in Dom0 guest physical address
+space, and at 0x50000000 in DomU1 guest physical address space. Dom0 is
+explicitly defined as the owner domain, and DomU1 is the borrower domain.
+
+For the static shared memory region identified as 0x1, host physical
+address starting at 0x50000000 of 512MB will be reserved to be shared between
+DomU1 and DomU2. It will get mapped at 0x60000000 in DomU1 guest physical
+address space, and at 0x70000000 in DomU2 guest physical address space. DomU1
+and DomU2 are both the borrower domain, the owner domain is the default owner
+domain dom_shared.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index afaa0e249b..7de0f8cea9 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -363,6 +363,56 @@ static int __init process_domain_node(const void *fdt, int node,
                                    size_cells, &bootinfo.reserved_mem, true);
 }
 
+static __initdata DECLARE_BITMAP(shm_mask, NR_MEM_BANKS);
+static int __init process_shm_node(const void *fdt, int node,
+                                   u32 address_cells, u32 size_cells)
+{
+    const struct fdt_property *prop;
+    const __be32 *cell;
+    paddr_t paddr, size;
+    struct meminfo *mem = &bootinfo.reserved_mem;
+    u32 id;
+
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: invalid #address-cells or #size-cells for static shared memory node.\n");
+        return -EINVAL;
+    }
+
+    prop = fdt_get_property(fdt, node, "xen,shared-mem", NULL);
+    if ( !prop )
+        return -ENOENT;
+
+    id = device_tree_get_u32(fdt, node, "xen,shm-id", NR_MEM_BANKS);
+    if ( id >= NR_MEM_BANKS )
+        return -EINVAL;
+
+    /*
+     * A shared memory region could be shared between multiple domains. We
+     * use the shm_mask bitmask to prevent iterating over all reserved memory
+     * regions each time.
+     */
+    if ( !test_bit(id, shm_mask) )
+    {
+        /*
+         * xen,shared-mem = <paddr, size, gaddr>;
+         * Memory region starting from physical address #paddr of #size shall
+         * be mapped to guest physical address #gaddr as shared memory region.
+         */
+        cell = (const __be32 *)prop->data;
+        device_tree_get_reg(&cell, address_cells, size_cells, &paddr, &size);
+
+        /* shared memory shall be reserved from other use. */
+        mem->bank[mem->nr_banks].start = paddr;
+        mem->bank[mem->nr_banks].size = size;
+        mem->bank[mem->nr_banks].xen_domain = true;
+        mem->nr_banks++;
+        set_bit(id, shm_mask);
+    }
+
+    return 0;
+}
+
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
@@ -383,6 +433,8 @@ static int __init early_scan_node(const void *fdt,
         process_chosen_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
         rc = process_domain_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
+        rc = process_shm_node(fdt, node, address_cells, size_cells);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
-- 
2.25.1


