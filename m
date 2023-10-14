Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D0F7C953D
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 18:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617078.959504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrh4L-00078k-Hg; Sat, 14 Oct 2023 16:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617078.959504; Sat, 14 Oct 2023 16:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrh4L-00075w-EO; Sat, 14 Oct 2023 16:00:49 +0000
Received: by outflank-mailman (input) for mailman id 617078;
 Sat, 14 Oct 2023 16:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yyFg=F4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qrh4K-00075q-G2
 for xen-devel@lists.xenproject.org; Sat, 14 Oct 2023 16:00:48 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4833bd4-6aaa-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 18:00:45 +0200 (CEST)
Received: from CY5PR15CA0161.namprd15.prod.outlook.com (2603:10b6:930:67::25)
 by MW4PR12MB6951.namprd12.prod.outlook.com (2603:10b6:303:209::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Sat, 14 Oct
 2023 16:00:39 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:67:cafe::72) by CY5PR15CA0161.outlook.office365.com
 (2603:10b6:930:67::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Sat, 14 Oct 2023 16:00:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Sat, 14 Oct 2023 16:00:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 14 Oct
 2023 11:00:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 14 Oct
 2023 11:00:38 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sat, 14 Oct 2023 11:00:37 -0500
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
X-Inumbo-ID: d4833bd4-6aaa-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIzxd0e7sJt7ZIgI/FuaGu88S3AwO2QSiMdiBUiuzwrg0yP+KECfjSyrkSFp7QBT1MkRP1gK6mkRiY9Jhllj75dqti0MszcbVK3Itz4bIn/ApbxyGUSMr/X6mrMFngeX+Jrf/4UWSQewNpys3y5pfksl1LhAvOB7XDfNlIb0MJxhLPLLaWg3uUL+wihtg2QlnIkNlJVeyWF72hLDCEGJJfHnL7ab53WR1ZU69hoeVU1p1Lbq4wMeCR4Cs7iejlY6mUiJv8QbB0c+3AIW0xlbO7ukVAeLo6J9qeu9SiqQFvPjVZ5kMSALMGF3Lx3hZQpvPV2gRx3lnOjEYkSpfxVR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRPzPb8glB8fhzqDX7vVQxXtj+sA5vVqRHDA6urodXI=;
 b=ftcUcq+2cBIeSyWkRkIW1TvVrtOFSAuVMWrP6SWSA0toL4iQUZkhL+wVFL6+KhhykWdeCuhZ/ynYqMYRNLq00p2ECM8kK0vt6xeRhyVbj98CVjtf0273JCTP8FAO3F/R/BxeBr6mThcB3UYE1lEwQkWXs6Yfk35lg9U69kpL2WVEgXtWX69UAmi9XXYvaQ3PN1qkQxSgwxj3pF8dgwKCQoqHNl5YqYOm5xvX06BcuyCChTq6iWB2PZNsega6tkLhEAItb33KS+9jJIgWrewkBD1cZEPtQALeyzmDV/5HJ86c1gI/csQba2+EvVNhbxltobvgm2jHAK5T/1sccpFaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRPzPb8glB8fhzqDX7vVQxXtj+sA5vVqRHDA6urodXI=;
 b=t6qU03EhKNELfYLJaKKJWzMENmQ/tcsom00XeNlwMJcvf3K8Uj8uSzREYNLhrMw8kOh2QwI78hz02kQoWfWl/+tMmSWoiR6XL6tBjLXskzHNIz5n2j24gfag9tsvWBtPHwlmDVYnzAmL3LiRMEB7wmv35lCqrioOgBlOyyGg04k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7634e87f-b0ed-4ad9-a5f5-772d4f631f88@amd.com>
Date: Sat, 14 Oct 2023 12:00:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/17] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-8-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20231012220854.2736994-8-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|MW4PR12MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: d78f5502-ac68-4d9d-3368-08dbccceb5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q/6Tou31V5lWS96PVNFkVJAKz4uGhONNhJqMxEQdgsiffEhA4VQ8nwZo99vVPoOBlZe5Wh9J75GYIxWvnRZ+9ICKWtN6UpBOUxBpMrePk0R2V4W0nlM5tlGiT7iYlsB7bXkwh05mK7vKEXBv66XO+RBN/YKhnYth+EQImIp9vjlg1MhQf+qRnH680iP07SOkgGfZx4l4aTUeVh4F9A65v+rIF8SS3qpKxQQ8bqVXtCwu/9QL7YQ/SBMYQUcBLtVcwEwZ68042Z7i1zkmZtNHjUIwOxvBA5WCo1BmfI0/H6sZdhnuiXCM4yVxVRnOdJNC/3o/1flQZaJ9f8vjtYnf/7lqYNR/Cvxm8yiyY6nYGF+gNVrbqK+JrW4an87Z9zRNwRn7d9PwFafO6+7iiijY/sHPKTpIZpwnn6RPUxuOHmMFP1mTovtxS4Jq7m6fVSSl5vEXVgYC8f8VLZ668anxormuxBumydWaDvWGSm4Q5N5Bshx+ZmBRLf/xmewYuzFRYNmcD7Aqjrh6B7QkOoEVgdMy5R2GK8adXB8/S+1uuT9VGLWpMZ1nOqptjBBwn7XXa8attKBOxhrurKMZCijv3o2hIttako13ltpWnz5iJCUDu7S64grBuVtOJeDmPCgs4y3AyH8ccR+j9SAJkzO/d7NqouV1nyBRTLdXeLEhluzajvOYUzqoCgnDFusnEfYexm4Wdi0WGDGywfa1eavCOOfSscqS0shcOpN+ZKba+huNooIj75W5HlDMYeVh5B2BRJ3B6sUT8u72IQbyxypqZ7CMDCxdiyassuP8T8RR0I6R3es08Tc5EHL4KfKnm5W/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(82310400011)(64100799003)(1800799009)(451199024)(186009)(40470700004)(46966006)(36840700001)(83380400001)(31686004)(40460700003)(316002)(426003)(110136005)(41300700001)(336012)(40480700001)(5660300002)(2616005)(356005)(54906003)(82740400003)(4326008)(2906002)(70586007)(44832011)(26005)(8676002)(81166007)(8936002)(36860700001)(70206006)(31696002)(36756003)(53546011)(16576012)(47076005)(478600001)(86362001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 16:00:38.9645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d78f5502-ac68-4d9d-3368-08dbccceb5ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6951

On 10/12/23 18:09, Volodymyr Babchuk wrote:
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 33db58580c..40d1a07ada 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -477,6 +477,74 @@ static void cf_check bar_write(
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
> 
> +static void cf_check guest_bar_write(const struct pci_dev *pdev,
> +                                     unsigned int reg, uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +    uint64_t guest_addr = bar->guest_addr;

This initialization is using the initial value of bar ...

> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;

... but here bar is decremented ...

> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +    }
> +

... so to ensure a consistent state, the initialization should be moved here.

> +    guest_addr &= ~(0xffffffffULL << (hi ? 32 : 0));
> +    guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    /* Allow guest to size BAR correctly */
> +    guest_addr &= ~(bar->size - 1);
> +
> +    /*
> +     * Make sure that the guest set address has the same page offset
> +     * as the physical address on the host or otherwise things won't work as
> +     * expected.
> +     */
> +    if ( guest_addr != ~(bar->size -1 )  &&

Should this sizing check only apply to the lower 32 bits, or take "hi" into account?

For reference, it may be helpful to see an example sequence of a Linux domU sizing a 64 bit BAR. I instrumented guest_bar_write() to print the raw/initial val argument, and guest_bar_read() to print the final reg_val:
(XEN) drivers/vpci/header.c:guest_bar_read  d1 0000:01:00.0 reg 0x10 val 0xe0100004
(XEN) drivers/vpci/header.c:guest_bar_write d1 0000:01:00.0 reg 0x10 val 0xffffffff
(XEN) drivers/vpci/header.c:guest_bar_read  d1 0000:01:00.0 reg 0x10 val 0xffffc004
(XEN) drivers/vpci/header.c:guest_bar_write d1 0000:01:00.0 reg 0x10 val 0xe0100004
(XEN) drivers/vpci/header.c:guest_bar_read  d1 0000:01:00.0 reg 0x14 val 0x0 (hi)
(XEN) drivers/vpci/header.c:guest_bar_write d1 0000:01:00.0 reg 0x14 val 0xffffffff (hi)
(XEN) drivers/vpci/header.c:guest_bar_read  d1 0000:01:00.0 reg 0x14 val 0xffffffff (hi)
(XEN) drivers/vpci/header.c:guest_bar_write d1 0000:01:00.0 reg 0x14 val 0x0 (hi)
(XEN) drivers/vpci/header.c:guest_bar_write d1 0000:01:00.0 reg 0x10 val 0x23000004
(XEN) drivers/vpci/header.c:guest_bar_read  d1 0000:01:00.0 reg 0x10 val 0x23000004
(XEN) drivers/vpci/header.c:guest_bar_write d1 0000:01:00.0 reg 0x14 val 0x0 (hi)
(XEN) drivers/vpci/header.c:guest_bar_read  d1 0000:01:00.0 reg 0x14 val 0x0 (hi)

> +         PAGE_OFFSET(guest_addr) != PAGE_OFFSET(bar->addr) )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pp: ignored BAR %zu write attempting to change page offset\n",
> +                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +        return;
> +    }
> +
> +    bar->guest_addr = guest_addr;
> +}

