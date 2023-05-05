Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335156F7D71
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 09:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530244.825745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupUt-00032C-R3; Fri, 05 May 2023 07:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530244.825745; Fri, 05 May 2023 07:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupUt-00030H-OL; Fri, 05 May 2023 07:04:55 +0000
Received: by outflank-mailman (input) for mailman id 530244;
 Fri, 05 May 2023 07:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pupUs-0002yh-PX
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 07:04:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21ee2907-eb13-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 09:04:52 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBAPR04MB7335.eurprd04.prod.outlook.com (2603:10a6:10:1b1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 07:04:23 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 07:04:23 +0000
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
X-Inumbo-ID: 21ee2907-eb13-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmTA99hTVrFpkt8kVePZKrhUs/VB+A+dj/1GH7NkQX31EWjsRvkh6V9gAr/XA/rYZczsBGGfxQsqTPtaEOKXbhXcDbjqO9KInUcIyXgK3E+sb01nA+7t+zxPuI/Hb80/y9eNFwZ4tReFsOjU3pZC/842dUwpE+PtXXQq0xcOReApcaSUvbmS+f2Vo5rcjDCKHa6xwR0f8rbUWLDodgh/O4HfCFEqydbvFAFbgskTm9ECMpLUyMWh+9ww+fGBtRKUBeMQvZzKiAMOnYsMCdYSZhauQtaZrs14mwJnbZt84uuBsso+z/DMJpihiSOT5bwVuNm4VpGh5bcTuXnPIvOSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3O0K/iRk1u8q9x+Hqf1l/IJHKu+M7pGBN80sM11F79g=;
 b=fLiwg3zesP3iNtNzzmWw2c8ufNNlwrtT2NJbRPbLwBoYKWewL/UWA5gyAG3xctVG4gQI6xRnb1JUspIfg8XGkXSeIK4FTeQQiENbL7QPAlfvBkI+AdO+YHrbQQ1EEgtzhQZG9Nt3ZXhlV3/+fLJftfvcB+OvJmgD+laU4283VvBnSWVQxBdnmrXEgEqMgM+C6iCGNCuaMelg4tJ3n3iexZ6SfzAqD6Q9WlsaZYmuSCtVE5DhE9yA0COCfcoKz+ysSCPW0I1uhp1My3KWTk6lwltRk7zs0MUY0l1URLDsdZim8Ia/D3cGcZHFv4PomfFsJyq/LqLX/ubneLSTJSGjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3O0K/iRk1u8q9x+Hqf1l/IJHKu+M7pGBN80sM11F79g=;
 b=NxmrwjycbmcfRztSEjVjIH21o5VlWGMvKCk0FHq6r3kHUlYtPSCAT/lAz5iahIf9THM/UoZeqdtxAOaPkAfpaBo0/1wJ/nqGYYA5cOATBf/BgZqiYsR0B71pH8x3Ql8yT58qQz0f7eNyH5OaPNgk/y7BIHjO3xf4pR/5+jPu6FxWxUXh0Uyo3yUpdFpXzvaAdxm25LkOvx3h02JcI0phbPIhehHJLOZVNPTsn0diNgKSm9QIEhZPn1uPFWJ/L5VUlgDuwqkW6jYjaa81e5R+gCLEyWNcm7+Wn/UbEajWgojf+eaz+JGcACwBVYOwLN+neUjizr6KTzXXR1Yf9EXIKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe991a0d-53ff-1b16-02b4-85c0332467a1@suse.com>
Date: Fri, 5 May 2023 09:04:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 05/14 RESEND] xenpm: Change get-cpufreq-para output for
 internal
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-6-jandryuk@gmail.com>
 <2864bf57-88cd-6fce-2d38-6f3a31abb440@suse.com>
 <CAKf6xpshQ=6kPHtjpWqNUiaBym2uEXt=reY0Kd0VoZgxuE=LxA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpshQ=6kPHtjpWqNUiaBym2uEXt=reY0Kd0VoZgxuE=LxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBAPR04MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: d577a2da-ccf3-4788-acc7-08db4d36f4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fjZ0HNvntrF8zmpRZbroLjO/B3uq8m6bQZOaMc5n0ZKz7Q5k4cXzMKeVPoKjLFI9ApO7Qev1aAJx5uK2yml1UJjv1F4WH2KCOId4XR13l8oGtbcJt+/mFCxX69Wrp+qvkc3XFvDmqDZ3eGr/FrTOFzGV6xhTztQNWqq+1pvB1Xk1cDrSk6Bac7a5JAx4JruM9aQFui2HXFNfVjhOzZfWsu5HKBnbMpR3aSndcpktRBWBF2lzyu59f7t++kngS3YWsntRCR6VF1fgk+hi0wSi2DWGSETRfJFQI7gtNtY9yVfzZFxovnlDDTTKa47edakiyxdo5FhtirJ5VFPD9/EjQlMoscyL1LqLXEfN3peC/35cXlV9KwNIf391AgXZcCRwRDxFJxnDIFzNkj7jgmpe2f9lxJ/BwyqXuK4JRc7rRDHoCYln02wHj3feSTtdUHob7RFMIvVNe9APyz6UdtLXmchcXlBDculoouMN6DxP3wRcNel8Irsxzu5UQ+x84SDsy0M0YM8PvuV1XU1FMwUeoDrbCGrbBwZz349FO6SFs4pXFbGRGkn3piTTrBFB9xS9778TpT1aDsq2/YUY5B+qrh3BXFHCtg0r9ve5IWS48vJolKJmXQhJrkxs3r2LNX39U6gcyje1Wpilyq1s/2c+Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39850400004)(376002)(366004)(136003)(451199021)(83380400001)(2616005)(186003)(2906002)(38100700002)(36756003)(31696002)(86362001)(41300700001)(8936002)(8676002)(5660300002)(966005)(6916009)(4326008)(66556008)(66476007)(66946007)(6486002)(316002)(31686004)(478600001)(54906003)(26005)(6506007)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS9MWXg0UWwwZ09lS3lTby8zMFYyNU5IWmFubE02cHVzMkhzdlRsWmF3Q0Z4?=
 =?utf-8?B?dUErL09iTExPTEV3YXZIV2h2OVVHeFdYVVhQd1VkODNnUEgyU3dkRC9CSGlV?=
 =?utf-8?B?bGxSd2dFQzlPaEQwYU0wZGFEc1ZNZWxVVkdxaUJUdGQxR0hPdC9KZGlKSFk1?=
 =?utf-8?B?VUhvc0FMSEN6Yyt3MGpoT0l3YWhkZ01Vdmo1VlBIWFRGRTFNazAyY0RMVXEx?=
 =?utf-8?B?dTVSZm0rcTNJdW1nRFEwTHZlaWVDSnVZOHpzMGptdG9vcHdESzJrK2V6YVE1?=
 =?utf-8?B?RU1WRitjclRBT2dSWjZUeU5tZ0M2b3FQYnZPaE1sejFXQ1k1MmRZOC9xTVA1?=
 =?utf-8?B?ZjJVYUowQkV5Wi9FZGhmb2xRWm1WN25XcUx2OUZZNDZ1TWtiYVV5d3FTRW8y?=
 =?utf-8?B?aUphSGdwQVIxQUZ4dTZRajNQc2tzMHY3ZGRJaitENzhhdVV4QjNEY2dQTUI0?=
 =?utf-8?B?WHhpOURXMnhiRlRpRTVnSjZ1N3ROL0ZUam5LYnNCaGpEVVdmWm4xL1BrMFFX?=
 =?utf-8?B?eWg2dGhxTFlSdlZXVGFtVFBxUUhBOXNFUFdjNmpBdDRqRGFYR0pKRVkzdkQ5?=
 =?utf-8?B?UWtwUVdPaFZkdXdESnZlYnpRMGczMzNrRUxuVEdwTW9mRTBVaEZLbXNwVHQ0?=
 =?utf-8?B?bUFmdVp3OW9wUk53U3NjSjdxQk9XRnVDKzJveUdNTSsyV0xwdEJPR1ZDSHla?=
 =?utf-8?B?bFlkMkl4bmlHVUJwUEdGZytGUyt4ZmRvUW5EcVBxb1Iwb3lKOFFSK3YxRGNM?=
 =?utf-8?B?RXhuR3k4UlI4V3hRV2hrSFBkUnlXSytQSlI3Qkc1cTdOOHRMbHNCUUNBQjZr?=
 =?utf-8?B?NFJRckhDNUJvQkkrSytvZDhDK3R4cVF3V0hhTzc2dlVmYXBQeXo5dE4yVDRj?=
 =?utf-8?B?UHpVdmJBbk9rWjFQdmlraXN3MG0reW1mWVZZMy93NFBoNFI4U2NGb280dERz?=
 =?utf-8?B?eE4yc3RoSTFQekRuSmV0RDh4UHNvNUxJOXFqOHNqdFRJb0dLZHRzVVVqZUFP?=
 =?utf-8?B?TUw3dm9oY2Y5TVR5K0I4VFp2TWVPbHNXRnJXRTZkUnd6NTNlaFFha2JER2lj?=
 =?utf-8?B?RkZ0S2VUTVJKV1lrUkdLQS9Va0MrYy8xcU9Pa0Z1MG5VTEp3N2dPNWtrNkhp?=
 =?utf-8?B?bTNtSS9WcFRMMm1UL1hsTWFUWHVtVEZjcTlNNkM5NDh0eGNLTFFtYnU1UFVU?=
 =?utf-8?B?UjFPVGZMMHVHa1ptMlB1QjNlT1pucTk0QVlKaWVoK3ZjNmxhc09DaHBEOEM4?=
 =?utf-8?B?VGs0ZW53TGVlb082elMwMms2NDhFMkI2VWhqQk1Ub1F6UE0xR2tZby9CWjVT?=
 =?utf-8?B?eDFUUUVzUXJuM0pWakR0b2R6TGt0MWRBaGowQit6MnJiUjdPWnU3czhFL2hs?=
 =?utf-8?B?ZitWQU16TnkwdWtwK3F1UHh0alJMSDJHczN0TXl2NUJmNDVvdXhkYnBCb0Zp?=
 =?utf-8?B?NUcvZ1dOeTZTOHFFVjZqSUpwMzMzd0Fzd3hSZ2RpclE5WW9hWFlSb2U0L3Ay?=
 =?utf-8?B?dEJUUFU2TG84OFVqTG1abkVES1V5eTAyNXdPamRXME5BNXRxMmYrbzZRZ3Iz?=
 =?utf-8?B?bDhZUHk0Q0RkV3FUMGNHOVRTdlhrOFNFOW9FZUpna3VGcnMwLzJLR3BSRFQy?=
 =?utf-8?B?by9nVU9uc1NCdkYyajUvektPQVMxSHIzcXhhK1k2ZUVBa2gzNUx0RUtBc2lW?=
 =?utf-8?B?YWYyTldUOWhra3BjSXM1Tm1lRTBSbmh5R2ZTVW5teWxVYlV2NDFBVG5yUjZl?=
 =?utf-8?B?ZW0zSFRJQjY3enlhVXlmYzFvcS9FSEZzMmYyK1ZYYThhQWJPRisrb0d5Vk5D?=
 =?utf-8?B?M29nOEJJbVl1cE1QNGpvRGNVWTRQQmozbzZFRno5aXQvcnU3a1o4VE5CTytt?=
 =?utf-8?B?ZjZRY2xva1RJc1lLNHVSU2lsUUlLVWRTRnYrV0hObm9NVTZ4Q2JwNGdqcHBw?=
 =?utf-8?B?eXlkZGFuV0FCZVRQbGRwUTNvMGRLeWVJUy9kMlo4OWRvMGN5aVdyS1JJaVZm?=
 =?utf-8?B?UWF2RytZRDBZcnVTK2FrMnppZE84NEZ1SVo4UzU2MUVtakRzYzdMeHBLbFBt?=
 =?utf-8?B?ckp3bXFFZERUZTV3cElHRVk4SFFxbTF5SGlxck00TnlwSjlHL290MXdlakN4?=
 =?utf-8?Q?fMdOhYfWww+kxTeyFur13EwgV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d577a2da-ccf3-4788-acc7-08db4d36f4de
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 07:04:23.5865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vxry6/KsYw48na1RrhI6kgJORQPkl9uuL7FuGklwCbFMemvCu98Z6FM1iRXdQoyX3fqClPH0D8nNd3MwUtEgzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7335

On 04.05.2023 19:00, Jason Andryuk wrote:
> On Thu, May 4, 2023 at 10:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>> When using HWP, some of the returned data is not applicable.  In that
>>> case, we should just omit it to avoid confusing the user.  So switch to
>>> printing the base and turbo frequencies since those are relevant to HWP.
>>> Similarly, stop printing the CPU frequencies since those do not apply.
>>
>> It vaguely feels like I have asked this before: Can you point me at a
>> place in the SDM where it is said that CPUID 0x16's "Maximum Frequency"
>> is the turbo frequency? Without such a reference I feel a little uneasy
>> with ...
> 
> I don't have a reference, but I found it empirically to match the
> "turbo" frequency.
> 
> For an Intel® Core™ i7-10810U,
> https://ark.intel.com/content/www/us/en/ark/products/201888/intel-core-i710810u-processor-12m-cache-up-to-4-90-ghz.html
> 
> Max Turbo Frequency 4.90 GHz
> 
> # xenpm get-cpufreq-para
> cpu id               : 0
> affected_cpus        : 0
> cpuinfo frequency    : base [1600000] turbo [4900000]
> 
> Turbo has to be enabled to reach (close to) that frequency.
> 
> From my cover letter:
> This is for a 10th gen 6-core 1600 MHz base 4900 MHZ max cpu.  In the
> default balance mode, Turbo Boost doesn't exceed 4GHz.  Tweaking the
> energy_perf preference with `xenpm set-cpufreq-hwp balance ene:64`,
> I've seen the CPU hit 4.7GHz before throttling down and bouncing around
> between 4.3 and 4.5 GHz.  Curiously the other cores read ~4GHz when
> turbo boost takes affect.  This was done after pinning all dom0 cores,
> and using taskset to pin to vCPU/pCPU 11 and running a bash tightloop.

Right, but what matters for the longer term future is what gets committed
(and the cover letter won't be). IOW ...

>>> @@ -720,10 +721,15 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>>>          printf(" %d", p_cpufreq->affected_cpus[i]);
>>>      printf("\n");
>>>
>>> -    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
>>> -           p_cpufreq->cpuinfo_max_freq,
>>> -           p_cpufreq->cpuinfo_min_freq,
>>> -           p_cpufreq->cpuinfo_cur_freq);
>>> +    if ( internal )
>>> +        printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
>>> +               p_cpufreq->cpuinfo_min_freq,
>>> +               p_cpufreq->cpuinfo_max_freq);
>>
>> ... calling it "turbo" (and not "max") here.
> 
> I'm fine with "max".  I think I went with turbo since it's a value you
> cannot sustain but can only hit in short bursts.

... I don't mind you sticking to "turbo" as long as the description makes
clear why that was chosen despite the SDM not naming it this way.

Jan

