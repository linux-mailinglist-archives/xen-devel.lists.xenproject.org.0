Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CD6D688E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518050.804193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjIw-0000G6-0C; Tue, 04 Apr 2023 16:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518050.804193; Tue, 04 Apr 2023 16:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjIv-0000Cz-TO; Tue, 04 Apr 2023 16:14:41 +0000
Received: by outflank-mailman (input) for mailman id 518050;
 Tue, 04 Apr 2023 16:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjjIu-0000Ch-1P
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:14:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cca72ce1-d303-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 18:14:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8965.eurprd04.prod.outlook.com (2603:10a6:10:2e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 16:14:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 16:14:34 +0000
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
X-Inumbo-ID: cca72ce1-d303-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxDF+AoahQsIazkgLmGUOEB1HZGNhxuBZ7CqJbChgxVtEb+V1oMVMsYrYQU3autLwehhrH4U09bM6iPc30+M3N24yAKgxfCendALi04VHnzE3392qU4qwHB7Bh4G7307LrYYWhZEhIJB+5zIGQ+nDd78g2OvI/G9Ui0SpQot7Qvs1jtuBnlz8yKVjyaYC/wnJom/urcFTW5ne00qvolpMLDijiGcMAuzZHAv46yU5f5265HGgfGCFlOtAbpPW7eNvjZwtlCiDSak0p/6Wr+zYwIJwGcoDYeS4AMQXFNWeUjFQryQIn3tUPPz+o60ywxND0xZ+K84rTV9324AhqCdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnWiy6JScAf/NRInOHVOq/udM6RNapUPBQzbUYxr1Xs=;
 b=Lg0spScQOCFiftogrciJLn08wLJm0b60/9ue5eMeWFFeF5aBtbPey2ISYIhTdzT1tVXAJb/14gVBhy0qz3liHKx1fqyO7zozPf7iWmf/yNTjVgFQ2Hz+333/buHAnIz6c8PDsuNJn7Q4iRHITi5dCWp91pmX5goKlf7jcvtrJVMdinAb1Hr/6qOLt60W3wtILbhUaI4/mrpOZ/gfe9UzhpsUnxusNVzv6TzkSIwr1/08TlkjEuD7yQJz50Mm5JZkWcCb0U9jGvLIX7RhxvrQylvbjSdQiRow0qKPWlW1ctHVZJ3GnsI+llptwqZPqC2/+z5crAb5DwLzYKEd60ELoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnWiy6JScAf/NRInOHVOq/udM6RNapUPBQzbUYxr1Xs=;
 b=aRGcCZEMN56MdYhmcec1BPO4ub485kwyRfbxRipYq++NU3MnxG3p/7FpVSjm6TVst+Avk7T+mxoFLV9kt+dnpSpV0r7qlSeoDJwvAGKaE+meqCJoUPTRzUSJMT5Skzh932llx2tDtPTT+YI8BDvXfsPSKZHhrc7hRialGroUjolV68jNQgxsXTKz6+sbvtEA2UvRwfMJ8mfc/K3YlgNCtlPzPRxuHQUeXtvZrEd2+sMoR2Ex5C2OiCj3BDpXIC4a24x57DZZ25DWiDDg8Y2CmituFkAxLbTdTJG04T3Q93mOzCMHvktuS377HW/u94k5TMrXNPFnGUmh4wUZjoR4Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfd78e18-9f78-dd44-c19d-3a5263285d4f@suse.com>
Date: Tue, 4 Apr 2023 18:14:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 11/15] x86/boot: Merge CPUID policy initialisation
 logic into cpu-policy.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-12-andrew.cooper3@citrix.com>
 <087536dd-96cf-84f0-4b8f-d4de4d6bd093@suse.com>
 <0c43546e-0333-af19-efa5-71cfaf5efa3f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0c43546e-0333-af19-efa5-71cfaf5efa3f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 26effeed-589d-4817-d268-08db3527adc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fSme10hNEqs6WNvJlK2SB9uD6SwrBrS0hOaBWob2EAQWk653q/7Lwy1QjbPVPGYrI4PvmorPcHosKuDhViygMgpx5cfLlsH9PZ368zgSlHLkznTnoGSsG6NyJAEtOG42XfE3DKoZls7Tv8Ip90Yn5GPXkt7ueN9N1H8m8QP9sxu857HicNi5I4zGm89GBFja0DBgZvu4BgD7lwczI+00NHALGumCHjP+lJLCUeXhA81BJD4tHbcrvdvxYNqZ0CS0KlaKF9otdB57PAIBDwx2iaeJBojB8tI19rtojthlzpvVhIlhr2K6DyZkxrSNg7TPsbABDIXETZBD/HdyUzn9Ml3/OBkidaP/CMlFf/6AqCyC1JwH0WSwFW1CpnJbQpkZT5/YLswWF+X/DKDNJAAGe1iS0btpTC6FcJBMqhxEwb+JG/d2P4SghDf58ak20ZH85NtbriezWLmWb9FLo82TvcHDEHWbYp6sw0seIXHhk/Cb71z2vq5t90iGFB6pdqksNqyu71mZDCQu06QX2T85qQHQoRCf4WnK1XnBrJKNssdUnb1jsw42nvH6YdbxaDaTehEVRrIC8MsUyWTvjpVkRr9WB6AdsvXnlFmcvugcf72D7dSC7TDMK1hTbo17F2T8ij/bMkciJ0kVBIMO0Oc8fQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(376002)(39860400002)(136003)(451199021)(6916009)(66476007)(478600001)(316002)(8676002)(4326008)(66556008)(66946007)(8936002)(54906003)(38100700002)(41300700001)(5660300002)(53546011)(6486002)(186003)(2616005)(6506007)(6512007)(26005)(31696002)(86362001)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZENxVU5tYUNNUWJtTDN5eUdXeFlWUEdDR3NTZWZ1MTJSeVNjc0lPSm84RENx?=
 =?utf-8?B?b2RJaEUreVVHS3ZMRjBxSjhDckRxdlJnMnIrTFlNRGhqeGgvczgyd2RnZ0ts?=
 =?utf-8?B?d2JjVVl2YWxkSzBLbUcvNUwwWDZMUXBuZXIxZzBnT2NDSDMyRW1IUVpvalhv?=
 =?utf-8?B?cXdiWmlnUkFYN0Y2aEgycVlFT0hSeCtLSGlramFYdVBWMU5oOFJiK2dDc0dk?=
 =?utf-8?B?Q2RxbUM0VWd5RmhJRjNJOTdmUEdhUmVkSXdabVVGb2VGV2RHdm1LT3BNRGlx?=
 =?utf-8?B?UU1DamhCcXl1eGw1RG14UFJ2YlB0WGY0YURYMnFFdHJQdXlLbWVBR0w2ZU00?=
 =?utf-8?B?TGZvemdacnJld2FyN21VVkQvb1c1d3lnbE1GL0hYZmVPa3MrUnQxS0l1bjNX?=
 =?utf-8?B?dUNFaXA1ZjBycWdLT3NEVm8vQmdiMHB4SVdQVmdPdWVMMDIwUHhHV1h3RzVI?=
 =?utf-8?B?bytOOWM4a3ZKMXc1c3hreWpWZHYyclQ3RXdZTzhVNHVtblhja2Ftck80a3ZV?=
 =?utf-8?B?Vk9ZRmswbkZqdjRNOHgveTVvclhsZkN0VDhBb1krV1l4cVlDQ2MrZmNJUTBo?=
 =?utf-8?B?L01TM3MrRUpGZ2RGZnQyVzdjVEtnbThndWVUQ0VVRnFXeHlSR2swZ2RMczE3?=
 =?utf-8?B?clJYMlhob0lWRkRIL01DR2xLR3VQMHVWWFpza3hORWtJNWFIZWtWVTFzUGsy?=
 =?utf-8?B?WEoySk96NjVsV0dubzNpNy9oUFk2M3FibVdmYTNvUm5JeDdBUlFicXRnbDB4?=
 =?utf-8?B?VEJGc0Q0eDZYZXhFNVRtUitNbi81UXlKWWt6cGRiS1IrbnlhTTNwVGVVZ1Bm?=
 =?utf-8?B?ZE9Obm9yRFZNTGRmTTdvRDZScUt1eHpDVjdRdS8wQ0lyVkFnbzAwZ3NBMTh1?=
 =?utf-8?B?ekxvSnhscndUWmVXM3ROVENVdC9raG9nSmtEeDRMejM4R3ZUKzN1dUtDcElr?=
 =?utf-8?B?RWoyT3hxMEd4S09zVFEvdGtSS1NoNllEdjVRWGEvWjdxbHRUS0pGeXhKTVhi?=
 =?utf-8?B?bXAwVnhxb2cvZ3c2aGpjdEpKRHJjcWx4cDR3YlpHNUlLa1V3ZG1ob0drODZV?=
 =?utf-8?B?cWp2cE9OYXlpWEZLZURqYTNFam5oSXNxdlBHUW5JYTFIbTNnNHpqVStOaDM2?=
 =?utf-8?B?RGpKc0dlZ2xhK2NqbUZkTENLSWgxQU9rNzV2emYwWWVzSFUyZFUwMkdxV2xU?=
 =?utf-8?B?RWRQS0Jwb0JpdlA5NTVUd1E1azBSVm9NcUZSaERWRC9XeWJuZE43bVI0R0d4?=
 =?utf-8?B?TU53WldXa0JaSjg3ZkpsSkd2WnpuWlRKbXQ2eGRodmRiUEJMN3Mwb3JCVUEy?=
 =?utf-8?B?NVpxVmkwQUhrR2c3VkZyUzJObjlNVC9xMHVWRkx0OXpPNS9UY3M2clNxN1Y4?=
 =?utf-8?B?UXdCc2x0SUs2OFM5L25JOHJGK2xDc1d1RThheFRoeEl6Q2x5WUp3b2tqR3pn?=
 =?utf-8?B?ZHl4eS9saUF0SHAwcUNpVmp2NWNhR2UwRkFPS2VLZ1lHMEpBRTVmMXc3bk1r?=
 =?utf-8?B?NjJvV3RlT1I2c0RLbkdWVmRpZG9WUWtYek9PQmthR1o3bjJNTTd3Y0JGd2VQ?=
 =?utf-8?B?ZkVEbXdBM1dDVWF1YWN5S29Sd0xDQitzbXdKRFJTYkg5Ulk0eUhGaVlIVm9y?=
 =?utf-8?B?YWUxSGdPa2R5N3M0N1dtYlg5TGVEcjRwYlFNbkk0Z1JwaGlnVmh6VHlKTngx?=
 =?utf-8?B?Y0MrcGdEeHBBWENicExINExxOGc5aUZpempPZXNVbU1UeWhMK3hZc2hQRmpl?=
 =?utf-8?B?SGNRWHl3TFJwNXNEcnpXUjY4bG1xSGUwKzJCUkZLOXdXbjJRQkQ4T0lyN1gy?=
 =?utf-8?B?SHlicURNaVJScnhJc1JGRTAzMjFrLzJuclhWMWpXdTdEVW5JUGdURUxvSmlV?=
 =?utf-8?B?UmVJN1FrM1VzWW1mMWx3SE1JcnNybzhraURwTnJ2TjUvczNsd0xwaDUwQ2gv?=
 =?utf-8?B?bGx1cjdzUmRRbEsyQUxvU1FRcGN4N2Vtck9PTjRWN0k3bk9jcDZPTnJiNGlX?=
 =?utf-8?B?VkpmT3pzWkVhOG1ZQ2JkV2Z0bTlsMXJsVWM5Q3VQY3IxQWRTZXhUZGM0dHhj?=
 =?utf-8?B?eVc5OGpkMEw1VDNXbHRVb3FMYlFrYUo0QU11WlJ6a1p3MDI3Vkw1dllxTks3?=
 =?utf-8?Q?VIjMKLgUHHQ0eMWUpn2go8NTP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26effeed-589d-4817-d268-08db3527adc5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 16:14:34.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yKb9yRXea4X5BM7aNLQ8NbPiS8M2JSCDoFV5ZKBo9aEbpiRmi6P8ly+V8cr87yONEErXwVNPEwTt4PhNN8iaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8965

On 04.04.2023 17:45, Andrew Cooper wrote:
> On 04/04/2023 4:16 pm, Jan Beulich wrote:
>> On 04.04.2023 11:52, Andrew Cooper wrote:
>>> @@ -20,10 +26,332 @@ struct cpu_policy __ro_after_init hvm_max_cpu_policy;
>>>  struct cpu_policy __ro_after_init hvm_def_cpu_policy;
>>>  #endif
>>>  
>>> +const uint32_t known_features[] = INIT_KNOWN_FEATURES;
>>> +
>>> +static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
>>> +static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
>>> +static const uint32_t __initconst hvm_hap_max_featuremask[] =
>>> +    INIT_HVM_HAP_MAX_FEATURES;
>>> +static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
>>> +static const uint32_t __initconst hvm_shadow_def_featuremask[] =
>>> +    INIT_HVM_SHADOW_DEF_FEATURES;
>>> +static const uint32_t __initconst hvm_hap_def_featuremask[] =
>>> +    INIT_HVM_HAP_DEF_FEATURES;
>>> +static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
>>> +
>>> +static const struct feature_name {
>>> +    const char *name;
>>> +    unsigned int bit;
>>> +} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
>>> +
>>> +/*
>>> + * Parse a list of cpuid feature names -> bool, calling the callback for any
>>> + * matches found.
>>> + *
>>> + * always_inline, because this is init code only and we really don't want a
>>> + * function pointer call in the middle of the loop.
>>> + */
>>> +static int __init always_inline parse_cpuid(
>>> +    const char *s, void (*callback)(unsigned int feat, bool val))
>>> +{
>>> +    const char *ss;
>>> +    int val, rc = 0;
>>> +
>>> +    do {
>>> +        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
>>> +        const char *feat;
>>> +
>>> +        ss = strchr(s, ',');
>>> +        if ( !ss )
>>> +            ss = strchr(s, '\0');
>>> +
>>> +        /* Skip the 'no-' prefix for name comparisons. */
>>> +        feat = s;
>>> +        if ( strncmp(s, "no-", 3) == 0 )
>>> +            feat += 3;
>>> +
>>> +        /* (Re)initalise lhs and rhs for binary search. */
>>> +        lhs = feature_names;
>>> +        rhs = feature_names + ARRAY_SIZE(feature_names);
>>> +
>>> +        while ( lhs < rhs )
>>> +        {
>>> +            int res;
>>> +
>>> +            mid = lhs + (rhs - lhs) / 2;
>>> +            res = cmdline_strcmp(feat, mid->name);
>>> +
>>> +            if ( res < 0 )
>>> +            {
>>> +                rhs = mid;
>>> +                continue;
>>> +            }
>>> +            if ( res > 0 )
>>> +            {
>>> +                lhs = mid + 1;
>>> +                continue;
>>> +            }
>>> +
>>> +            if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
>>> +            {
>>> +                callback(mid->bit, val);
>>> +                mid = NULL;
>>> +            }
>>> +
>>> +            break;
>>> +        }
>>> +
>>> +        /*
>>> +         * Mid being NULL means that the name and boolean were successfully
>>> +         * identified.  Everything else is an error.
>>> +         */
>>> +        if ( mid )
>>> +            rc = -EINVAL;
>>> +
>>> +        s = ss + 1;
>>> +    } while ( *ss );
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static void __init cf_check _parse_xen_cpuid(unsigned int feat, bool val)
>>> +{
>>> +    if ( !val )
>>> +        setup_clear_cpu_cap(feat);
>>> +    else if ( feat == X86_FEATURE_RDRAND &&
>>> +              (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
>>> +        setup_force_cpu_cap(X86_FEATURE_RDRAND);
>>> +}
>>> +
>>> +static int __init cf_check parse_xen_cpuid(const char *s)
>>> +{
>>> +    return parse_cpuid(s, _parse_xen_cpuid);
>>> +}
>>> +custom_param("cpuid", parse_xen_cpuid);
>>> +
>>> +static bool __initdata dom0_cpuid_cmdline;
>>> +static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
>>> +static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
>>> +
>>> +static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
>>> +{
>>> +    __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
>>> +    __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
>>> +}
>>> +
>>> +static int __init cf_check parse_dom0_cpuid(const char *s)
>>> +{
>>> +    dom0_cpuid_cmdline = true;
>>> +
>>> +    return parse_cpuid(s, _parse_dom0_cpuid);
>>> +}
>>> +custom_param("dom0-cpuid", parse_dom0_cpuid);
>> Unless the plan is to completely remove cpuid.c, this command line
>> handling would imo better fit there. I understand that to keep
>> dom0_{en,dis}able_feat[] static, the _parse_dom0_cpuid() helper
>> would then need to be exposed (under a different name), but I think
>> that's quite okay, the more that it's an __init function.
> 
> I'm not sure I agree.  (I did debate this for a while before moving the
> cmdline parsing.)
> 
> I do have some cleanup plans which will move code into cpuid.c, and
> guest_cpuid() absolutely still lives there, but for these options
> specifically, the moment I add MSR_ARCH_CAPS into a featureset, their
> bit names names will work here too.
> 
> So arguably {dom0-}cpuid= don't be a great name moving forwards, but it
> is is absolutely more cpu-policy.c content than cpuid.c content.
> 
> We can't get rid of the existing cmdline names, and I think documenting
> our way out of the "it's not only CPUID bits any more" is better than
> adding yet a new name.

Hmm, yes:
Acked-by: Jan Beulich <jbeulich@suse.com>

>>> @@ -149,3 +716,188 @@ int init_domain_cpu_policy(struct domain *d)
>>>  
>>>      return 0;
>>>  }
>>> +
>>> +void recalculate_cpuid_policy(struct domain *d)
>>> +{
>>> +    struct cpu_policy *p = d->arch.cpuid;
>>> +    const struct cpu_policy *max = is_pv_domain(d)
>>> +        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
>>> +        : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
>> While this is how the original code was, wouldn't this want to use
>> hvm_enabled, just like init_guest_cpu_policies() does (patch 10)?
> 
> No.  That will fail to link.

Why? hvm_enabled is a #define (to false) only when !HVM.

> This trickery is necessary to drop the compiler-visible reference to
> hvm_max_cpu_policy in !CONFIG_HVM builds.
> 
> This function is only called after the domain type has already been
> established, which precludes calling it in a case where max will
> evaluate to NULL, hence the ASSERT_UNREACHABLE() just below.

Right, and this will hold when HVM=y but no VMX/SVM was found.

Jan

