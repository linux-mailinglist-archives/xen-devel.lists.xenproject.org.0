Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN2AA94Thmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4B10021D
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223509.1530956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVA-0005Xo-6p; Fri, 06 Feb 2026 16:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223509.1530956; Fri, 06 Feb 2026 16:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVA-0005WC-3E; Fri, 06 Feb 2026 16:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1223509;
 Fri, 06 Feb 2026 16:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOV8-0005HU-73
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:10 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23c5772d-0377-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:16:07 +0100 (CET)
Received: from SA9P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::26)
 by DM6PR12MB4339.namprd12.prod.outlook.com (2603:10b6:5:2af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Fri, 6 Feb
 2026 16:15:58 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::4a) by SA9P221CA0021.outlook.office365.com
 (2603:10b6:806:25::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 16:15:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:15:57 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:15:56 -0600
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
X-Inumbo-ID: 23c5772d-0377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdO+RBaOHDwpix9ndmcsSIcUbq9dc+eYpi/JH+OcNStx4WQ/GhH4ArtK/lM+RTWDkGnzoFER6tJQdSyDk/xqeJd5jzYGjV4FlRzObmjzwcMq4Qrw1LArsWmjjcV3CnNMMRtyFPkIzWah+87MnFPntSi7ScgxTasF6gZXqbnZEC2Xd59ewRAxKUYjLOeCYb7cloDYr5hHHDiGQ2zj5bOT3iRcyLUHmGNIPirFBSUFlavC8I4Wx69EyPV+OsMdOm3vjAj3atK499abflIAII4RtgD3qe2t1GdEQHzCBHrrlUIP/zeQo2B0HtRnbgh2QYhwq7ghTG9feENRGPDtkHUhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXIQxMzOsLkcntds5WVXwjfHLjwU4sR3iGU5UhK9k7Q=;
 b=gTA4LuLwS18IqD5nUjLZKUrJgQlhqMT4Z67962KBwD8SvYE2Bxqn+OFxdoDphJKJAnpmWD0iERVQVu0lpdOjEzcq7ROU3m97xbNh8ooJI3t/Y2IBGXnaPxOJcSrX8lonSV8zGs6s78uZGXO1+1rZ7PTmcRN/dIj8prozhrGKVN3ONUUi8Sgh/whol/NZFO2AN8lgGVIH9U028jHp9gwULijNndme0Dmqng1qx3STSKf6ZfYp4g4BsZmrcf6ACxDOnvXwWVNP6NvL0xX3Hy4J7ZmpExvfgbO1nAlvJvJ2j/dQn7W6TQEZiNF+CFd2PkBzCnWwCMhb0mUitdN/At7krQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXIQxMzOsLkcntds5WVXwjfHLjwU4sR3iGU5UhK9k7Q=;
 b=YmVeFfKRZaizwwo6C8//gaVdL+5mxTViD43SL/s5Vh6UTZmVn17fSL5NXx9O+HY748FiVYBBNQVHxivzvoKyawr9QaOBCpb54fXfQ2HnlQ9GzAweAac95qI5QFY7Gc8N9KRBd/J8Qm8/41LMeAoH5WqY3UE+j4XEBBvKpgSF86M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH 00/12] const-ify vendor checks
Date: Fri, 6 Feb 2026 17:15:22 +0100
Message-ID: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DM6PR12MB4339:EE_
X-MS-Office365-Filtering-Correlation-Id: 44900149-0c10-4207-2c21-08de659b031f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mpmiKR4S748JUR1dMnVXaxrKfL1xTE/B0HT9VLtRLZz8nEvhyQ1/3AXv24B7?=
 =?us-ascii?Q?+M3r3hojdrNnnWKNXoXuUmkEnzWQbotrgpavMVNP4OU7Rkbbspybl004bDnQ?=
 =?us-ascii?Q?WuS6Y0zIQCqOopPK8nLCv9MsthYtbocUqEqAO0Ge7qmAndfV8Enmno4eUXDe?=
 =?us-ascii?Q?iXPVWiK+6QZ96C/CAPqvksJYx6en7KnFMPIfmrKuyDADxYqS+SHEVsCH3utH?=
 =?us-ascii?Q?1z6NqozGlCnYOi+o7LJqSCCYEF3ELL9Fb9FlofQxhqhkeQziH6Fi79vq72fD?=
 =?us-ascii?Q?yR6D0xeEDRYyCr0OqipRHjxt99xOSwGCyxD+lHk6FCeUfEPydJjwRyzHss69?=
 =?us-ascii?Q?p1JDMqUUVTF2qxPEcdcalHRTSOtdXKiz3AhRl1aXD4qkqfz2kPUTbDU3AwbO?=
 =?us-ascii?Q?c5kqfvPAfE9IZ0bXGaLjJtn+FlAzKURIILztbgxmbVarj5yYHlJdN+Y4SQvW?=
 =?us-ascii?Q?lxgJFvU34Ut1uNGHxrDw4aFYmMEQdoGbCUFV2ArbCd+4PMWrtydj4ViyLuAG?=
 =?us-ascii?Q?bNfd7VnWcPiLck+q9UNJ+j0gHPXChJY7qz1rtHzVQltaBnUrrpmcPCsHNuZk?=
 =?us-ascii?Q?txwSH1bHQCzKNl+bEebvN/ME4C58AXjXm+Uadsle03IXYNCHx4jfcQIUawbE?=
 =?us-ascii?Q?1AelDomMNwJ6O71tqkOCAPWHtJmTjBjDjb7SlrVF2TVnT6sw0DeOsxCxsaEB?=
 =?us-ascii?Q?KmE51uUGpkNFlHqUGMJAl7E7dHVtZ6Rb0xU+1ZwiMEXR5n5FFUVJyrXruAqw?=
 =?us-ascii?Q?dZVe0LQHu+46CP/etNnIvlHLjoGb0niC1N7gJvRtXYAcV+d6isGf3jjNGGP4?=
 =?us-ascii?Q?39VbzSJFX1Z6M6grHo0ZGFpGkcsdduIq5a/qFsGPkh7mIyRWeBLAbbNt45r7?=
 =?us-ascii?Q?zbzlNiQqJX5wO99bQ1dra0yxms4Qi8N2LCYD8qJz2ZkBwmzXWtDhDahY+lfH?=
 =?us-ascii?Q?n5I0ITD0NNCXEqQ1OA5l6GmdBevxV6uloR7dsH6AB1VEH0c/v1lbhkxqF9DY?=
 =?us-ascii?Q?26sAK6aJRoSE6jMI1Srpteo8Bt/a1MAOG71YIOnp4TxmU8XeWTXYy0mJ8ENT?=
 =?us-ascii?Q?l64I849PInWpyHgeqFwUMU5Fmrjx3w5uCW9P+X7W1cWTfhzb96yr+A07MIkP?=
 =?us-ascii?Q?xcmtjuDIZe2V7KBlUbWek97picOhzISNFuLuALKYtS9GVi0jLXBYOLfaEoJR?=
 =?us-ascii?Q?ZeAK04e94IsLjCUsXiyqWJTLiqa5KYj738PSQ8U7PRMdUW4oGZvb/nBENPRn?=
 =?us-ascii?Q?rpKE+4uQkiA8TCvmZXgqPKJ7FPtCGUspxg5waF10WeSCcIVVsCkO1PtZXXvy?=
 =?us-ascii?Q?trRGaFlrEkOHAHVTSlNeBzf1O6w2CIG/XjCTfI9Slx52ggwaP5mM39Y7woJw?=
 =?us-ascii?Q?7qiThfkavy+JHmgNbNiP6R+fe0tVeMY1nR/XQcFrJy8DWJY3fFTO3u4jWfp2?=
 =?us-ascii?Q?9Pb5LIGBa8oANizLUzAdMCQoEJLOIXcsecN6LMfOXMveuotpOsvFdK56f9ZC?=
 =?us-ascii?Q?R/+fp8R/Aatb1DrJUQIRLy1smWLirSlzC3YrDHkBA48wDrFR9K+QVBgRkky8?=
 =?us-ascii?Q?SxNIOAEZcZEj6J9T+uZTcgbCfHWd5Bmy/MywjQ2bsb5OFyYmDdtMhHKRSuSE?=
 =?us-ascii?Q?M8zoIfR3QVIU60f5dOpiPtR2FIB3xIpk959Jr7MXz2XDUhO2kOMJZGAW8BE+?=
 =?us-ascii?Q?ftdtCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/o6CVO9Zbcy5WFlq3iZz948GbFOPS0Ys2Ko8kSrBLki2C4BHdwUfU2pT0p98rJVxYvvL1Q6ZvZ7R9QpErhT8qoyHlY1g5IBtOo40cYlwI0cArW62XveqKaOp4cHhFAxDkxgnQml8CfS3b/lJdhDm/YLjs+Z+Rqv9Q+LfxID3xjt0zAqAVdxCREFtpGw5M8dVpX25RO5jLysFL07on0FSJwW6iCxwSltsY++H8/6dqLZdylt5ZWnXcanGzVKWTCvjQtIzV09pKINW+xncJZNLbPeTUNOocUokxHFiPPc+CsW3KgD4XRtADPb93gEvEXTbrvMVKT83x05S8VkBqE6Q79He4lFrSZJ52nw3lF+s9HiSThXa1sqcoiXpo9uKi4TpT5sX1grGF/CYsRnX7nKzDLPUMLoIAgZVEmtdyO7DV8Mz2fqoh18w19X9HKkMGi48
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:15:57.9248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44900149-0c10-4207-2c21-08de659b031f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4339
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4AD4B10021D
X-Rspamd-Action: no action

Hi,

This series is a big revamp of vendor-checking to enable it to perform DCE.
It improves all configurations useful in practice at minimal cost in the full
build, and at a massive advantage for the single-vendor case. Many ifdefs can
go away as a side effect of the series.

This series depends on cross-vendor removal:
  https://lore.kernel.org/xen-devel/20260205170923.38425-1-alejandro.garciavallejo@amd.com/T/#m4c3d318f37e4f24d0f8c62b104221aa5d428cebc

Patch 1 in this series matches that of cross-vendor removal. It's logically
required, but that's the single requirement.

High level description
======================

When compared to the RFC this makes a different approach The series introduces
cpu_vendor() which maps to a constant in the single vendor case and to
(boot_cpu_data.vendor & X86_ENABLED_VENDORS), where X86_ENABLED_VENDORS is a
mask of the compile-time chosen vendors. This enables the compiler to detect
dead-code at the uses and remove all unreachable branches, including in
switches.

When compared to the x86_vendor_is() macro introduced in the RFC, this is
simpler. It achieves MOST of what the older macro did without touching the
switches, with a few caveats:

  1. Compiled-out vendors cause a panic, they don't fallback onto the unknown
     vendor case. In retrospect, this is a much saner thing to do.
  2. equalities and inequalities have been replaced by equivalent (cpu_vendor() & ...)
     forms. This isn't stylistic preference. This form allows the compiler
     to merge the compared-against constant with X86_ENABLED_VENDORS, yielding
     much better codegen throughout the tree.

The effect of (2) triples the delta in the full build below.

Some differences might be attributable to the change from policy vendor checks
to boot_cpu_data. In the case of the emulator it caused a 400 bytes increase
due to the way it checks using LOTS of macro invocations, so I left that one
piece using the policy vendor except for the single vendor case.

And finally, some bloat-o-meters to better grasp the effects

  1. AMD + wo/ unknown (compared against prior AMD-only build)
    add/remove: 0/12 grow/shrink: 4/66 up/down: 108/-11595 (-11487)

  2. AMD + Intel + wo/ unknown (compared against prior full build)
    (excludes Hygon, Shanghai, Centaur and any other unknown CPU vendors)
    add/remove: 1/6 grow/shrink: 27/31 up/down: 356/-1552 (-1196)

  3. All vendors + w/ unknown (compared against prior full build)
    add/remove: 0/0 grow/shrink: 33/19 up/down: 398/-273 (125)

1. AMD + wo/ unknown (compared against prior AMD-only build)
============================================================

add/remove: 0/12 grow/shrink: 4/66 up/down: 108/-11595 (-11487)
Function                                     old     new   delta
x86_cpu_policies_are_compatible              157     194     +37
xen_config_data                             1476    1509     +33
amd_check_entrysign                          807     827     +20
init_guest_cpu_policies                     1364    1382     +18
opt_gds_mit                                    1       -      -1
nmi_p6_event_width                             4       -      -4
nmi_p4_cccr_val                                4       -      -4
init_e820                                   1037    1033      -4
x86_mcinfo_dump                              477     471      -6
pci_cfg_ok                                   307     301      -6
get_hw_residencies                           213     205      -8
recalculate_cpuid_policy                     909     900      -9
dom0_setup_permissions                      3809    3800      -9
arch_ioreq_server_get_type_addr              250     241      -9
cpu_has_amd_erratum                          230     219     -11
init_amd                                    2449    2437     -12
parse_spec_ctrl                             2321    2307     -14
amd_nonfatal_mcheck_init                     192     177     -15
shanghai_cpu_dev                              16       -     -16
hygon_cpu_dev                                 16       -     -16
centaur_cpu_dev                               16       -     -16
x86emul_0fae                                2758    2741     -17
vmce_init_vcpu                               153     136     -17
pge_init                                      60      42     -18
cpufreq_cpu_init                              34      15     -19
nmi_watchdog_tick                            534     514     -20
vmce_restore_vcpu                            160     139     -21
init_nonfatal_mce_checker                    142     120     -22
ucode_update_hcall_cont                      888     865     -23
vpmu_arch_initialise                         195     168     -27
mce_firstbank                                 37      10     -27
init_shanghai                                 29       -     -29
validate_gl4e                                617     587     -30
l4e_propagate_from_guest                     451     421     -30
guest_walk_tables_4_levels                  3411    3381     -30
clear_msr_range                               30       -     -30
acpi_dead_idle                               430     398     -32
print_mtrr_state                             719     684     -35
amd_mcheck_init                              451     416     -35
hvm_vcpu_virtual_to_linear                   631     595     -36
do_IRQ                                      1783    1747     -36
init_bsp_APIC                                193     149     -44
symbols_offsets                            30800   30752     -48
cpu_callback                                4650    4600     -50
mc_memerr_dhandler                           903     851     -52
vpmu_init                                    309     248     -61
mcheck_init                                 1187    1122     -65
microcode_nmi_callback                       205     139     -66
init_IRQ                                     477     407     -70
disable_lapic_nmi_watchdog                   119      49     -70
__start_xen                                 9448    9378     -70
alternative_instructions                     154      82     -72
traps_init                                   543     468     -75
protmode_load_seg                           1904    1829     -75
set_cx_pminfo                               1691    1614     -77
init_intel_cacheinfo                        1191    1111     -80
is_cpu_primary                                93       -     -93
symbols_sorted_offsets                     60760   60664     -96
do_mca                                      3181    3085     -96
guest_cpuid                                 2395    2292    -103
guest_common_max_feature_adjustments         110       -    -110
read_msr                                    1471    1346    -125
x86emul_decode                             12729   12597    -132
guest_common_default_feature_adjustments     232      62    -170
do_microcode_update                          793     608    -185
cpufreq_driver_init                          453     263    -190
vmce_wrmsr                                   967     768    -199
symbols_names                             108114  107914    -200
recalculate_misc                             898     689    -209
vmce_rdmsr                                  1083     872    -211
early_cpu_init                               948     721    -227
guest_wrmsr                                 2853    2622    -231
init_centaur                                 238       -    -238
domain_cpu_policy_changed                    677     408    -269
write_msr                                   1752    1455    -297
x86_emulate                               222203  221896    -307
init_hygon                                   402       -    -402
guest_rdmsr                                 2308    1881    -427
start_vmx                                   1607    1105    -502
setup_apic_nmi_watchdog                      977     276    -701
do_get_hw_residencies                       1289       9   -1280
init_speculation_mitigations                9714    6788   -2926
Total: Before=3878514, After=3867027, chg -0.30%

2. AMD + Intel + wo/ unknown (compared against prior full build)
================================================================

add/remove: 1/6 grow/shrink: 27/31 up/down: 356/-1552 (-1196)
Function                                     old     new   delta
start_vmx                                   1607    1686     +79
vcpu_info_reset                                -      38     +38
xen_config_data                             1483    1520     +37
x86_cpu_policies_are_compatible              157     194     +37
amd_check_entrysign                          807     838     +31
init_speculation_mitigations                9836    9862     +26
set_cx_pminfo                               1691    1709     +18
read_msr                                    1471    1486     +15
guest_cpuid                                 2395    2405     +10
vmce_restore_vcpu                            160     167      +7
recalculate_cpuid_policy                     909     916      +7
vmce_init_vcpu                               153     159      +6
do_mc_get_cpu_info                           584     590      +6
init_e820                                   1037    1042      +5
x86_mcinfo_dump                              477     480      +3
setup_apic_nmi_watchdog                      977     980      +3
guest_common_max_feature_adjustments         110     113      +3
guest_common_default_feature_adjustments     257     260      +3
disable_lapic_nmi_watchdog                   119     122      +3
cpu_has_amd_erratum                          230     233      +3
amd_nonfatal_mcheck_init                     192     195      +3
alternative_instructions                     154     157      +3
pge_init                                      60      62      +2
mce_firstbank                                 37      39      +2
init_bsp_APIC                                193     195      +2
do_get_hw_residencies                       1289    1291      +2
mcheck_init                                 1227    1228      +1
intel_mcheck_init                           2398    2399      +1
pci_cfg_ok                                   307     306      -1
init_nonfatal_mce_checker                    160     159      -1
mc_memerr_dhandler                           903     901      -2
recalculate_misc                             898     890      -8
acpi_cpufreq_cpu_init                        823     815      -8
cpufreq_driver_init                          468     459      -9
vmce_intel_rdmsr                             161     150     -11
validate_gl4e                                617     605     -12
guest_walk_tables_4_levels                  3411    3399     -12
traps_init                                   543     528     -15
l4e_propagate_from_guest                     451     436     -15
shanghai_cpu_dev                              16       -     -16
hygon_cpu_dev                                 16       -     -16
centaur_cpu_dev                               16       -     -16
write_msr                                   1752    1735     -17
cpu_callback                                5100    5080     -20
amd_mcheck_init                              451     431     -20
hvm_vcpu_virtual_to_linear                   631     610     -21
domain_cpu_policy_changed                    677     656     -21
vpmu_arch_initialise                         195     173     -22
acpi_dead_idle                               430     407     -23
symbols_offsets                            31800   31776     -24
print_mtrr_state                             719     693     -26
guest_rdmsr                                 2308    2282     -26
do_mca                                      3181    3153     -28
vpmu_init                                    320     291     -29
vcpu_create                                  864     835     -29
unmap_guest_area                             198     169     -29
init_shanghai                                 29       -     -29
symbols_sorted_offsets                     62760   62720     -40
vmce_wrmsr                                   993     936     -57
vmce_rdmsr                                  1134    1073     -61
symbols_names                             112215  112141     -74
init_intel_cacheinfo                        1191    1111     -80
early_cpu_init                               948     854     -94
init_centaur                                 238       -    -238
init_hygon                                   402       -    -402
Total: Before=3932243, After=3931047, chg -0.03%

3. All vendors + w/ unknown (compared against prior full build)
===============================================================

add/remove: 0/0 grow/shrink: 33/19 up/down: 398/-273 (125)
Function                                     old     new   delta
start_vmx                                   1607    1686     +79
early_cpu_init                               948     986     +38
x86_cpu_policies_are_compatible              157     194     +37
xen_config_data                             1483    1515     +32
amd_check_entrysign                          807     838     +31
init_speculation_mitigations                9836    9862     +26
set_cx_pminfo                               1691    1709     +18
read_msr                                    1471    1486     +15
vmce_wrmsr                                   993    1005     +12
init_nonfatal_mce_checker                    160     170     +10
guest_cpuid                                 2395    2405     +10
mcheck_init                                 1227    1235      +8
vmce_restore_vcpu                            160     167      +7
recalculate_cpuid_policy                     909     916      +7
vmce_init_vcpu                               153     159      +6
init_intel_cacheinfo                        1191    1197      +6
do_mc_get_cpu_info                           584     590      +6
cpufreq_driver_init                          468     474      +6
init_e820                                   1037    1042      +5
amd_mcheck_init                              451     456      +5
x86_mcinfo_dump                              477     480      +3
setup_apic_nmi_watchdog                      977     980      +3
guest_common_max_feature_adjustments         110     113      +3
guest_common_default_feature_adjustments     257     260      +3
disable_lapic_nmi_watchdog                   119     122      +3
cpu_has_amd_erratum                          230     233      +3
cpu_callback                                5100    5103      +3
amd_nonfatal_mcheck_init                     192     195      +3
alternative_instructions                     154     157      +3
mce_firstbank                                 37      39      +2
init_bsp_APIC                                193     195      +2
do_get_hw_residencies                       1289    1291      +2
intel_mcheck_init                           2398    2399      +1
recalculate_misc                             898     897      -1
pci_cfg_ok                                   307     306      -1
mc_memerr_dhandler                           903     901      -2
vmce_rdmsr                                  1134    1127      -7
traps_init                                   543     535      -8
acpi_cpufreq_cpu_init                        823     815      -8
vmce_intel_rdmsr                             161     150     -11
validate_gl4e                                617     605     -12
guest_walk_tables_4_levels                  3411    3399     -12
l4e_propagate_from_guest                     451     437     -14
write_msr                                   1752    1735     -17
vpmu_init                                    320     302     -18
print_mtrr_state                             719     698     -21
hvm_vcpu_virtual_to_linear                   631     610     -21
domain_cpu_policy_changed                    677     656     -21
vpmu_arch_initialise                         195     173     -22
acpi_dead_idle                               430     407     -23
guest_rdmsr                                 2308    2282     -26
do_mca                                      3181    3153     -28
Total: Before=3932245, After=3932370, chg +0.00%

Alejandro Vallejo (12):
  x86: Reject CPU policies with vendors other than the host's
  x86: Add more granularity to the vendors in Kconfig
  x86: Add cpu_vendor() as a wrapper for the host's CPU vendor
  x86: Migrate MSR handler vendor checks to cpu_vendor()
  x86: Migrate spec_ctrl vendor checks to cpu_vendor()
  x86: Migrate switch vendor checks to cpu_vendor()
  x86: Have x86_emulate/ implement the single-vendor optimisation
  x86/acpi: Migrate vendor checks to cpu_vendor()
  x86/pv: Migrate vendor checks to cpu_vendor()
  x86/mcheck: Migrate vendor checks to use cpu_vendor()
  x86/cpu: Migrate vendor checks to use cpu_vendor()
  x86: Migrate every remaining raw vendor check to cpu_vendor()

 xen/arch/x86/Kconfig.cpu               | 43 ++++++++++++++++++++++++++
 xen/arch/x86/acpi/cpu_idle.c           | 16 +++++-----
 xen/arch/x86/acpi/cpufreq/acpi.c       |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c    | 15 +++------
 xen/arch/x86/alternative.c             |  2 +-
 xen/arch/x86/apic.c                    |  2 +-
 xen/arch/x86/cpu-policy.c              | 14 ++++-----
 xen/arch/x86/cpu/Makefile              |  6 ++--
 xen/arch/x86/cpu/amd.c                 |  6 ++--
 xen/arch/x86/cpu/common.c              |  8 +++--
 xen/arch/x86/cpu/intel_cacheinfo.c     |  5 ++-
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c          | 23 ++++++--------
 xen/arch/x86/cpu/mcheck/mce.h          |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c      |  7 ++---
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  7 ++---
 xen/arch/x86/cpu/mcheck/non-fatal.c    |  6 +---
 xen/arch/x86/cpu/mcheck/vmce.c         | 16 +++-------
 xen/arch/x86/cpu/microcode/amd.c       |  2 +-
 xen/arch/x86/cpu/microcode/core.c      |  2 +-
 xen/arch/x86/cpu/mtrr/generic.c        |  5 ++-
 xen/arch/x86/cpu/mwait-idle.c          |  5 ++-
 xen/arch/x86/cpu/vpmu.c                |  9 ++----
 xen/arch/x86/cpuid.c                   |  5 ++-
 xen/arch/x86/dom0_build.c              |  2 +-
 xen/arch/x86/domain.c                  | 16 +++++-----
 xen/arch/x86/e820.c                    |  2 +-
 xen/arch/x86/guest/xen/xen.c           |  6 +++-
 xen/arch/x86/hvm/hvm.c                 |  3 +-
 xen/arch/x86/hvm/ioreq.c               |  3 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  8 ++---
 xen/arch/x86/i8259.c                   |  5 ++-
 xen/arch/x86/include/asm/cpufeature.h  | 27 ++++++++++++++++
 xen/arch/x86/include/asm/guest_pt.h    |  3 +-
 xen/arch/x86/irq.c                     |  3 +-
 xen/arch/x86/msr.c                     | 35 +++++++++------------
 xen/arch/x86/nmi.c                     |  4 +--
 xen/arch/x86/pv/domain.c               |  2 +-
 xen/arch/x86/pv/emul-priv-op.c         | 27 +++++++---------
 xen/arch/x86/setup.c                   |  7 ++---
 xen/arch/x86/spec_ctrl.c               | 42 ++++++++++---------------
 xen/arch/x86/traps-setup.c             |  2 +-
 xen/arch/x86/x86_emulate/private.h     | 10 +++++-
 xen/arch/x86/x86_emulate/x86_emulate.c |  2 +-
 xen/lib/x86/policy.c                   |  3 +-
 46 files changed, 224 insertions(+), 200 deletions(-)


base-commit: 381b4ff16f7ff83a2dc44f16b8dd0208f3255ec7
-- 
2.43.0


