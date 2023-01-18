Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BC67184B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480373.744836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5AG-00015P-Hv; Wed, 18 Jan 2023 09:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480373.744836; Wed, 18 Jan 2023 09:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5AG-0000rw-7m; Wed, 18 Jan 2023 09:55:28 +0000
Received: by outflank-mailman (input) for mailman id 480373;
 Wed, 18 Jan 2023 09:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI5AE-0000iQ-C6
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:55:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05ab9339-9716-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:53:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7977.eurprd04.prod.outlook.com (2603:10a6:10:1ed::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 09:55:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 09:55:22 +0000
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
X-Inumbo-ID: 05ab9339-9716-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEIzkgDE/p2AudjTXsKqpk8BZ3dvMyE/9Y5nKgCix+dp0+HS/l0S2XhaiNDac8fuqpVjFAbv0KVtDapQM2JNvyyXx4t+4kVTWtZxUb6M6yxvuusdxh85ndgGrzbWlPXt5CTfPcjeICHSkX4I7Me7rjWWYrje3vtbpiKec/W6P76eCJngozpTfcReAYGzizK6pz+PGp4ufiwU+fa2QbaUu0upkIRY44795hpVxMQYTZX6gW1mig4v/SvbN6XHaGuiMO2LjvQWe+L/BkiJ+gR2efIKlD7rCEPiKuzBQ01XBeXtXWU2v6/WCh+LCOis1hN0jf9mYqaKGEZuTsKXERnM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHORsIA3j1uSHkrpYne1jaxtDvRUxlw3LmENpIDvF9I=;
 b=VRasEoIsRQSTXW3wrzteeDz6UlYuZwgLTqFTkKdXF/++/ZW1P+qgueDHDcTmrUc7TF2X13eZ/jbsBeRfIHlzd8DgKNDdkgBGCRmD9w2IR3Z3njk1cTPO2gc274gvbknEQS9RYMuz4KHrsJxop+pMfyLtBKBNbiIMCALIKCbtfGntL/qgZm/TDrchEckMKnzg71nQ+3m1OQCWhe5QNOl237Jc35QuzcUKhwhMJVWp6mwnSEaoxF06DTmnFaqauC6VPbFObQEU0OXnYj9osrpQdxLusyNnrbNMZZmUT+oFrRAx7Pxf3jsm3Yia+a/SMGdzOdTqM6qjcE2khTguXCfLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHORsIA3j1uSHkrpYne1jaxtDvRUxlw3LmENpIDvF9I=;
 b=24Ug8qWqgWPffOCUo4YcieyYqzLNpAGZNpAC6upe55HmgicZvIxtHR1pJ/sfso6p1LS+0NqoJCDb47TbXka0U8F17Dvt2Znyhl996iax7rx6nFrN5R2Okkm+/ZsCeMjXFcTGLNWHMlgMjm+ouIqfTjs7uB21vwVImBKz9XEzAFU6cho4kildB26clpPvLLuYK9LaxLGwQYcsj1bORRGhjHVFvdahx2WsWTM1UtT55gVbz4M4BZBHuvQWeY2XQ1nHgZd59BBGvsl1LOgJdhmPtQAsAcSpta5V5dK+0yCrtV8hY2aSu3pE4mpWZ4mRW2fOKXkytv8W9huMlpB3wz8mag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24a2f51b-e69d-7a44-5239-79f5f526ef01@suse.com>
Date: Wed, 18 Jan 2023 10:55:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <ed4d8d85-2ba5-74c1-7c65-0ae65bf0ee06@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed4d8d85-2ba5-74c1-7c65-0ae65bf0ee06@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ed693e-6d2f-4c74-67a3-08daf93a1d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/dUBKf2zNZlCLDIiUPMD1dZ5v5UJVNsfRWMHQit50WV/mKxI4LUBbXvGf5RdF9SXDf2I9RJD+biNNzcV0Kvs4rAZkz+cznXsmf24vG0PbtiknBkqug1ZrBFGW+KpknDQGdLpLfuvYmW6U30YAME08lL5CFFqhwEw1CijNmVVMDbsoLOryv/F7kQ+E54mqeR/r5/wZzr119Ajw0MPZR+l93U7kbsrmcYypicpEz61LfgOfh30nkTAt65J1GqOH/vgQ1/7TVwWljriOIaRP4DOb28ga7bDjfXVHudZVLaF/RtpU5Hrgt8UthpYVIscOvmqukImXM7bWW18VtQEZuG3vM27d4tfnoPdmLp1e750wWajVQUIr1wzxuURUsSgJOcOfhf+r2NmcqUO15omTYdY4Ksi4RrjO5467KZ/wHoAp44AUcLh/K9BD7/wXh7smJVtc2bWShwHYVFTvcNVe2/ZAfeKzA5zWlbnwfyKbmVNrlG65M1fQ9vzyGQxgXsj624+QwZH3qfWUnwEI5kRQ13tLGxOBE8tnfk3u4/6a1ebEk5hUB2cBnnfam2Y6yg2uhq4sNJKnAPo9CuhkjDSQkMlykrvQT0QFvx15vRxzEiyheR6xM9QJbtKRZUyhPJvhgwZbEAP29bIg41PZZFB29m5Eb7xiYYS0fXvNUQ3z5m9DGNzvnXTZOHbvq542R8OzSq6+MK1QwNW66nM/h/Vapdz7/YjzI0NWl4BVeJ1KTnpBcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(478600001)(4326008)(6486002)(38100700002)(41300700001)(86362001)(2616005)(316002)(54906003)(31696002)(66946007)(26005)(186003)(66556008)(5660300002)(8676002)(53546011)(66476007)(31686004)(6916009)(6506007)(2906002)(36756003)(8936002)(6512007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHRlYUR2ZXdWRzlzM1JibWNRRmQ3NloxUDYxQ2Z6RlIyWUFoSUQ2Mk42MjU4?=
 =?utf-8?B?em5tbDZBbE9mL1FoWVpxYVFjYkltUmlZcWlpRkJNd3dYU1FyWkZaRWVqV2FI?=
 =?utf-8?B?blNpZVpsbEN1Ym1STlVmb2lwU28rWXZTTk0ycWJNcGFZUzFXa0I5b1FGQmda?=
 =?utf-8?B?MlBvWFAyald2bEFnN3l3OG9VdzhTbUJTdW0vOHpUdFlyNVJ5ZnpsK2haWEJa?=
 =?utf-8?B?SVR2Z2o3RE03L3NucUgwcEIwNXFPOUtZR0g0K21lbTRBSmhmSlhzUWQxY1JZ?=
 =?utf-8?B?Q2kya0hkMkkvRURPcTI0ZHdrSjBGREJXb2hVUFBWTWZBZlhCVEx4WW00NFUr?=
 =?utf-8?B?bHB1b2hJRGhQY1hmL1RIOGp5NHpTY0kxelNhQjBSTXZuMnpBOFJkc1BUdThk?=
 =?utf-8?B?V3NmYnF4U1BzendXTkFvR0NmOEZMMnU4S3l5WXVIeWMydkRxbmhpbWJ6cUVS?=
 =?utf-8?B?YWoyUXhQNHZxdXdGUStEVTFMeWtsWmI5ODZiT0tKQ1lhMTBBajdacHAyMUlh?=
 =?utf-8?B?SVdibWNkLzB4VVd5enFhbWhrRGVnY0hPZkUvVzk4NUpSRXErR2JpMkE3UG15?=
 =?utf-8?B?NC93VWZldmdCTkRoaFUwY2RUWHl1bkpTa1FVWUF2d2ZndzhTdTZOVTRFQWRr?=
 =?utf-8?B?Ly9xK3BsS0NuMysra1ZpcUkzVCtJQTB1bGl2OGVqcGdwY0pHcmlTZzczcmhw?=
 =?utf-8?B?Q2NqL2NyVnZTL3RuN3grSVJnaXJ6RGFlRTdTYkYzcmJMaHBQM0l5emduMy9X?=
 =?utf-8?B?STB1MjJXcWxhaWYyS3RhcGc3Z2Zra1lveHNWcHVLNFR5eEI1NStyUWNsQXFv?=
 =?utf-8?B?MzlkVGNia3RFS2U2ZkEzWi9rYjF5Sm1xeG5qOWhmeUtiUFVtbWg0czVEQ0hm?=
 =?utf-8?B?ZGxCbEdZRlVkWG5ENXQ5WWQ2R01LUlBGbkhLeExNWUNMcGNiT1NUS0ZoN1BW?=
 =?utf-8?B?NFNvV0FCck9UdmRDVzd3bGJjNkhlQzIzc1dDMm5mak5WQTdHL1l3bVoxS1Rl?=
 =?utf-8?B?dmhUYnVHbmlBOHhXNVpxc004eGVzSzQvNUtrREhubmUxT2d5SXNqdGhaYXJE?=
 =?utf-8?B?RFJvVWJ2RVJWUlp0QjAzcWorU0tYMEs4MXNYTG9tNW8xYkZIVmJIN25SODZB?=
 =?utf-8?B?Q09xZE0wM2lkL3E4OHhPR0dJMGhibW9TNDl3bGxpU1JZTnBnMjZpZEkzemU5?=
 =?utf-8?B?RGZaSWR0OFJucU5MWVZVbDFCQkUzbnRjSkdaVlkxblNrRlZEWk9xV0MrTUF6?=
 =?utf-8?B?a0kxZWhPVnNIRTJTTUtSeVhWcmpSQUc0N2tSUnRGejhPejdTSTIwY2VRREpv?=
 =?utf-8?B?alhQNDZhS093UnVzTkYwc2c3UExJd0JVV3lKM2FzM1NBMXpacDgrVUJwclFT?=
 =?utf-8?B?aWt0OUd5ZVM1dXF2aWU5bWxmdDQyTjNLQ1BMT0czdUdQQkljZkVlbWNyU3B2?=
 =?utf-8?B?cGxVUllEOHRIL3ptSnEwTVMydUtSVklWbjJiOVpPTTQ5bW9qVnJqemZaWjBE?=
 =?utf-8?B?cElZUXJwRm0ybzY1ODU1Y1QvUWtjVUhuVzJ3ZWpzK2Z3WldmZk5lVzFJNm14?=
 =?utf-8?B?U1lDTEJ3MGxiSGNlaGNndWc5V0JQYndvMTIvK1JjTCtKYXZDNnA5eVhUWHlV?=
 =?utf-8?B?dDI1UFNTK2xtU2JGNlQ3Vy9UWUlVNjFnSVVkenVmN1ZkMGozMmltelU0R3hF?=
 =?utf-8?B?dTB6SU43eXYveHFsZC9rMVRTNkNtRmRLV2ZNTEJaVVdiSjkvTDZzeUZGbVhO?=
 =?utf-8?B?c1Z5MVBXbHFZYUFFT0VxZ2Nqdm9UU0NtZDdZUFk4Z2lzMHJ4MmRwa0dWb0xt?=
 =?utf-8?B?N3k0eWNEV1FHckxJcFFnUmNtQ3I0ZTR2SW9jYXFxSDJlT2pHbmhGOUNoSlVs?=
 =?utf-8?B?bTkrMTcvUXlqZXBnUnNWV2VsTUU0MlJSQkxuZUdkODdJb2VYSWhYczgwVUUw?=
 =?utf-8?B?cVNKejNPTjY3ZC8vbUN5K3RiOEhObDV6a3crd1RQQUx4SHE0c09tUDhLZ3R5?=
 =?utf-8?B?MjlxNFQ1M3FCVFF1cVJBY1lkWTNyZlBZVW9Tc1BnRkgybFZ0aGtYL01jQlhB?=
 =?utf-8?B?eHBtZEJtV0Q1Qyt3dXRFOVM5MGhRa1pKZUFRdjNoekh2RUYyTGxhVEtXdTVU?=
 =?utf-8?Q?LKUlm5q6Vl764z6dK5YaH9Zn3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ed693e-6d2f-4c74-67a3-08daf93a1d28
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:55:22.0515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbX9Vbtf31pei0tO0V+joiyLaXCmXzo7rLYDlD/e4criw7DZsZrtoVWONMCxwRcdgvi7C2VJQxXl+yl3Y5bPCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7977

On 17.01.2023 23:04, Andrew Cooper wrote:
> On 19/10/2022 8:43 am, Jan Beulich wrote:
>> The registration by virtual/linear address has downsides: At least on
>> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
>> PV domains the areas are inaccessible (and hence cannot be updated by
>> Xen) when in guest-user mode.
> 
> They're also inaccessible in HVM guests (x86 and ARM) when Meltdown
> mitigations are in place.

I've added this explicitly, but ...

> And lets not get started on the multitude of layering violations that is
> guest_memory_policy() for nested virt.  In fact, prohibiting any form of
> map-by-va is a perquisite to any rational attempt to make nested virt work.
> 
> (In fact, that infrastructure needs purging before any other
> architecture pick up stubs too.)
> 
> They're also inaccessible in general because no architecture has
> hypervisor privilege in a normal user/supervisor split, and you don't
> know whether the mapping is over supervisor or user mapping, and
> settings like SMAP/PAN can cause the pagewalk to fail even when the
> mapping is in place.

... I'm now merely saying that there are yet more reasons, rather than
trying to enumerate them all.

>> In preparation of the introduction of new vCPU operations allowing to
>> register the respective areas (one of the two is x86-specific) by
>> guest-physical address, flesh out the map/unmap functions.
>>
>> Noteworthy differences from map_vcpu_info():
>> - areas can be registered more than once (and de-registered),
> 
> When register by GFN is available, there is never a good reason to the
> same area twice.

Why not? Why shouldn't different entities be permitted to register their
areas, one after the other? This at the very least requires a way to
de-register.

> The guest maps one MMIO-like region, and then constructs all the regular
> virtual addresses mapping it (or not) that it wants.
> 
> This API is new, so we can enforce sane behaviour from the outset.  In
> particular, it will help with ...
> 
>> - remote vCPU-s are paused rather than checked for being down (which in
>>   principle can change right after the check),
>> - the domain lock is taken for a much smaller region.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: By using global domain page mappings the demand on the underlying
>>      VA range may increase significantly. I did consider to use per-
>>      domain mappings instead, but they exist for x86 only. Of course we
>>      could have arch_{,un}map_guest_area() aliasing global domain page
>>      mapping functions on Arm and using per-domain mappings on x86. Yet
>>      then again map_vcpu_info() doesn't do so either (albeit that's
>>      likely to be converted subsequently to use map_vcpu_area() anyway).
> 
> ... this by providing a bound on the amount of vmap() space can be consumed.

I'm afraid I don't understand. When re-registering a different area, the
earlier one will be unmapped. The consumption of vmap space cannot grow
(or else we'd have a resource leak and hence an XSA).

>> RFC: In map_guest_area() I'm not checking the P2M type, instead - just
>>      like map_vcpu_info() - solely relying on the type ref acquisition.
>>      Checking for p2m_ram_rw alone would be wrong, as at least
>>      p2m_ram_logdirty ought to also be okay to use here (and in similar
>>      cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
>>      used here (like altp2m_vcpu_enable_ve() does) as well as in
>>      map_vcpu_info(), yet then again the P2M type is stale by the time
>>      it is being looked at anyway without the P2M lock held.
> 
> Again, another error caused by Xen not knowing the guest physical
> address layout.  These mappings should be restricted to just RAM regions
> and I think we want to enforce that right from the outset.

Meaning what exactly in terms of action for me to take? As said, checking
the P2M type is pointless. So without you being more explicit, all I can
take your reply for is merely a comment, with no action on my part (not
even to remove this RFC remark).

Jan

