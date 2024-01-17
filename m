Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FAB83018F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 09:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668284.1040358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1fz-0000gj-8M; Wed, 17 Jan 2024 08:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668284.1040358; Wed, 17 Jan 2024 08:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1fz-0000dR-37; Wed, 17 Jan 2024 08:53:35 +0000
Received: by outflank-mailman (input) for mailman id 668284;
 Wed, 17 Jan 2024 08:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2QPC=I3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rQ1fx-0000Nt-DP
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 08:53:33 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3e15294-b515-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 09:53:32 +0100 (CET)
Received: from DS7PR03CA0323.namprd03.prod.outlook.com (2603:10b6:8:2b::12) by
 DS0PR12MB7897.namprd12.prod.outlook.com (2603:10b6:8:146::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.21; Wed, 17 Jan 2024 08:53:29 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::51) by DS7PR03CA0323.outlook.office365.com
 (2603:10b6:8:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 08:53:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 08:53:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 02:53:28 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 17 Jan 2024 02:53:26 -0600
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
X-Inumbo-ID: e3e15294-b515-11ee-98f2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmSzU8gc79pZlLtFpU5sYsKsYcnR3z/ZaxwCIq4MUCigYHNuAAswU0qnqzAxfyp3ffYG/kGbYW+cPOlK8McS4WlQC9flNWjZzFWvK3vKidj7VfVjwwJE0Q35DHEVDmKqLy5D2nu4q9ruyBqSJXM17cjg4DpTM6VPupWOpdmsoxUdRTdFoH4tlmtB66Hm2VVznEHoQuFcGhvhuBQvUGJhAqpj7IDHW27LoSvXNHNctg8XephhoOyHOcRg2rSSPIqAqjodellCMAKp9V9ldlEjGy1PO6V5KXzP1g0ODc5XyhQXLlRcRy1Q7AsoqNGtnD3ot6acWAqv5MatAYUnJbog4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuKXlyvNJYO6qNaSaDORjBiWcPPhFaUhPVsI/G3B0mY=;
 b=LBvcqs0Tp5qLYA33iDi5t3imF6DJz5cMLSwjc/JUqXKfPGTU6pjcMS3t1GMonOf/z2OtcupuZCbygylmQ0QACEIvE+e3jEZ6vBjJ6vXla5ohh4jeDFlw7VmLoLF/+xkWyraI0LJ/xhGWvl7qekwTtowo3MD7iRwb9O33KGmRkwHIT75Z8+sA9MdzhOXrhcsG+6N28LDyvY3C48dFsD5hc7QaB7k0rnln8ax3AJjWPgqCZ23NyK3d3NqqDJagExbckCh4OJzXZYuPkLOr8MbHnQ3WVQG5LcA3+o7CnN2Qj3oGaVtTrfU9mrmiAqZUvh0qefNScAW9S0b+umAT0pNEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuKXlyvNJYO6qNaSaDORjBiWcPPhFaUhPVsI/G3B0mY=;
 b=MJStk190iCSAQeLIwkXxKexnim2VCqeCqh1xFvdU+ZUjtiZ8f3Yyrs74jryqBwmV03KF3z8Cyk/1kEV6hQBkhEnUXGV3NkqHBu1Ex+0yqyPM7dGgPW2CqZuOLwKSC/LBvw46vx5+BE64bL7GemS3WAo4o7wB90DuUZxpK6iLCsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <25e9e83b-10c4-463b-8850-2ca57ac76376@amd.com>
Date: Wed, 17 Jan 2024 09:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 3/4] xen/arm64: head: Use PRINT_ID() for
 secondary CPU MMU-off boot code
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
 <20240116143709.86584-4-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240116143709.86584-4-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DS0PR12MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: c4598987-5d93-44c6-74e7-08dc1739c679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h76p8mW4XYojAnWDjkf3ZSKvKgqqnUwrHsFPnb5i/D1yifYm3U/mtZql/hb0aB5JmcLEuwdq1cxo7nOrAsqOyc5Kp+sxdn94ecnkrvZiR1zNyTz/hYGENazH2jCyu+JAjZu92vMKtZlxwPS7q+Gf8CKskav/aCBJAAoQBupHpGCVAj8WruUSZny5FkSyZNbPkZFf3vnoiI3uTKLxdYn07MUMWIr960UWx7P/TbXzcJqoFrFMdR4GsHWADWKgVJwMMO8Xxl4dLmr5RKT7YPos9mWsLsXgwstb7vdPrvNtliKeySsYihVwg/Dkrg+P77zvVJpENXEorNiDkZdzn+YDtQ4qu90XY5rcUzwJAartMdVvkWoHT/nRibB1mJnWhr7OkqzVLf0NzTGGFbpfD9F6zvckND7wolLehjufezQw98NTRC5fi5CNw/+ijx9MbN//imjpt8j1XexxNLwWCRoap++ki8yKxN+BAYlb3hIzdt+dHY+8oP+klLD5lRCD2GdvPFO3nlHlTN9QAWVsF6w3tKLfP0jVTLQjuethJANM+gug+cEopQtGQzZLgMUhU3AdPujkdFCofEINbr6zqNWmf/UsWMi+jSrzXWiOK+yc87O2bIMi1XhV1vvNBtBk7WPn4MD57EsKNfZgZvppGjxjVJV9swcdhlfkiv88OOuVLL3N31vF27OVFwGra83orrmpriAOPv2b/PPYxEWwvAO+yH5nnDFnO/6yku1T79KyPJ0EYU7bC+9azX8qrj9qqFGMfN6rLSt6SI5fk556zL98gXJbmAq/sg5nJP0Ch0oJEAArQF0Ad4gdgQzrjvE4ep9y
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(31686004)(40480700001)(40460700003)(83380400001)(70586007)(41300700001)(36756003)(356005)(31696002)(86362001)(81166007)(82740400003)(70206006)(478600001)(47076005)(36860700001)(26005)(336012)(2616005)(426003)(44832011)(2906002)(8936002)(16576012)(53546011)(110136005)(4326008)(316002)(8676002)(5660300002)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 08:53:28.9409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4598987-5d93-44c6-74e7-08dc1739c679
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7897



On 16/01/2024 15:37, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> With the upcoming work to color Xen, the binary will not be anymore
> physically contiguous. This will be a problem during boot as the
> assembly code will need to work out where each piece of Xen reside.
> 
> An easy way to solve the issue is to have all code/data accessed
> by the secondary CPUs while the MMU is off within a single page.
> 
> Right now, most of the early printk messages are using PRINT() which
> will add the message in .rodata. This is unlikely to be within the
> same page as the rest of the idmap.
> 
> So replace all the PRINT() that can be reachable by the secondary
> CPU with MMU-off with PRINT_ID().
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with some remarks below

> ---
>  xen/arch/arm/arm64/head.S               | 14 +++++++-------
>  xen/arch/arm/arm64/mmu/head.S           |  2 +-
>  xen/arch/arm/include/asm/arm64/macros.h |  9 ++++++---
>  3 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index cfc04c755400..fa8b00b6f1db 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -289,9 +289,9 @@ GLOBAL(init_secondary)
> 
>  #ifdef CONFIG_EARLY_PRINTK
>          ldr   x23, =CONFIG_EARLY_UART_BASE_ADDRESS /* x23 := UART base address */
> -        PRINT("- CPU ")
> +        PRINT_ID("- CPU ")
>          print_reg x24
> -        PRINT(" booting -\r\n")
> +        PRINT_ID(" booting -\r\n")
>  #endif
>          bl    check_cpu_mode
>          bl    cpu_init
> @@ -314,10 +314,10 @@ ENDPROC(init_secondary)
>   * Clobbers x0 - x5
>   */
>  check_cpu_mode:
> -        PRINT("- Current EL ")
> +        PRINT_ID("- Current EL ")
>          mrs   x5, CurrentEL
>          print_reg x5
> -        PRINT(" -\r\n")
> +        PRINT_ID(" -\r\n")
> 
>          /* Are we in EL2 */
>          cmp   x5, #PSR_MODE_EL2t
> @@ -326,8 +326,8 @@ check_cpu_mode:
>          ret
>  1:
>          /* OK, we're boned. */
> -        PRINT("- Xen must be entered in NS EL2 mode -\r\n")
> -        PRINT("- Please update the bootloader -\r\n")
> +        PRINT_ID("- Xen must be entered in NS EL2 mode -\r\n")
> +        PRINT_ID("- Please update the bootloader -\r\n")
>          b fail
What about the PRINT in fail?

>  ENDPROC(check_cpu_mode)
> 
> @@ -361,7 +361,7 @@ ENDPROC(zero_bss)
>   * Clobbers x0 - x3
>   */
>  cpu_init:
> -        PRINT("- Initialize CPU -\r\n")
> +        PRINT_ID("- Initialize CPU -\r\n")
> 
>          /* Set up memory attribute type tables */
>          ldr   x0, =MAIRVAL
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index 92b62ae94ce5..fa40b696ddc8 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -276,7 +276,7 @@ ENDPROC(create_page_tables)
>  enable_mmu:
>          mov   x4, x0
>          mov   x5, x1
> -        PRINT("- Turning on paging -\r\n")
> +        PRINT_ID("- Turning on paging -\r\n")
> 
>          /*
>           * The state of the TLBs is unknown before turning on the MMU.
> diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
> index 10e652041f57..6a0108f778a2 100644
> --- a/xen/arch/arm/include/asm/arm64/macros.h
> +++ b/xen/arch/arm/include/asm/arm64/macros.h
> @@ -39,9 +39,12 @@
>   * There are multiple flavors:
>   *  - PRINT_SECT(section, string): The @string will be located in @section
>   *  - PRINT(): The string will be located in .rodata.str.
> - *  - PRINT_ID(): When Xen is running on the Identity Mapping, it is
> - *    only possible to have a limited amount of Xen. This will create
> - *    the string in .rodata.idmap which will always be mapped.
> + *  - PRINT_ID(): This will create the string in .rodata.idmap which
> + *    will always be accessible. This is used when:
> + *      - Xen is running on the identity mapping because not all of Xen is mapped
> + *      - Running with the MMU-off on secondary boots as Xen may not be
s/boots/CPUs

> + *        physically contiguous in memory (e.g. in the case of cache
> + *        coloring).
>   *
>   * Clobbers x0 - x3
>   */
> --
> 2.40.1
> 

~Michal

