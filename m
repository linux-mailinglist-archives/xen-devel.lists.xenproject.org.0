Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472956918F6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 08:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493110.762925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQNUd-0007OS-2A; Fri, 10 Feb 2023 07:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493110.762925; Fri, 10 Feb 2023 07:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQNUc-0007Mi-Vg; Fri, 10 Feb 2023 07:06:46 +0000
Received: by outflank-mailman (input) for mailman id 493110;
 Fri, 10 Feb 2023 07:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7PS=6G=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pQNUa-0007Mc-UR
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 07:06:45 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e88::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7847d3f1-a911-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 08:06:43 +0100 (CET)
Received: from MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 by IA0PR12MB7775.namprd12.prod.outlook.com (2603:10b6:208:431::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 07:06:39 +0000
Received: from MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::949:db4a:46d6:ed7c]) by MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::949:db4a:46d6:ed7c%5]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 07:06:39 +0000
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
X-Inumbo-ID: 7847d3f1-a911-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dusCKnU/k6S2dqXrAWgFc+n4/fVKT1M9WH7ByD9SJIr8aNpgkTV+vxU2YVvuTaaonY2WesgnCReUT0NcnmSZjswpTpwCb9vFytcnbHHMyovPEFUAiKvXKDvthmD6MjiXiZGZpTXnYLamAWmZyG2iX9jKeCR4K14k1BYGiBn4euMcAXuKzoCTjPVSmWntni7Jvv/skfYctn+OWZeYZlAYJ2lMgXy8Q5ld/GfDroYU9o+YV09s9nFakpxsfQ0NyT1O0yftE6RI8OhN0zC0uo3riC09qDdXKTB3p+VE/87+xa1IbuPZVvu4ZAPta6UDYGC1OLwpZLxoZJqoAf1CDzVvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aLkufrf21sr24vi1qYvnsgcw3tzCrDJ6V4niJVEoPw=;
 b=hsBXPdDZ4Ka5Z6Y1KbqwRBH7tgt1Pv5wCn7P3dLRX+s9trR5Yw8vY1gXqmHOw1hQTrD1Uj7ognfMNI0VIY3OPa+zsBkf3Pxqx8os3qMfsWRWTHYH/Ahnm5G2IUE5hd6ycApXPQVFrHPxUlAuv/1K45N9o5Y3q+hfyUsy72IWvU/lz7eul7irMVNFnB/qMy0bhHGcaVm6NkaJ6r9yldihr3ivSI+v7us/UxpceoJ6SBu50l4Hg2kgtlQ2SPAq2DqDBahOr89nknT4+TLPx+z0BURKDDb5hi+8pzgBIeMU2lT9v/4BTMKHo/Uk6CquaM3WHxyzgNHRLVs2gWBHQDY+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aLkufrf21sr24vi1qYvnsgcw3tzCrDJ6V4niJVEoPw=;
 b=mxjBU1cqGJmmlcGv7BvLa7L1DmAtO1b3LhdBw7PO2y3h1lpIE946ix61PsYDPfbpsVnZmfeP1k5/q5EmOJ8JJWNkijw5FiVKo54aB9z6g1cCcdACiOVOwmG1aG6HPbgAHkkR4Bt5C28SSN/L1FwAl1F6zllwv5ZUvVPdFtciAhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <312395a4-2eda-e9ad-43c5-eddbad826935@amd.com>
Date: Thu, 9 Feb 2023 23:06:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 09/16] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org, Luca.Fancellu@arm.com,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-3-vikram.garhwal@amd.com>
 <311dc97d-e924-e9ad-25d3-1135d4b24f7e@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <311dc97d-e924-e9ad-25d3-1135d4b24f7e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To MN2PR12MB4408.namprd12.prod.outlook.com
 (2603:10b6:208:26c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:EE_|IA0PR12MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: d302969e-7a53-4235-a077-08db0b355aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8jWckoFkxdm+YKEoTlGrHqsY7qf1dYNuIR61nbzY2+LO6tYufsTOKMLJpIKqkYRoEzGwjLV8XnwtHeyZZQTmb+uMlEXX1X6Rs3TLht5K3UmhHRSVPLNfl+YgwtLx1d6ONgfHO96hvxfr2JG9p+JmIK34E3tFi/l+sFZtqxHJeEoo4O3vX/6pYVxlLbWFVHDoYQJN7rVcIKYqrMVQ9L47gpv1Uz8dTTbteSLJotAyWb4+rYY9ekvKMnOxwAq+QaTOWDsxrDCGphQxzMjFwqTJnGaMQQDXYUPu8FMypU7OYTkYcbNVExLuIKC4jOMlxpVO8XifNY4L9Ii2HJeWH0CbNC4IjFneQ8fyM9FDO2abhrsB3g4/EORn6VvtdFFAmghB1dZwdipn/cg9Yv7j8A4Xo676dqnyxENWdR3fgoRKG4d+a278HNboHkS8lLr5aC5hADdYftPqbSxaDntgFffFuwx4Kj4tCReapCCVZvwPJ18Kh19FJwTHGQ5no50c8Zp0Tg2+AXxQSVaPmKiwe/mn/8JQXYHYwI06g4fEQuLgwEnTxKeON2zNwU+pTwHIWVeWc6D37SYKrIt2j7Kk1cOLoGnOOvh2YQtzCzihVZC8kWa06K2p3KgNd5GhspZLzB38lf9fO0UIAD0wBYhuC98FnDqdfwsZjbOfM+Bl/KWOzy5r/BW/u3XzCc9PYMDI5+fGZK8EnOTRn1W1xRXwh4Y6r9tdhXTSLGuVys0EHFegTBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(31686004)(8676002)(186003)(8936002)(66476007)(66556008)(66946007)(6506007)(6512007)(4326008)(26005)(36756003)(31696002)(86362001)(38100700002)(2616005)(53546011)(2906002)(6486002)(316002)(54906003)(41300700001)(6666004)(44832011)(5660300002)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWU3TXJBcVU5dm5qaHVvSXRmd282Z1VUSUQvOE1TWWx0bE85ajYyYVkrSzVT?=
 =?utf-8?B?NFdYTC90UDZqdjBKY1Fwamhvemp3c2RmZ05YU1d5dVpGNDJjZmhxekJHRmp5?=
 =?utf-8?B?aXdURk10aWladXhJcmZBcFlPVW9tVlpraFVvUm9iVXRpdi9qVU5KNjlCTXlk?=
 =?utf-8?B?dDFUU2d5em54dkJKSGhsdkdLMXMyTXFHczZ0Zm82K1Z2K0MvVVdMeUYySWdC?=
 =?utf-8?B?ZGRoc0wra2tOQThhaHNTMXZjeW9tT2NWR05MUkpuZXVFN24wMitpSzQ3NmVC?=
 =?utf-8?B?RG1xNVgrQ3lDQnh2OFNJRzcvUTZHSXJRb0RjZGk2V2hvd0JzSDZvK085Qlln?=
 =?utf-8?B?WE5hSEdUZDkyTDdLcklTdkhnQmlRZmNyUGhlMEhQTG1xc0hWY2JCYURtbGhC?=
 =?utf-8?B?UklObmNzT3paRWZOcExYN3ZiZHhNUUxKQjJUa1hQZlRTc0FpWjZjNWhhS3Fy?=
 =?utf-8?B?MHBBa1dRNFZiVzRuOUF3bFptMEwzTW9tTlVWaFltcGtLdStvZWM1SUprRE5t?=
 =?utf-8?B?aXJPWlBYMXQwemswaWZ1UlhKSmlZSE1PbEdTS3l3Kys4TjRNQVJvK3hzTjhM?=
 =?utf-8?B?SVJWMU5WNDJEZUxHa3FsUVNxeGNuMElrZGlpU0hXak44SkJiUUhNREZ0S2ky?=
 =?utf-8?B?dWl0QzI2VUc3L1RGV1VuVzB6OTMvUnNvNnlhaUsySHdaT2gzWG8rVDM0R3hh?=
 =?utf-8?B?TTVHUTJPQVpSb2dRTUFQcyt0S2ZLcmtWSi9nOFBnRWY1SzJ6eS8yZXZPQThj?=
 =?utf-8?B?dUxHWXRUeGhxcWZPeHZnTzBVaWRGQ0g2akpaUHhnSXpBQ2FUWkRCVnVvYVhJ?=
 =?utf-8?B?MDdpYmU1cmtNZ3l6YW1VRERRUDl6QXBSZnNXUEIyUHlCT1JmN3lDTGdXUGZy?=
 =?utf-8?B?bHNUL1Ntb3d6QlpnWmMvMlcwYy9hZnNwYWJya2pxTjdKV3g2SWxqQ2txUGtO?=
 =?utf-8?B?dlVvZjZFdXBHRzlCUnZJdUFHWHRWazRtR3FxcHNFdkduTngwT09HOVJBM0tU?=
 =?utf-8?B?UlZ4UWNISjMwKzN1dzNRNW1udEpRTmZmVVA1aEJHS3cvSGZUVmJFWlFzZGRM?=
 =?utf-8?B?cHB4MG95R0ZuNEdhM3VFb2gvb3dVWjhoazhsWXVlenI3UzA0QktSV09NQ3VZ?=
 =?utf-8?B?ZU5BK2x5eDNDMUN4bFZqaEdqODJTeURwbWUwZnpyZmYxbkNaeGNEc2NZbCto?=
 =?utf-8?B?TXN0eU1EWlhRR29RK3pTbkFpdlE0OVJkVVUyTUZuY3BFQm94UWk5WE1EZTdy?=
 =?utf-8?B?NGlqTkJiMmgyMVlqOFc2T1Nsc3N5K1FVemUydWRJd25PTSt1VTNoZnhjR0Zm?=
 =?utf-8?B?VEZyWWtweEpzWDJOelJsbnZEUmovbitYaXBoZFEzRnlWc1pyWGpSQnd3NlI5?=
 =?utf-8?B?d1ZNMkdqcU9ieDBISXFaRWp4K250UUdPaFRaWExsYnF6NmRNbFhHWVUzOE9N?=
 =?utf-8?B?K0JRN1AvRHNzdklNcmZpZkM5VFlBRTl4ZGwxT3NSSTZ1RytuZlJ1K2N0ZERa?=
 =?utf-8?B?b2FIOFhUdmd4NW90ZXZTRTd0RzJyVkdib3lMUzdzNG9KUFJQOXNxNFpieGJE?=
 =?utf-8?B?b1hvam03NzlGd0pyN3lYdURLNXJ5YlliNDZjd25hSVMzRm9yUTlNYW5TNjdt?=
 =?utf-8?B?SE9vRDJlMHVzK1hRdUQ2dC9pZEtXQ1dGZVRkVlFVeS82WVBqWXZOYStSTU1Z?=
 =?utf-8?B?WTlNUlhBOENycW9ZVnZXUmdjVXkzRjVRSWFKSWRjc01QQzkySGxTNytpQlg2?=
 =?utf-8?B?SGkyQm5WcHB6YktPM2FRallYcHM0K01GOWdFOUFUczJCOFQ5ZnQ2WmwyQm40?=
 =?utf-8?B?TFJiRm8wcnBhZ3pCTUUrcG1Lc2UrZnBXeG04di9qWU9PaUdodGQ2UWgxcyti?=
 =?utf-8?B?RTNWSXJoci9EcGFheS9LLy90RGFtSjdUQmZTRm4yVk1CcUpZcEk5RWJ5Vi9F?=
 =?utf-8?B?dlRpN2MwU3Q5Ykw3QWNKVldzTFVSMkRMUDBNK1ZJa2U4KzZHMW8vdnBRQTBn?=
 =?utf-8?B?Q1VSREcvV1hWRlNONzdFTGxzNDhNQjMzYllHUmxHOFdkak8wVm1WRVJ2aDRV?=
 =?utf-8?B?ZElRVlVBaXpQR284Z0F0U01tTms4K3RPVU5GbmRJeGRqemJwNkpacXI5dnJN?=
 =?utf-8?Q?mmSnT6TH/u1KF3tl3CquEOKaY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d302969e-7a53-4235-a077-08db0b355aae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 07:06:39.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPPRvpKQeSoP8XnJmA6HjAQuqFRmmYyJUNQtrwFTUpZJFeI2+TZvKUCQjAhlr+2suJXLu6UkVejoA3mTDMpsXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7775

Hi Michal,

On 1/23/23 2:00 AM, Michal Orzel wrote:
> Hi Vikram,
>
> On 07/12/2022 07:18, Vikram Garhwal wrote:
>>
>> Remove master device from the IOMMU.
> Adding some description on the purpose would be beneficial.
will do.
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
>>   xen/include/xen/iommu.h               |  2 ++
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
>> index 457df333a0..a8ba0b0d17 100644
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -126,6 +126,44 @@ int iommu_release_dt_devices(struct domain *d)
>>       return 0;
>>   }
>>
>> +int iommu_remove_dt_device(struct dt_device_node *np)
>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
>> +    struct device *dev = dt_to_dev(np);
>> +    int rc;
>> +
> Aren't we missing a check if iommu is enabled?
IIUC your question: There is only one caller which is in dynamic 
programming part handle_remove_irq_iommu(). The call only happen if the 
dt_node has iommu property.
>> +    if ( !ops )
>> +        return -EOPNOTSUPP;
> -EINVAL to match the return values returned by other functions?
>
>> +
>> +    spin_lock(&dtdevs_lock);
>> +
>> +    if ( iommu_dt_device_is_assigned_locked(np) ) {
> Incorrect coding style. The closing brace should be placed on the next line.
Fixed this for v5.
>
>> +        rc = -EBUSY;
>> +        goto fail;
>> +    }
>> +
>> +    /*
>> +     * The driver which supports generic IOMMU DT bindings must have
>> +     * these callback implemented.
>> +     */
>> +    if ( !ops->remove_device ) {
> Incorrect coding style. The closing brace should be placed on the next line.
Fixed this for v5.
>
>> +        rc = -EOPNOTSUPP;
> -EINVAL to match the return values returned by other functions?
>
>> +        goto fail;
>> +    }
>> +
>> +    /*
>> +     * Remove master device from the IOMMU if latter is present and available.
>> +     */
> No need for a multi-line comment style.
Fixed this for v5.
>
>> +    rc = ops->remove_device(0, dev);
>> +
>> +    if ( rc == 0 )
> !rc is preffered.
Fixed this for v5.
>
>> +        iommu_fwspec_free(dev);
>> +
>> +fail:
>> +    spin_unlock(&dtdevs_lock);
>> +    return rc;
>> +}
>> +
>>   int iommu_add_dt_device(struct dt_device_node *np)
>>   {
>>       const struct iommu_ops *ops = iommu_get_ops();
>> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
>> index 4f22fc1bed..1b36c0419d 100644
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -225,6 +225,8 @@ int iommu_release_dt_devices(struct domain *d);
>>    */
>>   int iommu_add_dt_device(struct dt_device_node *np);
>>
>> +int iommu_remove_dt_device(struct dt_device_node *np);
> These prototypes look to be placed in order. So your function should be
> placed before add function.
Fixed this for v5.
>
>> +
>>   int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>>
>> --
>> 2.17.1
>>
>>
> ~Michal

