Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F93E8E89
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165614.302625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlPr-0000EW-EC; Wed, 11 Aug 2021 10:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165614.302625; Wed, 11 Aug 2021 10:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlPr-0000Bj-BD; Wed, 11 Aug 2021 10:24:55 +0000
Received: by outflank-mailman (input) for mailman id 165614;
 Wed, 11 Aug 2021 10:24:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlPp-0000BQ-IE
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:24:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::627])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1a8e140-e8d7-4d4e-a285-b82ecda29fc7;
 Wed, 11 Aug 2021 10:24:50 +0000 (UTC)
Received: from AM5PR0602CA0006.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::16) by DB9PR08MB6827.eurprd08.prod.outlook.com
 (2603:10a6:10:2a4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:24:46 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::b5) by AM5PR0602CA0006.outlook.office365.com
 (2603:10a6:203:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:45 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Wed, 11 Aug 2021 10:24:45 +0000
Received: from ea4d93c91e78.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DE6C950-8CAB-45EF-A720-4F6FA41636A8.1; 
 Wed, 11 Aug 2021 10:24:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea4d93c91e78.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:24:37 +0000
Received: from AM6P194CA0045.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::22)
 by AM6PR08MB4550.eurprd08.prod.outlook.com (2603:10a6:20b:71::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:24:36 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::68) by AM6P194CA0045.outlook.office365.com
 (2603:10a6:209:84::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:36 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:24:36 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:31 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:29 +0000
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
X-Inumbo-ID: a1a8e140-e8d7-4d4e-a285-b82ecda29fc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRiJFSLcjv+F086pxeTQm4LDwTb8CJSdd6rCrzzZ7so=;
 b=UelRnYzVO3SY5PV1RGgJdW1X8UVN4h+KMXL4zHRhbhg5JclHkKPVWzhFgZFb8Ixipmq08Pc1mi3FWxViJXnHEaSPJ1PWiwmFC0at/qm8r7rDVPxe0/LzE3buqP5DQeBmTq5opsim4gcsmse0ha8YIDrlMLTtOhIkCYbacjtSTOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d40fbc6fdad8035
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkbDW/cHFc9bP8d2TMexJk0Xm5a0nEAhmiDaTMgGvISw7PIyxXof3dWyQpQBq+Lf0F2/cibTdBZ5h0nCDnIgvZ01MBZOyQpY+bnZLDf4Hsk5V5PAEC7MqEhmD2S/OmaJ9wPNGSC679yMi7c09KjQb8vm2r5Wn5BDkK7K5gnPkcDkkHPhW/3mM0jzqK12Y+2f56vVxRaRtyWkGYIfes6zA86GyOEEZbFTGLOfHwZs1WZhl8k4O6SIWTSmuJzgxy3KtiV7wixvQ3jiMRzFC2s52+Oeah3A5vrTIfxPFSLWWW7QmKYIWHkv2ZK51VgfYhUJVFcnTQYXe3OzWN0CixwKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRiJFSLcjv+F086pxeTQm4LDwTb8CJSdd6rCrzzZ7so=;
 b=KZjc7SqRi/Yb40FRp1xlQ9HOrsDBv8NbNtSTuf7T11WsRWxs/syTYvHbb7BBxiZm4oTVFvhdFGmfEilXAnWGt3Y7Q7fNuHo4dXboF66LhCgSQzKBBsQ1p7bNfVMy7mAnjuPQEKcTwWPe3lz0bKi8NLHZDFuaKvRsr8muL+a8Z06W3JMDllopsmCDi8W9UzggNbo1Wr6xNK4a4MafPo+03T699X02GCPJ0l3oFhA4L9A6HNTnXp8xF00f79gYGYw8SXCwR9rBb9myqANdxk9IGPKqQBbtiURtBjSYLNFUz/ZiT7RMzy6BVEQWvCxRKz+HMj81XmZM/cONsTruAmSoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRiJFSLcjv+F086pxeTQm4LDwTb8CJSdd6rCrzzZ7so=;
 b=UelRnYzVO3SY5PV1RGgJdW1X8UVN4h+KMXL4zHRhbhg5JclHkKPVWzhFgZFb8Ixipmq08Pc1mi3FWxViJXnHEaSPJ1PWiwmFC0at/qm8r7rDVPxe0/LzE3buqP5DQeBmTq5opsim4gcsmse0ha8YIDrlMLTtOhIkCYbacjtSTOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
Date: Wed, 11 Aug 2021 18:23:43 +0800
Message-ID: <20210811102423.28908-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba81dc6a-10d6-457b-f3b9-08d95cb23dd7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4550:|DB9PR08MB6827:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB68275AB05485B7BD9C8FFFEE9EF89@DB9PR08MB6827.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G1ps0rVd5B7wy+bIPOpgQfikbnxsgAOLRnAQuPbXN4VYHuxTL1jIqLZMc3x2UFa9LWa55T+prdF575nJ3OKrQspxj31kvMlU46nY1N8DTdK/VaJyZSmbrMBxIHrF7r3dGFLZhD0xTiVfBPBocoQVbPD73kDWXXwUbio/dE6RBuz5mFUJNNUeFmKFOm6xQIuCm6M6FKfO0mdFn/MKkvB/SR9CzUABwkEPDuzrRMYWkcglCvmM3YS3yynO6o3wnNIRaCgakKOMhwcuIxgY+HceA7PfTrBs1uk0vbyvejwx1W8dV9EnTutqwxMCkZEi3GtD+8BNXn7HTzZTenBhM/VoWqlb9lq1M1VP+qgOZ3lJUKtFqH6a3m6/axUXOoUjaL56t46lqr5hOmgmOs8FMhLedKr8dNtvE5bvlID/yi6BKVBt1FoeX2iXBC+5t2E4tSeUq+grv51k0RMIieP0QUeTrL50zA2kwH02y141w38KOFGXCcIFN4fj8QgA4WcjdSlsaiO7fqDg9ACCz7RJ3NwcDoY1pXjxJIDIz2kUfaNi7XGYRySSjCs5tUmay1UxSTcnVxPqHHH1u//H0XOBXThMWprxzVpkt8cv9b/mJzp8iyFbNwB8DFrH9SIRQo2zTcUVtaZ4hgPF2dPOXF4wCzvhjlGfF2gBdYzItF+Nxou5OeDT1lIF/SAWxkJ1ZXLfae/0NZAX3k8VZcyAn3tm8VI8N1s+ispiZQc2t+V0uSq1aIvkAK4tBKYlFoZZMqJH8rFPZBzLh1IhlKD+9II7RjDgONZv2JqWXTZnD4+zL4Ey3lY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(36840700001)(46966006)(2616005)(336012)(83380400001)(86362001)(2906002)(82740400003)(186003)(36860700001)(1076003)(47076005)(7696005)(5660300002)(36756003)(82310400003)(70586007)(4326008)(70206006)(356005)(44832011)(8936002)(478600001)(8676002)(26005)(426003)(34070700002)(81166007)(316002)(110136005)(6666004)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4550
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da301f72-b498-4574-ed38-08d95cb237f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9SrErrqhehAXxyXHiXrpY/8FArb9emQ5QDX626fVIWlYbWTCfaJbNzm/wbHgR/qDcKRTcKRAI1h8be4nQjxRD/mMkOqj3gdFigxkG6c5elRBJCpAsVF8/KJ7Ydm5cM4KmlXy2UPuuzm2sHSH8djyT4Wo4EE169T28BcM69A6t0xnOsfyYE3/m+xgFxxlCWTSxOsjCeGGEz5m5wJbiz8r04NUg5TAhQB7P1oqpfCkvnvCAbRTmkGj9JqV77O0iQLxLOFdnSqbmDyQQOC7WZERnnOMVXsqktH/ogXLTRafi5viSmk2o6w4i36zy+jplr1NL+b5j43ronNNXxPWHlV9OUKyQAEd51ZoGjmHo+Ty2eodw4J2dN0tynKTnYiMafNU/mVhJ21XGtSuqyHc+O557aL9BBoup0u5DMHz1UxJEBGrrKbmLGbmvy7dB+LOLLsLxrVdWOPHhqvMQMEmiVaaWD1X7oJvuZsx7DbEK8gQyvEPK/R39es+TM8xKyImQ9Y0Xu7U/wbG6V/I/p692jVMEJmFhVNFb4Hu1VDdXrn6yxJgA9G6EmScmiKYZO2W6nua2I2w5Wz5EkndkVlSbI8Yf965B0070M0CodhfmFffGv8+6KHYpncCJWpNgF8UaZWSpnEdtc2JaJxS/iwOK9Y3ajaUG8uzNdRS9UCWHeSR4JiWSAW5FeDkmk20Yqacb6D30GHYHVRo/2CBijNoHyNh/imETF3afck+TB71EKSRUQs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966006)(36840700001)(2616005)(2906002)(83380400001)(86362001)(81166007)(8936002)(70586007)(70206006)(5660300002)(82310400003)(7696005)(8676002)(82740400003)(4326008)(186003)(336012)(26005)(478600001)(316002)(36860700001)(44832011)(426003)(110136005)(1076003)(6666004)(36756003)(47076005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:24:45.9973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba81dc6a-10d6-457b-f3b9-08d95cb23dd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6827

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system. Like TX2, some Hisilicon
chips and the Ampere Altra.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts. 

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

Hongda Deng (2):
  xen/arm: return default DMA bit width when platform is not set
  xen/arm: Fix lowmem_bitsize when arch_get_dma_bitsize return 0

Wei Chen (38):
  tools: Fix -Werror=maybe-uninitialized for xlu_pci_parse_bdf
  xen/arm: Print a 64-bit number in hex from early uart
  xen/x86: Initialize memnodemapsize while faking NUMA node
  xen: decouple NUMA from ACPI in Kconfig
  xen/arm: use !CONFIG_NUMA to keep fake NUMA API
  xen/x86: Move NUMA memory node map functions to common
  xen/x86: Move numa_add_cpu_node to common
  xen/x86: Move NR_NODE_MEMBLKS macro to common
  xen/x86: Move NUMA nodes and memory block ranges to common
  xen/x86: Move numa_initmem_init to common
  xen/arm: introduce numa_set_node for Arm
  xen/arm: set NUMA nodes max number to 64 by default
  xen/x86: move NUMA API from x86 header to common header
  xen/arm: Create a fake NUMA node to use common code
  xen/arm: Introduce DEVICE_TREE_NUMA Kconfig for arm64
  xen/arm: Keep memory nodes in dtb for NUMA when boot from EFI
  xen: fdt: Introduce a helper to check fdt node type
  xen/arm: implement node distance helpers for Arm64
  xen/arm: introduce device_tree_numa as a switch for device tree NUMA
  xen/arm: introduce a helper to parse device tree processor node
  xen/arm: introduce a helper to parse device tree memory node
  xen/arm: introduce a helper to parse device tree NUMA distance map
  xen/arm: unified entry to parse all NUMA data from device tree
  xen/arm: Add boot and secondary CPU to NUMA system
  xen/arm: build CPU NUMA node map while creating cpu_logical_map
  xen/x86: decouple nodes_cover_memory with E820 map
  xen/arm: implement Arm arch helpers Arm to get memory map info
  xen: move NUMA memory and CPU parsed nodemasks to common
  xen/x86: move nodes_cover_memory to common
  xen/x86: make acpi_scan_nodes to be neutral
  xen: export bad_srat and srat_disabled to extern
  xen: move numa_scan_nodes from x86 to common
  xen: enable numa_scan_nodes for device tree based NUMA
  xen/arm: keep guest still be NUMA unware
  xen: introduce an arch helper to do NUMA init failed fallback
  xen/arm: enable device tree based NUMA in system init
  xen/x86: move numa_setup to common to support NUMA switch in command
    line
  xen/x86: move dump_numa info hotkey to common

 tools/libs/util/libxlu_pci.c    |   3 +-
 xen/arch/arm/Kconfig            |  10 +
 xen/arch/arm/Makefile           |   2 +
 xen/arch/arm/arm64/head.S       |   9 +-
 xen/arch/arm/bootfdt.c          |   8 +-
 xen/arch/arm/domain_build.c     |  17 +-
 xen/arch/arm/efi/efi-boot.h     |  25 --
 xen/arch/arm/numa.c             | 162 +++++++++
 xen/arch/arm/numa_device_tree.c | 292 ++++++++++++++++
 xen/arch/arm/platform.c         |   4 +-
 xen/arch/arm/setup.c            |  14 +
 xen/arch/arm/smpboot.c          |  37 +-
 xen/arch/x86/Kconfig            |   2 +-
 xen/arch/x86/numa.c             | 421 +----------------------
 xen/arch/x86/srat.c             | 147 +-------
 xen/common/Kconfig              |   3 +
 xen/common/Makefile             |   1 +
 xen/common/libfdt/fdt_ro.c      |  15 +
 xen/common/numa.c               | 588 ++++++++++++++++++++++++++++++++
 xen/common/page_alloc.c         |   2 +-
 xen/drivers/acpi/Kconfig        |   3 +-
 xen/drivers/acpi/Makefile       |   2 +-
 xen/include/asm-arm/numa.h      |  33 ++
 xen/include/asm-arm/setup.h     |   6 +
 xen/include/asm-x86/acpi.h      |   4 -
 xen/include/asm-x86/config.h    |   1 -
 xen/include/asm-x86/numa.h      |  65 +---
 xen/include/asm-x86/setup.h     |   1 -
 xen/include/xen/libfdt/libfdt.h |  25 ++
 xen/include/xen/nodemask.h      |   2 +
 xen/include/xen/numa.h          |  80 +++++
 31 files changed, 1325 insertions(+), 659 deletions(-)
 create mode 100644 xen/arch/arm/numa.c
 create mode 100644 xen/arch/arm/numa_device_tree.c
 create mode 100644 xen/common/numa.c

-- 
2.25.1


