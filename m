Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TevJBkUpj2kOKwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:38:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B11366AD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230930.1536295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtMu-0001UH-6P; Fri, 13 Feb 2026 13:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230930.1536295; Fri, 13 Feb 2026 13:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtMu-0001RO-3c; Fri, 13 Feb 2026 13:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1230930;
 Fri, 13 Feb 2026 13:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqtMt-0001RI-AW
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:37:59 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346642a2-08e1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 14:37:57 +0100 (CET)
Received: from BYAPR07CA0061.namprd07.prod.outlook.com (2603:10b6:a03:60::38)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::999) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 13:37:51 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:60:cafe::19) by BYAPR07CA0061.outlook.office365.com
 (2603:10b6:a03:60::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 13:37:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 13:37:50 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 07:37:47 -0600
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
X-Inumbo-ID: 346642a2-08e1-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfH9F4KEwR9d+zlAcqyl1TV048nACurqWUtOYIwIZhL2sS+gN87zGzkhv/HGPc7EjOP6UrEQ0IOxonFHmSRLUd89UAXpSnmPEI5IGDlhUbvs1uXERi3N7yo7n07CzbbF1r2n+jCcgByDi99BXGso3Fjxy1F6AShEuFZ+E3nzq6PZiw8igGCOWIbThVyszdRNCYeal9LfHz4y4MFv/0eDZ+YmDk4fDmfA00Gky+CotYvtJvGnJYfGuQGBjzcWxjFhZMQDzYtzX2cwAIhd2kTsP+9vEjp72/CABevs6hSrrnFRqJSECCIu4kEJu25eTTuUJImpDyE2kOrDNEmdCg/JVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVHDnfeZ9Qwy5x2KVw60dxyfthggzrmiIZebDLtKY80=;
 b=kC/L1LAtE1V1yUCivo2NM5juEGwdlOSYyXyGRJ6vEKP+3oXFR135WFYKq+F4nxMbbDmKQAEgDd48B2go2yCqD2+idCt7GrPRAI17F3xnsCu7dccZ3FvNGbkKMBVJhttdXiJLAZp203oOTWzhMkIAdSJ5wUm8bH90rK3QC3IS0eh2678cgvJhz6E5bEy/qS7QHdfINSzabu2a0l8dar66Bk+9lT8km1f2qpe8sSjlijSZfDcSr0SLy4YE/gC9yKaQ9KxpnEvKUv+ajcftUjPVNRysqUOSR3bKytMIunTLikjqrGiZmwKysu2v3atbSpIsSop3tfADs2s95FPo2zFptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVHDnfeZ9Qwy5x2KVw60dxyfthggzrmiIZebDLtKY80=;
 b=qWI3fDJ2DPCyBjT5DFFJsRIZi2gWy0+UCnrNFgXZCeIwosGk43geQW6pv+6VAe+35AhU7dM5u0pS7yGkyuK2rp3FThDvp78dilYai3TFnIBJORp8tyv4gbkMUQtmIr8La6fPac3XdStw/cbwFLgaxpGvNrMRg5ldU8CUVgoCPSU=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] x86: Const-ify hvm_enabled and hap_enabled() when possible
Date: Fri, 13 Feb 2026 14:37:28 +0100
Message-ID: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e6a1c4-ecc3-4e83-8227-08de6b0514d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3QnERybjnL/qTeR6n5PxKsEhnAFAvjfiv+j+BWRgBOuPkYH0RFTeKwQ4JqLi?=
 =?us-ascii?Q?eYPaeb73zHzrg/wvoC5m4NG33+W13QIH7cTQU8BoEDG71uhBJRli2Qw4ZaG/?=
 =?us-ascii?Q?KU9XSuJCKgOmBw3u7914Vn2p/aflWa0Uc5EFESyZRepnf47lh2lF4icA80DS?=
 =?us-ascii?Q?sF3mNJ6u5eq9lE26VcXfKpdE7q7bpEpr4eYwaoBaFwXjtIb7o3P81D4B1HBn?=
 =?us-ascii?Q?/EimUNOXY1qU1zHQdUlLO1mXXIJIq/4ST1zyj+qbWbH9IlNTwURF78zbeiBK?=
 =?us-ascii?Q?iyB7OSjzDMgSX+B6f8Xf/hW+91yHhXW3HwiI+4OrWhlYu9AC0KIs5K8IsmYW?=
 =?us-ascii?Q?OzS61PHfv6pAFwEsu7fMdMGEFELyDLDm6Rh0VWv/s0eyN614yK4eGrY8gyg/?=
 =?us-ascii?Q?JQmyqLf23KwaqvNVrSuo7txHm4JMEMrwRpPnfHUjFKu80DGkXYvGwS1P7zuN?=
 =?us-ascii?Q?A+392a1KQzENSdZjTPztrGBVk96pcMI9UrGMtrb4ZkByEnMhk6Bx9SanxLdL?=
 =?us-ascii?Q?3l9xVwTMVdQylG3SY4O8Od+rhCZLkuuIBtC7Y62TULBi3gs9vRyY/MnjnXL+?=
 =?us-ascii?Q?OZuRfnQ8YUnGPsFtqUVWajyHToj/jfetOCeTuI9m8GbCdnMLYimkCxY0sMLT?=
 =?us-ascii?Q?Yfyk1f/E742K7BgLVt3eoTZp5L9+he5TNIn5wZXXrKGnSSN1m83flsI2LBb1?=
 =?us-ascii?Q?M6xLWwAWAhEOaVzqLH2xclaDNfMaRyqcXb1/5EqnrqNZLuzAsJScxcYYG7Es?=
 =?us-ascii?Q?N21Z030NcZVEDplfEo3vazskUkR1XaKLf67yOy9MndVp+TDzMh9vSWr5pXqU?=
 =?us-ascii?Q?Qs+U1nQyJH8SZifA3PDAeDamenj7InpPDv93yWUwYhNnKIyuHokb9fauCDXN?=
 =?us-ascii?Q?Jto7oLhTrsdV/ekWlwfkr49cJ4Je7V2dT5baxPuCFzVbTOEfkvTaYjSGMEO5?=
 =?us-ascii?Q?oyZ/5ohgCxz26qpmunRgB0M8gvodNjA/Vjy+r7Wvyn3W/na4qDqcjLeQ+9yV?=
 =?us-ascii?Q?6HlClOanwKIfd4An+XQzufmi3bJ9NcYxYcNPchukYzJf/RKpoOuXXqyEIb5r?=
 =?us-ascii?Q?wK6S+3gGxcnTydGj/2AIPhZqAfXMu+KkhMMWgbF/j0iuK59WHInt/PNd/ewu?=
 =?us-ascii?Q?IDTW9jeDsEcitHMhfcDMpGCc+aZLPnnUr8ok7NV+PHYNdHStiC/ecv6PJhh/?=
 =?us-ascii?Q?c13SbSw6tCFBxcBKU9UFRx+5H2n/fyuM/rjCOfXlBfZkfb1HnWR9IN9CwHiX?=
 =?us-ascii?Q?SPZklmdwweu5pdz7q+PZwWjRB5PpHEyjK6sW8DZGJ00YN40WLPj+qFzOvWkE?=
 =?us-ascii?Q?b9nq/Yp+ugPy/Tl5O0jw5mAraJGCUCrUZnJnAWaNoOVmor8UpqejeSONc4qL?=
 =?us-ascii?Q?4EuvOYmS3oe+dHqwx+1kKxHX/xhvQbKEq620dd9TWG1/6ksnEGjqH9Vg1Gco?=
 =?us-ascii?Q?I8i3kigoI2V+fh9peMurX12Zz3epIE0RfqiIJ8eBeXwrsO9XcEi5AH+xTn1b?=
 =?us-ascii?Q?ph58+bbgX+Ac/JuOTQ+F3hpA1HeVy5tJuEduKN26zQE8I7L4N3SnuOs+GFhH?=
 =?us-ascii?Q?6NLC18E5yCMg/YAmPbFVsohTvd1zq1jd/4NAlraKZzcRFmsUFsfkFcgN/8wV?=
 =?us-ascii?Q?gRidOYFGckZt6WjkuOUhPtAaiks41mJkbF1k0FrPYjwQEJjLBB1ddRKJlrA6?=
 =?us-ascii?Q?cn4Ucw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JoJL2cYJNyx+sjagYbDqxWmh8lL3UhwOy+vrLuAmXYPaZONheBq3YljbM1TjO7BKS5dG2cFHPyJO++rqWnVSZb2AW7N/LCW0C5v3/z/hcczOgTRzhAxxmZZvYLMeE0Yh5T9ULGosmKI+4n4B11ZhmJYJeADMdDwJ+Lt/8KAHMMQMPbInM6oyRX7zUE7O8BUpWrv2RUyBAGHXpNQX8ii1gGtfkg+Jxt42Cpjd7DtuD39qdOGcOelMju57N8WWYP9VMBtOcoXcazSHAgk3NMekeM3yY8ByjBvd9jRJf8jsjqabQHH0fGoY/EA9c6WJmJrYM2odtzrh7eAYU/9lt3XQLEZ7XC7PPYqrrcVLPekgHJ31U3MSYPe1livbCxGG4uXqL6WrtPH6A7sSG1tW7aifuc0MVim6oMxdlkr90oP6nNVjEnHwYFgKTpDKpdmgdDGG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:37:50.0068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e6a1c4-ecc3-4e83-8227-08de6b0514d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,amd.com:server fail,gitlab.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,amd.com:mid,amd.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6D1B11366AD
X-Rspamd-Action: no action

Hi,

pipeline (green): https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2324325987

hvm_enabled is already a constant in PV-only builds. Patch 1 makes it so it's
also a constant in HVM-only builds (with a compile-time panic if HVM support
is lacking in HW). Patch 2 makes it so HVM-only shadowless builds mandate HAP
at boot, thus const-ifying hap_enabled() too and removing that pesky shadow/
folder.

Cheers,
Alejandro

Alejandro Vallejo (2):
  x86: Make hvm_enabled a constant unless both PV and HVM are both
    compiled
  x86: Force HAP to be enabled when PV and shadow paging are compiled
    out

 xen/arch/x86/Kconfig               |  2 ++
 xen/arch/x86/hvm/Kconfig           |  3 +++
 xen/arch/x86/hvm/hvm.c             | 17 ++++++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 32 +++++++++++++++---------------
 xen/arch/x86/mm/Makefile           |  2 +-
 xen/include/xen/sched.h            |  3 +++
 6 files changed, 42 insertions(+), 17 deletions(-)


base-commit: 1f4f85b64d393be1aa8dc8170201f4fbfe9c7222
-- 
2.43.0


