Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFmCAjEUhmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:17:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790CC100272
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223576.1531066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOWY-0003A0-2u; Fri, 06 Feb 2026 16:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223576.1531066; Fri, 06 Feb 2026 16:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOWX-00037s-VY; Fri, 06 Feb 2026 16:17:37 +0000
Received: by outflank-mailman (input) for mailman id 1223576;
 Fri, 06 Feb 2026 16:17:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVQ-0005HU-0u
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:28 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eab457b-0377-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:16:25 +0100 (CET)
Received: from SA0PR11CA0013.namprd11.prod.outlook.com (2603:10b6:806:d3::18)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 16:16:19 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::79) by SA0PR11CA0013.outlook.office365.com
 (2603:10b6:806:d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 16:16:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:19 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:11 -0600
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
X-Inumbo-ID: 2eab457b-0377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIyiPH+CPOBLsUzbmpdINdjuV0m8EV2i/dPF7hnA8c864TwxMzW+55dubtBoWPGM6NTokdWLR87jQvP8uT/xKrEw3sYXJH0n1g85TXcwDkE5YICLVZHLeE53jv3bEHCZPybQsqq8ro0bL7VjbeNyY97U/2/Jdpkuo5KQmotGcB6RQA9eqpqs6Xm9D47ro1PtXUTZey7eSQjOZZhzoSnJxhhb2RXaHna9fE8DxS9NRKgDTAByFPu7g0IOzSv42rn6HvGy9D5R1qUoWu05P3vlVC8BnEvkZRd4iF+YzVeQSop6I6cuOlh1f29krNCnB5+Esf8Yn0X//TP0KC52UgoUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbzue9B2hVLt1UeDx9oOjDhE9VK6iMJSqn6kMjLi+z0=;
 b=mTcdaP4IXuqF6foGyey52jGKj1B/riSSi0XbId6s9b6i7cIuno+89RnO1IPfZ1UeNx4IHsQzKkWBQ14dKjLonSqWskt20uBS34VXoBZpaU/QyDmocJMlRaxSG8/ouOSB4/NxWjxZkDc+1duOQl96pt4On3YUF8y17vFES9rc3CEwBx05kewd8ztQuD72XYpLBxLQHPD9yFZeqepH+7IbITgTkniuDVLAkQouaUmzJiBT8IquANS3euE+CRld/H96y9F8TRjYZYdB+a+jMDb1qopVYS0UreNfFZl7AXcKh292a/RCN8ZmOXyims/SuBLF35g+55TeTGPPfyOOSzQ4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbzue9B2hVLt1UeDx9oOjDhE9VK6iMJSqn6kMjLi+z0=;
 b=0i7uSwx5ZcaAa7GZN72ykDQLOnEzKX/H6P2L1Y9b37auftqSN9WPaDNLorXd4lriSJdm/TzIll7+OkoOa/nWLmYiEYjyEOi0+HaAr0f7X9rKMemE6Kv7WdNhLNSjwpeArQIfacXPegKdFcAkuXY2J3aj+s4y6DmbWQ0RDMqqQEY=
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
Subject: [PATCH 11/12] x86/cpu: Migrate vendor checks to use cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:34 +0100
Message-ID: <20260206161539.209922-13-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a7baa9-5a38-4165-8c3b-08de659b1016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ut4IXevdK8KcHm+85bUlrR/X9r4BYnhrvkY95VkBCA3ks7IO3JxMVm1SciJ?=
 =?us-ascii?Q?orPjeAS5RqKts5+xx02rhLhIHcTv7YqF9ttacifx5VRcI8MXDO2EPk+Acvfm?=
 =?us-ascii?Q?ZIYKnLIQYrOMFUUJIpDFe8Ubv2dtrveIQiyjQaeyipxnDIkRVzMTffdQo45C?=
 =?us-ascii?Q?lmYBVFmmNX4dsHbBEHyh42mrcZC/j2BcLIsF5qWxZjt+5NTBLTLXZ+0MnQVh?=
 =?us-ascii?Q?MD0P06hJWbcSWb5+81SgSFAYhtSMkHRd4Dv8aaUmtRyMfwZ4TjZWOdA8vGnO?=
 =?us-ascii?Q?jv6NSUrrFdmpUZWLmyavqtUqk0qUe8INgorHyNjVMiasPozp9Fr2FEpXlwDU?=
 =?us-ascii?Q?Epi/4elRyK47dah7RqkAMepJRxXjmvumMD7quRCGaMKG7xgFgTx+T14eQ3wP?=
 =?us-ascii?Q?3YZgQNNEmE8MYzUGPJDuV2SJJop98awakHL1EeRCrIRpFUXviFCuEcyJs50T?=
 =?us-ascii?Q?+CWe+5+a5j9hntCNJ6paHd5F4iQxl2Bvxp6pZz7Fwp5JqvB8DkfCz4T8AAyf?=
 =?us-ascii?Q?OrDP5YWko+6BUDCi6WBqg0kxFGzDF3Go96xjnV9RLD15REuOb6vebBV6Rc3d?=
 =?us-ascii?Q?sPNk1NgkRe8FxntVQcr6XfvHxBHtAnWAm+/1tpj+tEOq1vontz0yFfUzWHG0?=
 =?us-ascii?Q?vbG2wLs8Q7bp8POCOpJTnKeNEydYMKgYaTq9+IaYeQmw29x4fvv6pYE4s+2V?=
 =?us-ascii?Q?83bqIH2UoN+b2/S75GmZKuqCMuekLle8sPzygVfdoAFuTmD6Cx8Hkz5C3S/L?=
 =?us-ascii?Q?YZqVPUu7zubyIIaPosjmrpQlMYCsgiRcZmwmUkkjfbkmUNHzs36RkPDxS7Kl?=
 =?us-ascii?Q?NLLItsS4qdqgqSUhSVlThureMlokkOUliM3RFSgGJjqUDWTieUlxl7d4xZzP?=
 =?us-ascii?Q?9yu0WBcIU8deDxj0o5EHfSL0TGLLIJP2qcUZdU6UgpQ5S8LWFtLB2IawhBd9?=
 =?us-ascii?Q?JjpOcu1s8lxwDnTmoDgth37aLiOm8ekwuxCxVYMTYEuYjsvE+a86RphyUb3Y?=
 =?us-ascii?Q?8t9UmhU0dRftPvsELN9wg3lZCUb8TQfaC1vjkU52t3HALnA6VHeQLCuvsD9k?=
 =?us-ascii?Q?mRRMuuZXHGBYT1ZBWmPi7AyVIDUHhgJ/3IyZYlaRvKItvyjjUchPg2cK+vJX?=
 =?us-ascii?Q?hPAegx+BXU2RkkfWvJ9Hd2dNtuc62u+YYbe3VJWB2obhJMZKCvvdomnzpi30?=
 =?us-ascii?Q?kKSTenXkF0LV59t492RuTwwNaVXAGI4y5FDlnh6v09Tq8MFw+SPEmodZw5y2?=
 =?us-ascii?Q?MI8rjpt/vOIVUk67wNaq/HDEl3AeDEDsOPEMpqINFNDEceqSYIhdk24r3Dni?=
 =?us-ascii?Q?oaBuWO7sSLlaeOV3uLjygsjerP1r4tBpNg6omOv23kJW3OrVDS3cn6yOvWit?=
 =?us-ascii?Q?O2Hgp5Y8vMOAawFW0oCP8CF5r4hyQ4pr6PjwVbVbxuRH2UbVHTWEIbqsk570?=
 =?us-ascii?Q?LlzEdF4D2OkrfxKE54ahbgA2IVNUHWZLux7tSYWlGskTipKCsKUzsKMIox7F?=
 =?us-ascii?Q?o3mkRuZD/+ja11oyy+5IsiHRiwsqie62dzlcffhl+AnOmiKCzG/UTGm/zl9a?=
 =?us-ascii?Q?Lz1WLxm/6HwDJlfbsukwCpYtsuV2P2uvYhO0LY0DHf3yAgV/M4Ri0WYyNkyR?=
 =?us-ascii?Q?zspBZ8JqyakLK5WluTvINI6vnMloMvA7jAIhaTYjg/9UgNqZYGIrpifakQjS?=
 =?us-ascii?Q?2cLWWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BleTiUfR805OBNmIBC8ktguyPHLf7Mo/gJ3hM1Ckxhe/1BXbgZB0KTnYRUYgsGtHuZRTtmXRWX8Z9rEgnavPO1d7qafqrf6bCVoJmbxjqX8xm8l8tNvzC4fBZv5LdgPfXv7b5KFVw5W8jN3tBOi9iU5PFZlWuHTakLxQxi5WlhOlYwG3tXhJXJ82zCztWY52LZ7Jk7LYuwPqOULPFc8lqkdbfHwv0ZZwtM5zt50AorGa6UbhfjM1EWFxH8c11NOAD6XpcwhCL/o44qsElCTT61QBOHhODskhgNtC9cy6ois7xReKGfBfeAykXAExp+Cy0nnhzNVyzCrsgOd2lPVCKkX5mJZS/jX/x2vqzKCJA34CQy+kzj+6Ym13TX8D+OgnXoHJX6TLQ3M/sbZGce47UhVrMPACWWlF9qt5DKBiysu5NyUw8nlsG82ztDfPIiQt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:19.6742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a7baa9-5a38-4165-8c3b-08de659b1016
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 790CC100272
X-Rspamd-Action: no action

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/amd.c             | 6 +++---
 xen/arch/x86/cpu/common.c          | 2 +-
 xen/arch/x86/cpu/intel_cacheinfo.c | 5 ++---
 xen/arch/x86/cpu/microcode/amd.c   | 2 +-
 xen/arch/x86/cpu/microcode/core.c  | 2 +-
 xen/arch/x86/cpu/mtrr/generic.c    | 5 ++---
 xen/arch/x86/cpu/mwait-idle.c      | 5 ++---
 xen/arch/x86/cpu/vpmu.c            | 3 +--
 8 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index fc496dc43e..422d81472e 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -327,7 +327,7 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	u32 range;
 	u32 ms;
 	
-	if (cpu->x86_vendor != X86_VENDOR_AMD)
+	if (!(cpu_vendor() & X86_VENDOR_AMD))
 		return 0;
 
 	if (osvw_id >= 0 && cpu_has(cpu, X86_FEATURE_OSVW)) {
@@ -418,8 +418,8 @@ static void check_syscfg_dram_mod_en(void)
 {
 	uint64_t syscfg;
 
-	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
-		(boot_cpu_data.x86 >= 0x0f)))
+	if (!((cpu_vendor() & X86_VENDOR_AMD) &&
+	      (boot_cpu_data.x86 >= 0x0f)))
 		return;
 
 	rdmsrl(MSR_K8_SYSCFG, syscfg);
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 6f4e723172..9a6fb90fec 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -436,7 +436,7 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		park_offline_cpus = opt_mce;
 
 	initialize_cpu_data(0);
diff --git a/xen/arch/x86/cpu/intel_cacheinfo.c b/xen/arch/x86/cpu/intel_cacheinfo.c
index e88faa7545..f95ed90809 100644
--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -168,9 +168,8 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 	 * Don't use cpuid2 if cpuid4 is supported. For P4, we use cpuid2 for
 	 * trace cache
 	 */
-	if ((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1 &&
-	    c->x86_vendor != X86_VENDOR_SHANGHAI)
-	{
+	if (((num_cache_leaves == 0 || c->x86 == 15) && c->cpuid_level > 1) &&
+	    (!(cpu_vendor() & X86_VENDOR_SHANGHAI))) {
 		/* supports eax=2  call */
 		unsigned int i, j, n, regs[4];
 		unsigned char *dp = (unsigned char *)regs;
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 90f10ac8be..b4c8264e27 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -616,7 +616,7 @@ void __init amd_check_entrysign(void)
     uint8_t fixed_rev;
 
     if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING)  ||
-         boot_cpu_data.vendor != X86_VENDOR_AMD ||
+         !(cpu_vendor() & X86_VENDOR_AMD)       ||
          boot_cpu_data.family < 0x17            ||
          boot_cpu_data.family > 0x1a )
         return;
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index ea0b35c499..ebe4d21026 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -216,7 +216,7 @@ static struct patch_with_flags nmi_patch =
 /* Returns true if ucode should be loaded on a given cpu */
 static bool is_cpu_primary(unsigned int cpu)
 {
-    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         /* Load ucode on every logical thread/core */
         return true;
 
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index c587e9140e..eab72dc103 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,9 +218,8 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-	     boot_cpu_data.x86 >= 0xf) ||
-	     boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+	if (((cpu_vendor() & X86_VENDOR_AMD) && boot_cpu_data.x86 >= 0xf) ||
+	    (cpu_vendor() & X86_VENDOR_HYGON)) {
 		uint64_t syscfg, tom2;
 
 		rdmsrl(MSR_K8_SYSCFG, syscfg);
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 5962ec1db9..8536bc97f6 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1598,7 +1598,7 @@ static int __init mwait_idle_probe(void)
 	const struct x86_cpu_id *id;
 	const char *str;
 
-	if (boot_cpu_data.vendor != X86_VENDOR_INTEL)
+	if (!(cpu_vendor() & X86_VENDOR_INTEL))
 		return -ENODEV;
 
 	id = x86_match_cpu(intel_idle_ids);
@@ -1816,8 +1816,7 @@ bool __init mwait_pc10_supported(void)
 {
 	unsigned int ecx, edx, dummy;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-	    !cpu_has_monitor ||
+	if (!(cpu_vendor() & X86_VENDOR_INTEL) || !cpu_has_monitor ||
 	    boot_cpu_data.cpuid_level < CPUID_MWAIT_LEAF)
 		return false;
 
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index b1ad4ebcf6..b79d57d0ec 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -398,7 +398,6 @@ int vpmu_load(struct vcpu *v, bool from_guest)
 static int vpmu_arch_initialise(struct vcpu *v)
 {
     struct vpmu_struct *vpmu = vcpu_vpmu(v);
-    uint8_t vendor = current_cpu_data.x86_vendor;
     int ret;
 
     BUILD_BUG_ON(sizeof(struct xen_pmu_intel_ctxt) > XENPMU_CTXT_PAD_SZ);
@@ -418,7 +417,7 @@ static int vpmu_arch_initialise(struct vcpu *v)
         if ( vpmu_mode != XENPMU_MODE_OFF )
         {
             printk(XENLOG_G_WARNING "VPMU: Unknown CPU vendor %d. "
-                   "Disabling VPMU\n", vendor);
+                   "Disabling VPMU\n", cpu_vendor());
             opt_vpmu_enabled = 0;
             vpmu_mode = XENPMU_MODE_OFF;
         }
-- 
2.43.0


