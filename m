Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQn0N0YXUWr//AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:01:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6BF73C6E3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 18:01:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=V6Y99FQL;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359601.1613104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDeu-00021U-A9; Fri, 10 Jul 2026 16:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359601.1613104; Fri, 10 Jul 2026 16:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDeu-0001yq-7P; Fri, 10 Jul 2026 16:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1359601;
 Fri, 10 Jul 2026 16:00:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wiDes-0001yg-EV
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 16:00:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiDer-0019lq-RR
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 18:00:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a511735-e002-0a2a0a5209dd-0a2a4504bc56-16
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:00:57 +0200
Received: from [52.101.46.58]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a511737-b1e5-0a2a45040019-34652e3ae003-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 18:00:57 +0200
Received: from PH0PR07CA0051.namprd07.prod.outlook.com (2603:10b6:510:e::26)
 by CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:3e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 16:00:51 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::24) by PH0PR07CA0051.outlook.office365.com
 (2603:10b6:510:e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 16:00:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 16:00:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 11:00:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:00:48 -0700
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 11:00:47 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6MC3GnVSNIVJqGRjqWxbCReNZ2KweBkm2ckmKd4concKeikGl2lIFfD85a41R+b0bmW866AIXxwqj58/avP9YJzT/Yfxrg2UrR5iiceejedt8/KDrAj1lwCE81kHqejMsvOMtjuk+XbdJZTtLvkH33vHycL8NcFi7BfDH7rfyK2MPtVVrvAo4QTCKI6vVAQoH2XL/hNRHXY3wnUDwd3Wth8sGwZqo02XLSLnoIl5G6isNlgtuvdiKvqIjNDgOo2taZtWX49/V45fKiLMnNZFUeLw+4MteVCR6zs6hfn/Xm++LMvQd2zm18c9nGrX+rAhX9CH2mhoSiNpZBPS8PDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idkJFcyVAbu81VCvo4HugFL/q4vvx0xgtEB1sxXsIv8=;
 b=ZJ6qKDy6kZzREK+PFwVPVzdEcje2UymW2atPnQ2fUsGwlLngAlhR8LJWWWxnVX9pTwpBXAFID0pI+P/stDmxd95lMhaai290R5fqA8Oc4hE/tXrUM3ToqfFD5BWiU9X/Mo3f2DagmDUg/fD5uOI6QprhYhk52yGjBzk/VS9CR7l9U6C7VCPxdsaBq7v++z4gk1SR5ZcvCfqnvgDYmGXKajVFanovgQ7wdPjplElUoWHfxLFWsVHnBqF+YDL1bliO2rJspKHWSgEkSwMmUI9wovsSjvMGXHjIOjz13RYxJHVi4Sh0wefjcTgZm0yhMnhKylA4OV+kX1jOhxb0QmZWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idkJFcyVAbu81VCvo4HugFL/q4vvx0xgtEB1sxXsIv8=;
 b=V6Y99FQLUZOsrQqrRkxXKzI9Nax1tVgSBGIfVquXPHxUD+Yf8fB4HCfkMgTe9ajv8QOkuu4V+rpRC3T+AiXTxNVrxZm8zRoWTtux1blA+jjtqRHQ5x59EWvOKeeZ+7iSG+NQ9bO1lLzaNc4pf8NdcbH+w5hoLrSNiw0tc0zoW0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4fd49172-40fb-427d-b806-d96dc5afcc55@amd.com>
Date: Fri, 10 Jul 2026 17:00:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm/mpu: Save/restore guest EL1 MPU-related context
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-8-luca.fancellu@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260420142524.1804073-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b105305-8f97-471e-d1c2-08dede9c6a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|11063799006|6133799003|3023799007|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xh7FdrcBLuNgToc9C1kXy7Xc3GEe8l/kSGC9TMI4tBHN9YpbHRBQJKGHctuNfXSyVafGKb0ihumb54P5mz5FrqU8hABcLOk9HMSCZ7JmzbrS9xeL5+WZvNvkB49gUfIwQjXEvMBEnsyl/CqhMPQjNvRFUY1UsgHbI3dtXv63WCxOEqbCWX08HAvR/DNpFa/cjbTqPGLUTY1g46Rwh9JFn73A04PeyiMwnPrcrmQah1iLIlx3M7yRy2o6cRZdwU5qaMnl3yXTB27X4FCDNlOv/Wu1NoFng2YF1ixUo7JWm+yoPSvF4ntwQDfCprGYQlLkSigK1aLir+ytVYQTQRbJqiAcLn0eetB9Z8D/YrpFHQMh3N1dFLx7nC4EfwX1hSDXX8/KNT/YL/Etc0qt+RdNZ+NnOa7JE6K74HnNk8rbns3f0YI0Yku4fTesJm12UxGNp8GB7mLK9HPxtdgOc4+jesOP0LoSHV9Eqq1HOLypjxgt3IC5ueL69BTTYMfaKQJgr8ELvQQNiIXod5+F7t4vvzymoLJXNMuXJLDnuoy8UmbdLfTpvZf+/ccggLMSmVOHC9hKkTL+alIOWfzdwplf8ZgrUDIbj8Fko7vu3NMmK5VXskj3ohr1trRDwbaJkbEPEydsK8Xua6oThPkrczg6Nev/lD4oENq154DPRx9nOWzE+e2S3ubQtTu2JG6PZsnFhXKbr4sw48vXAw2zGGcPvg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YYA+Wigooy7EQ8UjUII8/nZu6zmxXxU0d45isb1GqrgrC+OzJ/rYvV1DmpqxWjYfUdP2nSnEd3NFwlKZSJXo7MQZsh+JVCMorozTRw/JiH5TUZBP4K720MYf5d6UHTM5KF5TVnXPpOJcT9Ik3nelBNeIyKhVpTHwBMl5bJTZRS5DwPKUCkxCeQbkXWEy3SesZVClK9/kUVkfa0sVICIL+bcogq2K4uqwEvKol1diYQC4Rsy0kPiLDL7e1QyI9h+Sg/noVi/m1rcfuViQ1QWfIa/RTuNu3jQYw8bgfWT4qmWbnOuMOycqbZCAh3E6U491VTxBqq3i5XdBWACgBq4vZ4iwbGI+nUNYi2nc8FqRthFiH/wL3g+mvzmaZRkIKBTpfcsGC3fTzKVwY6MsrmW9We/5iUw0QGKeRQ548ma9o9J+pzcoUm9gU0mFWd/Xl7WS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:00:50.8133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b105305-8f97-471e-d1c2-08dede9c6a3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648
X-purgate-ID: tlsNG-ebf023/1783699257-7E450FE7-9616D168/0/0
X-purgate-type: clean
X-purgate-size: 20183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:from_mime,amd.com:dkim,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE6BF73C6E3

Hi Luca,

On 20/04/2026 15:25, Luca Fancellu wrote:
> Implement save/restore of guest MPU-related context, as all MPU memory
> regions must be saved/restored on vCPU context switch when domain is
> using PMSAv8-64 translation regime.
>
> Introduce is_mpu_domain() helper function that is always false on MMU
> and it checks if PMSA is selected at EL1 for MPU domains.
>
> Split the save/restore functions into MPU arm64 and arm32, the latter
> is currently not implemented, the former is fully implemented and
> uses the PR{B,L}AR<n>_EL1 register access in order to issue the
> minimum amount of ISB as possible while changing the selector and
> writing/reading the registers.
>
> struct arch_vcpu now includes a pointer to the allocated storage for
> the additional MPU regions to be saved on context switch.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/arm64/mpu/p2m.c          |   2 +
>   xen/arch/arm/domain.c                 |  49 +++++++---
>   xen/arch/arm/include/asm/domain.h     |   5 +
>   xen/arch/arm/include/asm/mm.h         |   3 +
>   xen/arch/arm/include/asm/mmu/mm.h     |  12 +++
>   xen/arch/arm/include/asm/mpu.h        |   3 +
>   xen/arch/arm/include/asm/mpu/cpregs.h |   3 +
>   xen/arch/arm/include/asm/mpu/mm.h     |  10 ++
>   xen/arch/arm/mpu/arm32/mm.c           |  10 ++
>   xen/arch/arm/mpu/arm64/mm.c           | 136 ++++++++++++++++++++++++++
>   xen/arch/arm/mpu/mm.c                 |  39 ++++++++
>   11 files changed, 260 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> index a39a1fc38946..a1ec9fcd6195 100644
> --- a/xen/arch/arm/arm64/mpu/p2m.c
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -62,6 +62,8 @@ void __init setup_virt_paging(void)
>   
>       p2m_vmid_allocator_init();
>   
> +    load_nr_mpu_regions_el1();
> +
>       /*
>        * VSTCR_EL2.SA defines secure stage 2 translation output address space.
>        * To make sure that all stage 2 translations for the Secure PA space access
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index dfa7ace1141b..221b1f8a7f9d 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -123,11 +123,23 @@ static void ctxt_switch_from(struct vcpu *p)
>   
>       isb();
>   
> -    /* MMU */
> +    /* MMU/MPU */
> +    if ( is_mpu_domain(p->domain) )
> +    {
> +        /*
> +         * Domain is using PMSAv8-64 translation regime at EL1, so we need to
> +         * save EL1 MPU memory regions.
> +         */
> +        save_el1_mpu_regions(p);
> +    }
> +    else
> +    {
> +        /* Domain is using VMSAv8-64 translation regime via MMU. */
> +        p->arch.ttbcr = READ_SYSREG(TCR_EL1);
> +        p->arch.ttbr0 = READ_SYSREG64(TTBR0_EL1);
> +        p->arch.ttbr1 = READ_SYSREG64(TTBR1_EL1);
> +    }
>       p->arch.vbar = READ_SYSREG(VBAR_EL1);
> -    p->arch.ttbcr = READ_SYSREG(TCR_EL1);
> -    p->arch.ttbr0 = READ_SYSREG64(TTBR0_EL1);
> -    p->arch.ttbr1 = READ_SYSREG64(TTBR1_EL1);
>       if ( is_32bit_domain(p->domain) )
>           p->arch.dacr = READ_SYSREG(DACR32_EL2);
>       p->arch.par = read_sysreg_par();
> @@ -156,8 +168,6 @@ static void ctxt_switch_from(struct vcpu *p)
>       p->arch.afsr0 = READ_SYSREG(AFSR0_EL1);
>       p->arch.afsr1 = READ_SYSREG(AFSR1_EL1);
>   
> -    /* XXX MPU */
> -
>       /* VGIC */
>       gic_save_state(p);
>   
> @@ -181,8 +191,6 @@ static void ctxt_switch_to(struct vcpu *n)
>       /* VGIC */
>       gic_restore_state(n);
>   
> -    /* XXX MPU */
> -
>       /* Fault Status */
>   #if defined(CONFIG_ARM_32)
>       WRITE_CP32(n->arch.dfar, DFAR);
> @@ -198,11 +206,23 @@ static void ctxt_switch_to(struct vcpu *n)
>       WRITE_SYSREG(n->arch.afsr0, AFSR0_EL1);
>       WRITE_SYSREG(n->arch.afsr1, AFSR1_EL1);
>   
> -    /* MMU */
> +    /* MMU/MPU */
> +    if ( is_mpu_domain(n->domain) )
> +    {
> +        /*
> +         * Domain is using PMSAv8-64 translation regime at EL1, so we need to
> +         * restore EL1 MPU memory regions.
> +         */
> +        restore_el1_mpu_regions(n);
> +    }
> +    else
> +    {
> +        /* Domain is using VMSAv8-64 translation regime via MMU. */
> +        WRITE_SYSREG(n->arch.ttbcr, TCR_EL1);
> +        WRITE_SYSREG64(n->arch.ttbr0, TTBR0_EL1);
> +        WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
> +    }
>       WRITE_SYSREG(n->arch.vbar, VBAR_EL1);
> -    WRITE_SYSREG(n->arch.ttbcr, TCR_EL1);
> -    WRITE_SYSREG64(n->arch.ttbr0, TTBR0_EL1);
> -    WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
>   
>       /*
>        * Erratum #852523 (Cortex-A57) or erratum #853709 (Cortex-A72):
> @@ -518,6 +538,9 @@ int arch_vcpu_create(struct vcpu *v)
>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>   
> +    if ( is_mpu_domain(v->domain) )
> +        allocate_el1_mpu_regions(v);
> +
>       return rc;
>   
>   fail:
> @@ -532,6 +555,8 @@ void arch_vcpu_destroy(struct vcpu *v)
>       vcpu_timer_destroy(v);
>       vcpu_vgic_free(v);
>       free_xenheap_pages(v->arch.stack, STACK_ORDER);
> +    if ( is_mpu_domain(v->domain) )
> +        free_el1_mpu_regions(v);
>   }
>   
>   void vcpu_switch_to_aarch64_mode(struct vcpu *v)
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 4a3fb825962b..44c304ef8aa9 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -202,6 +202,11 @@ struct arch_vcpu
>       register_t actlr;
>       uint32_t cpacr;
>   
> +#ifdef CONFIG_MPU
> +    /* EL1 MPU memory regions */
> +    pr_t *mpu_regions;
> +#endif
> +
>       uint32_t contextidr;
>       register_t tpidr_el0;
>       register_t tpidr_el1;
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 72a692862420..9e35800aba5e 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -202,6 +202,9 @@ extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>   void setup_mm_helper(void);
>   /* map a physical range in virtual memory */
>   void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
> +/* Allocate space for EL1 MPU region info */
> +void allocate_el1_mpu_regions(struct vcpu *v);
> +void free_el1_mpu_regions(struct vcpu *v);
>   
>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>   {
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index 7f4d59137d0d..c441af50c3a9 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -9,6 +9,8 @@
>   #include <asm/mmu/layout.h>
>   #include <asm/page.h>
>   
> +struct domain;
> +
>   /* Non-boot CPUs use this to find the correct pagetables. */
>   extern uint64_t init_ttbr;
>   
> @@ -91,6 +93,16 @@ static inline struct page_info *virt_to_page(const void *v)
>       return frame_table + pdx - frametable_base_pdx;
>   }
>   
> +/* If this domain should use PMSAv8-64 translation regime (MPU) at EL1. */
> +static inline bool is_mpu_domain(struct domain *d)
> +{
> +    return false;
> +}
> +
> +/* Stub for MPU EL1 region save/restore */
> +static inline void save_el1_mpu_regions(struct vcpu *p) { }
> +static inline void restore_el1_mpu_regions(struct vcpu *n) { }
> +
>   /*
>    * Print a walk of a page table or p2m
>    *
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 8a8c01086206..525944987713 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -27,6 +27,9 @@
>   
>   #ifndef __ASSEMBLER__
>   
> +/* Load the number of regions supported by the EL1 MPU from MPUIR_EL1. */
> +void load_nr_mpu_regions_el1(void);
> +
>   /*
>    * Utility function to determine if an Armv8-R processor supports VMSA.
>    */
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> index 5a3d92cf5389..f6fb3c93c032 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -5,6 +5,7 @@
>   
>   /* CP15 CR0: MPU Type Register */
>   #define HMPUIR          p15,4,c0,c0,4
> +#define MPUIR           p15,0,c0,c0,4
>   
>   /* CP15 CR2: Virtualization System Control register */
>   #define VSCTLR          p15,4,c2,c0,1
> @@ -16,6 +17,7 @@
>   #define HPRSELR         p15,4,c6,c2,1
>   #define HPRBAR          p15,4,c6,c3,0
>   #define HPRLAR          p15,4,c6,c3,1
> +#define PRSELR          p15,0,c6,c2,1
>   
>   /* CP15 CR6: MPU Protection Region Base/Limit Address Register */
>   #define HPRBAR0         p15,4,c6,c8,0
> @@ -86,6 +88,7 @@
>   /* Aliases of AArch64 names for use in common code */
>   #ifdef CONFIG_ARM_32
>   /* Alphabetically... */
> +#define MPUIR_EL1       MPUIR
>   #define MPUIR_EL2       HMPUIR
>   #define PRBAR_EL2       HPRBAR
>   #define PRENR_EL2       HPRENR
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 24bffdee4fb6..a536ec4431df 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -20,6 +20,7 @@
>   extern struct page_info *frame_table;
>   
>   extern uint8_t max_mpu_regions;
> +extern uint8_t max_mpu_regions_el1;
>   
>   extern DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR);
>   
> @@ -55,6 +56,15 @@ static inline void context_sync_mpu(void)
>       isb();
>   }
>   
> +/* If this domain should use PMSAv8-64 translation regime (MPU) at EL1. */
> +bool is_mpu_domain(struct domain *d);
> +
> +/* Save EL1 MPU base and limit registers. */
> +void save_el1_mpu_regions(struct vcpu *p);
> +
> +/* Restore EL1 MPU base and limit registers. */
> +void restore_el1_mpu_regions(struct vcpu *n);
> +
>   /*
>    * The following API requires context_sync_mpu() after being used to modify MPU
>    * regions:
> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
> index 5eaeb3400e6c..3dd71228b4ed 100644
> --- a/xen/arch/arm/mpu/arm32/mm.c
> +++ b/xen/arch/arm/mpu/arm32/mm.c
> @@ -159,6 +159,16 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>       }
>   }
>   
> +void save_el1_mpu_regions(struct vcpu *p)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +void restore_el1_mpu_regions(struct vcpu *n)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
> index b07e729a7d05..ce9947851173 100644
> --- a/xen/arch/arm/mpu/arm64/mm.c
> +++ b/xen/arch/arm/mpu/arm64/mm.c
> @@ -1,8 +1,10 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
>   #include <xen/bug.h>
> +#include <xen/sched.h>
>   #include <xen/types.h>
>   #include <asm/mpu.h>
> +#include <asm/mpu/mm.h>
>   #include <asm/sysregs.h>
>   #include <asm/system.h>
>   
> @@ -10,9 +12,13 @@
>    * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
>    * and GENERATE_READ_PR_REG_CASE with num==0
>    */
> +#define PRBAR0_EL1 PRBAR_EL1
> +#define PRLAR0_EL1 PRLAR_EL1
>   #define PRBAR0_EL2 PRBAR_EL2
>   #define PRLAR0_EL2 PRLAR_EL2
>   
> +#define PRBAR_EL1_(n)   PRBAR##n##_EL1
> +#define PRLAR_EL1_(n)   PRLAR##n##_EL1
>   #define PRBAR_EL2_(n)   PRBAR##n##_EL2
>   #define PRLAR_EL2_(n)   PRLAR##n##_EL2
>   
> @@ -32,6 +38,22 @@
>           break;                                                  \
>       }
>   
> +#define GENERATE_SAVE_EL1_PR_REG_CASE(num, pr, sel)             \
> +    case num:                                                   \
> +    {                                                           \
> +        pr->prbar.bits = READ_SYSREG(PRBAR_EL1_(num));          \
> +        pr->prlar.bits = READ_SYSREG(PRLAR_EL1_(num));          \
> +        sel--;                                                  \
> +    }
> +
> +#define GENERATE_RESTORE_EL1_PR_REG_CASE(num, pr, sel)                      \
> +    case num:                                                               \
> +    {                                                                       \
> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL1_(num));   \
> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL1_(num));   \
> +        sel--;                                                              \
> +    }
> +
>   bool has_v8r_vmsa_support(void)
>   {
>       return system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_VMSA_SUPPORT;
> @@ -125,6 +147,120 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>       }
>   }
>   
> +void save_el1_mpu_regions(struct vcpu *p)
> +{
> +    int sel = max_mpu_regions_el1 - 1;
> +    pr_t *table;
> +
> +    if ( max_mpu_regions_el1 == 0 )
> +        return;
> +
> +    if ( p->arch.mpu_regions == NULL )
> +        return;
> +    table = p->arch.mpu_regions;
> +
> +    while ( sel >= 0 )
> +    {
> +        WRITE_SYSREG( (sel & 0xF0), PRSELR_EL1);
> +        isb();
> +        switch ( sel & 0xF ) {
Stray space after the opening paren in WRITE_SYSREG, and the switch brace
should be on its own line. The case-label indentation in the ladder below is
also uneven (default is indented deeper than the generated cases).

> +            GENERATE_SAVE_EL1_PR_REG_CASE(15, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(14, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(13, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(12, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(11, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(10, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(9, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(8, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(7, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(6, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(5, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(4, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(3, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(2, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(1, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_SAVE_EL1_PR_REG_CASE(0, (&table[sel]), sel);
> +            break;
> +            default:
> +                BUG(); /* Can't happen */
> +                break;
> +        }
> +    }
> +}
> +
> +void restore_el1_mpu_regions(struct vcpu *n)
> +{
> +    int sel = max_mpu_regions_el1 - 1;
> +    pr_t *table;
> +
> +    if ( max_mpu_regions_el1 == 0 )
> +        return;
> +
> +    if ( !n->arch.mpu_regions )
> +        return;
> +    table = n->arch.mpu_regions;
> +
> +    while ( sel >= 0 )
> +    {
> +        WRITE_SYSREG( (sel & 0xF0), PRSELR_EL1);
> +        isb();
> +        switch ( sel & 0xF ) {
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(15, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(14, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(13, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(12, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(11, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(10, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(9, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(8, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(7, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(6, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(5, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(4, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(3, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(2, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(1, (&table[sel]), sel);
> +            fallthrough;
> +            GENERATE_RESTORE_EL1_PR_REG_CASE(0, (&table[sel]), sel);
> +            break;
> +            default:
> +                BUG(); /* Can't happen */
> +                break;
> +        }
> +    }
> +
> +    context_sync_mpu();
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 459fb952d125..d6703bf0c005 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -7,6 +7,7 @@
>   #include <xen/mm.h>
>   #include <xen/pfn.h>
>   #include <xen/sizes.h>
> +#include <xen/sched.h>
>   #include <xen/spinlock.h>
>   #include <xen/types.h>
>   #include <asm/mpu.h>
> @@ -14,6 +15,7 @@
>   #include <asm/page.h>
>   #include <asm/setup.h>
>   #include <asm/sysregs.h>
> +#include <public/arch-arm.h>
>   
>   #define MPU_ATTR_XN_RO_MISMATCH     -1
>   #define MPU_ATTR_AI_MISMATCH        -2
> @@ -23,6 +25,9 @@ struct page_info *frame_table;
>   /* Maximum number of supported MPU memory regions by the EL2 MPU. */
>   uint8_t __ro_after_init max_mpu_regions;
>   
> +/* Maximum number of supported MPU memory regions by the EL1 MPU. */
> +uint8_t __read_mostly max_mpu_regions_el1;
> +
>   /*
>    * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
>    * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
> @@ -631,6 +636,40 @@ void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
>       return maddr_to_virt(start);
>   }
>   
> +bool is_mpu_domain(struct domain *d)
const struct domain *
> +{
> +    return (d->arch.v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE) ||
> +           (d->arch.v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA);
> +}
> +
> +void load_nr_mpu_regions_el1(void)
> +{
> +    max_mpu_regions_el1 = (uint8_t)(READ_SYSREG(MPUIR_EL1) &
> +                                    NUM_MPU_REGIONS_MASK);
> +}
> +
> +void allocate_el1_mpu_regions(struct vcpu *v)
> +{
> +    if ( max_mpu_regions_el1 == 0 )
> +        return;
> +
> +    if ( v->arch.mpu_regions )
> +        return;
> +
> +    v->arch.mpu_regions = (pr_t *)_xzalloc(sizeof(pr_t) * max_mpu_regions_el1,
> +                                           SMP_CACHE_BYTES);
> +    if ( !v->arch.mpu_regions )
> +        panic("DOM%pd: mpu: no memory to store EL1 MPU memory region info\n",
> +              v->domain);
> +    memset(v->arch.mpu_regions, 0, sizeof(pr_t) * max_mpu_regions_el1);
_xzalloc already zeroes the allocation, so the memset is redundant. The

(pr_t *) cast on the void * return is also unnecessary.

The panic format is
"DOM%pd" but %pd already expands to "dX"/"dom0" - drop the DOM prefix.

> +}
> +
> +void free_el1_mpu_regions(struct vcpu *v)
> +{
> +    if ( v->arch.mpu_regions )
> +        xfree(v->arch.mpu_regions);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
- Ayan

