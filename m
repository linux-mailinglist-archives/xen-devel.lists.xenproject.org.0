Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6966B8F7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478420.741598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKju-0006fH-HG; Mon, 16 Jan 2023 08:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478420.741598; Mon, 16 Jan 2023 08:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHKju-0006d1-EA; Mon, 16 Jan 2023 08:21:10 +0000
Received: by outflank-mailman (input) for mailman id 478420;
 Mon, 16 Jan 2023 08:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHKjt-0006cv-8u
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:21:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9600019-9576-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 09:21:07 +0100 (CET)
Received: from DM6PR13CA0037.namprd13.prod.outlook.com (2603:10b6:5:134::14)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 08:21:03 +0000
Received: from DS1PEPF0000E638.namprd02.prod.outlook.com
 (2603:10b6:5:134:cafe::23) by DM6PR13CA0037.outlook.office365.com
 (2603:10b6:5:134::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Mon, 16 Jan 2023 08:21:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E638.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 08:21:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 02:21:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 02:20:53 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 16 Jan 2023 02:20:51 -0600
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
X-Inumbo-ID: b9600019-9576-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qw+i8N+aEtFABgk7RjWCKRmbL/z0y2JvlcGhmbPUE4Sik2Y6f7OH25XdUZWu4f6aAvxR+EdARvdGWWBCZNNa/f0uNqTfVCBxSHh6xB1Cw8dAkImm4EWeC28tuCupsjDAg13bwvQzn1kgK/urCgHSxNFILSevL2JEPoZbHwhAvDe/q90bF5TC0C7Zrp9EkO5MPrgkTmO9RMxEpuz/3Yvz44r32Yk0GkFpUq7qujK88q/MPi6sEk6KyeCRocIoRbxCT868QzloM2c9sxaYkNA6chJGjtO9Ip+CMfngcYKbhX+xeQmndu9lRp7tM51iv6jtIjXHrtKHXE6BEtbPU7SI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAGxMev/Uqdz8y1zI806Zr9i1eSD9520EXPwF22pQzs=;
 b=QhZzyyEjihyr7LYhncOOWahuklqJOVXcG8Lj8QZvFpQx9ahuG3sjkoJZfN6XeuYB97LAuAUuLHfjQ0FjvMSdKTSI6z/FFU48S2Q1tz2H5rccRnU1TVlB0tHto9Po1j8CS2KYiUVI8wp82SRn/nZ6hiOkZHwBXsM+DGwNuQNkxUOLXIusUSuMMlZrV/3PWuSqOTR1qupZzyZOP4eocaJiGCWcn4tywuHwGKHLe2MwfASOYDNFh6kFqkGW0Nk7OS2r022Uf9QAPCz4OJP8qroK+R6bFBLKtsRTpTgzG/DWFXWeBxe87JVj6LhUvEd3JtyYUFR9Kf78fG9fDvrffvAS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAGxMev/Uqdz8y1zI806Zr9i1eSD9520EXPwF22pQzs=;
 b=z7OEqUijyfr1gQ0hWOedUoeR2OpcISTrTYbkRhaQH7QN8guMPOzKisVTmpLYM/PNFDZ49mOHF48EXgvkl83BqF3q969Uf3HBo+b/1MaGsDjFGL8jRC3M7n9rHcvaN028YUitqipmpfONd7vl0WbXIDoi7NphzFeNuvu1M5HDGyk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0271e540-d3b0-fb9b-0f66-015abb45231c@amd.com>
Date: Mon, 16 Jan 2023 09:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/14] xen/arm32: head: Widen the use of the temporary
 mapping
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-11-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113101136.479-11-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E638:EE_|PH0PR12MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: ff925a23-bba1-41c8-4ca5-08daf79a9b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kc5klwM/4nM+8N0tSgFnLMZva1dR4ROKm6odIX1N9gVvLcXRxadXEN3X4LJMAGETBOxn8tPivdI9r+vBYUL6eGpj77WepM0qBFs6opqDVMLPtbz683xF1RliixwIbp5PXSKXN5oAI0ulCmW3z0kX5Vvj3Ui+lbuJrRCYPF7o77g5JExoNutN7uZdrecaXXZ+zGTEjllvCZEnGFgOA5l+WihMFptzVY3a3qidR2AwIVOY5yVqatl+S8vjoJW5Od9N2F6nbNU83JysqEUznpq/XHh/EoM81qwEnRIf2bktDHrctAQZeVT1qVtE+VhB8Wr0YKpZcsn6QWsriu0ZG2rcsl7to2Ty/Hr0PSWHGqw69Mwm+FUqt5vNYetqlfLxLyW4bTdGUcJuhfSjdPZlOtknrckyoHXs0qnRCpspceSDrzMrNhgmn8JduijKEWVsyHebTBdBlm8/5ABvgN91hn1gKWXcbKAgOwxRgNSQVc8PAfnVfsmbm5BElG4C7ug9crN+aaVVtVdr8zGR/PApIBb7zDKNz74tggD7IwyE6IzkrlTZf6PvtBN+xHodvQJOyciT+7strvvD2R9liFEeXmO+2wQJis+/B+R4/StO7sj6x/ofuQKsgiswyVxSG1xVWj79pqvM2AWM+ETa4FdK/SVsQrxJI1myEy9pdGSTjxLPgKe/HXerjgMSgWKpV6UWJnl4g990WmuN0IzL5OyuLnZ5hL8mdzzm3pWP59stRvuFBoHyDbge+Ls1qNRZpEOc5p1XWFIAz25U2PCY73Ew2FuzjA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(31686004)(44832011)(5660300002)(8936002)(54906003)(41300700001)(70586007)(70206006)(4326008)(110136005)(8676002)(316002)(2906002)(82740400003)(356005)(81166007)(478600001)(53546011)(82310400005)(26005)(16576012)(36756003)(186003)(47076005)(36860700001)(336012)(426003)(31696002)(40460700003)(40480700001)(86362001)(2616005)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 08:21:02.7599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff925a23-bba1-41c8-4ca5-08daf79a9b45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E638.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960

Hi Julien,

On 13/01/2023 11:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the temporary mapping is only used when the virtual
> runtime region of Xen is clashing with the physical region.
> 
> In follow-up patches, we will rework how secondary CPU bring-up works
> and it will be convenient to use the fixmap area for accessing
> the root page-table (it is per-cpu).
> 
> Rework the code to use temporary mapping when the Xen physical address
> is not overlapping with the temporary mapping.
> 
> This also has the advantage to simplify the logic to identity map
> Xen.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
> Even if this patch is rewriting part of the previous patch, I decided
> to keep them separated to help the review.
> 
> The "folow-up patches" are still in draft at the moment. I still haven't
> find a way to split them nicely and not require too much more work
> in the coloring side.
> 
> I have provided some medium-term goal in the cover letter.
> 
>     Changes in v3:
>         - Resolve conflicts after switching from "ldr rX, <label>" to
>           "mov_w rX, <label>" in a previous patch
> 
>     Changes in v2:
>         - Patch added
> ---
>  xen/arch/arm/arm32/head.S | 82 +++++++--------------------------------
>  1 file changed, 15 insertions(+), 67 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 3800efb44169..ce858e9fc4da 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -459,7 +459,6 @@ ENDPROC(cpu_init)
>  create_page_tables:
>          /* Prepare the page-tables for mapping Xen */
>          mov_w r0, XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, 1
>          create_table_entry boot_second, boot_third, r0, 2
> 
>          /* Setup boot_third: */
> @@ -479,67 +478,37 @@ create_page_tables:
>          cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
>          blo   1b
> 
> -        /*
> -         * If Xen is loaded at exactly XEN_VIRT_START then we don't
> -         * need an additional 1:1 mapping, the virtual mapping will
> -         * suffice.
> -         */
> -        cmp   r9, #XEN_VIRT_START
> -        moveq pc, lr
> -
>          /*
>           * Setup the 1:1 mapping so we can turn the MMU on. Note that
>           * only the first page of Xen will be part of the 1:1 mapping.
> -         *
> -         * In all the cases, we will link boot_third_id. So create the
> -         * mapping in advance.
>           */
> +        create_table_entry boot_pgtable, boot_second_id, r9, 1
> +        create_table_entry boot_second_id, boot_third_id, r9, 2
>          create_mapping_entry boot_third_id, r9, r9
> 
>          /*
> -         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
> -         * then the 1:1 mapping will use its own set of page-tables from
> -         * the second level.
> +         * Find the first slot used. If the slot is not the same
> +         * as XEN_TMP_FIRST_SLOT, then we will want to switch
Do you mean TEMPORARY_AREA_FIRST_SLOT?

> +         * to the temporary mapping before jumping to the runtime
> +         * virtual mapping.
>           */
>          get_table_slot r1, r9, 1     /* r1 := first slot */
> -        cmp   r1, #XEN_FIRST_SLOT
> -        beq   1f
> -        create_table_entry boot_pgtable, boot_second_id, r9, 1
> -        b     link_from_second_id
> -
> -1:
> -        /*
> -         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
> -         * 1:1 mapping will use its own set of page-tables from the
> -         * third level.
> -         */
> -        get_table_slot r1, r9, 2     /* r1 := second slot */
> -        cmp   r1, #XEN_SECOND_SLOT
> -        beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, r9, 2
> -        b     link_from_third_id
> +        cmp   r1, #TEMPORARY_AREA_FIRST_SLOT
> +        bne   use_temporary_mapping
> 
> -link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, r9, 2
> -link_from_third_id:
> -        /* Good news, we are not clashing with Xen virtual mapping */
> +        mov_w r0, XEN_VIRT_START
> +        create_table_entry boot_pgtable, boot_second, r0, 1
>          mov   r12, #0                /* r12 := temporary mapping not created */
>          mov   pc, lr
> 
> -virtphys_clash:
> +use_temporary_mapping:
>          /*
> -         * The identity map clashes with boot_third. Link boot_first_id and
> -         * map Xen to a temporary mapping. See switch_to_runtime_mapping
> -         * for more details.
> +         * The identity mapping is not using the first slot
> +         * TEMPORARY_AREA_FIRST_SLOT. Create a temporary mapping.
> +         * See switch_to_runtime_mapping for more details.
>           */
> -        PRINT("- Virt and Phys addresses clash  -\r\n")
>          PRINT("- Create temporary mapping -\r\n")
> 
> -        /*
> -         * This will override the link to boot_second in XEN_FIRST_SLOT.
> -         * The page-tables are not live yet. So no need to use
> -         * break-before-make.
> -         */
>          create_table_entry boot_pgtable, boot_second_id, r9, 1
>          create_table_entry boot_second_id, boot_third_id, r9, 2
Do we need to duplicate this if we just did the same in create_page_tables before branching to
use_temporary_mapping?

~Michal


