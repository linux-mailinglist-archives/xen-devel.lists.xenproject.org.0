Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794F70C16F
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538004.837719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16pt-0003it-M5; Mon, 22 May 2023 14:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538004.837719; Mon, 22 May 2023 14:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16pt-0003fn-Il; Mon, 22 May 2023 14:48:33 +0000
Received: by outflank-mailman (input) for mailman id 538004;
 Mon, 22 May 2023 14:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrm0=BL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q16ps-0003fh-45
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:48:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e89::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b59410c5-f8af-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 16:48:28 +0200 (CEST)
Received: from BYAPR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:74::31)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:48:25 +0000
Received: from DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:74:cafe::81) by BYAPR05CA0054.outlook.office365.com
 (2603:10b6:a03:74::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.13 via Frontend
 Transport; Mon, 22 May 2023 14:48:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT099.mail.protection.outlook.com (10.13.172.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.29 via Frontend Transport; Mon, 22 May 2023 14:48:24 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 09:48:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 07:48:22 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 22 May 2023 09:48:20 -0500
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
X-Inumbo-ID: b59410c5-f8af-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Obt0/fydd3hKwj9etMrkyV6F48TcgzFv86SkRL7pCjrJrG/lrHHS1Fd91jnPBWPTR31bZ5eXPSFAuA0q+r9FgB8veeKYjdp3tY3wTio6PdjcIzs8jWSlOVuU4KKckGCOdIj2zEh+66ZtvbqRL0LcG8HnDXtii6gw6xJgVW7+4Hj7KLIqS2xKSdFDnexub33cALOpS/51+IkuiINpb7mTL2DdfxLclYlYlmojsbkXEUzJXzYxQquSF2PlIXsHYcKPWPKZCQgm5S2vvIMj2/ntsrkijtD2aT/05UbvcJYB6tpGPFi2NHVx417p/PHkePFU8xjV5miAxQWhqu4HhQs8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu8tc6QUaD2f1Bg+pJtdesvDnIdQHpfh5WkPGu9o9vI=;
 b=A5Hfsge6A+oMgi1YfWN5VJy+BPp3d9OHwem8fQP0xw6oHwtwvK9PKH8MMPoWoZZjXdLogOfvmWH6ynSUhKhD5BtWiuVjNZLHZ+Jrn6WUEXKcpBwMZ/xTSjCC5Bs5ZfYA1M/qJCfuFPJfuX9uvSUhg/mJC/x9W8UAyG8gPSoN3+LTmTAl+an3JW3dp7C38JUPYJJz46le3kRSk0hyhXJZf87R09lpf7gFXsMYaeB9O/UkzPXzK6L1+EKaFCJoZrP4gC8qNMQmkfPUCMi7CHOQAlSHiqAd6lhFFrvX6QZ0vsd1POOSJq5DSOGWFnEuQiBGQhyxGFVLGAtgIq3J+LAfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu8tc6QUaD2f1Bg+pJtdesvDnIdQHpfh5WkPGu9o9vI=;
 b=PGVwJLI9VokB550zZY4xWnKIiG1XYpF2KiHuoIczmGEbXwo1QVysjzoUfaOnguhc6i8wOrgchtZ9ngtcwBDS0P/E4W7MUK5IWZnHSaM5RTzecOTQ/xT/X51AGvDR+qX1eWFQAk9X01oSErDMeTX1+PXYCBlR5kcrDdDRShyuqic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c6dd2581-7dd9-a0da-8b27-3523744349c0@amd.com>
Date: Mon, 22 May 2023 16:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/6] iommu/arm: Add iommu_dt_xlate()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
 <20230518210658.66156-3-stewart.hildebrand@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230518210658.66156-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT099:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 72aabe80-d278-4f64-9bd9-08db5ad39849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yQh6Wws2ibR9EVHtPkhJ6s8C9IdKtATmGArtlz3GSbUX3p2UY7da6x7z8IcaBV7eOYveYyMtxEoMXwsLOhnfptCFvsohbp0Xm9gGFgtzKw/rslHA1gc6pldycMdZ3pTiHCAH1p39UtfubE8j9GGRS8qpmfbVMP2o8acLiUcTPnr6Sosntppu+TO6lKM+IfCMKgu8Yb1nTuW2lwJA9aAtIIkWY4YQ4Kl7FH9eIn/fiL/IZlyZsEYjEVk9z1gvgzyb5dJJLzKbLGsPmcydH8edcOpaxE8S7fYkxaCxlBWK/hKSadb+1rhYEqCRZR1LdIDFT3f6LCr0d0cOJixFexbZc2Mrl6e9foJJhAjz4IhjyR1wuJvIe4XJrEpVBqGufwk6hzyYXcmBvwxEiheHSfyikBu9I30xwYrdgoxDcW4K9ol5PuBSsrS5byBC/sxyvp8jNhCTKUOvqnTvbqijrxGnFb9daQkTJrbfggs8LWVPWEvFnQDPTWI/Qb9z3R89WDAg0JTzFUttYGTRxu8uC5cjgZwXAEQcH04ZnHYxZtpLZKqIwIjWZdeEY4SzV0V01dcCpLiRav5tJ9emaDrnNhsAXWOoCXW6hNPSXslk3Y2MmnWY/Y0qC3Z/HIXTE3KgPlg9WnTUh8m4fbkK4Oz4Ivrdi36vaJ0fgZvarhvXlHC/ylMeHWP0hAHI6PRhJgHYREMSy3LeDonuAbzy2+oEonh3o2vJr9NgjbuACB4Kgog2ek+NFDpDcwpmmeFTFcuUZyPI0SwOgb/1B8j7OOEI481913foqbmZFIV73DjfcWTfL4M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(8676002)(8936002)(5660300002)(44832011)(36860700001)(82310400005)(47076005)(186003)(81166007)(53546011)(26005)(83380400001)(336012)(86362001)(2616005)(31696002)(82740400003)(356005)(426003)(40460700003)(41300700001)(6666004)(40480700001)(966005)(70206006)(70586007)(316002)(36756003)(4326008)(478600001)(110136005)(54906003)(16576012)(2906002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 14:48:24.1836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72aabe80-d278-4f64-9bd9-08db5ad39849
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073

Hi Stewart,

On 18/05/2023 23:06, Stewart Hildebrand wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Move code for processing DT IOMMU specifier to a separate helper.
> This helper will be re-used for adding PCI devices by the subsequent
> patches as we will need exact the same actions for processing
> DT PCI-IOMMU specifier.
> 
> While at it introduce NO_IOMMU to avoid magic "1".
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com> # rename
> ---
> v2->v3:
> * no change
> 
> v1->v2:
> * no change
> 
> downstream->v1:
> * trivial rebase
> * s/dt_iommu_xlate/iommu_dt_xlate/
> 
> (cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
>  the downstream branch poc/pci-passthrough from
>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>  xen/drivers/passthrough/device_tree.c | 42 +++++++++++++++++----------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index b5bd13393b56..1b50f4670944 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -127,15 +127,39 @@ int iommu_release_dt_devices(struct domain *d)
>      return 0;
>  }
> 
> +/* This correlation must not be altered */
> +#define NO_IOMMU    1
> +
> +static int iommu_dt_xlate(struct device *dev,
> +                          struct dt_phandle_args *iommu_spec)
I think iommu_spec can be const.

> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    int rc;
> +
> +    if ( !dt_device_is_available(iommu_spec->np) )
> +        return NO_IOMMU;
> +
> +    rc = iommu_fwspec_init(dev, &iommu_spec->np->dev);
> +    if ( rc )
> +        return rc;
> +
> +    /*
> +     * Provide DT IOMMU specifier which describes the IOMMU master
> +     * interfaces of that device (device IDs, etc) to the driver.
> +     * The driver is responsible to decide how to interpret them.
> +     */
> +    return ops->dt_xlate(dev, iommu_spec);
Wouldn't it be better to move the check (!ops->dt_xlate) from iommu_add_dt_device to this helper?
After all it is the only function that calls dt_xlate so for me it would be a natural placement.
Looking at the next patch it will also reduce the similar check in iommu_add_dt_pci_sideband_ids.

~Michal

