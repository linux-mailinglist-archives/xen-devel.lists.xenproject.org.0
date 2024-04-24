Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5588AFFC0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711014.1110628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPZ-0002MC-7Y; Wed, 24 Apr 2024 03:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711014.1110628; Wed, 24 Apr 2024 03:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPZ-0002J0-3z; Wed, 24 Apr 2024 03:35:09 +0000
Received: by outflank-mailman (input) for mailman id 711014;
 Wed, 24 Apr 2024 03:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTPX-0002In-9K
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:35:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2c7f7d7-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:35:04 +0200 (CEST)
Received: from MN2PR20CA0015.namprd20.prod.outlook.com (2603:10b6:208:e8::28)
 by SN7PR12MB6931.namprd12.prod.outlook.com (2603:10b6:806:261::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:35:01 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::e8) by MN2PR20CA0015.outlook.office365.com
 (2603:10b6:208:e8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.31 via Frontend
 Transport; Wed, 24 Apr 2024 03:35:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:35:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:34:59 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:34:56 -0500
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
X-Inumbo-ID: a2c7f7d7-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fg3ahqCV3rveQ+wJD5cgRjWa9VjEjxPsvWqjFZTTPMWlNdIkIyGwX10jNxEv3qx9vkXPJEvBGYf+vLRhpPmEO3wwPO/qS7n6VtXIq+0kZXRynXcyHtO/r4tMiU2JkSp6UFbtK5RvDXSlWqq1faz3XJZXUZF3BAXf4redcHYyVcAMA0uKb3p9FvFyvJA+G7Mi92ELhMBjZezrnFq9ob/iVsdYlYGZScIJYXXcEvNlvFom6uuF/62UlttRnJiji11qQqlGzyxBnI6BeMzdSLayJ/7+aT7034HKXBNhtfs9NHqNS0ysfd4wB2fTHmppjNXngevvzqdKwl0vcw/OBBrMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8xiVSK43JcuQ2nthoi/16vjOz+ZRWIMT3UJle6ixKY=;
 b=jPGyE1+6Y1ZkNe1YepJU1VzXoQBe3lvC6MYIZhB6UI92S3KaAJO3qWhifa/BuH7zvuC49JSEtIrI0hD7rgk1GmsQSAsREF/MYAyAuQBjEF2RAMZTZwKsLSBRvg6zR0IcfYFb62MNuWOUhJCGUWKdL/0po5JPRXR/sRe/gcUbGvENcYtJPFJ9fQBmvIrpSBFTpOcty9NJsnOIahFHy0v3iJ0d/qUBs1NsD84mzEiO+JVrEAoyAmi1pbZKnxCR17e9gI+hhfeFi59bkWDSfrFxV2c1xRk0iiE+WqcGS6cpvK6+ws7Bm88/391hTtJ+GWsO86KN2cY95O11E0zUIaQDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8xiVSK43JcuQ2nthoi/16vjOz+ZRWIMT3UJle6ixKY=;
 b=pqqbba8rBWwPSfbnA2K5pAJwJn1QjNGBcHXI6DKQ9LQfuQU6DRxCk9alArlFhOvUE2ZjRDq4Y+oHEs9tbNGFhUX3NOQ8w7tC5AviKiya4gB+zS3Nbo9aHRLgngIeaGMnUGOMWaTuLWmjp34pjPwN+eb1wWtK/GDtPGwdNBBk9do=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH 00/15] Remaining patches for dynamic node programming using overlay dtbo
Date: Wed, 24 Apr 2024 11:34:34 +0800
Message-ID: <20240424033449.168398-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SN7PR12MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 5007a93b-7ff4-4aef-6e36-08dc640f8576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WS9mZzR2dFhjMlVlbVdocGRwQ3pEK3NzeTRyK0IzSkJHanIxeVVSa0lVWjBr?=
 =?utf-8?B?YVk1dE9PeTRzODFuQ0I0RFJxT25WMzRST0xwNGRWVDdHc1diU0JJM0x6UG0z?=
 =?utf-8?B?YndOd0FORDVBemRvQWtnUEpiMmxKdncyZ1BXUkJ3T3VKUGtBNkppSWZUbmQ5?=
 =?utf-8?B?aUZwbXpyOFE0dTdBTVE5S2pWVWV6ckNHNlZSTGUwMTBSN2dKSjNXdUpNR2Jw?=
 =?utf-8?B?ejhDU0pXZnZyclZSKzVhV0p2MDhERjRPKzh5RXFWZ1R6SmpxajRJUlNob2JS?=
 =?utf-8?B?OTdNZUFFYVpLZVNScXdYZlNKVTE3UVNTRW5EUnZWM2IwUDZjQnZtdGdtRm5q?=
 =?utf-8?B?WHhmS0gvWTdpM0Nkc3FoN2xnWUE2VTBIRDVjVzZOWm9VZG5vMGNwaVg4VVhI?=
 =?utf-8?B?eERaVnQveS9DY09aYjVUWlpDa2gwOXNEaWdwcWpuRHF6cElyK3liZUNuckJC?=
 =?utf-8?B?R3BjMy8yaHBmd0RCdi9RdFFsSFI3ME1hblVOa092MUQ1blpVWlpTU2RvSDdv?=
 =?utf-8?B?UWMzN3ZRZlhZdjBmRmVZUkp1VUlEMjh6R0gvWmx0WjdHN2t4S29qc1ozWXJF?=
 =?utf-8?B?NlRJSzJYb1UzNFRYUzBsd09kSkZkaExid04zVGxaL1JiQzBhMmF0MmErSnVl?=
 =?utf-8?B?U3MvL0JhQWx1UWdISGdFOExvR2N5ZkRPWXhXQ3JXckpzdDZsNXBNSUxLSmxC?=
 =?utf-8?B?Qzh4M3VQM1BucnNvN214U1l3UVdEQjErRCtLMHBQWTVHU0NTWnc5eDl0MG5Q?=
 =?utf-8?B?L1d4cUZyM3A5QUdObEZGWVJiOEd5S0F5U1I5QWZReGZpN0doWktWK3Y1NXVu?=
 =?utf-8?B?Lzk1YzFRNG55d0NXeGlmeU1HV3llYjlSZHEzRU5vWjFycVBRdTZGYis1T1o5?=
 =?utf-8?B?MS9zUTdJckF2Zkg0U0JUZ21NbmdtVjRXNkJiUTV6UE1CSXFCSk85c0xOalpS?=
 =?utf-8?B?NElHRTlmdkFacGNKTmdhVjFnNitlVzBWYWNBd0c3MHE4R2hnTWlxeG5TMlhi?=
 =?utf-8?B?VHhtTnZRVEw2T0NTOXlSTGVabVBsMHJ3Vnh2WUcyNUIycWZxQmc1VnNDQlpU?=
 =?utf-8?B?djF5VXltSERaYmJSVkVIOUtMOW9Qd1B3Tk9pL2JCcVBUNERtY2IxNmd3ZHk4?=
 =?utf-8?B?STZCREUrSnZicHFCSUV0ZEVyWkFyM0psTURXNmRQQ3Fsak5jUDV5UU9zZEN1?=
 =?utf-8?B?M3NseHVuQ2d6TDEzOWU5cFhjdjZ4WlR1VCtFS3ZUT3F4QXpkaEllbGtNa2Nt?=
 =?utf-8?B?WkE3TWxma1JKZmdhaUZGVkVpNVhhVUxPVXAvNlNIRUl2Q3MzNjQvbXNaUEo3?=
 =?utf-8?B?ZGZhMS9hYWVmREplaUl2NXcvOVZOVUxZNy9VelJtMDhKREtQNGw3bDM0eGdz?=
 =?utf-8?B?YkNsTTY2SEVtZ3NFQmRoak0vaTlqMGRVMk9TUncrRjVucEo2YW82V3ZjSnkv?=
 =?utf-8?B?ck0ydnhYczJRdlZialJQVHNmZWJKMURSK2M2MmdFQUtqOWxLMUZ5VnQvSlho?=
 =?utf-8?B?ZXJyclo5YzU1ZDBKNDMxK3drNjE1MFkyWTJQVmI1czdOWWE2UXVyMXljL1BD?=
 =?utf-8?B?WUZGaC9zaTVHQlNRcVBaT3VoTCtTUWl3V2ZqNm1HOExVWXB2TGh4MTQ0bitP?=
 =?utf-8?B?SWYwb1M3K1VtTkgyVld0aDVhcXFGaElXUG1QREw5SSs5Rmdxby84VGo4a0Ri?=
 =?utf-8?B?bjNiS3pYMFBvQS9lclZCTFRtcWY2RlJZZVJlNDBUUFJpdWx4SU9qUmlQb2Qy?=
 =?utf-8?B?dmZodUc5a1pTVWw3bzlYWXprYXlvWlRFVURZMFZhbk5RTmdPTG02YjNDWWli?=
 =?utf-8?B?ZXBlMHdCOVlDUzNHUm5CTHhrb1cwT1FRYlpJVXR4WTVYUnJkTlQyK2NHMGx3?=
 =?utf-8?Q?qxNmxJbAv8lcQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:35:00.5717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5007a93b-7ff4-4aef-6e36-08dc640f8576
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6931

Hi all,

This is the remaining series for the full functional "dynamic node
programming using overlay dtbo" feature. The first part [1] has
already been merged.

Quoting from the original series, the first part has already made
Xen aware of new device tree node which means updating the dt_host
with overlay node information, and in this series, the goal is to
map IRQ and IOMMU during runtime, where we will do the actual IOMMU
and IRQ mapping to a running domain and will call unmap_mmio_regions()
to remove the mapping.

Also, documentation of the "dynamic node programming using overlay dtbo"
feature is added.

Patch 1 is a fix of [1] which is noticed during my local test, details
please see the commit message.

Gitlab CI for this series can be found in [2].

[1] https://lore.kernel.org/xen-devel/20230906011631.30310-1-vikram.garhwal@amd.com/
[2] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1265297506

Henry Wang (1):
  xen/commom/dt-overlay: Fix missing lock when remove the device

Vikram Garhwal (14):
  xen/arm/gic: Enable interrupt assignment to running VM
  xen/arm: Always enable IOMMU
  tools/libs/light: Always enable IOMMU
  tools/libs/light: Increase nr_spi to 160
  rangeset: Move struct range and struct rangeset to headerfile
  xen/overlay: Enable device tree overlay assignment to running domains
  tools: Add domain_id and expert mode for overlay operations
  tools/libs/light: Modify dtbo to domU linux dtbo format
  tools/xl: Share overlay with domU
  tools/helpers: Add get_overlay
  get_overlay: remove domU overlay
  xl/overlay: add remove operation to xenstore
  add a domU script to fetch overlays and applying them to linux
  docs: add device tree overlay documentation

 docs/misc/arm/overlay.txt           | 172 +++++++++
 tools/helpers/Makefile              |   8 +
 tools/helpers/get_overlay.c         | 507 ++++++++++++++++++++++++++
 tools/helpers/get_overlay.sh        |  81 +++++
 tools/include/libxl.h               |   8 +-
 tools/include/xenctrl.h             |   5 +-
 tools/libs/ctrl/xc_dt_overlay.c     |   7 +-
 tools/libs/light/libxl_arm.c        |   9 +-
 tools/libs/light/libxl_dt_overlay.c |  90 ++++-
 tools/xl/Makefile                   |   2 +-
 tools/xl/xl_cmdtable.c              |   2 +-
 tools/xl/xl_vmcontrol.c             | 539 +++++++++++++++++++++++++++-
 xen/arch/arm/device.c               |   8 +-
 xen/arch/arm/dom0less-build.c       |   3 +-
 xen/arch/arm/domain_build.c         |   2 +-
 xen/arch/arm/gic.c                  |   4 +
 xen/arch/arm/include/asm/setup.h    |   3 +-
 xen/common/dt-overlay.c             | 223 ++++++++++--
 xen/common/rangeset.c               |  31 +-
 xen/include/public/sysctl.h         |   4 +-
 xen/include/xen/rangeset.h          |  32 +-
 21 files changed, 1654 insertions(+), 86 deletions(-)
 create mode 100644 docs/misc/arm/overlay.txt
 create mode 100644 tools/helpers/get_overlay.c
 create mode 100755 tools/helpers/get_overlay.sh

-- 
2.34.1


