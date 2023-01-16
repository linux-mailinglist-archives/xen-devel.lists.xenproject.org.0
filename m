Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E966B969
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478454.741657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLFQ-0004aY-DM; Mon, 16 Jan 2023 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478454.741657; Mon, 16 Jan 2023 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLFQ-0004Xb-AX; Mon, 16 Jan 2023 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 478454;
 Mon, 16 Jan 2023 08:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHLFP-0004XV-GS
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:53:43 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 456ba475-957b-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 09:53:40 +0100 (CET)
Received: from MW2PR2101CA0019.namprd21.prod.outlook.com (2603:10b6:302:1::32)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 08:53:34 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::a7) by MW2PR2101CA0019.outlook.office365.com
 (2603:10b6:302:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.1 via Frontend
 Transport; Mon, 16 Jan 2023 08:53:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 08:53:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 02:53:32 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 16 Jan 2023 02:53:31 -0600
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
X-Inumbo-ID: 456ba475-957b-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQ1uXlteOY+g5sBTrr/VpfweSvdd9llM0z9f134tKNHRBqZQUigSf+GAU1pAAsnLfUVQ7NKiwvvQMCGu+1ubygwAW1LNLwOS/ItXQ8DThUVCZtHCBejcBsOD6rEvPdLaPoJZmc0ZybuLKCewP74r6URGwDsPKbwiRbu/i/tA11c1wO8Y7aInYZ3B9FV/nohIkcPEeLRE23bNSlkjCe9uSk4OTVO6neLWVHSaibw8d1CLZqrpmwwqqAqCF+UaJ7bDaJ1l+1I0NX8zm3wXmdJg4S+KVBUUC4Pj5gV9wT1hPetuRB3QvYJEcc7MiRFlkGHAs2sqwj+gga4M3/1BtHxqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykRl3i+I1TI6cIYC21wWjoIBy9H0caPspQZJafx8fK8=;
 b=LEJn1cwsnfA/fVca4jrBNzbEIAcimDyunOtpwkUfnkitEigATNXN/zxJXXuYfMDm5kdkpwtWlHSmPOHTflqQyq+S0NbN0cq6fIOMuGbYLi/hERR7bM0OxJjOybF/wUThBSWDFnNYMpT4MMdulQbkH2EVvtWDxdDhw9PLiPDRm/q5TVxRFAleiV0JcKE8dDJ6Kz/U6GLQlP95HzmQ6jn2cKl9MrTpKu5uy2xF7vEtDwC4zrlTQckkt43B6dg381SIeJu6bMswV5n0uQgmpMOVuDkWI9vhvle03q3GOZXZrTwXYv6tOJCsRnfXpdsZV0HjtqUJ6LXRdS8BTX8AJyi2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykRl3i+I1TI6cIYC21wWjoIBy9H0caPspQZJafx8fK8=;
 b=l4CsCL0qKQ3kUkaZ3ydFtZaHtpqBUb25ECwUvXCJqpNgiTprevF7uNoZdBdIArC77rHXs2kpUjM9p/rnoOt5msly2HaH6NbQQ6iuNEM2VBI5m6h0QTM0zDi16AHj1ilp60RqwawL2c1eTAPPQx4n2FhAmbI7VDAmgXA3sp5sdGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ddbcb326-b158-daa4-e9d2-42c420983497@amd.com>
Date: Mon, 16 Jan 2023 09:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 12/14] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-13-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113101136.479-13-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b527745-5d8e-428a-af81-08daf79f2619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ausT/qimGUp1o6A5uB1aNYqCV/T0ur4mlq3Jbfxi3etjR005FLiFY8BvrZ03wZT266Q35Id8vQC3bOCZDFk1xkspoiY8BsXBFtWLGERnZtg45+1UhaKamujB+nRQqirNIVOmY0m/2fAZAi9JkyM/FeI9E/w4GUA4Mi5SWK7JpKSOv7eiNbEL/XwgON/SdZ/ED+nkbiI7O0mPKM6GiyiJq/UAfmrnQtzKyIevsXz+FAe/P1ZxvXNbxWLpLo+iaDjOPXgebaUbhXu/D/bvBqvyRJnxh5DQFVWdx1Wjemw4Ij5L0R/6CC+WyH1hrYMBWOpCX7sW0iIYGY3kkW7O4MZvGtjsh/UZwPb4xK8X0mjb8+OukhnQOgnxDXOxZg8OXwOKP69c0gknzXa6ea03kbAiebwCniV0Rqsg0DAEQnnQ91d0dHfDeYxNpWKAm3cArEqHh3I2kVfDoy5SwmX555OMqW17al1h0pL4iy1veGVCgHsHMk419yEbcXcYPOgbf25Gs9EPVPBISHNHw20tTeZAI5MtTR9wEcunyKK95axVg5MMPxu9RGWue+AsO9dn/iuJ/9/xW/0yn5h2LwoUeT/UHeSX4/sMfQ/9NbBITiin4PoFi3BIHde7D/5MPwglqD+mpyCn/a7mYF97iOVK4sWmvM709F+1xuPgObk4ZstQX3iHX7yz2UUCjNsaSTsiBZcgMsvZ6zknd9FrFhrU0Fdy9iUfqy5LOMUGEJF9oHv6wtjhvE5miUdy7BtwdE0MfpSHdNAw0ngzHCh3L3NO13Cocw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(31696002)(86362001)(82310400005)(36756003)(186003)(4326008)(8676002)(53546011)(26005)(70206006)(426003)(70586007)(2616005)(47076005)(41300700001)(316002)(40480700001)(16576012)(54906003)(110136005)(478600001)(40460700003)(44832011)(81166007)(2906002)(356005)(82740400003)(83380400001)(36860700001)(5660300002)(8936002)(336012)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 08:53:33.6018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b527745-5d8e-428a-af81-08daf79f2619
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946

Hi Julien,

On 13/01/2023 11:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
> 
> On some platform, the identity mapping may have to start at 0. If we always
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
> 
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
> 
> Two new external helpers are introduced:
>     - arch_setup_page_tables() will setup the page-tables so it is
>       easy to create the mapping afterwards.
>     - update_identity_mapping() will create/remove the identity mapping
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
>     Changes in v4:
>         - Fix typo in a comment
>         - Clarify which page-tables are updated
> 
>     Changes in v2:
>         - Remove the arm32 part
>         - Use a different logic for the boot page tables and runtime
>           one because Xen may be running in a different place.
> ---
>  xen/arch/arm/arm64/Makefile         |   1 +
>  xen/arch/arm/arm64/mm.c             | 130 ++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/arm32/mm.h |   4 +
>  xen/arch/arm/include/asm/arm64/mm.h |  13 +++
>  xen/arch/arm/include/asm/setup.h    |  11 +++
>  xen/arch/arm/mm.c                   |   6 +-
>  6 files changed, 163 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/arm/arm64/mm.c
> 
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 6d507da0d44d..28481393e98f 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -10,6 +10,7 @@ obj-y += entry.o
>  obj-y += head.o
>  obj-y += insn.o
>  obj-$(CONFIG_LIVEPATCH) += livepatch.o
> +obj-y += mm.o
>  obj-y += smc.o
>  obj-y += smpboot.o
>  obj-y += traps.o
> diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> new file mode 100644
> index 000000000000..798ae93ad73c
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mm.c
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/init.h>
> +#include <xen/mm.h>
> +
> +#include <asm/setup.h>
> +
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +
> +static DEFINE_PAGE_TABLE(xen_first_id);
> +static DEFINE_PAGE_TABLE(xen_second_id);
> +static DEFINE_PAGE_TABLE(xen_third_id);
> +
> +/*
> + * The identity mapping may start at physical address 0. So we don't want
> + * to keep it mapped longer than necessary.
> + *
> + * When this is called, we are still using the boot_pgtable.
> + *
> + * We need to prepare the identity mapping for both the boot page tables
> + * and runtime page tables.
> + *
> + * The logic to create the entry is slightly different because Xen may
> + * be running at a different location at runtime.
> + */
> +static void __init prepare_boot_identity_mapping(void)
> +{
> +    paddr_t id_addr = virt_to_maddr(_start);
> +    lpae_t pte;
> +    DECLARE_OFFSETS(id_offsets, id_addr);
> +
> +    /*
> +     * We will be re-using the boot ID tables. They may not have been
> +     * zeroed but they should be unlinked. So it is fine to use
> +     * clear_page().
> +     */
> +    clear_page(boot_first_id);
> +    clear_page(boot_second_id);
> +    clear_page(boot_third_id);
> +
> +    if ( id_offsets[0] != 0 )
> +        panic("Cannot handled ID mapping above 512GB\n");
I might be lost but didn't we say before that we can load Xen in the first 2TB?
Then, how does this check correspond to it?

~Michal

