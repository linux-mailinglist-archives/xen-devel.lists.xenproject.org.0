Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64473DD79
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555439.867203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkP3-0006bA-Hv; Mon, 26 Jun 2023 11:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555439.867203; Mon, 26 Jun 2023 11:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkP3-0006YY-Er; Mon, 26 Jun 2023 11:29:05 +0000
Received: by outflank-mailman (input) for mailman id 555439;
 Mon, 26 Jun 2023 11:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM71=CO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qDkP2-0006YS-4e
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:29:04 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5531582-1414-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 13:29:01 +0200 (CEST)
Received: from MWH0EPF00056D12.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:15) by BL0PR12MB5508.namprd12.prod.outlook.com
 (2603:10b6:208:1c1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 11:28:57 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by MWH0EPF00056D12.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.11 via Frontend
 Transport; Mon, 26 Jun 2023 11:28:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 11:28:56 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:28:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 26 Jun
 2023 04:28:55 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 06:28:53 -0500
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
X-Inumbo-ID: a5531582-1414-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iM/9Dk9tacIyyO7UQqCmn8vy6C4nDxM019ic/EiBgthiQ3ZG6T4NbXwoiWrY+8+Xs/ABhxHoDQdGU8GRXGeOXMy2SvhsUunxaLv8dB3bpzaPH9umFiEoP7iq+g5KYAt4ruaE5Gw9n7d5SbsefdbdqPbkxsNUmEhZlLRcdrjZ7NC2Dqh/z6FXBeTHTcIHykwJEMTun5yZAH7Z4IlOUoFgKZpRFO3dKhjQVASgexm3clf8WC2Ve3T2pTcQoI3oONCTUEW8wSXZCxzOUCMoZy16GZUvdxb8aSBtr47+LsGtJQtyMWZ1VAsFLNjG7nvRqMGMwJtoHrT+Sm7ztAKUe9XWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEMjlyfz11+zfZvWX2Op5i4BQP+/ppJsce2J3bHhaAg=;
 b=Ia8MsjMMS2V3EuhWACYB/9jt44raUcDAbiCz8gyO3/AK14SgO4D/pVWQuv5V06o09M2185uiCRiQxC2paWo4CfdzI++VVbfRYW/VMr5wcVqlI2fxSq1sbyoZ8uLUo2azzr7obqL3ZMO9uLDTHEV0Yg5T32ztKe0LQ3gDU1IT4qlX//FErEIrgJie8mhxVN8AdQ0HM0n9wpdVETLZmaOOQqSrL431bsnoR6ruxd5CNp5iQ2T7hiXYxsR9MqodaxpWSX5PvXXgZrONa9+Hb3zgoxXG6hPLNxe7SGlrXKr2QDnw8GsjHcDQ1ndXDzBAxmaQy/9xCTIgkMrR8ycYHbddOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEMjlyfz11+zfZvWX2Op5i4BQP+/ppJsce2J3bHhaAg=;
 b=I+rdDOac5m6536r/8fDMMpkMf2JwnOLB71egrSRsIj9wqWcUxsTIVq1aWUyiwANPl7e/J8L0DlkySghKgDbvpZLpCTxDAyG1TO8AJ3ZKq4fxnCI5QiXggQIJiLu7jf8nXgGTzvBxaiH1Gz6ys4NakOsEIMjnBvaSHtLSgFqI+4U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <38f33ede-0d55-bd47-412a-eccb3d4618f2@amd.com>
Date: Mon, 26 Jun 2023 13:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/9] xen/arm64: head: Don't map too much in boot_third
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|BL0PR12MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a8d4e3-ce33-41e0-fb9b-08db76388766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yy2RoZi0V777hwMkPz5mwkiSMFJipExkIE6LyYt1J+/uMXB/xO8Rl0qS+xLeW8dS1Et1dIGwDxC9m5xFT22NNVJqD4wQtoLkwTXKs273BUN2xh8CcTtwnAEMTfQLRIHcpBZsw5JUMn9Wj+anSoaQRanqKxMITLQWFTpYq+ABTh466AFiMy16AIDfSoQz8DbqYLVdrzI+YTvAEp5Ie98sorrjmY5BXaihA/BWOaWlbzNapSrQan0tRosdvnfRllcCyuVsQB0ZEGSMpjipHoauGxyDaF07I3vS7cNAPFt2QNj6G+4+rLdoDmgesvdoYvh+qJaQesJtiq2uIhdynwEDIfTSDY0A2iRtu46+IPWZbFZAuRBYxkctxHRszjR0xWzMR+vaGlxCEY9XKNwpkPf6+x/iBQZFiX2lusyfGDy1BMcIf7YjykdXNPFgcbupneR0GwQGIqLF5UDawp9ghYx7YnsKogk5NNrsWmU4zfWjpAH2LOubTbv+g2vTYUh/Mmq7TL2LnYI4BdVjHe9IizOtrR1HewARXvIAj+AXk7+TByTypo6oioe9CT1iQtBgEWGA/0fobXq6pjXNmOnU0PJXM6aG7GtszFVV9Jgyavjw2KXG0mYNztwZU+axBOlZsNsJjNATlAiGflVm1fi+xJPbKFu6X51KvfxanbOW9qfwEgMVA3u2v/LV8fN3lZiNIouuOzyXgCyjRydlFTRTul4IPTfiKfbRWN4dSJKAhNFpJmQpPFiu3khXKRwfJUIFASU/WyxMzRk6RR0Gu6xUmPw1ZfpsAq0jfNS7JhbDnsb/KNXJKqAVX15rT5xes+tTQfIx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(31686004)(82310400005)(36860700001)(40460700003)(36756003)(356005)(5660300002)(44832011)(70206006)(86362001)(8936002)(8676002)(41300700001)(4326008)(81166007)(316002)(31696002)(40480700001)(82740400003)(70586007)(47076005)(53546011)(186003)(26005)(2906002)(2616005)(478600001)(6666004)(54906003)(426003)(110136005)(83380400001)(336012)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:28:56.3257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a8d4e3-ce33-41e0-fb9b-08db76388766
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5508



On 25/06/2023 22:49, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, we are mapping the size of the reserved area for Xen
> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
> after Xen, so it is not a good idea to map more than necessary for a
> couple of reasons:
>     * We would need to use break-before-make if the extra PTE needs to
>       be updated to point to another region
>     * The extra area mapped may be mapped again by Xen with different
>       memory attribute. This would result to attribue mismatch.
s/attribue/attribute

> 
> Therefore, rework the logic in create_page_tables() to map only what's
> necessary. To simplify the logic, we also want to make sure _end
> is page-aligned. So align the symbol in the linker and add an assert
> to catch any change.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm64/head.S | 15 ++++++++++++++-
>  xen/arch/arm/xen.lds.S    |  3 +++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index f37133cf7ccd..66bc85d4c39e 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -572,6 +572,19 @@ create_page_tables:
>          create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
>          create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
> 
> +        /*
> +         * Find the size of Xen in pages and multiply by the size of a
> +         * PTE. This will then be compared in the mapping loop below.
> +         *
> +         * Note the multiplication is just to avoid using an extra
> +         * register/instruction per iteration.
> +         */
> +        ldr   x0, =_start            /* x0 := vaddr(_start) */
x0 is already set to vaddr of _start by the first instruction of create_page_tables
and is preserved by create_table_entry. You could just reuse it instead of re-loading.

> +        ldr   x1, =_end              /* x1 := vaddr(_end) */
> +        sub   x0, x1, x0             /* x0 := effective size of Xen */
> +        lsr   x0, x0, #PAGE_SHIFT    /* x0 := Number of pages for Xen */
> +        lsl   x0, x0, #3             /* x0 := Number of pages * PTE size */
> +
>          /* Map Xen */
>          adr_l x4, boot_third
> 
> @@ -585,7 +598,7 @@ create_page_tables:
>  1:      str   x2, [x4, x1]           /* Map vaddr(start) */
>          add   x2, x2, #PAGE_SIZE     /* Next page */
>          add   x1, x1, #8             /* Next slot */
> -        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
> +        cmp   x1, x0                 /* Loop until we map all of Xen */
>          b.lt  1b
> 
>          /*
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index c5d8c6201423..c4627cea7482 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -212,6 +212,7 @@ SECTIONS
>         . = ALIGN(POINTER_ALIGN);
>         __bss_end = .;
>    } :text
> +  . = ALIGN(PAGE_SIZE);
>    _end = . ;
> 
>    /* Section for the device tree blob (if any). */
> @@ -241,4 +242,6 @@ ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
>  ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
>  ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
>  ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
> +/* To simplify the logic in head.S, we want to _end to be page aligned */
> +ASSERT(IS_ALIGNED(_end,            PAGE_SIZE), "_end is not page aligned")
one more space if you want to align PAGE_SIZE to POINTER_ALIGN

All in all:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


