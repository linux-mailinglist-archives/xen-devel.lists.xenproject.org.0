Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B567185B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 11:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480415.744846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5Ee-00047f-CD; Wed, 18 Jan 2023 10:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480415.744846; Wed, 18 Jan 2023 10:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI5Ee-00044j-9J; Wed, 18 Jan 2023 10:00:00 +0000
Received: by outflank-mailman (input) for mailman id 480415;
 Wed, 18 Jan 2023 09:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI5Ed-00044d-BE
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:59:59 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2074.outbound.protection.outlook.com [40.107.103.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd7e021e-9716-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 10:59:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8543.eurprd04.prod.outlook.com (2603:10a6:102:216::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 09:59:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 09:59:55 +0000
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
X-Inumbo-ID: dd7e021e-9716-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLm9iIdiZPTDsLXrWa+r6Pxmn7NL2GAW8GLtE3fGgHRYaphcHbBUq5H8ScxR0rX+WLnqWMoGDoiHUFn3w+kIZK/DM3ONpD7d88u7x4yrR7U8sRVfZebKRajs8uVuSBrP+qrKkXbH7jx0m1oClAwGxC7YiBiGWJOzSkZDIq3deZ3ExokIAFz0VI4n/DveNoYCc6Sr33yz5IBN1/AoZAe2nR/pfhirx8xmk1ut67QSi8DSjfSUPC6ILTtLziASls+NfAVlyWGuASjEVipAdngtJZEpAkPuiN+QFTFm4ZBaTCrhullkfopCVDTHQmRwP5u5tyj25JFcjpPSxTXd+HxztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1jOVNpuZSEM8EbRyRvvAhG8Ue8DujHER+LuUnwlwtA=;
 b=ZVXVW27y094jBSlY+LUnWuH28TuXtSslkcgyH2rTsDPdMkAA0amAa878eb2WmVSOcMTcjTVgNFwmouvTZ1/ieFlGr+INlKQ589nDChumcuKkLJFS1zTAkAQ0kPmJ73445Lnq5NPAUQ09Yc9bvV8qBLreX2ODte4+Czb9OBuYW4YsI44BkvMZapgK8hq+mIdqa9JjAqrufRcO3czQt8s2A8Yf7vRYSormws+IIsPMnjjb2RKASONeqViVJGkpBpDvjicYbujMkPqUHmG8bVWiyObglY2crnhHL7vllTGY7+T4tlljZOdItXq+g1S8CGpz7YaaKCESYG3sLzJCO6/ZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1jOVNpuZSEM8EbRyRvvAhG8Ue8DujHER+LuUnwlwtA=;
 b=PJQmT+AkIsRVW9XdVqZt0dgh5/Ba4Qw8QtyBJlo/t5W6ihBJ1WwP4tOILx8dxwwsMvEb5G56HJmI0y5IC1gv6vAbu1z/YETEQz1vmDgFrv9QuwDOEIWmgvIxeNDB4Fep24PSXEdE2yEbEAMQpIVCW1Q9RE00tkv8LMat6boxOqNYHqnnKpQH4JP/KWKw0q8tqYlDj1Tv1Jw8urxSZzdd8BUS0IhIY0at7wiD1jXS4D+rXAvEiClxL8JGloRvk+PwrwlA9ROSVBKvEmplDXhGJpjnv5YdORt7oJyqxouDjjO9JyaH1NMHHm+b436U/L64VHW0WTkr5Rb5G7JXLlRC3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e87f4767-eb62-fc70-788c-d8afa45f6434@suse.com>
Date: Wed, 18 Jan 2023 10:59:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <f1229a27-f92c-a0dc-928e-1d78b928fdd0@xen.org>
 <bd6befdf-65eb-6937-fb85-449a5fa16794@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd6befdf-65eb-6937-fb85-449a5fa16794@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 1852cdfa-7472-42b7-d190-08daf93abfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CULb4g6IMtfemwOzvUNF996QXAxkQ8m0rKG2wrmJPN0OiFtrIM8NZr0qFMnJ9m2e4H2ez2yWKGCL+slYmVaG7iNNrH/d1nHxz1Mk9ZztsekRDXS5ujgOFTDF5iYglQfHU1Iv53GPMOVN0FZZt1fQUVCBSQfitWfS1Z0darGFc8ZbslrpFTMGY1Om1A0KoRdTKx1qU5YQttNLVQzaz1cI1pZW2NwiG+df0p5qLgv1smYed+Yg2/vu3MSGTlwdIaCQtvP39Ot11eijCm0EEPwMc7dxPhd9HqFnSz5nVYrVx8Dp46BnggfzAXG1aoBQZ6yde1E0neYTW8oIDS6TFboHBwRngZjwsRF/ByTygFFShfbK+5Og1IDPc0tqsoIlS68ZNI1X85oYZ4h/DZiSnPPz1SIXduq9HT8BcO9QPydQjPJmZyPDXQYBmgR5shy+f9F6os82JGDgy+X0NsYzYOgTbiNu7KQTAvRnNqrOYYibToOXaFdTCKbgYwkkvUcO4a61qPZCOGVrFl//JquZzCOeq/cNApEwqKiOuP+txyDRmD9tOilT0Ps9BSzZuc9mS9icySLOU5+pO3TQ6xC8ahHrSek1UW9V9DIyCHpPViccLl2gYckGbFFphoZMv/OBvoe3et4jBol1tXhANozWvaiHVGA67SeWtpOL+KrGIerdVr5DvoVHFYCM9JP5+0XfA3Ur+PfNR7UCFbbk1l/2nn/i77NSFmd3sSs1vGLToE5Qmsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199015)(83380400001)(31686004)(6512007)(6486002)(54906003)(36756003)(31696002)(478600001)(186003)(38100700002)(2616005)(86362001)(53546011)(8936002)(6506007)(2906002)(26005)(66946007)(6916009)(66476007)(8676002)(4326008)(66556008)(316002)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVgxL1k0RXd6a05hYjNucUc3VjRFTWp6OTg5Wi9QeFVEUkNpVFJDNGdmZ09I?=
 =?utf-8?B?N2FtS2NPV1VGczBaTWJrbEdkTVo0T3dwcWg4MjAzZXFsNU4yRmczWUNadCtD?=
 =?utf-8?B?SE51YmVTTEl0YTg1SE43WGpSczFScUdOczlnNEVlV1dVeGVGVzgxQXJGVzN5?=
 =?utf-8?B?Zk5zNThjazBxcUxBazZJc2VLSkhmWjR3SDlnL0poV1BZclQxbm8wNGlpclRk?=
 =?utf-8?B?UmxFMk5BU2pzaGJsUGJlQ1NYZzBKSzRaNVJTdmJDU1ZIL2VzSDVHaEhhY0Ni?=
 =?utf-8?B?akpEaFFMMTFrampqZ3o1WWI2OUhqdXRVc3NyakxQRXhsZlFyTXNiVW45aWZi?=
 =?utf-8?B?Zm9mWWhLRWNBM1RXR3JvakZlSnI1dk1pYjlQcUh2SVR4WVR4cFhsbDBKVnRK?=
 =?utf-8?B?OG8zTitScjRDNE05L25ieXhqTTJoa2NMZ0tLRDJyV0JkWGJHbE82UnlXYmVN?=
 =?utf-8?B?aDFDUGdwM3NDdnBUYThjQTVXakpDbUJreENZaWVwMkN5TGxWWFIvR1Izbjd3?=
 =?utf-8?B?eGlJNFpjS3ZyY2UzcTVLZy9ha2gyYkV2S0xMM2VQQWFBdGZWRnYvMEIwMnFw?=
 =?utf-8?B?aGRJTGdpNjBHclJadVhCZ2xCNUFDbUprWkNnUzN6TFlTZ3llaXl3bERWTFpM?=
 =?utf-8?B?aUtlNVZzbm9MUEdTL0dqYllLeU1uM0liTHJJQTdSRGxPMXE3ZjVhS1dZd3Bu?=
 =?utf-8?B?VnBWUVRwcXBlakZLMEJaNWJ2TFpHcTNqRXV5VGtCZGRCWHZiNjArd0svam9Z?=
 =?utf-8?B?WGo0Nmk1bW55dFhleW5rb3luWDJNMkhaVFRBYkk0dmNYUGZOSW9jK2Qxcldn?=
 =?utf-8?B?THNLM0FiZVQ4U3FTdnp0NGVFVWI5VEtrSnVkd3MwQTNwcklMZVNWN0RVVVVn?=
 =?utf-8?B?dDVUT094d2x6am5vODFyaDh4MXQ2WmpiSXYrQ21uWWU0bFZDcjE0c3NrS0cr?=
 =?utf-8?B?L3ZSWXY5WUxja2xWZzdYWGdkWmI1MFAxTnR0c0w3eUdQejM3c3pZeHdGUmEv?=
 =?utf-8?B?Ry8wMmVaM1NHTVdiZkV4L1N0R1F0bEJtamxySmU2OXpTb2RBVEk0RHhrY3dZ?=
 =?utf-8?B?UFNRaGI2aG15VHNxTW1DQlEvdjNlNnp6VjRxNVlldXpUUGQvNHFoaWQ1QUF4?=
 =?utf-8?B?dFlqRWw2TVNlVGdrc3krRXpXUFQ3OEJyc1laRHZiTjZLL3dhS1JuZEF0Qm1C?=
 =?utf-8?B?Q3B0dEtGTDNLTUxrVjhKQUlMWDBIM1FwWGo3M216cnRHZGRtZTRmVWNMbzcy?=
 =?utf-8?B?eXU3OCtFdkxOSHM4aGUzTUViemJBYjdHNVJJSTVld2tRTGM4c3BDZWxNUUt2?=
 =?utf-8?B?QWFrMnRSYzJyanRJWDJDZnk0Y1Y1UndZSm10cTUyRDFsR3B1YUdKWS9RTE4v?=
 =?utf-8?B?dzBPZCt2RllDdVBoMFBLU1F4WXhnZkU2dlEvVDkrKzFQcXNWWmdXdDFBcTNX?=
 =?utf-8?B?TFVSNDNTV0IvVVJBNGtIL3IyNkhYNUhMNmVDVzdjRnlTeEsyYXI3Zlk0dFk3?=
 =?utf-8?B?Zi91Zmd1cVoySnVLQTVwWTBzNFBQc0U4ejJldm9HUUFWRjR1YVprZXdFSXpG?=
 =?utf-8?B?K3Nlck9uUVhBbVlncktGWTBHSitCbFhvc3FwVHU0K0JDZ2hrU1hxODU4QXpQ?=
 =?utf-8?B?ZlMrMk90c25EWTVIMkRRMjlIVTVBYUYyT3RTMmkrdks4UFYyanRpeFhTMTNt?=
 =?utf-8?B?cVFtYVJTRjhGKy9Bd1ZGdm5DeUZsaExOMjhKZUw3TGpVUnZxd3Y0OVo3NTZ2?=
 =?utf-8?B?a2IzcFRTNHlMRWtwNHB5UFRZSE1pTlJKL3hIb3E5SXQ3NVJvOWozaGUyT2tE?=
 =?utf-8?B?Y1NjSTJiZGZEUkdkKzVQMW93b0lIK092Q2Fhc0ZWbFhjcEwyUHZ2NkZLbDJP?=
 =?utf-8?B?Qkl0TDk3eEVUaW91OHBqYjQ0NTNFeUExTW1VSkdYdk52YklRRnlYNWtncDh2?=
 =?utf-8?B?by9raWVBSEliTXRBc3d3ODhLVHIzVkZwUmJ4cm5wQXlvSzA5emt1bEpBTkRX?=
 =?utf-8?B?Y2JWMlN5WW1rOWdiYmlUTU1HeGFGNkYyL1RReVA1TUdYb0toZzlyMFFOVDBw?=
 =?utf-8?B?Uytyb1pFSzAyLzFjTzVMMFVoUW1jN3h4dHVKelhwVHY2WDR5QjVNNTJGSE1K?=
 =?utf-8?Q?LUGenVtwIoXj9YE4m7lP8k8CA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1852cdfa-7472-42b7-d190-08daf93abfe7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:59:55.1750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9WuDGq4322BWM5IVwiMq3WsJLnJjZ8npmIS1pz9KLmg//zCACEKBQxKrWmYgmpjIi70kRyUHdSvRAXgUdo1DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8543

On 17.01.2023 23:20, Andrew Cooper wrote:
> On 24/11/2022 9:29 pm, Julien Grall wrote:
>> On 19/10/2022 09:43, Jan Beulich wrote:
>>> The registration by virtual/linear address has downsides: At least on
>>> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
>>> PV domains the areas are inaccessible (and hence cannot be updated by
>>> Xen) when in guest-user mode.
>>>
>>> In preparation of the introduction of new vCPU operations allowing to
>>> register the respective areas (one of the two is x86-specific) by
>>> guest-physical address, flesh out the map/unmap functions.
>>>
>>> Noteworthy differences from map_vcpu_info():
>>> - areas can be registered more than once (and de-registered),
>>> - remote vCPU-s are paused rather than checked for being down (which in
>>>    principle can change right after the check),
>>> - the domain lock is taken for a much smaller region.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> RFC: By using global domain page mappings the demand on the underlying
>>>       VA range may increase significantly. I did consider to use per-
>>>       domain mappings instead, but they exist for x86 only. Of course we
>>>       could have arch_{,un}map_guest_area() aliasing global domain page
>>>       mapping functions on Arm and using per-domain mappings on x86. Yet
>>>       then again map_vcpu_info() doesn't do so either (albeit that's
>>>       likely to be converted subsequently to use map_vcpu_area()
>>> anyway).
>>>
>>> RFC: In map_guest_area() I'm not checking the P2M type, instead - just
>>>       like map_vcpu_info() - solely relying on the type ref acquisition.
>>>       Checking for p2m_ram_rw alone would be wrong, as at least
>>>       p2m_ram_logdirty ought to also be okay to use here (and in similar
>>>       cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
>>>       used here (like altp2m_vcpu_enable_ve() does) as well as in
>>>       map_vcpu_info(), yet then again the P2M type is stale by the time
>>>       it is being looked at anyway without the P2M lock held.
>>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1563,7 +1563,82 @@ int map_guest_area(struct vcpu *v, paddr
>>>                      struct guest_area *area,
>>>                      void (*populate)(void *dst, struct vcpu *v))
>>>   {
>>> -    return -EOPNOTSUPP;
>>> +    struct domain *currd = v->domain;
>>> +    void *map = NULL;
>>> +    struct page_info *pg = NULL;
>>> +    int rc = 0;
>>> +
>>> +    if ( gaddr )
>>
>> 0 is technically a valid (guest) physical address on Arm.
> 
> It is on x86 too, but that's not why 0 is generally considered an
> invalid address.
> 
> See the multitude of XSAs, and near-XSAs which have been caused by bad
> logic in Xen caused by trying to make a variable held in struct
> vcpu/domain have a default value other than 0.
> 
> It's not impossible to write such code safely, and in this case I expect
> it can be done by the NULLness (or not) of the mapping pointer, rather
> than by stashing the gaddr, but history has proved repeatedly that this
> is a very fertile source of security bugs.

I'm checking a value passed in from the guest here. No checking of internal
state can replace that. The checks on internal state leverage zero-init:

 unmap:
    if ( pg )
    {
        unmap_domain_page_global(map);
        put_page_and_type(pg);
    }

It's also not clear to me whether, like Julien looks to have read it, you
mean to ask that I revert back to using 0 as the "invalid" (i.e. request
for unmap) indicator.

Jan

