Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB8EAFD4E9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 19:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036948.1409538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZBst-0003SC-LD; Tue, 08 Jul 2025 17:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036948.1409538; Tue, 08 Jul 2025 17:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZBst-0003PZ-IC; Tue, 08 Jul 2025 17:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1036948;
 Tue, 08 Jul 2025 17:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZBss-0003PP-Vs
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 17:13:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2416::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e05b8178-5c1e-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 19:13:33 +0200 (CEST)
Received: from BL1PR13CA0252.namprd13.prod.outlook.com (2603:10b6:208:2ba::17)
 by DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.38; Tue, 8 Jul
 2025 17:13:29 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::36) by BL1PR13CA0252.outlook.office365.com
 (2603:10b6:208:2ba::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 17:13:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Tue, 8 Jul 2025 17:13:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 12:13:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 12:13:28 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Jul 2025 12:13:27 -0500
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
X-Inumbo-ID: e05b8178-5c1e-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QI3ryxCZRQUzibFpoCW6CNZt0F1eNtC8vackqpx2MJsFIT4nmYDpcSYMncbd4wAsYTtc5iuKsMwPkaYTcauJBngSAnm1Y9s15lKG+XFyjDqsLNiC+8OsSY4aMbcN6xnRL7CKKSZxgZa38kv6dp83ANhr/jjoYizc6lHppLkOZO/1aTtR87wSNsLLyhlZrXHZFBP9NvFrGbfIhh/2cloCfbvB6o8k5SLjjb6BKiCjBbZ2F5xvwKpi59/yDru61g4WELVvq/PmqSewkXAogI1zoveSv3tjYqcC0iFRGsOq28oXjH2P8FjeeXsWEOXTq0WmV9Ze8Kj+fB8ilDaGS9U/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6ayzJXoYHvJHgMgTaIVaDpXxx2nzK7b2z3p1T5AeV8=;
 b=jGH/rANVZJUJnNHI8WjTAbUaSQEj8OHPNrFIWju55xVeblq70sgk8FU2JyEIEZA1KtGWdew0N/NG0tB7Lp2qgkHNLB3CG5/zB3GKY4Naubu/oKi1fs84N33Ez0scm2xpevrZoe+Wkn/oO3f8DyCUwk90FUidQUJTcaGddCIWibf1sFetDn1ZVS+zoB/Mqmss6x3De2ImJ4tSDQpFHRf3eF2qHzA/jNZiUZk7LS+QNAFEHNqD8O8o/rz0Qkf+SiU02DgIVl9xrs1BRtBsNT0xPpApR8Zs2H/XHzgZQNoKYUasPXPchJ0NzeAC+4/Gkm8FNYtOQGV8pE807qgm3VE4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6ayzJXoYHvJHgMgTaIVaDpXxx2nzK7b2z3p1T5AeV8=;
 b=iVKgGRzsCrJlWr/IODtSi9ux5+kNHSCthVK+1Ufj8CkOYnxzCGni/5BEavazchw7DgGa5jkrTS4V2c74aHCrUkFRapuHvGSsOBQwifA+ct2cms8MrUin1UY3OjrLb2feHmcilFfQaKAalAAtt8DYtCXpg7FJEOhnWiKxoP6zg00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Tue, 8 Jul 2025 10:13:25 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/x86: introduce AMD_MCE_NONFATAL
In-Reply-To: <8a7b1a65-f5c2-4992-a935-3c134d55a2f1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507081012550.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <20250708000712.2731666-2-stefano.stabellini@amd.com> <DB6LN9YLAF8J.1OV1IDMXC7F0Q@amd.com> <8a7b1a65-f5c2-4992-a935-3c134d55a2f1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|DM4PR12MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 291dd5e3-7768-4f48-fb87-08ddbe42c25b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HsvpK6NA05r7fe/aZp/K8b1vOI+rQlNO2CHPP+Fs0sN+32YztQplEQjdVxw6?=
 =?us-ascii?Q?zB8IHufFmzEtOB+2A5cylxYPWGdkEXhOpTDqcR1obBX8rZ2k4ED9TMAD7PD3?=
 =?us-ascii?Q?4/mEWN9JeJtNsxBRFXtg2z8IoDjAH85HrzGKPr/j7EjACDYSj289HazieF2L?=
 =?us-ascii?Q?2n+cxPFo7uYIjqgg9XW7WQK+B5Sl9IoSGZ4e5SSq8N1lQ0SGaKglhvzodewU?=
 =?us-ascii?Q?l8mtY9HbYy7pNMIazUV0TwvK+T00kkYigxQ5SGiwydpJe2qPxb0k0DcMdkVI?=
 =?us-ascii?Q?fURI3dzFAlo+wyuSUQmYdZaN9vpXNXtb0ATM/gGGwFCKBaAQWmkyQoRTVV1Y?=
 =?us-ascii?Q?rGYTJoazASBoyj4pk6PMw310iPUdw3N/+NegiRFyenKMX9Rt1fifHMx52z7C?=
 =?us-ascii?Q?g4YV/D5Qr52mBves7Crk+3yLwZZtx2q/fgSt7po/fZjErgN4OFOnq9gMlPJg?=
 =?us-ascii?Q?0r6M+f6isO+aQEJqbGOnP2QBYUloN4Gya/1zyUONb+APlK2jknRe8WFXXpyD?=
 =?us-ascii?Q?6hLAQLS3GVQd6txIJPS5/ZYWdKwaXGsDpKhNx46hQrA74zQGoZ6BSegeuraX?=
 =?us-ascii?Q?BrvvUNRowoe2CIDxeYwEDv07Im2CE2ZcrAs7+LTzH8YADbLwUR1v0OipR7y3?=
 =?us-ascii?Q?cwdRJVEegVMQ3yI9w2bGTB9obuTbGXhjjw1JrnZJDxmvikibXCJSyx2tut3v?=
 =?us-ascii?Q?zBa6g5Mg3DP+Hnpn0IS44PNQk/e02RGja0WwZF8IuKZdCyQKU2GSp6J0hJZO?=
 =?us-ascii?Q?+YCsjW5RiPWuI6y8bUk+C3lB11HwbxK7fGrzz1CpI+AP+H/QWx5t1/MFla1o?=
 =?us-ascii?Q?x044ynxqIwHh9DUA5SdLd+fmg8nafF03cGt1frnFIe7yarOu+HCfl5JwWBZE?=
 =?us-ascii?Q?f7QjgRc/P4Ql1dlaRYcI9YIApuvsW95d5cTfINh0ch6qqspGZfRBsOB8ly6e?=
 =?us-ascii?Q?BAqVMVyDPR+3OdNlgEPwW+XdzbF403ZP5NbO4Upp2TRs6UiVz6J/0BcTfMxD?=
 =?us-ascii?Q?mecgWCQbdyfNums+iUUY9sD2SbigppwmqDlcSWhBeNnAoKdgsh5Wj1Rrjbu3?=
 =?us-ascii?Q?6DjnqKIFMFF7NzZUnata65MeBCmxrqNZpdNVcHyPoNI0p225ev/RS5ghF9hq?=
 =?us-ascii?Q?J3e3dmU+DHhB8R5j1FpzC8Ft+Tg2cpJGQUXk5qFMJMQfZOi2t2H77eDD67+s?=
 =?us-ascii?Q?YPGMcgPmZE8fPWneVyk8yGkWE0bUyOzd+jalCEnubC1c/A5JKttSps9UgEKm?=
 =?us-ascii?Q?dSiWvfEgPpc2r+hHcg+6FE7cVYMAqGFMBrXCY/OfkTRSKvbm94RG3vQTJsXk?=
 =?us-ascii?Q?6RW8aKPIixxxXpti5jlXUrZxHyARLip3pWNOSOWzQnrAMCxA5Kw1TXpknVUe?=
 =?us-ascii?Q?zczS4YCf67TpPoxnE6b3n4I1mULYq2ZjNLRkYycQe6JXCIhTHn5YAeY8HtN/?=
 =?us-ascii?Q?OlJNm3RZ7xRF9dWTSA52+JjTCmIFJbLJs5mUIuZPW28A/ZLRVjYPaJ1XKq7w?=
 =?us-ascii?Q?48AfzZdFuV9Ll3dwTUFW6teJuk8q9asMKCXN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:13:29.3975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291dd5e3-7768-4f48-fb87-08ddbe42c25b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890

On Tue, 8 Jul 2025, Jan Beulich wrote:
> On 08.07.2025 12:25, Alejandro Vallejo wrote:
> > On Tue Jul 8, 2025 at 2:07 AM CEST, Stefano Stabellini wrote:
> >> --- a/xen/arch/x86/Kconfig.cpu
> >> +++ b/xen/arch/x86/Kconfig.cpu
> >> @@ -10,6 +10,21 @@ config AMD
> >>  	  May be turned off in builds targetting other vendors.  Otherwise,
> >>  	  must be enabled for Xen to work suitably on AMD platforms.
> >>  
> >> +config AMD_MCE_NONFATAL
> >> +	bool "Check for non-fatal MCEs on AMD CPUs"
> >> +	default y
> >> +	depends on AMD
> >> +	help
> >> +	  Check for non-fatal MCE errors.
> >> +
> >> +	  When this option is on (default), Xen regularly checks for
> >> +	  non-fatal MCEs potentially occurring on all physical CPUs. The
> >> +	  checking is done via timers and IPI interrupts, which is
> >> +	  acceptable in most configurations, but not for real-time.
> >> +
> >> +	  Turn this option off if you plan on deploying real-time workloads
> >> +	  on Xen.
> >> +
> > 
> > This being in the CPU vendor submenu seems off. I'd expect only a list of
> > silicon vendors here. I think it ought to be in the regular Kconfig file.
> 
> Whether in this file or the regular one is up for discussion, but yes,
> definitely not inside the vendor menu.
> 
> >> --- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
> >> +++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
> >> @@ -191,7 +191,8 @@ static void cf_check mce_amd_work_fn(void *data)
> >>  
> >>  void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
> >>  {
> >> -	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> >> +	if ( !IS_ENABLED(CONFIG_AMD_MCE_NONFATAL) ||
> >> +	     (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) )
> >>  		return;
> >>  
> >>  	/* Assume we are on K8 or newer AMD or Hygon CPU here */
> > 
> > It can be made more general to remove more code. What do you think of removing
> > all non-fatals and getting rid of the initcall altogether?
> 
> I think such a more general approach would be quite a bit better.

I am fine with that, actually better to remove the code then to leave it
around and do nothing.

 
> > 	diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> > 	index 5fb18db1aa..a4b892a1aa 100644
> > 	--- a/xen/arch/x86/Kconfig.cpu
> > 	+++ b/xen/arch/x86/Kconfig.cpu
> > 	@@ -10,6 +10,20 @@ config AMD
> > 	          May be turned off in builds targetting other vendors.  Otherwise,
> > 	          must be enabled for Xen to work suitably on AMD platforms.
> > 
> > 	+config MCE_NONFATAL
> > 	+       bool "Check for non-fatal MCEs"
> > 	+       default y
> > 	+       help
> > 	+         Check for non-fatal MCE errors.
> > 	+
> > 	+         When this option is on (default), Xen regularly checks for
> > 	+         non-fatal MCEs potentially occurring on all physical CPUs. The
> > 	+         checking is done via timers and IPI interrupts, which is
> > 	+         acceptable in most configurations, but not for real-time.
> > 	+
> > 	+         Turn this option off if you plan on deploying real-time workloads
> > 	+         on Xen.
> > 	+
> > 	 config INTEL
> > 	        bool "Support Intel CPUs"
> > 	        default y
> > 	diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/Makefile
> > 	index e6cb4dd503..c70b441888 100644
> > 	--- a/xen/arch/x86/cpu/mcheck/Makefile
> > 	+++ b/xen/arch/x86/cpu/mcheck/Makefile
> > 	@@ -1,12 +1,12 @@
> > 	-obj-$(CONFIG_AMD) += amd_nonfatal.o
> > 	+obj-$(filter $(CONFIG_AMD),$(CONFIG_MCE_NONFATAL)) += amd_nonfatal.o
> > 	 obj-$(CONFIG_AMD) += mce_amd.o
> > 	 obj-y += mcaction.o
> > 	 obj-y += barrier.o
> > 	-obj-$(CONFIG_INTEL) += intel-nonfatal.o
> > 	+obj-$(filter $(CONFIG_INTEL),$(CONFIG_MCE_NONFATAL)) += intel-nonfatal.o
> > 	 obj-y += mctelem.o
> > 	 obj-y += mce.o
> > 	 obj-y += mce-apei.o
> > 	 obj-$(CONFIG_INTEL) += mce_intel.o
> > 	-obj-y += non-fatal.o
> > 	+obj-$(CONFIG_MCE_NONFATAL) += non-fatal.o
> > 	 obj-y += util.o
> > 	 obj-y += vmce.o
> > 
> > ... with the Kconfig option probably in the regular x86 Kconfig rather than
> > Kconfig.cpu
> > 
> > Thoughts?
> > 
> > Cheers,
> > Alejandro
> 

