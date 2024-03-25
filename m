Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A686A88B1DE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 21:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697876.1089086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCD-0007Nv-Nz; Mon, 25 Mar 2024 20:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697876.1089086; Mon, 25 Mar 2024 20:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCD-0007LJ-L8; Mon, 25 Mar 2024 20:45:29 +0000
Received: by outflank-mailman (input) for mailman id 697876;
 Mon, 25 Mar 2024 20:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvT0=K7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rorCC-0007L7-Dn
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 20:45:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99cd7e94-eae8-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 21:45:26 +0100 (CET)
Received: from SJ0PR03CA0159.namprd03.prod.outlook.com (2603:10b6:a03:338::14)
 by SJ2PR12MB7821.namprd12.prod.outlook.com (2603:10b6:a03:4d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 20:45:19 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::ac) by SJ0PR03CA0159.outlook.office365.com
 (2603:10b6:a03:338::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 20:45:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 20:45:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:17 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 15:45:16 -0500
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
X-Inumbo-ID: 99cd7e94-eae8-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2H6DGwLWkgS9BpczdGu6La7aNft0ZYMWAobnXiG/YOR1wWF9jQdAHjKwZhRdjOcQ6aDWf16mDDnRMqTrygTdKRateLa19Y+fc5fyTtjI6EnKiIE9v4KDLFdoBPRRUwiYvuSMDLPvoRsKRbld48oewaVc7IvZdNFDTduIUQX2gqmAiycWbjIFa0kIjv2eEMeAXhf/gzQfpk29ETM9stjyNJjLJqVE+iM+lROj3QZEEatobRUcpj6KfgcVeTEYi/I9P/HnAJ7K8IZPfhBcJIkCaBWKCUVtxB8sIG2otRzyPs7cvitEVXjafBeYxemXqXJ2if/N8JU4AarQekO7x9aCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVIhZ2xHZdP1BNOcu89kmSvypYbpjEehnkVKCvRnSFQ=;
 b=kopnGztjHt91LuKWXajCm14mBDw6+OIM6ZhFdPlT0jnL38IGn39t4O5ioJZ3Q0aGqb8xOs9QVt0UsM9x+mHIUyBFRyJJLjqGV5C/fwe076RxXUwxi+CEhn4EKsISzb9pHOt1AM83CPUC9IIMP87cU0aaTUM+RI9asRkfVGGYlvRAzfvmZLjXFhlObj44Vvedny9bxKqXxzt1aAe/LFmSBbE+Dbkvc6FyOp7WCVIUXavrOR+qiAxqGa43qyRCAahRXv5yvdMPaU4AJaCEZBl2pQ2hQNarLZtCO8kp/dkaF9gJehHE7ZdFcDXfQW0dWLyWf/MxK2SG//kNJ4IHyCKnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVIhZ2xHZdP1BNOcu89kmSvypYbpjEehnkVKCvRnSFQ=;
 b=ycQXLov3tn5C9E9QcWvljSp76U7HjrBtBLsh3AwMbemviRlIYX+UBBv8jAAto25gxVTAd29N2Ag965+nHuM7svcw74mqlOdcWmc2hopv/PNVpxFyDffyju+Roic0e5k1QGC4CXwTsu1pOlRgm9JbhdtJdWqShsKdiYBIv8P8BFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/5] x86/pvh: Support relocating dom0 kernel
Date: Mon, 25 Mar 2024 16:45:10 -0400
Message-ID: <20240325204515.250203-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: bae5e3af-9f19-4df3-b16f-08dc4d0c7b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QoWDtB29oD+tbpcmQ3JpM7xBMSoGO/AsriQvvjnNWH8eNyBBhChHQmjxgUK2vJYVgQOC3RvQ5bgyGQOx2eO9PbQs2ygNMvqsKFiyJbAZZ8jmn3BrVuGqdYzDdgPmWiZw+bYdgDcL86ikMzZSFOx4ZCS24cRn6pvlTrlcVYMpmfNMps7J/mQFDZ1MoQMN1Wkgpl3I8EhXKRnBpzxCa8ow6KrRfTFpyF22wSkuBhp/7r6VHgxofmYopDQnVqfstaoQGr9tQOrUSB5c6s8R1slpRKoZG+9gAucQfForMZjYZ52Bq57Z9Bbf4tvMXvuWTlnuWC94aecPJMf1PCaHXR93qZaDLqt8M2HTYISGBbCXKZbGk+4S6plcc/zuwNMjRxnHLT9jBk61qcdkeeuViuQZqnZhHGHLZm2TS/0kDVao7T+Ih0DPr+j2eu4NxNkzqiOzccmy1JqjL5xThbU4BECd57uztE/pZ2smKzbP2WbdbfrKgzIoEMmVjtiwk6uHpZubzrfPmoiczjNR7P51QBOYryeyLMShEfayR+qxx9kuxcPG40IqinuQH7f1a+2ViUsIs+g5G3AbaxLJN6NvVJQg8sBPRxvFYN6TZPXA+EXv3fuZm8yMWz+GjgcTA9q5aEzq0zHGkkMYs51IzFVkQCCskdG+n3DD4GXt/jThuj53BaBUNsmtP4p/BuGh+4gVYkQI9D579yOgm+OGeg6w4EStVTzcYBSkRq5csFfL9DgxUd4qH/3F1tbHqx2RXnl7npZ+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 20:45:18.6519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae5e3af-9f19-4df3-b16f-08dc4d0c7b92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The other issue is that the Linux PVH entry point is not
position-independent.  It expects to run at the compiled
CONFIG_PHYSICAL_ADDRESS.

This patch set expands the PVH dom0 builder to try to relocate the
kernel if needed and possible.  XEN_ELFNOTE_PHYS32_RELOC is added for
kernels to indicate they are relocatable and their acceptable address
range and alignment.

The first patch reverts "xen/x86: bzImage parse kernel_alignment" since
the alignment will be specified by the ELF note.

The second and third patches move MB/GB() to common-macros.h.

The fourth patch expands ELF note printing beyond just printing
integers and strings.

The fifth patch expands the pvh dom0 kernel placement code.

I'll post an additional patch showing the Linux changes to make PVH
relocatable.

Jason Andryuk (5):
  Revert "xen/x86: bzImage parse kernel_alignment"
  tools/init-xenstore-domain: Replace variable MB() usage
  tools: Move MB/GB() to common-macros.h
  libelf: Expand ELF note printing
  x86/PVH: Support relocatable dom0 kernels

 tools/firmware/hvmloader/util.h         |  3 -
 tools/helpers/init-xenstore-domain.c    | 11 ++-
 tools/include/xen-tools/common-macros.h |  4 +
 tools/libs/light/libxl_internal.h       |  4 -
 xen/arch/x86/bzimage.c                  |  4 +-
 xen/arch/x86/hvm/dom0_build.c           | 98 ++++++++++++++++++++++++-
 xen/arch/x86/include/asm/bzimage.h      |  2 +-
 xen/arch/x86/pv/dom0_build.c            |  2 +-
 xen/common/libelf/libelf-dominfo.c      | 97 ++++++++++++++++++------
 xen/common/libelf/libelf-private.h      |  1 +
 xen/include/public/elfnote.h            | 19 ++++-
 xen/include/xen/libelf.h                |  4 +
 12 files changed, 206 insertions(+), 43 deletions(-)

-- 
2.44.0


