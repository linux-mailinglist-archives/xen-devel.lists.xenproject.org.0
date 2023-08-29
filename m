Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71778C02E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 10:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592044.924669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qau0l-0008QH-9t; Tue, 29 Aug 2023 08:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592044.924669; Tue, 29 Aug 2023 08:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qau0l-0008Nm-6W; Tue, 29 Aug 2023 08:23:43 +0000
Received: by outflank-mailman (input) for mailman id 592044;
 Tue, 29 Aug 2023 08:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qau0i-0008Ng-RR
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 08:23:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d6f948-4645-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 10:23:38 +0200 (CEST)
Received: from SA9PR13CA0175.namprd13.prod.outlook.com (2603:10b6:806:28::30)
 by SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 08:23:34 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:28:cafe::6d) by SA9PR13CA0175.outlook.office365.com
 (2603:10b6:806:28::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Tue, 29 Aug 2023 08:23:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Tue, 29 Aug 2023 08:23:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 03:23:33 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 03:23:31 -0500
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
X-Inumbo-ID: 59d6f948-4645-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlluB7Rd6C0W2ppqptR7xmerMPlAFJcVWsx+zjPsplEFMFyP8CfnNTNP2l1ZoKKSxA6wDw9Xo/01F+nunvo8iTk3bBl25eQIhuCsOrymHoEKy/q3h3jXmNLdLatp7ND2J71KH39wgqD0L2Xq4csGoLGOvMWD2PPVil+xRTu4oB3oyyuEp9zUu/dd29xSqIZVDGftVTQbPfa+RuQAYoDeJoPipqs0Vy8Uus/CLdKakHUORVeH7ismtUwarSTyNh0FMBfNqLL4PAXNNWRvyPcxrY4L+Kfr32Uo8B/8CARox9Jcpz185jwcIClxUy5IZ8e66S4oy2arU5iHNPsizJvjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TIIR/SAYAHYG+ymayrp8H40TqJK+DwvMn8MFvplxx8=;
 b=KesA607KHZHckbTaYQOkqIyx1D/x4DTjq9T3vXp6crAx9FD5PRa8+hAaqoxqFJdAJ5YLryU1Vn+BlvLwhOGeBrAdaoLIIqRYJHzEPpYYlrSNQqC2Qc5g4pXoiMrz7x2UYxwatuzICB2u1zBm+ADvM9MpxXW+BaQ8OZt6m3Wv0aI7qw5ItXkXAEfnZIMi2sjeoEXctNcG/GTLhSqhiR8b/NJnW4AnzJSOnenA87vvw1hy58JZ9TxKRZ2+Bj6k903gq1CRaD0JcOtB4tF1c2yCPREavxVVtsKDxrCe/5CM0oq9mQY1tbuuvzKgx8InHgXCdy1ABr+t2ZmLZLTgct753g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TIIR/SAYAHYG+ymayrp8H40TqJK+DwvMn8MFvplxx8=;
 b=Tuv7bBKfj4JfHbeBL4f8Ki/NqRngPpFhuLy69XIjNdCggDwb/FrxzvNqIxN60YdF0UqHdsyx7VFr6VAUIfF/J181vZGZaPBrTzY8sPImahMDz6a049NHTPIT+CsIOtedS8fmIDI0kzue9yHo8a8eCaSxUFLzcZ/dz9/YUWfUli0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <079c831a-bf1e-5489-562b-01cf4e3e6b02@amd.com>
Date: Tue, 29 Aug 2023 10:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-12-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SA0PR12MB4512:EE_
X-MS-Office365-Filtering-Correlation-Id: 066502ab-ddd8-4d34-6c95-08dba8693c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oF9HUFY6Rw1wxoJljqG0ZYYMv618tOr5dW70WQXAjz9vb2uMIOkXSZ6tAvwAszwJVgXtsLJvIEbQzBzdhv0TDMSVi70z2asQ0cav1ysgYHRjtJQ5B0TaRAyNqal2qYnMXQaLnpUFt1dbNgmEouvR6k/gNNDHBVtUUEasCQl9bmzuE9J/17qS77Ma5ZVqPo/D2cVvCIHe7b8HjYEDx3MB6HTFekrSjc4G9m0sKQm/A3WFaWUBjwdx0T7FSrIQrQWsErqb1JVnLjkoC9xgRi98gyvBzM3ISMDOqamvXIsXi0ZHmvXMBsFw1n9RHJTOmvszzuYm2cqg78exi5Rs4uhjgEHglFHOKswD5Kt6jaeM766dqzjz/tVF6t8hw2vka94W1xm4/M4tPmHZY8vL4qB7K5oiz+ZgGac4Pn9cYUq/MEgvBda0RpjTWePuOL6NrHaKo+53D5Kk2Ek9i08xoZswvntYJ7OEwE+CH6FgN2UD2GFxyemR26fzPKYvYKC1eTRufAQhx1T16uMljspGwsJzK2oyDT1sp19N5jKEWKqeNweyASG3mIbBeuRFuCfaZywbYB49UjDoVp4J+464Ig+Maw9A6u4X+rKAlcWV0Kd/jge3t78GvUzpXc44Ep2saNgypz9wYdD6hPuHchYDhpubXHPaLsXzbSA8047S0h39hFgNimNyLAMh/fmylMWAuiAgjP0W79xMJ1rDFB8zDA53sD6LRDnbfODb+AHuqJr5TXRCGr723HbtkIAmdCORodWFgyfsOuXJkS0n1ujLwgRa8TqDwYGllp5kMSZi2T1iS6Hk6T26MW1g2/xFpCdHrVWS
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(1800799009)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(2616005)(36756003)(26005)(478600001)(40480700001)(86362001)(83380400001)(8676002)(8936002)(47076005)(36860700001)(110136005)(70586007)(53546011)(336012)(426003)(31686004)(316002)(41300700001)(16576012)(70206006)(54906003)(44832011)(4326008)(5660300002)(2906002)(40460700003)(356005)(81166007)(82740400003)(31696002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 08:23:33.6681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 066502ab-ddd8-4d34-6c95-08dba8693c27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4512



On 25/08/2023 10:02, Vikram Garhwal wrote:
> Remove master device from the IOMMU. This will be helpful when removing the
> overlay nodes using dynamic programming during run time.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

You don't seem to handle Julien remarks for this patch made in v9.
I will forward them here to avoid answering to old version, but for the future, do not carry the exact same patch
if you haven't yet addressed someone's remarks.

> 
> ---
> Changes from v7:
>     Add check if IOMMU is enabled.
>     Fix indentation of fail.
> ---
> ---
>  xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
>  xen/include/xen/iommu.h               |  1 +
>  2 files changed, 45 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1202eac625..3fad65fb69 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
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
J:
The caller doesn't seem to check if the error code is > 0. So can we 
instead return a -ERRNO?

If you want to continue to return a value > 0 then I think it should be 
documented in a comment like we did for iommu_add_dt_device().

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
> +    /*
> +     * The driver which supports generic IOMMU DT bindings must have this
> +     * callback implemented.
> +     */
J:
I have questioned this message in v7 and I still question it. I guess 
you copied the comment on top of add_device(), this was add there 
because we have a different way to add legacy device.

But here there are no such requirement. In fact, you are not adding the 
the callback to all the IOMMU drivers... Yet all of them support the 
generic IOMMU DT bindings.

> +    if ( !ops->remove_device )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto fail;
> +    }
> +
> +    /*
> +     * Remove master device from the IOMMU if latter is present and available.
J:
I read this as this will not return an error if the device is protected. 
However, AFAICT, the implement in the SMMU driver provided in this 
series will return an error. So I would suggest to replace this sentence 
with:

de-register the device from the IOMMU driver.

> +     * The driver is responsible for removing is_protected flag.
J:
Can you add an assert in the 'if ( !rc )' block to confirm that 
is_protected was effectively removed. Something like:

ASSERT(!dt_device_is_protected(dev));

This would help to confirm the driver is respecting what you expect.

> +     */
> +    rc = ops->remove_device(0, dev);
> +
> +    if ( !rc )
> +        iommu_fwspec_free(dev);
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
> index 110693c59f..a8e9bc9a2d 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -233,6 +233,7 @@ int iommu_add_dt_device(struct dt_device_node *np);
>  
>  int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
> +int iommu_remove_dt_device(struct dt_device_node *np);
>  
>  #endif /* HAS_DEVICE_TREE */
>  

~Michal

