Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id x/j6C1EOj2lfHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882CA135D00
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230720.1536184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZe-0000DM-Um; Fri, 13 Feb 2026 11:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230720.1536184; Fri, 13 Feb 2026 11:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZe-0000Aw-RN; Fri, 13 Feb 2026 11:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1230720;
 Fri, 13 Feb 2026 11:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqrZc-0007uv-OR
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:43:00 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 253aa1a6-08d1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:42:59 +0100 (CET)
Received: from SJ0PR03CA0360.namprd03.prod.outlook.com (2603:10b6:a03:39c::35)
 by SJ5PPFC41ACEE7B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 13 Feb
 2026 11:42:55 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::c5) by SJ0PR03CA0360.outlook.office365.com
 (2603:10b6:a03:39c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 11:42:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 11:42:55 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 05:42:52 -0600
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
X-Inumbo-ID: 253aa1a6-08d1-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMDXjPvVkSKAPuMAZ9QFjCqur+LCwW497svVndSf0hv8AZQu9DntVz3zUdgNk8F/hNsGS0LnKg0I9J6IYkXDIvInKomNQBaqfNJH1mk8dDYPAbLompSp9kDtU2HXt6EDTGAPqIYYa6KiNbJwBKXM47u4P7msFhSfJykuOm2zFmS8Qw5czN5B2YW+RyUGAvikUBvAfHagq8QjPNvQxaTWJvnL08CREQkDx0K3M/Yej4t2zHpXcnKHW79qUwCGdFw2WkfmaXCGWBs99ITeJ3rTpScSeSZQE0SaBamtZPIAb2go3QOWBEHzjI+HFehGlPqO8E8ogR8dqgSl/3h01dNNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBqdjJJWfXtoJEzYSSAEqpJRKMsq/TtKBIgS2SAY1Gc=;
 b=CDE4QIowNieUhDIhAdH7bpJrcPOk8bZZkQMKUtfmAenDpw3R5B0WJFtjOKzZY+weaUG8XPm6YiKmNT8DyAh6RE+vkWA8B/07rhexGT7mqybdJJMEcYMzfsDe2aKHyDtYVCgzf+O7zZV23PNwzS+vcY+pGgmh1Lqh50m6ie46PWnegAMydgqJkL9ckAKmZ8+qmcoiS60oQls2x0PZMtrOLQSXFU8hpGV2yfLNIYGjxGkfGO7mjwaD2qXVg6lVyvkHefMIZ9ayFQenZ0pqjvhw9/6iLX5hUXue4Mo3XULCA01jy7xvDWDQGn0XsL2PLZAlO1om8A2e6CxvW7LnPpEjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBqdjJJWfXtoJEzYSSAEqpJRKMsq/TtKBIgS2SAY1Gc=;
 b=JITUKlKGOtU5UytyQHlHpSo5UYwPi6J58w0oF69p3RVsA7UM9M1PZHlFTHc5eCSCiNJIXgbfSaHMWrTTGNObFSh4UTKWpyPgI0ajgPLNSYnFT+KFTnpbx/ZSQ7E9ncGM5KoaDZuGqR7bk5VlITiNUa6wPVxN0NnbHrEWqCv5e3U=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v3 3/4] x86/hvm: Remove cross-vendor checks from MSR handlers.
Date: Fri, 13 Feb 2026 12:42:29 +0100
Message-ID: <20260213114232.42996-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|SJ5PPFC41ACEE7B:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6a3f37-cd52-4d8b-579c-08de6af5072a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KDIFz4dgTSzkoY/CmkrDlK0NCkEVkUF2wL39xWEwy7BRRDtWBNDsvT2WKcE0?=
 =?us-ascii?Q?GZeGReVzsAfsTWt+pdsx2WFHq31CI166z8S7ufnhqOa1Wf4nwa1vO38oh3i4?=
 =?us-ascii?Q?jbRVSvovv0G0FBhc7spnpFoR66YFWPZXuPRpvXJy8YtKSVn4h3J7P3l+nwPi?=
 =?us-ascii?Q?sRt+wP4R0TngYv0HPVNegOvbVjlhVcncbuHNLFnWxiebDXNvwhX1PK3CMuBv?=
 =?us-ascii?Q?fNf9phlPT/iPH2U1dBqPu0c0dN3bvGR8K+B1GXL/RKW90x3RwA26+jZhVG1h?=
 =?us-ascii?Q?m3g5YuC7U6LZlt/jYfsCH3HIffD9MYe5jB1Jz0TKvAGkYxv8ZC1fEK9VVk8/?=
 =?us-ascii?Q?zwL7UvBjSlDT8sCVEq0kog2QTjWvWv0jKOVM7C7wKT5nV08G40uK1Duc2yR4?=
 =?us-ascii?Q?V9tHxlclchIbp2twH/DIAZCv3/nqQl0iEp30XnHEW/4XXyOQ6Sh353LDMjgW?=
 =?us-ascii?Q?XENCsR3aEVXgJ3dmy2MgM5XimLtIiu6LtqoJogP3Us5vlXJO3da33Ub5+B9U?=
 =?us-ascii?Q?X2eP4jKC04KRbL+QBlfkJ5AA5rRbJDHbouGURSCiYO5fHgOn9kE5mwcBl7ta?=
 =?us-ascii?Q?tANzT4LhZwMhfpYzSRFbUI/BZMS1qGxS0XtCnb3RziZ4ar+9gWFWbOXsHS10?=
 =?us-ascii?Q?tCwyMMI98eionW2qnVZwnYguo0tHXvVvHDoxr2ybyQ5A58ffSGDeLsJGGeZv?=
 =?us-ascii?Q?KfcykGlY4knCx9gPU2H3li83DiELlMZ2Ai7UEVwXCGoUKRMizBGhM+purohn?=
 =?us-ascii?Q?H4ecWJOvaNuSfwewtyDBJ7O0HMC05uveUHZaN1kuFC3fykj2G3YwdSJWiXB1?=
 =?us-ascii?Q?XdODoqVAcn8Vw+rJCh24VVke394d5Nr1heVZ6VDuvpvGJVu+UKR2Ac1uLS0g?=
 =?us-ascii?Q?Rtjyo2XDbgSj1RJ/KLvU4Jq2RNACfibOwabnVwDQzAoae0em8b4dFDyMCLSn?=
 =?us-ascii?Q?LNC6livp4tm6HAHk+QKoJn451w88puq8Aco+wWpHBxqVSptQh1HsOOuhMdAt?=
 =?us-ascii?Q?ZVzs/wk7lLQTVi4XnB0bn5rfhC+HvaKn1Q9Q3uvc+mwbK/3mMQekAhizZ89F?=
 =?us-ascii?Q?simzACs0elE1M5/9gXTkOeqY5JS6iphlqwLy66sCQkcua71LSxlP4aHpvwC3?=
 =?us-ascii?Q?FWMKLAGoPW2f7/G3wPAgvvnmdYOGV4cGVhhwUFnrdndPYoNiRHzeGSRkh8KJ?=
 =?us-ascii?Q?W8YnfcZQB/9kXaZAKOTzNOaEvWi1upift/P1S8XSLsBANt8oRhG79wAMhbOT?=
 =?us-ascii?Q?Aiva4VnZ8anWsi6+/zcN6TpSHJDpWqHn6mryH4FzTHewa7ThDXY7ccgCzf8F?=
 =?us-ascii?Q?mcDP9Fe/ywA1kISae0vII7528r30mZH0GIqY3RQ0nhC09pHPNRsVrGzM7vH+?=
 =?us-ascii?Q?+TmMyAxYjYFNfwivS9AHC7IVQs1vl7/n73LQZF4CAbMQFYLYuWatxAPTVh07?=
 =?us-ascii?Q?+mzKjWvcEjZGCXvjzKRfaEDtqMqw+1xUUPZEaLTdxGj+P909h93Ffd5txgFE?=
 =?us-ascii?Q?Auw6YSbT6NbjneC3LUrP/NjzIC556ROo5aAMpWCn6xj8dgLGvOiB1erWWvz/?=
 =?us-ascii?Q?iAUQTUWWwKIw6RCS4LOBFK4gaqHWesOD3owJtJGkiTG8+1t1TOtjwzbCjz3W?=
 =?us-ascii?Q?Yv3DYyj9pNZppmTmakLgaadCuqdIoB3/oZRPOGyT1MIX8UCjsw0RUzh3PXVS?=
 =?us-ascii?Q?YeUnCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wR6H6nmt6X/lH/ILf6PeoQFyryty2tPWEq670cWvL9tmhTS7vSBClnoN9g1Eho5zzZNfHATtdLGyBKSH/2z57STRfQegAHRUhFhMawksDo26CsSC6TC5N3WLK+VJw/AF7k9wKvfNyTZEWKX5psY7kKx+A1+xrejbRZXqVTKgLp223+AMZ9oyuHJvnzrJD73XoMdlM9lM5st5EbRw5XQDH1QPTKUSuJeJO5Glf2fJsPJdb+UsrNFM/OiQyswQyXX1zfULmCeRrqKcuWkvJwEtQSDLxJtBo3xzdBqG0Q6VKhah4d7A9KQl7ClLnLxLHRAbXStZob/dzylGWrbv9qveUGVapVTtfoGrEobOyrhYsWUH54QnCtEEPr562zsAG5vHizEOQzdS0RnXSlNBXCT7zDnFvVxv4q5xnnpgRIM+A8tbVKWLhPkyo2qjEC7KTuAL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 11:42:55.1833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6a3f37-cd52-4d8b-579c-08de6af5072a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41ACEE7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 882CA135D00
X-Rspamd-Action: no action

Not a functional change now that cross-vendor guests are not launchable.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
v3:
 * No changes

v2:
  * Use boot_cpu_data rather than policy vendor.
---
 xen/arch/x86/msr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ad75a2e108..d10891dcfc 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_IA32_PLATFORM_ID:
-        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
+        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
             goto gp_fault;
+
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
 
@@ -189,9 +189,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * from Xen's last microcode load, which can be forwarded straight to
          * the guest.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.x86_vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
+        if ( !(boot_cpu_data.vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
         break;
-- 
2.43.0


