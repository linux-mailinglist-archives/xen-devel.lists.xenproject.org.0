Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8446677819
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 11:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482710.748360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJtdD-0004aV-72; Mon, 23 Jan 2023 10:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482710.748360; Mon, 23 Jan 2023 10:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJtdD-0004YQ-49; Mon, 23 Jan 2023 10:00:51 +0000
Received: by outflank-mailman (input) for mailman id 482710;
 Mon, 23 Jan 2023 10:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StYb=5U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pJtdB-0004YG-Eq
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 10:00:49 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceca4751-9b04-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 11:00:47 +0100 (CET)
Received: from DS7PR03CA0182.namprd03.prod.outlook.com (2603:10b6:5:3b6::7) by
 MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 10:00:42 +0000
Received: from DS1PEPF0000E632.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::c9) by DS7PR03CA0182.outlook.office365.com
 (2603:10b6:5:3b6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 10:00:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E632.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Mon, 23 Jan 2023 10:00:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 04:00:41 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 23 Jan 2023 04:00:39 -0600
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
X-Inumbo-ID: ceca4751-9b04-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfbJW3y1trkUtR/0s7lwsITNZiW+yZRjc60sYCnSgQp0cDIAXXKKwdWWT6ad6kiTXkv2Dtyr9YhSOR49BJ5Sc7OY9w9DTbyDBWUt2S27oqKgUTFdMaky5RKZmXlsY1XboECu/+UFK2cNuoc7Tl5ktP7f94Yfxw7StZiAOsLBRT6FVYQyJd23BJ+l9iIzSJpUtynFvzGsl5h796qvHMpvBGlOoz25ulrYvoWy4PFMthlcxtxpImQ6G6Dv409PpPUsZXIEX27rNNtUHDmekxSRKin6gbmUKaxZ8c0vZcvDm8Vpq3XPtWbBgaQOy7TcC0zqYUencu0wJGz4ihkrnQyh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zYprjtrKsdKBHl/ZKkPyjDmFujiX6ygwUsmkay0LJo=;
 b=DIBN5MG6VzJ5TkJz+eyFTPrnfGZdNf45Zqr7qAy1F7J1j3ZhDLPTeY6iLO4szS0LSk8209+Rvp+TL8i6r94AWwQ4IbHNVVt1DRf2gUTCk9NEzuDQ3c5e8Xo60iDF/MKvWTMsIU7FmiZHlanszgN9NhjQgXk/jXFXGwCQ+tJuztjvT+uVTDfiqErqh6ySXqeJS3ZVIndv5q+G47Ro6EJoQXV1dO80KCj3xZbo3JUXrrekNOw5qG6ujRaCLe+SiU/i1htLYEZdxGuIOw6E5pFHkaXAoAYJSY60wGizPXXRQjad7BqI/bTgrh6cOEk8neI2D/z/oSYkg02VFTfZOXRQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zYprjtrKsdKBHl/ZKkPyjDmFujiX6ygwUsmkay0LJo=;
 b=S5dVQp9ab4kj19wycuH4POqer8+CeH3F6JKXlJZoMjzpZkISWjLUnrKf0Hum20zIYYtPzSCT1aoDFHDmdUB0Jg1xHKPvbTkwAzmvyaoIxjiLtuhQD3doR1XqPTybHMFxKrt52WW2DN+Iy3a0JFs1R13FNGx0QvNXKOoas8CWv1I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <311dc97d-e924-e9ad-25d3-1135d4b24f7e@amd.com>
Date: Mon, 23 Jan 2023 11:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 09/16] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <Luca.Fancellu@arm.com>, "Jan
 Beulich" <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-3-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061815.7404-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E632:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: b72a9767-4c01-45a5-00a6-08dafd28afd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cQlqtCLflGtP8rmKLMJ/ItTR5MMovAKI4Wtti/udQsjgTEkPCjZqrMUQ2PwwWEtL6gXztTqdv9Q8BmjYM+ANH1kPzTkXF31Kb4ipycSoMLCH7utFck3jWkocjXlZE0uaDayWviX2vFRvirMMCXyTsvxITayWQRVkPDG3JFO9suBzNvP1PUXPRuTSM5UmOZ99LDb4lNXEgq25FVzyZHUEF3W514IEnVC1FKU2qUKm7xyiNO35+OV8S8JmlpS9kUobXwHG83LYtLFFO4Xd/SCIo2H5jxUOgGPNxNTgmF6foWyRDlPgEojpJt3V2kbmHGg3dQcgPtKe9Gv5B8kQ0HXmB87YvBWjOgLR8Lesqt4SEyggf4ACLy8S24KJxHn/HyCKoM/OeOGpNGbqPylslrp2Nyrf2brC/zt0l4Dkmnr+h/e9SjdNFTVbOMkgc97wly5I/ibgK7hlsGCeHCJeyOSbRRyCIUADS+a70OEdfgY0tKZxu8Dpk+qp8NVTuBFkux2+7V/NMYX5ewUsITo39LX7Q3WpXKUhTzGh3jzaTtxosD/qa34WZr8GP5l5xsGMBtvx5ycdgNH5TSOpNtAQjLrYVpEFRBMBqPAeC397vKCTGDmRlvNHXLJD/tlxUwaQn/BVvakR9dB0RuDSqVvnRcxuxC1JluNOKQMAQBTAwWl5ZXwuq2Oid3EhRcDKmezoVzbuO1TzT8CYwjNcDio/KmOEFG4uD6eV3CGrfun0ZsuwaCGinrLunMHjoq4iQ0QZXEhbBcK7bEedUTOrfwEHAN5eww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(478600001)(31686004)(2616005)(47076005)(426003)(4326008)(8676002)(26005)(186003)(336012)(316002)(70586007)(70206006)(16576012)(83380400001)(53546011)(41300700001)(36860700001)(8936002)(2906002)(5660300002)(44832011)(82740400003)(81166007)(31696002)(82310400005)(54906003)(110136005)(86362001)(36756003)(40460700003)(356005)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 10:00:41.6278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72a9767-4c01-45a5-00a6-08dafd28afd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E632.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652

Hi Vikram,

On 07/12/2022 07:18, Vikram Garhwal wrote:
> 
> 
> Remove master device from the IOMMU.
Adding some description on the purpose would be beneficial.

> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
>  xen/include/xen/iommu.h               |  2 ++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 457df333a0..a8ba0b0d17 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -126,6 +126,44 @@ int iommu_release_dt_devices(struct domain *d)
>      return 0;
>  }
> 
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc;
> +
Aren't we missing a check if iommu is enabled?

> +    if ( !ops )
> +        return -EOPNOTSUPP;
-EINVAL to match the return values returned by other functions?

> +
> +    spin_lock(&dtdevs_lock);
> +
> +    if ( iommu_dt_device_is_assigned_locked(np) ) {
Incorrect coding style. The closing brace should be placed on the next line.

> +        rc = -EBUSY;
> +        goto fail;
> +    }
> +
> +    /*
> +     * The driver which supports generic IOMMU DT bindings must have
> +     * these callback implemented.
> +     */
> +    if ( !ops->remove_device ) {
Incorrect coding style. The closing brace should be placed on the next line.

> +        rc = -EOPNOTSUPP;
-EINVAL to match the return values returned by other functions?

> +        goto fail;
> +    }
> +
> +    /*
> +     * Remove master device from the IOMMU if latter is present and available.
> +     */
No need for a multi-line comment style.

> +    rc = ops->remove_device(0, dev);
> +
> +    if ( rc == 0 )
!rc is preffered.

> +        iommu_fwspec_free(dev);
> +
> +fail:
> +    spin_unlock(&dtdevs_lock);
> +    return rc;
> +}
> +
>  int iommu_add_dt_device(struct dt_device_node *np)
>  {
>      const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 4f22fc1bed..1b36c0419d 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -225,6 +225,8 @@ int iommu_release_dt_devices(struct domain *d);
>   */
>  int iommu_add_dt_device(struct dt_device_node *np);
> 
> +int iommu_remove_dt_device(struct dt_device_node *np);
These prototypes look to be placed in order. So your function should be
placed before add function.

> +
>  int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
> 
> --
> 2.17.1
> 
> 

~Michal

