Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96AF6441E5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454667.712198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VrA-0004x2-Gr; Tue, 06 Dec 2022 11:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454667.712198; Tue, 06 Dec 2022 11:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VrA-0004uV-DZ; Tue, 06 Dec 2022 11:11:24 +0000
Received: by outflank-mailman (input) for mailman id 454667;
 Tue, 06 Dec 2022 11:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2Vr9-0004uP-IC
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:11:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6f955c0-7556-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:11:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8802.eurprd04.prod.outlook.com (2603:10a6:20b:42d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 11:10:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:10:53 +0000
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
X-Inumbo-ID: b6f955c0-7556-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgSe79hBPGM2UNim2Tv7dVd/a0dtGazZX7dbw8PouE1ak51c+slM2yF0EWI4On2Bkrw3I5pkdD9mh/vF2T9eFd5gwV6Cokzda+KoiaCm0OhNnHoGMTfP+uOuC/iNWRMkud8PTJvSCb8nWfijRKRC718i4K82N7wtr242+lVQUChOSWKfNA7kAbWbUxEl7h11BpV+Zr/eGUDTqEyiW3IBKYVDFWA79UyqP0d8MVHTS9fwL4vGATxo3055TJYpqfn2joWWtmeSLjsj0csvjhaCicQwONeC+mtikHvFN0JnwTg/HdpbWn7ze0xGakzfwgi/PTbfo0eAMkEI/4TCg7274A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4eBDWBRgj7UQ4odhOT2Orz0l9PloJ/4EeyaDRtqh2o=;
 b=NAf5mlcHWLJAkPtUsOvFC1X1oomnpkgfqwNMU88MXp49xmumkFWI5ZZ721SjTZ9u+o37XeKtcLi8LamIpvgNZdsTiS1PJoPSiih2Io8gg4y3K+ijlDWQjFAZcKxLLe60NIm2pfN3ox2WmCxn7BEFn+atybuqp3YLUjW/y3KHgvgGAbojuy6+RLt8bbQwfNewQftYJ5HHwcqgl8r1dexpDTVfeIFzq88hk+qkPqa/Usucd43pm3uwFnq0VqQFwDlE9nxGpC7wW5V858fmjcoLmZYsO5lbBvYdY5gV5MDVw2UCPxBKxwUO76Io+516EN36R2yZhRXEdaszV5zgbJ13uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4eBDWBRgj7UQ4odhOT2Orz0l9PloJ/4EeyaDRtqh2o=;
 b=GEeyvKQiOT0Go7+LRbX89xjWpyda0fNLOuwc3XLt5prj9Y8Lt/0uWfS47lItr2FDXCX6oZkky0THzvhrm0wCu3ejXG7swaWQzHUf7DM4SNqgrBpeAfbibJ04tF84ePWZgdzO06Ck06PaoXkXgkKlCyx9iiX6SGm8LGDH/eViJQTmrHLsCdK2cR1p1UFCxr4rRStki3vKYuZIt8lB8RVR/MzKdenZnxiAK1axR+yyDljDM1svYkIIblolfSK6xWLURvyrfcFyD9oqo+GLrCtLPv9vIAABliwDeOTQSEcXTl/ijGPWRcwtixTjGzrnowP2K5c4MPaq0Vqf6SaubrGBQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30188282-729f-c0a8-a650-f2b3f4c040e0@suse.com>
Date: Tue, 6 Dec 2022 12:10:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/8] p2m-pt: Avoid hard-coding Xen's PAT
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <94c76a8be13a592ef98c80525b6c016cee583e73.1670300446.git.demi@invisiblethingslab.com>
 <cea0b80f-6fca-9dcd-8d04-2e7ce943118a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cea0b80f-6fca-9dcd-8d04-2e7ce943118a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 34cc15c6-1331-439b-2380-08dad77a8a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CsfIA+/3ylnK1ax1H2zjT2md9+luIrufEULSPYhJAUR6LymtiOZlbvBZqkxZ+WDk9qN0FWMwV1eDovrryzPAY9nQ1KwAqQfkZjVo7LYSPbe2Fym7sRr7fz6h7gsHWGR0EeettBVtxYitUX4t2e8wxS9rBCcynk3oM05NFF+h2Av9b82YnXjFTptl132fS4YEFcsqOTTp0x6YCxdk8NkEpM/mFmEMUL39r0V5fUPcPLkJOoGyXi9wfDGDvwPRCKOwHJdnQm3DjvwEIAVc+s9zbynxXVHnglRQ6afq197qA8+LrH/DU9Jj3z0jyWHRRzHaaZfU8djne70akmZD/ppiF8MZy9UjQKVoIjoTyJzB987lmsoiFmSa6RnPAzvWteO/kd2+PEJAmVvnkrQInMaAzxiRttT4xxoC1cvtbZwn6Dmh8lnftR+0Q81st7tBjR487ZN31cvfmFW7VprXx+e6sSduQIw4piKt3+rsBlK1oS0AIi4oxwki6rCV87kxhHxyDV0/MBwuY85N9GUrkY02nAIkHGvUI9y1HDWdlaNsmUrWvAzT+YDFpHrNnbJDS+XLqByqdvH38zUL7vLuPNEVTUGg8rgc4EKNw1VcQYEPVS5ogehFTtHdUHOYVvLFS+4X0WfH/2o1kwqvA5pZzVejazyYM9139d9nXoHuPE+osiLSxVCa5A/cYQtrppGHVY+Ta2gygqaBe/wq86A6+L7a2Xh4PHHntAkuztmHzBMcJj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(36756003)(38100700002)(31696002)(86362001)(41300700001)(8936002)(2906002)(4326008)(5660300002)(83380400001)(478600001)(66476007)(54906003)(6486002)(316002)(66946007)(2616005)(66556008)(6916009)(31686004)(8676002)(53546011)(6506007)(26005)(6512007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVJ1TGtKOHZ3QlF4U3I1VExZcDJ3ekRIUDJVaXJNejRXcVhLVjdJczEwMWdC?=
 =?utf-8?B?UDNVeit4NU9xdTA5UHlXZzlibUdYQUx0OE04eU11R1hkR21ua09Wc3U4Tjgx?=
 =?utf-8?B?aW9ydW5KNWFueEpZS1UzbStYNmhNenNwOHFlQzBBNHVDNC9VeU1pclU4Y3BV?=
 =?utf-8?B?ZVlPR2s3OG5sTzhNcHA5MXdwa1BmODJpcHpUb2g1NC8zNE90NkhXOXNPYzVT?=
 =?utf-8?B?SDVpZnNjNElOTzhXTHNHb3MyZnFEM21ydG1wNmhFajVUNjUwQldwVVhYOFl2?=
 =?utf-8?B?eDlqU1hBLzNzWjAzTjFuZDRaaXc0ellMTVQ2N0pBMHFmTjRCWTdVcHYyUmNk?=
 =?utf-8?B?V0RXZmdpb2x6QmN5NTZISGN4Rkx2cmxMdUdCS3ZOS0pCclVndGEzMXlmSTdC?=
 =?utf-8?B?Y001bmlBdjZRUjFQY21MemF0YUd6VnBEaFlEQ2R6RWVERU1PZE1lVS9CLzgr?=
 =?utf-8?B?WlJURnpFWHc5WGNVZDhWU0RmbGk4RDNIaTlGaXVhQi9kVkJGOVBGclNKNDM0?=
 =?utf-8?B?VmxleEhsc2txQ1NObGt6UWJPWGlXeXJDYXR6bjYrYmJqbE5XN0o0TVFqaDVW?=
 =?utf-8?B?QVB0WGJKZ0R3STBZUnlSczBhZmFyMEpST09naWJTd2VCUCsvL1BieHYyVm1C?=
 =?utf-8?B?OENIaGx5aktVdHpHdG5LbGFIMGo2MlpJSC8yOS85SGFFVFdnS01oeGxwQWxC?=
 =?utf-8?B?dXBYVUErRGRxWTI1amdaMnRZTmZabFFXdGkwVnJJeGNsTmdHYzJBZGlSWkdB?=
 =?utf-8?B?d1B0OFdEWmk4bUsraU5TbW11V2lyNU93QkRQbDBNR1FZTlY4bkIzTmgyVzJ5?=
 =?utf-8?B?NW9aNU81YkRieW8yS3o3eUw1R0I4bk1kTmdxekZ5OGxBaFZWcVk2a1l6REt4?=
 =?utf-8?B?UkZ4eStnMWk1aEhZcERROW9udEo3MFFYbHMrUERVSmtKaEY3ODZYMjJXSzhG?=
 =?utf-8?B?cExya2MwZzRudlJMMWI5azBvVDhuV2drdkNKSVRER1BDWWlnTkVUYmRieGpk?=
 =?utf-8?B?VmtGeGJmL2xLTU9UQ3g4WkpZNWdkTzRDRjEvSGN5Vk5jREg4Z1JxeTZEMmxq?=
 =?utf-8?B?eXVtQ3JDRlRrQis1VGpTVFptT0tYRmF6NTBBcS9RQVF4SzNON0pLMmFXN3lC?=
 =?utf-8?B?SmtBZWRyTzBINmxEQkNXTGZaczlhTnRLeVFpdTh1R1JzWnZsekRzUTBHUlNh?=
 =?utf-8?B?KzNUa3Y5cVZtL2kyMFhFblBGTk5mNzRveC9LR2ZHb3dJUG1RT1QxRlc5OWE0?=
 =?utf-8?B?dkk4ZE5paTdHelg0aVhkSHA1YjFidm9SKzd0ZEZkUndvSVFyaGhiT2VPWEdo?=
 =?utf-8?B?WGs3M0g2TlcvamZZQ3BNNzVidGxMellucE4zcUhHNFVzOXhyV0FIMHB1YjEw?=
 =?utf-8?B?SUN1UzBvVmdlQkRCRmkvdjdKYXFySGV2VFJKWTNnUVU3dUFsS2lYL2tINFAz?=
 =?utf-8?B?bjRUb3dFMm5ZNElPR1lVWitRMUVORzZIQTkwaHlGMjFLSFpwcUE5NCtHOFBt?=
 =?utf-8?B?a0xqOTFJUGdqYXE5d3ZZeFQxSm9vcXVYVDdmOUNMeWtDUVk3d2NRMjhaeDdt?=
 =?utf-8?B?eUtVYUgzZXZrVm5FY1VEcm1ldm03bGNGays4aSt1T3lvN1dNTEMwZGpXVmdz?=
 =?utf-8?B?aFZGRzFTZlppNHdvcWp2dGhUQmNkQjk0aGtvdVkybmpFMFB0WkhibkQvN2pG?=
 =?utf-8?B?R0pHUy84RlhFKzFXKzRCVkxpS3QyN04zVmdLdFN3YXE3cHNYQk9jbGpkLzRs?=
 =?utf-8?B?Rm5QdmRmbVlha2V4eFZvazVkUGVySmpHQlltUkdySysrajl4VkRzSzZ6R2xm?=
 =?utf-8?B?WGs0Uk1MRk5MVG14UlE2K2ZUcnVVNWF4b2dvaGsybTJEY0o3MjNPSm9TTnVJ?=
 =?utf-8?B?OTYxZDc0MXgvMXd0SVBKNmoxc1VhSVdtWldHVFNRYVVTd0NRamxvbnVXM3ZS?=
 =?utf-8?B?eVJMVXZ2REZQeVpCMVc2ajZxdnk4WGtTK3hTMDJoV0NZNEg2OWhKYXVnQ2kv?=
 =?utf-8?B?UjlQNGN1NG0wRTkxYyszVndud09tRXAxWUw2SEJVNXZuQ2xRNjN1UDRWQjVr?=
 =?utf-8?B?OVBFM0RVbW5iSlFGZG81OUFlUHVqMFBzdTNBWlpCMFZjVXZiNVhRVjRtM00z?=
 =?utf-8?Q?JyixBLBBhZ/p2x+GcAACnp90U?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cc15c6-1331-439b-2380-08dad77a8a33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:10:53.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MMj92e40pP9VjvTFavt625hxPPOLi0I5kKRM6iad+BgwedyLN+LTqYG1HM1rPpw+hgMe+uOyTFgP3A2z+Y1Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8802

On 06.12.2022 11:59, Andrew Cooper wrote:
> On 06/12/2022 04:33, Demi Marie Obenour wrote:
>> This makes the code much easier to understand.
>>
>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> ---
>>  xen/arch/x86/mm/p2m-pt.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
>> index eaba2b0fb4e6830f52b7d112fba8175dfe6d2770..cd1af33b6772ab1016e8d4c3284a6bc5d282869d 100644
>> --- a/xen/arch/x86/mm/p2m-pt.c
>> +++ b/xen/arch/x86/mm/p2m-pt.c
>> @@ -99,13 +99,13 @@ static unsigned long p2m_type_to_flags(const struct p2m_domain *p2m,
>>          return flags | P2M_BASE_FLAGS | _PAGE_RW | _PAGE_NX_BIT;
>>      case p2m_mmio_direct:
>>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
>> -            flags |= _PAGE_RW;
>> +            flags |= _PAGE_RW | _PAGE_UCM;
>>          else
>>          {
>> -            flags |= _PAGE_PWT;
>> +            flags |= _PAGE_UC;
>>              ASSERT(!level);
>>          }
>> -        return flags | P2M_BASE_FLAGS | _PAGE_PCD;
>> +        return flags | P2M_BASE_FLAGS;
> 
> I agree that this is a correct transformation of the logic, but the
> logic cannot possibly be correct in the first place.
> 
> The read-only-ness of the MMIO range has no legitimate bearing on UC vs
> UC-.  I have a feeling this is another attempt to control mixed
> cacheability

I think so, yes - at the time the goal was to disallow cachability other
than the one used by Xen for those pages where we know Xen has a mapping.

Jan

> - the HVM side cleanup from XSA-402 is still very much pending.
> 
> I'm tempted to R-by and commit the patch, with a note in the commit
> message saying that the transformation is correct but that it highlights
> that the pre-existing logic is suspect.
> 
> ~Andrew


