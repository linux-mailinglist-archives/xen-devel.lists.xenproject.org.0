Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28484A84D0D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 21:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946221.1344187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2xbb-00028p-KN; Thu, 10 Apr 2025 19:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946221.1344187; Thu, 10 Apr 2025 19:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2xbb-00026W-HR; Thu, 10 Apr 2025 19:30:31 +0000
Received: by outflank-mailman (input) for mailman id 946221;
 Thu, 10 Apr 2025 19:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Tv=W4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u2xbZ-00026Q-Kw
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 19:30:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2417::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41087490-1642-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 21:30:27 +0200 (CEST)
Received: from CH0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:610:75::31)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 19:30:22 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::ca) by CH0PR04CA0116.outlook.office365.com
 (2603:10b6:610:75::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.24 via Frontend Transport; Thu,
 10 Apr 2025 19:30:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 19:30:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:30:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 14:30:21 -0500
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 10 Apr 2025 14:30:20 -0500
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
X-Inumbo-ID: 41087490-1642-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=US9aVunn52ngKamsga510U9fMy/pCwnqwZoDzOSq6AKEn4r3u8imkGSHu9oxVJr1slWZfKyiDUWH8Ux9sqQK3UuUDHKuVvEgZCU0dNuVfPWqD68svoHzhm68KNDXqnpdgpAdkaIWSJDbNuZCT0s+vHhQh4WW/3v/f4WjsprITHVFI3azU1+LAPkLeo69Kz4MmlP+jGD58iXNmhFG8VviTcWsFYPCY1Dnx20VJZcaWkM3C6dWPe5tmzrk3JCW0nEWmLvRTfx8jv41r+SASCIiPGJKYMHaOQngPylETpxzplgrwXKYmUcAW+05onaTIbutFTwjecuTQnyBNOHYJeA4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa4MOdUShz/tEi4WMru8zb9VdFMJu4Ipe3WHYaFMUBw=;
 b=bdJj5Yp+/+K/s+1fPDHGSsV//HC8sJP18j/gCD4EulmL6+jk4sd52dm5UOdG1bEUk9Hlv0612KF+n1p53L5gmSocrCnZu19YIq52ZXT4ojrDgLZoaxCGb+P74t3g9cRvfknZwNz5gx1mVEhGZ1k4OX3+b6W3NFVEVUYhymNLUN0RArriaaeq0aq90biXS5Sx2OAz05lbC93k5BZaDh0Im6UwsKI/Rg992bnGIgMWSw3Ps7wPpXevkofSla+9ExjcvACS3NEmK40uR8HH5Jt3hq4VgJpHvgmL0WE5EPwQCO/qmVjxAfdGV5XA/65+Q9gFVe0f/Ox2teMTxKeUZHr57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa4MOdUShz/tEi4WMru8zb9VdFMJu4Ipe3WHYaFMUBw=;
 b=Q0LiERcriQt0sDARiJyRtfUsbkGs1gYZutyzrv1kX40gpeim9CJkSCjcyHTyniaiHqqOCJy1hxoX2B2EFKh7lIUlbpkOBGl1ZwXEWWSAxM6qkHL0PJGfR27QkgZY3nnejg1D3mjsphEu9y69PiyOHFkf7oQmuFybySt58Ff15pU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, "Xin Li (Intel)" <xin@zytor.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, Ingo Molnar <mingo@kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86/xen: Fix __xen_hypercall_setfunc
Date: Thu, 10 Apr 2025 15:31:05 -0400
Message-ID: <20250410193106.16353-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: d53e24bd-f177-4a08-783c-08dd786622ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x9t3oKOW/lHGKEDVUMT8cI8tdcP6VTzNpgLI/6ZQDhT4VcO1FvGNIcubFts0?=
 =?us-ascii?Q?oV+68oMYRkl/UI2RVfwR/S936DLfQ9RJeJaRfNZy0dhom8VS3kheDkLnCmbU?=
 =?us-ascii?Q?b+v+IqZuN25iN+cx8wb5suMW4ZapoKKRbuY8UdN9jSbfFVhEaN712JKtTBbA?=
 =?us-ascii?Q?okL465rm4GXUTuYrctXhVmWa8xsnEKWV+/K+cTKJ+1yonMaAGBht0UPg3cOC?=
 =?us-ascii?Q?JnLa1hCnp1ghoUQvU5MR+zNOED8Lj3VaI4/nIS4XertZ51krqKU2P+0R3t7Z?=
 =?us-ascii?Q?3qc3zvsblcIE6StJE3aKh8s+3U5GVT/KowCyu1/O4nUT/YOB/FLl7nocWeYl?=
 =?us-ascii?Q?joCqusS/OI128qUDAWVx8s8sEhgJn/kvKrnJuuYb58DFgyTbMoWK9Pg5kPn/?=
 =?us-ascii?Q?xWB/kyjEbBZVn5Jl7sZidneedsj5e3n3A50YP4rlaVcOzYzMXAMqJfFnK9Sm?=
 =?us-ascii?Q?CR7mGGygA++N3i5aisqmTTvfI1QZftvTkk/Vp5DvZouet1oHgaaGriy4BYIR?=
 =?us-ascii?Q?I7KoPrvwY418+PZAECZE0yWIXYufze6Vv4Vwfmw9NxVbIsuL7m62mHkPOVCz?=
 =?us-ascii?Q?Wkq2pWOyA4IcibhuHCHyb8lu6ru43gsA89qxyHqDfGeEqhrzwkHo8zxh52yS?=
 =?us-ascii?Q?swKHi0DKpyEfGWYCGRlXTLgAgPslTwCllhwxtOmzWJhnLB2XMqtHfnthRc6C?=
 =?us-ascii?Q?U8Vvu1FdRjdmEcUb6PTBC+roT78znlbOQJqCLcNOSA3JCIh7dAdnzbiHqgnm?=
 =?us-ascii?Q?pm0dJXoNXq6lCjnUs9kXAluShBH4GLZkWcOCcd9FO1ZwC1zit6nhY+pP09Af?=
 =?us-ascii?Q?PJmEUSBTlUwn2j6JBrlC4NXH1w0VK//3brusuwb/o1a7Xfkdhhy5wS21iDpc?=
 =?us-ascii?Q?/3P5tmVgvLlc0pjSsRqx0Ngiu+UjLV+zdP2UQq8OGFQm8gBWS5/a2ymFF7Kk?=
 =?us-ascii?Q?FOXE7HAhdvGjfDNjYTjdB/FU8I/GEh7XS5g3IlZFUkkyGUUatJMXZF3u3TCu?=
 =?us-ascii?Q?0w5CLKKJgl35xD3AImAdfz/VI4rJZykKjgTfgkVN3ypBGQVutsn4/Ec3Ropu?=
 =?us-ascii?Q?g171PGsyd8OzHUpdH8h5MEFg927SYC7AYpeG01yf5oE1eAnmIPm28O9AS5IC?=
 =?us-ascii?Q?/ijheaGZtL5jy9JS9V5OUAYkxntyeTLulAl3QPAVK+E9xB7paCjVvkb/YqU4?=
 =?us-ascii?Q?f3SmOIlmIswYalKCbg9JAA4+z4dfz28Crug1SKtOUbMyLNSOTe69oERf4+iq?=
 =?us-ascii?Q?MOa2kTV/hsSAYJYVujWu1mI9Lq4DGChv0yNLeWwLm2EapZKUnJ534cSvZC37?=
 =?us-ascii?Q?3d0Ni02QckaEalkMPGWwz5B7/irriNMOT+vlFzX158ald42EQsWB/NGuy6ay?=
 =?us-ascii?Q?P6odOYI+bfAVN++FW4IHjGtGc7zyq8ejl9e1xyv+wepFI7Urdm/gYY8maZM7?=
 =?us-ascii?Q?Fxww5ipwVnX5MB5cDjuwQnCdPMIBHISdh0Xuxr3jZ/3GcnM7h4VZxoZXbnN5?=
 =?us-ascii?Q?Scj5FX8SwOGjH3ngbAnFJFg9VCBFPBl6+PJQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 19:30:21.8954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d53e24bd-f177-4a08-783c-08dd786622ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240

Hypercall detection is failing with xen_hypercall_intel() chosen even on
an AMD processor.  Looking at the disassembly, the call to
xen_get_vendor() was removed.

The check for boot_cpu_has(X86_FEATURE_CPUID) was used as a proxy for
the x86_vendor having been set.  When
CONFIG_X86_REQUIRED_FEATURE_CPUID=y (the default value), DCE eliminates
the call to xen_get_vendor().  An uninitialized value 0 means
X86_VENDOR_INTEL, so the Intel function is always returned.

Remove the if and always call xen_get_vendor() to avoid this issue.

Fixes: 3d37d9396eb3 ("x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs")
Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I think the Fixes is correct in that it default enables requiring the
feature.  There were a lot of other changes to how headers were
generated as well.
---
 arch/x86/xen/enlighten.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 43dcd8c7badc..6a5cae915eb1 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -100,10 +100,6 @@ noinstr void *__xen_hypercall_setfunc(void)
 	void (*func)(void);
 
 	/*
-	 * Xen is supported only on CPUs with CPUID, so testing for
-	 * X86_FEATURE_CPUID is a test for early_cpu_init() having been
-	 * run.
-	 *
 	 * Note that __xen_hypercall_setfunc() is noinstr only due to a nasty
 	 * dependency chain: it is being called via the xen_hypercall static
 	 * call when running as a PVH or HVM guest. Hypercalls need to be
@@ -115,8 +111,7 @@ noinstr void *__xen_hypercall_setfunc(void)
 	 */
 	instrumentation_begin();
 
-	if (!boot_cpu_has(X86_FEATURE_CPUID))
-		xen_get_vendor();
+	xen_get_vendor();
 
 	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
 	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON))
-- 
2.34.1


