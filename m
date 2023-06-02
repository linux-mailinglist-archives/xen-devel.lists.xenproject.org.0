Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E8720120
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 14:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543105.847755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53Zl-0003xY-9A; Fri, 02 Jun 2023 12:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543105.847755; Fri, 02 Jun 2023 12:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53Zl-0003vR-6U; Fri, 02 Jun 2023 12:08:13 +0000
Received: by outflank-mailman (input) for mailman id 543105;
 Fri, 02 Jun 2023 12:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q53Zj-0003vL-Sn
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 12:08:12 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2116f225-013e-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 14:08:06 +0200 (CEST)
Received: from BN0PR04CA0163.namprd04.prod.outlook.com (2603:10b6:408:eb::18)
 by SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 12:08:01 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::bb) by BN0PR04CA0163.outlook.office365.com
 (2603:10b6:408:eb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 12:08:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.26 via Frontend Transport; Fri, 2 Jun 2023 12:08:00 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:08:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 05:08:00 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 2 Jun 2023 07:07:58 -0500
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
X-Inumbo-ID: 2116f225-013e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhTEujuK5FcFiNiRCgDXRS3ogDtBLkQ0qBiGLJ5lLeDKpWRzlxB68Cjg+8dSL6aOePsyHNIdKuVXPtJCheA2LdwwjgJZ33hPJH4aiQsaP+oRoDZgl7w7B4614qFECDQ1QLetGtfoOn4XSAzJNz7NEVRNCd3BY68Kv7Iv5QXSXR7Sur6AXIch7vo2Cp5EbLhkfEHARySUaNuOTLbZwnjOkihF4KVWJdNUyBdsnHBfFH1J99UHNt6A8LxRHhBOwMSw0aD2+lmtfq/oSc+7Vp+7DxZRZ7TZa+kLrRVBOiEJF/a+j/BiNd5mvfESP0bZ8shuZQs3QUiOjm1Y65rymX4oiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwUgFN+v84+dyD6AXZiKfwpAP4rynV/HYS5xaHDsbxk=;
 b=P8ZCKrKUFCw3bdc4pQP+LUA2P3AK7QtCeJw8x+b9JQ1ccg9pbfCsI1HPzE0AwuinrRQNLI5OJxyqWEBJsRtqH0S7kOoaTtHok5NhpoWGwie7m2UwJ/r9HDSTPeCxj8byY8A/yq2OKayICoL6C4vq0ZjAOeqhBKJrkKxpBeXHpDaKz2MgfSOsULOrFltzEVmopkvsvVXFJZKYXad7UpjVogkx+I9ixeCmEn2xIvodG+YhoMUJE5g9Ktr2Ic40lCxJqySOtnBXrTESowWwd0irHvzeWQF7Id3477hTyIpw85hnDy3OnkZn2I9Gptcy/smmPKMX+SFNJnAAZzQAobIDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwUgFN+v84+dyD6AXZiKfwpAP4rynV/HYS5xaHDsbxk=;
 b=w3IhOPa8wWhBj49OVYH0pQBY3I/0wOiSXjXbU5NXIBSXjqDorMVPPsv8w0rbUh31ZhKBGImRg5X9263uj9MphWsKrNaonD6XC8MZtAlgYXNgINeqixOWEP5xsrb7nCJJggcD4E/5508nqbkQQXMiOBbcq/KKLPleSUIOi50Av8U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v8 0/5] Add support for 32-bit physical address
Date: Fri, 2 Jun 2023 13:07:49 +0100
Message-ID: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f10c919-945e-488d-162c-08db636202da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	93rclmzG8rbElM+hzmUfxAmmjVPfqb6Rci/GAmjirWs9bpDmcuPPV0pY/gP21QrTanACJ3BqBloB/G5VAM+MkBFw1Q323gjGpPfs23C3mfEg93zIgII1SrGXX9jFhxVHzog2C4halrOtwdwYwD6HNwwtq+gGReMhzxepl/MOSKc+lHO4x6bekQ+4PNaZxCO7lc3o284HtlxZo5vTIqr4mZ0niiI3HrqB6txVjvPB0LFSiAl4htu8bZT4QzyN+XH/KXbkaz8755A6VKmOQ/WmyPVVlTspgH1Mx5x1S7V7g0zJb0RkOMBaImFGtkFfH6AmkiqaXqgaUJayEiVnUjEhRsWU5UKJukiXzoit6yL3yNHh/9Lacs/fCX38VNGTgdizu37jqOJK+Hr9M+kI3PCjGFcxfJYDvbwEITAB4xVooEAJUqdCnuiE0xOqMUhmubrCqBS9vOSpfrjgBoOW80ST/fi8bn0/lIJzoCib4ppSNo6hGb3HsNEsBRxc/TJ9GCDCcuhHR+M/r7DH7pVkZxEMjKhGQstJzRJXm7zoHqP48SakZqK+K/+f4Eq+9vg0Dr51DqNc0ZOnQiBT38KOSXbLyOM7ADFWUIXLPzYcY4GmPN+EAbZqD05ed2oKmzlmfx3K0z2j6pFW0dDhrsLU7EJfi3LyriOpFhO2MEPF/j4rmUKbNJTxPLwkBR1JC6+Ot8H+gvwHOIvONrmLQLVdLrcp+a38ohGUZoqUmJajfwC6sntyYYfXfq3m8E+vLQbd7C7DDYn4ulw/SjeKva44+B25R2oZZKDuOjpteU63pOeQg4g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(186003)(426003)(336012)(2616005)(7416002)(1076003)(5660300002)(83380400001)(26005)(8676002)(8936002)(47076005)(2906002)(36860700001)(966005)(316002)(40460700003)(4326008)(40480700001)(6916009)(6666004)(41300700001)(54906003)(356005)(82310400005)(82740400003)(36756003)(81166007)(478600001)(103116003)(70586007)(86362001)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 12:08:00.8536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f10c919-945e-488d-162c-08db636202da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184

Hi All,

Please have a look at https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg01465.html
for the context.

The benefits of using 32 bit physical addresses are as follows :-

1. It helps to use Xen on platforms (for eg R52) which supports 32-bit
physical addresses and has no support for large physical address extension.
On 32-bit MPU systems which supports flat-mapping (for eg R52), it helps
to translate 32 bit VA into 32 bit PA.

2. It also helps in code optimization when the underlying platform does not
use large physical address extension.

The following points are to be noted :-
1. Device tree always use uint64_t for address and size. The caller needs to
translate between uint64_t and unsigned long (when 32 bit physical addressing is used).
2. Currently, we have enabled this option for Arm_32 as the MMU for Arm_64
uses 48-bit physical addressing.

Changes from :

v1 - 1. Reordered the patches such that the first three patches fixes issues in
the existing codebase. These can be applied independent of the remaining patches
in this serie.

2. Dropped translate_dt_address_size() for the address/size translation between
paddr_t and u64 (as parsed from the device tree). Also, dropped the check for
truncation (while converting u64 to paddr_t).
Instead now we have modified device_tree_get_reg() and typecasted the return for
dt_read_number(), to obtain paddr_t. Also, introduced wrappers for
fdt_get_mem_rsv() and dt_device_get_address() for the same purpose. These can be
found in patch 4/11 and patch 6/11.

3. Split "Other adaptations required to support 32bit paddr" into the following
individual patches for each adaptation :
  xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to
    SMMU_CBn_TTBR0
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_ARM_PA_32"

4. Introduced "xen/arm: p2m: Enable support for 32bit IPA".

v2 - 1. Dropped patches 1/11, 2/11 and 3/11 from the v2 as it has already been
committed (except 2/11 - "[XEN v5] xen/arm: Use the correct format specifier"
which is waiting to be committed).

2. Introduced a new patch "xen/drivers: ns16550: Use paddr_t for io_base/io_size".

v3 - 1. Combined the patches from https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00656.html in this series.

v4 - 1. Dropped "xen/drivers: ns16550: Use paddr_t for io_base/io_size" from the patch series.

2. Introduced "xen/arm: domain_build: Check if the address fits the range of physical address".

3. "xen/arm: Use the correct format specifier" has been committed in v4.

v5 - 1. Based on the comments on "[XEN v5 08/10] xen/arm: domain_build: Check if the address fits the range of physical address",
the patch has been modified and split into the following :-

a.  xen: dt: Replace u64 with uint64_t as the callback function parameters
    for dt_for_each_range()
b.  xen/arm: pci: Use 'uint64_t' as the datatype for the function
    parameters.
c.  xen/arm: domain_build: Check if the address fits the range of physical
    address

v6 - 1. Reordered the patches such that only the patches which are dependent on
"CONFIG_PHYS_ADDR_T_32" appear after the Kconfig option is introduced.

v7 - 1. Changes from "[XEN v7 01/11] xen/arm: domain_build: Track unallocated pages using the frame number
" till "[XEN v7 06/11] xen: dt: Replace u64 with uint64_t as the callback function parameters for dt_for_each_range()"
have been committed. So the remaining 5 patches are sent out.

Ayan Kumar Halder (5):
  xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
  xen/arm: Introduce choice to enable 64/32 bit physical addressing
  xen/arm: guest_walk: LPAE specific bits should be enclosed within
    "ifndef CONFIG_PHYS_ADDR_T_32"
  xen/arm: Restrict zeroeth_table_offset for ARM_64
  xen/arm: p2m: Enable support for 32bit IPA for ARM_32

 xen/arch/Kconfig                     |  3 ++
 xen/arch/arm/Kconfig                 | 33 ++++++++++++++++++
 xen/arch/arm/guest_walk.c            |  2 ++
 xen/arch/arm/include/asm/lpae.h      |  4 +++
 xen/arch/arm/include/asm/p2m.h       |  6 ----
 xen/arch/arm/include/asm/page-bits.h |  6 +---
 xen/arch/arm/include/asm/types.h     | 14 ++++++++
 xen/arch/arm/mm.c                    | 12 +++----
 xen/arch/arm/p2m.c                   | 51 +++++++++++++++++++++-------
 9 files changed, 101 insertions(+), 30 deletions(-)

-- 
2.17.1


