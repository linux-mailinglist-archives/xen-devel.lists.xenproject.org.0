Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF10F7Mls2nMSgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD02797ED
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252998.1549436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mt9-0007Oz-Pm; Thu, 12 Mar 2026 20:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252998.1549436; Thu, 12 Mar 2026 20:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mt9-0007MJ-L6; Thu, 12 Mar 2026 20:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1252998;
 Thu, 12 Mar 2026 20:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0mt7-0006Bj-3z
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:44:09 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36872b5c-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:44:07 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 20:44:02 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:44:01 +0000
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
X-Inumbo-ID: 36872b5c-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTABYxefRgz+caiV6A8n0fC8NPIcaiEOayj+Jk2RMeU7f4SN63gKdK1+6v+nVjjIAPMNr1olVOOcbVU4b1AXfmwPE4kXPpsR0Msykuvf4S8gsVj45Z7P2UDipitfV84aRawzMrez8wVGZfOmaqUyG7ek0lYl5nI82pBkGV/oFEP0mpe881PSfInfX5vAsDZdWJoGqMnwG8N5ivY7G07WMWeEPfscjxUR9shCjzlgQ3qpvig6TmxdNoSBR8Beh9d3DzaahMhIO/WThSnik2S4BokdG16PMrj9PRRFWHgABUElpAROQ4vfmxv4uNOQ3jyByVwpse2iYmFPRnaNplqJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I56d0W50ljTEtq6zSKU8BUWqQNcOEh+rwGgmRDXjn/0=;
 b=Pk/uEyETf45EB8HLTPmgzAfB/M801AL/3kw/pWAAQVM2O+B5g01zPJHI9mfC8ua5xshB3FJyUfXPTiWY2HvPCYrFGlJ2pUulLFHMuoaFFKcuV+iSdQMJz2Jvo3rKlOfq960u7fqSw6Gp15FrGqJi73/CmyqdA8HKtbyd3N2uIC1V9GX0cwwLp+0AxyRoBR9w1Ne+VVZkTdyNvTG/UvYg/fNTDZ8lh+cZYaeqIv9xJTm656AydywPTD1MKPm5nzr/aVD4amUH78LaDcGCBn9YlM82pxN9rug2cpNFLilWmJnowxEM+xcvpkHbC6RdnV77VBuA668YIby3aAVJTeQ3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I56d0W50ljTEtq6zSKU8BUWqQNcOEh+rwGgmRDXjn/0=;
 b=tIFKHSs8RK6sAuUA2WRIqwh2MZn6pXVf08R/UP7aOd6OijmtTvsTjIhfbeJGA6Tp70f+6bCEGu3rMyYGXQ/OJ3I7K7XBB2iVoy18tLLQyd7WsJSWdU//2oS8+4nBY6uIKdxhArBj6V/R1IFnRDFe5FMoZilFwGKFTWRBh8IyPUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 4/7] x86: Remove x86 prefixed names from hvm code
Date: Thu, 12 Mar 2026 20:43:36 +0000
Message-ID: <20260312204339.740403-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312204339.740403-1-kevin.lampis@citrix.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::6) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ca2fed-caa1-46d1-bd20-08de807817ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xgZN8KO+FslGQjMxjt1pEECouLWRRcSfO2cJyyWQQeOCi+Ov9VCpnj/tffOG1qqyOewykMEmdSvso/mlbapwjYGAArHEBmQc0sl7hSsvtG5YHetsPUBDGfGc9Nkk1HerF+2lvXpxlI7VA+4SNhdjdIv5DhZMDRclX8X4Cd0k9Co5FqKdf/m5WdX518xVGz4NtebMaWb/zygZF20Fr9LQK43WXB7VEn00pJthU+xR/zECz03Sq213QRwo1LFdTqeaVCsjiXUHO3A9lYKZEy+BAX2AeS+3I3DJcrSn4wqJSIA0xubM+wTG/3WvRcYvPthNGsdH+iBXnq65GKTHPe4OUaQQXFiJsS5ojfh77FcST5j79NHGDy1GFiX0r61CfDI2uJ0Yit5qbgunh0Ocv/VsOdwQ/zkFVMJuNbT+sQv/hvHbMVDRLMsKpHDUQUsTTvSvkTATEciPhEP2iUs2jnDZC34NIZRBxz3q39PAza/rnXRf9Kt0qP4Z3Spq9qO0Y2sEEm2lYqOyRlTrbLBnMLvghu7dJW1HhaXsJbW65Z2jJFYkBA0k3yvQhn8g1P7QrUopzc1CTxi+GaJjP+rVUx5qOaBK6QKVPAnd0XMogPSlJF+qG5lOB6xvosPUGxVcxqDVZ7VAGqCetGJUO/yOC28lJb7UzpxxmXi/z2yyLuOia4lw9rXZzf6p5REy7/brqNVGA//7zMZtNfKz26sprrnKWDchiHN/pXV19/DKQYlrSzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YlomapYLIuQCbvtccQpnrCzmXjF8xGqcCNtNoRqrc2R74KMixUhVxVUzuY8/?=
 =?us-ascii?Q?+fg7YEtxEIg1MjFoHGrHqqt59ptYGEF9sI212OCY2wJ7GTaowDc8mVeQuDVN?=
 =?us-ascii?Q?/0Wg89mH+ZRfbJrTFqoZ5+qhc3uIYGtI1DUu09QqylfqLMeWpiwS/twyXjIp?=
 =?us-ascii?Q?6q/prAMgw+eIZ9euFWASG8H3fqBfdxi6YZPTzDRQ6dXkCbOtHBGWA5UnWHbP?=
 =?us-ascii?Q?bauqtz9dYpv5cysZIBxUpcgeAILF6RyXUsT6k1Q+UiHvxQpMRWIVHSrYGfTl?=
 =?us-ascii?Q?1X3bleGnZ0W/jFP+RD78ualL3B1RClEVLWeZ9u80omrhWMWYU+6a7XDZ0bo9?=
 =?us-ascii?Q?ZFed95Mn0Te3MvblUKMNpQK6UKxrEy6jBUn2yy6lpb9QJhS1A0mGwhQkacIg?=
 =?us-ascii?Q?tz2O7DAyzCJMvgcNoMh0Kp4OLPoZyqzLOfQMdHyt+9Ze9qw8iWGOMZys34BB?=
 =?us-ascii?Q?lyI4WenObnQ9VMI3s5iFdRY9L3YB2RMmdu0mX/3ZJsa/OwWXpP/hOXwsEbU6?=
 =?us-ascii?Q?q+Fbyh3pMzMBSGYFP09nPqUV9ZfZ0I0WPTKQEqnxfDm5cwg55M65L1X/CxWt?=
 =?us-ascii?Q?KwaRfIWF0BBghdPGJtbG1te7jBXeNEyDoDWt7LyJnxlpd/VL9aQdMOD0CFQb?=
 =?us-ascii?Q?VMPhbZ+68uK7vIgh+0Gh76AecKw6XBhqZwM/7+80f8vMC/l6t2ArQOpvpoFk?=
 =?us-ascii?Q?sYKgq8djKd8CFodOXlfASH4byBXv5FjpSFabu2wi3VAoRXcTqzjt6LAnZTFE?=
 =?us-ascii?Q?Z0rZb6XMvdJd3xlbJD4d/jwliEltdYlBRkwo+OAUAMK4M/tMpKi1szOzTu7B?=
 =?us-ascii?Q?kUDgaHWv1I6FAGuszk029ja97BY1Do8dan+4jehySf8TgacyuZ8sFSeUGkQQ?=
 =?us-ascii?Q?kwSQjrAEAQDAyPRbFzfO4NUz0ZhCDuE0Tgwj0GXYVAgM8t9YwIS6lqRYioRy?=
 =?us-ascii?Q?ADKZmD1BjZSyQRMDAcXxnph6jsMSwEhpT/zHARqgu4l0hFb8p5ZiVOZxQQD4?=
 =?us-ascii?Q?tmMeln9aNPIUUoJYarCCCjz+HEquLB99jWEsi2mtVIf8GzMYaQjcaFMWqHBz?=
 =?us-ascii?Q?YmaPCzLQyezBeW5oV0pN1aQ9eyvHA/X/t7AXjACYiETNX5bf73V0WSZ3fhrB?=
 =?us-ascii?Q?Kf3zEEO62yXNS5tk330Ehn8k69RW0H7OCWpOcd752lhn0WCrTWSNCI8f+kh/?=
 =?us-ascii?Q?lQBD7VTUA0eb9LAxMCF9e5bpEx/MUi/f56WZb9EuFtcVa8+YH296SSYOR35B?=
 =?us-ascii?Q?l9SOxPEs4fk0MFe7/a3gWws2L5DgyHtpm1w2KWkHVT80DFL1kNwhCye8F7Zk?=
 =?us-ascii?Q?eQZena5z2Z6hnPGcJK0l7x9FekJ8HkPORYruiUgJhbVE0qaUMIy22GnD3Wme?=
 =?us-ascii?Q?h8soKFT9gtb5i/biXoLuw877dD7iqBPkXfLrIn4z9cSi5firkpJwuM2NCHZz?=
 =?us-ascii?Q?VUEStXLkuma0Ir9tnWcqeXMhyJl9fkmqm20ppQFptiyXsGz9c2WZMUySspR7?=
 =?us-ascii?Q?F4KQy3sDjIXaPGk2+y9yqzJlG3Z/rNT75/zMsp8ymN0QuD4aHq5nQ6sSdE6+?=
 =?us-ascii?Q?FmmKz4JbKodYogSwl68OFXnwWI8ziQEESdTZg01svv4az0HiqDERoaybD8Xk?=
 =?us-ascii?Q?1UGtjBLr4niDZKX9FApeqyB20MDQVbLp9L23W7hc47ByY0pU2c2b64C6VKYT?=
 =?us-ascii?Q?Un7q6oO18ZSy50CLjzzlpDFN0cY6ykADsx3d/EemxdZjy8SjtMzskKRzyRHo?=
 =?us-ascii?Q?y2B9ycA3pA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ca2fed-caa1-46d1-bd20-08de807817ba
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:44:01.7036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBLlv7y8XDtgqzxceLWNihQNhcb9MM5Nhc13P9vsQducmy3Lr8LLlv7ongMaCwwiM6IhXMYxUtE8VnDihEB9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ACFD02797ED
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


