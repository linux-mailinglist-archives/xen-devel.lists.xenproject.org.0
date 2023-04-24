Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805AF6EC761
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 09:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525163.816185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqu7-0002wW-Hz; Mon, 24 Apr 2023 07:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525163.816185; Mon, 24 Apr 2023 07:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqqu7-0002uo-Ey; Mon, 24 Apr 2023 07:46:31 +0000
Received: by outflank-mailman (input) for mailman id 525163;
 Mon, 24 Apr 2023 07:46:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqqu5-0002ug-Mb
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 07:46:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e6730cb-e274-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 09:46:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6951.eurprd04.prod.outlook.com (2603:10a6:20b:10f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 07:46:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 07:46:25 +0000
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
X-Inumbo-ID: 1e6730cb-e274-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGvhsRyLCMzFUKtWfqS1g2tPuQZ5CnTP3PPX7nK1ABgDT5daAMWzUmebo0v+BgAcpqFU+U9tvGTtv/zb2aQfUyjiIHWMBH5KtGNvtNV2T5Oxl1GJNGC99YMFsU1sbfa6QmdAcn+Z5JiFyoQmCuH5IddqIt+a/drvEO7yVSBrv8Vpn/zCtO12WYirhscpTqB5fe6Ok3NMOhG9W4u74SM7OJ0aYstKcbn39PC6eEGx7ODXXKrhejzGtW+hIg0GtdrGwxgu7Q06b2pQikjE/gOOyFS+t7CR5mXtu5IvW70OmOsWa2J/+OXtIlCXzG8UU4JbvEA2R47IasDa+i15dK15hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOigmP19IwE7vzgMkR7QKeTE0ExJfx78fcPYeV2EqxQ=;
 b=GtyXVqYJwBDQ+q2srdoKQWix4NyY3CJztjDgVzIO1yNGF8CUG86XZREhO6bAkjPZZlgqgqvxrJQObkGE8awP5WIQDEhLWbmmoPpar6niW28BCunZmhSLo7sWV4yZw2Fl7DrOx5jwPQ5ahnDW4ydBBHjrW3dfr2cnkPjFeWbFuZxzGWKPjep0ak85r27JfiQ2wmzyGIosYweRakpS6FJl8FnpP18s5gf0UoPtTtwX4HTRbOgMeUr4hszA/kIzqGJwroHVAiKMLPv6glbe4rkdr4UwgKuxlsONH1GDZpsitRKoIelg7LXDBOx7cwhWUtWiNgcf/PQ9Idv7gC6HUtgYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOigmP19IwE7vzgMkR7QKeTE0ExJfx78fcPYeV2EqxQ=;
 b=wx2v6ufij1tFaqt5R+bzn+A4SVRHIOQY6LXEqnyOJ/nu6XKbAOIN6S6++ZSzci3iLpADmFdMRgUBjDRo44KVwNVXVs+onEINKrTOdnOxzcqi3ZEf1xCVDRPWoW+4R96weVV0daa8wrPFR9ORsIvI4cC11i91AnkfCQLg3uGsXOLM34vGkKvBqEkIRwvu75JYV1ovT3PF6yPHPPVgQDkgyYySi1ZrBbylm1nT0YuHTw012xrGvnCzDCf8BUp2WwVA4flPMvpdXdQX6HUFt540Xpimau+PvnZgrhC2SgqFrMxOJpSj83gB7oAjznT4Iq1cwNdGuEGXTc8eCzRpLZmPGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb71c3f3-20a7-b020-6685-879bd4e5786d@suse.com>
Date: Mon, 24 Apr 2023 09:46:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger> <87354t8pqg.fsf@epam.com>
 <ZEKLN8AlzDUckorU@Air-de-Roger> <87o7nh727c.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87o7nh727c.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: c3011829-d758-4cce-d6c0-08db4498012c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NWshK5QFrJc0gXu1eTXhdlVw7mn/i3LpW2iu0/gu6rF6RTOQr6xJP94z+5rL+4TkminHP6VJygnH4DWoeq0L8D1qrRJ209h7pKdyCEF+XG6UDs1RPhZHlNXyAYdzraWSPzRL+w64EgON0dyg98a0b+/b7yOEzAIzHzjzG8qKaZ8iCtyQOgFHxM0r75gyRKBlmCzBPBnbMqsuQjkEKuLPRztasnX83VpT3iWZ9T2b68vA8T5asqyuaaPawfliLeP/1uI6w2z0pUZ8HvwvYCkJSSmsDGffZjD5xJsRw6dTxW+g/bfH1pkiYoylfkjggxt8GJv7F8IelbMHKXM2KgkVUJux1Fldp7XKLm6UHdbJUOKz+M4ct8t5i+fuuWo/gKSZfu8lZMzRF2vpGML/4Nsr7CsM81fkb6KUTxyUoSC802T6+ilFyh42akM9p9B0I1Wc0DfH84wN4ATECnKiUV8W8dj/KbVAC4vY5wI+6ULgsPkEaApNnDocplUs8B782D7dyfVNkfQ2aqYX8YG34Qw8x0XGA9xicaaun7dROKfGutdU6957LSvEPhwRsiiWyvp2xuv9MwlJV4d/yr6NCXvd6CTT8PNZoJMxEo8GsqMYNpssGr4MXhElL4+4Fq4bTwjl36UrZmvvNmtz7gh9531eVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(7416002)(66899021)(8676002)(8936002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(38100700002)(478600001)(6486002)(83380400001)(31686004)(2616005)(6506007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UitDWnU0ejZCaERJSitXN0VFTHRWUGNKS044QWFMZSsyZGR3OHBWY3U0ZEJj?=
 =?utf-8?B?aC8rQ1QxTkFCS0pBeW05ZWFJd1NhMWVYQ21PWC9jMnJyTjYyd0d5NTY3aENi?=
 =?utf-8?B?K3JuVGNpZmVqTWYvSjNvMUp1b2o0emhONG5FVmQ2T2N1ZUlCWDByV0RnbndV?=
 =?utf-8?B?aHN5UzViejIrUmJrVzlvQ0hEQnpqTGs5Y0tnaVNQMmljM0V2eDZpQ1dJWmVw?=
 =?utf-8?B?OWhFTTljRWZTWG1GZGlEWmlUU1BHYW1lR1ROREk4bkpJY0dFZndGRVN1VlN5?=
 =?utf-8?B?Q3J4VG9SOFpXQVVrc0d3a2xmZHRIalZVUklqVUVhckNMNVV6SlljR2FkbTJ0?=
 =?utf-8?B?WEx4R0VMRkRndmVId2F3L0xCdmRYc1VzMnlTSHpHS3ZOZGFUUmV0UTY2RWY0?=
 =?utf-8?B?NVZQcnZmdHkvM1oxcUFRMmJjUkl2YW9xNERWa084L2JZRVBKZmZKWlB6dExF?=
 =?utf-8?B?cmpHN2NlM1FCMzVLMk1OWTd5TVNCU05LRnQzZXNLN0Q2cXord1dtVUMzWDkx?=
 =?utf-8?B?dnpnNTF0cVZNRWJjeEtiYXhHVG1HVm9TRDJwTG45OUJzSElOVENFRlZnMDJZ?=
 =?utf-8?B?ejlqWUdpTWFqNkpxWkZZeDIxNC9UOFhLdHB3RnlleXZkNHVhaENFazFVM0or?=
 =?utf-8?B?UFRxZk92czFIQWFkRHBzWGEvS3gwV1RYT1FLS3phMW5UeXNjbTlJa0toclpX?=
 =?utf-8?B?UWpkM0trS2szdURvYXJyWHpwNk9lNENET1BzWUJ1TTNMZkN6RnZrSmdKVlRu?=
 =?utf-8?B?R05IRTNNSkNUcitvQ2dXOWw4OThwSGsza2owNjZNU3dUa2dGcXJvUDdlbFJT?=
 =?utf-8?B?NFBoOXBRQ2VWZGl5QmVZU0V4ZDl6RGxsT213QytyMVZnU2cvMmtSN1JGSHQ2?=
 =?utf-8?B?SWlxUVErR09UQk1FMWprbVRTbGtFTmVNb1JaTWpmdERmSXRFM1VoYzdSK2VW?=
 =?utf-8?B?dVBXTERMT0NsV0JpdllqcXRDTmsxOGRFTXhYdVcyd2dsL1JYbXpyMWQ2ODRH?=
 =?utf-8?B?VHRVcVB6WUNOMzRYRDlwNmVFTU5NV3ZlczVHeVRQZk5zSHFpWGVoK2dkdDlI?=
 =?utf-8?B?QXE3SzRtOEc3anV4RFlwSm10RGRkUzVxcWs4bG5PelRZbnJwVm1ZdkZFbmJv?=
 =?utf-8?B?NVVHUTBGSGFxK3paTXNYSzJSa0xkWStXMVYwenEzUEJpbS90RHhLZjRSNU1q?=
 =?utf-8?B?WVRNZURrbEVjTHVrNVFIc0tNanAyN2U4OUFRTGJmOXVlL0JrYlFSQ1dwQTRo?=
 =?utf-8?B?WG5xbVcyRGpGaVZkL2NTd1RKQXIvalNZeng3U1dCdG1Ra2t1c1c0UldHazd1?=
 =?utf-8?B?Q2ltNFJzQUZOMFpVc1FOcVUvLzVxeUp0aVlPdEpvdW1XUDdaZTZGbDlHZGor?=
 =?utf-8?B?LytzbWdrR3ladnVoZ3Nxa0lCUk5NaThRbkticmV4SXlsTm1PVjdwY1gvYTVx?=
 =?utf-8?B?b2xZSGZlN1cySHZJU1BDZjhTMm4yVm4xSE9XS01WSmRSdFhVZGkyaFhrY2R2?=
 =?utf-8?B?RmJldXBGc2RzNitkZGlVWmZCNEswMlh5S29QSHg0ZmNPZTRtbjB0REpqb1lO?=
 =?utf-8?B?YW1CMHNLTzNNaUM1TDFHa0JQQ2IzWmVETGNib2UyVlhvL1VKcE5CZjBrZk40?=
 =?utf-8?B?c0FCZmdSTW1Qa2JjY0NxSHY5TWZ4bWxVYUJQR2xKUEM2bDRIMFJONCs0Z2R5?=
 =?utf-8?B?b1grTXZUOCsvMjVsWU1XNmJEQmRYVTlIbmJGQU5JZHBVSWluWjYzYjBFQlQv?=
 =?utf-8?B?djBMd05iNmkvVTg0UWhvYjZubVdTV1BQV3BLMU9RQUFqTWdEMHJTM3c3ekRz?=
 =?utf-8?B?d0VrUm44NVRIMEFnWnM1Znd0T0lBWWlVYkdrdThQL2k2ZlZWRzROWUVkeDls?=
 =?utf-8?B?LzdBby9XbHNSbkloc0dvazdSNCtiSmRibVNsN1FRMUdsSkgyL1dKV2RHbFZT?=
 =?utf-8?B?Qkp0R25RS3dsbWNINzZVbVFadUdpRmpWd0Z6djIrTGtVZEpRd3RzSkVMakxF?=
 =?utf-8?B?UUVCWGFwb0YzTVdPTExrRW5YazBJbFZMM0dOeTMzVGoxeFRNNWlSTVh4M3hE?=
 =?utf-8?B?ejQ2UEVEb3VDY0M2dXp2akxjQ0xxQ2I2Zi9DaEpDdjU0NmdnUkg5L1kvbHdV?=
 =?utf-8?Q?T5RhK+42c9PAwxzhMxkGgbIFJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3011829-d758-4cce-d6c0-08db4498012c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 07:46:25.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx+/xV35TwgtvQMVDjwZoCGCDP9cocR7v6dJ4mZpGk6CLLSALGgXiMcSYK8uFR7U4EsHDd9NHF1gyQ0l+hzN2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6951

On 21.04.2023 16:13, Volodymyr Babchuk wrote:
> 
> Hi Roger,
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
>> On Fri, Apr 21, 2023 at 11:00:23AM +0000, Volodymyr Babchuk wrote:
>>>
>>> Hello Roger,
>>>
>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>
>>>> On Mon, Apr 17, 2023 at 12:34:31PM +0200, Jan Beulich wrote:
>>>>> On 17.04.2023 12:17, Roger Pau Monné wrote:
>>>>>> On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
>>>>>>> Above I have proposed another view on this. I hope, it will work for
>>>>>>> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
>>>>>>> after returning from pci_remove_device(). By "harmless" I mean that
>>>>>>> owners of those refcounts will not try to access the physical PCI
>>>>>>> device if pci_remove_device() is already finished.
>>>>>>
>>>>>> I'm not strictly a maintainer of this piece code, albeit I have an
>>>>>> opinion.  I will like to also hear Jans opinion, since he is the
>>>>>> maintainer.
>>>>>
>>>>> I'm afraid I can't really appreciate the term "harmless refcounts". Whoever
>>>>> holds a ref is entitled to access the device. As stated before, I see only
>>>>> two ways of getting things consistent: Either pci_remove_device() is
>>>>> invoked upon dropping of the last ref,
>>>>
>>>> With this approach, what would be the implementation of
>>>> PHYSDEVOP_manage_pci_remove?  Would it just check whether the pdev
>>>> exist and either return 0 or -EBUSY?
>>>>
>>>
>>> Okay, I am preparing patches with the behavior you proposed. To test it,
>>> I artificially set refcount to 2 and indeed PHYSDEVOP_manage_pci_remove
>>> returned -EBUSY, which propagated to the linux driver. Problem is that
>>> Linux driver can't do anything with this. It just displayed an error
>>> message and removed device anyways. This is because Linux sends
>>> PHYSDEVOP_manage_pci_remove in device_remove() call path and there is no
>>> way to prevent the device removal. So, admin is not capable to try this
>>> again.
>>
>> Ideally Linux won't remove the device, and then the admin would get to
>> retry.  Maybe the way the Linux hook is placed is not the best one?
>> The hypervisor should be authoritative on whether a device can be
>> removed or not, and hence PHYSDEVOP_manage_pci_remove returning an
>> error (EBUSY or otherwise) shouldn't allow the device unplug in Linux
>> to continue.
> 
> Yes, it would be ideally, but Linux driver/device model is written in a
> such way, that PCI subsystem tracks all the PCI device usage, so it can
> be certain that it can remove the device. Thus, functions in the device
> removal path either return void or 0. Of course, kernel does not know that
> hypervisor has additional uses for the device, so there is no mechanisms
> to prevent removal.

Could pciback obtain a reference on behalf of the hypervisor, dropping it
when device removal is requested (i.e. much closer to the start of that
operation), and only if it finds that no guests use the device anymore?

Jan

