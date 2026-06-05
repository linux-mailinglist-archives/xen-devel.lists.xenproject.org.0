Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oziQLJZ7ImrrYAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:32:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D664601A
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=WCAhOsPg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329071.1593282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP2X-0004rK-4W; Fri, 05 Jun 2026 07:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329071.1593282; Fri, 05 Jun 2026 07:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVP2X-0004p1-1Z; Fri, 05 Jun 2026 07:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1329071;
 Fri, 05 Jun 2026 07:32:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wVP2V-0004n7-1K
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:32:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVP2U-00CoGH-EO
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:32:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a227b79-5cb7-0a2a0a5109dd-0a2a4507bbe4-26
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:32:22 +0200
Received: from [52.101.61.2]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a227b84-229c-0a2a45070019-34653d02e47b-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:32:21 +0200
Received: from SA0PR11CA0158.namprd11.prod.outlook.com (2603:10b6:806:1bb::13)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 07:32:14 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::7d) by SA0PR11CA0158.outlook.office365.com
 (2603:10b6:806:1bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 07:32:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 07:32:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 02:32:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 00:32:14 -0700
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 5 Jun 2026 02:32:12 -0500
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
 b=ElwSKkuIAAdYHrY0zRS3enFI61eAJVV6mzLfcSPvgwwlvXAuxn3WkPHSiY4lPBcpAJxh3HghJP7J2n43ueaA2kpYbQTD6X8BFIA5hVMrT7XGrj7r+ocBu8FMJpqoiclsbQcRPUgvkxPq2E3vWHjX9plzDcDiueFAw1AN9Jh1/FB879P1Ziw1k46iFxj2DiWU2fRCMr0zNocaOMY20UQOKKNKml+COw5rucgXqAjXtmLhqurhQPxoytuByUbiLGzNZTmbiqjLsjxfdBAJ9Btq4A88dy/SA+bwo9DYwmnrziAexkEgqIkthOhOrJHQRmw18zS0+sVI5HBKkBcHW28QtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYbuIrUeTrWLgxY5yQau4n0OkZqTKlc1wIVppU03Gts=;
 b=JwKHpumdn/SV8DMkuJz0Npq6wExCh8UxmT8g0qiDHZnX9qiWzz0qOColUV5TrGXg2icUSdK/lBnp/Ms9j1iO/MWvKgTWIc8IvVj2uDnVGAKG5Sg+5KUAQlh6nOBsu8nBICcx6k1MD1BJXSDUSa0iNEkK7/8hnAdVApzTssW4uPp3Ed6nVarNmyTtwJrgVn8a1O2JubhiG/vM3Vzi8dzRLTinVF/80yJVIcw0ShiUQJOIEDCjosyVAmgxV10KhK1/G+r2A8g1Uuzb1jGHqruVMMab0P4X0L5h4CkXv72LdI3BEmMVpBVGCQvoacI4Xxm7qmS38wOx3zqjNsEaGwRDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYbuIrUeTrWLgxY5yQau4n0OkZqTKlc1wIVppU03Gts=;
 b=WCAhOsPghH5jONB9LoOsF4DC//EgJm84wYSU0Cpvq7/POApNEqUkHxAWdE85KvMuI8RyzsCdXO4iEmwFKADbev6k99KRHEF5QEk7YGg30oYPFhAOzQT9QnD+slPJIGpXapp8nuJ0/TxrqjXxDS2zpFhTmCMzb2/UdPYSie6KpTE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a026d572-f0f7-4797-819a-ff3490ba14c8@amd.com>
Date: Fri, 5 Jun 2026 09:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 1/2] xen/arm: split DTB/initrd placement
 helpers
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
 <11537d2b05a6c36d4ba0d852efadeba91d9f6225.1780602987.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <11537d2b05a6c36d4ba0d852efadeba91d9f6225.1780602987.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|SN7PR12MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f40174-761d-455f-2151-08dec2d49099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|3023799007|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	J4H0Oy22TThe4qActUmwlNDW9vVc5PsjlU1N1N6hLgeHDUwKa9Gps+ztgejfVZPQEi+EWv4cyOM/sCi8w1LdvDdeQQZWlrASUpJToqsRcvMl20kFTb+T4XwR/38qf0h0iwhYnPH07fkl+/mZbd//tFGw7WdMWomvfuq0f5e/0GSygvrKQY0Ekj42LIAiCHLTajKObmv9nso2qW4c/luqrF0b3lqCxjrNCDs3piNxLxqatwLcKjCi62Qn4iQ+bPwGOHe21rz/+oK1OGD6DddkKh0pQIyh414CRpbhSVzGDNQyZoYEUiNstd1tlPJtYCEIUUgbCOJ20r77QqyRtYPBwO6q/n/WfBvBsiZVDc22y68VPm/amuTtnx6inM/D5iwbZMpbjTBaRwCnr62ru1duytr2MQLz7udV8NYLLPQ6EvX3q+WR++EW2nsN5B0tzpfBsPU4eDkaYixsvruFz3unJhPY1Mp1JfRHKHlxTn75Il5YrGt6Dr47DGV/u+p6xFfB9+FG7YNKpANSdSrPdfdnYE46XW5Fu4L6kzCCWnx3pBhEWZ2SUCokcKyD5EjOjCGC2A6XbcX+nEdb1ERbf7XmeLLxBvnxb4IJegeabTay4QMXQuaZVoc6lN6kVi1/KYZUFr7AV9XwUT27Y8EvhUm7VpEK+CeEfnhSgRgOPmI1O9Y2Jj5+FdH80WiBTtvRQLU8RKgJZzGbSH35I1hwl9BqaYFMdeC28pe4zrLV2auLMDE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MwAb7dMUMR8Kiu1Ef0VTLJ258c9gonrMzimdp0wweMG58B4egweqFaDjPXBylbnk+LfSU7Edd9nmwLJOLR69cfGNnTXyV9qB2OtldFO0hSh5ED5+swlMZAJ5r1IcNJqPnMu0Y3+aa0iEwnyeoNzixv6X0ivLzepSG0fOR45lbLE68C07gWEe+mcx8d1XOJP7+jUUCfM6FTWnOlKJGQ7PT/bh2oFxtTJ8QPRiWbZZ7bkE54ywCqvypbXpppjLl4iBDRciCOUHaGkrxXagI3VeMPy0qHciV3ndwmycuCksixHCXFhmRgzKYrdb8tvGQl4PQcU2FsYMVQi4WZXMsr+F/u3hRZ/w4HXUYYJ93ULhlhsjFu1NXj77DfcrPEbJf0t/bzhDuhOSHAUVE5cE76q7H9TvtxYhVvvqaDRgM8n1v8Fk7IfcRQ2FL8nY6zPlEEf9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:32:14.7584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f40174-761d-455f-2151-08dec2d49099
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862
X-purgate-ID: tlsNG-ef75cf/1780644741-22772C48-655F04F2/0/0
X-purgate-type: clean
X-purgate-size: 5836
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D9D664601A

We are in the RC phase, so please CC Oleksii (release manager) as we need his
tags for fixes. Adding him now.

On 05-Jun-26 07:19, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The Arm zImage loader currently computes the kernel load address and
> places the DTB/initrd in one local flow. The hardware-domain memory
> allocator needs to reuse those placement rules before it chooses bank 0,
> but open-coding the same calculations there would make the fix harder to
> audit.
> 
> Split the existing logic into small helpers:
> - kernel_zimage_place_in_bank() computes the zImage load address for a
>   given bank.
> - first_bank_can_fit_modules() checks the aggregate first-bank
>   footprint.
> - find_dtb_initrd_placement() chooses the DTB/initrd location within a
>   known bank and kernel range.
> 
> Rename place_modules() to place_dtb_initrd() so the code distinguishes
> the kernel image from the DTB/initrd placement area. Also update the
> stale xg_dom_arm.c path in the placement comment.
> 
> The caller still panics in the same cases as before, so this is intended
> to be behavior preserving.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - New patch split out from the hardware-domain first-bank fix.
> - Rename the DTB/initrd placement helpers to avoid treating the kernel
>   and DTB/initrd as the same kind of module.
> - Pass the RAM end address to find_dtb_initrd_placement() instead of
>   recomputing it from the RAM size.
> - Update the stale xg_dom_arm.c reference in the placement comment.
> ---
>  xen/arch/arm/kernel.c                 | 147 ++++++++++++++++----------
>  xen/common/device-tree/domain-build.c |   6 +-
>  2 files changed, 97 insertions(+), 56 deletions(-)
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index b72585b7fe..d1be4d8074 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -40,27 +40,59 @@ struct minimal_dtb_header {
>      /* There are other fields but we don't use them yet. */
>  };
>  
> -static void __init place_modules(struct kernel_info *info,
> -                                 paddr_t kernbase, paddr_t kernend)
> +static paddr_t __init
> +kernel_zimage_place_in_bank(const struct kernel_info *info,
> +                            paddr_t bank_start, paddr_t bank_size)
>  {
> -    /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
> -    const struct boot_module *mod = info->bd.initrd;
> -    const struct membanks *mem = kernel_info_get_mem(info);
> -    const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
> -    const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
> -    const paddr_t modsize = initrd_len + dtb_len;
> +    paddr_t load_addr;
>  
> -    /* Convenient */
> -    const paddr_t rambase = mem->bank[0].start;
> -    const paddr_t ramsize = mem->bank[0].size;
> -    const paddr_t ramend = rambase + ramsize;
> +#ifdef CONFIG_HAS_DOMAIN_TYPE
> +    if ( (info->type == DOMAIN_64BIT) && (info->image.start == 0) )
> +        return bank_start + info->image.text_offset;
> +#endif
> +
> +    /*
> +     * If start is zero, the zImage is position independent, in this
> +     * case Documentation/arm/Booting recommends loading below 128MiB
> +     * and above 32MiB. Load it as high as possible within these
> +     * constraints, while also avoiding the DTB.
> +     */
> +    if ( info->image.start == 0 )
> +    {
> +        paddr_t load_end;
> +
> +        load_end = bank_start + bank_size;
> +        load_end = MIN(bank_start + MB(128), load_end);
> +
> +        load_addr = load_end - info->image.len;
> +        /* Align to 2MB */
> +        load_addr &= ~(MB(2) - 1);
For the future mechanical changes, you should not be making even such tiny
changes like s/(2 << 20)/MB(2) without mentioning them in commit msg. For today,
it's ok.

> +    }
> +    else
> +        load_addr = info->image.start;
> +
> +    return load_addr;
> +}
> +
> +static bool __init first_bank_can_fit_modules(paddr_t ramsize,
> +                                              paddr_t kernbase, paddr_t kernend,
> +                                              paddr_t dtb_initrd_size)
> +{
>      const paddr_t kernsize = ROUNDUP(kernend, MB(2)) - kernbase;
> -    const paddr_t ram128mb = rambase + MB(128);
>  
> -    paddr_t modbase;
> +    /*
> +     * Check only the aggregate kernel + DTB/initrd footprint. The actual
> +     * DTB/initrd location is selected by find_dtb_initrd_placement().
> +     */
> +    return dtb_initrd_size + kernsize <= ramsize;
> +}
>  
> -    if ( modsize + kernsize > ramsize )
> -        panic("Not enough memory in the first bank for the kernel+dtb+initrd\n");
> +static bool __init find_dtb_initrd_placement(paddr_t rambase, paddr_t ramend,
> +                                             paddr_t kernbase, paddr_t kernend,
> +                                             paddr_t dtb_initrd_size,
> +                                             paddr_t *dtb_base)
> +{
> +    const paddr_t ram128mb = rambase + MB(128);
>  
>      /*
>       * DTB must be loaded such that it does not conflict with the
> @@ -77,55 +109,64 @@ static void __init place_modules(struct kernel_info *info,
>       * just before the kernel.
>       *
>       * If changing this then consider
> -     * tools/libxc/xc_dom_arm.c:arch_setup_meminit as well.
> +     * tools/libs/guest/xg_dom_arm.c:meminit as well.
This fixes the kernel.c -> tools pointer, but the reverse comment in
xg_dom_arm.c:meminit still points at place_modules. This needs to be fixed.

I think this can be done on commit, therefore:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


