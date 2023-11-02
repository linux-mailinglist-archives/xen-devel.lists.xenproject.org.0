Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB47DEEDF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 10:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626804.977389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyU0z-0000Wh-CH; Thu, 02 Nov 2023 09:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626804.977389; Thu, 02 Nov 2023 09:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyU0z-0000U5-9Z; Thu, 02 Nov 2023 09:29:25 +0000
Received: by outflank-mailman (input) for mailman id 626804;
 Thu, 02 Nov 2023 09:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lpi=GP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qyU0x-0000Tz-Sh
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 09:29:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d573435-7962-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 10:29:22 +0100 (CET)
Received: from MN2PR01CA0038.prod.exchangelabs.com (2603:10b6:208:23f::7) by
 CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Thu, 2 Nov 2023 09:29:18 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::93) by MN2PR01CA0038.outlook.office365.com
 (2603:10b6:208:23f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Thu, 2 Nov 2023 09:29:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 09:29:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 04:29:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 04:29:08 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 04:29:07 -0500
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
X-Inumbo-ID: 4d573435-7962-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFGvTJUJdaW3AEnSipJzBXBhgWeFKVdAwbb9qkF/XWow2zSGrM4+OCSMEm2xy68aP3T0jZQQ+YbbzwCYuS4yQwWorDaf9kA2LFi+/uOz9lBZjRettXkbjzCALtQmVV1ybUzwqURm7h0LTPXqk0BYBH1SWfGBvZNXFjd4tVN5BBwYs5vC5s0HiegXyjKS6lFju0I0eoegsGOxCkxaAAd0OI6E1cl9+2Z+AA7cIgPWx/sLPsnKwRD5Mx5ZPiZyYmQ3jwJflX+8O0un1HzHylKuQndsPR1v3cKEs45rcpSDT6J3mFtxsbfCSmE8MuW9AeirgyPbmiHI9hsYAfRIxNms2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS+ZVx6KoUhnHsv/Qo3wg0qJct/Np/glM2nB+lQejBU=;
 b=PvlfifSah/qT8MC7sZdDD2afOJuMk7coXBF++lYfBB2FDfkcnrVCTLZPX9M/qPQ54i5OC8G9KX2Mvd8jnvp8Yo3iKsSYikR+1S2nJ2xQQAmqy2rqd3+C/2egqqjhtfm0R4uEBNh7BR4kkN2FZCnIpXmrVRiSRxNCYOsm40oD6cu0bwkf3ipD26YBrFA5DU6eRlSV2E6cL+tqqtCoHPvD5rSa5sTmweHiViN5eAcb9FQuJlKNNCnVHsiaiuByPQJsDIevkzh6+PzKFHwRdVB+Xf1HBu2rSH4qWA+YPiZNhdftPzyNwA7zdA6QN/bbQpyDQ68eSFKzsv34dlF3IWIlSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS+ZVx6KoUhnHsv/Qo3wg0qJct/Np/glM2nB+lQejBU=;
 b=N4OeS761yqy9w30vrqcjHFv7oMpMjwdR+eIz6LeQdt9x4xO8jECaDLlZVNAk7ky+t774y9vpUSWOfmd6ogbYG1qpvLzldeHA8MWplIG/8eniy5lSHAxpNxRQgRnQ2BTTG6t3cBib8nIF7qbuaYlgd4JchRxv0FLbuRHqqwNaBSc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5936b2cc-f89f-4e7e-82cf-daaee4cf35ce@amd.com>
Date: Thu, 2 Nov 2023 10:29:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm32: head: Rework how the fixmap and early UART
 mapping are prepared
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Henry.Wang@arm.com>, <ayan.kumar.halder@amd.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20231101233011.83098-1-julien@xen.org>
 <20231101233011.83098-2-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231101233011.83098-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae22045-1f1e-4b04-3586-08dbdb862f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9t1blhz4NMVi86XGaX+HlWk/nBLCK7b80e509Gc/HFs37FD//pvl9JR3nQJy2BHqlpGsfP3hWOByiaJDJsmdmsheGus5rd0jymfc/wNSwGHHwpSaogWHFvwhuPaf3jGpV8yz+aVLZF2wTyYIFRpVC1FgEcg8jQJrbNlevPCSuQysrAREe0cKjVgaILWAOr71OYYmrRO5DRb4CcmUHOvRArIicqa0VEUH2ZMzKth3i53XSoSTZIg7Lhmp1uN7hgArh8rQUh19Jv2dmZvfGC4nRJh8+cAZ7spPFIp07MSBFw3Bg0kQCKTpeM/v/sd16HyRQUWQq+e6sesIVmvJsLuLHHIB1EDxqLqqiYNfFXvxj0jpzcl0mhNzm5GC4aTm7gZEwYH2xBs34JMEmSNm4Ncwf7URYZcsePJ5Y8PxdJjiS7ye+2fZ2ZzmFw60OZyDBSFOrhKLcMhbCurIkvEzYmqFlt6d+u3fIliWa538Mugiuy51pMwV6juXWmMLWZkzskUn9bvIKNtns8wJF+TWT7YaqOC2FJF5PcqewJgv3aPSBHermYdHs9w+3KEjbXszlt5RB+fotS+8g3s4NJp0E0GqIA3/ttXAFhS5j/jGZy1RYqzEY0/S4jQc1gNrJZiY0iNFPJZgV/CVQLFSLFAd+WAB44iE0Ll/kZz5oDad0ukRof0PP/Tg1GqSYMLCEaLgaM9vyGBgh2JsFA4fjCCEGXJ5OXzL7PiJ31dypUXei0eTbnr2DH8l5oZ/7nVG/+Tsr7nl0otAE2oY3h+NeT6H4ih/3WUAI7T/ytRk3mWR636o6k24msfVDbBGbEaVjXpGr/9n
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(8676002)(86362001)(36756003)(40480700001)(31696002)(47076005)(53546011)(110136005)(70586007)(41300700001)(2906002)(36860700001)(8936002)(54906003)(316002)(70206006)(16576012)(45080400002)(5660300002)(82740400003)(356005)(478600001)(81166007)(4326008)(44832011)(426003)(26005)(336012)(2616005)(83380400001)(31686004)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 09:29:16.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae22045-1f1e-4b04-3586-08dbdb862f56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318

Hi Julien,

On 02/11/2023 00:30, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 5e213f0f4d2c ("xen/arm32: head: Widen the use of the
> temporary mapping"), boot_second (used to cover regions like Xen and
> the fixmap) will not be mapped if the identity mapping overlap.
> 
> So it is ok to prepare the fixmap table and link it in boot_second
> earlier. With that, the fixmap can also be used earlier via the
> temporary mapping.
> 
> Therefore split setup_fixmap() in two:
>     * The table is now linked in create_page_tables() because
>       the boot page tables needs to be recreated for every CPU.
>     * The early UART mapping is only added for the boot CPU0 as the
>       fixmap table is not cleared when secondary CPUs boot.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S | 48 ++++++++-------------------------------
>  1 file changed, 9 insertions(+), 39 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0ca..fec2433e568f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -183,12 +183,16 @@ past_zImage:
>          bl    check_cpu_mode
>          bl    cpu_init
>          bl    create_page_tables
> +        /* Add the UART mapping if requested */
> +#ifdef CONFIG_EARLY_PRINTK
> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
> +        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
When building this patch, I'm getting a "Bad instruction" build error.
Quick look shows that you are trying to use the macro create_mapping_entry before macro definition.
Unless, I'm using a different baseline (latest staging) than you, this needs to be fixed.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

