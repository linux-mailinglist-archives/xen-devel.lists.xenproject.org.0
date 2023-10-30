Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444E7DB51A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 09:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.624966.973774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxNda-0000BV-1c; Mon, 30 Oct 2023 08:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624966.973774; Mon, 30 Oct 2023 08:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxNdZ-00007x-UZ; Mon, 30 Oct 2023 08:28:41 +0000
Received: by outflank-mailman (input) for mailman id 624966;
 Mon, 30 Oct 2023 08:28:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nl15=GM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qxNdZ-00007j-3C
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 08:28:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530a3d4f-76fe-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 09:28:39 +0100 (CET)
Received: from CY8PR12CA0043.namprd12.prod.outlook.com (2603:10b6:930:49::25)
 by DM4PR12MB5278.namprd12.prod.outlook.com (2603:10b6:5:39e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 08:28:34 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::fd) by CY8PR12CA0043.outlook.office365.com
 (2603:10b6:930:49::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 08:28:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 08:28:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 03:28:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 03:28:26 -0500
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
X-Inumbo-ID: 530a3d4f-76fe-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp/+qvKm8gZIiWnGskOf1BhzsN377NlUMRcXduEmnoMkFnCH3B+9x7pRx2n6CGd4zBJoYe6zGm5Iv4clCLqoF7iufUK7bUFIGF9WcIvcGwnlE4aK2RuAvfi1fC2VHv9ft8Lhwi+WfoTgHeJluk1LcLgS5cuQ6qc4MEd3dokj3ZIeKGzh1jz2uk9/sH0QARQSExQOn/X07T72LuVD/Dneul2eGOceKj3W5R24A4BeRgzwslOkmcFliOQognsFAVLP8udo1VkViYJNcjlUOb5D0kRkEiEioF6lJWvPVvnYrZuyzRB8GFr7iDGs2QVbJXZ2lXeOUdKl5A6DT4Kdfx4izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcs1akE3wttCtucFFzEnmsMI8uITNQcYuvG81FlzCTw=;
 b=QbQ6WXXDZVfm3glBDwK/ZIAnofd6sNkJVfV5EzMgxHndEzofX5QptcN7sRVDbRTxDtWpWRy3xJxUMM/sAInQUgTxKhjmbBhiPd2GbGkW4Yq+wwTWZskeYfoDw73+UdTRJIHpo4e76QYv7gLJuF2x9uVPsJ1kEtaaMz1clTQ7VSmLX/X8Ml3b1N/Bu83RIJHHYmS+ob379YxXP1IVdaA8OY8eS2N+wTlX9QZxR7sjjzOL1FsChx3X1T7DSJ4Z5LNFk0Re3wLG6+8t6Wzzp2fW53Qh7kPXLWxjwsjkb30IrdRFvAsG6NmhOPvRIEEJgv6ZecpaXq1TeUNBZ6BpycnDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcs1akE3wttCtucFFzEnmsMI8uITNQcYuvG81FlzCTw=;
 b=kI7FbGBE6ZK0Kjm7VPB17DKKnIqq8U1xKMSCbuWp2ZVIlecngU+9jkEmPeYxHf9lAremLDkXHYLBg9vm2A9gK+QV6YY+gBvkNxg8/Lblnu2fbjXec33c/QenHNhKXKflJ3PqjKu+tXUXUfDu/FJ9vAyMejjJ0qu7qxkwS4IPozM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fd9a1eb2-c62f-44ed-977a-e4fee498fe0c@amd.com>
Date: Mon, 30 Oct 2023 09:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v3] xen/arm32: head: Replace load_paddr with adr_l when they
 are equivalent
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>
References: <20231027180715.3484439-1-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231027180715.3484439-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DM4PR12MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0db482-8371-4577-85e9-08dbd9223450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qc+0+VlDYBORwHp8UILUcbIKEqxJozvvGNb+haAJ3V8mJ5sdeA1UToFZW9SYq7CgfvBRuwtGjIIPzGmPT33XjpxbjPB8yrn1iHXXfpvm4T2Bk0jJZfwfc9btDTXmytA8yQTIo+84HZKj94QlJ3mpnCgDAwLR2D+U0tDk6GUqZtJs99Otrr9ej75WFih3LGmbjl5xsWfVlTCiX7HwXNGmsL0Sl1gBVXeoV3X985RikK5u7mgrzrvdVg8JksgoxLjCtqbvqES8IRgSm5gVtc2tKELvlZ0UE+jayIrESfIMepfTvOCruUPUejX1F2E0ZrodKdk59zTe/H6f82R8XM48ncJHmx9R5tmzChsdL8maGVMAJfmGGQnt3rbwmqGmjzKsqyeZL3Pp+Yh3nkwE84PF1cjdvTtDmtkOtJbQY1v654PTEkwW9LeGOl0vR97ceR4sNPede1fvQTRxSI4zlCdsRiDqK9ZwBCY8UDE3epWm27yzHeKXP1+0rsXc99NyiS2AeHdIaZbOoKIaz07+V04yA9NczdvV/8R7K63kNfKBF9KtwIj2I5/JMJt3pnpRrlQqk6F/pfcE1Y/49TliEzFJXkgUcADeE0oTDddSXo/z1/W613n9yd8lQH0UuDDDkWVqy9BdCODBbvUDQuf/T8KZGuR/tM5zu6hKsz4nmUq1g2uZaZvzyRW+I5E1ti/+OujlK+ZLY9X2G4z0ee1QNGSvQYpRr3rLzHEysDflpz7xzmASqJEhFDTaKrdQJpSmcxg3yelhH97E3UVc5JdpzG/K9Eiq9k0yVpeTwA4pUXfjwFQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(82310400011)(186009)(1800799009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(31686004)(16576012)(40460700003)(2906002)(5660300002)(44832011)(41300700001)(4326008)(8676002)(8936002)(36756003)(40480700001)(31696002)(86362001)(82740400003)(316002)(54906003)(36860700001)(47076005)(356005)(81166007)(70586007)(70206006)(83380400001)(110136005)(426003)(26005)(2616005)(336012)(966005)(53546011)(478600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 08:28:33.1613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0db482-8371-4577-85e9-08dbd9223450
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5278

Hi Ayan,

On 27/10/2023 20:07, Ayan Kumar Halder wrote:
> Before the MMU is turned on, PC uses physical address. Thus, one can use adr_l
> instead of load_paddr to obtain the physical address of a symbol.
> 
> The only exception (for this replacement) is create_table_entry() which is
> called before and after MMU is turned on.
> 
> Also, in lookup_processor_type() "r10" is no longer used. The reason being
> __lookup_processor_type uses adr_l (thus r10 is no longer used to obtain the
> physical address offset). Consequently, there is no need to save/restore r10.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.
> 
> Changes from :-
> 
> v1 :- 1. No need to modify create_table_entry().
> 2. Remove "mov   r10, #0 " in lookup_processor_type().
> 
> v2 :- 1. No need to save/restore r10 in lookup_processor_type().
> 2. Update the commit message title.
> 
>  xen/arch/arm/arm32/head.S | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0..1fcc6f745e 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -171,7 +171,7 @@ past_zImage:
>  
>          /* Using the DTB in the .dtb section? */
>  .ifnes CONFIG_DTB_FILE,""
> -        load_paddr r8, _sdtb
> +        adr_l r8, _sdtb
>  .endif
>  
>          /* Initialize the UART if earlyprintk has been enabled. */
> @@ -213,7 +213,7 @@ GLOBAL(init_secondary)
>          mrc   CP32(r1, MPIDR)
>          bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get CPU ID */
>  
> -        load_paddr r0, smp_up_cpu
> +        adr_l r0, smp_up_cpu
>          dsb
>  2:      ldr   r1, [r0]
>          cmp   r1, r7
> @@ -479,7 +479,7 @@ create_page_tables:
>           * create_table_entry_paddr() will clobber the register storing
>           * the physical address of the table to point to.
>           */
> -        load_paddr r5, boot_third
> +        adr_l r5, boot_third
>          mov_w r4, XEN_VIRT_START
>  .rept XEN_NR_ENTRIES(2)
>          mov   r0, r5                        /* r0 := paddr(l3 table) */
> @@ -578,7 +578,7 @@ enable_mmu:
>          flush_xen_tlb_local r0
>  
>          /* Write Xen's PT's paddr into the HTTBR */
> -        load_paddr r0, boot_pgtable
> +        adr_l r0, boot_pgtable
>          mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
>          mcrr  CP64(r0, r1, HTTBR)
>          isb
> @@ -876,11 +876,10 @@ putn:   mov   pc, lr
>  
>  /* This provides a C-API version of __lookup_processor_type */
>  ENTRY(lookup_processor_type)
> -        stmfd sp!, {r4, r10, lr}
> -        mov   r10, #0                   /* r10 := offset between virt&phys */
> +        stmfd sp!, {r4, lr}
>          bl    __lookup_processor_type
>          mov r0, r1
> -        ldmfd sp!, {r4, r10, pc}
> +        ldmfd sp!, {r4, pc}
>  
>  /*
>   *  Read processor ID register (CP#15, CR0), and Look up in the linker-built
> @@ -888,8 +887,6 @@ ENTRY(lookup_processor_type)
>   * the __proc_info lists since we aren't running with the MMU on (and therefore,
>   * we are not in correct address space). We have to calculate the offset.
In v2, I mentioned that this comment needs to be tweaked as well. We no longer use load_paddr
thus we don't care about the offset. I would remove the comment starting from "Note that...".
to avoid confusion or add a proper explanation if you want to keep it.
With that addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

