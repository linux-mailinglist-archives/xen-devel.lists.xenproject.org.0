Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749108CA76D
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726497.1130784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HES-0006kp-O5; Tue, 21 May 2024 04:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726497.1130784; Tue, 21 May 2024 04:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HES-0006i9-Kn; Tue, 21 May 2024 04:36:12 +0000
Received: by outflank-mailman (input) for mailman id 726497;
 Tue, 21 May 2024 04:36:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HER-0006eS-MK
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:11 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b8813a-172b-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 06:36:05 +0200 (CEST)
Received: from SA1PR03CA0024.namprd03.prod.outlook.com (2603:10b6:806:2d3::25)
 by SA3PR12MB9131.namprd12.prod.outlook.com (2603:10b6:806:395::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 04:36:01 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:2d3:cafe::1) by SA1PR03CA0024.outlook.office365.com
 (2603:10b6:806:2d3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 04:36:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:00 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:35:58 -0500
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
X-Inumbo-ID: a1b8813a-172b-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Myx5ijFldV5n+x68EZsN/wlpKmjooLyCxovle+spapZz0vh8DS5+ZmLNweZBgKz7NilMXVmTHJmhS1qOE3wjU/kLKkNSNybBqfupDgi5jQYJByeXHSa1WWRaqsh1y9XMDQEbKk4oOqGOLvjxwGibN+lPsc6AAPy+33KA1J2h7RqvHfILyUQbHj6SR5zpxhehNcueCqj2nIShJOPzN+D6GB3eMbv2sq4hOP21ghzkOhUqq4YaeNBQRPVvuGLiUW8RsVW06K/VuFLq3YCB6xxDhJxXCzO6ZVo84x5cW4MsUA++mHEkQRuPP7DsENNkX3hdY0ZxhlLhUIulZ8a+8cvMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIYn95b97cEL4fKyfXhO9HNIpzTSdg19jXxuBX8v++o=;
 b=fqbX2mLlchUdVFwqEc44At9yVDyBa/4BnCV/QZ/anGOPhfeLJC2A4r+2P/zZDSrdZcXkfPDTMJp57UAFyvwvhikAbKADmXhf8K2UlTwnxw7EbLB5xkFkk0fr8RLUybhco+ui36lm4KOfCx4D8PkegoB9dFv0ieHeRrVnXoDLomXcbrzh5Z222L/pCt+RvWgKth82lyYHkun1ja8m0fi+fN3g4CRcqkjqcoffYzuqTJZlTSOFfgnlMjNWP1J5fNbEsyfKVrrdGlGxLBzxanGnCaeI3JeL7BfK+XTZwnpvxg4NO30Jn50pp1DyvJl3Feh31yxyKMoPqMBw0FqapNL/DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIYn95b97cEL4fKyfXhO9HNIpzTSdg19jXxuBX8v++o=;
 b=juT00ZDuRl4w9BbPPBU4fSnx7VnUAo03E4qgBBQDI5H3sqHiy6UNQK89qrxaL2m0fEr9/zV+NFkNActSZY9oDJn99sunz4vc/1hIkbX3VzLKtWS6cjnLsH7Ft30xMM7VhfnzlWMiuBQ//ZL3X1WASw/HMyNRJYPRb+pVLHT8Few=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony@xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH v3 0/8] Remaining patches for dynamic node programming using overlay dtbo
Date: Tue, 21 May 2024 12:35:49 +0800
Message-ID: <20240521043557.1580753-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|SA3PR12MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e6fc97-21fb-4db0-a85b-08dc794f8483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BIpanMFS4WIWKlK6B1hQhbYBGqw+kLn1eWt8KNATmXK5dwlgvrVwX4Pq1ovs?=
 =?us-ascii?Q?BXN5Vkuka6vrXA3lGjEg9PKuTwKRQlz2fCRY1zqlbX+rYABqJieLIqtv4oBA?=
 =?us-ascii?Q?9/0rY1H934XJptuYCEvh3L38KYWdEAD/807LsuQQfNoT1rpKPJew8uK+CXgx?=
 =?us-ascii?Q?81IYjhViEB/2A5CzUIyk3k0/kARo5e7Xry4b1tUZf686hs7CcunQ91guC0EY?=
 =?us-ascii?Q?SerhZKAlstvIYDXUW5Tx8jv4O3nbJxHE3q+Thk32sQ452FbHNsVstcqIosrR?=
 =?us-ascii?Q?GdAqVjNIWb1rnbsbZvvyB875SMI4rltZrJ6jPy0LgcVGdyeVV9aSVmq/hqHS?=
 =?us-ascii?Q?aAze7XkCA1KwfwsrV5ys5JGhHqJPWB2KfGTPYc7BL9Fm6tkW3yzXwf6m9JcU?=
 =?us-ascii?Q?NjR2MIGl2TvExYqpsnAVnRXIlqXSuYkjADD23ZUFAks5EA0BbaN+4uR898ZB?=
 =?us-ascii?Q?NZw5AZDOE0ylfOj+aCOl13w4OsEJwo2Z/coWoPT4kbHQ90x6Iz5PIf6aI/T7?=
 =?us-ascii?Q?MQRSTGtskk6QLxVNMV2zdCpWar5IxAenodtQ4V4X2fwUHhe4QbQ3BLrtce5w?=
 =?us-ascii?Q?nDF3xAdU+2iL/8Bcd0wCwVtC5fIVFdfCNEbqGenkS0Pbml2C1NLxdQ4Pwfn9?=
 =?us-ascii?Q?pt/6K8GaBmgkkd2CAWjfGF3/6WXyrv7dPyA92a7lvS3sYJZDhJU1UfUw3DLz?=
 =?us-ascii?Q?9tK0aCxQYsgXWzU7Bvb1uBcnn60AVF8TU201p6/RoACEs2Z0/e9om7L7Q1y5?=
 =?us-ascii?Q?GaokhNbEz78i99tCH7ozfEJnBn/oe12few+4MG75WceRejcsd+n2/2jAwXBV?=
 =?us-ascii?Q?thSDVDXlPyMFcNSJA696u1qDps+mckQm3LETNP1yY/cP6F6/G62cYMuN9GIv?=
 =?us-ascii?Q?ES0OhGxkQGcHI6Cgt1UihT1PJNnW0G/UXi9NLiO6Jl3UjC7WoCrMPyNycE9W?=
 =?us-ascii?Q?scSQqyyzy09JrwxVE5uHiyYMQhhl9GOFaraREF2BMk6Yu1T9giVHWN0ypeU1?=
 =?us-ascii?Q?2ANBG7i7wmOIaDy4dHKCsJO1wYxdfYk6XbpDsN+Tv6O3mvcySBoYAq+fY7qB?=
 =?us-ascii?Q?DOp+tYNrrkA8nDgc8WMXfLEe6bhoBeEAC2y7mZJMG8fBr0nRy5TVTHG8Ul9I?=
 =?us-ascii?Q?l0lZqkSDcwIiBsVKjbeMovwiDc0aSmVL9HyRSErLoSz3swuxwIAoW+DLnzrl?=
 =?us-ascii?Q?rSzj88qourp857L3Fyymlq19jhRrPsvjzi9ro5yqc6BvSjR/rgPGaALMHCQc?=
 =?us-ascii?Q?y7NFjW17SuN2lcBdOGwQ2S3ETjxGhib7WOmiFYlJ+0x+ZX2mcv37KpCD6vpZ?=
 =?us-ascii?Q?EnZYA+iv920C5T+2j3iUItIQm3F7FFRSP4XSFXSkucg/2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:01.1740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e6fc97-21fb-4db0-a85b-08dc794f8483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9131

Hi all,

This is the remaining series for the full functional "dynamic node
programming using overlay dtbo" feature. The first part [1] has
already been merged.

Quoting from the original series, the first part has already made
Xen aware of new device tree node which means updating the dt_host
with overlay node information, and in this series, the goal is to
map IRQ and IOMMU during runtime, where we will do the actual IOMMU
and IRQ mapping and unmapping to a running domain. Also, documentation
of the "dynamic node programming using overlay dtbo" feature is added.

Patch 1 and 2 are fixes of the existing code which is noticed during
my local tests, details please see the commit message.

Gitlab CI for this series can be found in [2].

[1] https://lore.kernel.org/xen-devel/20230906011631.30310-1-vikram.garhwal@amd.com/
[2] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1298425517

Henry Wang (6):
  xen/common/dt-overlay: Fix lock issue when add/remove the device
  tools/xl: Correct the help information and exit code of the dt-overlay
    command
  xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
  tools/arm: Introduce the "nr_spis" xl config entry
  xen/arm: Add XEN_DOMCTL_dt_overlay DOMCTL and related operations
  tools: Introduce the "xl dt-overlay {attach,detach}" commands

Vikram Garhwal (2):
  xen/arm/gic: Allow routing/removing interrupt to running VMs
  docs: Add device tree overlay documentation

 docs/man/xl.cfg.5.pod.in              |  14 +
 docs/misc/arm/device-tree/booting.txt |  16 +
 docs/misc/arm/overlay.txt             |  99 ++++++
 tools/golang/xenlight/helpers.gen.go  |   2 +
 tools/golang/xenlight/types.gen.go    |   1 +
 tools/include/libxl.h                 |  10 +
 tools/include/xenctrl.h               |   3 +
 tools/libs/ctrl/xc_dt_overlay.c       |  31 ++
 tools/libs/light/libxl_arm.c          |   4 +-
 tools/libs/light/libxl_dt_overlay.c   |  28 ++
 tools/libs/light/libxl_types.idl      |   1 +
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_parse.c                   |   3 +
 tools/xl/xl_vmcontrol.c               |  48 ++-
 xen/arch/arm/dom0less-build.c         |  11 +-
 xen/arch/arm/domctl.c                 |   3 +
 xen/arch/arm/gic-vgic.c               |  15 +-
 xen/arch/arm/gic.c                    |  15 -
 xen/arch/arm/vgic/vgic.c              |  10 +-
 xen/common/dt-overlay.c               | 441 ++++++++++++++++++++------
 xen/include/public/domctl.h           |  15 +
 xen/include/public/sysctl.h           |  11 +-
 xen/include/xen/dt-overlay.h          |   7 +
 23 files changed, 644 insertions(+), 148 deletions(-)
 create mode 100644 docs/misc/arm/overlay.txt

-- 
2.34.1


