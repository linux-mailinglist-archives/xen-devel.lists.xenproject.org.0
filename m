Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F2739C6A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553428.863974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGPZ-0000YC-Kp; Thu, 22 Jun 2023 09:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553428.863974; Thu, 22 Jun 2023 09:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGPZ-0000Vf-I2; Thu, 22 Jun 2023 09:15:29 +0000
Received: by outflank-mailman (input) for mailman id 553428;
 Thu, 22 Jun 2023 09:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCGPY-0000VV-9y
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 09:15:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52a0347e-10dd-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 11:15:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8770.eurprd04.prod.outlook.com (2603:10a6:20b:42d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 09:15:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 09:15:20 +0000
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
X-Inumbo-ID: 52a0347e-10dd-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmPQ7/JcanUPzVm2+BZNtSZYcCq2zrj+eYpy6hiGlPJcSHkDwztva4Z9IJW4ya66CNGNFQxE9zJIVC+ijuuJD2RmIV2CsTYPXirXvJvlA37KpdYHaGqMZAx+CKUzMzS/t3Rg2aWZet0y6YRVh5LCCMJ1t9W+q719QLPR7y42g+6AoxOrk8td+MOvMVUVGZJeE76h2f781XMBoJtXkxpTmrNsOpxrRRMSbB2KsGhIPDzrXwxXZhD+FhUiLkj8yMef/b94ddIGyaB17ytlpucGglmflB08t5zj23tAmQc9kE3ylYxAnIFE8ijftqYX4xnaxhlQD7CyamoB7Dmy8bJplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMl68EtgETa3xL4v+g74W+ZbCX557QpXLqKZGx9XphY=;
 b=MhxRzEsc6Tb19NR6JqKTKpYcvwXWCLdNwoyO/mV2dYDQjVy/n37hsES9w1JASpTwcafa8Zhp4KSJcdkDag4IGx9wwg08ANlGaEn7G6pDO4AeA5ug2ZYEv6+WV0J149S8PKJEkaWhZy1XOEn5UJ7KpluFXY+fulOs4gaeCek/P7h8cFo8ZWWLqDl94leZ4eZdZDnoYXPteHJ35ZV84F4rVLMyEg5gTBgHbk9+fzlis+irhroUAu29xhCzoCYWiUxmlcrG1GBpKUtHDEdgBuNgGVWV2PoZ77p4mYUt1VqtjA8N2avcAsm4Zh8MKO7Lxj7FLR0c4uv7pvwnaddCs2rGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMl68EtgETa3xL4v+g74W+ZbCX557QpXLqKZGx9XphY=;
 b=theBedXXpTRkmHyttxJhOk7smfj/uv/CYXJgMZECe0wVlrPstpq0JMm6UsG/r5VIb/fY41C3PdZI2nzZekI+xM3NRtPhYbRiVLPn7cwutiULABVUVHdjbTK5+kh0WBU8PWR/gQHxt9oDZTH1G5kp1agaffjtw0VId72FSBi5H1knCfxyN8YUx/MWZA2PrEZe6V9syEvP3mf3012b0xrJ54AgPGXL9tlEMKixN5vHHnGSfPLSfDoHLrBBfzGcbUW6bChR8pC5o9stE0NM/YAIBNW3VuylYaZhoymchKtqqcECdvUgl/hVPkClSVv5xnvF/x2OkRYmfva+HEuO4AuIlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <692b3db7-dfe8-8ed7-71e5-b29dcbba7f1c@suse.com>
Date: Thu, 22 Jun 2023 11:15:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
 <984e13ef-a73e-126c-0bf8-58bee9beb7b2@suse.com>
 <64930879.1c0a0220.28719.ce38@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64930879.1c0a0220.28719.ce38@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: bb638621-c081-4af5-1029-08db7301338b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lCrQsdTnnOnFvJXCIhKyDOU2fSm6icYADc8ftXANy/9D8kxoK6fwTBx6ub3SHDbPmswXKP6bFe0z7q4++wMrAXH6+O4CrSFIxvt8cLtwewe+iN46i0VemIYOhTg6RqjS9g4ccaALmvcu1Jc3yct+tDqzgl/HD4FtYEbwCSNdmU5cvlTjZx3S6u/QUrGMAG5Zj3Lh0N/uCAune06FHefxwMkkCFDaRMoHLdXVN7go3ZsbbI3hF7RZ9lb7Aeii5ZQjR5L/TnosOP1uSV3/BY7gkkjtY54E+2RA2RG4MynhAuleUglH1l71NEIjayKhTGOcDpK8QXfozz8bBUaW+MwcWFIV7FXEiiIU+AC4PVyEF3lcNt2g5EQhE5Qnrwg7aMNPi0RGpPsZsTAs/hZzPdPVZsXl6U3dCAzwmXv1Id8XfxXCOM4717safagj63ujIJG6NVb+ngTFJSxK+1VVMRYs1gorQtbF7cUms5sVJbgw6oc+j3Rx0czGMn8j4amojBHjhbs5l7kaPhqVlizi3BqL1df/4+5DhKNZhM/MHi5eMgtX4q4vBZzCXlh3aVNG0Aomp/ayVIs5Z+RJ8ojbxODTCCNC/fs3EdJmc0kxNpd1qm8pvjAUnmxeGh0bnDDrQ3+XfcC7bBL/kTIQe2wAcgiO3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199021)(31686004)(6486002)(6666004)(54906003)(478600001)(83380400001)(2616005)(86362001)(31696002)(53546011)(2906002)(26005)(186003)(6506007)(6512007)(36756003)(6916009)(4326008)(66556008)(66476007)(66946007)(8936002)(38100700002)(316002)(41300700001)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTdZRXVEQldvVHI5NmQzd0M0WkNmY0dxYTl6NUU0UXJ6SVhFTTRRZlh6bmt2?=
 =?utf-8?B?L3NZWjdjMWRzNzl4ZmpwQ0ZVRGpQT1ZhdDNRVDNZbU43UVVwMS9WYksvUy95?=
 =?utf-8?B?dzhvWTNwbWc4YVMrVTZadStHQ0x3ZHNBY3JPeUZmY2QwQlg1b0hwOVQ3QjFG?=
 =?utf-8?B?ME1GYWxuWWRuakZadlR0MXJ5SjNYRC9JaytLR1YvTjluejlPRHl4M0hrb1BK?=
 =?utf-8?B?aC9EQ2xtbWdIVjVNQWg1TzNuOEkyUUM5Z0VmSHdFMDZRRXdNaFdibC83ZlFs?=
 =?utf-8?B?dTdIWUxIZ0YwNDB4YVphUkpaOEZwS09MYVVOTWJUK0FXNW8rOHI0M2RmaHVI?=
 =?utf-8?B?RmEvRGgrdlBlSDErRnhMSnh4RWFueDJxOHVyOE5Eb3JTWWpIMCtIeG05QUNV?=
 =?utf-8?B?KzVtbVJsellmRGRXMnNmOHhhbU1kSUp5WGFXanAxZUluSlExa0tsTklUSkFD?=
 =?utf-8?B?bnBlVUgxa1JleGJJTUJ5LzQzbGhHV1FOc0JhWmVYOENUZkZrd0VnQ01zM3JY?=
 =?utf-8?B?WkRxR0liU3hLV254VUJheXFWNlIrN0dYQkFsY0JMdEhuZmZ2c3dMVm8waEtS?=
 =?utf-8?B?cmhjcHlPVUhCdmltcUs2dmMvS213RjhWeEZPZFlNRlQ3eWFTdlQveHRjQjR3?=
 =?utf-8?B?Uzl5UHNBYW9KQWZ2dzA1UEpaakdyS08yQ2tlbzFyNm5pVU5VbVF3OS9Wa3gr?=
 =?utf-8?B?eHlCSXg4UVhhbk9ubkk1LzhudTMxS21FQmNJWngwUThWQnpNVmVlQzFJRDJ0?=
 =?utf-8?B?Q04xY1R5TEk4ZExubSsrTHJHRW5mdUZjTnk5aVBoZE55QnQzT2w3dStzdGlB?=
 =?utf-8?B?QjkyWEZRaWFYQUxoWlFLZkh3VjJCditkUlpGS2ZOUUV4aXJLSGcrdlBGRGs1?=
 =?utf-8?B?SHpHeGNnby9TNy85dG9LUFlvUDhYMVlNZVZCL25rZUFZWHJYOXdPVkNyeG5I?=
 =?utf-8?B?MEh4ZHhjWDVtS2hWTFgwK1k2ajlVVGppS3RZLzVrWDVxSEU2SGNFWU5oSnJC?=
 =?utf-8?B?ZnlmSHpvaGtSYkFGVDhNekFRM1FRM0V3NlRiSVRGR2VJL0kvWEkySmtVZmw3?=
 =?utf-8?B?dlAzbW1tampidUNmUjFnb3NsWTFucmV3R0pyTTlPOE91SEtrMEZnWlppbURK?=
 =?utf-8?B?TW1WVFYvdXQ5bU5OSjdpWDAxN3h4V1RVUjJVTGRvTFlrb2dueVFqeGpHbW14?=
 =?utf-8?B?QlQyZGxjZ2tMNlp3QkNjR1FqSkd2ZW5UenQrYVE5KzFPUTQ5Vkx6c0FuTEdr?=
 =?utf-8?B?WE1qWGpFTzBHOWVoS01tWkVrUDh1QXNNUDI1NWhaTHBwRkFaZGE0d0ZtblF5?=
 =?utf-8?B?engzOVFMVWlJR3Rib2JGUENGTWdINWxkQjBOYlU2aUZoZTY4dDhTY3I5TkR0?=
 =?utf-8?B?YmpvRy9QajBUUVVQQzUyRCtMdWp3QVM3cXhLb01iRXdUUGRxenBpUjFKdGkr?=
 =?utf-8?B?R1kzL1UxdFRCck0rNHV2SEpycHBsemk3eXR6QWttYVM4dCsxK2wyN1Bnd2Vq?=
 =?utf-8?B?ZkhTS1VnUWdkRXhkU2tEVVhEalBJRlJQZmQvVGdiUHpIYzNLZktLQ3ZrMEZW?=
 =?utf-8?B?b21BbXRkOWlMTlVETGxuTE1ocUZxL0FBdi9pMTNwVVNCT1liblAzcU1ueTlC?=
 =?utf-8?B?eXd3azFnbmdzdWNnME52WjRzcnNTQzlKRzhldnZGYllmWEROOVdFVDVMNlNU?=
 =?utf-8?B?RzgzOGZzaFNEcEhQMFphREllQjdtWFZyanhJbG1nMG9nU1BURkZHamlIL1BD?=
 =?utf-8?B?ZVFQeTkwUXZMQmNlMkFJblNPRm1UM2YzUFQ2MnE3SzlHWUY1M1M5Z2ZrR01Y?=
 =?utf-8?B?dVRKWjE1d0NxaXhmWi95UTVGOU0vd0FhRlg4VUp0aCtOUnE5MCtFK1ZnVUhE?=
 =?utf-8?B?ODh4b2ZEelhKcXFXalpZRGNDMUZLWUI0WEpuWnIyaGZhTzFydXRQZzNiaWU2?=
 =?utf-8?B?K2FIbUcwdTlkRDVTRnB4eVJpTnJvVTVlRFBlaTZ4eDJ0VmVFMDh3aTJoOFFa?=
 =?utf-8?B?WURYa1hHTnUwMGdmYzRMbWJvTkZlVmlPN3NJWVdudXdQY0NUOXVxeTVXNVg1?=
 =?utf-8?B?ajhiWmtSbmpiQVRYRGVGb0tpNU0ySFVvVWxBRWw3M0VVUDRQdTNvaXI3WUZs?=
 =?utf-8?Q?Betf4eOTXgpI0Hd26m5DHHcw2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb638621-c081-4af5-1029-08db7301338b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 09:15:20.1163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6UWvY2PqAJvQr4H9cznS3P6kjQBmk0lYOnAmrdtddTKrT+geFECpKn/B12NFTHqn9OK0Lxo5Qc08XwJipIoOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8770

On 21.06.2023 16:25, Alejandro Vallejo wrote:
> On Mon, Jun 19, 2023 at 05:30:20PM +0200, Jan Beulich wrote:
>>> @@ -57,9 +99,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
>>>                           (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
>>>  }
>>>  
>>> -u64 __init pdx_region_mask(u64 base, u64 len)
>>> +uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
>>>  {
>>> -    return fill_mask(base ^ (base + len - 1));
>>> +    uint64_t last = base + len - 1;
>>> +    /*
>>> +     * The only bit that matters in base^last is the MSB. There are 2 cases.
>>> +     *
>>> +     * case msb(base) < msb(last):
>>> +     *     then fill_mask(base^last) == fill_mask(last). This is non
>>> +     *     compressible.
>>> +     * case msb(base) == msb(last):
>>> +     *     This means that there _may_ be a sequence of compressible zeroes
>>> +     *     for all addresses between `base` and `last` iff `base` has enough
>>> +     *     trailing zeroes. That is, it's compressible when
>>> +     *     fill_mask(base^last) < fill_mask(last)
>>> +     *
>>> +     * The resulting mask is effectively the moving bits between `base` and
>>> +     * `last`
>>> +     */
>>> +    return fill_mask(base ^ last);
>>>  }
>>
>> I don't see a need for you to actually change the code here. You can
>> as well introduce "last" as shorthand just for the comment.
> I thought as you did initially and wrote it as such. In the end it felt
> wrong to have an explanation in terms of a token not present in the code.
> Furthermore, explaining what the shorthand is in the comment takes more
> space than introducing `last` in the code itself.
> 
> ```
>    uint64_t last = base + len - 1;
>   /*
>    * The only bit that matters in base^last is the MSB. There are 2 cases.
> ```
>                               vs
> ```
>   /*
>    * Let `last = base + len -1` out of convenience.
>    * The only bit that matters in base^last is the MSB. There are 2 cases.
> ```
> 
> TL;DR: I didn't factor out `last` due to aesthetics (I'd rather not touch
> the code in this patch, in fact), but it seems warranted in order to reduce
> the impedance mismatch between this big-ish comment and the call it
> describes. I'll post v2 without that adjustment in case I managed to
> convince you. Otherwise feel free to adjust it on commit.
> 
>> What I dislike in your way of putting it is the use of fill_mask(last) when
>> such a call never occurs in code. Starting from the first sentence,
>> can't you explain things just in terms of said MSB
> I see. I can refer to the MSBs instead. Works equally well.
> 
> e.g:
>   fill_mask(base^last) == fill_mask(last)
>                  |
>                  V
>   msb(fill_mask(base^last)) == msb(last)
> 
>> (where the two cases are "set" and "clear")?
> I'm not sure I understand what you mean here.

Hmm, yes, I think I was getting confused here.

>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -31,6 +31,22 @@
>>>   *   (i.e. all devices assigned to) a guest share a single DMA address space
>>>   *   and, by default, Xen will ensure dfn == pfn.
>>>   *
>>> + * pdx: Page InDeX
>>> + *   Indices into the frame table holding the per-page's book-keeping
>>> + *   metadata. A compression scheme is used and there's a non-identity
>>> + *   mapping between valid(mfn) <-> valid(pdx) See the comments in pdx.c
>>> + *   for an in-depth explanation of that mapping.
>>
>> The mapping may very well be (and on x86 typically is) an identity
>> one. IOW you want to describe not only the compression case, but also
>> the "no compression possible" one.
> Point taken. I'll rephrase it slightly as "possibly non-identity" and
> explicitly state the "no compression is possible" case.
> 
>>
>> PDXes also aren't just indexes to the frame table, but also to the
>> direct mapping.
> I had something to that effect earlier on, but I removed it because it
> doesn't seem to be the case on ARM. There's a directmap_base_pdx global
> that states the first pdx to be mapped on the directmap.

Which would merely make it a biased index. I very much hope they
eliminate holes (and not just unused leading space) from the directmap
as well.

>>> + * ## PDX compression
>>> + *
>>> + * This is a technique to avoid wasting memory on machines known to have
>>> + * split their machine address space in two big discontinuous and highly
>>> + * disjoint chunks.
>>
>> Why two? There can be any number, and in fact on the system I originally
>> had data from for reference (when first writing this code) iirc there
>> were 8 nodes, each with a chunk of memory far away from the other chunks.
>> The compression scheme used merely requires that some "inner" bits are
>> unused (always zero) in all of those ranges.
> Well, our implementation only supports two and I didn't see any obvious
> hints about intending to increasing that number.

Where are you taking that "supports two" from? When I first wrote this code,
it was tested against a system with 8 (maybe it was 4, but certainly more
than 2) discontiguous regions (not counting the hole below 4G).

> I see where you're coming
> from, though. I can make it more general so it's not outdated if the
> pfn_to_pdx()/pdx_to_pfn() pair ever increases in scope to do several holes.
> 
> Out of curiosity (and for posterity's sake), what was/is that system?

I'm not sure I'm permitted to mention that. I'm pretty sure I carefully
avoided mentioning the partner of ours back at the time.

Jan

