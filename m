Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6967915BD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 12:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595050.928530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd6sl-0007T2-AQ; Mon, 04 Sep 2023 10:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595050.928530; Mon, 04 Sep 2023 10:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd6sl-0007Qs-6q; Mon, 04 Sep 2023 10:32:35 +0000
Received: by outflank-mailman (input) for mailman id 595050;
 Mon, 04 Sep 2023 10:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ceyR=EU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qd6sj-0007Qm-P7
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 10:32:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57b24d92-4b0e-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 12:32:27 +0200 (CEST)
Received: from MW4PR03CA0045.namprd03.prod.outlook.com (2603:10b6:303:8e::20)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 10:32:24 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::99) by MW4PR03CA0045.outlook.office365.com
 (2603:10b6:303:8e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 10:32:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Mon, 4 Sep 2023 10:32:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:31:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Sep
 2023 05:31:45 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 4 Sep 2023 05:31:44 -0500
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
X-Inumbo-ID: 57b24d92-4b0e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJ4qDnzwrRvKKSpxD4kBdGM9BzzYIt8rnMQ7LJOJMKatgHj/jFtzQMlqoqYDtpYSy3y6rxkuv55/8Ub5xz4ofjr+XXMNgsu0vqi1ROQsgcalgaiFvntpQqcb3Io0IfsY94o/zRRW+dyUFt0Ss6K34eV2eFrMcpK53NsXP7E/c0hlW9WyX4TYCICMevbAf2ucgCemtAVun2rSS6n7y3LupnPbeAb5NCsGN3Cgp1X1KktLf8fAEAb2GJQ22g0kFwDj0JnMkEbdT1/VactqZ/CbgVQIeFom2rhjmB3uwF/hIstyUdUj3+vqcsEzVw2lIH370lhQ3xJd+UdY5BinNiyu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTdBjjlskRyXVFnQ3rkx2reo+2sZu6EORZam6WJQLzQ=;
 b=MdgzzKFPVCaAn71tJ0eS50U3Ts5FocG8lXFaIlMlRTlFt0HozHzhYRzoWEJICZvf1TEW24GvY5jL0ftR5LE4Y1kAMYUXDrOFmOF3EHgGXoHwRBW6HnefWhhG60kz8PKoxAvqtUNTTAiBYBEzYD5ZByfwZeYeimEKSbfOaELziD6lkeo0xgnyEVKzTuTTrjxQkSUbIqRj02v2ZuuXcNrF29gpLScwStf3S01YxFuTY9u00o5DeOeLaIKOUu4O1haWogrGPUxIGM6Waa//rcKs0dKTrLPCdI9YFG6bDooJ4gse2HiH97g2OGvIgBTbkvEREq2n5ToMUdS2CisI5JfpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTdBjjlskRyXVFnQ3rkx2reo+2sZu6EORZam6WJQLzQ=;
 b=X3uikVkeYBbhT2D/lAnIeE7ONseTanIjJS8BADr/gG0hZ4DWvm3G/0knPqTJgGs0+k82DTPgGiQgB739BJr7gbwpR6+zp+//FeZaLmgLNOS22Vr1Yz5xtJp7VmWotCekrjg0sz0E9DIQzCMjlcQcVjZiPCLrkd/mYbEK2N9r4Hg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0578e1fc-4999-b375-6805-5c980dad41c4@amd.com>
Date: Mon, 4 Sep 2023 12:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v11 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
 <20230901045947.32351-12-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230901045947.32351-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 93585f3d-ef16-4342-05a0-08dbad3239f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5fHmhIaXPOPRPXYy70ruKLng+v7DoBPQTB1IQzkpC123X74HS7dQeARqqqgNBRHELhKDKekZhJLcYdbo7BjLdjZc3cENmv9WmcxILnldcLol+guJNyU6j4/cShidAqTGW7WSwnOlLKifNinS0bdaagS6/sI4Ow7FOoMyAjdSklWH0rm3tbYB17fYPHjln1HmSscuR4kJ/fSXCjPC5syhnhvMLXaiX71jmFw68I25nMxvCb2gkEOnDKxMdC7PBW0zLYE+4b+j6Wrp9Zn3wNfi7swOlAIG4aESvKmkF8umbM8a74tQvnlvUAFrBl0r8hDHFz6UaAcHTa1xidCIF8665gAD6TyNsnhDUcXd96hLhHOGK6By28Z7l+4uLh1CarfNlRaudRiNKsj5rRHieLSSGFUMnReljaYvoAFx70naXnNGg7aHHRfwGCVYxEsB3ghcBpYCPfDeHKWwla9HfaWY+eGNisuPvhKebe+WpHSZAc4fQLXDY6AMKmo5WzOu+OLa6bECv25SCiaHC2sLVdSw9jzuSFlkjEJvJB/TEDXbt6mDu3ECOf6VcuHAsOfp6aQ94R3R7hepcsbByOHq9J38Z31jiYovYzTeG1Fk5AoBp43NJmppzJodGJJFw0VLRwe9TYpSi9kJ0HNEiS7MZWNr5hQ9OeFcpHNz+nCbQQ7lG9jLzYR3lh05DT8+/Q6SNrCHmw+THexmDvEER4iXRb0Q1rD/DKuHH/JP5g3MwNTXAVwfbOEOqIUBMRQhRjNpdIq3zpWfNxj1hIjiURHwmayPd2wbzQGkwqERs0Hre503xTo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(41300700001)(478600001)(356005)(82740400003)(81166007)(31696002)(86362001)(2616005)(83380400001)(336012)(26005)(53546011)(36860700001)(40480700001)(426003)(47076005)(70206006)(70586007)(54906003)(2906002)(110136005)(36756003)(316002)(16576012)(8936002)(5660300002)(31686004)(8676002)(44832011)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 10:32:23.3889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93585f3d-ef16-4342-05a0-08dbad3239f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876



On 01/09/2023 06:59, Vikram Garhwal wrote:
> Remove master device from the IOMMU. This will be helpful when removing the
> overlay nodes using dynamic programming during run time.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v10:
>     Add comment regarding return values of iommu_remove_dt_device().
>     Add ASSERT to check if is_protected is removed or not.
> Changes from v7:
>     Add check if IOMMU is enabled.
>     Fix indentation of fail.
> ---
> ---
>  xen/drivers/passthrough/device_tree.c | 43 +++++++++++++++++++++++++++
>  xen/include/xen/iommu.h               | 10 +++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 687c61e7da..80f6efc606 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -127,6 +127,49 @@ int iommu_release_dt_devices(struct domain *d)
>      return 0;
>  }
>  
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc;
> +
> +    if ( !iommu_enabled )
> +        return 1;
> +
> +    if ( !ops )
> +        return -EOPNOTSUPP;
> +
> +    spin_lock(&dtdevs_lock);
> +
> +    if ( iommu_dt_device_is_assigned_locked(np) )
> +    {
> +        rc = -EBUSY;
> +        goto fail;
> +    }
> +
> +    if ( !ops->remove_device )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto fail;
> +    }
> +
> +    /*
> +     * De-register the device from the IOMMU driver.
> +     * The driver is responsible for removing is_protected flag.
> +     */
> +    rc = ops->remove_device(0, dev);
> +
> +    if ( !rc )
> +    {
> +        ASSERT(!dt_device_is_protected(np));
> +        iommu_fwspec_free(dev);
> +    }
> +
> + fail:
> +    spin_unlock(&dtdevs_lock);
> +    return rc;
> +}
> +
>  int iommu_add_dt_device(struct dt_device_node *np)
>  {
>      const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index a18b68e247..84bd77395e 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -235,6 +235,16 @@ int iommu_add_dt_device(struct dt_device_node *np);
>  int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  
> +/*
> + * Helper to remove master device from the IOMMU.
> + *
> + * Return values:
> + *  0 : device is de-registerd from IOMMU.
s/registerd/registered/

> + * <0 : error while removing the device from IOMMU.
> + * >0 : IOMMU is not enabled/present or device is not connected to it.
The first part refers to "iommu_enabled" but I cannot see how you check for the second part
(and return >0).

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

