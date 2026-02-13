Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAHiFYOfj2kuSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:02:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A337139B42
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231926.1536851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1F0-00008y-8w; Fri, 13 Feb 2026 22:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231926.1536851; Fri, 13 Feb 2026 22:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1F0-00007I-6B; Fri, 13 Feb 2026 22:02:22 +0000
Received: by outflank-mailman (input) for mailman id 1231926;
 Fri, 13 Feb 2026 22:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4o5=AR=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vr1Ey-00007B-JE
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:02:20 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a88bb750-0927-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 23:02:17 +0100 (CET)
Received: from SN6PR08CA0013.namprd08.prod.outlook.com (2603:10b6:805:66::26)
 by IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Fri, 13 Feb
 2026 22:02:08 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::d7) by SN6PR08CA0013.outlook.office365.com
 (2603:10b6:805:66::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 22:02:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 22:02:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 16:02:07 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Feb 2026 16:02:07 -0600
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
X-Inumbo-ID: a88bb750-0927-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+e5v97CZ9uarsY+YnopMg5NgaIPIsdziJKjsb8HsFG8geL3G7W+u8d8UGGRGR34tIbJilWv3BHwKJgdh9tyYvU/4T12vtRj/n309LozC2r/tUgdNegTl6sQOkOiNI191+gOepkQpkftUFWLKl02hzrXDH97KwJVMHGKZr9+ATGKMdpDlj7cacqVfh+YaqKSp2J2e+2hj1zm+FyXlxFKQQagg5cKvgrNeCYMUj9ocqwOooYnZmMT8mxNLfEBfyUnGyiYGMeIMD5lZSYt2P8L+9B9GZD/zrxdSvvADX/I4l7Gyq2yp5iFejaSfyZglFQ8R520qb4Jev/bUqMJB5Jf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Leli0UXSt5ELhBr59/cYZnLWXI4z42XtDeNb+zOzwN8=;
 b=FzbuHxTDCjza/KKroDoEzJOyM8EUB1z4jCwzOmGbKDc8yJmgrk798izI3KfnjAYN5oB6+zxLTG5z8EjFNYGE7zgohqwJEK7QSxIiysUq9Rhs3O/8gl0ln/bw4EAk5us72MjvKXYDweBVnKRT5iPMYWF2FwLi1wCEjUM/1gqB9RYi4lUyv2JINFIsmQbKP+dKv/HZ8lGPrKLeoBBUAlOfnf5HihEPsW3JLfj74X/tsK9OowXTTNh5JBJCUaB6qIIZl4cLrvCJov6lFzz1fknZfVCrHTnNwavwu//jujqeiTn9FGjAWxx8QSoD4iHSUhFB0kZewfVN+9XzESwXMYZDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Leli0UXSt5ELhBr59/cYZnLWXI4z42XtDeNb+zOzwN8=;
 b=nR/lqKHSJuJfCyxbCFI+lBrQKJI1W/YVBQqhBAJRDsN4WhwhtSVt7ki3i7uQs3AEVO5IWBskJLeBqP69mx94MgnNWn7NFb6q+blbBfhJnO07F3mlJ7lEzQlbZO//WaWupAKd+cs/Zkjx+5CUWqWps6n0Hr7BK3pvF3le92Eldwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <roger.pau@citrix.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<jason.andryuk@amd.com>, <alejandro.garciavallejo@amd.com>,
	<stefano.stabellini@amd.com>
Subject: [PATCH] x86/hvm: Add Kconfig option to disable nested virtualization
Date: Fri, 13 Feb 2026 14:02:05 -0800
Message-ID: <20260213220205.196179-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 90290075-5d1a-4e71-d641-08de6b4b87e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1wX8PPFbq5ctBTprI4ocmVCxRNYFDZwOqyExzIEFbocG32EJUgVRWjrkAkJL?=
 =?us-ascii?Q?GLbpv6BaXwtcJjA7oau81T2CxWgPTal9JAwTgznofgeD08Rcbm+QeUCR7xmV?=
 =?us-ascii?Q?XS5mTcO8URHYYenHEjpW96CoPjFuDzaWBtRMBHBX0uURZd76WcEaZ8X5elGJ?=
 =?us-ascii?Q?1875m0ODGgcdUZYqgavpHtC3p17suxGtE3qmHeFq1NGuIS7CnNfjXQlJgUmH?=
 =?us-ascii?Q?1Bg2VKesxGHOd8nI/W+4GiHf+km6zJjFeKZ/AevG5ZfNGM2r6bpRLOuzDKec?=
 =?us-ascii?Q?UPnGcw0Q9A1MmMouQZ2NnKSUlllV8WTqAlmfZrCihZb1SumwdIWXTfzOdcCe?=
 =?us-ascii?Q?B2ly3pfWQRt78aigp+3X73e47Fqmplu9fvPiljfNp06LSZjZwHGDu9WlgnSc?=
 =?us-ascii?Q?bqpWyeigdugJGWaNdL2w1e0JlqHqwN4nfwx1xVZ/wd9OJeuf+EQK/F1eJ6Ms?=
 =?us-ascii?Q?Uwmhf4H/IEqQum13V0UFrt1MZNd8JteVLLehbzaxax3uL4YkjDUfq5IoP5Al?=
 =?us-ascii?Q?p8BEtCgGzmUwFqF5m4v5liZ3DEuSyqG3SCXPBUEbyyYTzvYzKw3tepncv4C/?=
 =?us-ascii?Q?svVTo2Gue1FWMweUa3zFGOcUua6R0p5TqHFPbC47E72aV2z7jB6e3+wKMr+R?=
 =?us-ascii?Q?8WyEdaHbD+YGEaTyZ3uawrSfHR5e22JLpu4wRc6Z+xs1DiER8TVlUohN4OaM?=
 =?us-ascii?Q?gKUpkCksOL7EgbwYIcj/R5jN34UrGtb9Z80i9VES7O+N6Hjp7TJC6KlI77bZ?=
 =?us-ascii?Q?2s8LzeuabryEHtM0tyJNKaAvyiFkIR8cM4MsmUDhh4ueSZeQ146z3rLnCbu2?=
 =?us-ascii?Q?eDVvB1/G7S7i1rV/UFt8UU1TGMCh3MElJLWyv0Ye4rtAeGTsB2yDgGf9Qa8V?=
 =?us-ascii?Q?iGYDBzGQ3Kt5PbTiRh4KeHrNt/k90s4RXdIa247ifrv//wrx4B1y/a11V0Gx?=
 =?us-ascii?Q?J0rEpAa/RlI+xwNfKIvDt9uVOXZMj64GR+3S0D0f5i2oMoDJylktJtLNOZ9X?=
 =?us-ascii?Q?O/6jKfNxV3iJjFSScIldaBqoGPfPQJpVvmUw5HkbS29S28OvN/4ImOCTPhbh?=
 =?us-ascii?Q?v1s3y8altzNY5XpIkCRq7bIVprIR5LR6Z0Z2RSgKz4kLFAI7xRlhLOy02P9w?=
 =?us-ascii?Q?p2S3WHrQsZthBg3fUG3WQGeobRf77DAz3+flJS34ouVF2uzDZn4lY5iadhoB?=
 =?us-ascii?Q?nWMWpH2NBccfIhfwnh6J7AsHKnhNWwHdKA5DVOpTMstnBG0WDW42CYsqCsLZ?=
 =?us-ascii?Q?JtL3G/rm4AkrQ/u+BnU3IzI+6ESg9novrXMJf5Us2uoDmOkJy8fdqxAJZ390?=
 =?us-ascii?Q?dZ9AJ9xq4pyNWMah3dTh2ZQmPqfPSnpX8/oQvORux6WDcoq+8DhUNl9dYtze?=
 =?us-ascii?Q?ZqSSNlfCRdCAFzrypabOzzHhQ5aWFcZEpLUegVzJAgI0u/a10YDV4xjyIuh2?=
 =?us-ascii?Q?reyT4jvknMJ7AxClNAvsOTrvzn/BzgTYNVzXhCO2Kz2XjxF7DFkHFJ7AEFKS?=
 =?us-ascii?Q?DKdUgoK+Fzbvl9yNyWHYyTHzJ+qHWGp3/GfrD4juRarv9OMxkAE2HP8RnOlk?=
 =?us-ascii?Q?RgvlNOQH7zmHFnCbEbsIXiudr8YKRJl8e/O7+rwKBS/ttAJxFDlbeweJcfxZ?=
 =?us-ascii?Q?Ez7uJO06+RUBTj5EIhlg3I9PLe6M+xqS1bEtBhuEqOz33Ttmwobz1ZklJT2U?=
 =?us-ascii?Q?4cTMsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r4vnLcz0/0zNh2n8e9iY2UnWL4tyzNTWdqIAYjRv3kdq74o+T5Ko0hFL74lKU4+L4dqgi541KDSktOSMbGsUFzbIMuYzCwxOkVCLj/UsyT6lNkvoPcwhMN64H0P/oEvmcgISutcAZTJj037q8CumRLN0ToUwp0K74kKGcjZN2eQCakaA3ARgIG3X9WRRdB06FufE2ZCsnGasF9NhbvGek6o+fAVlcZJdzG0ujUoHgron/ckO51lTB83L7/EGYjmJ9IoXPKsfGh9WguL8OzrplTrH9ALZXGaCZGyR9pJqnxYwzytcJn30mRpeFgmSBwZPzOBCRPKADqyFsFQ4lb2dWD3SBw5DUDd7VrFNzqwIkq5OYM4fgCpK9X6oUrnrmlY83Xsz5UHsio+I+MmzBizXju/t59zrcT7h1VmoHzSH0zJVcmImE2cBaWZ8rEDAwGRS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:02:07.9243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90290075-5d1a-4e71-d641-08de6b4b87e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 8A337139B42
X-Rspamd-Action: no action

Introduce CONFIG_NESTED_VIRT (default n) to allow nested virtualization
support to be disabled at build time. This is useful for embedded or
safety-focused deployments where nested virtualization is not needed,
reducing code size and attack surface.

When CONFIG_NESTED_VIRT=n, the following source files are excluded:
- arch/x86/hvm/nestedhvm.c
- arch/x86/hvm/svm/nestedsvm.c
- arch/x86/hvm/vmx/vvmx.c
- arch/x86/mm/nested.c
- arch/x86/mm/hap/nested_hap.c
- arch/x86/mm/hap/nested_ept.c

Add inline stubs where needed in headers. Guard assembly code paths
for nested virt with #ifdef CONFIG_NESTED_VIRT. Move exception
injection for VMX/SVM instructions to the callers in vmx.c/svm.c to
avoid header dependency issues in the stubs.

No functional change when CONFIG_NESTED_VIRT=y.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

---
Changes in v3:
- Kconfig: Change "depends on AMD_SVM || INTEL_VMX" to "depends on HVM"
- Kconfig: Remove redundant "default n" line
- Kconfig: Remove "If unsure, say N." from help text
- mm/hap/Makefile: Simplify using intermediate nested-y variable:
    nested-y := nested_hap.o
    nested-$(CONFIG_INTEL_VMX) += nested_ept.o
    obj-$(CONFIG_NESTED_VIRT) += $(nested-y)
- svm/nestedhvm.h: Remove #ifdef CONFIG_NESTED_VIRT stubs, keep only
  function declarations (the functions are only called from code that
  is already compiled out when nested virt is disabled)
- svm/nestedhvm.h: Add CONFIG_NESTED_VIRT guard to nsvm_efer_svm_enabled
  macro to return false when nested virt is disabled
- svm/svm.c: Move #UD injection for STGI/CLGI to the caller instead of
  stub functions, checking nestedhvm_enabled()/nsvm_efer_svm_enabled()
- svm/svm.c: Mark svm_vmexit_do_vmrun/vmload/vmsave as __maybe_unused
- svm/svm.c: Remove empty nsvm_vcpu_switch stub (now guarded in asm)
- svm/entry.S: Add #ifdef CONFIG_NESTED_VIRT guards around nested virt
  specific code paths
- vmx/vmx.c: Remove empty nvmx_switch_guest stub (now guarded in asm)
- vmx/vmx.c: Move nvmx_enqueue_n2_exceptions and nvmx_vmexit_event to
  vvmx.c where they belong
- vmx/vvmx.h: Add declarations for nvmx_vmexit_event and
  nvmx_enqueue_n2_exceptions
- vmx/vvmx.h: Fix nvmx_msr_read_intercept stub comment
- vmx/vvmx.h: nvmx_handle_vmx_insn stub returns X86EMUL_EXCEPTION with
  ASSERT_UNREACHABLE (caller handles injection)
- vmx/vvmx.h: Convert get_vvmcs macro to inline function in stubs
- vmx/entry.S: Add #ifdef CONFIG_NESTED_VIRT guard around nvmx_switch_guest
- nestedhvm.h: Convert macro stubs to proper inline functions
---
 xen/arch/x86/hvm/Kconfig                 |  7 +++
 xen/arch/x86/hvm/Makefile                |  2 +-
 xen/arch/x86/hvm/svm/Makefile            |  2 +-
 xen/arch/x86/hvm/svm/entry.S             |  4 ++
 xen/arch/x86/hvm/svm/nestedhvm.h         |  2 +-
 xen/arch/x86/hvm/svm/svm.c               | 18 ++++--
 xen/arch/x86/hvm/vmx/Makefile            |  2 +-
 xen/arch/x86/hvm/vmx/entry.S             |  2 +
 xen/arch/x86/hvm/vmx/vmx.c               | 31 +---------
 xen/arch/x86/hvm/vmx/vvmx.c              | 26 +++++++++
 xen/arch/x86/include/asm/hvm/hvm.h       |  2 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h | 64 +++++++++++++++++---
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 74 ++++++++++++++++++++++++
 xen/arch/x86/mm/Makefile                 |  2 +-
 xen/arch/x86/mm/hap/Makefile             |  5 +-
 xen/arch/x86/mm/p2m.h                    |  6 ++
 xen/arch/x86/sysctl.c                    |  2 +
 xen/include/public/sysctl.h              |  4 +-
 18 files changed, 204 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f32bf5cbb7..af661385b5 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -92,4 +92,11 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on INTEL_VMX
 
+config NESTED_VIRT
+	bool "Nested virtualization support"
+	depends on HVM
+	help
+	  Enable nested virtualization, allowing guests to run their own
+	  hypervisors. This requires hardware support.
+
 endif
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index f34fb03934..b8a0a68624 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y += irq.o
 obj-y += mmio.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mtrr.o
-obj-y += nestedhvm.o
+obj-$(CONFIG_NESTED_VIRT) += nestedhvm.o
 obj-y += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
index 8a072cafd5..92418e3444 100644
--- a/xen/arch/x86/hvm/svm/Makefile
+++ b/xen/arch/x86/hvm/svm/Makefile
@@ -2,6 +2,6 @@ obj-y += asid.o
 obj-y += emulate.o
 obj-bin-y += entry.o
 obj-y += intr.o
-obj-y += nestedsvm.o
+obj-$(CONFIG_NESTED_VIRT) += nestedsvm.o
 obj-y += svm.o
 obj-y += vmcb.o
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index af8db23b03..7964c80750 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -28,7 +28,9 @@ FUNC(svm_asm_do_resume)
         GET_CURRENT(bx)
 .Lsvm_do_resume:
         call svm_intr_assist
+#ifdef CONFIG_NESTED_VIRT
         call nsvm_vcpu_switch
+#endif
         ASSERT_NOT_IN_ATOMIC
 
         mov  VCPU_processor(%rbx),%eax
@@ -39,6 +41,7 @@ FUNC(svm_asm_do_resume)
         cmp  %ecx,(%rdx,%rax,1)
         jne  .Lsvm_process_softirqs
 
+#ifdef CONFIG_NESTED_VIRT
         cmp  %cl,VCPU_nsvm_hap_enabled(%rbx)
 UNLIKELY_START(ne, nsvm_hap)
         cmp  %rcx,VCPU_nhvm_p2m(%rbx)
@@ -52,6 +55,7 @@ UNLIKELY_START(ne, nsvm_hap)
         sti
         jmp  .Lsvm_do_resume
 __UNLIKELY_END(nsvm_hap)
+#endif
 
         call svm_vmenter_helper
 
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bfed5ffd7..5cb85410f8 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -24,7 +24,7 @@
 
 /* True when l1 guest enabled SVM in EFER */
 #define nsvm_efer_svm_enabled(v) \
-    (!!((v)->arch.hvm.guest_efer & EFER_SVME))
+    (IS_ENABLED(CONFIG_NESTED_VIRT) && ((v)->arch.hvm.guest_efer & EFER_SVME))
 
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
 void nestedsvm_vmexit_defer(struct vcpu *v,
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..2cabc89fb5 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2165,7 +2165,7 @@ static void svm_vmexit_do_pause(struct cpu_user_regs *regs)
     vcpu_yield();
 }
 
-static void
+static void __maybe_unused
 svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
                     struct vcpu *v, uint64_t vmcbaddr)
 {
@@ -2211,7 +2211,7 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr)
     return  page;
 }
 
-static void
+static void __maybe_unused
 svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
                      struct cpu_user_regs *regs,
                      struct vcpu *v, uint64_t vmcbaddr)
@@ -2246,7 +2246,7 @@ svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
     __update_guest_eip(regs, inst_len);
 }
 
-static void
+static void __maybe_unused
 svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
                      struct cpu_user_regs *regs,
                      struct vcpu *v, uint64_t vmcbaddr)
@@ -2465,6 +2465,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
 
+#ifdef CONFIG_NESTED_VIRT
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
     .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
     .nhvm_vcpu_reset = nsvm_vcpu_reset,
@@ -2474,6 +2475,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
     .nhvm_intr_blocked = nsvm_intr_blocked,
     .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
+#endif
 
     .get_reg = svm_get_reg,
     .set_reg = svm_set_reg,
@@ -3011,10 +3013,16 @@ void asmlinkage svm_vmexit_handler(void)
         svm_vmexit_do_vmsave(vmcb, regs, v, regs->rax);
         break;
     case VMEXIT_STGI:
-        svm_vmexit_do_stgi(regs, v);
+        if ( !nestedhvm_enabled(v->domain) )
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+        else
+            svm_vmexit_do_stgi(regs, v);
         break;
     case VMEXIT_CLGI:
-        svm_vmexit_do_clgi(regs, v);
+        if ( !nsvm_efer_svm_enabled(v) )
+            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
+        else
+            svm_vmexit_do_clgi(regs, v);
         break;
 
     case VMEXIT_XSETBV:
diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefile
index 04a29ce59d..902564b3e2 100644
--- a/xen/arch/x86/hvm/vmx/Makefile
+++ b/xen/arch/x86/hvm/vmx/Makefile
@@ -3,4 +3,4 @@ obj-y += intr.o
 obj-y += realmode.o
 obj-y += vmcs.o
 obj-y += vmx.o
-obj-y += vvmx.o
+obj-$(CONFIG_NESTED_VIRT) += vvmx.o
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 2bfee715b3..4d62efddf4 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -83,7 +83,9 @@ FUNC(vmx_asm_vmexit_handler)
 
 .Lvmx_do_vmentry:
         call vmx_intr_assist
+#ifdef CONFIG_NESTED_VIRT
         call nvmx_switch_guest
+#endif
         ASSERT_NOT_IN_ATOMIC
 
         mov  VCPU_processor(%rbx),%eax
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49ae..4e3c8018d2 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2014,33 +2014,6 @@ static void cf_check vmx_update_guest_efer(struct vcpu *v)
         vmx_set_msr_intercept(v, MSR_EFER, VMX_MSR_R);
 }
 
-static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
-            unsigned long intr_fields, int error_code, uint8_t source)
-{
-    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
-
-    if ( !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) ) {
-        /* enqueue the exception till the VMCS switch back to L1 */
-        nvmx->intr.intr_info = intr_fields;
-        nvmx->intr.error_code = error_code;
-        nvmx->intr.source = source;
-        vcpu_nestedhvm(v).nv_vmexit_pending = 1;
-        return;
-    }
-    else
-        gdprintk(XENLOG_ERR, "Double Fault on Nested Guest: exception %lx %x"
-                 "on %lx %x\n", intr_fields, error_code,
-                 nvmx->intr.intr_info, nvmx->intr.error_code);
-}
-
-static int cf_check nvmx_vmexit_event(
-    struct vcpu *v, const struct x86_event *event)
-{
-    nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
-                               hvm_intsrc_none);
-    return NESTEDHVM_VMEXIT_DONE;
-}
-
 static void __vmx_inject_exception(int trap, int type, int error_code)
 {
     unsigned long intr_fields;
@@ -2933,6 +2906,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .handle_cd            = vmx_handle_cd,
     .set_info_guest       = vmx_set_info_guest,
     .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
+#ifdef CONFIG_NESTED_VIRT
     .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
     .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
     .nhvm_vcpu_reset      = nvmx_vcpu_reset,
@@ -2942,8 +2916,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
     .nhvm_intr_blocked    = nvmx_intr_blocked,
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
-    .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#endif
+    .update_vlapic_mode = vmx_vlapic_msr_changed,
 #ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
 #endif
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 38952f0696..2bb42678c5 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2821,6 +2821,32 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
     __vmwrite(read_shadow_field, v->arch.hvm.nvcpu.guest_cr[cr]);
 }
 
+void nvmx_enqueue_n2_exceptions(struct vcpu *v,
+            unsigned long intr_fields, int error_code, uint8_t source)
+{
+    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
+
+    if ( !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) ) {
+        /* enqueue the exception till the VMCS switch back to L1 */
+        nvmx->intr.intr_info = intr_fields;
+        nvmx->intr.error_code = error_code;
+        nvmx->intr.source = source;
+        vcpu_nestedhvm(v).nv_vmexit_pending = 1;
+        return;
+    }
+    else
+        gdprintk(XENLOG_ERR, "Double Fault on Nested Guest: exception %lx %x"
+                 "on %lx %x\n", intr_fields, error_code,
+                 nvmx->intr.intr_info, nvmx->intr.error_code);
+}
+
+int cf_check nvmx_vmexit_event(struct vcpu *v, const struct x86_event *event)
+{
+    nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
+                               hvm_intsrc_none);
+    return NESTEDHVM_VMEXIT_DONE;
+}
+
 void __init start_nested_vmx(struct hvm_function_table *hvm_function_table)
 {
     /* TODO: Require hardware support before enabling nested virt */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59..536a38b450 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -711,7 +711,7 @@ static inline bool hvm_altp2m_supported(void)
 /* Returns true if we have the minimum hardware requirements for nested virt */
 static inline bool hvm_nested_virt_supported(void)
 {
-    return hvm_funcs.caps.nested_virt;
+    return IS_ENABLED(CONFIG_NESTED_VIRT) && hvm_funcs.caps.nested_virt;
 }
 
 #ifdef CONFIG_ALTP2M
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index ea2c1bc328..2f8209271a 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
 /* Nested HVM on/off per domain */
 static inline bool nestedhvm_enabled(const struct domain *d)
 {
-    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
+    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
+           (d->options & XEN_DOMCTL_CDF_nested_virt);
 }
 
+/* Nested paging */
+#define NESTEDHVM_PAGEFAULT_DONE       0
+#define NESTEDHVM_PAGEFAULT_INJECT     1
+#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
+#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
+#define NESTEDHVM_PAGEFAULT_MMIO       4
+#define NESTEDHVM_PAGEFAULT_RETRY      5
+#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
+
+#ifdef CONFIG_NESTED_VIRT
+
 /* Nested VCPU */
 int nestedhvm_vcpu_initialise(struct vcpu *v);
 void nestedhvm_vcpu_destroy(struct vcpu *v);
@@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
 #define nestedhvm_vcpu_exit_guestmode(v)  \
     vcpu_nestedhvm(v).nv_guestmode = 0
 
-/* Nested paging */
-#define NESTEDHVM_PAGEFAULT_DONE       0
-#define NESTEDHVM_PAGEFAULT_INJECT     1
-#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
-#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
-#define NESTEDHVM_PAGEFAULT_MMIO       4
-#define NESTEDHVM_PAGEFAULT_RETRY      5
-#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
 int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
                                     struct npfec npfec);
 
@@ -59,6 +63,48 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
 
 void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
 
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline int nestedhvm_vcpu_initialise(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }
+static inline void nestedhvm_vcpu_reset(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { return false; }
+static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
+                                                  struct npfec npfec)
+{
+    ASSERT_UNREACHABLE();
+    return NESTEDHVM_PAGEFAULT_L0_ERROR;
+}
+static inline void nestedhvm_vcpu_enter_guestmode(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void nestedhvm_vcpu_exit_guestmode(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline bool nestedhvm_paging_mode_hap(struct vcpu *v)
+{
+    return false;
+}
+static inline bool nestedhvm_vmswitch_in_progress(struct vcpu *v)
+{
+    return false;
+}
+static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
+{
+    ASSERT_UNREACHABLE();
+}
+
+#endif /* CONFIG_NESTED_VIRT */
+
 static inline bool nestedhvm_is_n2(struct vcpu *v)
 {
     if ( !nestedhvm_enabled(v->domain) ||
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index da10d3fa96..d0c1ae29f6 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -73,6 +73,8 @@ union vmx_inst_info {
     u32 word;
 };
 
+#ifdef CONFIG_NESTED_VIRT
+
 int cf_check nvmx_vcpu_initialise(struct vcpu *v);
 void cf_check nvmx_vcpu_destroy(struct vcpu *v);
 int cf_check nvmx_vcpu_reset(struct vcpu *v);
@@ -199,5 +201,77 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
                         uint64_t *exit_qual, uint32_t *exit_reason);
 int nvmx_cpu_up_prepare(unsigned int cpu);
 void nvmx_cpu_dead(unsigned int cpu);
+int cf_check nvmx_vmexit_event(struct vcpu *v, const struct x86_event *event);
+void nvmx_enqueue_n2_exceptions(struct vcpu *v,
+            unsigned long intr_fields, int error_code, uint8_t source);
+
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline void nvmx_update_exec_control(struct vcpu *v, u32 value)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
+                                                      unsigned long value)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void nvmx_update_exception_bitmap(struct vcpu *v,
+                                                unsigned long value)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline u64 nvmx_get_tsc_offset(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned int vector,
+                                             int error_code)
+{
+    ASSERT_UNREACHABLE();
+    return false;
+}
+static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
+                                         unsigned int exit_reason)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+static inline void nvmx_idtv_handling(void)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
+{
+    /* return 0 to trigger #GP */
+    return 0;
+}
+static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
+                                       unsigned int exit_reason)
+{
+    ASSERT_UNREACHABLE();
+    return X86EMUL_EXCEPTION;
+}
+static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
+static inline void nvmx_cpu_dead(unsigned int cpu) { }
+static inline void nvmx_enqueue_n2_exceptions(struct vcpu *v,
+            unsigned long intr_fields, int error_code, uint8_t source)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline u64 get_vvmcs(const struct vcpu *vcpu, u32 encoding)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+#endif /* CONFIG_NESTED_VIRT */
+
 #endif /* __ASM_X86_HVM_VVMX_H__ */
 
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 960f6e8409..aa15811c2e 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
-obj-$(CONFIG_HVM) += nested.o
+obj-$(CONFIG_NESTED_VIRT) += nested.o
 obj-$(CONFIG_HVM) += p2m.o
 obj-y += p2m-basic.o
 obj-$(CONFIG_INTEL_VMX) += p2m-ept.o
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 67c29b2162..efdc91ea82 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -2,5 +2,6 @@ obj-y += hap.o
 obj-y += guest_walk_2.o
 obj-y += guest_walk_3.o
 obj-y += guest_walk_4.o
-obj-y += nested_hap.o
-obj-$(CONFIG_INTEL_VMX) += nested_ept.o
+nested-y := nested_hap.o
+nested-$(CONFIG_INTEL_VMX) += nested_ept.o
+obj-$(CONFIG_NESTED_VIRT) += $(nested-y)
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 635f5a7f45..63808dddcc 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -25,9 +25,15 @@ void p2m_teardown_altp2m(struct domain *d);
 void p2m_flush_table_locked(struct p2m_domain *p2m);
 int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                                   unsigned int page_order);
+#ifdef CONFIG_NESTED_VIRT
 void p2m_nestedp2m_init(struct p2m_domain *p2m);
 int p2m_init_nestedp2m(struct domain *d);
 void p2m_teardown_nestedp2m(struct domain *d);
+#else
+static inline void p2m_nestedp2m_init(struct p2m_domain *p2m) { }
+static inline int p2m_init_nestedp2m(struct domain *d) { return 0; }
+static inline void p2m_teardown_nestedp2m(struct domain *d) { }
+#endif
 
 int ept_p2m_init(struct p2m_domain *p2m);
 void ept_p2m_uninit(struct p2m_domain *p2m);
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..b1d865e1c8 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -103,6 +103,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+    if ( hvm_nested_virt_supported() )
+        pi->capabilities |= XEN_SYSCTL_PHYSCAP_nestedhvm;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 66c9b65465..b4bd1dd7b2 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -100,9 +100,11 @@ struct xen_sysctl_tbuf_op {
 /* Xen supports the Grant v1 and/or v2 ABIs. */
 #define XEN_SYSCTL_PHYSCAP_gnttab_v1     (1u << 8)
 #define XEN_SYSCTL_PHYSCAP_gnttab_v2     (1u << 9)
+/* The platform supports nested HVM. */
+#define XEN_SYSCTL_PHYSCAP_nestedhvm     (1u << 10)
 
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
-#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
+#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_nestedhvm
 
 #if defined(__arm__) || defined(__aarch64__)
 #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
-- 
2.25.1


