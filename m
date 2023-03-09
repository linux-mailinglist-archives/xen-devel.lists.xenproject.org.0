Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DBF6B236D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 12:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508239.782711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paEmx-0003Cy-Ka; Thu, 09 Mar 2023 11:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508239.782711; Thu, 09 Mar 2023 11:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paEmx-0003Ak-HU; Thu, 09 Mar 2023 11:50:27 +0000
Received: by outflank-mailman (input) for mailman id 508239;
 Thu, 09 Mar 2023 11:50:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paEmw-0003Ae-RP
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 11:50:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93d304d3-be70-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 12:50:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9232.eurprd04.prod.outlook.com (2603:10a6:102:2ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 11:50:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 11:50:20 +0000
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
X-Inumbo-ID: 93d304d3-be70-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDYE8aS0BMC06tygulo8EYwI5jZZUS1ne1dDIowKXAGfhnDCpO+78wRv38YnyPsQDsWgf/g9Rr1ZRMj0eDz86rR5Xva0oSHrydwYEaKjREs4JAfqczmGz1xbqxJNLeq1wy4Peu7HkSpI93I83CxnT1hoZx30KodOf9tlyV6jSiHB09fMbgeu7YCKSa0yct00j/TmvQnFERWp0CGP7dsz97vlpbiPppHNF1olXdl6oVjW99JkOnytD27/luAjj14P+s4BSlXVFdouddXzK1gq45WMRDXu64Wxz/+s+voQr6ZavIobMfOJDJpc+EBpXoobvxQUF1YbBXcsORVeyUIl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhTy63ilfnHNvv7Js3SFg4IEG5X6YAWJTFYXUhxEUVM=;
 b=IWKTE5HwwlBZJzgmfn9dABwPZvQOlBQGX9bZaDIyF+zoRueLIzsf50gMjc8ojH/ypUsMcfcp8PBJYdjEIzDk5UBM7lPWZZu7CnjS0zH8tj/Mnw5le5AWwWgJ1eVvE1Cx5oThkDBSqzjXmbo3oueCJnTGU8aI3+N2gcA61wnhahTNpwI+iP7+fXpU2bEmAYaLut0FamVJwaeeZbgrVWbkCF0ffQzccUAN+qzWMbi2LUuM+Y6z5x0M3xgkX+tfvgcdh/CuRYNYPMefnOJgtl7kKykc/37T9nyyDkhCXl7kG6aqeFDv+/hJvFnOssfDnOYlvjkB7QlFxPPlx4WMx/K84Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhTy63ilfnHNvv7Js3SFg4IEG5X6YAWJTFYXUhxEUVM=;
 b=RUGlZygNWSHvNt8Lmi5NQLRM8rWTRYkWi0nUX843EaikKNIIPX+eX8wX8BPUlAmi4zwMuNv/LdURwNxxP7RfIR/j5EGqW0fZdGDmaG0GlCQ0RumDWc4o7XAbCUpGB89v5MRKsMMA0QU6O3h6J/M4G3ss2jum2zTs1XYU43chLCveTL1XKn2LnBuK8zx9aJvYFHl96AWQNSF8gsKobmpovoOnLMz6YgotVYwvvDKp7n1ahkRbFIk8xqZW/jObLuT7mYpDT4VKA9WflW29S9UqA96RacKubcRGwANFFuneSvMBHcDGT66AZep7WcllepZaFgE24t+NuARyPxqPfF1IhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <645fcd9a-755a-e2a2-f332-93c5e571b9e5@suse.com>
Date: Thu, 9 Mar 2023 12:50:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to
 query vcpu statistics
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
 <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
 <20230308115410.GA1108824@horizon>
 <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>
 <20230309103825.GA1221165@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230309103825.GA1221165@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: bf62c889-aacc-4cbc-1e3b-08db209475b4
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HORHrsn5g8ynEvTVpyPZtWYMl6d1KaDdUz5j4zx2jTHoGwphj/sfUlBuQvTPsswSpubBPl8FR90voOL5iLjkW+TX2U4SMgvKjZoFnyCOpKsODaRhWL5NpUBCn/8YWzURZRG7rUwHjg+qnJhbSkmHEo23o+NG5W1lx2HC+J1xGgFU9VkwDAoNIq7QdXVxBViZ6tuqtsFvEe8reEZ+ixa+10VQJ4YYFYjCEG5+//HZljRriEwr7H0gFkDJvibzJWgMcIV49GgNlTOUwkZ0wfvbvF8kNGTQ0z7grr0H9+eKJMha7439bKhxTU8A99PIw2igGHzzrIdDhOo3q5yBPjrTxFupr96bkcUWOWUaARDNRmzbEc4CQzgiRyR0q7z9eUkBaZQNyz7xRIGshd7E+eDu0nI2O5/yKWioSMsVHOcMewO6x9vdu0nAvLxeviSgMug5x+rutSNY7WYWSauYUs/TFdg6hwOZta+ocWi4sihX/rra2gGLtOIiSCVY835rS1oeyuM8P+x4TjZfS+qP3uLw9TvA8i6h7pYOv9AKKAEKbNWnYQ+hW8Ck3R3Ktwt/4Dzt0T23nFgkk6yMRS9CoIYCpBjVnITVF0GMqdILlkZfFW+ndE3qRxegv6alqSfUvIi114uyK/zqf8fzo8VafGCH/p+l25qLa1juM+Kk2Nv4jHY/SpCeSgBUutWusN45TvBrtWhFcH/LIvH1K1XMO1fAdDMBH1ez9i7RROhKL9xpe5c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199018)(36756003)(8936002)(5660300002)(7416002)(26005)(6506007)(53546011)(38100700002)(83380400001)(186003)(2616005)(54906003)(86362001)(31696002)(41300700001)(6916009)(316002)(66476007)(66556008)(4326008)(66946007)(8676002)(6486002)(6512007)(478600001)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlRicFZjTENvMGhYS1VTK2FGVThKOGFoSDR2NHpKSm1HbmdLVHpkOSt5TmZ6?=
 =?utf-8?B?V0NrcDRaMUd4S3cxQ2VKaGJMWG5YSFZuSHIzemRQT3Jtcmwwbk9NWklCTjRQ?=
 =?utf-8?B?Qk1xUnJYREkzSmVmNE8yZTlwenJvZ1JiOEFveVNpM1NXWGNPK1ltOGIrR29j?=
 =?utf-8?B?djZ6cGxLSUY2N3JKNXVtYWR2ajZld0tPZEUzT1R1Q25WYnpHVFliV3BlM3U1?=
 =?utf-8?B?RkZyTEpuRjBHQzdFZExrL1pGc1B6WjNYeitsUS9mQWZiTU9RVjRTUFdnMmg4?=
 =?utf-8?B?OGFhaFZTclhKSktMcGNyUlUyekVoRjQ0SkFRYmphZitsTVFtZ3pNUXBQeFJv?=
 =?utf-8?B?MkhiM3ZjSXVsWWhqeGpYcU1HTWxBL3RkRVE5cUUyN0pzR2VCNXlha2RsUUdQ?=
 =?utf-8?B?MTNJV0dhZHpCRFhvemh3cklYQlg5aHV0bU5rdHpucmhITDNmbi9KcUxWSWtJ?=
 =?utf-8?B?K3d4U0VleHVXUzJQM1BZQk5HNXNaQXB2OXF0VldJeDg1QlQ2enRLMUk1SmJL?=
 =?utf-8?B?djJCZ056b3VUNXpGOFlLVkFHdVVxT3dkZHZ2MGFuMS84cmZnd25zRm9FUWpz?=
 =?utf-8?B?RStKN1VVeWR4T25QQWdjVGs2YlhxOHpRdjR3cnNESzdpN3R0Tzl6RUJyZ2tL?=
 =?utf-8?B?cXB2cTVyT3U1VjRtckFWYnhBVm95TDVqL3lZbFlqVTBObU5jK3lCT1JFZXRp?=
 =?utf-8?B?VmxqVnM2QWZrRHFaaXdSSW43SWp3TVVCWTFYYlM4WXlpZEQ4eUxZM0dzTVZK?=
 =?utf-8?B?MjhTTnBEdnV0WlRhVm9ob0RNYU9CMVVyMEJ4SkxxRE5ub1MzTlNaNGhlWUhk?=
 =?utf-8?B?M3pxd01kcm5iUEhveFNhTnB2L3hMdmpON2RRM1Niait3MWVzUURwT0tsbWVY?=
 =?utf-8?B?d1pMdDlJMnVWY3RLUDRXLzBHWWhQdFBVRXRkcHlZUUN2SnQ3QWVJc2ZwY1dS?=
 =?utf-8?B?VSt3aWR1S2FhQy8zTGNWdWt2N2RvNldLRWZiQnJONGJkRHRCWGdoWFpRRXRj?=
 =?utf-8?B?STljbFBuaWlUT0FtSkpjVjdtWDVSVFg5alZxS2V1c0E3UVg2ak5hQVorZTZu?=
 =?utf-8?B?aDMwV3lkSy9oVVh0cDZvRWM1Y3A4aFpLOHFlVThybVpCa1lmTGx3S2NjOGdi?=
 =?utf-8?B?Rk9UWHhGcEpjbkJEY3hsS3JXMjhtNWtqSGhZMnVuSklrekVwRHc5QjVvWFZh?=
 =?utf-8?B?SUc5T0VmalVWMUZmUEhwaGw4YU1YWk53aC9sN0RybC9iZU55V0FLeDdIODZu?=
 =?utf-8?B?cE1xOU5kQXIraWluNDRRM1hxT3RJQWp5SXY5RXE0K0U5L2wxaDNiZUV2ZXR3?=
 =?utf-8?B?a0pxbGdJOG9YMlRpYWl3UnI1blpRYXJJY0V5WlpGM2pqNGlhTzJ0ek5rUzZI?=
 =?utf-8?B?V0JqdC9iOFRxV2xLRU50N3l0QTNDYWJWNkx5QmRQVU9iaUVLK1ZSa1RBOVlW?=
 =?utf-8?B?cTF1OGpNaXZuTE0rNEw1UE1Oem4xZFpaZFBGbXJSb3ZabnFvV0hkRFV3ZXRM?=
 =?utf-8?B?d3laei90cW92blRDamFtamRnbG5HWG5hYnpmemh1YzRaUGRPZlRMcnNLRmly?=
 =?utf-8?B?QlJqckpWOVlyOHBEeHh2UEdjNWxKVmIvRHVUc05xWW9rS05laDVrbm9lNHBI?=
 =?utf-8?B?VXFMckt0eFVkNC9zckJlcVZxelNsd0h5WEFDSkdHNTZZSWhhWHJENnFBRDJL?=
 =?utf-8?B?TmlJeE1VaHdqdmtkVEUrSGVkbEpkRFJXRGtwSnRoVDlwZllSSGtWT2QvczV1?=
 =?utf-8?B?eHJOdGxack90Q0Y1THVTdkNEdU1LZUQrRUtNUW5yM1NhcStDZzAvbnB6TWNV?=
 =?utf-8?B?SW1nbGIydEN6MHJRcHhHVDRJQjFnVkJ1U3NTaE5DcXR0bm5PRDRzNTFmcjln?=
 =?utf-8?B?K3FSQmphMU1kWnJNNnczOW0rcDdRMmp0L3l5Q3N1R2dqVlYxWXA4MVQ5V1N0?=
 =?utf-8?B?OHcrRWl2UzVqVWJ0UVJqaFdXN1VQTW9tMkJpOWdOalVsZWxMZ29rOGtEVnR4?=
 =?utf-8?B?VXV2Q0hxU0ZyeVlLRnpxMFNlekc5VFRyWVZVbWgzVHdwNnkraFhYRVJhVDcx?=
 =?utf-8?B?NER1cXBscDJpSTlnQVZQVHNaVTJWeVEvQWcrNTkyNW9WbWFVSmJnS1F0UHJu?=
 =?utf-8?Q?Bnc6kbvldBe/juqh25wQJmSL+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf62c889-aacc-4cbc-1e3b-08db209475b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 11:50:20.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekXAxTKlJcMGOlgfiaXtPiDPhiKKTI5eOpvVySLU4LmjQF++DeWVeU2l+YN20A8RtkezYoO/k58g6wsWfamcZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9232

On 09.03.2023 11:38, Matias Ezequiel Vara Larsen wrote:
> On Wed, Mar 08, 2023 at 03:16:05PM +0100, Jan Beulich wrote:
>> On 08.03.2023 12:54, Matias Ezequiel Vara Larsen wrote:
>>> On Tue, Mar 07, 2023 at 11:12:00AM +0100, Jan Beulich wrote:
>>>> On 06.03.2023 15:23, Matias Ezequiel Vara Larsen wrote:
>>>>> - Xen shall use the "stats_active" field to indicate what it is producing. In
>>>>>   this field, reserved bits shall be 0. This shall allow us to agree on the
>>>>> layout even when producer and consumer are compiled with different headers.
>>>>
>>>> I wonder how well such a bitfield is going to scale. It provides for
>>>> only 32 (maybe 64) counters. Of course this may seem a lot right now,
>>>> but you never know how quickly something like this can grow. Plus
>>>> with ...
>>>>
>>>
>>> Would it make sense to define it like this?:
>>>
>>> struct vcpu_shmem_stats {
>>> #define STATS_A (1u << 0)
>>> ...
>>> #define VCPU_STATS_MAGIC 0xaabbccdd
>>>      uint32_t magic;
>>>      uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats) + sizeof(uint32_t) * nr_stats, cacheline_size)
>>>      uint32_t size;    // sizeof(vcpu_stats)
>>>      uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
>>>      uint32_t nr_stats; // size of stats_active in uint32_t
>>>      uint32_t stats_active[XEN_FLEX_ARRAY_DIM];
>>>      ...
>>> };
>>
> 
> The use of stats_active[] is meant to have a bitmap that could scale thus not
> limiting the number of counters in the vcpu_stat structure to 32 or 64. I can't
> see other way to have an unlimited number of counters though.
> 
>> Possibly, but this would make it harder to use the interface. An alternative
>> might be to specify that an actual stats value set to ~0 marks an inactive
>> element. Since these are 64-bit counters, with today's and tomorrow's
>> computers we won't be at risk of a counter reaching a value of 2^^64-1, I
>> guess. And even if there was one where such a risk could not be excluded
>> (e.g. because of using pretty large increments), one would merely need to
>> make sure to saturate at 2^^64-2. Plus at such a point one would need to
>> consider anyway to switch to 128-bit fields, as neither saturated nor
>> wrapped values are of much use to consumers.
>>
> 
> If I understand well, this use-case is in case an element in the stats_active
> bitmap becomes inactive, i.e., it is set to "0" in stats_active[]. You are
> proposing to set to ~0 the actual stats value to mark an inactive element. I
> may be missing something here but would not be enough to set to "0" the
> corresponding stats_active[] bit? 

The suggestion was to eliminate the need for stats_active[].

Jan

