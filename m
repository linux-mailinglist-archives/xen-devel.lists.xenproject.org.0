Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2585EDA54
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 12:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413245.656778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odUZ5-0004jq-QN; Wed, 28 Sep 2022 10:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413245.656778; Wed, 28 Sep 2022 10:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odUZ5-0004gS-Nb; Wed, 28 Sep 2022 10:45:19 +0000
Received: by outflank-mailman (input) for mailman id 413245;
 Wed, 28 Sep 2022 10:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odUZ5-0004gM-5f
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 10:45:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a40046d6-3f1a-11ed-9649-05401a9f4f97;
 Wed, 28 Sep 2022 12:45:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8586.eurprd04.prod.outlook.com (2603:10a6:20b:439::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 10:45:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 10:45:15 +0000
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
X-Inumbo-ID: a40046d6-3f1a-11ed-9649-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMZcn7a4P2sJnFXqxQejvhfyBdZTllDyoJvdHzoFFJzqZ8N9s4u06Bc9iqAySe3Oa+70B3MujTCWqSixqVu1ngX6o/vfy6Lzpzyz/LKzoK2x4GmjqRH7FNTfUPBVvylK72oAUiedqIMseGmO4KpdEiqGOFkuZF3eP6YtoBl8vFwVkuwzGxqV3QyIVEj74iTCE1nBElvJBtv9BNJme4b+KZvFrIYNsPGRwvMZ6YAeubG+xArulbTmno8wE+WVBexoOQNhAtFmQMikBmjRnkDQJqz2DhsBhC/1dgqZ51Tyc2kJ2YfzdZNYAJIhpALsJdorcWxZmIhHSfGefCFxe8GYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQO2A70vTnbnfNQz1f2eJnM+4kaB1DowXtso/JwbOZ8=;
 b=i+NGv0nmAT25wlZWar3VkbGIWVQt5ZGqoLHhdgKojgZOYs2AnQR6qsFx0cXzUF1vyNGnxoj85RerjO7Ap+vQNMFzV3tsSALCmK3nZwT//4PVtqTJEC1FMXNwHtbzJjp3C02n8MtJXJlpWIqsD/vohYvVm/p1QNICS9SYoI23a/zFiU4HDwnJmJ8JxER/K9Fu2JNuguoWa7upLg2kqKGZTPvHiO8jREf2giRksN73QoRyqwr/JwY8TBOgpTLEaTnpiKjK24u0j0ZPmHQpcqiI6rjsXxh4vn/f+8t1hQKYeRKQOrjrvNdfVITznyxEeZlHl//q0tDDkWPxII4qyDVu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQO2A70vTnbnfNQz1f2eJnM+4kaB1DowXtso/JwbOZ8=;
 b=jxH9HsRfKiefCkxG62gUZRJRlyiGX3kFVF/hPRRLgUORhQ5T1Gh3JzCaI4Wa8cFkUTL8MDl+bUBiRmPLifA8tJXIbe/cSbkw3gOKmqa7euQJ1Qjojh8NsDgfsk4/UQTUJ3WXBL4MEXA+OFVZr5vbBMOxbNxfajL/C47zWraK+SItQf7/TrdJSpH5kaSGGcY0lTK8aogzteKJS4KCjgmER+rkNCd8n1wY7UysZ7kOk7Ovwgi93keex9Vf6N4i7b1Rm34yQ8p7lzBghem2asZqUaPK9hD+SbhtxsxXbAeQ6CSoRWyTzagPRS02RQFnN3zJJD8/1wqqkelgcDchVhKc6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <357195b5-bfb5-7f0d-8295-3076a6762f12@suse.com>
Date: Wed, 28 Sep 2022 12:45:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220927153937.39389-1-roger.pau@citrix.com>
 <ff79be48-8146-0b33-bdb9-ad9f33083559@suse.com>
 <YzQdEQbXhV2XDEKG@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzQdEQbXhV2XDEKG@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0267.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 608a4d7d-43b1-452a-9ce5-08daa13e8712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PyniqaQRCwEW6IfcoZRw3/3LXBjTTqBNOLGnCBvWTIW96fukFsu0nUARvIp4/hOGteKfPxO8/v+closL5J7b1eBEc5wkzM+mSDCW311JQQ1d1MKj6WP7aI94pNEMeycG2WgrIDeG88KA3M1WjSVP54fvMnTVlGIEN8FkD/DGJdYR8+hMsvgckZQL91K6oQhqxvlnV/j1WHT2HbDH62fOaGvLAKp27OjYj+oJucE7WjoeF8huIAJQcherE4Hke9g2OYhtzCDUGC90amrCHAkFokOPomo6oBv4QfxF64VCy7Qnfi21oje/ztk/fCg9Gws5hW7Ya47aE9Bk+86g7JUNBPBn1mtUV+59sSA3Z8RKZOmFyNOXjFsGwBcs8jzAi/1g1eZUqzIrfmxZk5TL15hIvNscLzaxj6CmCFSCXQoW5R8Uw8/VE85Yc6GGvn1BVJRZhV6XKDR8fqTJD1uVjByXhOzINjEvY7E7HC0DIKyiWmt07ZW6qdDztdCDNI4sWXCBFRKVBPqbDw8F+tkGrd79Czql4Xkk/cWC3AIipcm/5bntTzmNO1xNnAM6weGFcrAUHfkjlC/swEDASJKNV73NIydI4Y7LSduxLWvXYdvllDLZITUTr+8L0iLBnhh6j0reBYK7u+uSrih127Upo1XzNFFxgtU8O8o+3i/xbIiZV80ICrZIBf3knl3xAycIt7wV07SfpD4YWROe+lBzDZpt3iUW5k++0SEglUpnPJdzi9+6dzyyj1MBselVPfRLV/xbkZQXpP8jS2KasMHPnvgww5O20hsXOuk1/0N9kadnCp0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(478600001)(6486002)(6916009)(54906003)(316002)(6506007)(2616005)(26005)(6512007)(7416002)(5660300002)(8936002)(186003)(53546011)(8676002)(4326008)(66556008)(66476007)(66946007)(31696002)(36756003)(41300700001)(86362001)(31686004)(38100700002)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0pBQW05dzkzNXo1UEk1OW5EWnNYZUpPRWFJVlJsQi82UnJPZGdzSmxZV3Nq?=
 =?utf-8?B?MzBualY1ZkcxWURCSTUvVGNETXV4bi9TT3QrRkdGdW5CTGRJZytPNit5aWZC?=
 =?utf-8?B?MDZiSDA1QWpSNmdLVHlGS3FvT3k2MnNPaDZMeklob1NIWGVGcElnVkFOVzhQ?=
 =?utf-8?B?U3BqbFVmelNicldSQ3c2bkRYZzUyTnNiSi9MWDY2VlhVNGJLUTJmVU10RU5a?=
 =?utf-8?B?TGlIS0RiMlA3bVZ5eDVWNkE5Nmc4TGUrYndvRXFHeUU2aEtRQ0tXZ0hOWERC?=
 =?utf-8?B?QkRsN2R4RmlNdG0vT2dRVURiM25UREw3RFdZZ3A2SThabEYyNWtHME51bFJw?=
 =?utf-8?B?YUxITnlPZURjSWl5N05OKzhCQ245eDlBdEszcGlEeWJDRy9JS0hJdVJtVXRh?=
 =?utf-8?B?VHE0UjFPalIyK3ExWWM3ajA0N3RCMzUxZjFFUkpOZjk2UlRGcmFrblRCNzBI?=
 =?utf-8?B?enR5eDZaQUVUK3h3K3hNakQ5RTdBNmk4VnY0aytDMVU5ZkRxL0VJdlhEaWNp?=
 =?utf-8?B?UmxLTjlNWFpkaCtaUno0SmdvUmlmMTZ4eVo5Z0ZyNFN2M3FvUVMwTUxlSnN6?=
 =?utf-8?B?ZU9qOEhLZW9qL3JYdi9KNUo0ZDZpTHhjSncwQkh5M0tmaWlUYUlCQzVSd0Zk?=
 =?utf-8?B?dU9mRlBmazBqejRsNk9mRkxHbXRHK0VUS2QyRTk5cmlPUEdRS1d3RStpSWY5?=
 =?utf-8?B?eTE4cDFVUmFWT1o1dk9pbm5RaWtVS0J3TlorY2R5cEwvRktBTkppNllsbUcy?=
 =?utf-8?B?dHJzK2N1VElPT3ZBQ1RIMmpneG82OHl1ZFNBYk1xb1J4ZjFEZTVlekFlcXhK?=
 =?utf-8?B?RnkxbkMyZExKOFJYdUZkOXh3YW9QQ2tDMDVoWGZVQUdJMFhQeWcyR01zWjRQ?=
 =?utf-8?B?aGFNNWZPT1hZaDRoUWVtU0VnK20wV1pLcVlaUDlWZTNUVzBYOTkwNkxxT0Jp?=
 =?utf-8?B?bGJFZTg2OE5La0dFcWUzeXBpeGxENVRDd0tXeUxFM2hjdGZXTDFqcWhoYThx?=
 =?utf-8?B?WHE5WGYvclBCdk1JaUJkQWFIR1RDYTczN2FGQVFTZmdMb0xGSTVmUEwzaWty?=
 =?utf-8?B?YXRYVmNMdkxCYUZIYmxFL1VtbkpLcWNWZzVBaFczSnVYN3VUVHJNVXBBbWlj?=
 =?utf-8?B?bHZHQ3c1bmVnVTNJdFZnWXdOT1pZbXh2MlpHSGJGSERTZ0cvMzEyYUhNY3k4?=
 =?utf-8?B?WnFVTTVlbFZIK2hYVHBEeFF3eVMrcUdkdnM4b3BTQU1jTDJzM0tLeEhkUGVp?=
 =?utf-8?B?WUJIbHJOaEJJdVlCeG5sY0ZHb2s0UlNmNWt6SzVIQ1psT3pXbXp6MzVSb05F?=
 =?utf-8?B?U3lLU1RsUGhYdjhoV2Evdk9pN1loRGZQSmo3UXBmLzRYUjRyeUxlQmJXSFNG?=
 =?utf-8?B?d1pncUVWcWFjT1pGVTMzZFFyYmRPZkYvamg0dDdlMVZUb3NtZERCaDBQVmJw?=
 =?utf-8?B?c2pXRTcxR20rT2NvY0I3b2hjcTdzQjNMOUFmNzFLTXpLSXVTcVRPTW9IWmpW?=
 =?utf-8?B?OWRJRVJRKzNiMjExNW5Qb01LeDZxR2dNbXRYc280dmhZWmgyVXptVTRSdm9k?=
 =?utf-8?B?cTU3czd5dXdBVkFiZllOYVA3SEZ3VnlrNzRiZUs5S3VrcFJOV1g3b2IxKzFQ?=
 =?utf-8?B?dFNaeSthbG9tTmFyQ2FmN2pRQk9Yd05QMnA5R0Jya0phdGJNMDZ0NllneSta?=
 =?utf-8?B?cFdkYVY3VUdYcDRhL2ZpV1RoTUpYcnVJbUpjYWwwS1p3R2pPVUFuUDh1enlv?=
 =?utf-8?B?d0IxNERvNDJXbnp6VXRwS215OUNGRE5jZ20rdjZ6djlyZzhKNFlnUFBOQ3Bp?=
 =?utf-8?B?bFpzWERVNnlXWE0wdWpIWlhZSVNFdGJxSTVTUkhMWTEzdlpUSFAvbVV3a0NS?=
 =?utf-8?B?Q2lMbnNLWEE2algrUFBKWjF4N0kvd2dGcXhuYVRBQVVWZ2F0d3lKZ1JoNW1L?=
 =?utf-8?B?bTN2Tncrd1RHVmtvSnVhQ3QxN0tDeHBIZ1g5Qk5NZnUyZFkwWnlDdFlIS20x?=
 =?utf-8?B?SzFiNytSOU4rdURka1I3dEw0TGF3bnBEQ0xwVWhsZUZGZS83RUM0Y3FWeVVo?=
 =?utf-8?B?VVZoaDVTSEZBbjhPT3JPMmxFNXRSMDY4SGZ4Z2xqTnk2MnpiMlZ3Q0E4UEF2?=
 =?utf-8?Q?xBH1ysKLM6SiVj52B6nRgXUqo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608a4d7d-43b1-452a-9ce5-08daa13e8712
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 10:45:15.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Y6w9iWy+NuY5snO4sIe5KgLLkM2MMnuITO0jgFWy0CRd7VWmB/1X9JUSjfWJ6i4N36fLEZbN4rhreJx6/SWjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8586

On 28.09.2022 12:08, Roger Pau Monné wrote:
> On Wed, Sep 28, 2022 at 10:01:26AM +0200, Jan Beulich wrote:
>> On 27.09.2022 17:39, Roger Pau Monne wrote:
>>> memory_type_changed() is currently only implemented for Intel EPT, and
>>> results in the invalidation of EMT attributes on all the entries in
>>> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
>>> when the guest tries to access any gfns for the first time, which
>>> results in the recalculation of the EMT for the accessed page.  The
>>> vmexit and the recalculations are expensive, and as such should be
>>> avoided when possible.
>>>
>>> Remove the call to memory_type_changed() from
>>> XEN_DOMCTL_memory_mapping: there are no modifications of the
>>> iomem_caps ranges anymore that could alter the return of
>>> cache_flush_permitted() from that domctl.
>>>
>>> Encapsulate calls to memory_type_changed() resulting from changes to
>>> the domain iomem_caps or ioport_caps ranges in the helpers themselves
>>> (io{ports,mem}_{permit,deny}_access()), and add a note in
>>> epte_get_entry_emt() to remind that changes to the logic there likely
>>> need to be propagaed to the IO capabilities helpers.
>>>
>>> Note changes to the IO ports or memory ranges are not very common
>>> during guest runtime, but Citrix Hypervisor has an use case for them
>>> related to device passthrough.
>>>
>>> Some Arm callers (implementations of the iomem_deny_access function
>>> pointer field in gic_hw_operations struct) pass a const domain pointer
>>> to iomem_deny_access(), which is questionable.  It works because
>>> the rangeset is allocated separately from the domain struct, but
>>> conceptually seems wrong to me, as passing a const pointer would imply
>>> no changes to the domain data, and denying iomem accesses does change
>>> the domain data.  Fix this by removing the const attribute from the
>>> affected functions and call chain.
>>
>> Personally I think this adjustment would better be a separate, prereq
>> change.
> 
> Right - I was about to split it but didn't want to go through the
> hassle if the approach didn't end up being well received.
> 
> Do you think placing the calls to memory_type_changed() inside the
> {permit,deny}_,access is acceptable?

Well, as said before - it's not pretty, but the existence of
memory_type_changed() itself isn't either, nor are the present
placements of calls to it. So yes, I view this as acceptable.

>>> --- a/xen/include/xen/iocap.h
>>> +++ b/xen/include/xen/iocap.h
>>> @@ -7,13 +7,43 @@
>>>  #ifndef __XEN_IOCAP_H__
>>>  #define __XEN_IOCAP_H__
>>>  
>>> +#include <xen/sched.h>
>>>  #include <xen/rangeset.h>
>>>  #include <asm/iocap.h>
>>> +#include <asm/p2m.h>
>>
>> That's heavy dependencies you're adding. I wonder if the functions
>> wouldn't better become out-of-line ones (but see also below).
>>
>>> +static inline int iomem_permit_access(struct domain *d, unsigned long s,
>>> +                                      unsigned long e)
>>> +{
>>> +    bool flush = cache_flush_permitted(d);
>>> +    int ret = rangeset_add_range(d->iomem_caps, s, e);
>>> +
>>> +    if ( !ret && !is_iommu_enabled(d) && !flush )
>>> +        /*
>>> +         * Only flush if the range(s) are empty before this addition and
>>> +         * IOMMU is not enabled for the domain, otherwise it makes no
>>> +         * difference for effective cache attribute calculation purposes.
>>> +         */
>>> +        memory_type_changed(d);
>>> +
>>> +    return ret;
>>> +}
>>> +static inline int iomem_deny_access(struct domain *d, unsigned long s,
>>> +                                    unsigned long e)
>>> +{
>>> +    int ret = rangeset_remove_range(d->iomem_caps, s, e);
>>> +
>>> +    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
>>> +        /*
>>> +         * Only flush if the range(s) are empty after this removal and
>>> +         * IOMMU is not enabled for the domain, otherwise it makes no
>>> +         * difference for effective cache attribute calculation purposes.
>>> +         */
>>> +        memory_type_changed(d);
>>> +
>>> +    return ret;
>>> +}
>>
>> I'm surprised Arm's memory_type_changed() is an empty out-of-line function.
>> This means the compiler can't eliminate this code (except when using LTO).
>> But then cache_flush_permitted() (resolving to rangeset_is_empty()) can't
>> be eliminated either, even if memory_type_changed() was. While gcc doc
>> doesn't explicitly say that it may help (the talk about repeated invocations
>> only), I wonder whether we shouldn't mark rangeset_is_empty() pure. In a
>> reduced example that does help (once memory_type_changed() is also an
>> inline function) with gcc12 - no call to rangeset_is_empty() remains.
> 
> Can look into it, do you want it to be a prereq of this patch?

Well, if done, then it being a prereq would seem desirable. But x86 isn't
affected by this, so I'd leave the "whether" aspect to be judged by Arm folks.

Jan

