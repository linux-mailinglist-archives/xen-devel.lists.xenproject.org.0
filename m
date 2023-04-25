Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C76EE50D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 17:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526124.817617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prKzq-0001wr-0U; Tue, 25 Apr 2023 15:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526124.817617; Tue, 25 Apr 2023 15:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prKzp-0001uy-U9; Tue, 25 Apr 2023 15:54:25 +0000
Received: by outflank-mailman (input) for mailman id 526124;
 Tue, 25 Apr 2023 15:54:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZje=AQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1prKzo-0001t3-Ot
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 15:54:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 724705ed-e381-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 17:54:23 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 15:54:20 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5b9b:f31f:ac6d:be94%6]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 15:54:20 +0000
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
X-Inumbo-ID: 724705ed-e381-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgRekv/FZYlTcLSNv46Vp+C7C3ezYNt7/cNPPGUZQ1xrhlzsFeZZV397qDnSaX2frak1M0WIBi4w/ZtMvVpvwuQFThVRowG5TBy3RW2Ste3MX6OiSKBslvE9dOP0WSN7Y+mFCNtZFt+sg8gsTd0LHyED1LdDlC9Tbp26frvmSAPOTox7yAapoDZsG6IepjFI8Vh+TS2or1z2QqQC0tiwIg+bfDBSwofsNZm4kmSClGnpVTFACOBrkOwILiv5s7/IkLeZMj0/B8ApTMp18OyiXiHXj84JCpErUBkB3+LDgXsLo25sXXImTrtypumW/MdljuXSfucBtLB2B9i9fyNpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0vLtKMp4mt3w3BEv9GRZqTyAgH4JH8R8pqx0n6Srmo=;
 b=hXxBNQqHGN5DY7yj7YxuXBBS7KeGXhgZAcs3B5oyrAgvQA/Yc2WcdBRcY6Es3DYyxR/DojNaZYQMqwsRfg7dEm/o2UqhXVAWjEnPRKFygyGLQ+rBsQ/3q7nXLXgtQwunZo45N5VvtCtiKhbEP4x6SSY7delyKnTaTS614Y8UzKDx6KJDfiQaN4lAPf/diE1fWr3WZTdIGTFhFca0q3SjSSfQEyOcOTVgaE2dbbsRVZVuStdtLhACtir754WWeKtIqHsfUeiSdi+x3irImASnpc58gwRy8XyBErcTYekD0XCq6ZE4/Fv6CxndelKdh4RQbUn6P9Vxvwl+qXWnkVu4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0vLtKMp4mt3w3BEv9GRZqTyAgH4JH8R8pqx0n6Srmo=;
 b=AruoKYNSbJE83WRg88H7s9mN0FfTWYxX0u3iNa9UzechEvEfBNosudkl+qpkEJ95FWRB+Pq8ceGCsx0SS6aORxA25lf6nkoHSYrkjshxIoD/ec+PaAGYEwxC+40J5QF3lUruHGEz57p83Gvs0w9tzJdzDLe0JR6bqQuWWyoAxI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <db111e27-5fba-37b7-334a-6f9f8447d072@amd.com>
Date: Tue, 25 Apr 2023 16:54:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 08/10] xen/arm: domain_build: Check if the address fits
 the range of physical address
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-9-ayan.kumar.halder@amd.com>
 <e1769508-287d-a278-56d0-01aacc77b391@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e1769508-287d-a278-56d0-01aacc77b391@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0184.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: cae711ec-3054-41af-5d80-08db45a554e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0DSJc3/z73fFU1fOMaKhSSbtgFIalkLfUUi0X95avoelaHTnqy2TKPwD8Z3l9MwpV1geafMmjBrG7Q8ZP/Q6kjp0yCYViwNtPUeQN1bxkRRd8TXinv7ZUnImlH9QJbvHYlwfIMKhJJ4/uKSLu7G0bDBhQvx0WBisahnVcqudjQNOwDtJaag/Tv5FVZH6xRHqQkN02s38BvRf9jZ2ydw2rKjBBJ/6IZMYAzsUS0TXuqUwPRONURZpNO1gdw78WDnpnlJwEYGVZJEHsCbaAT+xuhbsSferij9wKLXQp434X7SGo7CFwKRbMkcxrNL9N06DKMptEkOobzF8bB86XdbNZTC1K9tjZHyfmVGmqAPOSVcVck9dRxaIg9MwciWTqkgILPHEEbPrPcE5nAuzHuJRhGiZ53wLLJdbUtEGGkpKekEnfTE+/WayJR03J5+++3XA/9YYo7YuzvhLZGlfDhaJjA0vn3l74azaXQ51kGY4VgmQFdRaakTV8pAEKZ9pkbEO9K+pqIohri1nirWocp/7W571Fwat/D/1J1yF49/bnHvYkeL1+BGEA2O/JjTwFX5tIzpk3dJtawBZfrjtbImoc55MJfFMSjg39vUP4TdQXNH/2qNWrkxHsG+Hw3Hha+x1YiXESS6vGoka8a6+0tRd4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(66946007)(31696002)(478600001)(66556008)(66476007)(31686004)(8676002)(8936002)(7416002)(110136005)(5660300002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUkyT2J3eEY5OWtXVGhXUW9yaDBLK05YMFdDUUdSL090OUVid2JycFJ3TUJT?=
 =?utf-8?B?eFJQTjM4V21kNEhPMWtLMlNpQXdWMm1ObGFBQkUvZVk4SGdBa3ZEVW1ZOU9z?=
 =?utf-8?B?TDJuZWZBT0RNUUFyc1FxVytBTXRSZS9ra3hWT1FWSW4zSElJL0RVL0tKUTRK?=
 =?utf-8?B?WHVjYVUxR0dRSnZpaWw3TklZd0JIYWVCcTRKRUptSDQzUVlhZk80VjAxWlho?=
 =?utf-8?B?YlBFVi9lZXhHdHFtU095RjZYNkxBQnA0RzgzVG9lQlliR1BsS3c1dFJCalJ5?=
 =?utf-8?B?TFR4SGtTN3l5ZHNhemFrMFRwMC94b2dIaHNtdjlwSTNtNngvMDJKRUpkTVFE?=
 =?utf-8?B?VWE5MEh2Sy9PdmJXK1Ayb3dvVlNBYlpTcEd3TFZsY2F6a2FvbFBUVDJMdzFR?=
 =?utf-8?B?dVExZ3RjcEVmMVBIMUs1dmFLdUEyRkZXMEFMUWJwdlhzWldnSFpDclQveWND?=
 =?utf-8?B?eThBU0FDeVo1R3FPMFVhOWJ1RExIYmxjWTNVVjd5SXdYdmVJK3lSdVVUYVRU?=
 =?utf-8?B?Z1pSUDNkMHgwMlVCMHFNR2IwaGNEN3V6Zy9lMitjREFrWERNSVlkYWRVQyto?=
 =?utf-8?B?WHg5am40QTZ3RkpzclFHL09LVTFTMGkrL1RlVmgrdFBqUkhxWksvQ0RQMXhm?=
 =?utf-8?B?WUs5c3JwTFpENnBIalRSTU5vZFpaQVpiS0U1SE52enhPQ3FFZktyVVVTbzI5?=
 =?utf-8?B?Rk02aDBaS2R1Q0drSFVCaWh2YkJuMDBmK0JqOXF3VlpEMzNRSDNia1ZIWUly?=
 =?utf-8?B?RUVxdUlrRllKY213aUR5eTNZNjFuT1l4WGxFbjd0UXVVeHFZWmlQMkRwMGxB?=
 =?utf-8?B?b3p4ZzBld25ZcVc3Z1lpbmNIVWJIaEl4ZDN2MlFhQzdBRG05L0laSGs3dFY1?=
 =?utf-8?B?VUswZUlIcVNHR3g1cmd0Qm5IVU1LeFNPZVRuWGFaQWVCTElVbWwwTEhoZkpq?=
 =?utf-8?B?VnY1YnpTeW9hSURJRlZSQ04wckg5Q1BhYThzb0FJUGxKWnpSemQ2bG1LNjRa?=
 =?utf-8?B?UGEwcmw5NVdnTzI0S3Q4Z0dvb0NjQ2Z6SlVsTSt5Slk2dWwvdEhQZytzMHJs?=
 =?utf-8?B?WUswYlZYWnpxNTFra3VLcXl1MlZJSzNwY0xaazFVcFZZRTd2M29HY2dzOTA3?=
 =?utf-8?B?NWdiK001R2YxQnppZTdBRmtmNDdOSW03UTlLSHZTVkF6RWRSSkloQzdMZzMv?=
 =?utf-8?B?ck52cXJERUthUzJyYzY3eWQ1cnlBU2ZpSXRIRnQ1U1NTTUM2eXNPVGV0ZUdX?=
 =?utf-8?B?ZXk4Um9ycDYvenBCeXJTbTJWMnBjQVVteDhlVVpwSHdUenkrd2EwVXF0M1Z3?=
 =?utf-8?B?N3RpV2RGM2JzdjVzN1B0dVZiNHdYRXJLbU9XZHV4dzlVSVFRaklaUkg0eStK?=
 =?utf-8?B?R2tQYk9yRDd2WUpYMVkwUFpkV2lkN3lmbUtlZVlldEVsdzd6aW9RWE5qNTk3?=
 =?utf-8?B?Zmk5MG5VQk45ZnVBeWd3ZUhmbHo3MmpkSS9aaEtYNHlleGdZS1BZNWdKTzhz?=
 =?utf-8?B?WkVzbUVVcENDSDZyekNzeTFxZ2l6VWZLcWQ4M05sSVR6YUNycFZvVzdmZDBl?=
 =?utf-8?B?MDR6WjZsczVvdHhYM2VsQXFlN3Qxc3RMYVJGL2lqKzBaN0RWM1NkaFVXRXBw?=
 =?utf-8?B?dlF4eituUWpGTURCdkE3dWhMZ1ZxL1lqTFFRYmE2VDNBYkpxOGhIdnVEZFZ3?=
 =?utf-8?B?UUl4eVRuWkp6MHpDOGtlaGZzVldsWkptNGo2bkpXVVk1bVFWTEhkckJsakkw?=
 =?utf-8?B?cHRtZ3hGYkJCVnFiVEJEOHdBNnJxdWpZakw1WWJJTjRpTjdiUjFLcHpEdjkr?=
 =?utf-8?B?cHN3QlJSTldrQ2hzN3plc3NHOXBhNGI3bDNadTZCaERZZmY0QXZIWTJKaDR2?=
 =?utf-8?B?Z09PNEpDTGl5cDhuRWdUNUFKZnRuZTNxZVVnbG5pc1hXYm0xVUYrMC9pSWJ6?=
 =?utf-8?B?cHMvb3VQVjZ5QzZDNi9aTU1VMTZwOWFyRktqYTFVOS9VczkvdnhHdVFwaVpN?=
 =?utf-8?B?dlV4RFA3M1RHS05SeGF5UjlUc2F1bHNBTmh1UGoybThtY290bllOeWkrbnMr?=
 =?utf-8?B?MlEwNTFNZGZWd1dhMW9RY3JCNm5tZGZNaDNvMllOUXdBRElsK21zOXBUWEFr?=
 =?utf-8?Q?1dGJck/yWx2GTx3nOIX0/6gD8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae711ec-3054-41af-5d80-08db45a554e4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 15:54:20.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGSn2bMzR7pXnuxDaT3v53q14CCtnw5F0Fci1UsbGY2al+J+s3cwh/KKRKPa+KJrTzsaUGSpgm2i8E8e0CWY4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085


On 24/04/2023 09:26, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 13/04/2023 18:37, Ayan Kumar Halder wrote:
>> handle_pci_range() and map_range_to_domain() take addr and len as 
>> uint64_t
>> parameters. Then frame numbers are obtained from addr and len by 
>> right shifting
>> with PAGE_SHIFT. The page frame numbers are saved using unsigned long.
>>
>> Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. 
>> On a 32-bit
>> system, 'unsigned long' is 32-bits. Thus, there is a potential loss 
>> of value
>> when the result is stored as 'unsigned long'.
>>
>> To mitigate this issue, we check if the starting and end address can be
>> contained within the range of physical address supported on the 
>> system. If not,
>> then an appropriate error is returned.
>>
>> Also, the end address is computed once and used when required. And 
>> replaced u64
>> with uint64_t.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from :-
>> v1...v4 - NA. New patch introduced in v5.
>>
>>   xen/arch/arm/domain_build.c | 30 +++++++++++++++++++++++-------
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 7d28b75517..b98ee506a8 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1637,15 +1637,23 @@ out:
>>   }
>>     static int __init handle_pci_range(const struct dt_device_node *dev,
>> -                                   u64 addr, u64 len, void *data)
>> +                                   uint64_t addr, uint64_t len, void 
>> *data)
>>   {
>>       struct rangeset *mem_holes = data;
>>       paddr_t start, end;
>>       int res;
>> +    uint64_t end_addr = addr + len - 1;
>
> I find the difference between end and end_addr a bit confusing. How 
> about...
>
>> +
>> +    if ( addr != (paddr_t)addr || end_addr != (paddr_t)end_addr )
>
> ... replace the second part with (((paddr_t)~0 - addr) > len))

It should be

if ( ... || (((paddr_t)~0 - addr) < len) )

{

/* print error */

}

>
>> +    {
>> +        printk(XENLOG_ERR "addr (0x%"PRIx64") or end_addr 
>> (0x%"PRIx64") exceeds the maximum allowed width (%d bits) for 
>> physical address\n",
>
> In addition to what Michal says, I would replace the "addr .... 
> end_addr" with "[start, end]" to further reduce the message.
>
> Also, please use %u rather than %d as the number of bits cannot be 
> negative.

I think this should be fine ?

printk(XENLOG_ERR "[%#"PRIx64", "#PRIx64"] exceeds the maximum allowed PA width (%u bits)", start, end, CONFIG_PADDR_BITS);

- Ayan

>
>> +               addr, end_addr, CONFIG_PADDR_BITS);
>> +        return -ERANGE;
>> +    }
>>         start = addr & PAGE_MASK;
>> -    end = PAGE_ALIGN(addr + len);
>> -    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), 
>> PFN_DOWN(end - 1));
>> +    end = PAGE_ALIGN(end_addr);
>> +    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), 
>> PFN_DOWN(end));
>
> And this will not need to be changed.
>
>>       if ( res )
>>       {
>>           printk(XENLOG_ERR "Failed to remove: 
>> %#"PRIpaddr"->%#"PRIpaddr"\n",
>> @@ -2330,11 +2338,19 @@ static int __init map_dt_irq_to_domain(const 
>> struct dt_device_node *dev,
>>   }
>>     int __init map_range_to_domain(const struct dt_device_node *dev,
>> -                               u64 addr, u64 len, void *data)
>> +                               uint64_t addr, uint64_t len, void *data)
>>   {
> My comment on the previous function applies for this one as well.
>
> Cheers,
>

