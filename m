Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998236B0AD5
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 15:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508063.782302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZuaW-00078i-2e; Wed, 08 Mar 2023 14:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508063.782302; Wed, 08 Mar 2023 14:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZuaV-00075M-VQ; Wed, 08 Mar 2023 14:16:15 +0000
Received: by outflank-mailman (input) for mailman id 508063;
 Wed, 08 Mar 2023 14:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZuaU-00075G-Db
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 14:16:14 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe12::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c580eaad-bdbb-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 15:16:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7371.eurprd04.prod.outlook.com (2603:10a6:102:87::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 14:16:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 14:16:07 +0000
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
X-Inumbo-ID: c580eaad-bdbb-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQM4h+GCk/+ooMlLc38UeMDsmkJZi1ZLedq1f7ixoTyJSHHbJgEI1Vznbj6MkkdSxCfWB1KTsMKibdcHY/hOB7Q03TtkvTBHCBjLO8DM7VKFhdFe9xx7y5irULWuMZ9bbdzlcBzogr+Pt4s9/5aEKFDi0QJELsUaL1QkqKIg26gqfLpj7pu2NGCMT3nw/Ki+YzI66rT5UzHtfl81TMufux0Anpa4zwJ8Ymo0P5DGhFE1dpo4KHzbiPakpLNHHtl9SLHUGZAW69dd11l8TET4gWApZqQywBSuKdagxh8mrOHkd8w7Ja4B2S1Slp7T7Z1lQabnUHXQbh+1U8rQ8M8UhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zcg8Wvuc8zdKUwjjzmo0RL1vEPPzYPWgXYDP2RffC4=;
 b=OYcABEUruLyjAekR9RUD1JI10QJaY4bfh4qHjoVy8Gql3fGf/3wjgB0rloWm2nF7JrskNZkonOQZGXqJNISPucuIW2liPKxG3spWmG8mlIqh8X8a65S9C3PaUtC8odnNAJdp7bxIrBqTQYpV7qyya3lJ8SALvz057Dq3gu2ryFUF13fYGayJ2qFVzjxP03+8Hf/POZ54LEzzRi1lfgtB8HG8F0xYBdWJogIADmQ+x7kpi3WjyhVe8EZw3ZoHJjms7OY2otmB6TUnfGEPTkWmZyIVKjzXE363pR9JrFCBCdEUIeSlINZuwBOcBC+KaYlQDK0F9QvZtmkIKn830F3hfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zcg8Wvuc8zdKUwjjzmo0RL1vEPPzYPWgXYDP2RffC4=;
 b=iozDjavmxVV+qYDBu3iPNxQU4/DKJn3D9w9Rlgq4vaKMQdFvZKuMVCkT1Cq7H2DibDCyBQKOEAIABxjSVJoXZ1M2Bsd0agrE6InzJz6IlZe1ui+ulC6qDanlZeOJXSjyiC5BRY8GHvZpvmWqwU71H2hKSfBnRfa8DIcMSFFnCW3hJLQa8f55zF6IKiX9I2jAVxPk4865mpHGhbVys212gFBxEt2b2aszwRneH080/rCv/QTpezJmBGsJVwvMaZamtcpJQLu1WnX11hwM+86r+iyNBTECcFGKbPBQpuUr3f5KiwzQJ+7rvS0BIriHZx+MvsdpRs6q5LCZES0HQtGQhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>
Date: Wed, 8 Mar 2023 15:16:05 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230308115410.GA1108824@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c87e3f-ec84-4405-c8a3-08db1fdfa898
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YfZ9WsH3KXoP7YXWZb0RKJTT87kREEexCAvQ8z04fikKyP8ctD9RetLy/Kw6WcywrGUR0C5jxtkhSnjSZ90aHdErYZPGn+sj0UXEKZ6Yjma96q08ZYcHpP5o89BLjkAXQW10ZXuN5usvl4zda4iTDHkHAUOJNgttLuPFDcID4NyhBfVyN59B6HMQO7rxzDqqkxgElcdeM34T7XziAqpTnT/P1Co77zS59Yvf74jsMQp3XGmu0kKvHUcJPUxxAOkeglGgE+mky4utfFCnD2wRdHUef+gFbwp8NlzfF629YsXubbaVpEL65EUEBolBylsAr0eO1S4YpBjqhYRdBZX9qF8qVLoqkvdeZOL/AbES/HPIQ6LDvRpzJ7mnejgd8V29LnEXs9BIaqZXaUcmNLrWAZ1fQNlib69LcvXToT++quiJ9xxjf/WPxv4xq8RYct5PGZ9Zrad4vxOQcjHF/6puwZGHkbL/6OrsDi61kTynKPMyslIFmAH53r113g2CUI2/8RJgS1+/PpFmokeVBQbeMGqNAI9odW84hgKO7nzkZBOXU55PbPdCGERzTs5fxEdwHghtNQHa0aaG6x3Cv3ric1EFNeOL6jpGXL7CuR6s/EDrESzbfWWxGb1bWvKZ8BhaNDKXNFxJS/UArzHU4p5TlFNUqLqIsJ589gFJZAryGbG7ziUmxNfyEhhj/OGOGEDem9moxAwNPHrkJvAmmbS5KP1aqBTnDX+cIUQQEQYM3gk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199018)(26005)(6506007)(53546011)(6512007)(6486002)(36756003)(83380400001)(86362001)(31696002)(186003)(38100700002)(2616005)(66476007)(66946007)(41300700001)(6916009)(8676002)(4326008)(66556008)(2906002)(31686004)(8936002)(7416002)(5660300002)(478600001)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGlGcjBpZGVCZm9HWG0wSUJmNjFnMXY2disyU0NqODNqNjZRTUs2NXlpSXhD?=
 =?utf-8?B?OUJDNkRvU2lBcEdESXNzeFRBZWwwL3dKR1Nidnc0ZDd2aGRyNXRMMVZqVUI3?=
 =?utf-8?B?NmRaQlluUG0za0J2V0grVExmY1FCdWJYS1pLZlZHa3Jhek56M2dwNUpqL1FJ?=
 =?utf-8?B?MVhlcmM5RHMvaGJZdlI0dlE0eW40UnE1ZU1DbXB0MTZNRWNweGlZeVR3ZzhW?=
 =?utf-8?B?UVFMZnFnSkJkSFBQN2VZZEtZaXdGS3kwVk9UUWhzSWFMY1Vjczg0M1VsYm1v?=
 =?utf-8?B?N0V2VFE0Ti82WXlGTUhHNytCUk45TlVzZmxsS2gvZUJCZmNyYjNOZ25qcllS?=
 =?utf-8?B?ZUdTcmtBNWxIVTUrMDRCMVd0aTRMS0F5T1RjTGV4aWUydll0QnJKY2VvMjdq?=
 =?utf-8?B?aXRRMXZIRzk2VkdxWTVxeU0yMlZaSzEveGhTMFVOSituZjU3MUlMbG56NFhi?=
 =?utf-8?B?QlFTYmNZSGM4YXhMV09yb1A4VjJuYjZMVXN0dGJDZ1hUTzU0empleVZwa2k2?=
 =?utf-8?B?bkw1bkRJUXFTUGFUNjZrck5GMGhBS1FEbDI2bTRNMU1qZmcwTEFUbWNRYkJr?=
 =?utf-8?B?S0dnc1NpUTk3MUpJc3lCSEVYS2hxZjRKV1haYkZEMjZzQ1VlTVFJUmR4N3BL?=
 =?utf-8?B?WUgxZ2wrc0lSdHVwVWVTb0FFUUpkSHN6LzZhSkt1OWlZS1Q2OEt4cUZaV1VM?=
 =?utf-8?B?dHliSDNaVFFnMlB5ZWJ5TFNWQitINjY1SGxOOWxuTnREY0Z1VDNjNDdNMkFJ?=
 =?utf-8?B?TlNZaEtMejBzZDNVRHhaSlhkZzc3aVVYSEwrR1ZaVFI1VmVueWtCTWJINkhs?=
 =?utf-8?B?MVk5UEFNejY3MU9EYVlHVWtZRVNZMjgvOEZWUXlNbFVkQWJpQ0lVaWhtL0lW?=
 =?utf-8?B?MDE0Rzg1eFRmRTQxdFUzUDcwc0FlWjJYaWVHS0RKOHdVc1ptVXhMak5kZDdv?=
 =?utf-8?B?Y0pFVFNPbHpwV0hwaXpzY2tNWWk2aWlzUGRKTGhYK3J5clNqNzI4SXBGY0ZG?=
 =?utf-8?B?c21Ia3c1Zk5OSG9hZkYxUUNiZkZPV0oydlFKSE5SSDBYWlRGNVh3ckVXdWdJ?=
 =?utf-8?B?MGNoaW4wYnNIK3cxL3B3bXFoUXNwVHgvemdDL2ZjM1ZwTlQ4dGJ4Ly9vdzdM?=
 =?utf-8?B?VzNzM1RqeFNtS2Y4c1JMU2xzd1luK1laMkMvMGZqZEZ4N2Q2UlI1bzUzUERi?=
 =?utf-8?B?ZUMzdEczL3FWNStWUUhCZi95UGRpeEtFK2NqczVBL1BNbFpXdmlXbWJuVkxn?=
 =?utf-8?B?VlN5dW1Yd2dZSG1FTGJZTGhlK0pvWXp4VWdyYitjM1FHYjlwTnFBZVZpWkpm?=
 =?utf-8?B?T0xmWVVnWEhoTFNrSlE3dnlTSGpZYzN1WkRKVE85S01aYmxJcnNyZUQwWVFr?=
 =?utf-8?B?V1RxV2V2SmMwMTkrd29wb2Q3M2YvSXJCMWlyNlN1RkRKeHI0L1M5anJsR2NI?=
 =?utf-8?B?VWJvUjFsRHZLMFkyVDFKS1NSWHkvR1orZzQ3UmhsR2JsdWgzZ2swakxmWSs0?=
 =?utf-8?B?UGNETVpyRkJmQ1NBenJ6ZldWL3hqUHZRRDBwRE42VHJHa1M3dVNNd1lSS3dk?=
 =?utf-8?B?cGVFME1rbytVdG50Mmp0WmZYUzdzNCt1dlZZMGZyMGlUMGxNdU9XcThJWlho?=
 =?utf-8?B?YU5XSTFqN3RSRWM3QWhCSjVhVGhMalpBWm1oYU0ySjl1dHc2ci9namNKNXZM?=
 =?utf-8?B?ZVZmREhlZGlpMW5PUGZGbHBrSGNiTS9DLzJUa1JFU005bjlua3d1K2t5STh3?=
 =?utf-8?B?UUdwZXYzNEh4VDhIMGp3NWJyQ1ZBaHA3TWxSVjlVNExqcUk1b1JEZlBiZFZy?=
 =?utf-8?B?YW9XQWZtLzE1bXBPd0RNWG9oK3BRUGxNTmxSNkphb1JoTUJ0cnoxNTNXR0lz?=
 =?utf-8?B?bmZNQmtRRFVOVTgxY0tabnhoMVlpTGFaUkJ2Skc5blhMaURVVUs1NUVkdkpn?=
 =?utf-8?B?SlZjMlZDWE43WEcxQTJLbm5IVHBiblk1TWpvaUkxQWJRMUd0U2lHcEdIdVU4?=
 =?utf-8?B?T3dseGIyWk04eUdYZE1NSFRhNEdxMXdtL05uTFB3RVdzUlRPMVBOOFM5Vnh4?=
 =?utf-8?B?Nm05MVR6Nkt3MmtNbXJ4c2R0RjlUd0tkRFJ5RG5WQVQ1b21GTFJSVk9MRytR?=
 =?utf-8?Q?fO0a9ymEjtd48feIKv4GFUH28?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c87e3f-ec84-4405-c8a3-08db1fdfa898
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 14:16:07.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VukUNHsYLrylNWnLpPv1Iibid4FjU55/TvDGzeyP5wWXEFWFW+xrZs7UJXW2fFhZVlmktbViySLvWBi6NSBsaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7371

On 08.03.2023 12:54, Matias Ezequiel Vara Larsen wrote:
> On Tue, Mar 07, 2023 at 11:12:00AM +0100, Jan Beulich wrote:
>> On 06.03.2023 15:23, Matias Ezequiel Vara Larsen wrote:
>>> - Xen shall use the "stats_active" field to indicate what it is producing. In
>>>   this field, reserved bits shall be 0. This shall allow us to agree on the
>>> layout even when producer and consumer are compiled with different headers.
>>
>> I wonder how well such a bitfield is going to scale. It provides for
>> only 32 (maybe 64) counters. Of course this may seem a lot right now,
>> but you never know how quickly something like this can grow. Plus
>> with ...
>>
> 
> Would it make sense to define it like this?:
> 
> struct vcpu_shmem_stats {
> #define STATS_A (1u << 0)
> ...
> #define VCPU_STATS_MAGIC 0xaabbccdd
>      uint32_t magic;
>      uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats) + sizeof(uint32_t) * nr_stats, cacheline_size)
>      uint32_t size;    // sizeof(vcpu_stats)
>      uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
>      uint32_t nr_stats; // size of stats_active in uint32_t
>      uint32_t stats_active[XEN_FLEX_ARRAY_DIM];
>      ...
> };

Possibly, but this would make it harder to use the interface. An alternative
might be to specify that an actual stats value set to ~0 marks an inactive
element. Since these are 64-bit counters, with today's and tomorrow's
computers we won't be at risk of a counter reaching a value of 2^^64-1, I
guess. And even if there was one where such a risk could not be excluded
(e.g. because of using pretty large increments), one would merely need to
make sure to saturate at 2^^64-2. Plus at such a point one would need to
consider anyway to switch to 128-bit fields, as neither saturated nor
wrapped values are of much use to consumers.

>>> - In the vcpu_stats structure, new fields can only ever be appended.
>>
>> ... this rule the only ambiguity that could arise to consumers when
>> no active flags existed would be that they can't tell "event never
>> occurred" from "hypervisor doesn't know about this anymore".
> 
> Do you mean how the consumer can figure out if either 1) Xen does not know yet
> about some flag or 2) the flag has been deprecated? I think 2) is the case that
> Andrew mention in which the magic number could be used as an ABI version to
> break backwards compatibility.

No, an inactive field wouldn't break the ABI. An ABI change would be if
such an inactive field was actually removed from the array. Or if e.g.,
as per above, we needed to switch to 128-bit counters.

Jan

