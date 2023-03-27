Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24056CA2C2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515243.797927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pglJG-0004j6-Do; Mon, 27 Mar 2023 11:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515243.797927; Mon, 27 Mar 2023 11:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pglJG-0004fm-AJ; Mon, 27 Mar 2023 11:46:46 +0000
Received: by outflank-mailman (input) for mailman id 515243;
 Mon, 27 Mar 2023 11:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToIK=7T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pglJE-0004fg-65
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 11:46:44 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 093837f3-cc95-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 13:46:41 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 11:46:34 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 11:46:34 +0000
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
X-Inumbo-ID: 093837f3-cc95-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYrcc4KMUllAcELn+/QD7zljPAHrPzbVhujWyu1ItESOhVzF3nslX7xUtZ6xkcwWedKda+Na4UWN5o/Krp+GMxN7KP6RynJycWL2R0chJCPIjhDbOEazLJ9+/h3KS29REVc/Vt6DvDR3o7LbcGyCu0rHrcDj2KWq+4uX1rLdfhjAFAGaRoGNhkh+wPvuCRoEskhY9bC2ngFl1u30tE5tlBxF3aBbLD6hYRvfPGJxD/6RAswK3U2ALHPirYErquaiGO2R390hibRbqIje8jXhNuw5OwThWA4ijP98EG+HwByCyxHYxzZLeP3quZRR2uZqdrqka85YilbFg4m8ORwD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyfU/V06uu5wIww2j4lvMTkkIzdb0uCI5shBZTLP7CI=;
 b=e538YS/BUjCrBi8ohhJikaBMOSr42rzy2ezk4Mfoxh5H3/ZgZrXZgmv+Z2sntv+hq/EJIvw3e8ajZ8kLID7pNzRI1cKC5f9B4k8YvTnIPmK57jc98SqKZuPILoVN0wbmJ05Sf5xAFLdJYyV8vbGPhK2Ag/HQzpFuj1zOkum2HuqsRTaoX3RD6qb3tTjDNspyuGmyhyJB8iQ1IuNMe1aSk1Bxnp9/oFh9KFZQ0astZzsfpL3/tYzA6VYXDOb/sC7ouDchMAs72K22omGF47hOy0JBNXnVewlM9s8EUSxB7X83XTm/0QvPfXhNlXw/BIEuNSr6jWyWKZzEVBS1SR3pFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyfU/V06uu5wIww2j4lvMTkkIzdb0uCI5shBZTLP7CI=;
 b=xO1Ykg2c9jH7VGB9xxraUtlAao4OPblSP9Nq/xyct5YTrZfiEwrW0sDv8i3gj+RelP8Cql/Uw1Zde4g41XbN3exGNFIu25SHGwdjq7Z1kD09o9gTB68XsMyhDCf2qvRQm8zOF810ffRbZQWYmaib4KG22++KBO94Esp2FwqSHhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f8146b63-5dc5-beec-613d-d842cd225aea@amd.com>
Date: Mon, 27 Mar 2023 12:46:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-8-ayan.kumar.halder@amd.com>
 <7d90ad7a-5daf-915c-2055-a27ca50d8581@suse.com>
 <e268e11b-8e93-c506-668b-c5c004b3aa06@amd.com>
 <1883c9a3-ad25-ac45-b1fa-d29e19b3cc14@suse.com>
 <01a800a5-1c0d-b9d4-05c7-c886b3e3009d@amd.com>
 <205658ff-e0ac-1656-2d12-099abd891fcd@suse.com>
 <ac320354-454f-f6e6-d2b6-a470b66c7ec7@xen.org>
 <d9f3ef97-1101-ac4b-57b9-be0fa19a7310@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d9f3ef97-1101-ac4b-57b9-be0fa19a7310@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0421.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::12) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: f43321f3-8e43-44bf-bdf5-08db2eb8ea78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/9+WFYLVeuhXKHSJI+PH1smJBYH1ay8v1PdDg0mpIdYI/s6Dn6Flklfvx1LMoaufE8txxEyOKF9lTlirbJsbKiPfvfVE1BGpTTvswzIcUX7JWix6zBCily02ZU+cDHgZWsFZGhi/kGtsrPPD/8WiMdUJT+QHaod34QN8soQrQ1FlruHHOAHDvb39hFULQOKrVHUXM9G4a7LqwutOnq7kcH49hayCY9iEWb+us5GDOxoEe+V5Iqu0fPArIombdA1Az4DbiiR6DN18H/SJxVgc/nJemLL+bQN+u31DqyWIC92cqcVqytWZ7KWYsSW2l6JA6IcWAc14lHkS+5YJ4ItRgmz2pb0CeLrmqTqFuk05k/z2Y2EM7ThIAT3astVwQhUB17F6zKHo56QwE82p5x3jtH0T4vJ1/zvme55PNpIhCsTy/ypTcJB46g9fCtrVt4XI6psresZr5LUFC+aAggL886o1cDhWq+rSO+SJfDpZ+nQ097Sg63LlhVmUsLbG56kzUvcqXGhsS0f6ofXJ+JcQ/v/c6MTlJfZYX4c6BBHjfyNVbu8Hq1JtHUvQDif4Q94q43hnefwSVaPbZcACk2uRpD/TcFl37ukE4Ijy/NSesiqRSovUAczGstumIpNYdnAY4ue16nSC8KsI8G4AEdw+vqNxx9AeiBQUMiIouQe4fA7cI/W/lIfDKSawboXpWfe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(110136005)(316002)(478600001)(8936002)(5660300002)(36756003)(31696002)(38100700002)(7416002)(2906002)(4326008)(8676002)(66556008)(66476007)(66946007)(41300700001)(6666004)(186003)(6512007)(6506007)(26005)(53546011)(2616005)(83380400001)(31686004)(6486002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlNscUg0Z0h3QmNUUm14TkVPbWVOYS9CRURyYlRaRlN2dVJoeHNRZ2wrajk1?=
 =?utf-8?B?YzBjRVJENytlUkpLSUZaalZOM3hLdVBoMk5Oa0c3MGlDT1dwVzVZSUtzMVgv?=
 =?utf-8?B?dU1Sbm1tTG8zdGkzYmhadUJtK1lReGpvVmFrNlMxcml5N3JxSUpEa0QzTkRY?=
 =?utf-8?B?enZVdXBQNHcxcXJQZTl4KzUvL1JObTFzMmV6QUl6VkI5bmNLbEdHanB1SEUz?=
 =?utf-8?B?eHVKLzFmaldJaGFWVHZYSzlRM2hsTHFCK21jMlNSQjFYMnQwbUJvZzhCQzMy?=
 =?utf-8?B?WEJEb2JOa0RFVmhhd2ZwdXpGWXBXWmRaZU5CamRTMXJsakQ0OW1HQWZUNnFh?=
 =?utf-8?B?NndySVd0SEdFQzYzaFdRT1FNWkd1RG93cW9YYjUyOEh6VU1UUTlocHcwd29F?=
 =?utf-8?B?VlJ4bFBHYS9tTE05VndBb1ppRER4U2pFUmQ3ck1YdnBIOG15MWxhOHk5TVR1?=
 =?utf-8?B?VmJrUXcrYWhRZXZxYlo0YkxranduME83T1hkczdDY0pZRzdhZU9NZ2NMdXFC?=
 =?utf-8?B?Wng4T0tiK0gvZ0doa0ZBMmU4QjRTMTUvUGZxSFdxbEI2MVRTRnZyQlBKd0pZ?=
 =?utf-8?B?akFrQ0hyWmRVeGdKQlRRZTNUN3BIeDlka09mUWVpNVJ5c1VQTStWWmVwTldk?=
 =?utf-8?B?Z2VIQVh4UFpxVzRKZElvZzJGTWhYQ29udE5qclpLNzVhOG5vQnM1QUpvbkpW?=
 =?utf-8?B?d1h0MEdVakkweTNtOVFHZU5BVEV1Y29hT2ZOdzVDMVdVTWlsTVpxU3pIOHhm?=
 =?utf-8?B?UllpVFp3L1ZCMmdZdmlLUDNXaGx1cktYRHNDY0ZyaDQ3Y0NWYWJ4NDV6eXlJ?=
 =?utf-8?B?aE0xNHphQjJ6NnBORjFreWgzUnk4dzRVaTZhN2QvOEJBaWZMWERPS1UzRWVw?=
 =?utf-8?B?RUdKRjVKZldqaXpnc1JVU3ZnUzdDU0ZteE1EWTFQeHBqcU4wUWFqL3hXZ09j?=
 =?utf-8?B?YVl6OVVHdFJsNTdtcG96dE56bzV0OFFrb01pMmw1K05teFM3STUwcnFUZUpX?=
 =?utf-8?B?WkkxYzRmcWNyQTR2Sis2bkJwWXBuZzgrV08zUVFyaTE5QjZ5R00wQ05TOWto?=
 =?utf-8?B?VGJDYm4zODFLR1g4NUE5MXBlR1FKMXN2QjNKcDJaNSszaHZzMXhjUXFKVjAz?=
 =?utf-8?B?VkVnY2JZOEw3ZUo0LzUrQml2YnVGZDI3MVFRVE5GMEh6Z1NXZFE0ZkJSbEFF?=
 =?utf-8?B?ZVpnYzN4S1VweHIzVVpQVEFHNVBtZWlKcVdVdDdIUmgxZ2FnV1dVWmszUkZm?=
 =?utf-8?B?bE9BY1U2MHY1T1JxZnUyaWpoeHZnajFhdUNBV2NPbWMwcU9UcllvOVdLSGM1?=
 =?utf-8?B?MjVjd1lIQksxQjg5L1FZRkxSZWdKelZsUHhYaEZYZVp0U1lVL04vY2VnWDV4?=
 =?utf-8?B?MnNtWmxuNlNMRE9WWmJWNU9XMjRIQVNtSng5cTQ4MVE0ZjFKTjNMYng1UE4v?=
 =?utf-8?B?NEpVZ3EwZWZodnR5M1lOUGhSSWEzbWlKdUN5RlVIYUsyY3RmQVBwMjJDMElv?=
 =?utf-8?B?Q2dZZnB6WUpLNGpDZXVVTVYzQzZJNUFpMUg2dVh4bjM4eDVPaVExV1pMemRq?=
 =?utf-8?B?ZHlKK2hMclljem0wdm8zazB4dTVtTEg4Q29WT09BOWYzNTJPYWw4UzVkUzBo?=
 =?utf-8?B?YTBibkN2SUJTbExvTkFHY0ZXajZJTmExdVIrN2pEVmVsT2NWQWFtWStuZXlR?=
 =?utf-8?B?MXAwaEhtdHlqa1BhalRrU0M3MU53OWcrcVFyTExWZFgwTWhybmpkdWdMMW5Y?=
 =?utf-8?B?eG5pSXQyT2hEbFRKQmI5ckhVTkpoeWluSUFMWVFCTUp6UURZelF2QS9UTTZx?=
 =?utf-8?B?SGRLa1BIMUJnTVhLYUhLank2MzRmQnFzT2ZZdkhzNlpmRWdPZVZ3eGRIbldO?=
 =?utf-8?B?V3NreW1qeTcrbzhRcDd5djBVaVArVG1uc05EV2pHTVN4Rk5JcW15VXkrbXRZ?=
 =?utf-8?B?dlp4am1hYkFMNjg2YklYS3YxMlZvSnVFSkt0Yk1HNXRGYjRNb1BtWmRCR2oz?=
 =?utf-8?B?eGpmNHdvS2Z5TlpwbVlESG1IaGE3a3NIMUE0bXhJZldTS2ZKYzVpSXFQazhl?=
 =?utf-8?B?dmNFaHArNFNiNnRiNlA3QTJzeEpMKzI4ZTZoa1hHb2gwSkhWaU9taTgvTHB3?=
 =?utf-8?Q?gyUY4GvznwYvxOQnLZbi9a/bk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43321f3-8e43-44bf-bdf5-08db2eb8ea78
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 11:46:34.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+12A3FDCjLgJ7Ud/0+aQzgQ2xvTauxhbvqiadb9xYN0FwOyVB62fqGf5MibJxINof71zWZ7P0Vyw02vPqsgJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459

Hi Jan, Julien,

On 22/03/2023 13:53, Jan Beulich wrote:
> On 22.03.2023 14:29, Julien Grall wrote:
>> On 22/03/2023 06:59, Jan Beulich wrote:
>>> On 21.03.2023 19:33, Ayan Kumar Halder wrote:
>>>> On 21/03/2023 16:53, Jan Beulich wrote:
>>>>> On 21.03.2023 17:15, Ayan Kumar Halder wrote:
>>>>>> On 21/03/2023 14:22, Jan Beulich wrote:
>>>>>>> (Using "unsigned long" for a 32-bit paddr_t is of
>>>>>>> course suspicious as well - this ought to be uint32_t.)
>>>>>> The problem with using uint32_t for paddr_t is that there are instances
>>>>>> where the paddr_t is modified with PAGE_MASK or PAGE_ALIGN.
>>>>>>
>>>>>> For eg , handle_passthrough_prop()
>>>>>>
>>>>>>                 printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>>>>>                        " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>>>>>                        kinfo->d->domain_id,
>>>>>>                        mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>>>>>>
>>>>>> And in xen/include/xen/page-size.h,
>>>>>>
>>>>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>>>>> #define PAGE_MASK           (~(PAGE_SIZE-1))
>>>>>>
>>>>>> Thus, the resulting types are unsigned long. This cannot be printed
>>>>>> using %u for PRIpaddr.
>>>>> Is there anything wrong with making PAGE_SIZE expand to (1 << PAGE_SHIFT)
>>>>> when physical addresses are only 32 bits wide?
>>>> I don't have a strong objection except that this is similar to what
>>>> linux is doing today.
>>>>
>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/page.h#L12
>>>>
>>>>>> I remember some discussion (or comment) that the physical addresses
>>>>>> should be represented using 'unsigned long'.
>>>>> A reference would be helpful.
>>>> https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00305.html
>>> I see. I guess this will be okay as long as only 32-bit arches elect to
>>> use 32-bit physical addresses. Maybe there should be a BUILD_BUG_ON()
>>> somewhere, accompanied by a suitable comment?
>> Hmmm... We definitely have 40-bits physical address space on Arm32. In
>> fact, my suggestion was not to define paddr_t as unsigned long for
>> everyone but only when PHYS_ADDR_T_32 is selected (AFAICT this is what
>> is done in this patch).
>>
>> This is to avoid having to add cast everywhere we are using PAGE_* on
>> paddr_t and print it.
>>
>> That said, I realize this means that for 64-bit, we would still use
>> 64-bit integer. I view it as a less a problem (at least on Arm) because
>> registers are always 64-bit. I am open to other suggestion.
> It simply struck me as odd to use a 64-bit type for something that was
> explicitly said is only going to be 32 bits wide. I would therefore
> prefer if we could limit 32-bit paddr_t to 32-bit architectures for
> now, as expressed before when asking for a respective BUILD_BUG_ON().
> Especially if, as intended, the type definition moves to xen/types.h
> (and hence isn't Arm-specific anymore).
>
> Jan

Please have a look at the below patch and let me know your thoughts. 
This patch now :-

1. Removes the config "PHYS_ADDR_T_64".  So when PHYS_ADDR_T_32 is not 
selected, it means that physical addresses are to be denoted by 64 bits.

2. Added a BUILD_BUG_ON() to check that paddr_t is exactly 32-bit wide 
when CONFIG_PHYS_ADDR_T_32 is selected. As 32-bit Arm architecture 
(Arm_32) can support 40 bits PA with LPAE, thus we cannot always use 
32-bit paddr_t.

3. For Jan's concern that the changes to 
xen/arch/arm/include/asm/types.h will complicate movement to common 
header, I think we will need to use CONFIG_PHYS_ADDR_T_32 to define 
types for 32-bit physical addresses.

I am open to any alternative suggestions that you propose.


commit 3a61721a5169072b4aa3bbd0df38de5e69a5abc1
Author: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Date:   Wed Feb 8 12:05:26 2023 +0000

     xen/arm: Introduce choice to enable 64/32 bit physical addressing

     Some Arm based hardware platforms which does not support LPAE
     (eg Cortex-R52), uses 32 bit physical addresses.
     Also, users may choose to use 32 bits to represent physical addresses
     for optimization.

     To support the above use cases, we have introduced arch independent
     configs to choose if the physical address can be represented using
     32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
     For now only ARM_32 provides support to enable 32 bit physical
     addressing.

     When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
     When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
     When PHYS_ADDR_T_32 is not defined for ARM_64, PADDR_BITS is set to 48.
     The last two are same as the current configuration used today on Xen.

     PADDR_BITS is also set to 48 when ARM_64 is defined. The reason being
     the choice to select ARM_PA_BITS_32/ARM_PA_BITS_40/ARM_PA_BITS_48 is
     currently allowed when ARM_32 is defined.

     Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 7028f7b74f..67ba38f32f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,6 +1,9 @@
  config 64BIT
     bool

+config PHYS_ADDR_T_32
+   bool
+
  config NR_CPUS
     int "Maximum number of CPUs"
     range 1 4095
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..e6dadeb8b1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,13 +19,46 @@ config ARM
     select HAS_PMAP
     select IOMMU_FORCE_PT_SHARE

+menu "Architecture Features"
+
+choice
+   prompt "Physical address space size" if ARM_32
+   default ARM_PA_BITS_48 if ARM_64
+   default ARM_PA_BITS_40 if ARM_32
+   help
+     User can choose to represent the width of physical address. This can
+     sometimes help in optimizing the size of image when user chooses a
+     smaller size to represent physical address.
+
+config ARM_PA_BITS_32
+   bool "32-bit"
+   help
+     On platforms where any physical address can be represented within 
32 bits
+     , user should choose this option. This will help is reduced size 
of the
+     binary.
+   select PHYS_ADDR_T_32
+   depends on ARM_32
+
+config ARM_PA_BITS_40
+   bool "40-bit"
+   depends on ARM_32
+
+config ARM_PA_BITS_48
+   bool "40-bit"
+   depends on ARM_48
+endchoice
+
+config PADDR_BITS
+   int
+   default 32 if ARM_PA_BITS_32
+   default 40 if ARM_PA_BITS_40
+   default 48 if ARM_PA_BITS_48 || ARM_64
+
  config ARCH_DEFCONFIG
     string
     default "arch/arm/configs/arm32_defconfig" if ARM_32
     default "arch/arm/configs/arm64_defconfig" if ARM_64

-menu "Architecture Features"
-
  source "arch/Kconfig"

  config ACPI
diff --git a/xen/arch/arm/include/asm/page-bits.h 
b/xen/arch/arm/include/asm/page-bits.h
index 5d6477e599..deb381ceeb 100644
--- a/xen/arch/arm/include/asm/page-bits.h
+++ b/xen/arch/arm/include/asm/page-bits.h
@@ -3,10 +3,6 @@

  #define PAGE_SHIFT              12

-#ifdef CONFIG_ARM_64
-#define PADDR_BITS              48
-#else
-#define PADDR_BITS              40
-#endif
+#define PADDR_BITS              CONFIG_PADDR_BITS

  #endif /* __ARM_PAGE_SHIFT_H__ */
diff --git a/xen/arch/arm/include/asm/types.h 
b/xen/arch/arm/include/asm/types.h
index e218ed77bd..e3cfbbb060 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -34,9 +34,15 @@ typedef signed long long s64;
  typedef unsigned long long u64;
  typedef u32 vaddr_t;
  #define PRIvaddr PRIx32
+#if defined(CONFIG_PHYS_ADDR_T_32)
+typedef unsigned long paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "08lx"
+#else
  typedef u64 paddr_t;
  #define INVALID_PADDR (~0ULL)
  #define PRIpaddr "016llx"
+#endif
  typedef u32 register_t;
  #define PRIregister "08x"
  #elif defined (CONFIG_ARM_64)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b99806af99..6dc37be97e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -690,6 +690,11 @@ void __init setup_frametable_mappings(paddr_t ps, 
paddr_t pe)
      const unsigned long mapping_size = frametable_size < MB(32) ? 
MB(2) : MB(32);
      int rc;

+   /* Check that paddr_t is exactly 32 bits when CONFIG_PHYS_ADDR_T_32 
is defined */

+   #ifdef  CONFIG_PHYS_ADDR_T_32

+   BUILD_BUG_ON((sizeof(paddr_t) * 8) != 32);

+  #endif

+    /*
+     * The size of paddr_t should be sufficient for the complete range of
+     * physical address.
+     */
+    BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);
      BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);

      if ( frametable_size > FRAMETABLE_SIZE )

- Ayan


