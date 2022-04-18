Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCC504E36
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307048.522304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNO-0006y9-Cr; Mon, 18 Apr 2022 09:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307048.522304; Mon, 18 Apr 2022 09:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNO-0006uh-9H; Mon, 18 Apr 2022 09:08:54 +0000
Received: by outflank-mailman (input) for mailman id 307048;
 Mon, 18 Apr 2022 09:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNNM-0006ub-Gn
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:08:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe07::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c87a87-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:08:50 +0200 (CEST)
Received: from AM5PR1001CA0051.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::28) by AM0PR08MB5297.eurprd08.prod.outlook.com
 (2603:10a6:208:18a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:08:45 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::9a) by AM5PR1001CA0051.outlook.office365.com
 (2603:10a6:206:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:08:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:08:44 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Mon, 18 Apr 2022 09:08:44 +0000
Received: from cea964681399.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72641FAC-1115-434F-B749-2300E8A819C9.1; 
 Mon, 18 Apr 2022 09:08:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cea964681399.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:08:37 +0000
Received: from AS9PR06CA0405.eurprd06.prod.outlook.com (2603:10a6:20b:461::35)
 by AM4PR08MB2786.eurprd08.prod.outlook.com (2603:10a6:205:9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:08:35 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::65) by AS9PR06CA0405.outlook.office365.com
 (2603:10a6:20b:461::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Mon, 18 Apr 2022 09:08:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:08:35 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:08:32 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:08:30 +0000
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
X-Inumbo-ID: 27c87a87-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWDfg78C1UDetJEmkoFFM9pCZJTLn7wc10oRJng+Vmw=;
 b=JRNhaqyftzItjnA2Sl2xjKKSVvE9AsRUCUZuPlIS164AHVb31Bgk5csyhkErPszV6HoqeRKVx5ltmqOAsKsatx8FEVlvFRks4u9PiWfwudU5ji5JCD6miFi9Q1r7fbZEf8OCuN5bbKbGsd1Li0ChtVeYZJx2BoLhaUrrhFyhV+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b82d4f1b73fcc74
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R93Z8CACV3A/F55iQDu5fqLpVSc6u7eJ0xAelwW1eRpQv3B6tRh8lEek9JBuXQ1DtXN9qNH9w9DMsz2n/1508kkuYedYE9j1vnhZNZhr/ckhYcCUMv7CiLhptwxHikXGbDKnH6EiRjzzSzxz6PorpHDMkAE4SoHSzYwIBI47OnwTyziS+m85+042idObYtnr3ttz31zru5G3Xv2ssmfj21e0isWv/L1DRT+DAJfvzTkMSbWzaNw4/2t9nT8Cd/JR3a8/t/t2tjY6SdHZFJcf9fFQQQygQvtvWHJJzsJEWGAbFE7dKb01McuqBBdu0zHpoNKzKnfpg83d/96dl+2TLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWDfg78C1UDetJEmkoFFM9pCZJTLn7wc10oRJng+Vmw=;
 b=YYRM7VxsqG3PE7QIDK5IB0LBpm1g4GwhQUq2r+m18t1CG7twrZA+nBdQhGWWlGSlvAPp4TuTuPA2smVULbsv2ozfTWltWsYbXTC19E+QaA3ULdD8yCmHH2F0+0jedq1kNC0tBNDNL96+1oSaGKkK3XDucJ8LgP/QpTVi2+585Ov036xo6omXe0Ikj1QlMqy6P4lbkygDeD1ekFFondtO/4VH7USrgv/UADtkMY8Y39Fr7Fk6nVaXzlTNxE0GsBKIG+BsFaEBLjBZ+RijfxPEeAUWNchfqDehfJk/UlU6SyI1GI8geoLv5/5TUf3awRZv6G26NIUfnEH4SSAu88m4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWDfg78C1UDetJEmkoFFM9pCZJTLn7wc10oRJng+Vmw=;
 b=JRNhaqyftzItjnA2Sl2xjKKSVvE9AsRUCUZuPlIS164AHVb31Bgk5csyhkErPszV6HoqeRKVx5ltmqOAsKsatx8FEVlvFRks4u9PiWfwudU5ji5JCD6miFi9Q1r7fbZEf8OCuN5bbKbGsd1Li0ChtVeYZJx2BoLhaUrrhFyhV+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2 00/10] Device tree based NUMA support for Arm - Part#1
Date: Mon, 18 Apr 2022 17:07:25 +0800
Message-ID: <20220418090735.3940393-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 876f0214-42b0-4bef-fe81-08da211b0a6e
X-MS-TrafficTypeDiagnostic:
	AM4PR08MB2786:EE_|AM5EUR03FT055:EE_|AM0PR08MB5297:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5297CC9A64C54F3B4FEAC8FA9EF39@AM0PR08MB5297.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A7rDPV5VfBp1dH3xvcZQRjwUWDXjfy8CWATwAPRdknVNV6vT477TLW0ExgqYdblcG6tYP/WNMNGPKH2j+PGxu6XltJiijwXCuhzU6Jv5S2PfKzdPCXXYYI1vzeYtVFQIu64ZOxxVL9Kdf61ZucO/OGLC4pHH4Gx1x2D7Ug2E970o/nNGaDYQ5qIobkUqUkYOuyB5B1+jr/cbSpxM4kZ7zkuhDxcSM8pS21nJu/ee5LhjvJ8RsaQmUROwMydvRv4n0JQz7B0pl2Z52RzXLotwkC9Zpw38LSRmmdCqoIjYJgWVx0LzmrXMrCGy2X7MaqdLR5klT+4aimjWS2FPuUtXKkhsiHGu/3giZ8cAXeoe/Bzawhz99WZeoXqUuXwLB+4yCPW74vGcPEuayddEWeHiopsccchSshQU44/6D3QLcaVtNefKoGfD3aZ6nB4m+zcKVhrrsRh/P19pWlZyaNZYA5MlxKMwDhn+aW4odKM+Juh7xBF6hXrVg4Rer7cqN111XXL7Z+T+ut7b34WGURdOUp1WgCFBQAjjVKDaCriRaxwJ6TfWPy8B1M3Elbm729cVS8HXWYbQaXP6FVMiDZrHhhm2O9iV+VYASXKtBZeWfp5eBCP7K9/lzS6VxYeNjI8NDHrt9mcvjKuyRbmgNxQs7Ao/unTfoED1urUkOxT7cuIJ8dS3M6w2qg5CQ3Uo1RWQD1y/RJkFJATwU8Zjlu9Wz7BAfmfyi4voO7Q6v+jfmjw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(44832011)(70586007)(316002)(70206006)(356005)(54906003)(110136005)(8936002)(4326008)(8676002)(5660300002)(2616005)(1076003)(36860700001)(186003)(336012)(81166007)(426003)(86362001)(83380400001)(508600001)(82310400005)(40460700003)(47076005)(26005)(6666004)(7696005)(36756003)(2906002)(17413003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2786
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1a0faf3-1128-413e-15e9-08da211b04a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6ePnHCBoZL91IjimYgU1OVc6y+kIfZjOJ+cfV5i0DgDYfuIEoQwLItcNE5lPw0HSEDeUZgV3rmt45KCnAlP2lAczoNX4Jtt8mPFaM3Uogab3UBcTbrhDsIG/GstitooBJ6Fj/nvYydCoKqNrUCRKSAGyPpIWuOdLeGc0YMHOYKA0YZ2GAEYwyFFocU3iXbmdoG2sKNw1jwIW0W/hGbGwZiCeoQmmuq5pRpi/I7nwjx2oYZG1V9eQJNQCkbB0+aCFhLrPGOIZOM8DtnU+f37/jkCUxyZN6Qmw88r5f6GNz76XSG0z41TqtyPPssjsNH6S9SUYyzeUZKegSPSgzKYmtQtbeCr00svb4Y+PSIXzw2vWbShE421v/9UoXW1Z9FQOXj7SLBLN+IE4FJ9Pxf5W4uYMvizPMBVOdqHlEi1o0WdSsVAabXTUGiD5+4fLjZkarTUYJKqRCQm6r8fO2TM3y+szzEanQdO3pQHAldoW1rx85G+lBV6KLw8hNWc3jjbBEfYJbYemQDBCthYqGjEr6fF/ITCC+tz0wvJVbEU0qLCOeLApI8YbVTwkc2EqNb0amPo5skvTKBoSvFl/OaX9IlNDUEQ4IkOn4HEZhu2bTy9Khd0WPLjGEJowQaA6fRcSe/Dzlz40mSCgnbCAzhvTzWXSzYd7u54mmFvPFLrj8qXkC/vhiCDyrA2j33Ndif3s70tCUdWmnwjR6tXOq9tYww==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(450100002)(107886003)(6666004)(86362001)(36756003)(40460700003)(2616005)(186003)(110136005)(1076003)(336012)(82310400005)(54906003)(426003)(47076005)(5660300002)(8936002)(316002)(81166007)(4326008)(44832011)(2906002)(26005)(83380400001)(508600001)(70206006)(70586007)(36860700001)(8676002)(7696005)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:08:44.8288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 876f0214-42b0-4bef-fe81-08da211b0a6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5297

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series.
2. Move generically usable code from x86 to common.
3. Add new code to support Arm.

This series only contains the first part patches.
The full patch list can be found in this cover letter.)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

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

---
Part1 v1->v2:
1. Move independent patches from later to early of this series.
2. Drop the copy of EFI stub.c from Arm. Share common codes of
   x86 EFI stub for Arm.
3. Use CONFIG_ARM_EFI to replace CONFIG_EFI and remove help text
   and make CONFIG_ARM_EFI invisible.
4. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
6. Extend the description of Arm's workaround for reserve DMA
   allocations to avoid the same discussion every time for
   arch_have_default_dmazone.
7. Update commit messages.

Wei Chen (10):
  xen/arm: Print a 64-bit number in hex from early uart
  xen/x86: move reusable EFI stub functions from x86 to common
  xen/arm: add CONFIG_ARM_EFI to stub EFI API
  xen/arm: Keep memory nodes in device tree when Xen boots from EFI
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen: introduce an arch helper for default dma zone status
  xen: decouple NUMA from ACPI in Kconfig
  xen/arm: use !CONFIG_NUMA to keep fake NUMA API
  xen/x86: use paddr_t for addresses in NUMA node structure
  xen/x86: add detection of memory interleaves for different nodes

PART2:
  xen/x86: introduce a helper to update memory hotplug end
  xen/x86: Use enumerations to indicate NUMA status
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: use arch_get_memory_map to get information from E820 map
  xen/x86: move NUMA scan nodes codes from x86 to common
  xen/x86: rename bad_srat to numa_bad

PART3:
  xen: rename acpi_scan_nodes to numa_scan_nodes
  xen: introduce a Kconfig option to configure NUMA nodes number
  xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
  xen/arm: implement helpers to get and update NUMA status
  xen/arm: implement node distance helpers for Arm
  xen/arm: use arch_get_memory_map to memory bank from bootinfo
  xen/arm: build NUMA cpu_to_node map in dt_smp_init_cpus
  xen/arm: Add boot and secondary CPU to NUMA system
  xen/arm: stub mem_hotplug_update_boundary for Arm
  xen/arm: introduce a helper to parse device tree processor node
  xen/arm: introduce a helper to parse device tree memory node
  xen/arm: introduce a helper to parse device tree NUMA distance map
  xen/arm: unified entry to parse all NUMA data from device tree
  xen/arm: keep guest still be NUMA unware
  xen/arm: enable device tree based NUMA in system init
  xen/arm: implement a dummy 1:1 node to pxm mapping
  xen/arm: use CONFIG_NUMA to gate node_online_map in smpboot
  xen/arm: Provide Kconfig options for Arm to enable NUMA
  docs: update numa command line to support Arm

 xen/arch/arm/Kconfig                    |  5 ++
 xen/arch/arm/Makefile                   |  2 +-
 xen/arch/arm/arm64/head.S               | 12 ++--
 xen/arch/arm/bootfdt.c                  |  8 ++-
 xen/arch/arm/efi/Makefile               |  5 ++
 xen/arch/arm/efi/efi-boot.h             | 25 ---------
 xen/arch/arm/include/asm/numa.h         |  6 ++
 xen/arch/x86/Kconfig                    |  2 +-
 xen/arch/x86/efi/Makefile               |  4 +-
 xen/arch/x86/efi/{stub.c => stub-x86.c} | 37 -------------
 xen/arch/x86/include/asm/config.h       |  1 -
 xen/arch/x86/include/asm/numa.h         | 15 ++---
 xen/arch/x86/numa.c                     | 30 +++++-----
 xen/arch/x86/srat.c                     | 74 +++++++++++++++++++------
 xen/common/Kconfig                      |  3 +
 xen/common/efi/stub.c                   | 38 +++++++++++++
 xen/common/page_alloc.c                 |  2 +-
 xen/drivers/acpi/Kconfig                |  3 +-
 xen/drivers/acpi/Makefile               |  2 +-
 xen/include/xen/numa.h                  |  2 +
 20 files changed, 162 insertions(+), 114 deletions(-)
 rename xen/arch/x86/efi/{stub.c => stub-x86.c} (71%)
 create mode 100644 xen/common/efi/stub.c

-- 
2.25.1


