Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D160C89E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 11:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429707.680871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGV5-0000qk-BM; Tue, 25 Oct 2022 09:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429707.680871; Tue, 25 Oct 2022 09:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGV5-0000mk-8A; Tue, 25 Oct 2022 09:45:35 +0000
Received: by outflank-mailman (input) for mailman id 429707;
 Tue, 25 Oct 2022 09:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5aB=22=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onGV4-0000me-EB
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 09:45:34 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c13008a1-5449-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 11:45:28 +0200 (CEST)
Received: from MW4PR03CA0337.namprd03.prod.outlook.com (2603:10b6:303:dc::12)
 by PH7PR12MB6905.namprd12.prod.outlook.com (2603:10b6:510:1b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 09:45:24 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::ba) by MW4PR03CA0337.outlook.office365.com
 (2603:10b6:303:dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 09:45:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 09:45:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 04:45:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 04:45:18 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Tue, 25 Oct 2022 04:45:17 -0500
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
X-Inumbo-ID: c13008a1-5449-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuY/Szn4wbvP2sMUowucqeBm4McML0r7v9a+kOh8HQh7WxG/MClEBo8SI2QgxMjHHfnXlITcyp36jsfpRXrj8Z4bj/tY6UIfhsdYyDmLmNrNPk45ouYx0sSV20qmgRKs0fXvwALRWItnHzW+QIhhsahJGq0GT78CtZbH+KlUCx/7EUe2+oZty7dohp3oBOQJgZL2Td7CpE11lTdKoj49+Zv4TG46js/z2v+hwGwBZiLXKd6A1/eqr83DNMlaOXsa+TxSZ4RS9D4bq+ka4zwQQxbdvRogu7pr2YvYCsIveqcGNsP7vN37wtPR2ZJLJFWZZuUbjZMvGIDnqT8hZbqdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVJ24SY2srO3UWkRsdbW+YFox9PstZGdzk6L5FJN7pM=;
 b=ALfRYMlLpSJ6h+96+CXcOdUNIe2tiJBA3CM89dfIxhp2R0i0YfXMHRXg99aOBXo45SHoKVQngjpGF3/etQP59fRw5kwPS7VEo+3b771481m8BVi+iUqZHikT+edCvjUBNo8kiQPPGvWyq7yCn6AE+HensVz2/sZ2CBbz9C3o+c1Zw7jFGGIFrB0j/cFey32CxgZsV4ozF64nGtWexX1iU9kluX/BX+74EUoCfS417vhHdIM6+okH5UXfndb5fLe4DgUF+MhXnWjTBGm150BVnI5cxY/bpOg5dkLbhhPzWHKVvbFPXTnQg8/+NKp/AL1ISM77r0/JmsVtjZUYRz+Tmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVJ24SY2srO3UWkRsdbW+YFox9PstZGdzk6L5FJN7pM=;
 b=EpX2LlsblSGetzhF1IKbWUSh5aBOrepPp4GvBu1oBTY4/xL22bXpX7QRDK07weLkVSoFZKnMfjWT8GXAsqLy5LYlHSN8yAhFIbiz5+J7p/MJzteTUVngbHl13yjT7NVEDLf9kzYPnxfG23KmBcwEgu3LOq5vxU6BbHxI0fJF+nM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <851b93a6-6116-2a81-f737-b7fd61d793f9@amd.com>
Date: Tue, 25 Oct 2022 11:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v2 02/12] xen/arm32: head: Jump to the runtime mapping in
 enable_mmu()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <marco.solieri@minervasys.tech>, <lucmiccio@gmail.com>,
	<carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221022150422.17707-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT051:EE_|PH7PR12MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: d60d0fd8-7857-43c0-95d6-08dab66da377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ENY/gkGfVCdVJwpCW+bam2+1Ck7fIpvOtUNrQgzuNbJt7fo9sdQLM3amqzrukR/Ve+gcL8Spf3fz+CAL8hPVpnE14yVgRnlJXOwKfSUQJwojUfWdENGFFO7nmruDWu8BbLyoXh9FQz00ODb+1oubhjVfgTs5GKXyEaJIWvOojCaS+S0agXWHreOIH07W2zDT4EffBNOKKlXzBD/rq1mmRfKK9OYZVW+Vcl4Ie6zlGVXsbJx0gpC3UfmEHZm/01bhqXDbJI8T/5tSzmAvLPC4Ow9JWmx8K2LfEzkZkX0RUDXpKm6/tAqhMSk+4PG+g1Oqp8FqIVNy6Oasym7z3ivfKEE+JQyLtUhpl3BItqE+kMBbn7eFGWETX3t2U3B/0xImhQGN/nf8CCfZuTNjq6b4khOG0a9a19szCs/DxPpoIifbs9209+OVbOxB4E0+JrDbkGHQZhJyI4i0eAQP2qXB+6y0Xl/A30m5Qaip5JfBAVGWFehXg9Cz1UfaiZ4iSXb9ltloqkI/l0KnIr45qh5WcGDb0g4AD8d+rcZWYMHDC+6j+RHY8LeMVZHox/2o0TSYbVlWyNmoymLncSquzApBLXWwu+Hrm18CfRIRzebhq20o3lMMuCdjWESvqLepPM+a+UKsVx3Qlo2+Rt/bN8iSYed1d2mOjkYSLq2KBjbgLZ/rXFV+HeTWkqlupAP5ywuztEjc+Znh03zqRWGbVzSHfsKulAgk1l3wbuM8Ei2yaRFx+GaInxlN4DjHT30+oCfMYnoxgS6CDp2XFUj3DUPPqSOArz/a6OPu8UDdjW1fYBpmzti648p/giFQtkyEm7V4E4kXgwQfbjxRSPKyZGEx0WSfEtN89rSs7g/wT9UkHCQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(426003)(47076005)(83380400001)(356005)(86362001)(31696002)(81166007)(36860700001)(8936002)(82740400003)(70586007)(70206006)(5660300002)(44832011)(8676002)(4326008)(41300700001)(2906002)(82310400005)(53546011)(26005)(2616005)(40460700003)(36756003)(110136005)(54906003)(336012)(40480700001)(966005)(16576012)(316002)(478600001)(186003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 09:45:23.5154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d60d0fd8-7857-43c0-95d6-08dab66da377
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6905

Hi Julien,

On 22/10/2022 17:04, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, enable_mmu() will return to an address in the 1:1 mapping
> and each path are responsible to switch to the runtime mapping.
s/are/is/

> 
> In a follow-up patch, the behavior to switch to the runtime mapping
> will become more complex. So to avoid more code/comment duplication,
> move the switch in enable_mmu().
> 
> Lastly, take the opportunity to replace load from literal pool with
> mov_w.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S | 51 ++++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index a558c2a6876e..163bd6596dec 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -167,19 +167,12 @@ past_zImage:
>          bl    check_cpu_mode
>          bl    cpu_init
>          bl    create_page_tables
> -        bl    enable_mmu
> 
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   r0, =primary_switched
> -        mov   pc, r0
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, primary_switched
We seem to still widely use ldr instead of mov_w which is faster.
It looks like a prerequisite patch to convert all occurences or something to keep in a backlog.

> +        b     enable_mmu
> +
>  primary_switched:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> -         */
> -        bl    remove_identity_mapping
>          bl    setup_fixmap
>  #ifdef CONFIG_EARLY_PRINTK
>          /* Use a virtual address to access the UART. */
> @@ -223,12 +216,10 @@ GLOBAL(init_secondary)
>          bl    check_cpu_mode
>          bl    cpu_init
>          bl    create_page_tables
> -        bl    enable_mmu
> -
> 
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   r0, =secondary_switched
> -        mov   pc, r0
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, secondary_switched
> +        b     enable_mmu
>  secondary_switched:
>          /*
>           * Non-boot CPUs need to move on to the proper pagetables, which were
> @@ -523,9 +514,12 @@ virtphys_clash:
>  ENDPROC(create_page_tables)
> 
>  /*
> - * Turn on the Data Cache and the MMU. The function will return on the 1:1
> - * mapping. In other word, the caller is responsible to switch to the runtime
> - * mapping.
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).
> + *
> + * Inputs:
> + *   r9 : paddr(start)
> + *   lr : Virtual address to return to
>   *
>   * Clobbers r0 - r3
>   */
> @@ -551,7 +545,24 @@ enable_mmu:
>          dsb                          /* Flush PTE writes and finish reads */
>          mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
>          isb                          /* Now, flush the icache */
> -        mov   pc, lr
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        mov_w r0, 1f
> +        mov   pc, r0
Would it be possible to stop using:
	mov pc, reg
in favor of using:
	bx reg

Some time ago I saw this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/include/asm/assembler.h?id=6ebbf2ce437b33022d30badd49dc94d33ecfa498
which states that bx is faster.

> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards.
> +         *
> +         * On return this will jump to the virtual address requested by
> +         * the caller.
> +         */
> +        b     remove_identity_mapping
>  ENDPROC(enable_mmu)
> 
>  /*
> --
> 2.37.1
> 
> 

Apart from that, the change looks ok.

~Michal

