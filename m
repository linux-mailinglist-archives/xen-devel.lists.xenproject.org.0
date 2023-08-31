Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B748B78E736
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 09:33:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593441.926441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbcAq-0002Ln-64; Thu, 31 Aug 2023 07:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593441.926441; Thu, 31 Aug 2023 07:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbcAq-0002J0-3S; Thu, 31 Aug 2023 07:33:04 +0000
Received: by outflank-mailman (input) for mailman id 593441;
 Thu, 31 Aug 2023 07:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P20E=EQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qbcAo-0002Iu-DE
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 07:33:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cf69991-47d0-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 09:33:00 +0200 (CEST)
Received: from CYZPR11CA0014.namprd11.prod.outlook.com (2603:10b6:930:8d::24)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 07:32:57 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:8d:cafe::ef) by CYZPR11CA0014.outlook.office365.com
 (2603:10b6:930:8d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21 via Frontend
 Transport; Thu, 31 Aug 2023 07:32:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Thu, 31 Aug 2023 07:32:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 02:32:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 02:32:55 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 31 Aug 2023 02:32:54 -0500
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
X-Inumbo-ID: 9cf69991-47d0-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/NBOemajLJ1kyaRJzngzYzNv/zNBa4o7jtWzQCebDiiah3Q2PgJ+xLHyzdvaoMofCrXc1rCnHRkrfb9tMCRQrTydJKWz1a+pMDTqf2eDfymhP6YrmOfrrTU/DRsHp1xItgbCeStV5lnn/jlkbwmZYzEyJty5Wy5X5mSQNr+0R4+W7P+EBm2eh+lvmoMY86KikSFILjHxGF0B9IPGuJotsat7XtIyYlVsw7pieEMs+Q/Xf3FtfjM+OnhD5h/+odEoI5XQPAnWPO5CX7I55dnMbH6vUbURh5ae1sqlVQIp2vabL/baztH2FbbfrcFzPtI9f2/0BC7bJNMHHAZ+6ouRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xI8DzyhJbMnLzrLdQpcelbuODmk47Xs4MW3T4F0Qf/k=;
 b=jl7AN7tQEzCJ688o5XLul+6Q1v9WfKV/fxbXE+lTBmelTEYttcIgQtjXJSfIetUZZYVs4H1yuyEYKoLheR4dZinOEtJwV9a1gWnz/slFgLDfnu3XhQXfhimniufrAlZyW5D9qy8X1K7u+3OTiZByduu7IoGNQ83YrvGZSH3LfHbDv19mpoVdjG41P0Rzrg2BrueZp3y7zYiugKXwtNfkFMQXal2OtVzks2yjqRZBcVeLxqEFrIB1L7sNWHXMB6EnoSMGkrWt0bnCARc9Qs+Qa0unbcntPJezyEPKp9fYfnzcGNWc0xosejFBYun+tCNWOC9okH7riImHFIe0YXWsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xI8DzyhJbMnLzrLdQpcelbuODmk47Xs4MW3T4F0Qf/k=;
 b=bMXlozpkBgaWn8goUoS7VfXx0qKMCjyfEMbHyxU81tzqGy5YL/YM9ndDL2rOnEevtSwbOfOUxB06yVOMUmFTVR7iyhZA/y545BJAfN2h7jousPX/ao7RAIG79UuUzuRvM/fU+zW6/aIvMLVTWYAYIIKVPIXEuLxEkw047Z+x/CA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4f5236f4-39c3-ddc7-3570-2b6bfcd514dd@amd.com>
Date: Thu, 31 Aug 2023 09:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-12-vikram.garhwal@amd.com>
 <079c831a-bf1e-5489-562b-01cf4e3e6b02@amd.com> <ZO-A7ZERxISru9Ug@amd.com>
 <7e622077-2062-f2c6-38ac-81196f80d1d2@amd.com>
In-Reply-To: <7e622077-2062-f2c6-38ac-81196f80d1d2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1ad43b-71fd-4485-3197-08dba9f47ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yFn52QRibIZntdslt1k6DY6p/JDUkZORofEVpt2Vwc+eW100YiFJqhsOzAi3Oax87hJDy0aVnyZhU8IRfJwCjFU4R2PuJjWO1O+E2XCk6J7Mai2GU6vG3wBFWHAfBMWOkj2OZCyVdkrYUnNe7meSjuVev9SEGmhRagWIlZ+ju3xjOFx9sR+LlBdd63dqGnchl/k0LcIpDyqqYCSFA2vpSxI8iHMUyAKozOgZq2inZ/VNTaT4k3JKKWR7e4G0fQZiBq5hn3H4mVXfhSHCcCpugQ7JYGiUtixhEP1vHdJjpeMwxMUdVouJ7ws0e1Ai9FiNQDurvFMg8TwLNBWM09iqfydWr9B0KcXi13aMECcI+YfRnWWBd0z/yANqb6sJ5G/TLbePmw2/EK14Z5FWOjwPkqcBMT792rNrF4WP9PYHm7pt5JLegY+jSoZsvwFaubz6+5OEqXakWwQFoV2t6r/fKYtv233gO/i65EiFLckKaa73DDtj+k6ge4b8I+fSFXqOPb+9vWXyGmuqsU11dXnjVF9QaUSt1ByYfhEZAKIyqdxns5bM3QaGKHxzD8FaFTcYtb95V11XIL/yiDpSl/ob3egeuAY6FW1ZifgDZ62hJo3ctGzahAk75S9z+MvszyLWL58qQ81sgXyNc6p3M+k6SSYNwiDmNZ8gNWcganjLfGMpFBjhFZYFvdjlWt9gb57F2CbIXl1uC3/PIG4TyPnS9qgLEpRplUwx6cDDkV/T71JIkCAALJxaRTL8iOlIdUxOF1ZT2zHNOCZn5HWYdWEbLB7qEUg9UjJ4vAPgmvS0S8Bcqb8owIyjj2G34AFNlAj6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(31686004)(70206006)(2906002)(86362001)(31696002)(40460700003)(5660300002)(36756003)(81166007)(44832011)(82740400003)(356005)(40480700001)(6862004)(4326008)(36860700001)(8676002)(8936002)(47076005)(83380400001)(41300700001)(336012)(426003)(53546011)(316002)(37006003)(16576012)(70586007)(26005)(2616005)(6636002)(478600001)(6666004)(54906003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 07:32:56.7724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1ad43b-71fd-4485-3197-08dba9f47ede
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175



On 31/08/2023 09:23, Michal Orzel wrote:
> 
> 
> On 30/08/2023 19:48, Vikram Garhwal wrote:
>> Hi Michal,
>> On Tue, Aug 29, 2023 at 10:23:30AM +0200, Michal Orzel wrote:
>>>
>>>
>>> On 25/08/2023 10:02, Vikram Garhwal wrote:
>>>> Remove master device from the IOMMU. This will be helpful when removing the
>>>> overlay nodes using dynamic programming during run time.
>>>>
>>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> You don't seem to handle Julien remarks for this patch made in v9.
>>> I will forward them here to avoid answering to old version, but for the future, do not carry the exact same patch
>>> if you haven't yet addressed someone's remarks.
>> This got skipped as I cannot find direct email from Julien. The only email reply
>> on this patch is can find is from: xen-devel-bounces@lists.xenproject.org and
>> this got messed up with other larger set of email xen-devel sends.
>>
>> Did you get direct email?
>>>
>>>>
>>>> ---
>>>> Changes from v7:
>>>>     Add check if IOMMU is enabled.
>>>>     Fix indentation of fail.
>>>> ---
>>>> ---
>>>>  xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
>>>>  xen/include/xen/iommu.h               |  1 +
>>>>  2 files changed, 45 insertions(+)
>>>>
>>>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>>>> index 1202eac625..3fad65fb69 100644
>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>> @@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
>>>>      return 0;
>>>>  }
>>>>
>>>> +int iommu_remove_dt_device(struct dt_device_node *np)
>>>> +{
>>>> +    const struct iommu_ops *ops = iommu_get_ops();
>>>> +    struct device *dev = dt_to_dev(np);
>>>> +    int rc;
>>>> +
>>>> +    if ( !iommu_enabled )
>>>> +        return 1;
>>> J:
>>> The caller doesn't seem to check if the error code is > 0. So can we
>>> instead return a -ERRNO?
>> Will change the check in caller. I want to keep this as it as so it looks
>> similar to iommu_add_dt_device().
>>>
>>> If you want to continue to return a value > 0 then I think it should be
>>> documented in a comment like we did for iommu_add_dt_device().
>>>
>> Will add comment before iommu_remove_dt_device().
>>>> +
>>>> +    if ( !ops )
>>>> +        return -EOPNOTSUPP;
>>>> +
>>>> +    spin_lock(&dtdevs_lock);
>>>> +
>>>> +    if ( iommu_dt_device_is_assigned_locked(np) )
>>>> +    {
>>>> +        rc = -EBUSY;
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * The driver which supports generic IOMMU DT bindings must have this
>>>> +     * callback implemented.
>>>> +     */
>>> J:
>>> I have questioned this message in v7 and I still question it. I guess
>>> you copied the comment on top of add_device(), this was add there
>>> because we have a different way to add legacy device.
>>>
>>> But here there are no such requirement. In fact, you are not adding the
>>> the callback to all the IOMMU drivers... Yet all of them support the
>>> generic IOMMU DT bindings.
>> Will change this.
>>>
>>>> +    if ( !ops->remove_device )
>>>> +    {
>>>> +        rc = -EOPNOTSUPP;
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * Remove master device from the IOMMU if latter is present and available.
>>> J:
>>> I read this as this will not return an error if the device is protected.
>>> However, AFAICT, the implement in the SMMU driver provided in this
>>> series will return an error. So I would suggest to replace this sentence
>>> with:
>>>
>>> de-register the device from the IOMMU driver.
>> Will change the comment.
>>>
>>>> +     * The driver is responsible for removing is_protected flag.
>>> J:
>>> Can you add an assert in the 'if ( !rc )' block to confirm that
>>> is_protected was effectively removed. Something like:
>>>
>>> ASSERT(!dt_device_is_protected(dev));
>> Is ASSERT really required here. remove callback can return before setting is_protected as false.
> I think Julien wanted to add extra check to make sure driver behaves as expected.
> That said, his suggestion is incorrect since the callback can return before clearing the flag.
> So, if ASSERT is required, this should be:
> ASSERT(rc || !dt_device_is_protected(dev));
> so that we check for is_protected being false only on callback returning success (i.e. 0).
I wrote this based on iommu_add_dt_device(), which does:
    if ( !rc )
        rc = ops->add_device(0, dev);

but looking at iommu_remove_dt_device(), where you have:
    rc = ops->remove_device(0, dev);
    if ( !rc )
        iommu_fwspec_free(dev);

you should do what Stefano suggested (i.e. just add ASSERT into ( !rc ) block)

~Michal

