Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09D79DFAD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 08:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600958.936817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgIxT-0001AR-L6; Wed, 13 Sep 2023 06:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600958.936817; Wed, 13 Sep 2023 06:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgIxT-00017J-Hl; Wed, 13 Sep 2023 06:02:39 +0000
Received: by outflank-mailman (input) for mailman id 600958;
 Wed, 13 Sep 2023 06:02:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgIxS-00017D-4k
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 06:02:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2338d4f7-51fb-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 08:02:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Wed, 13 Sep
 2023 06:02:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 06:02:31 +0000
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
X-Inumbo-ID: 2338d4f7-51fb-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu7qUIDpFmevW6Z8RhGFXym7dsoWXAUQjW04GrfndyZHLRfbafZuw9WpP6XxZAYnPCFbBr3imLuiZpullXpHkmJLElf0PCJAi8B/mck8yWy958l+LfU8iai4emWJXcgIA3IkCwbT83KGUS2/dqTL2K5xZHnx55YUWpSfWvifY0tAuwWLAztBm/npkrHYrisi9rFLSOulUU1zp5h/SpgnfvfZBkUSwpgumFAoExIMnpAAndVVRSkxoBGTBo5StKCX0X4KHRixRsX90TRsLq9F9JoSmxSW087yDq3gTnBgRqfDI3ubNdzeR6vGYX/NXsY3193NnVhKj8L3LIpnfkcEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k5ka4Rd5oGj/IiMM7fslevP2QenLXS6Y3xO8jqJvWA=;
 b=gL1YQQFjVTuihlKQIKCRKRePyPYtxr1rPYYzv9cjDzO08kEalDpbL3vLrnm2qNDKx6CbtVFevAV9ArtzkwBTltoekkl8rF2blh8UhHxQ1XGQUZMq+OKD6cfvQbZqNV/WognorpXcEuA9FUH01M3AoKdZQok/Y9EhnG7vnHa6jKbttzNHvH8prRJA2z8Bfr6HjXXLpecCZzIVWTXdzAyNU0ckGR8b0sPUZXspUXlP8+vKvIeqqyiZTFOG+gl7BkXRf4JTFZqxXVD8E8rOHrATBSSTMIeXh7wXwzmnljrB2N99vMYRszJqLB1ByN/SDC7CMlVyNw4UfkbPk5zKIPfydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k5ka4Rd5oGj/IiMM7fslevP2QenLXS6Y3xO8jqJvWA=;
 b=vCvU3olmsKx/J+xmY/wZtniQeNTI0gpBKLCzrKXh/fdA6D0Iupw7PJDw7UzCWla+27vsw7BqHEPuNf9kMX3eOExqcisgmRtjCBhA8d3/uhVuCVn0jDGs/mE4a+5TnzsEtw08ux6jN0x8D5cjg94W6zW96KUR/CEepZ1wbOP7sWJUeLF9vkJrt3mj348EqwL4vH5UPpy892iSHdxvEWJJVCKNc6ZO0ynvbtId+qXSEgzE6Ovg4xRHX/1XvGSDJmXTnEQAoP+RSyInuwKl3yoLfRNJycfZAAZkpqq89gM9BhHJjc5xmPE2Jaqa57eWzexuL88SchMeX4c7U6mTYlGh7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d98425e-b66a-8de5-4eac-fc28212bfe9a@suse.com>
Date: Wed, 13 Sep 2023 08:02:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/5] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <7ed453323033a759427da33cea7d18ddca247ae7.1694211900.git.sanastasio@raptorengineering.com>
 <93f4a2f3-b98c-332d-64a6-9e34cc9dddf2@suse.com>
 <7d3029fc-1188-3c55-0a54-bb9899fb91e8@raptorengineering.com>
 <07f75b80-1579-25ec-ab64-cbc1f2ff15e1@suse.com>
 <c155907a-c5b5-a3fa-f9f8-f68ec51a3c87@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c155907a-c5b5-a3fa-f9f8-f68ec51a3c87@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebc52c5-4024-4842-fe81-08dbb41f0494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K/PYg5a0DlwkO0M3AkCbXimRENK/WxZb6I34kcWLZpeCO4lQ7DW9+nRt8r1rDzvDwRDmURivqH0q/sxaLAINfZZeIoJiquszTfgSV4ai+UX67Hg0WgZIAyXuNLyE/zqColY7+HmA+twB2kpESGKNopLpSLZGh707yWZu5frycyHOKAVTHqfwLH2A/U66tODrpLsM6GqUMMO1ZWhf4ayiJ3l6Y80wmmIn0bUodns7tj7kE/kqVTGV9n4cvbHchGN+l3UFLZS8EA6hqgVMLh+U8vmx0r5D6bVVR/qIPQxaSnq1dVgn1hDmISGA0DMlSoX7FauBFz5VrSfuOvkwAA26PmPwrCAufHTByHCTrZCKvcf7Bfi/h9nVMYnpS27CF7UllmylXHyXm9REHPQf/41Ka57kkJVsi4aPOA/RnIbtQTTPJ7tMD49guRzfiD+UxB3TOVuLUkZGy8slhjdbqg12dHBDxDSWEnI2MfIhB7wOac0vdTcA7K/Ka2SXNGygiMtwYIVvZrJEcbGxs3LyjLkJSlQ5/XxtxwsACnaNDUY/hVdH8dn9FBtXd+SsdLIsvI5GH5Dnea1v7wzDHspe/AwfZJJOTPf89paATn6y+whfbzzL3xdH8FyGi03UDz/YGGdICpWjgfj9X103dbelffOtjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199024)(186009)(1800799009)(2906002)(26005)(6916009)(316002)(41300700001)(66476007)(66556008)(66946007)(5660300002)(478600001)(8676002)(4326008)(8936002)(31686004)(6512007)(6486002)(6506007)(2616005)(53546011)(36756003)(86362001)(83380400001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG5vZ3RjVUVZOE82LzlzbVRVVk91Z3RVWnRrN1VPcXRZV0NhWjJvb2svUUF0?=
 =?utf-8?B?MGpzRzNUdGtRQmQyV3djNWQwZ1huOGVQMXNoVDdYYXpqdlc0ckk5emlqMEhT?=
 =?utf-8?B?UkU5QjF5OFZHUXFkN1ZpY0dTQUdXeHQxZ3BuYXFFQmxYKzZhSTAvbjB5L25k?=
 =?utf-8?B?Y08zTDRFbmRPR2FwS3BrYzlaQkRiMDhQZnpLRWdjOFBOUEc0aEQ2UUdOYVls?=
 =?utf-8?B?a21NTlVCQXM1SFBQMHNxY3owOGVtUlhVTThzbTB6NHVwSitXUDNETE1ROXNJ?=
 =?utf-8?B?N01weWdvY1NiREoyQ2RRVVRrUDQ2b0ovM0ZZNllSWUFOZ3A1OFVUellIK1pG?=
 =?utf-8?B?SS9YdmpTcElHdFVpNzFoc0tKQjRNWVpWT0YyNzJXaS9UekEveVdpZ2dPL3pq?=
 =?utf-8?B?cklkcytPSVJzNXBWYnFGV2l1ajJtMWJFbmwwSFh3V3BrTVlFRWRwOGlzeThl?=
 =?utf-8?B?UUFJVWJsMVJXL2swRWpNdHpYWlQ5SStoQ0dNT1ZIdlc1M0F3U1dRTDVnVmpF?=
 =?utf-8?B?cm1UcmhVVmRkVzhraHZ6ZFUyQTM3bld2aHZJblZPZkJ5MTl1RTVHb3FXQ1Zw?=
 =?utf-8?B?cFRRRXlvSmR6bGVFTjBEU0s3SjJlRWdDSmJ0QUFsN0tIeXlhVVNnUmJuT2dk?=
 =?utf-8?B?Um5JTVM4YTFkeXZUUW1vWUpuNXBpSklOL1NlOENJbGhzUWJ2cU5MT0QzdFJ0?=
 =?utf-8?B?WUtmS1NpN2xQeDNRY25MYXl5VUtBVklrSUtoaWEwTkQxWjhTTXljV3VmRmU0?=
 =?utf-8?B?MzM1bUcvazhudnM1eTl3Y1hTU2FEUWNGemRlaHNKYnJ2QXFaQ3pST0ZHQXJV?=
 =?utf-8?B?T1p0UEtQNmhWaGVIdzFNbXRYcGV0QUV5QmhOODNDUjd1aTZHemNrS2VDelkw?=
 =?utf-8?B?WW9yL1NYV2xlbDZlbHZJaGYzdzI4NUVMdDQ5UnVaQTNCWGQvSzQyNTJHMUxO?=
 =?utf-8?B?bldOd2lOcXFHL3hrN0dQR2o0SDhtSE5CT1VKRHcveGJ1TlpqNERWUDdWSzhw?=
 =?utf-8?B?cnNMdUU5Vll4NGV1Q3Z3SmNpOWhDZW9WelVOUXdENHhjcGZTYkNhOForZnpX?=
 =?utf-8?B?dFJFWHA0TzRVMGNNR1Z5c2RvbG83cHU5YjhlQTcvaU9na2pxOUttQXlEdWZC?=
 =?utf-8?B?MkdVYXlpWjErRkt1bVJ4eXBmSW11NGNPTENmajN6b3FNLy9BalltazdTTDZQ?=
 =?utf-8?B?bXlIYzc3cDZBNmRjVkc2elRwRlltOWFtWmt5d1FMN0UzV3FYWmpOK1JEQjRZ?=
 =?utf-8?B?Yk1sTUpleEhKc1dpekpsRkxoT29pU2FSMHBBd1B4eFgzRVRUQWRmaW5EYnY3?=
 =?utf-8?B?aFl6ZDhHTllOVTVhamozK3dHTDdhUDAzbjhVUkE3MkZwdGk5RHJaY1BDYloz?=
 =?utf-8?B?ZWdPSmd4OGo0Wm5zV0JQeTllN2oxZUJDdmpJdXdnVGJUZ2ZqU0Iram1NTFRD?=
 =?utf-8?B?SElQb1hiWTNvT25xTXZmMjZWaDV2VDEyeVpuMzJ2emNWQ050WE5ZVHhiSnFk?=
 =?utf-8?B?MTRLOXdUWW5jRzdoM0gxS05vdDdJMnVuUklkaXRXemh3Mk0wcTloalBVeTd2?=
 =?utf-8?B?YUt1OTFZRnBheHl0ZGFXN0NNelB2dlN3VzM3VlN4c3J5bURNTE9iM0RmU2pV?=
 =?utf-8?B?eWRWNUdZMlNZV2JvT2tERnArN3NJRDh3SnRDaUcrVFRtN2tyR0EvYmY0Ykdo?=
 =?utf-8?B?WWlKZzBpTjhYZXp0MjRnYWVoUjJLVjVaOFVrK1dHOG45bGhXajk4WlBpKzVQ?=
 =?utf-8?B?bGVSZEJGWGFuSHd1LzNLTTlFYkNva3Ixb1NRb1RROU54SnlQZm9JV1Q2aStq?=
 =?utf-8?B?c0JwRWdMTmpXUHdkblZVRkY5Ykd5NGFtY1J4ME5xSFRuY3dyTTd2NjdnVkVm?=
 =?utf-8?B?RUIyYkNrdTEzVS9kclVVc3dEWDNFeFhBRXNxdEZWRm9VL2VHQ1VENjBCZ05D?=
 =?utf-8?B?TlJwY2NVa3RmQk0wQk9ENWdpWDhsWnVDQ1lZWEhzdHJxOHFXUlJCdjdpRkVo?=
 =?utf-8?B?TFZUZnhpazg1bXFkcUJqMTVXdUMrVnJrR3VkZTJob2NxL2RnK05kRmkxSmpa?=
 =?utf-8?B?ckdndVZHdmVpbERaK21RUlAxOUdXaVhiUmp5WG0xcGVIL0xIUFFWZ00rUVhX?=
 =?utf-8?Q?lDwpJNy1oGVAFCvsSWxIY2ugk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebc52c5-4024-4842-fe81-08dbb41f0494
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 06:02:31.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qraew5EfEmyvSEwK2cGcC6eIhei2DUvzzo4LSvRkqSE6gTsVjEZLSs+c7ixui+N/Soep+8uXSJM/CXzzLhlAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621

On 12.09.2023 20:10, Shawn Anastasio wrote:
> On 9/12/23 1:48 AM, Jan Beulich wrote:
>> On 12.09.2023 01:56, Shawn Anastasio wrote:
>>> On 9/11/23 6:33 AM, Jan Beulich wrote:
>>>> On 09.09.2023 00:50, Shawn Anastasio wrote:
>>>>> +static always_inline void read_atomic_size(const volatile void *p, void *res,
>>>>> +                                           unsigned int size)
>>>>> +{
>>>>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>>>>> +    switch ( size )
>>>>> +    {
>>>>> +    case 1:
>>>>> +        *(uint8_t *)res = read_u8_atomic(p);
>>>>> +        break;
>>>>> +    case 2:
>>>>> +        *(uint16_t *)res = read_u16_atomic(p);
>>>>> +        break;
>>>>> +    case 4:
>>>>> +        *(uint32_t *)res = read_u32_atomic(p);
>>>>> +        break;
>>>>> +    case 8:
>>>>> +        *(uint64_t *)res = read_u64_atomic(p);
>>>>> +        break;
>>>>> +    default:
>>>>> +        __bad_atomic_read(p, res);
>>>>> +        break;
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static always_inline void write_atomic_size(volatile void *p, const void *val,
>>>>> +                                            unsigned int size)
>>>>> +{
>>>>> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>>>>> +    switch ( size )
>>>>> +    {
>>>>> +    case 1:
>>>>> +        write_u8_atomic(p, *(const uint8_t *)val);
>>>>> +        break;
>>>>> +    case 2:
>>>>> +        write_u16_atomic(p, *(const uint16_t *)val);
>>>>> +        break;
>>>>> +    case 4:
>>>>> +        write_u32_atomic(p, *(const uint32_t *)val);
>>>>> +        break;
>>>>> +    case 8:
>>>>> +        write_u64_atomic(p, *(const uint64_t *)val);
>>>>> +        break;
>>>>> +    default:
>>>>> +        __bad_atomic_size();
>>>>> +        break;
>>>>> +    }
>>>>> +}
>>>>
>>>> These two functions being as similar as is possible, ...
>>>>
>>>>> +#define read_atomic(p)                                                         \
>>>>> +    ({                                                                         \
>>>>> +        union {                                                                \
>>>>> +            typeof(*(p)) val;                                                  \
>>>>> +            char c[sizeof(*(p))];                                              \
>>>>> +        } x_;                                                                  \
>>>>> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
>>>>> +        x_.val;                                                                \
>>>>> +    })
>>>>
>>>> ... is there a reason you keep using a union here ...
>>>>
>>>>> +#define write_atomic(p, x)                                                     \
>>>>> +    do                                                                         \
>>>>> +    {                                                                          \
>>>>> +        typeof(*(p)) x_ = (x);                                                 \
>>>>> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
>>>>> +    } while ( 0 )
>>>>
>>>> ... while you did away with its use here?
>>>>
>>>
>>> Yes. In the case of read_atomic the caller is allowed (expected, even)
>>> to pass in const pointers for `p`, which wouldn't work if a simple
>>> typeof(*(p)) declaration was used since it would inherit the constness
>>> and thus wouldn't be passable to read_atomic_size.
>>
>> But the helper function's first parameter is const volatile void *, and
>> while you can't assign to a const variable, such a variable can of course
>> have an initializer (like you have it in the write case).
> 
> Yes, however the second parameter to read_atomic_size is a void *. If
> read_atomic macro's local `x_` was declared with a simple typeof(*(p))
> then it would inherit the const and thus couldn't be passed as the
> second parameter to read_atomic_size.

Oh, indeed, I was looking at the wrong parameter. I'm sorry for the noise.
That said though, all of this could be avoided if read_atomic_size()
returned a value rather than using a pointer parameter. But that's
something for a future patch, I guess.

Jan

