Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA52671505
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 08:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480173.744418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2p1-0000rG-VI; Wed, 18 Jan 2023 07:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480173.744418; Wed, 18 Jan 2023 07:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2p1-0000o3-Rh; Wed, 18 Jan 2023 07:25:23 +0000
Received: by outflank-mailman (input) for mailman id 480173;
 Wed, 18 Jan 2023 07:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI2p1-0000nx-6s
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 07:25:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43da2e72-9701-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 08:25:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7993.eurprd04.prod.outlook.com (2603:10a6:10:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Wed, 18 Jan
 2023 07:25:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 07:25:18 +0000
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
X-Inumbo-ID: 43da2e72-9701-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfPzzu/guOIakYquH+gtGzubRhN01vJiYO49gH0z73apqJD/Cg/eNBipP0ZWf5GFWLGqfE1pqjQ/mP6jaf8S3wLK127lKbPv6wr+/YPejCsAFxIzwYIxeDVceKDXuIVmMFSiVeyfIo3q6cUDqXWafz00nVgHu7PSY2N81Hg8q7bClTpywM9T2FhTpTj1Q0MQn7utZnue1go/BCpY1kB3JQRzxrNbBMxmSrjm4pZapBOvAPlYjHODmuaY/tp9ix9+QXl2j7bb2sF7ERvEEXV1cn/zhEIkGTuvC+geMDhgXpQvdaRIyGwGvVrqUyOxalwJ0huSu4yWvIGwx8UcO2WNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1BXN+EBezKFEDEV7kCekm2JH8EqTVC7vguBfgcsXcc=;
 b=fmTsQRrzQjBhzQ4JqQTEDUQdHbQfBt+isc3Bf8Qp5n/BviFXPOSX611TYr9ZaBowzPLREv1M5QdrPnkuVzIQTsG82AKjtTl8CLam9W7n/Rw7cLFA8AyEaFP7X2hF7qjBKoY+G1U7HMkpBt63FJs2hsuB90c9yeE+KQ/GW/3nSuHDG+O/IPOinsR2ZP8Ffcx+2iwGOirkIGcWa7/Y+OchdZoiSozDirVSFfMYOCO1vCggOXQQT72o8hI7a4t5rgCtZJJu8cB2kkhH/zmv7mI4PkF6IvKX/cIpjciwFgjbUSGHR/qd32Li/LxyVd9jvxw9lfMyLrDisuXYYDlADVVWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1BXN+EBezKFEDEV7kCekm2JH8EqTVC7vguBfgcsXcc=;
 b=06XrNAZd7fAkw62zE9l06Rpz7qhSgA1kOZhgqkDnh2Eih9Zp9MNluNuFZnXQuulRsaVW3NeNctkgpEeGYYxOfDHKOpzMoHEfX9v6rqoXg+O2D4uvzQ8YJpio08iUD10lQhUNsD9uDKCNF3Z9JCMNb4YDB8GnemSqMtjfCKoizmh9X/RakNmcdYbCpjIouM87tjq2Dm4V82j1q9okrcizL/R+1qZTgbJQ5eDKKHgi0Bfd31vvXhoOo7WhgBvMMEPvRFRpUBmjR6DUEgljDlqJfWAHE0XaUTx5MLDBv7iFVkHRrJN+ermRGf6tp680WapKoScTZSunjbi7jeBZoPtc3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3852a9f8-c950-3c45-fc99-946a2ff4a5d1@suse.com>
Date: Wed, 18 Jan 2023 08:25:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/9] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <27a7245c-f933-5b2b-5685-d9ba2dbd4a8c@suse.com>
 <ed382d91-d4fc-4778-d1e2-9f55b147e33a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed382d91-d4fc-4778-d1e2-9f55b147e33a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3852c7-d4f7-43e1-f60b-08daf92526aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wmYlz7i4+GwjSNuwJjtuQFHMZL6qZKKBYC9vEn+Z+MPgSHMATUMB2MQbM1DFHD6x3Pv76+SrqnLGWEPvutuHPNHPcDK4A4JdzHO0fHbWwI+sD5LJReMcsFo7TkrpKOoyS39TwEVN8IPRE3iGh5LYvUr224LaUPLK13QIFBGD+SSt0mxrefRd2TtnfngZW6/2eJr000j66ZP3D8Nosmtfv9MUobgkkPLPOa29MssJw1yIF2UK0QfszpLDkx+1JTo7ii/Piz5JkgJ5IVMzubAPk71VTcJ5Sxzib9ooEXozrCqIOTCmMex3UgR7xPoc3/MOX5nPZ1pmflRvjBAmirO69ndqn/CusQQnogLjVfZGLpNJBBOyRkQ5IPAcbT34dpU+BjE5EGVFhMkD86gKlXjQ16a1Uz9agUbJjqZa4gkbO7z31pbSo3WgUb5NXluRI2SPAQexFPX4QU5cVniExsfdXaZrvHqd75hYhrlfJZY4N39zAR3xjwixlrC2Orsx3Ekc+EJRPn4WUcEK+S3iCye0vzk/xYFb6wBW7Z+1Dang6pMYPB1TEx1r0Mh7rpB787cGArCXK+mvHndol0oE2U8/9CAPCqF7ceKcqD8ukmQGuzny/NA2xZ9pi5Iumkp8Zeo9bBDbh1qUU8HHHJZcmHQp895330KFB5ovnEzyUjwDLqSnEGvGmt7x5uwuuW1lkBEFAfg/Y9NTuhX5aI5/+Kt5WPcDAueAKD5uAWvwz6AbD3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(38100700002)(31696002)(86362001)(66476007)(5660300002)(8936002)(2906002)(66946007)(66556008)(316002)(41300700001)(8676002)(6916009)(4326008)(26005)(2616005)(6512007)(186003)(83380400001)(53546011)(54906003)(6506007)(6486002)(478600001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vkt6cG95M3JQLzl6YkVNR3lXbGl1OGJCTCtORUV3dFFua2JIb0NDT0dOMkRI?=
 =?utf-8?B?bG5RVG9tNStNZlR0SEM2RkF0dVhsWHd5dDZxT1M2YWtMMDJEaHBZdUhpT3l0?=
 =?utf-8?B?OEhGNEJHWmFkVXZPVkUxNXR4aTFlRkRpNytadHJ2eWJDWDFEaHJxbXUvL1kx?=
 =?utf-8?B?Wm0zdCsrVDJ3RzR5aXRHQkV0dGJyNjRtTEdtdmRBaEJVVWFKNjVxL1R5Yng2?=
 =?utf-8?B?TERRdm81V1NqbG02SGhram5rOWZMdThNK3N5eVhMMG1VemZsa1BxS2lPclUx?=
 =?utf-8?B?b0xpMHQ2OTQzM3M2dURlTWphbjZnSjhDYmY0STNNNDNVMlFDNkpzSjNLb2ZV?=
 =?utf-8?B?OUJEbnA3Mi8vNHI3WG9HRGZHZUNTdzZQUjhYUHNwQ2g4QWtBUUZBODFBRHNz?=
 =?utf-8?B?eFlkQysvYnUyRzVXeWlHWGxBSGxGS1RncjNlN21JK0pwazRWNDZ1VGRPZnE1?=
 =?utf-8?B?bVdscTR3Vk1hbVJKeHhnVytIZ0ttckhiTmZwMUNZcVNKbDdnNkVnUFNXb3k0?=
 =?utf-8?B?bTUyT3RtWm5ULy9SalF2a1AwK0NzTld3RWZCWnJodXBiVVVmL1NBd3dpTXZH?=
 =?utf-8?B?Qjdod0o3TVovcEJJdVY3bGs2c2JYSUsvOVdIcXE5NktJSlFWWkNMSXhXelFh?=
 =?utf-8?B?cU9DYXBvdEtGZ09FOVptOG4xT3F2amhQMHBDa2p3dlZlczI5S2lOVk1STHB2?=
 =?utf-8?B?UlFqNVg0ZWlURmhBSW1DZEdhUXZNUFM0WWRqcHEwZTlKb0RKNXcwQ01xYkFE?=
 =?utf-8?B?MktPT0V2WXM5VHpETkY1aXdwUU1KVEpvOTQwY0lQZGlEU1FvQk1MWmtHTmhw?=
 =?utf-8?B?aHAwamd5cm1RTWxiV21rNTFTNHEwMHJBRmI5c2lxSlA4VnBsRnJCU05pcXVR?=
 =?utf-8?B?aFhyYll0d2tNMkdiWWdMekZWSm5ySHowdEI3OHBwQXlORnVzMWhEUFVYMEp6?=
 =?utf-8?B?VjRQcEVxWE4zY25IdzV6ek5uUnNhM2dLc2M1TWwxbDFtZTl4a1hBN2RQKzVD?=
 =?utf-8?B?V0J2Y3IrczNBdmh6S0VPelFtU3dtZ1dCWDRWVndXalJtUC90b2x6T0JDUmtV?=
 =?utf-8?B?cXhGTkNZRnh2NVhuMHMzK3Y0RE5DSUNwNmdQQ28vRlM5MmxKZzkrMnkwT29J?=
 =?utf-8?B?cWk2MndvK2dVTHFlb2FDUWVLeURldGpFNWkyMzI0enlkNWhta0IwY3VTZSt2?=
 =?utf-8?B?Qmlod1g5Rk9vck1UclVCcndIbVZkajdYb3N2UXNTSDltUmhVZUlXMkNMUGpm?=
 =?utf-8?B?QWdtREN0WmFhSlhKUGtHcTR5Tzg1WnllaGs3ci9scUdGZ0pDMTAxVUliTncx?=
 =?utf-8?B?aEphVTBhSEtSYjA3OTVTbHpuZVJ0Y01Ud282eEJHZlhybnpSdW1yMXBpaSsz?=
 =?utf-8?B?Sm9XV3VGRVZta1VrakVONDdrdWJWekVTa1VuYmQ3b2lRcGprZGk3czFnMmJX?=
 =?utf-8?B?bWpJanM1bUNaZExGU0JZamdsdU9kUERnNFh6czY0NS9IbGtZVTcyYi9HT0tR?=
 =?utf-8?B?WVVzT0dJcDI5RWhsTmFqRTJtNGxzTGVRbHNhSWhJWUFsOXY1Q3hqMVh5anll?=
 =?utf-8?B?S21mTDNoMVJqUmpRKzJrUWVod3J5ZVFkQlV6dXl5UW1lcVAyVWdTa3dvZmxW?=
 =?utf-8?B?TExwRlBhc1JpdVBiQ01OejZJTFdQKzhXdjYrMEVBRk4yUlNDRW1PVFhuZC9I?=
 =?utf-8?B?elNSbEdlUEJJRVJxNlp1VGZmTktycHNJWklsQ3I2cC9yeGRFcEtuRGR2NTQ1?=
 =?utf-8?B?VGIyRU9Mc0FzMzArQ21MaGZSZUpJTTFCMjZjc1hOSVFVVDFBM0w1OHBlbzNE?=
 =?utf-8?B?bit3cEkreHhZOWFGVHo1Rml4SGhpK3ZPNGJNaTJyZldyNUZ4OE9wNEpkditl?=
 =?utf-8?B?RTFuYVcvTVpmbTlreXBsWVJRUDZ5WE55TE4zMzVVMWpWNjA4Z0ZNRmVqNkFH?=
 =?utf-8?B?NEhEa3ZLcjgrbWxzRitpQUhKamdscjhvRFdPdHQ5TEs3WmpwZjdOd3dIQXZX?=
 =?utf-8?B?SC9jQkphN2dMN3lMQmZOTnpKMDlORFZub3VzVWtnM0pkNDQ4K0o0QTB2bitZ?=
 =?utf-8?B?d3h4Njc5QmVVdmxWZFJtOXdHQjVOMzRjU2xhaWY4Ui90bHRmQ2dqZmdRemRo?=
 =?utf-8?Q?HSlNizsymYDeAjO5XQ8O+xj5M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3852c7-d4f7-43e1-f60b-08daf92526aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 07:25:18.5597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZJpq5Kk7MKpG41dI0vSddfR6JE2u0r+svmWgGATVjzucI2/pl2MvEYZnrMFJo6uzVt3sr8hRAlTkG7oUACWwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7993

On 17.01.2023 19:48, Andrew Cooper wrote:
> On 11/01/2023 1:54 pm, Jan Beulich wrote:
>> First of all move the almost loop-invariant condition out of the loop;
>> transform it into an altered loop boundary. Since the new local variable
>> wants to be "unsigned int" and named without violating name space rules,
>> convert the loop induction variable accordingly.
> 
> I'm firmly -1 against using trailing underscores.

Well, I can undo that aspect, but just to get done with the change. I do
consider ...

> Mainly, I object to the attempt to justify doing so based on a rule we
> explicitly choose to violate for code consistency and legibility reasons.

... your view here at least questionable: I'm unaware of us doing so
explicitly, and I've pointed out numerous times that the C standard
specifies very clearly what underscore-prefixed names may be used for. 

> But in this case, you're taking a block of logic which was cleanly in
> one style, and making it mixed, even amongst only the local variables.

That's simply the result of wanting to limit how much of a change I
make to the macro, such that the actual changes are easier to spot.

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -863,23 +863,20 @@ do {
>>  /* 64-bit l2: touch all entries except for PAE compat guests. */
>>  #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)       \
>>  do {                                                                        \
>> -    int _i;                                                                 \
>> -    int _xen = !shadow_mode_external(_dom);                                 \
>> +    unsigned int i_, end_ = SHADOW_L2_PAGETABLE_ENTRIES;                    \
>>      shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
>>      ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
>> -    for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
>> +    if ( !shadow_mode_external(_dom) &&                                     \
>> +         is_pv_32bit_domain(_dom) &&                                        \
> 
> The second clause here implies the first.  Given that all we're trying
> to say here is "are there Xen entries to skip", I think we'd be fine
> dropping the external() check entirely.

Will do. I may retain this in some form of comment.

>> +         mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
>> +        end_ = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
>> +    for ( i_ = 0; i_ < end_; ++i_ )                                         \
>>      {                                                                       \
>> -        if ( (!(_xen))                                                      \
>> -             || !is_pv_32bit_domain(_dom)                                   \
>> -             || mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow     \
>> -             || (_i < COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom)) )           \
>> -        {                                                                   \
>> -            (_sl2e) = _sp + _i;                                             \
>> -            if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )           \
>> -                {_code}                                                     \
>> -            if ( _done ) break;                                             \
>> -            increment_ptr_to_guest_entry(_gl2p);                            \
>> -        }                                                                   \
>> +        (_sl2e) = _sp + i_;                                                 \
>> +        if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )               \
>> +            { _code }                                                       \
> 
> This doesn't match either of our two styles. 

Indeed, and I was unable to come up with good criteria whether to leave
it (for consistency with the other macros) or  change it. Since you're
...

> if ( ... )
> { _code }
> 
> would be closer to Xen's normal style, but  ...
> 
>> +        if ( _done ) break;                                                 \
> 
> ... with this too, I think it would still be better to write it out
> fully, so:
> 
> if ( ... )
> {
>     _code
> }
> if ( _done )
>     break;
> 
> These macros are already big enough that trying to save 3 lines seems
> futile.

... explicitly asking for it, I'll change then. Would you mind if I then
also added a semicolon after _code, to make things look more sensible?

Jan

