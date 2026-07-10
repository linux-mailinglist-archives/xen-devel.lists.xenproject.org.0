Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g8Q0ACwRUWrX+wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:35:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176673C4DA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:35:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=MWJITm3z;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359545.1613077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDFN-0004q6-OW; Fri, 10 Jul 2026 15:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359545.1613077; Fri, 10 Jul 2026 15:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDFN-0004od-Lh; Fri, 10 Jul 2026 15:34:37 +0000
Received: by outflank-mailman (input) for mailman id 1359545;
 Fri, 10 Jul 2026 15:34:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wiDFL-0004oX-Cb
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:34:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiDFK-00HVlE-PR
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:34:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a511103-2eae-0a2a0a5409dd-0a2a4508ce84-12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:34:34 +0200
Received: from [52.101.62.53]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a511109-ee29-0a2a45080019-34653e35cfdf-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:34:34 +0200
Received: from SJ0PR13CA0048.namprd13.prod.outlook.com (2603:10b6:a03:2c2::23)
 by DS0PR12MB6414.namprd12.prod.outlook.com (2603:10b6:8:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 15:34:29 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::83) by SJ0PR13CA0048.outlook.office365.com
 (2603:10b6:a03:2c2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.6 via Frontend Transport; Fri, 10
 Jul 2026 15:34:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 15:34:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 10:34:28 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 10:34:27 -0500
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
 b=szSsYjfgviui3n9eg8Z8wLFvPdEdvFABuPFzaqXB2mR8nM6U9rxRHxQ/ELo/r/G8wX7Ud2L7tWs04r6S5VcDXqNID4iYoimPp+p9zr2l6LqWeQv2ILzkABVCqb/ms4vpZt0J7KkAgqdawqwNHDxSdvpvxihWXKBzNBNEkLVvA8D0QWOpzneI1OQZiHfbEEeBdyhIoOu0PZMNegYMg+klHroHjp59FZbHsn52zdOWwcjsVxYeA4qHNxcEMciVuA94uG6uzCjM6K1EIp7KoMlwQpRyXnrsYPZOn42jg0V46viWpTyKmalppkw6OMHki1Nk7zc1U8pNYvw8U0NbUDsNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq0DjRq+ZiD6Ir916Wa2HhE0ND2dQaCyEKxwapufmns=;
 b=oGwFRJxHKvIsymgxF86DshU8oTPj9lRzoZ2KsmuzTkzMYvoJAJnp9w97bLwrlGhjlqU4pnY9Tiifuf6Rphu5TsQfAHCc/u5/Yjq5N3Gx63n6iuxRUypgeyfzq3rN5nTzyGhPVbCwPSkrDadIpcr05Pgt/F44bL4QzTP5WJcQpng4Ksw2AXkzb5WCQ2JBK+TE3IozrvlqVnSciXoIguyhDZ0NHUTW7DJFXP8RegDNvBZrd3jI632yZ5Q7pJZBUm7kIif+iGehrIjEpG+DS6r+UGuI0aWpH40pv/HTOLilrZGRapwfyP36AkHHZ26BCCK9nLYQzxnD+/FkfgERHz2c9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq0DjRq+ZiD6Ir916Wa2HhE0ND2dQaCyEKxwapufmns=;
 b=MWJITm3z+f7pEoIKPnLlav65Ci8LzZ74xG6R+TkUj9YupYoKj4CHOrkv/vO0BXoeXx7u4iAIMwSNKusVNIjnUDIYqLEd1oUij1sehs4dPzvAZDwNRArmLzDVQ43yA/83CTKEFRanhKSP7HkTkwwYcPYLQ/g0mU79Ln3lUCPgIjM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <eb9e2017-dfba-4336-98cb-7b688aae566f@amd.com>
Date: Fri, 10 Jul 2026 16:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] xen/arm: dump debug message in MPU system
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-7-luca.fancellu@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260420142524.1804073-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|DS0PR12MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: f63f7e65-9539-4864-b0f0-08dede98bb0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	o+NaEzwlLDnlOWd5PcvB8PxAktTs1GH/cwxZKIhcWCyLfzMiay2esMPhmdGMqKI/NJZ/nQepsUt/BF9cJy4ECu4VSo+P+JN4WDhYZTR2Tm+p4SpvAH2l8EwIeGiFgoH+DpYDN0ES9JKntiruKul8IFXF1rhkVh45Y6gCWEAOE56xwVJWdNs120m9WT3whIA6WzNhvNAZRpam2F3cPCrIfWld6iHZPHDgJWuCqOlkBxhMN1HJkhNa3Mj+72EQoBAKIb5xnRr1NiCP2KU2QA+c7vhsLlkAIDHQmzXdOgtxHaEYSrG194cRErIsvFhDIzYPJg/GtrNUI+mqrTuiqPUSUnLKoxh8yzhhHzN6ZMjgoUd4cYBZnqNzuH+Pg0m0IKMOOjA24linJV53R4F2qStpzTE6azhpM39TCVLVxfS7520LfNYQROTX4/I4lyQegvwGE0xD9lcgl/grJZMn4e0ZyNKfInbk4Q5Ivp7rFdoGXNKHmSvjpTnztODXJD4etb5zT07SI9lFQAA61dwZYuRyaWQTqM4qtyk14Z7Ecs2EwvZqTqcs4N8Uvp77I/2AK5MogaqZMsy+zkeIjWJIwBIdTfhKJK0C0FcvhC1f9T2hviBBfWCBb3ZTMN+f5cl5LYOMozurqDJL5DT7XQSK01Nfx8sI7XcwTSDgCs9cVidqwkQMttsnFHSJqiZ3cOUAHSAZC1LOqlDTASqEk03j/2CE/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yrjrhq5WZTTPd7jYDAdSYjDaHu2PewkxZUI9FfhwM/S9WNGkXGiHQLYA61sjQYrfyd3scNv+rz5gA/WQCdH+c4JtYhy7Tic7IoDnzKorTCdO6+oUHBKsj94cWCr24cOrUqJ7BOlUxzgh4RkGWJHSJRyGxbutyLL0SvGMJDH4EAdKLV0Bnuj026MENjKj1l6H7y4ehWjAbNJu5jd6BT1nvslObEAYCxY37Vt0+qT/elWU2gbZqfEEEZ3tbg+mMezrc9uBOoGcGyfS/Tzg4BWky++YXWkSzwUPsz0HNs2uVWJck6kvwoH6Hn/9GhF2q5evE5XUy7VCV6dPDf7Of00qPwz5nJoj7g0S0gP4mDWWKIamgU8ZVTXsfd+q8Ik/82r7jT3yupauvjER6KmJDUcJmMrMi2O+BycjQxcYg1VvQJR8l4pRzPpufw2+qsVcNnOS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:34:28.6962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f63f7e65-9539-4864-b0f0-08dede98bb0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6414
X-purgate-ID: tlsNG-c1860d/1783697674-79C2E01C-8670C4D1/0/0
X-purgate-type: clean
X-purgate-size: 4725
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4176673C4DA

Hi Luca,

On 20/04/2026 15:25, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> A set of helpers dump_xxx and show_registers are responsible for
> dumping memory mapping info and register info when debugging.
> In this commit, we implement them all in MPU system too.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/mpu/mm.c  | 12 +++++++++++-
>   xen/arch/arm/mpu/p2m.c | 40 +++++++++++++++++++++++++++++++++++++++-
>   xen/arch/arm/traps.c   |  8 ++++++++
>   3 files changed, 58 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 5ed77355a5f9..459fb952d125 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -554,7 +554,17 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>   
>   void dump_hyp_walk(vaddr_t addr)
>   {
> -    BUG_ON("unimplemented");
> +    uint8_t i = 0;
> +    pr_t region;
> +
> +    for ( i = 0; i < max_mpu_regions; i++ )
> +    {
> +        read_protection_region(&region, i);
> +        if ( region_is_valid(&region) )
> +            printk(XENLOG_INFO
> +                   "Walking hypervisor MPU memory region [%u]: 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> +                   i, pr_get_base(&region), pr_get_limit(&region));
> +    }
>   }
>   
>   /* Release all __init and __initdata ranges to be reused */
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index bf87c65c106c..06c92a3ef41b 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -215,9 +215,47 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>       return p2m_get_mpu_region(p2m, gfn, 1, t, valid);
>   }
>   
> +static void dump_mpu_walk(pr_t *table, uint8_t nr_regions)
> +{
> +    uint8_t i = 0;
> +
> +    for ( ; i < nr_regions; i++ )
NIT: for ( uint8_t i = 0; ... ).
> +    {
> +        paddr_t base, limit;
> +
> +        if ( region_is_valid(&table[i]) )
> +        {
> +            base = pr_get_base(&table[i]);
> +            limit = pr_get_limit(&table[i]);
> +
> +            printk(XENLOG_INFO
> +                   "Walking MPU memory mapping table: Region[%u]: 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> +                   i, base, limit);
> +        }
> +    }
> +}
> +
> +void dump_p2m_lookup(struct domain *d, paddr_t addr)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    printk("dom%d IPA 0x%"PRIpaddr"\n", d->domain_id, addr);

Shouldn't we take a lock here like we do for the next function ?

p2m_read_lock(p2m);

> +
> +    printk("P2M @ %p mfn:%#"PRI_mfn"\n",
> +           p2m->root, mfn_x(page_to_mfn(p2m->root)));
> +
> +    dump_mpu_walk((pr_t *)page_to_virt(p2m->root), p2m->nr_regions);
> +}
> +
>   void p2m_dump_info(struct domain *d)
>   {
> -    BUG_ON("unimplemented");
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    p2m_read_lock(p2m);
> +    printk("p2m mappings for domain %d (vmid %d):\n",
> +           d->domain_id, p2m->vmid);
> +    printk("  Number of P2M Memory Region: %u \n", p2m->nr_regions);
Trailing whitespace before the newline.
> +    p2m_read_unlock(p2m);
>   }
>   
>   static int p2m_alloc_table(struct domain *d)
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 081bd2e51979..fba7d6c00e37 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -718,6 +718,8 @@ struct reg_ctxt {
>   #ifdef CONFIG_MMU
>       /* Hypervisor-side state */
>       uint64_t vttbr_el2;
> +#else
> +    uint64_t vsctlr_el2;
>   #endif
>   };
>   
> @@ -918,6 +920,8 @@ static void _show_registers(const struct cpu_user_regs *regs,
>       printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
>   #ifdef CONFIG_MMU
>       printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
> +#else
> +    printk(" VSCTLR_EL2: %016"PRIx64"\n", ctxt->vsctlr_el2);
>   #endif
>       printk("\n");
>   
> @@ -959,6 +963,8 @@ void show_registers(const struct cpu_user_regs *regs)
>   #endif
>   #ifdef CONFIG_MMU
>       ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
> +#else
> +    ctxt.vsctlr_el2 = READ_SYSREG(VSCTLR_EL2);
>   #endif
>   
>       _show_registers(regs, &ctxt, guest_mode(regs), current);
> @@ -985,6 +991,8 @@ void vcpu_show_registers(struct vcpu *v)
>   
>   #ifdef CONFIG_MMU
>       ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
> +#else
> +    ctxt.vsctlr_el2 = v->domain->arch.p2m.vsctlr;
>   #endif
>   
>       _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
- Ayan

