Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDNkOQTPhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D21F5B21
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222286.1530312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rm-0004k0-DG; Thu, 05 Feb 2026 17:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222286.1530312; Thu, 05 Feb 2026 17:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rm-0004ec-8C; Thu, 05 Feb 2026 17:10:06 +0000
Received: by outflank-mailman (input) for mailman id 1222286;
 Thu, 05 Feb 2026 17:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiMP=AJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vo2rk-0003It-TG
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 17:10:04 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82a07710-02b5-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 18:10:03 +0100 (CET)
Received: from BN9PR03CA0461.namprd03.prod.outlook.com (2603:10b6:408:139::16)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 17:09:54 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::20) by BN9PR03CA0461.outlook.office365.com
 (2603:10b6:408:139::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 17:09:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 17:09:54 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 11:09:52 -0600
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
X-Inumbo-ID: 82a07710-02b5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKBUMpcXB882L+w4U6c/m0A68oxUKJgyABnfS3tYhhrbRC8QVIthHeNgfb3CdVKNFuyXgcGmaqVQWTEhfdSWbNe2cxhcim1c5DBxxYzlSdazKrEsGBrSWzkJ2n6FAbxmFh7GLbsRxD/TZXUia+okFOAXBslmNyjFQFGxww1JjYHaOn0wWp2M8LEy5DzkoHd5Dj4qLSNdI9GhQmuqOYFbabaJf/AVp4KEtNjX8mcasmLMonSoFwz2pMZelw6KST0RweUre41jPI1YJgdcs/27HlxRr8yBfGZhvyDc6PmY31syq8363/WPRqufb0fD1H1SIhUNvJBkWJZKooTvaEUV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBpFBQTDjfYGESALWpvq1K9sdPU23kKe6+u6O2nDSkc=;
 b=FmFMNqcUbC4PAbMtyhi2XzJB3SOIETY6/aimC2utr7GonogxnMXUHnxQGaeG76I83n7kTnx7dMnuOaY/la0Wavr1NwM6ne4/Eq4ERSsgYvIO6hFBMDCzr7OF0crTQJ/5Xa959IAD9KwvICAWTjVqtKR06FfbvzxhQ9ewCluuJ2y+B3y8vx5K48ejjyRfIX6k1xF//4U8S6KO2KdnhsTL/m7YfSxy3ppTIFpx4QVdMlipOofMZrSKRV5IGg2T2cutZNHWVZlSikQctVAY63NCCjXP2eonnAa7oVIf/qLV12MK3xjXy45Bt6xT0cbfog3dN8VfDqQ9VS7uEaXPTaLl0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBpFBQTDjfYGESALWpvq1K9sdPU23kKe6+u6O2nDSkc=;
 b=R2mikabrClKSY/POgWnxWcq+fvfWcf5fu4e/bfLPxEx29eweOuiclmDhpFZRqLVKHSMdYKKtRZo4DbCnXC3NC67xTCPROgqAwVLYZGeZ14yjGL5ebsw7FbULRyF9GBtuPA98/DzRSq+pijnGL3+pHYpeVMF44TK20w+Hd+l7ifY=
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
Subject: [PATCH v2 3/4] x86/hvm: Remove cross-vendor checks from MSR handlers.
Date: Thu, 5 Feb 2026 18:09:21 +0100
Message-ID: <20260205170923.38425-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
References: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DS7PR12MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e2c9d8-8ce4-4777-4849-08de64d961c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ktf/zgpQEaD/coL0Q7aICyna9c83yQOWmwZK0BXt9cmoLIcwce+5wfZDfY5?=
 =?us-ascii?Q?D4GUDMvJIQBpAsEw2m9+Iko2H04mvotTQ584NG12Y+C5VDXIcTh8+ovuzVVl?=
 =?us-ascii?Q?FRrHvnOpdZB+xaZ4I+ZTnoFZQfFBNVdwFYlLdXYZAmKUPfxTQZhkL1CIIDl2?=
 =?us-ascii?Q?tCWKerU+v+WxiwT024eyNP/3IXIKqWQ9taBkKnkUdJ0lwFSw0ThLPOKyi+uE?=
 =?us-ascii?Q?sksid0czvWnsPAOs1hpL2WOVKVPLdGAm7xGUv5AYSL2I6SK3CfwVAiRnUSv6?=
 =?us-ascii?Q?D8YlRZ4vrILcpHlmJcYZzZPqkpHH5z2BupvgfM8o1KwwO7hrzxQpDiJgAYbu?=
 =?us-ascii?Q?itK+6GNu4ALwCynZG+njmuoYrpPq1ZiMiYPSIeEn8ycobRDhV3IGKuwARYyR?=
 =?us-ascii?Q?ky3L1BEVOPsAZ+1qBhkvEurrMQmuBnsCS8yxVrCFzbBzWgP8GF1/J2DPxAFB?=
 =?us-ascii?Q?bBHdYyITjcOsFbZfprd0x/ztSn2cEk/HqFopulz7cdEL63oOo3w81Iu6d+2K?=
 =?us-ascii?Q?IuvGOvL5fy9AL/jl/KD7r1AxcDPJnf7pYRZX2BaWXaFSA8Y2H0mnIa3j7VkL?=
 =?us-ascii?Q?kcPMG0gc9Eq9me+80C92H3iUGp7Gd/GuHv0+wMvXhTB6nkFebV2r7Rb1HfOZ?=
 =?us-ascii?Q?5lDOdkKqG0o3vuz5gLVMHtdurTskVONq5xlcxJZ7rNcBV+WREOAum789XotX?=
 =?us-ascii?Q?PCtH3WgYahTEMTXeb13kZHSvtauG/fVg2TeqNiqUeKN0wNUbJnhBRX+EZxCS?=
 =?us-ascii?Q?0w5AQxQLMmTjTeNgf8aO/Di/XHC9AOZpWrMIYUIt7XFHsUHie3siCWAT/Fef?=
 =?us-ascii?Q?9zE9mhRRrPFa4QAbuIig5nHlhn3cCgpK3sU0vZvD9XQ1Je53r42fEW8i8cUY?=
 =?us-ascii?Q?O4hsDDeMVAySBYCykB2uQxurpjBMjo4gXc+SEagm6WRhTYIwCW6fc9tSAtpm?=
 =?us-ascii?Q?UEYg2oGiekO3qO3H2ginupmxcocjBSQpYzkfg1KhMltc2z3gMa4yF6MFvJ0z?=
 =?us-ascii?Q?ZeYMajDynmM6Jnn9Ak1QeXtXlQCXr05SM/8UNod1U8+yDbzc7RyS4ih1dRJz?=
 =?us-ascii?Q?4GcT9wJVTlHN+biMqX3wBldcTMm+QtysElRtb9QrmQEMGidlcRrKKbT/PcOQ?=
 =?us-ascii?Q?GDZPuhQkKCwVdo0ttjoQ+1r0byoTOPXyXMWh/ZkNYsYduzSpRRFihDS9LhVK?=
 =?us-ascii?Q?SFSdy3ZVwkBVexARn53mJgEEF4YT+z4GfsB5ZYKoODqrfS//mYDitvLCz5TQ?=
 =?us-ascii?Q?a38MaTV9tR2BOxn+WXPW4G6vkepid18GO1OOv4VkAbEH1VTiFHEQjAFhsBf6?=
 =?us-ascii?Q?fpfEtqQbbRkOdTe6t8v1sOK/m7a1YFjbKEQDMXEa53JYqiHcvbXVOeoJ/dL+?=
 =?us-ascii?Q?NMGru6vnYae14918Al8P7gxnkgEJ/h3EI1db0yQagn76oklrFjZJeT/2LTFt?=
 =?us-ascii?Q?RTU/auR3mBkaBXWqg71Ukw0xundNqi0DiVAS4CidFzH4bLfqHs9K4xwhy0Vt?=
 =?us-ascii?Q?jQOCY6DrwrWxUpTLyi0SOe/dzaEqnz+kqhWJxF03e+uzUZ08xQvw59O5XMfQ?=
 =?us-ascii?Q?hv75tq1LjyQNXjOYaLdKuTTMFeOqPJOwq+y+Zb0yeLpQHXajCaA2/71n50Yj?=
 =?us-ascii?Q?2RHKo+debzbp6ca8jxzFaqs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OsbTs9mhF55wBxUtKHOLlekRZ2+NFUpStJcV66c31BlajeWsnmK0/mzYd58HDBQtZKQzJRbnNQnu96qu6MfZKqIsFsK8u946jr5INvex4ZBaMK13Bp30OZPc6l9Fo4lCP65Y6sM80Crgr0e4ZJXcMjnAoaiz9m+dbNll22Fimq/wJOGD96benW+mB+eql7j/vIiv/Az8R54lrgtTpUCZwhUuAbBtvNjMJYcZ1HCvh59CscXXyKI1TBqpNVPCxZvfZBF1cIjvFW51NYbO9jnx07j8fI9QYHssNA3RDY0cgAGbv3SCHjzeSc53Ams2luQHPNC3gl325J0egpgltfvUXicT2gf0BfY0ZoFPeP1eJ0MyWeN8JYGGlVZFRUXbaHssSS2JH/vSUjLDc75UEFklN7qmUF9VjId5ZU7uWsKwaBMLn/wuHBZLSFfWIBozZo+j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:09:54.3501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e2c9d8-8ce4-4777-4849-08de64d961c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 95D21F5B21
X-Rspamd-Action: no action

Not a functional change now that cross-vendor guests are not launchable.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
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


