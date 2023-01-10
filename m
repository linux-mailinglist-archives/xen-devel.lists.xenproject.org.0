Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D59663BDE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474427.735600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOQ-0005ui-Bb; Tue, 10 Jan 2023 08:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474427.735600; Tue, 10 Jan 2023 08:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOQ-0005sK-8Y; Tue, 10 Jan 2023 08:54:02 +0000
Received: by outflank-mailman (input) for mailman id 474427;
 Tue, 10 Jan 2023 08:54:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOO-0005s6-0z
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:00 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2064.outbound.protection.outlook.com [40.107.103.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 512b99b4-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:53:57 +0100 (CET)
Received: from ZR2P278CA0062.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:52::10)
 by AS4PR08MB7902.eurprd08.prod.outlook.com (2603:10a6:20b:51d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:53:54 +0000
Received: from VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:52:cafe::c8) by ZR2P278CA0062.outlook.office365.com
 (2603:10a6:910:52::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT043.mail.protection.outlook.com (100.127.145.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:53 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 10 Jan 2023 08:53:53 +0000
Received: from 08576f30d8c9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84897C40-18DE-4F73-9AF2-423B309F9F89.1; 
 Tue, 10 Jan 2023 08:53:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08576f30d8c9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:53:46 +0000
Received: from AS4PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::11)
 by DB9PR08MB7469.eurprd08.prod.outlook.com (2603:10a6:10:36f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:53:43 +0000
Received: from VI1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e0:cafe::b8) by AS4PR09CA0005.outlook.office365.com
 (2603:10a6:20b:5e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT058.mail.protection.outlook.com (100.127.144.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:42 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:40 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:37 +0000
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
X-Inumbo-ID: 512b99b4-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WSflx/hlaylWKbeI/bAsqdI9Oj43SHHqevu0JMLugA=;
 b=FBeAWyPCV9uxh7Sjl1M/oQYLVvmiGjnPnoncypDlejGUmST244mgA6KpPhj/VjrvTkK/lcI3RnsufxOZsmmrGh84EGlQznv5PuA8AyGwoWUUp9ezkSvJdNlO2c6K8kaPav6A+AmVZ5961xUcVT590JEKkX7bYUFr+vgvey7RX+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4eea29087c37b2c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGHgxSMrI9u7eYO32RDvDSlUvQmV2l+0scFQJgc1mUF3K+D4vpoO9RByzYFyfoCk5bgWl3z/msz/gYTXJyVjvI+O56wxhpkHyN8HvU1uPUTeupiPquiH7pWXSV7bPcadaek6qiw4UlI2mtT3srLGZUDY/jYZx2sjU77g1FmPEaKP3IxSHNWe+/28h4SzrxFKVp3ZtCG1403Wx78I452LB0Fqw06CssLu4oMLqwif1OqRyOnAFMacfP2BSNY2qy5SivKabuHzqdSS8mEaq7XjmFebLNLPQYmKAG8/DsMu12/ZXobkJmyrvkEc5lIf9TGTOFUEn4yGqErxawTS/7kUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WSflx/hlaylWKbeI/bAsqdI9Oj43SHHqevu0JMLugA=;
 b=b70iTjx9mgONZMx1/HZUUnNZ8mubxSRDoAaBDRY7aaGGPmkXSSGJHeMAgvzxK9NupRo7PjtIUXlB9RPVhc3/yVKErJIpO78BHSGdWOasbAS0PNjBGG9tWzsk7pAIFKcQrZOwRq8GfmtTxwwnwhDYIlT2t2f1iD1RXr9j13vgjcoTN5RYfsjJBlpq00awh3uzJQqGdgDtDpXgWPUWmpBp6ZKXwatHwiG8mEeAzsGKQ0O8+UsINRpCeAE6qySmHO9jBIneKmE2FWPcg3ad4mip6lN6WRWKFi79d0rpXerxu4VlLrPvJnK2qLhki6XputnbI1puBWnIEHM4b/FeNH3RwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WSflx/hlaylWKbeI/bAsqdI9Oj43SHHqevu0JMLugA=;
 b=FBeAWyPCV9uxh7Sjl1M/oQYLVvmiGjnPnoncypDlejGUmST244mgA6KpPhj/VjrvTkK/lcI3RnsufxOZsmmrGh84EGlQznv5PuA8AyGwoWUUp9ezkSvJdNlO2c6K8kaPav6A+AmVZ5961xUcVT590JEKkX7bYUFr+vgvey7RX+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 00/17] Device tree based NUMA support for Arm - Part#3
Date: Tue, 10 Jan 2023 16:49:13 +0800
Message-ID: <20230110084930.1095203-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT058:EE_|DB9PR08MB7469:EE_|VI1EUR03FT043:EE_|AS4PR08MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8555fd-9467-4ee2-b15b-08daf2e833bc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9svjhQ5Sr68UXSLb6JGH3nUC5D4jhvyepAmsNbz8rti37G54FUbtxAvXYy2Z3bFqSfunZRKSQ7QQVarB9YTXTkoavV3po/qTNSOhOcac0XOuCUSfuGQf8VuVxTdDt7KEMqhrt0Y3ITpVCBtY7+jw0XJnivRSCvFK/PCDoQnO9rPmZ3IFuDnxYBz5KGHrVlzQGTlJT9Xyg3CZKLsVnfn+94olskiW1uOZNaqrtqJ+MwCn/bai25M4jGvePVCT+9xTFFhvC1xSwaYxlE1bra57eAnUJ/ptdK6692sNWNddPqRTyKRm8cFppf3yjxuHAjr/PXIeVOrfDLEvVqKtip/JUDweLCaauZEEs2RNfkDiGDefERzEHckXzproJO5fbxP6ps2jDUQMxXboM1mb/jBXUwvbTF1Vcr1tGEKZMfAIf07q9XPjW7Fnrur3qcBo01q4Uo7VOwarxk/u76WPAXVyqsYaA067TyCrFdZgD2QNo6vjxGaLUsPY3jGbpvtFd69HAeMEPAqnjwP8OEI8vIS15auYYyq8QTY6IoEVRKUhwGJzkuJQQrw+ujLLIqX1Ej5xOrrjg2qemquXTs2L6CzM2e9xQChDY7bHW4zhDPbDXybahzppaO4e5ReYZ9E+wGpTAapOMP2E7Nbx4ZaxuLVeBL2bBXlAd/xYmspRn0gQhvSeN0kTHIRcjm1+cS0e+BHh/8gcHfzqU0xXaqXJtAqudphP6MIJXPNAna5OwpwRMNb/kaX2hVqKY+XNYK43ntCQLklYyLI73F6oNFGpbj9Drg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(36840700001)(46966006)(36756003)(86362001)(40480700001)(316002)(54906003)(6916009)(478600001)(82740400003)(356005)(81166007)(2616005)(6666004)(1076003)(966005)(186003)(26005)(82310400005)(7696005)(8676002)(70586007)(4326008)(8936002)(70206006)(41300700001)(5660300002)(2906002)(44832011)(36860700001)(336012)(47076005)(83380400001)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7469
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7aac53ca-4b2a-45bd-7845-08daf2e82cf1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Zlvd+WWdPiUT4wY8UiD9taF81l/UArfvLrY1AHJnGTyOaBglRNsxSmi6FyEePCQZu3RDxso4rnGSeBKfe+tZtYUJ9yqnQ0sfbW8ObMUY6L6dv/u2kuKug/fxk9GLJrgCyk6leOt22ZJ0N8enOabnN8pHR87UfmNkXDkj861sNnpldC/3iTqkkPj9rbZ/9aLTa4OpX1nv8GH41F8B2naRrMTmMoQZV6nQd6TlFBA8mWTGCuE6cMaVlie6rkCtQc3cwuUB19Ierd9SXim6n3O8yNgZA4+nVAfqQnT1B4GBygu9by9pMJMw9h6h1IK7l32U532C4wZsq6hYf8QjvQeIoh8O8zFfQn6xKFcVJgitB25KCa5q2jJ+rDM1KnH4Fi1g9qPytsW1clF//y2J9YcTWenbfTWDdLPUiu4ZxoAb+OR4JSySOQdAfmyvFowjyJGJUUSXz1U5lprvbm92pLOfiyk3yMiyUC8oIEo2XK4n49Ho2+7huc1L3hm6BvzhYzD1yNTDTyo0RQPUTCRrHjUOLqKjmSt7dfKYvUFbknRuYFqDSHs6o0gtM0qREr3udSr/iBjMf8oUZFbXYIcJP/iBZoF1Q/x0ljpEcs7gpfvOumCiXtJmVPNXJyw1UJ+IzreTzPvD8Z5vCJfJp4kFXjxPV2EpEbejd/ZE4SCToAJNvVJEHZnJUio280LauSJPOwVnV6XxqUMZD9y7U1uOt9DkI6z1lA+OmBC77uI8bEcEA3zssjrI1rHGcpJu+mRhiFmmKKlmAnuYtzamx9k4ZEy3A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(70586007)(70206006)(8676002)(336012)(4326008)(186003)(82310400005)(83380400001)(41300700001)(426003)(2906002)(47076005)(82740400003)(36860700001)(36756003)(44832011)(81166007)(5660300002)(40460700003)(8936002)(966005)(478600001)(6666004)(107886003)(2616005)(26005)(1076003)(6916009)(316002)(54906003)(40480700001)(86362001)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:53:53.9747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8555fd-9467-4ee2-b15b-08daf2e833bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7902

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - merged in [2]
3. Add new code to support Arm - this series.

This series only contains the third part patches. As the whole NUMA
series has been reviewed for 1 round in [3], so this series would
be v2)

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

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg01043.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

Henry Wang (1):
  xen/arm: Set correct per-cpu cpu_core_mask

Wei Chen (16):
  xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
  xen/arm: implement helpers to get and update NUMA status
  xen/arm: implement node distance helpers for Arm
  xen/arm: use arch_get_ram_range to memory ranges from bootinfo
  xen/arm: build NUMA cpu_to_node map in dt_smp_init_cpus
  xen/arm: Add boot and secondary CPU to NUMA system
  xen/arm: introduce a helper to parse device tree processor node
  xen/arm: introduce a helper to parse device tree memory node
  xen/arm: introduce a helper to parse device tree NUMA distance map
  xen/arm: unified entry to parse all NUMA data from device tree
  xen/arm: keep guest still be NUMA unware
  xen/arm: enable device tree based NUMA in system init
  xen/arm: implement numa_node_to_arch_nid for device tree NUMA
  xen/arm: use CONFIG_NUMA to gate node_online_map in smpboot
  xen/arm: Provide Kconfig options for Arm to enable NUMA
  docs: update numa command line to support Arm

 SUPPORT.md                        |   1 +
 docs/misc/xen-command-line.pandoc |   2 +-
 xen/arch/arm/Kconfig              |  11 ++
 xen/arch/arm/Makefile             |   2 +
 xen/arch/arm/domain_build.c       |   6 +
 xen/arch/arm/include/asm/numa.h   |  87 ++++++++-
 xen/arch/arm/numa.c               | 183 +++++++++++++++++++
 xen/arch/arm/numa_device_tree.c   | 290 ++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c              |  17 ++
 xen/arch/arm/smpboot.c            |  38 ++++
 xen/arch/x86/include/asm/numa.h   |   2 -
 xen/arch/x86/srat.c               |   2 +-
 xen/include/xen/numa.h            |  11 ++
 13 files changed, 647 insertions(+), 5 deletions(-)
 create mode 100644 xen/arch/arm/numa.c
 create mode 100644 xen/arch/arm/numa_device_tree.c

-- 
2.25.1


