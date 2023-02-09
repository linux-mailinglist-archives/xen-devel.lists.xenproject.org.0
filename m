Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89276911F9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 21:12:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492911.762680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQDGn-0005Uo-4i; Thu, 09 Feb 2023 20:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492911.762680; Thu, 09 Feb 2023 20:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQDGn-0005Th-1L; Thu, 09 Feb 2023 20:11:49 +0000
Received: by outflank-mailman (input) for mailman id 492911;
 Thu, 09 Feb 2023 20:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NWcm=6F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pQDGl-0005Tb-EE
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 20:11:47 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f888fd21-a8b5-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 21:11:44 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 20:11:40 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%8]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 20:11:40 +0000
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
X-Inumbo-ID: f888fd21-a8b5-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVJNTnU7QoMO6jp/TvQ5JkVjtT9iu/Fr66agRDuf87I89iO4BO1ROeh7Cx0L8uYTbkPCSI1J39Fqcjlm/T5fgg59h3GIV6+qXXRDLex9sa6bYwWstHWfgFm1WTHIub8f9UYKoFg0s0F9jo3td1LI79ka4QwlGKd1pd3FKhK1mRWSBYfdmGM2On2nNov+Kh06JxVTKisPko0Jgq9yGo5SdjC/EtY98FQRrQaMc/6TzxHgbQTyGiCHShHSY5ojlGeJ+O/cPEGYnrKgu/yg7+KOf4et5Qzz35OCUWTvZEU1/oam3ekTSE5t2TjC2v+nbOQIDnDYSD90/9wDyzMwuLEmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFGY06zPTNqnKGYkvDoBvSMwGEqziDiz8aErmM1+Bp0=;
 b=BOdDbXb5uTJy4XfACMclP6oGXkrhqDzz1NSXF/aTEZre4LM8IvFO+WfBFx48hzxnBtkJ5Vk+osNznKWL4DiRYjpQ9DOAvqZ8cOZ91bWSY0l3UfDZvjuF59QO0ufgiz0D6srP9krwVDBRl6/hvhChoPngIZN7+xUdjlE0Mkt1ARjtFCi/PEXmBjUTlxJcGUgaisDaPqddjjjIEFFCsNHpx9b/0EiS43vHb3xJOPgnU8C3kTRFJTARZzhQvkdtA0kvEpoGu5sDLb84w/JD0L7QBADvnrFwCmB4/L7LcpMtEFowQi+dotFWMO/HYL/os9FySD3DYp9q2HX51MYl9w3d0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFGY06zPTNqnKGYkvDoBvSMwGEqziDiz8aErmM1+Bp0=;
 b=qtj4raWz/c8nGgjlMDCQb1WeUHH9ocUAmUaNmM7NhXcb0dov3mLE6ryOeNngo8c2A4opARoVeB2hgVpgKyzOTiQ8eM+aFw1yvcD62LROBKOeoMb+in+SR8o1e+KW7WJVaWrRjNq34VDVPFri4EpGTCAttvHqnvbPhANZPl6AYqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7a1d10b9-083c-a8f5-0315-c9f77ad04239@amd.com>
Date: Thu, 9 Feb 2023 12:11:36 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 01/16] xen/arm/device: Remove __init from
 function type
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-2-vikram.garhwal@amd.com>
 <1be7ea27-aec5-e2ae-48c1-fe0c1f099181@amd.com>
Content-Language: en-US
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <1be7ea27-aec5-e2ae-48c1-fe0c1f099181@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SN7PR12MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d409a9a-5968-4572-21cc-08db0ad9dabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	99Rkf32ZGFmKDDEPnpkv5b4h1vL58WPuvfD4PFnNI5y8HPn31kDSRro+5xAPJYP2AxtDVct5iZCsbf/xCQzz9XuMDXTVoOcAnE2sTP31JlALew368iQkdEcxT9OeVLxzwpOyGwLhnLZy9d0gdZNFe7Iplks9K9yYi6lckwui7Fv+D+Hmoij/eWvoFz2IG7Ensq7n1xdSbCOqDSNNAzdd7PZaB0GGwCzmgrQVWe03gOK8sVHMeF+mSqLLdX3YWgK2E7GrB40Ld8y7vhuj1z4mNI9tfuh/TJaufcEJEOZ0YIXkirXic6gEF0nxHrV6ct8GKsnNhcHoY9VDGdNe0hrCu05NY4J7aEmxbfz44/yDBQsAfcOaletMu4X5E3UbZWeoxrisJhCOU0kUlNX+UvU6dZx+DSMsaqbCUn2MT2Ljvx5HMrwU2KFEnNmEN5gn3y5rStJowlgF7S0qNlxaq4NdoUzDB9at8lqvHohOqc+RXYnbFmareixidhVQai29XKQAVetQ1ne+GwQxm/zvWd8Dtjmsg2Nq4NQmNk67L7nD7zY5OGpTQEeB/QFq3X7JVvW7efjYAdCkXaOjThS6P3xkOI7OcF/u29BGiek4rqIfMCuyGczR4MbVlOsbORaLBEkkuh82JMo+Ie6LkwLAHCKekzmfkCGkudu7tclCh7fRDlyhXATHGadeAUYfuGoT2nDF/8LHnh7J7XhvLGeZNPR5rq/ZNlEAAdoxBQV1IwWMeRI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199018)(6506007)(53546011)(478600001)(186003)(6486002)(26005)(6512007)(31686004)(2616005)(6666004)(8676002)(54906003)(316002)(83380400001)(66946007)(66556008)(66476007)(38100700002)(4326008)(2906002)(36756003)(8936002)(30864003)(44832011)(86362001)(31696002)(41300700001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3U0Wm50ek9YaGU4WTRQWjJiV2Y4ek8xUEc1SGVrZVV4THYyWlZhSktzUWVh?=
 =?utf-8?B?T1FnckhtTFJjNklXU0pOWEgvUlRlSnZsNXZ4alRwTXFpaWdCM2x6Z3oxOVNR?=
 =?utf-8?B?b0NTZndzUHc4RTdMdGJEMjcxdkJqZjVac2gvUGJuUk9UK295VDBueUR3RWdY?=
 =?utf-8?B?VUI5RkR4L2k4QTgyNkhQMktnelI3L1dzM2JHcEhJSWFlSFo1RDVtYXlBamtt?=
 =?utf-8?B?TEEwRmsya1l0bjJjMW9ERXVEL1VPYm01UVAwUDlWTnFWNXdCTERkVEpZSGlY?=
 =?utf-8?B?NGxZcTNrcTMxL1NCcjhjZ1U0Qlc0TXo5V3pCMUVPZ05RRFA0YWphRmJYSWxx?=
 =?utf-8?B?eVFCeS9HMVFPaXNpazRHRGJBdlNwK3Fxbnh3MUFXNHoxT0NSdDFTRFR5RjI3?=
 =?utf-8?B?ZVRPbHA4Z3VwdG1NamRRREluYWRybDJNVzQ5a0FrdkkxL0ZjNVBhUU5jWDRZ?=
 =?utf-8?B?RWR6YW9GTDRGVUJaY2ZZL1NPOHh4dVN3OVJibUkydkNlRHZPRFk4elhqcVVD?=
 =?utf-8?B?YUNCV2lTZENKOGkyaFFrZGh1ZUFhc1pmOUpaL0hjT05OaFN1YTBHWHFiM1B3?=
 =?utf-8?B?ZjM2TXJkc1V2NEFzTlF4NTM0S1hjYk42Y2tlWXJtRjNlUUd0ZlJReWwvM09q?=
 =?utf-8?B?a0F3aGtjNFJFSklLZDc3TGxvTmxNNXRQcTNWeTVYa05JQ3VJSmlIdUdKZ3Zz?=
 =?utf-8?B?bHFSbGwzWFZ2cWlNcUs5SlZpbTM3UXhXcTA3VFFjRUlPQzlUOUdlVkdrNXNy?=
 =?utf-8?B?N1VBV2szd3ovL3hSSGcrY0RRK3lzOXZHU052MWJMOXF6ZWRIMk91Sm82QnUy?=
 =?utf-8?B?NVUyUzZJMEFvblAvZEMwcEZaclF0czA3ei9XeWtzMWRIV1RYS1pwUlpsamNT?=
 =?utf-8?B?ZHZVRWRIU3dWQ21BaFJCZXNJSHEyVnBPSy96c3BqMWZzKzliY00zdnA0R1Nh?=
 =?utf-8?B?aWZRVkF3TEY0dnovNkRZUWZRTXpnc0Q0Q01uZVFXeVJjT2x3SFVwSzhieDR4?=
 =?utf-8?B?Y3M5MlRXc3dFNTdJeFhTeE9Ib2N5M3BSK3FpNEhZblFNSUd1SzVsQXQ3SWZo?=
 =?utf-8?B?SjZCUmI2MzBRQlg0b2FIdnJRUzdEemFJS0tmaGRGOTI5YndNaVhpZ2NscEFs?=
 =?utf-8?B?TlRvZUtnMEFySzFEcTVvclZOREVGUWZrMzlTc3oyUVNaVENzWURiY2FWUkw1?=
 =?utf-8?B?U0RiN1JXalB6bUo2L1VLWmtpaVVMMERoTTV6bGZzQmhqVExicEZBcE1rNHpE?=
 =?utf-8?B?d3BwNDl2ZGl1QXNqSTVHMjhMYkJYTXdDUUh0bEE1V1gyWUZCdWptYlJ1aGpj?=
 =?utf-8?B?N0tmSU5TKy81RHM2dno2aThJQitGWGtna3hPV3BabDEwTndNVkZvOE02aU1t?=
 =?utf-8?B?c2k4b3U2cU1tR2ZPZ2k3bmxwZHNraVcxZFVzcnRJL0VMTVZHWHh4azgxcGs4?=
 =?utf-8?B?bmk3dzV6Zm5ldysrd3JVc1V2cUprKytnWEhxN2F6dXZyYmU0R2FwenlRNVc2?=
 =?utf-8?B?K3RBT1ZPQVdCWVdWdXM3VmNRNndRMWd0U0FBcXd6ODRWcG9HcElxdWNLSmo1?=
 =?utf-8?B?TVNEbk5HbDc0QStwVGRNZTRQT00rTldTOGhvd2hpL3FHeWljai9zMGhCbSt0?=
 =?utf-8?B?M2lCVlJwYm9DUXBweU51R0ErU0lKQ010K3RwOHRKMFVsTHh3NXdsWWtEYmk3?=
 =?utf-8?B?S3o5SXZ2RXloUENWcFFLNU1pN1ltOG5rZjA1a01uLy9xaVFmQjJWVGE4blVo?=
 =?utf-8?B?bXAzMndxZjBlZ21nbnpKRXJObU43STlNalBjTzlRNmczQWpUQ1B1dk9GZ0hT?=
 =?utf-8?B?NjdHenNodTdxclQrdVM3OGRka0dDbmNEUlVISzlqWFRVNnhOc2I4cmpkaXM1?=
 =?utf-8?B?aHdHblcrUEhEZDN0T3R5b01JUi9CK2xTbEtTc3M3MUM3VncxbC80aWVBQ210?=
 =?utf-8?B?ajEvSXVuTUoxRmlIMDNKOWF2am9UMVRYeG5ucmhNUkFDdDhPY3JFWFA0c2hK?=
 =?utf-8?B?bGdaVXBnTmhnZ1N4Z0IwOGFBRlV5ZUIrYUJkM3VPakx0ak5qdEt2YmhQYU4r?=
 =?utf-8?B?TW9kSUpBdVJucGZISlNhaS85U1BHbFpieDYwRHNVQjhHWUJtRjJIcWFwWkdF?=
 =?utf-8?Q?H25PPeZyGx4dzoH6oedtBQy3g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d409a9a-5968-4572-21cc-08db0ad9dabf
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 20:11:39.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1UNeH/jlBVYxWJMa6tpJMVk9b5suAGBCR5H30b/Ur9IDzqdAD0Hgr9nYbIPfZ+SLFfQ65L7o9qbQHbfz3DAJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980

Hi Michal,

Thanks for reviewing this. Please see my comments below.

On 1/20/23 4:39 AM, Michal Orzel wrote:
> Hi Vikram,
>
> On 07/12/2022 07:15, Vikram Garhwal wrote:
>>
>> Change function type of following function to access during runtime:
>>      1. map_irq_to_domain()
>>      2. handle_device_interrupt()
>>      3. map_range_to_domain()
>>      4. unflatten_dt_node()
>>      5. unflatten_device_tree()
> If you do not want to do this at first use, then this should be a separate patch.
>> Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_domain() to
>> device.c.
> This should be a separate patch (without removing __init) to make the comparison easier.
Okay
>
>> unflatten_device_tree(): Add handling of memory allocation failure.
> Apart from that you also renamed __unflatten_device_tree to unflatten_device_tree
> and you did not mention it.
I will add this in commit.
>
>> These changes are done to support the dynamic programming of a nodes where an
>> overlay node will be added to fdt and unflattened node will be added to dt_host.
>> Furthermore, IRQ and mmio mapping will be done for the added node.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/arch/arm/device.c            | 145 +++++++++++++++++++++++++++++++
>>   xen/arch/arm/domain_build.c      | 142 ------------------------------
>>   xen/arch/arm/include/asm/setup.h |   3 +
>>   xen/common/device_tree.c         |  27 +++---
>>   xen/include/xen/device_tree.h    |   5 ++
>>   5 files changed, 170 insertions(+), 152 deletions(-)
>>
>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>> index 70cd6c1a19..d299c04e62 100644
>> --- a/xen/arch/arm/device.c
>> +++ b/xen/arch/arm/device.c
>> @@ -21,6 +21,9 @@
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>> +#include <xen/iocap.h>
>> +#include <asm/domain_build.h>
>> +#include <asm/setup.h>
>>
>>   extern const struct device_desc _sdevice[], _edevice[];
>>   extern const struct acpi_device_desc _asdevice[], _aedevice[];
>> @@ -84,6 +87,148 @@ enum device_class device_get_class(const struct dt_device_node *dev)
>>       return DEVICE_UNKNOWN;
>>   }
>>
>> +int map_irq_to_domain(struct domain *d, unsigned int irq,
>> +                      bool need_mapping, const char *devname)
>> +{
>> +    int res;
>> +
>> +    res = irq_permit_access(d, irq);
>> +    if ( res )
>> +    {
>> +        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
>> +               d->domain_id, irq);
>> +        return res;
>> +    }
>> +
>> +    if ( need_mapping )
>> +    {
>> +        /*
>> +         * Checking the return of vgic_reserve_virq is not
>> +         * necessary. It should not fail except when we try to map
>> +         * the IRQ twice. This can legitimately happen if the IRQ is shared
>> +         */
>> +        vgic_reserve_virq(d, irq);
>> +
>> +        res = route_irq_to_guest(d, irq, irq, devname);
>> +        if ( res < 0 )
>> +        {
>> +            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
>> +                   irq, d->domain_id);
>> +            return res;
>> +        }
>> +    }
>> +
>> +    dt_dprintk("  - IRQ: %u\n", irq);
>> +    return 0;
>> +}
>> +
>> +int map_range_to_domain(const struct dt_device_node *dev,
>> +                        u64 addr, u64 len, void *data)
>> +{
>> +    struct map_range_data *mr_data = data;
>> +    struct domain *d = mr_data->d;
>> +    int res;
>> +
>> +    /*
>> +     * reserved-memory regions are RAM carved out for a special purpose.
>> +     * They are not MMIO and therefore a domain should not be able to
>> +     * manage them via the IOMEM interface.
>> +     */
>> +    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
>> +                     strlen("/reserved-memory/")) != 0 )
>> +    {
>> +        res = iomem_permit_access(d, paddr_to_pfn(addr),
>> +                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
>> +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
>> +                   d->domain_id,
>> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
>> +            return res;
>> +        }
>> +    }
>> +
>> +    if ( !mr_data->skip_mapping )
>> +    {
>> +        res = map_regions_p2mt(d,
>> +                               gaddr_to_gfn(addr),
>> +                               PFN_UP(len),
>> +                               maddr_to_mfn(addr),
>> +                               mr_data->p2mt);
>> +
>> +        if ( res < 0 )
>> +        {
>> +            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
>> +                   " - 0x%"PRIx64" in domain %d\n",
>> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
>> +                   d->domain_id);
>> +            return res;
>> +        }
>> +    }
>> +
>> +    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
>> +               addr, addr + len, mr_data->p2mt);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * handle_device_interrupts retrieves the interrupts configuration from
>> + * a device tree node and maps those interrupts to the target domain.
>> + *
>> + * Returns:
>> + *   < 0 error
>> + *   0   success
>> + */
>> +int handle_device_interrupts(struct domain *d,
>> +                             struct dt_device_node *dev,
>> +                             bool need_mapping)
>> +{
>> +    unsigned int i, nirq;
>> +    int res;
>> +    struct dt_raw_irq rirq;
>> +
>> +    nirq = dt_number_of_irq(dev);
>> +
>> +    /* Give permission and map IRQs */
>> +    for ( i = 0; i < nirq; i++ )
>> +    {
>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>> +                   i, dt_node_full_name(dev));
>> +            return res;
>> +        }
>> +
>> +        /*
>> +         * Don't map IRQ that have no physical meaning
>> +         * ie: IRQ whose controller is not the GIC
>> +         */
>> +        if ( rirq.controller != dt_interrupt_controller )
>> +        {
>> +            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
>> +                       i, dt_node_full_name(rirq.controller));
>> +            continue;
>> +        }
>> +
>> +        res = platform_get_irq(dev, i);
>> +        if ( res < 0 )
>> +        {
>> +            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
>> +                   i, dt_node_full_name(dev));
>> +            return res;
>> +        }
>> +
>> +        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
>> +        if ( res )
>> +            return res;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 4fb5c20b13..acde8e714e 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2229,41 +2229,6 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>>       return res;
>>   }
>>
>> -int __init map_irq_to_domain(struct domain *d, unsigned int irq,
>> -                             bool need_mapping, const char *devname)
>> -{
>> -    int res;
>> -
>> -    res = irq_permit_access(d, irq);
>> -    if ( res )
>> -    {
>> -        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
>> -               d->domain_id, irq);
>> -        return res;
>> -    }
>> -
>> -    if ( need_mapping )
>> -    {
>> -        /*
>> -         * Checking the return of vgic_reserve_virq is not
>> -         * necessary. It should not fail except when we try to map
>> -         * the IRQ twice. This can legitimately happen if the IRQ is shared
>> -         */
>> -        vgic_reserve_virq(d, irq);
>> -
>> -        res = route_irq_to_guest(d, irq, irq, devname);
>> -        if ( res < 0 )
>> -        {
>> -            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
>> -                   irq, d->domain_id);
>> -            return res;
>> -        }
>> -    }
>> -
>> -    dt_dprintk("  - IRQ: %u\n", irq);
>> -    return 0;
>> -}
> If you move map_irq_to_domain from domain_build.c to device.c, then the prototype needs to also
> be moved from domain_build.h to setup.h
>
>> -
>>   static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>>                                          const struct dt_irq *dt_irq,
>>                                          void *data)
>> @@ -2295,57 +2260,6 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>>       return 0;
>>   }
>>
>> -int __init map_range_to_domain(const struct dt_device_node *dev,
>> -                               u64 addr, u64 len, void *data)
>> -{
>> -    struct map_range_data *mr_data = data;
>> -    struct domain *d = mr_data->d;
>> -    int res;
>> -
>> -    /*
>> -     * reserved-memory regions are RAM carved out for a special purpose.
>> -     * They are not MMIO and therefore a domain should not be able to
>> -     * manage them via the IOMEM interface.
>> -     */
>> -    if ( strncasecmp(dt_node_full_name(dev), "/reserved-memory/",
>> -                     strlen("/reserved-memory/")) != 0 )
>> -    {
>> -        res = iomem_permit_access(d, paddr_to_pfn(addr),
>> -                paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>> -        if ( res )
>> -        {
>> -            printk(XENLOG_ERR "Unable to permit to dom%d access to"
>> -                    " 0x%"PRIx64" - 0x%"PRIx64"\n",
>> -                    d->domain_id,
>> -                    addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1);
>> -            return res;
>> -        }
>> -    }
>> -
>> -    if ( !mr_data->skip_mapping )
>> -    {
>> -        res = map_regions_p2mt(d,
>> -                               gaddr_to_gfn(addr),
>> -                               PFN_UP(len),
>> -                               maddr_to_mfn(addr),
>> -                               mr_data->p2mt);
>> -
>> -        if ( res < 0 )
>> -        {
>> -            printk(XENLOG_ERR "Unable to map 0x%"PRIx64
>> -                   " - 0x%"PRIx64" in domain %d\n",
>> -                   addr & PAGE_MASK, PAGE_ALIGN(addr + len) - 1,
>> -                   d->domain_id);
>> -            return res;
>> -        }
>> -    }
>> -
>> -    dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
>> -               addr, addr + len, mr_data->p2mt);
>> -
>> -    return 0;
>> -}
>> -
>>   /*
>>    * For a node which describes a discoverable bus (such as a PCI bus)
>>    * then we may need to perform additional mappings in order to make
>> @@ -2373,62 +2287,6 @@ static int __init map_device_children(const struct dt_device_node *dev,
>>       return 0;
>>   }
>>
>> -/*
>> - * handle_device_interrupts retrieves the interrupts configuration from
>> - * a device tree node and maps those interrupts to the target domain.
>> - *
>> - * Returns:
>> - *   < 0 error
>> - *   0   success
>> - */
>> -static int __init handle_device_interrupts(struct domain *d,
>> -                                           struct dt_device_node *dev,
>> -                                           bool need_mapping)
>> -{
>> -    unsigned int i, nirq;
>> -    int res;
>> -    struct dt_raw_irq rirq;
>> -
>> -    nirq = dt_number_of_irq(dev);
>> -
>> -    /* Give permission and map IRQs */
>> -    for ( i = 0; i < nirq; i++ )
>> -    {
>> -        res = dt_device_get_raw_irq(dev, i, &rirq);
>> -        if ( res )
>> -        {
>> -            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>> -                   i, dt_node_full_name(dev));
>> -            return res;
>> -        }
>> -
>> -        /*
>> -         * Don't map IRQ that have no physical meaning
>> -         * ie: IRQ whose controller is not the GIC
>> -         */
>> -        if ( rirq.controller != dt_interrupt_controller )
>> -        {
>> -            dt_dprintk("irq %u not connected to primary controller. Connected to %s\n",
>> -                      i, dt_node_full_name(rirq.controller));
>> -            continue;
>> -        }
>> -
>> -        res = platform_get_irq(dev, i);
>> -        if ( res < 0 )
>> -        {
>> -            printk(XENLOG_ERR "Unable to get irq %u for %s\n",
>> -                   i, dt_node_full_name(dev));
>> -            return res;
>> -        }
>> -
>> -        res = map_irq_to_domain(d, res, need_mapping, dt_node_name(dev));
>> -        if ( res )
>> -            return res;
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>>   /*
>>    * For a given device node:
>>    *  - Give permission to the guest to manage IRQ and MMIO range
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index fdbf68aadc..ec050848aa 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -163,6 +163,9 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
>>   u32 device_tree_get_u32(const void *fdt, int node,
>>                           const char *prop_name, u32 dflt);
>>
>> +int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
>> +                             bool need_mapping);
>> +
>>   int map_range_to_domain(const struct dt_device_node *dev,
>>                           u64 addr, u64 len, void *data);
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 6c9712ab7b..6518eff9b0 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -1811,12 +1811,12 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>>    * @allnextpp: pointer to ->allnext from last allocated device_node
>>    * @fpsize: Size of the node path up at the current depth.
>>    */
>> -static unsigned long __init unflatten_dt_node(const void *fdt,
>> -                                              unsigned long mem,
>> -                                              unsigned long *p,
>> -                                              struct dt_device_node *dad,
>> -                                              struct dt_device_node ***allnextpp,
>> -                                              unsigned long fpsize)
>> +static unsigned long unflatten_dt_node(const void *fdt,
>> +                                       unsigned long mem,
>> +                                       unsigned long *p,
>> +                                       struct dt_device_node *dad,
>> +                                       struct dt_device_node ***allnextpp,
>> +                                       unsigned long fpsize)
>>   {
>>       struct dt_device_node *np;
>>       struct dt_property *pp, **prev_pp = NULL;
>> @@ -2047,7 +2047,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>>   }
>>
>>   /**
>> - * __unflatten_device_tree - create tree of device_nodes from flat blob
>> + * unflatten_device_tree - create tree of device_nodes from flat blob
>>    *
>>    * unflattens a device-tree, creating the
>>    * tree of struct device_node. It also fills the "name" and "type"
>> @@ -2056,8 +2056,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
>>    * @fdt: The fdt to expand
>>    * @mynodes: The device_node tree created by the call
>>    */
>> -static void __init __unflatten_device_tree(const void *fdt,
>> -                                           struct dt_device_node **mynodes)
>> +int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
>>   {
>>       unsigned long start, mem, size;
>>       struct dt_device_node **allnextp = mynodes;
>> @@ -2079,6 +2078,12 @@ static void __init __unflatten_device_tree(const void *fdt,
>>       /* Allocate memory for the expanded device tree */
>>       mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
>>
>> +    if ( mem == 0 )
> NIT: !mem would be preffered.
>
>> +    {
>> +        printk(XENLOG_ERR "Cannot allocate memory for unflatten device tree\n");
>> +        return -ENOMEM;
> What is the point of modifying the function to return a value if ...
>> +    }
>> +
>>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
>>
>>       dt_dprintk("  unflattening %lx...\n", mem);
>> @@ -2095,6 +2100,8 @@ static void __init __unflatten_device_tree(const void *fdt,
>>       *allnextp = NULL;
>>
>>       dt_dprintk(" <- unflatten_device_tree()\n");
>> +
>> +    return 0;
>>   }
>>
>>   static void dt_alias_add(struct dt_alias_prop *ap,
>> @@ -2179,7 +2186,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
>>
>>   void __init dt_unflatten_host_device_tree(void)
>>   {
>> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
>> +    unflatten_device_tree(device_tree_flattened, &dt_host);
> ... you do not check it anyway?
So, here we kept it same but unflatten_device_tree() return is checked 
in dt_overlay.c. Return of this function will be useful in dt_overlay as 
we can run out of mem during runtime. Perhaps I will add another comment 
about the reasoning for adding this.
>
>>       dt_alias_scan();
>>   }
>>
>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>> index a28937d12a..bde46d7120 100644
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -181,6 +181,11 @@ int device_tree_for_each_node(const void *fdt, int node,
>>    */
>>   void dt_unflatten_host_device_tree(void);
>>
>> +/**
>> + * unflatten any device tree.
>> + */
>> +int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
>> +
>>   /**
>>    * IRQ translation callback
>>    * TODO: For the moment we assume that we only have ONE
>> --
>> 2.17.1
>>
>>
> ~Michal
>

