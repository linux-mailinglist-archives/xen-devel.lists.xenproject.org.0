Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9166BA35
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478490.741718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLj5-0002T8-9V; Mon, 16 Jan 2023 09:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478490.741718; Mon, 16 Jan 2023 09:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLj5-0002Pk-6S; Mon, 16 Jan 2023 09:24:23 +0000
Received: by outflank-mailman (input) for mailman id 478490;
 Mon, 16 Jan 2023 09:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHLj3-0002Pc-0i
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:24:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ba92745-957f-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 10:24:17 +0100 (CET)
Received: from CY5P221CA0067.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::42) by
 CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 09:24:12 +0000
Received: from CY4PEPF0000C985.namprd02.prod.outlook.com
 (2603:10b6:930:4:cafe::7b) by CY5P221CA0067.outlook.office365.com
 (2603:10b6:930:4::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 09:24:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C985.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 09:24:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 03:24:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 03:23:58 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 16 Jan 2023 03:23:57 -0600
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
X-Inumbo-ID: 8ba92745-957f-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCPTO1LoTWCGdxhrWuuKPO7xv7IMlSJcXrfmqXQuM1hj2D6T70DPlEQCJhFY4TDMiP52fTLdYbH1N14nHrx7smtV58FO6QlxKSGtOWxX0zwkP5p+riI05yqxdtZqrpvX5JVWTVB4eK97rQ+7bV5N56kWtUklL4CFM+iv3yAH4CH6iGrL38WALncMv/3XtCUp09h7SehZmqHv9+LDLcWxgkTbC2V7gnRdweg2tOp7SK7Cgh7zE4kbhBxBG6n3p/Gfc0V49NvKiw1R8MWb2+f057cLuuxsWb3qTGTW2w6Ww1eytaGIskNTh/N7UK9BzHJlS+xDau4I/epItKzTko5UbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M98l9Cp54GVTYjj+Azy5Y384U23wcTC4npMxyvD3UEg=;
 b=GPX2jKrQ7NRI9qWlXIWMXjYoDGqJ/0hylH0wsXh0IgOkPYwbdhoQHzCHTJouk5Q4czqePLPPgzswmmaSNL+eQZCHZFFUIMAYe6ZhG0T9MQ8tWIkcO3sgSIj5OTaBeCp8Ia7N5lpYz6otfJ+7BYJIrpGc+g60dqMoEtvHs2FmB5qA4VkNRcrfY18vr8lYRXKuqk7y/iWkcsXblWuitPlLeMbOxbgFJlTWcuVKO/ip5TYO3TYNI3/kLhdRnn6DjLrFRAG6FjBE0KY4TgP4Hhou4oATacm3nvRCZ9keVqNjM4vFzXNCGj3ymDM7m+McbF/DUqeG87d7uXfY4TQfalii5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M98l9Cp54GVTYjj+Azy5Y384U23wcTC4npMxyvD3UEg=;
 b=wHmRi1+wBn6Ad6AYbG6PuAURb7DzPzMJLeV8AVjbEdntT/p7v2ftVpM2nyQmtVjHXOJl8CBpJLWC8xUmz0DQ2UY5rNHzJsSHJGMBwJbj3o9I0eG29ruWQuUUvy5uJPLAJXJfpFGDznegTiUkkvS0D3njNU66tvjFrA4woE6usv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <19559eed-525e-206f-c8ac-f9902f610714@amd.com>
Date: Mon, 16 Jan 2023 10:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/14] xen/arm64: mm: Rework switch_ttbr()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-14-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113101136.479-14-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C985:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 235c979d-3e62-4453-5fc5-08daf7a36dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QMYL4QRWKk/QSD4iVcb9691I0//5Mev4RklknGxwWTmK7+KR8Azk0JXEUPbtp6SN6hoBEZnrCEZUB2ARPOa9UPF9fxBsEx3wW/4DpI410dG5Tccktngyy2juvqBs/nglQ6HJLc9hXI/OsDLR4nYtJmBf6Q3b9pXv7unQpH9HYuUwwP2LswXNSyE4xsgQITbww/IB2zAJYOLhdf/YljdOM/js0uv/hmaUUGCcpxcjyEVOCf/G/R1AxJv/Sttll5B+Icin3pX4GGPzItLRdKUlpjbfVdbHijFQ3/b6g1o6Xn4ui+cqs+wfET15jQYFhyURi1ZLb4LyPzn9mNSaLDTJZTC9uZVUYouYj1yjapi4V9sl68CiM1wIrFfMenN7Y+kAT3XNf3N0BUXuHpGrtOrX11xLyVHhs7YdYEc0v4uPtezo5yZ/NAnlfbqNa2DMQrJ1wuZ2pVzDjWDeSin1KCtNarGloXqNyONWo4S83aoSdfLwrP9P6SRpy3mQcU7lWg9OJ/YhWiAyE2w3SFSRxcTGz6JoCJVuKd9cKq0hn/gOKx8ex38DN6+kFeMRxFZ9g3iJfWq+Iwt8arN6DTEVv+noc96asROYAFweTAiNuObja76M/C9Lscs5ABmpWJ8BStzjQrj4E8uduzaXsRUjjt+ixpgreWJOPW3xDlBlAzZH6sZhyw9GvMa5wEEveIHhrdeoLeUw7xMVnlbq3nRtDfyhJLHN/zwuSXnh1g2uGXDu5pJrfyrp0ZTv+v321ustmvoo+0zv7NlO7lLIt+m1w3feMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(53546011)(66899015)(336012)(16576012)(186003)(26005)(316002)(478600001)(70586007)(41300700001)(426003)(70206006)(8676002)(47076005)(83380400001)(8936002)(5660300002)(4326008)(2906002)(44832011)(36860700001)(40480700001)(356005)(81166007)(2616005)(82740400003)(31696002)(86362001)(54906003)(110136005)(36756003)(40460700003)(31686004)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 09:24:11.7912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235c979d-3e62-4453-5fc5-08daf7a36dba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C985.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644

Hi Julien,

On 13/01/2023 11:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
> still on.
> 
> Switching TTBR is like replacing existing mappings with new ones. So
> we need to follow the break-before-make sequence.
> 
> In this case, it means the MMU needs to be switched off while the
> TTBR is updated. In order to disable the MMU, we need to first
> jump to an identity mapping.
> 
> Rename switch_ttbr() to switch_ttbr_id() and create an helper on
> top to temporary map the identity mapping and call switch_ttbr()
> via the identity address.
> 
> switch_ttbr_id() is now reworked to temporarily turn off the MMU
> before updating the TTBR.
> 
> We also need to make sure the helper switch_ttbr() is part of the
> identity mapping. So move _end_boot past it.
> 
> The arm32 code will use a different approach. So this issue is for now
> only resolved on arm64.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
>     Changes in v4:
>         - Don't modify setup_pagetables() as we don't handle arm32.
>         - Move the clearing of the boot page tables in an earlier patch
>         - Fix the numbering
> 
>     Changes in v2:
>         - Remove the arm32 changes. This will be addressed differently
>         - Re-instate the instruct cache flush. This is not strictly
>           necessary but kept it for safety.
>         - Use "dsb ish"  rather than "dsb sy".
> 
> 
>     TODO:
>         * Handle the case where the runtime Xen is loaded at a different
>           position for cache coloring. This will be dealt separately.
> ---
>  xen/arch/arm/arm64/head.S     | 50 +++++++++++++++++++++++------------
>  xen/arch/arm/arm64/mm.c       | 30 +++++++++++++++++++++
>  xen/arch/arm/include/asm/mm.h |  2 ++
>  xen/arch/arm/mm.c             |  2 --
>  4 files changed, 65 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 663f5813b12e..5efd442b24af 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -816,30 +816,46 @@ ENDPROC(fail)
>   * Switch TTBR
>   *
>   * x0    ttbr
> - *
> - * TODO: This code does not comply with break-before-make.
>   */
> -ENTRY(switch_ttbr)
> -        dsb   sy                     /* Ensure the flushes happen before
> -                                      * continuing */
> -        isb                          /* Ensure synchronization with previous
> -                                      * changes to text */
> -        tlbi   alle2                 /* Flush hypervisor TLB */
> -        ic     iallu                 /* Flush I-cache */
> -        dsb    sy                    /* Ensure completion of TLB flush */
> +ENTRY(switch_ttbr_id)
> +        /* 1) Ensure any previous read/write have completed */
> +        dsb    ish
> +        isb
> +
> +        /* 2) Turn off MMU */
> +        mrs    x1, SCTLR_EL2
> +        bic    x1, x1, #SCTLR_Axx_ELx_M
> +        msr    SCTLR_EL2, x1
> +        isb
> +
> +        /*
> +         * 3) Flush the TLBs.
> +         * See asm/arm64/flushtlb.h for the explanation of the sequence.
> +         */
> +        dsb   nshst
> +        tlbi  alle2
> +        dsb   nsh
> +        isb
> +
> +        /* 4) Update the TTBR */
> +        msr   TTBR0_EL2, x0
>          isb
> 
> -        msr    TTBR0_EL2, x0
> +        /*
> +         * 5) Flush I-cache
> +         * This should not be necessary but it is kept for safety.
> +         */
> +        ic     iallu
> +        isb
> 
> -        isb                          /* Ensure synchronization with previous
> -                                      * changes to text */
> -        tlbi   alle2                 /* Flush hypervisor TLB */
> -        ic     iallu                 /* Flush I-cache */
> -        dsb    sy                    /* Ensure completion of TLB flush */
> +        /* 6) Turn on the MMU */
> +        mrs   x1, SCTLR_EL2
> +        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
> +        msr   SCTLR_EL2, x1
>          isb
> 
>          ret
> -ENDPROC(switch_ttbr)
> +ENDPROC(switch_ttbr_id)
> 
>  #ifdef CONFIG_EARLY_PRINTK
>  /*
> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> index 798ae93ad73c..2ede4e75ae33 100644
> --- a/xen/arch/arm/arm64/mm.c
> +++ b/xen/arch/arm/arm64/mm.c
> @@ -120,6 +120,36 @@ void update_identity_mapping(bool enable)
>      BUG_ON(rc);
>  }
> 
> +extern void switch_ttbr_id(uint64_t ttbr);
> +
> +typedef void (switch_ttbr_fn)(uint64_t ttbr);
> +
> +void __init switch_ttbr(uint64_t ttbr)
> +{
> +    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
Shouldn't id_addr be of type paddr_t?

> +    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
> +    lpae_t pte;
> +
> +    /* Enable the identity mapping in the boot page tables */
> +    update_identity_mapping(true);
Could you please add an empty line here?

~Michal

