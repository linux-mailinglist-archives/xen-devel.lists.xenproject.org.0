Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D4662F2E9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445561.700777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysR-0006Lg-JB; Fri, 18 Nov 2022 10:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445561.700777; Fri, 18 Nov 2022 10:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysR-0006Iw-FR; Fri, 18 Nov 2022 10:45:43 +0000
Received: by outflank-mailman (input) for mailman id 445561;
 Fri, 18 Nov 2022 10:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovysP-0006Il-Vt
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:45:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2381c934-672e-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 11:45:38 +0100 (CET)
Received: from AS8PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:20b:313::31)
 by AS8PR08MB6135.eurprd08.prod.outlook.com (2603:10a6:20b:29f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 10:45:36 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::a3) by AS8PR04CA0086.outlook.office365.com
 (2603:10a6:20b:313::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:36 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 18 Nov 2022 10:45:35 +0000
Received: from 512672730ec5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17EFD73E-CDBF-4268-A296-41C05B7ED42B.1; 
 Fri, 18 Nov 2022 10:45:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 512672730ec5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 10:45:29 +0000
Received: from AS9PR06CA0199.eurprd06.prod.outlook.com (2603:10a6:20b:45d::18)
 by GV1PR08MB8282.eurprd08.prod.outlook.com (2603:10a6:150:a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Fri, 18 Nov
 2022 10:45:25 +0000
Received: from VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::9c) by AS9PR06CA0199.outlook.office365.com
 (2603:10a6:20b:45d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT043.mail.protection.outlook.com (100.127.145.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:25 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:14 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:11 +0000
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
X-Inumbo-ID: 2381c934-672e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3/p1nqS41EbjHPQPygremo0ETj4Qsi4txZRseA7A4M=;
 b=NxwfLHI9bVp6stCHiCksFe275s1jpunLFqV3y6w7d7NDoiMB+b8VAt1F+kv+KNir0FsqSdYq1iZ6z1mL78jhnVbRyqFv4jMKdikfixb9J0ba3FobL1KsZg6XwIJ9eFCODLJIbCXqCUHol2EkiaFTe6GpAJ3FD8yk0xyQZvFBk88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ab75544f7eb704a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWayiA9LFuzUYGMjvbcodlSgdARBkUPZmNIOYSL9aiZeTdDTEb2p2a3B4GLw/VlkcRILn7vtJLvQ+6SD9/RyjXMRBKBAIvtgFNVcckH0H1v7SZ3Sz/bMVoqLwauhMSl4Z/xI+0xjAOuuLRSQOz1/+VQ8GqxM61BaJCe6hFR3xB9USN3mrYLtv4yvnp/s6WlUY/r9acSy/VzQCX2GVDiyWj7NY6vDDWYBsGP8xdxkKGiZuPNf2tt/s8f+Sz71OdNNgijQq4PFDBsesLSdJWMNx8pO9m/19UIDLbaHBREJQFd98oIyoUKZgay3d8AJGyDaFsxvINRP5aw2XieET37U+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3/p1nqS41EbjHPQPygremo0ETj4Qsi4txZRseA7A4M=;
 b=Leq6UVYioYtp7mUSz/aJ/yyTU8pzyrzlYbgGKaUC1DWtsIateLxSORSZJEW1iJr9wEfE1HfmXJ3pYV4dG2X+rnzLgo9InniZRXNF/04z/MPsGH0xJeM4Vn4MqZ2G/rkw21ebxDdSR4efLTnk2K3xIhlGUgOUIWe9MpFArtnVgN7oZBPuTKQ9q48hrUtTUip2g9QeqKtdR2ZxqYVyHW2lFsnxiWoAHONUPxReZ/JSUgnAbsMlF0j8hN1i4HFMz3nFQHHuzoy34cIMbgN06rgczZstOhtWBasyt8gTOuMETKDRMIdvoZcbE2OYrhTec99YcvQv0AAuatPHU2JKHhvC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3/p1nqS41EbjHPQPygremo0ETj4Qsi4txZRseA7A4M=;
 b=NxwfLHI9bVp6stCHiCksFe275s1jpunLFqV3y6w7d7NDoiMB+b8VAt1F+kv+KNir0FsqSdYq1iZ6z1mL78jhnVbRyqFv4jMKdikfixb9J0ba3FobL1KsZg6XwIJ9eFCODLJIbCXqCUHol2EkiaFTe6GpAJ3FD8yk0xyQZvFBk88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 0/6] Device tree based NUMA support for Arm - Part#2
Date: Fri, 18 Nov 2022 18:45:02 +0800
Message-ID: <20221118104508.768274-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT043:EE_|GV1PR08MB8282:EE_|AM7EUR03FT035:EE_|AS8PR08MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: a0141c61-a652-4aaa-6303-08dac952069b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1FxuQrTFvi6gM5VZn8Axqe56JEZs1v68YWv5vOepK73r35OOBrqeH0l9F+ebEzA2Mj5ZgI5jaAfavW4CbfCTAxsAa3+sVcu6VjnQNbExiLDyKOIETa4BuNut6d+9eCFbLqyjk7NTqWSf+bOUIwzNk6biAx648EIFnTJDTj+uRHr9ibaaBJD9Vl8c/qcV6psWfBmaZYsJalPdhMwM4otj5m/t07NwVw0slqFQpMXHsYsQrdCYNXeRnS7g33uMxEHGX+ORxhPNWykw0AMaMxZGQyx+JAq0SeNOSEmrlUSFWHc+VM5Ibb9I9AR0+eo8+qQPhnGt+uJqt4nPadpVEwvaJLfrDF0Q7qsSHxfGeiho1KSs+sYdoM4Q1ZnQNlE0+seUAyW1IkT8dJs3mghj+Zee4mp3wToMxskIt5Ggz6D9Tk9zB2Iyg0vxNaruFuNKuuEbfwf25CB9LfmS8CU2NqFv+ZO1S2jLS6g9mN6oHT7wv3A+E8snN6dTz8a2Ad5vNQXmsZNMC00mxJrN47k2QdDvVRTlGf2NBTrLj+GC6rHIV2mdgdB7cB6jUf0SeXdlsm5O81dFW/TFO+mBI+wa2NLO0YgPFjySLjjixkVLmUHNp18Adw6FIK4XcV5fBlCRTxJGWCZgF0KuVtsyZaqk5NUo61ByxGq9mtd+QKzVSNpy4JRrreaKndAMo0cxDPCsTKLWm2HWYg3WVNX+mIdF2z1dtrTusNujOHqEwo+oqk80JaLvyIkYLCtmlGpj0FSyId6ubcqOVbOjSfy0sqbXj5aP7AoCuZ9cWlb+wgvLZQFOIp3kIK2rnVARDTBJG0jQP3Ot
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39850400004)(451199015)(40470700004)(36840700001)(46966006)(26005)(6666004)(7696005)(2906002)(82310400005)(5660300002)(44832011)(81166007)(356005)(47076005)(966005)(336012)(426003)(1076003)(2616005)(186003)(70206006)(36756003)(83380400001)(70586007)(478600001)(8676002)(40480700001)(40460700003)(54906003)(316002)(8936002)(41300700001)(4326008)(86362001)(82740400003)(6916009)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8282
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dbc08d06-fe27-4de1-3ed7-08dac952001d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pN84wKvdq1F9A0V3YC9tqFMFE9WXkdQ4aGTPCDnTpOBCL72+SF6d425odNPpc3H363eRMjzDDWtGUuGx5V2CO8BclAsxKPvUTJDKz/Ne9tJDXTPcmucO2d7Q4u+YANBC/LzqyZXofa7k/NxhrzVqXfUXDrdxFOJvs+dtpmRzvZyi5SuecXOWAMLgVe6v8r7ieI1WgLeblRGSjfNYBP6zepauD8fmJIKC/AgYtL/cYflCHEysRPQ/cGEPbIPMLoAmRtXYDZhNYJFGAmQsfxNKoK3dfzeNWC6IWKRGcIw6H5U4cE4SolyUfv9KNmRFG8VmVbg9qY1CFwd8ArFS9pHOcQ78na4nChCk9CgmBBqMoQzK3Gx13XvWH5c37V/OUi4Ks4g/z5SzR+0pK5W/RuSMZckV1Mkvk+gZF9bbzFq6TMQlGTzwGc7i8xSmMvsl6TZkRQS9J6Qi0ACfHD7PlQGOTVCOGW1ESNAmuOcfAjw5bumpJgpk3FNetNHBpLJBW9+X7NOm64uCoYEYF+3CU8t6tJIUFKhPi1VTHcmbguu4HjjgpYybYkE3Kro3KI3W6+i44xtWm2Jzswygn48y3gjTXf1saHIWOK7awYrrtXxkXxfuM4wMKfMMLiY3s7VtQANyxCa7dRO7n90v6s5eRL+u0S+giLcDWosRFYzZatJZ6EdzO1sIjJHTSTPcSBs7JHk+g7hkQI90BePYUc0V+sOHJs+QOrWJiEjTIcVwjg2fQ00B2aMi8Bd8fQPrc5Xic/G3zhuH25BEhWNrRbMufy7d5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(426003)(186003)(336012)(2616005)(1076003)(81166007)(47076005)(82740400003)(2906002)(26005)(107886003)(7696005)(6666004)(36860700001)(83380400001)(478600001)(6916009)(966005)(54906003)(316002)(5660300002)(44832011)(70586007)(8936002)(86362001)(41300700001)(8676002)(40460700003)(70206006)(4326008)(82310400005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:45:36.0913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0141c61-a652-4aaa-6303-08dac952069b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v9)

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
[2] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

---
v8 ->v9:
 1. Remove incorrect description in patch#5's commit log.
 2. Add code comments for the places to set numa_fw_nid_name.
v7 -> v8:
 1. Change "of shift too small" to "or shift too small".
 2. Add numa_fw_nid_name setting in srat_parse_regions after
    acpi_table_parse succeeded.
v6 -> v7:
 1. Restore %d for nodeid_t in dump_numa.
 2. Use sizeof(page_num_node) for page_num_node size in memset.
 3. Add description for using min(PADDR_BITS, BITS_PER_LONG - 1)
    to calculate the shift when only one node is in the system.
 4. Use %pd for domain print in dump_numa.
 5. Add __init for arch_numa_unavailable.
 6. Use __ro_after_init for mem_hotplug.
 7. Use "???" instead of "NONAME" for unset numa_fw_nid_name.
 8. Fix code-style.
v5 -> v6:
 1. Revert arch_numa_broken to arch_numa_disabled, as acpi_numa
    can be set to -1 by users. So acpi_numa < 0 does not mean
    a broken firmware.
 2. Replace numa_scan_node to numa_process_nodes in commit log.
 3. Limit the scope of page_num_node, vnuma and page of numa_setup
    function.
 4. Use memset to init page_num_node instead of for_each_online_node.
 5. Use %u instead of %d for nodeid_t and j in numa_setup print
    messages.
 6. Use min(PADDR_BITS, BITS_PER_LONG - 1) to calculate the shift
    when only one node is in the system.
 7. Drop the marco: node_to_first_cpu(node)
 8. Use arch_numa_unavailable to replace arch_numa_disabled for
    acpi_numa <= 0.
 9. Remove Kconfig for HAS_NUMA_NODE_FWID.
10. Use numa_fw_nid_name for NUMA implementation to set their fw
    NUMA node name for print messages.

v4 -> v5:
 1. Use arch_numa_broken instead of arch_numa_disabled for
    acpi_numa < 0 check. Because arch_numa_disabled might
    include acpi_numa < 0 (init failed) and acpi_numa == 0
    (no data or data no init) cases.
 2. Use nodeid_t instead of uint8_t for memnodemap.
 3. Restore to use typeof(*memnodemap) for _memnodemap, this will avoid the
    further adjustments for _memnodemap's type.
 4. Use __ro_after_init for numa_off.
 5. Use pointer-to-const for proper function parameters.
 6. Use unsigned int for variables that are not realy used for node ID.
 7. Fix code comments code-style and adjust the length.
 8. Fix code-styles.
 9. Rename numa_scan_nodes to numa_process_nodes.
10. Defer introduce arch_numa_disabled for acpi_numa <= 0. And remove
    the paramter init_as_disable of arch_numa_disabled.
11. Fix typo "expandsion".
12. Fix Indentation for l1tf_safe_maddr.
13. Remove double blank lines.
14. Add a space between for_each_node_mask and '('.
    Add a space page_list_for_each and '('.
15. Use bool for nodes_cover_memory return value.
16. Use a plain "int ret" to record compute_hash_shift return value.
17. Add a blank line before the function's main "return".
18. Add new Kconfig option HAS_NUMA_NODE_FWID to common/Kconfig.

v3 -> v4:
 1. Add init_as_disable as arch_numa_disabled parameter in the patche
    where use it.
 2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
 3. Restore compute_hash_shift's return value to int.
 4. Remove unnecessary parentheses for macros.
 5. Use unsigned int for proper variables.
 6. Fix some code-style.
 7. Move arch_get_ram_range function comment to header file.
 8. Use bool for found, and add a new "err" for the return
    value of arch_get_ram_range.
 9. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
10. Use bool as return value for functions that only return
    0/1 or 0/-EINVAL.
11. Move mem_hotplug to a proper place in mm.h
12. Remove useless "size" in numa_scan_nodes.
13. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
    between node id and architectural node id (fw node id).

v2 -> v3:
 1. Drop enumeration of numa status.
 2. Use helpers to get/update acpi_numa.
 3. Insert spaces among parameters of strncmp in numa_setup.
 4. Drop helpers to access mem_hotplug. Export mem_hotplug for all arch.
 5. Remove acpi.h from common/numa.c.
 6. Rename acpi_scan_nodes to numa_scan_nodes.
 7. Replace u8 by uint8_t for memnodemap.
 8. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 9. Use nodeid_t for nodeid and node numbers.
10. Use __read_mostly and __ro_after_init for appropriate variables.
11. Adjust the __read_mostly and __initdata location for some variables.
12. Convert from plain int to unsigned for cpuid and other proper 
13. Remove unnecessary change items in history.
14. Rename arch_get_memory_map to arch_get_ram_range.
15. Use -ENOENT instead of -ENODEV to indicate end of memory map.
16. Add description to code comment that arch_get_ram_range returns
    RAM range in [start, end) format.
17. Rename bad_srat to numa_fw_bad.
18. Rename node_to_pxm to numa_node_to_arch_nid.
19. Merge patch#7 and #8 into patch#6.
20. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
22. Use 2-64 for node range.

v1 -> v2:
 1. Refine the commit messages of several patches.
 2. Merge v1 patch#9,10 into one patch. Introduce the new functions
    in the same patch that this patch will be used first time.
 3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
    in this case, we can drop mem_hotplug_boundary.
 4. Remove fw_numa, use enumeration to replace numa_off and acpi_numa.
 5. Correct return value of srat_disabled.
 6. Introduce numa_enabled_with_firmware.
 7. Refine the justification of using !node_data[nid].node_spanned_pages.
 8. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
 9. Adjust the conditional express for ASSERT.
10. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
11. Use conditional macro to gate MAX_NUMNODES for other architectures.
12. Use arch_get_memory_map to replace arch_get_memory_bank_range
    and arch_get_memory_bank_number.
13. Remove the !start || !end check, because caller guarantee
    these two pointers will not be NULL.
14. Add code comment for numa_update_node_memblks to explain:
    Assumes all memory regions belonging to a single node
    are in one chunk. Holes between them will be included
    in the node.
15. Merge this single patch instead of serval patches to move
    x86 SRAT code to common.
16. Export node_to_pxm to keep pxm information in NUMA scan
    nodes error messages.
17. Change the code style to target file's Xen code-style.
18. Adjust some __init and __initdata for some functions and
    variables.
19. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA. Replace "SRAT" texts.
20. Turn numa_scan_nodes to static.
21. Change NR_NUMA_NODES upper bound from 4095 to 255.

Wei Chen (6):
  xen/x86: Provide helpers for common code to access acpi_numa
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen/x86: use arch_get_ram_range to get information from E820 map
  xen/x86: move NUMA process nodes nodes code from x86 to common
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   2 -
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/mm.c                |   2 -
 xen/arch/x86/numa.c              | 441 +----------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              | 337 ++-----------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 803 +++++++++++++++++++++++++++++++
 xen/common/page_alloc.c          |   2 +
 xen/include/xen/mm.h             |   2 +
 xen/include/xen/numa.h           |  96 +++-
 14 files changed, 964 insertions(+), 799 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


