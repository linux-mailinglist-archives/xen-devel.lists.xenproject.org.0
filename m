Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38DA84D86
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 21:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946245.1344208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2xuo-0008JO-Cz; Thu, 10 Apr 2025 19:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946245.1344208; Thu, 10 Apr 2025 19:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2xuo-0008GG-9a; Thu, 10 Apr 2025 19:50:22 +0000
Received: by outflank-mailman (input) for mailman id 946245;
 Thu, 10 Apr 2025 19:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2xun-0008GA-FN
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 19:50:21 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2416::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07767abd-1645-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 21:50:19 +0200 (CEST)
Received: from DS7PR06CA0037.namprd06.prod.outlook.com (2603:10b6:8:54::12) by
 SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Thu, 10 Apr 2025 19:50:15 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::fb) by DS7PR06CA0037.outlook.office365.com
 (2603:10b6:8:54::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 19:50:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 19:50:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:50:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:50:13 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Apr 2025 14:50:12 -0500
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
X-Inumbo-ID: 07767abd-1645-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+HINt01kRae8g4vJriX4CYXRASSxKgP1ECdL35ovkWgup91b1iMJYTS2s8xl6CvepgFr1D+VetNaNGjoUg5OxXdcCdRX2GIw/IaYXq1VJZYLeC4HzyESY9Ziv8giQmDWFafvy9RQG6CGc9cTZ7jQzd0OoeuRZxrJM48UuzDbq4tmo0vXDbtwv3iLnZhZVV8rkzUdaj4bKZOExSBK1CtbOsu8XdQRLUIvLoqxuhTY3y5P9Fh3CYKX0tejz6kI+vQtNro+HWNHuK8KuG7/ovVHuewfVIupONLvid0dxEVrnNyzijnzeyx4+BphQIlcIRLS9JpOr0wAz7XCojjG8PVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a403CpeXu00vevEWK/Gvu+k567EX/rf6b895FNpNw9U=;
 b=Dqey2R1K2IXEC12c2k8szXeg6Z2WYIOjYN83v78RtAK73FnrmQANLSugOtGmjiqlswp9TrPd76K/6b7v6gz4S8axrN0xpzlcFp0zq2RxdgnlBzpXf0XFh0HqNDSMzuhdXSpNJaAcxUUe4rdYcYINUzl8MBoFhUYPeI2U5MfMBOIOCmeEMfjv8BTANpkQyrHwE+eGW9rFh/V2SlcDX8exdqJVQx+Ydr0T48sk6vAD1OeVLczc1v7BaPd2ptGGNywZaucFHhzbNVPp/o/bZ4XGgZ4L1WFFtfTDHlmgZeU9dfcjDkStuTYVG5K/pR36IVV69Gexu5yLdHyg5lnLi4XtPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a403CpeXu00vevEWK/Gvu+k567EX/rf6b895FNpNw9U=;
 b=N/DhXCpaK/7e1LsvKQ1Mo8M2BtwvjwDAsf98VhRCUedvj8eJvl26w+j4/N2h/WFqD2rT5IHnjhHEaoFScLpz75gpOUW+msGiJdbVHKJvfBvp1YvKif5YafJQQcHXJOjjqz6jVPTWBfvzwxlIrdVV2eslV4MW3Mh6qQ+GBHtzriY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <agarciav@amd.com>, <jgross@suse.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jason.andryuk@amd.com>, <marmarek@invisiblethingslab.com>,
	<michal.orzel@amd.com>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
Date: Thu, 10 Apr 2025 15:50:12 -0400
Message-ID: <20250410195012.363658-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3688d2-ce2d-45eb-4476-08dd7868e9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZrcoMTWMylRCvnY8rDwJJ4tasyfOKTJ2YekomC1XjEFSn4+2zW8zD8CniUAf?=
 =?us-ascii?Q?Uazpqh2EEv+9cl+neansafjWJHProRLPwLAMF5YZJbrPXLbn/N57T+QG+pYB?=
 =?us-ascii?Q?Kv82iedZC1TBXDtWrQ++KdX0AfrcErK4PCx9I9m7rJf3Ftn21u+RZFs3xvDV?=
 =?us-ascii?Q?4mSB228fy1+Ug98Xw0u8Oh/GDrSuuR+gMJFGTL68oMavSciQbtpztIvnn1YW?=
 =?us-ascii?Q?4KF5xg6Bo7qqJN+1VmtTQEOONjh/03XlhvkDTZx+lkxn3xELaKtwMtOT7xM1?=
 =?us-ascii?Q?spQq8F2v1hzND0aDR6KNZDkBfaaTSyBko8gopJqw5UrvLGkyAzJZAkRbfal0?=
 =?us-ascii?Q?y9Fwfgi3xM0K64upRZvXIgekKdA5+Uf5ujRNq5lKnt2wxkuI7j7WWJoaocKC?=
 =?us-ascii?Q?09NDugFcvuRWgfMzItVarigXH2gW6OFUL62FU3UIRlcUGtNMCjXaA1S+29n0?=
 =?us-ascii?Q?mZfq5vfhkVVRnKaaeYKO4U24sWCQvru/pz80No8bL2v5sZJFdTAEBb6rqN8v?=
 =?us-ascii?Q?JqFsqMGDDPTCNeV1gycBaxnQxocmgTrTGa/vVZbdSoLFnhxoTfDbI/S5EBtm?=
 =?us-ascii?Q?+VnSIIHftW/ftPehaMNp9nIaUFsTQxplWLdn2ZEvGgAHUgUxZge1GTHrBUUi?=
 =?us-ascii?Q?IwbHUDLXeYplX+KHw2t7ExRWOaEn7b0rG1CXO7KfcCWhUFRZLgJng8RZj2+N?=
 =?us-ascii?Q?Egm/UAQKdwDCBTustyk/4fvWIKJ42jVEt4Ln+5xIAisue/mMuBOx/Y+QRZ1M?=
 =?us-ascii?Q?8sDG1aWyXmYNvlBzKcnQkyvx/bNngYgeE0ab5xVIwm/vnzNK8WM/Henysibc?=
 =?us-ascii?Q?fRs1g7pVmFyibQg6IWxVQV0VcauBWVrXCpb4vKFFgE0JGs4dQ8nwROD1y8Hy?=
 =?us-ascii?Q?4M49VuFpR190WDY/NGnFRdu7Pg/tSpENHG9SMozWBkgPsvQEdmQmoQd+Ve9G?=
 =?us-ascii?Q?M9bEHNq/YvdKst8qAprAX7kRZVOhOxJH01OYDHniuTwOBEHe2xFmhCAuUeyq?=
 =?us-ascii?Q?3YPgvSw61wgigMIz3vNM+kIVweJlsK52FgsVe4egm0GlJaC91ocZWdcLYlG6?=
 =?us-ascii?Q?sjxvRlev0tRp1qVr4H0591Z5PjkIRBndGV2DrTyQ+0DmIXlenJm7aCgUWMsn?=
 =?us-ascii?Q?WExWxp0GNHfg5o3RoxZQKeDUckQYL5kvLWEFyyuQYSkoRgzoUf6C3ynmcRqT?=
 =?us-ascii?Q?SFucefYbHtCUJM6VyXsgcTSoLdV8s9wDU4NBdTVW1JnkZPRtuKfuxUnfpAZR?=
 =?us-ascii?Q?DRAF+z3PGXCxcloh/KXbaD5D1ifeLwyVmsW94keo2uUZtHo0yQ2Z/BZvR6NV?=
 =?us-ascii?Q?D9pFGNJohz2W0ysrh9qsBO+GWx0iJ7VYAUgJE25d3SgR20LUpkLnz0CN1l5E?=
 =?us-ascii?Q?WSJRF+9Tp8JmFmvYyaiui36hud5ZlnxJMW0/Tqk7WWZ/dtk5/IoTVpv9WHqX?=
 =?us-ascii?Q?D60UILBrhp5q/iZlUt5eCe59oLt/1GAjPs6Nx4/5PiHNAkIYf3FNeiL6uEOh?=
 =?us-ascii?Q?wvXOseqMPL+LzJw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 19:50:14.7732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3688d2-ce2d-45eb-4476-08dd7868e9a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142

A Xen PVH dom0 on an AMD processor triple faults early in boot on
6.6.86.  CPU detection appears to fail, as the faulting instruction is
vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().

Detection fails because __xen_hypercall_setfunc() returns the full
kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
xen_hypercall_amd(%rip), which when running from identity mapping, is
only 0x015b93f0.

Replace the rip-relative address with just loading the actual address to
restore the proper comparision.

This only seems to affect PVH dom0 boot.  This is probably because the
XENMEM_memory_map hypercall is issued early on from the identity
mappings.  With a domU, the memory map is provided via hvm_start_info
and the hypercall is skipped.  The domU is probably running from the
kernel high mapping when it issues hypercalls.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I think this sort of address mismatch would be addresed by
e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")

That could be backported instead, but it depends on a fair number of
patches.

Not sure on how getting a patch just into 6.6 would work.  This patch
could go into upstream Linux though it's not strictly necessary when the
rip-relative address is a high address.
---
 arch/x86/xen/xen-head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index 059f343da76d..71a0eda2da60 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -117,7 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
 	pop %ebx
 	pop %eax
 #else
-	lea xen_hypercall_amd(%rip), %rcx
+	mov $xen_hypercall_amd, %rcx
 	cmp %rax, %rcx
 #ifdef CONFIG_FRAME_POINTER
 	pop %rax	/* Dummy pop. */
-- 
2.49.0


