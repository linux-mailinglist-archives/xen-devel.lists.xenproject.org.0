Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690C178E728
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 09:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593392.926403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbc1X-0008TN-Nz; Thu, 31 Aug 2023 07:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593392.926403; Thu, 31 Aug 2023 07:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbc1X-0008Q0-Kw; Thu, 31 Aug 2023 07:23:27 +0000
Received: by outflank-mailman (input) for mailman id 593392;
 Thu, 31 Aug 2023 07:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P20E=EQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qbc1V-0008Pu-Lj
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 07:23:25 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4453130f-47cf-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 09:23:23 +0200 (CEST)
Received: from SA0PR11CA0162.namprd11.prod.outlook.com (2603:10b6:806:1bb::17)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 07:23:20 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:1bb:cafe::5a) by SA0PR11CA0162.outlook.office365.com
 (2603:10b6:806:1bb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 07:23:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Thu, 31 Aug 2023 07:23:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 02:23:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 02:23:18 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 02:23:17 -0500
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
X-Inumbo-ID: 4453130f-47cf-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neMvfnmZB3Ep8CkBhliPoR8tA6e8xQXfgwk06BeaLliYXv0Rprp8DZ2KWxza7u0GzL4A7FuU6QGcd/4dwxosQgqPlJkka22p/SOnTSYdEfz9fIe/eMTJz0lzMGeEQMivG1sbVAvtsszWwPchZeBBXc4RyOeu2KAlS2/KoX9CMOjAdxW3w/WYfJhA2kLl7gS/uH2cOu5DMrVcdowiySvb1RSNeMfx4LYHsDkuIOpYOU0SfZqb8pg3kIJ3a2U3zoAXyh4bLPf5DxbX59HaI5WPLX3jV9FsW2mAvjwh6pkbinoUP7QTD7Ay5JitVD+CVBfLSjq5z4T00/ueZ6x7eokSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwGVj/VveH0f2rJ23atUszcQDYf9dCmnRpKmhc86X+c=;
 b=QBsqFODMoLovB7RV/SndS1KMo0wzTibU42eoRFDEjsIe2B7IqH3x/pARYe6TmS9k4BSrUDsasRNiKFrSD5RlIhEQJMBeiRfe0y5rtr7l5C0jk3SSvAiJyIXBCdiiht46QyaidWXsV8cn938q6GWQRGvMMJZey8dCQY2YruNMqoz9X/Zkbn4FXU4kXxZcDQmRjHihDorKujaP/RUVtEEyOu2JqVx1Lkw57lJgIIQil5vw9nDpMNawTPdpRXY33p6bIZESXCPJNreJ7THjO5dYOSZmOt08uv9Q85v57jJFTbLFbbpp4HkQMZ13STE+wO4IW6hgqIkcaewSISQ76i3HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwGVj/VveH0f2rJ23atUszcQDYf9dCmnRpKmhc86X+c=;
 b=Mux1NjfrYL5+D/U83SzC7jZfTQmI5PV/3o7NF0B512Q8/CtALud3BGXW4NZsh0EI22sLQwyMoa70xuSAwWiqa0V24dyEKT1bgNiZEhMZViB+6IQeSfPWEqs+v2Lvo3tfwdMc6bBU5k/ee7i54J6suadhY4jTP0ghQdarul33iBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7e622077-2062-f2c6-38ac-81196f80d1d2@amd.com>
Date: Thu, 31 Aug 2023 09:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-12-vikram.garhwal@amd.com>
 <079c831a-bf1e-5489-562b-01cf4e3e6b02@amd.com> <ZO-A7ZERxISru9Ug@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ZO-A7ZERxISru9Ug@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6d8ef7-5827-4e19-fad9-08dba9f326c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BB9c8DWuwJbmYEKnKbjHxDVLU0Mec4mzMmSDnXg95Y0huSYMUZ6tcOtafb+t/ntJUf5UeRImlNMfncyeQGs1HxB/WsRxTVAL90rKgv4NKupLxJSJerpGZUgrPJ3EqLXOwl8Is3GFvfAEFvPrXhwAjIHcWstAyPUXRtvZj6xi69+6G5P6UlRDPADHJJPb3fYs4CX8pksV2T5b0XqtjX4Oma9WlsY+RRaVY8XI6Ogac7cXK3AJOcJLwS/wMNw1cKxdRJs9g9DG4wWMNxNATFB3d22W8ocLhn5+Jq53c23BM7eKgQa5lU/PcmHiJlbxGUmdawouZ4VbUlfcpyVfmZhpyNadOFw4aSjQ9nctukD2cPwcLdCukdC6OH88hy+h2jUVnDjmNgCZCVXWpdFND9QmbKsPp89s9YzPpEXczfWksqNRgbRRxkl4ayAcRRmHXHkJAwKVeiPfqfT4o45OS4l7GTq9hzSGDRzwEzM6fV0ygrhryemCTZfcvsiHuCf1Zcj3E4adrjvMc/IDgXTZ9zOZYwCJrht2tzu1gdDQ/ZQsWEcWYWC6EVEFLY0FZnd0he/h/FP3EhFmow6kGEpYk678Yf3A+lCCr5nNUIJgCRU5uyNUrvcGQgRe2LrfdBlOubXTbnf9kzDaIT8HRpcRk1ThuzdLs+yqgwLQoX69B+T1HStMv5jdX6tJrWmO/QJfOyibzO/o9gyBDpfaR96juji8y4CIa58/nzxxGauDr7apkAoSFq+3ajwzr0IZcRbVs8oIDNo2qtJuv/emzDLXpYtrhpUTgcWFw/MRyeP3NZohB470Icz75uFP3r3eUOIwyy4S
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(82310400011)(451199024)(1800799009)(186009)(36840700001)(40470700004)(46966006)(6666004)(53546011)(478600001)(83380400001)(2616005)(2906002)(336012)(426003)(26005)(37006003)(44832011)(16576012)(6636002)(316002)(54906003)(41300700001)(70206006)(70586007)(5660300002)(8936002)(4326008)(6862004)(8676002)(40460700003)(36756003)(40480700001)(47076005)(36860700001)(86362001)(31696002)(81166007)(82740400003)(356005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 07:23:19.4826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6d8ef7-5827-4e19-fad9-08dba9f326c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920


On 30/08/2023 19:48, Vikram Garhwal wrote:
> Hi Michal,
> On Tue, Aug 29, 2023 at 10:23:30AM +0200, Michal Orzel wrote:
>>
>>
>> On 25/08/2023 10:02, Vikram Garhwal wrote:
>>> Remove master device from the IOMMU. This will be helpful when removing the
>>> overlay nodes using dynamic programming during run time.
>>>
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> You don't seem to handle Julien remarks for this patch made in v9.
>> I will forward them here to avoid answering to old version, but for the future, do not carry the exact same patch
>> if you haven't yet addressed someone's remarks.
> This got skipped as I cannot find direct email from Julien. The only email reply
> on this patch is can find is from: xen-devel-bounces@lists.xenproject.org and
> this got messed up with other larger set of email xen-devel sends.
> 
> Did you get direct email?
>>
>>>
>>> ---
>>> Changes from v7:
>>>     Add check if IOMMU is enabled.
>>>     Fix indentation of fail.
>>> ---
>>> ---
>>>  xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
>>>  xen/include/xen/iommu.h               |  1 +
>>>  2 files changed, 45 insertions(+)
>>>
>>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>>> index 1202eac625..3fad65fb69 100644
>>> --- a/xen/drivers/passthrough/device_tree.c
>>> +++ b/xen/drivers/passthrough/device_tree.c
>>> @@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
>>>      return 0;
>>>  }
>>>  
>>> +int iommu_remove_dt_device(struct dt_device_node *np)
>>> +{
>>> +    const struct iommu_ops *ops = iommu_get_ops();
>>> +    struct device *dev = dt_to_dev(np);
>>> +    int rc;
>>> +
>>> +    if ( !iommu_enabled )
>>> +        return 1;
>> J:
>> The caller doesn't seem to check if the error code is > 0. So can we 
>> instead return a -ERRNO?
> Will change the check in caller. I want to keep this as it as so it looks
> similar to iommu_add_dt_device().
>>
>> If you want to continue to return a value > 0 then I think it should be 
>> documented in a comment like we did for iommu_add_dt_device().
>>
> Will add comment before iommu_remove_dt_device().
>>> +
>>> +    if ( !ops )
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    spin_lock(&dtdevs_lock);
>>> +
>>> +    if ( iommu_dt_device_is_assigned_locked(np) )
>>> +    {
>>> +        rc = -EBUSY;
>>> +        goto fail;
>>> +    }
>>> +
>>> +    /*
>>> +     * The driver which supports generic IOMMU DT bindings must have this
>>> +     * callback implemented.
>>> +     */
>> J:
>> I have questioned this message in v7 and I still question it. I guess 
>> you copied the comment on top of add_device(), this was add there 
>> because we have a different way to add legacy device.
>>
>> But here there are no such requirement. In fact, you are not adding the 
>> the callback to all the IOMMU drivers... Yet all of them support the 
>> generic IOMMU DT bindings.
> Will change this.
>>
>>> +    if ( !ops->remove_device )
>>> +    {
>>> +        rc = -EOPNOTSUPP;
>>> +        goto fail;
>>> +    }
>>> +
>>> +    /*
>>> +     * Remove master device from the IOMMU if latter is present and available.
>> J:
>> I read this as this will not return an error if the device is protected. 
>> However, AFAICT, the implement in the SMMU driver provided in this 
>> series will return an error. So I would suggest to replace this sentence 
>> with:
>>
>> de-register the device from the IOMMU driver.
> Will change the comment.
>>
>>> +     * The driver is responsible for removing is_protected flag.
>> J:
>> Can you add an assert in the 'if ( !rc )' block to confirm that 
>> is_protected was effectively removed. Something like:
>>
>> ASSERT(!dt_device_is_protected(dev));
> Is ASSERT really required here. remove callback can return before setting is_protected as false.
I think Julien wanted to add extra check to make sure driver behaves as expected.
That said, his suggestion is incorrect since the callback can return before clearing the flag.
So, if ASSERT is required, this should be:
ASSERT(rc || !dt_device_is_protected(dev));
so that we check for is_protected being false only on callback returning success (i.e. 0).

>>
>> This would help to confirm the driver is respecting what you expect.
>>
>>> +     */
>>> +    rc = ops->remove_device(0, dev);
>>> +
>>> +    if ( !rc )
>>> +        iommu_fwspec_free(dev);
>>> +
>>> + fail:
>>> +    spin_unlock(&dtdevs_lock);
>>> +    return rc;
>>> +}
>>> +
>>>  int iommu_add_dt_device(struct dt_device_node *np)
>>>  {
>>>      const struct iommu_ops *ops = iommu_get_ops();
>>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>>> index 110693c59f..a8e9bc9a2d 100644
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -233,6 +233,7 @@ int iommu_add_dt_device(struct dt_device_node *np);
>>>  
>>>  int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>>> +int iommu_remove_dt_device(struct dt_device_node *np);
>>>  
>>>  #endif /* HAS_DEVICE_TREE */
>>>  
>>
>> ~Michal

