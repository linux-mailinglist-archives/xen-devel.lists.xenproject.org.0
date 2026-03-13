Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ06Hzc9tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7460287263
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253999.1550021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VV-0005kd-VP; Fri, 13 Mar 2026 16:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253999.1550021; Fri, 13 Mar 2026 16:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VV-0005hL-Ol; Fri, 13 Mar 2026 16:37:01 +0000
Received: by outflank-mailman (input) for mailman id 1253999;
 Fri, 13 Mar 2026 16:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15VU-00040A-IX
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:37:00 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da26976c-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:36:58 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH2PR03MB5271.namprd03.prod.outlook.com (2603:10b6:610:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:36:50 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:36:54 +0000
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
X-Inumbo-ID: da26976c-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQ/7PY4vtnUg1fkLeDaNUSml3FfDlbDbCLBcPeyuRBGo5voqIORNS4LamcFU4tNzI+vymhlNKfRTcWW8Wil4ozZrqPguUPhihP8X2EeLzwOggshf8rXikZy60+13GCPfYClh0ghA2TxjWFE+zcKosHcQoLI2SixU1AU8A4mVgKEXWLM9F20SoJQymWt6E6ApTMhT39XySJtnmiPdTfe4L6r/O91ndhXQfeoSWExoro9C8D9qivk6DZlSkb69AgUIt68NwXlG28MbWJps1lCl3r2dyE88HM5DD+uR2AgIDbL7PGzpkqLAwXSMPiGtr0f9GmEDrl0k+h091RNnTOzTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjEqapidBPBMCON99YM5//X9D18Zsigu9iVOPUrCt94=;
 b=whwarTJxqTv91pruyBqUe6GnYjnOKj6wtgGF74WubcJ9VyI8V/xfRsRDeLfW8o+Szuk+ZaMXt0gctT3O0TJE3uIQEUzzwoO/O7B7zI9QdtxnH0V5DDi3a/uluYzsyTLG2dObql7iMYuYr6afHT1AgeqS/9lPZdbHdzaY31/rWTzP7d1OcXq5WCD1dGwflh90sXEXJiOt4hwL9Ow0M3ZipdU0oXCIAh02dPWxCHiUR/iUx6a7w+rpFoeRbPAD6mNuCqgOdWuOI7w0eT9iglNBra1qiiPUpcCR8gewAvdlsTlCCUY6ABI9PorQc9oGuEDzDCN6ThwCYgD9F8PfUbHJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjEqapidBPBMCON99YM5//X9D18Zsigu9iVOPUrCt94=;
 b=eoHabhJzRZocPZBgTvVqZM01rVg6NSAilD/jneCjuXonCi+EeENBtTwWy2ek/k4IU8n3zQB1JgWkvkD48NnEJRt/VuiGDHeQ7b4Gk9QG1JIHzkvRFpGpPSg1rXvzRtCFv9M/yaITqX8LxbjHsiIAGmM8gXGyAawVj/nQv+uoEaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 5/7] x86: Remove x86 prefixed names from hvm code
Date: Fri, 13 Mar 2026 16:36:28 +0000
Message-ID: <20260313163630.1073019-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260313163630.1073019-1-kevin.lampis@citrix.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH2PR03MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: d536bb8f-6cf9-46af-cd7b-08de811ebc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pcLtY/ZvD648ObQVtI97ovr3dbVVy5nNFYQpmzXlKN+LxmuMwM8EHlG4FK75WtIdzfYBQ7XptYfDo68TXlMiagpl7sOQA5O5Lt3Zf0J0ukeSHgTLoHK/l8Ancbal3pwg16zWzyofZPhd52ISAZdwmU773/0Fwqd/PHQXSmo/i1drYaR5S9z9tZDuaGmYu1sXkw3UqgysqB2x2CMTS0T5lW5aG4Wl551lQtZae3OSPXXiJJb5QEeFh2Nh3l3WfUAwdF+8nWQnon8sF26uEPu7t8ms/E0EBuWyG921U5HJOzCyO/9AvzSXpbNmOiSWHLyyM0pdNJH5FFKslMdnF8VEkmTGzgnI5UeyQtBs627eaHAEp67Z272LHKYJ5G9FL/3kJlWKWX/A0YNE5wf885d2YRwLtQt/zf9YYVZmfpPBC1L1Qyjpgr8LzIRxf7yaqTHxD/dISGX5GusqhLVtlMImKLfnK/25DM/VswqcGuh/bhE0teP3TzEzE+M/nFuJfV/p2Qss8gWyd1u9dwc2I1cBDbrp3o/q3t/cKRKKV/Wuxn6LqEvC9TiO5wNbSq5N/N6NY+i+kZlSLLTjL3y1NUItJ47DTOdJzkrRbEZ3SKvpGxmRez/OvDszDjU1ip2KtgJW5JFZ+XiPJHo+sQGNkCxQc8R2H0mV2VA7PsmCYNDAzEHIjGiAnJ6uZ1YTfGjuA/wJrD+3n3RSg8ejSaxWkpiX1nCYakme31Hj5n2XykEk5sc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TXvnf4TYhQeI79tFgT+9jU3x2/8CBQn5aa+x6nu6B62BhW6/ejENd6rL++C+?=
 =?us-ascii?Q?ciTbKjiLiv+F39hshmFizljRe/3yLAO7eQDXn9DKg2gaQ9YUNTNLatIjKN6T?=
 =?us-ascii?Q?xYP6Xr0KJ+3kJOGnTcyPrwSFQo7etlYjc+kXm1JsmQlXyIhvvwLwV94pEgDh?=
 =?us-ascii?Q?puB/JDQQJbItlnZxxDy7cyy3IUA0U2ag8vj23xUV3eYv/eooPZ8wQPF+pzP+?=
 =?us-ascii?Q?hd8CrUScEaWmJ9Dz1+TTygG2/56R4e/nlZh5Xfm07n06mn8j/FstJYmr4aPP?=
 =?us-ascii?Q?BGnM+eJgW7z6CZwKnqGnEo13HHWXSOZ2vxxulrDvuXpc1Kar4NOiTV1AT6Ch?=
 =?us-ascii?Q?MPyjcs/Rasjn5FieBCpFz1xKp7Kev9XoIULlgGeQXGEpUekXH0s0Dh9wsZw3?=
 =?us-ascii?Q?SBBV3+AhBGQCk6s3sbpmBOu4mF9iXypZOxnxGUqzKwIAQ3Bdb0ETRcuOw5Cp?=
 =?us-ascii?Q?WFTe95yVCP/no8QIZFeblCr9soFkFJ9Hs/0iLnwwY6F+3tRTWEhYpe4IChP5?=
 =?us-ascii?Q?7RxTGLLyPJDIPT420Lc/be/5IsB5MsNP0ZuAc08BBnFb2GiUursn9kZlYbsX?=
 =?us-ascii?Q?Be1aJPLOBFrDw5d3nXiDvMnYtDV+YJcE5yoRDtkTmu9Uef4s6EmbF2jCuOBD?=
 =?us-ascii?Q?7N4n6+fBZNJyT0bBQlVWUY94t7xoUXwOwVAuKhD8XhvPyuE36c9TXxOWnMcE?=
 =?us-ascii?Q?5HvHY5uS3XtpcxuAjqN86kUe39RB7ixM2WytyHDpMqLODSS9uqo80LQuNBFT?=
 =?us-ascii?Q?xZSGgdZ2zpq7ireFc4QtLOaIDn5RrvBxyM+fHx5VQUBvmPxACDsRRHMSLqe9?=
 =?us-ascii?Q?Ze4f2Cc7VeO68NHVgMb1BKXIF35Fg5XzPByxArHwbIVXUOXTbtKLXzoPtlfh?=
 =?us-ascii?Q?gOXG0rzk81Lbp+q6pEeakdXvN3BYWnx8hvkT12mLHDRMvg6mhLm2jNX3ZsBA?=
 =?us-ascii?Q?MfAuVQah5wRHQA7deBP6Ymi0XLRTEq/4xrzHK3+jQhnURY2i1NiXqUYJLYSw?=
 =?us-ascii?Q?vSiergfbAzo+4pwvBf8w8ve8uPk06xvVlDISBxThBSQ6Js/KKO8uO+LsxNWZ?=
 =?us-ascii?Q?1GbkBkyqLY3zpwJW+fydOBBmARk5Kjwfr7UtzUDYuLBWjZGS7yjP6p7rw3oL?=
 =?us-ascii?Q?ysAornTOxgByiQHA2UOb+o/BxPshu2efPoF3QsAwNCb9H1KJl9xrbdN4n5xY?=
 =?us-ascii?Q?+C/wuVoH0dPDUS2Q17vKj55r/6cHC7PVZeW6UdhGvvk8YQouft4EmTqjkfQk?=
 =?us-ascii?Q?ULo9SBgZemfTk73QPMr4QPbxMxgtBItG22IzdRjRwk+qU4ec9eP9t4DsbLxF?=
 =?us-ascii?Q?Jj/jANG7kBu89/12tHsD4Lu8o2eoM4qvePq2qYkySPZfXgbz8qBaVOjcjn7i?=
 =?us-ascii?Q?Y93fZVCSJ7lNSjlU2zvse4K7gi7Nb5IjnUYDZh6iJhbwLp3O/55X/IJxVYpG?=
 =?us-ascii?Q?JSuFmyNlWFhZNJryuykrt5w1PW6HMARfH0R46vszAe1NbCn105pJvI+4eyPZ?=
 =?us-ascii?Q?e+Qq4umaTw/PkiLed+r4MTiDUGzmKcn5XZyvhIhiBJLJkErGATNoe+eyGFcW?=
 =?us-ascii?Q?7zIolprBUH+R5e++mOSBIrZVM+MrOQ3kqpuk/dM6geGPzKX1sLHKBTE24gpc?=
 =?us-ascii?Q?ZOhRi3PR2BjX1aFAWWtWt4tNALbHzvkehJSA9Ny+BrnqpuLMahFWejCvDlxP?=
 =?us-ascii?Q?m0XbSUTIjHelbHg21IZZy+o29gyL3TVTjeIFNaNu62YkJsRCnlhIIglNCnjv?=
 =?us-ascii?Q?kF9H2oKsyQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d536bb8f-6cf9-46af-cd7b-08de811ebc37
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:36:54.0910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxXOP35SiiaCj9nXP8iHQgbgarYx8HfAhyVkQtM/5O52PhaicC9y12vnaj24aQ7bZs3i5eN151MbV6Y+Xzgy2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5271
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C7460287263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Group Silvermonts, Airmonts, Goldmonts in the switch statement
- Restore Errata info in lbr_tsx_fixup_check() and ler_to_fixup_check()

Changes in v3:
- No changes
---
 xen/arch/x86/hvm/hvm.c      |   2 +-
 xen/arch/x86/hvm/svm/svm.c  |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c |   4 +-
 xen/arch/x86/hvm/vmx/vmx.c  | 277 ++++++++++++++++++------------------
 4 files changed, 146 insertions(+), 143 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..6ad52e1197 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3850,7 +3850,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
     bool should_emulate =
-        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
+        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor;
     struct hvm_emulate_ctxt ctxt;
 
     hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 243c41fb13..5e4d8b3c52 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -590,7 +590,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor) )
         bitmap |= (1U << X86_EXC_UD);
     else
         bitmap &= ~(1U << X86_EXC_UD);
@@ -1057,7 +1057,7 @@ static void svm_guest_osvw_init(struct domain *d)
      * be conservative here and therefore we tell the guest that erratum 298
      * is present (because we really don't know).
      */
-    if ( osvw_length == 0 && boot_cpu_data.x86 == 0x10 )
+    if ( osvw_length == 0 && boot_cpu_data.family == 0x10 )
         svm->osvw.status |= 1;
 
     spin_unlock(&osvw_lock);
@@ -1805,7 +1805,7 @@ static int cf_check svm_msr_read_intercept(
         if ( !rdmsr_safe(msr, msr_content) )
             break;
 
-        if ( boot_cpu_data.x86 == 0xf )
+        if ( boot_cpu_data.family == 0xf )
         {
             /*
              * Win2k8 x64 reads this MSR on revF chips, where it wasn't
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index c2e7f9aed3..d3b1730f1d 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
 #include <asm/idt.h>
+#include <asm/intel-family.h>
 #include <asm/monitor.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
@@ -2163,8 +2164,7 @@ int __init vmx_vmcs_init(void)
 
     if ( opt_ept_ad < 0 )
         /* Work around Erratum AVR41 on Avoton processors. */
-        opt_ept_ad = !(boot_cpu_data.x86 == 6 &&
-                       boot_cpu_data.x86_model == 0x4d);
+        opt_ept_ad = !(boot_cpu_data.vfm == INTEL_ATOM_SILVERMONT_D);
 
     ret = _vmx_cpu_up(true);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e45060d403..3d308e149c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -34,6 +34,7 @@
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vpt.h>
+#include <asm/intel-family.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/mce.h>
@@ -502,72 +503,74 @@ static const struct lbr_info *__ro_after_init model_specific_lbr;
 
 static const struct lbr_info *__init get_model_specific_lbr(void)
 {
-    switch ( boot_cpu_data.x86 )
+    switch ( boot_cpu_data.vfm )
     {
-    case 6:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Core2 Duo */
-        case 0x0f:
-        /* Enhanced Core */
-        case 0x17:
-        /* Xeon 7400 */
-        case 0x1d:
-            return c2_lbr;
-        /* Nehalem */
-        case 0x1a: case 0x1e: case 0x1f: case 0x2e:
-        /* Westmere */
-        case 0x25: case 0x2c: case 0x2f:
-        /* Sandy Bridge */
-        case 0x2a: case 0x2d:
-        /* Ivy Bridge */
-        case 0x3a: case 0x3e:
-        /* Haswell */
-        case 0x3c: case 0x3f: case 0x45: case 0x46:
-        /* Broadwell */
-        case 0x3d: case 0x47: case 0x4f: case 0x56:
-            return nh_lbr;
-        /* Skylake */
-        case 0x4e: case 0x5e:
-        /* Xeon Scalable */
-        case 0x55:
-        /* Cannon Lake */
-        case 0x66:
-        /* Goldmont Plus */
-        case 0x7a:
-        /* Ice Lake */
-        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
-        /* Tiger Lake */
-        case 0x8c: case 0x8d:
-        /* Tremont */
-        case 0x86:
-        /* Kaby Lake */
-        case 0x8e: case 0x9e:
-        /* Comet Lake */
-        case 0xa5: case 0xa6:
-            return sk_lbr;
-        /* Atom */
-        case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
-            return at_lbr;
-        /* Silvermont */
-        case 0x37: case 0x4a: case 0x4d: case 0x5a:
-        /* Airmont */
-        case 0x4c:
-            return sm_lbr;
-        /* Goldmont */
-        case 0x5c: case 0x5f:
-            return gm_lbr;
-        }
-        break;
-
-    case 15:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Pentium4/Xeon with em64t */
-        case 3: case 4: case 6:
-            return p4_lbr;
-        }
-        break;
+    case INTEL_CORE2_DUNNINGTON:
+    case INTEL_CORE2_MEROM:
+    case INTEL_CORE2_PENRYN:
+        return c2_lbr;
+
+    case INTEL_NEHALEM:
+    case INTEL_NEHALEM_EP:
+    case INTEL_NEHALEM_EX:
+    case INTEL_NEHALEM_G:
+    case INTEL_WESTMERE:
+    case INTEL_WESTMERE_EP:
+    case INTEL_WESTMERE_EX:
+    case INTEL_SANDYBRIDGE:
+    case INTEL_SANDYBRIDGE_X:
+    case INTEL_IVYBRIDGE:
+    case INTEL_IVYBRIDGE_X:
+    case INTEL_HASWELL:
+    case INTEL_HASWELL_G:
+    case INTEL_HASWELL_L:
+    case INTEL_HASWELL_X:
+    case INTEL_BROADWELL:
+    case INTEL_BROADWELL_D:
+    case INTEL_BROADWELL_G:
+    case INTEL_BROADWELL_X:
+        return nh_lbr;
+
+    case INTEL_SKYLAKE:
+    case INTEL_SKYLAKE_L:
+    case INTEL_SKYLAKE_X:
+    case INTEL_CANNONLAKE_L:
+    case INTEL_ATOM_GOLDMONT_PLUS:
+    case INTEL_ICELAKE:
+    case INTEL_ICELAKE_D:
+    case INTEL_ICELAKE_L:
+    case INTEL_ICELAKE_X:
+    case INTEL_TIGERLAKE:
+    case INTEL_TIGERLAKE_L:
+    case INTEL_ATOM_TREMONT_D:
+    case INTEL_KABYLAKE:
+    case INTEL_KABYLAKE_L:
+    case INTEL_COMETLAKE:
+    case INTEL_COMETLAKE_L:
+        return sk_lbr;
+
+    case INTEL_ATOM_BONNELL:
+    case INTEL_ATOM_BONNELL_MID:
+    case INTEL_ATOM_SALTWELL:
+    case INTEL_ATOM_SALTWELL_MID:
+    case INTEL_ATOM_SALTWELL_TABLET:
+        return at_lbr;
+
+    case INTEL_ATOM_SILVERMONT:
+    case INTEL_ATOM_SILVERMONT_MID:
+    case INTEL_ATOM_SILVERMONT_D:
+    case INTEL_ATOM_SILVERMONT_MID2:
+    case INTEL_ATOM_AIRMONT:
+        return sm_lbr;
+
+    case INTEL_ATOM_GOLDMONT:
+    case INTEL_ATOM_GOLDMONT_D:
+        return gm_lbr;
+
+    case INTEL_P4_PRESCOTT:
+    case INTEL_P4_PRESCOTT_2M:
+    case INTEL_P4_CEDARMILL:
+        return p4_lbr;
     }
 
     return NULL;
@@ -804,7 +807,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     int rc = 0;
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor) )
         v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
     else
         v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
@@ -3073,68 +3076,68 @@ static bool __init has_if_pschange_mc(void)
      * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
      * this time.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return false;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
         /*
          * Core processors since at least Nehalem are vulnerable.
          */
-    case 0x1f: /* Auburndale / Havendale */
-    case 0x1e: /* Nehalem */
-    case 0x1a: /* Nehalem EP */
-    case 0x2e: /* Nehalem EX */
-    case 0x25: /* Westmere */
-    case 0x2c: /* Westmere EP */
-    case 0x2f: /* Westmere EX */
-    case 0x2a: /* SandyBridge */
-    case 0x2d: /* SandyBridge EP/EX */
-    case 0x3a: /* IvyBridge */
-    case 0x3e: /* IvyBridge EP/EX */
-    case 0x3c: /* Haswell */
-    case 0x3f: /* Haswell EX/EP */
-    case 0x45: /* Haswell D */
-    case 0x46: /* Haswell H */
-    case 0x3d: /* Broadwell */
-    case 0x47: /* Broadwell H */
-    case 0x4f: /* Broadwell EP/EX */
-    case 0x56: /* Broadwell D */
-    case 0x4e: /* Skylake M */
-    case 0x5e: /* Skylake D */
-    case 0x55: /* Skylake-X / Cascade Lake */
-    case 0x7d: /* Ice Lake */
-    case 0x7e: /* Ice Lake */
-    case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
-    case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
-    case 0xa5: /* Comet Lake H/S */
-    case 0xa6: /* Comet Lake U */
+    case INTEL_NEHALEM_G:
+    case INTEL_NEHALEM:
+    case INTEL_NEHALEM_EP:
+    case INTEL_NEHALEM_EX:
+    case INTEL_WESTMERE:
+    case INTEL_WESTMERE_EP:
+    case INTEL_WESTMERE_EX:
+    case INTEL_SANDYBRIDGE:
+    case INTEL_SANDYBRIDGE_X:
+    case INTEL_IVYBRIDGE:
+    case INTEL_IVYBRIDGE_X:
+    case INTEL_HASWELL:
+    case INTEL_HASWELL_X:
+    case INTEL_HASWELL_L:
+    case INTEL_HASWELL_G:
+    case INTEL_BROADWELL:
+    case INTEL_BROADWELL_G:
+    case INTEL_BROADWELL_X:
+    case INTEL_BROADWELL_D:
+    case INTEL_SKYLAKE_L:
+    case INTEL_SKYLAKE:
+    case INTEL_SKYLAKE_X:
+    case INTEL_ICELAKE:
+    case INTEL_ICELAKE_L:
+    case INTEL_KABYLAKE_L:
+    case INTEL_KABYLAKE:
+    case INTEL_COMETLAKE:
+    case INTEL_COMETLAKE_L:
         return true;
 
         /*
          * Atom processors are not vulnerable.
          */
-    case 0x1c: /* Pineview */
-    case 0x26: /* Lincroft */
-    case 0x27: /* Penwell */
-    case 0x35: /* Cloverview */
-    case 0x36: /* Cedarview */
-    case 0x37: /* Baytrail / Valleyview (Silvermont) */
-    case 0x4d: /* Avaton / Rangely (Silvermont) */
-    case 0x4c: /* Cherrytrail / Brasswell */
-    case 0x4a: /* Merrifield */
-    case 0x5a: /* Moorefield */
-    case 0x5c: /* Goldmont */
-    case 0x5f: /* Denverton */
-    case 0x75: /* Lightning Mountain */
-    case 0x7a: /* Gemini Lake */
-    case 0x86: /* Jacobsville */
+    case INTEL_ATOM_BONNELL:
+    case INTEL_ATOM_BONNELL_MID:
+    case INTEL_ATOM_SALTWELL_MID:
+    case INTEL_ATOM_SALTWELL_TABLET:
+    case INTEL_ATOM_SALTWELL:
+    case INTEL_ATOM_SILVERMONT:
+    case INTEL_ATOM_SILVERMONT_D:
+    case INTEL_ATOM_SILVERMONT_MID:
+    case INTEL_ATOM_SILVERMONT_MID2:
+    case INTEL_ATOM_GOLDMONT:
+    case INTEL_ATOM_GOLDMONT_D:
+    case INTEL_ATOM_GOLDMONT_PLUS:
+    case INTEL_ATOM_AIRMONT:
+    case INTEL_ATOM_AIRMONT_NP:
+    case INTEL_ATOM_TREMONT_D:
         return false;
 
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to IF_PSCHANGE_MC\n",
-               boot_cpu_data.x86_model);
+               boot_cpu_data.model);
         return true;
     }
 }
@@ -3428,23 +3431,23 @@ static void __init lbr_tsx_fixup_check(void)
      * fixed up as well.
      */
     if ( cpu_has_hle || cpu_has_rtm ||
-         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+         boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
-    case 0x3c: /* HSM182, HSD172 - 4th gen Core */
-    case 0x3f: /* HSE117 - Xeon E5 v3 */
-    case 0x45: /* HSM182 - 4th gen Core */
-    case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
-    case 0x3d: /* BDM127 - 5th gen Core */
-    case 0x47: /* BDD117 - 5th gen Core (GT3)
-                  BDW117 - Xeon E3-1200 v4 */
-    case 0x4f: /* BDF85  - Xeon E5-2600 v4
-                  BDH75  - Core-i7 for LGA2011-v3 Socket
-                  BDX88  - Xeon E7-x800 v4 */
-    case 0x56: /* BDE105 - Xeon D-1500 */
+    case INTEL_HASWELL:     /* HSM182, HSD172 - 4th gen Core */
+    case INTEL_HASWELL_X:   /* HSE117 - Xeon E5 v3 */
+    case INTEL_HASWELL_L:   /* HSM182 - 4th gen Core */
+    case INTEL_HASWELL_G:   /* HSM182, HSD172 - 4th gen Core (GT3) */
+    case INTEL_BROADWELL:   /* BDM127 - 5th gen Core */
+    case INTEL_BROADWELL_G: /* BDD117 - 5th gen Core (GT3)
+                               BDW117 - Xeon E3-1200 v4 */
+    case INTEL_BROADWELL_X: /* BDF85  - Xeon E5-2600 v4
+                               BDH75  - Core-i7 for LGA2011-v3 Socket
+                               BDX88  - Xeon E7-x800 v4 */
+    case INTEL_BROADWELL_D: /* BDE105 - Xeon D-1500 */
         break;
     default:
         return;
@@ -3473,19 +3476,19 @@ static void __init ler_to_fixup_check(void)
      * that are not equal to bit[47].  Attempting to context switch this value
      * may cause a #GP.  Software should sign extend the MSR.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
-    case 0x3d: /* BDM131 - 5th gen Core */
-    case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
-                  BDW120 - Xeon E3-1200 v4 */
-    case 0x4f: /* BDF93  - Xeon E5-2600 v4
-                  BDH80  - Core-i7 for LGA2011-v3 Socket
-                  BDX93  - Xeon E7-x800 v4 */
-    case 0x56: /* BDE??? - Xeon D-1500 */
+    case INTEL_BROADWELL:   /* BDM131 - 5th gen Core */
+    case INTEL_BROADWELL_G: /* BDD??? - 5th gen Core (H-Processor line)
+                             * BDW120 - Xeon E3-1200 v4 */
+    case INTEL_BROADWELL_X: /* BDF93  - Xeon E5-2600 v4
+                             * BDH80  - Core-i7 for LGA2011-v3 Socket
+                             * BDX93  - Xeon E7-x800 v4 */
+    case INTEL_BROADWELL_D: /* BDE??? - Xeon D-1500 */
         ler_to_fixup_needed = true;
         break;
     }
-- 
2.51.1


