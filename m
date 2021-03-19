Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3109341EF1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 15:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99317.188838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFj0-0004bk-Id; Fri, 19 Mar 2021 14:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99317.188838; Fri, 19 Mar 2021 14:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFj0-0004bL-Ey; Fri, 19 Mar 2021 14:03:38 +0000
Received: by outflank-mailman (input) for mailman id 99317;
 Fri, 19 Mar 2021 14:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNFiy-0004bE-JY
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 14:03:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea55a92d-d1fd-4e55-82c1-9a51faa32e26;
 Fri, 19 Mar 2021 14:03:35 +0000 (UTC)
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
X-Inumbo-ID: ea55a92d-d1fd-4e55-82c1-9a51faa32e26
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616162615;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7oFDwaLHzSERP4K6uSIc5Lkm6sm1sUbofwbeaG8HygE=;
  b=e+NjLavoZ1j7TeQ7a2FYCRlKeefbgRVMt5vdPYliRGjDA4qg7K/i6XLo
   y5WWLZmtkWqTJptHKP9hRcbjRSpRcI4XDeGLC3YLUhdBWI3cpcIB8oZBO
   BELHeChkwccIDxjEDV7lSU1Q2MYxx/ISKkTO/CLlCSwcgo3TPxFEMg75r
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /5cvwnNQZWF2Tgi498BfZvYdIu8CAWwk0NeWL2QX946Wdiv8tkpW9dJvhgGEFNkiw6nG5kMZWu
 zxaWu/nSk3BSGtFnsQroQ/TTFQPRa8p7Nrl8rhVQRgX1a91751ZdM4oa3UHSYco5rM2zLp4dnU
 Jbr8A4kSIX16G9WXO0xy3NgB7PwUttfS6Q8sZ6XNtQb/clanI6xm0DmX/JLEv0I2wwTikOIwzK
 NJLsazWHy/GrRuZMpaiMVmVO2qBYKK+G3l8hqNxtmhTMLM2qL8a41FzlPEFmz7KSPEvjmQ8mh4
 1no=
X-SBRS: 5.2
X-MesageID: 40053831
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NKf6LapUtefhjFedqEApd5MaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.81,262,1610427600"; 
   d="scan'208";a="40053831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXgSaU5wWI+E93adkL1xRPRWCO29oedjf7Te2lQZjQ0tDuEU3Ih4wlArs5HpTFk5SwL62kK1zwWaoO0NLuT8KWOFYpcmiTNuhsZyitLWs36JITFxDFm7rV9y900cZiBuxecY8lROBsgVW3bo86zFrm4963phEC/r3uo/zaIjN30WcjwZSvTBuaLzjYN+0ybMeS90YDmM/42w67l5IkCsMYq4xfbKHylId3zxtKZZqAItOANeqNhAl17a8D7yIKghONAlAZNsIh5velJOEUvcLgJYi+jrqLgQljqAXgzEJwYJhIJ8UNDRDyryiVoarmjh6PtSw20TwXLwTrqLFiw0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l3qePY/1n+xM1joQFLQ/DuqU4YPkqsTmKVM66m0n10=;
 b=Waxer8AlOodXxYz2OnIeoSV/xYCBiPxK7raaY3K3Sqo8H+2Fv4BFlqGQTbLe/hSYNBRsDXzDzSBZTncSIf9OgjO0a6IbsRj4UE6YMh89ACjfI4kkWJmIDezBH47GmCKNMpO4MjcEkW4fFth0GFHFWOPKuTTHtB0H4zg7q8+/hWK+dB6PHFW3cYRJXPEKVZdUavYrn9aU62gJIMa1Npg0b7CRNmtGfWzehkVvacv/JTprcQDGgsb9M7KmQQUyNteLYMJtIMJY9J1m0sAPGZHT95Es7uWAtZQ3WySmysxYK+Y3VAKrIQqyD4uvvbm2h1tE2OIDr55GciyrMOmmg8NU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l3qePY/1n+xM1joQFLQ/DuqU4YPkqsTmKVM66m0n10=;
 b=U/cngl9/13W+CwxAgnE2krveP/jRBxChZ1miqmFo5df7vzGvvkvUhCJe9j7ZDsJKBpgEZM198ho1C/ODIkj46eVcbrJqBBgIUnzg+fjj4awueDjv3I31o1r9Ot6feygbTBqk4l3pZOOwlwEsO/IpPRk7SM9DQrGlhYEgX02C1b0=
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ian Jackson
	<iwj@xenproject.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <df7b7faf-ce81-795a-6d8d-29fe967d2d77@suse.com>
 <ce3abf13-66ca-13f1-0b8c-25221cb90c77@citrix.com>
 <1c5f3162-8451-5e6c-e5b3-e5368fc0a871@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <13a21f92-3275-64c6-8afb-27ae4f772171@citrix.com>
Date: Fri, 19 Mar 2021 14:03:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <1c5f3162-8451-5e6c-e5b3-e5368fc0a871@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9120d55-5670-4672-f88f-08d8eadfc760
X-MS-TrafficTypeDiagnostic: BN8PR03MB5137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB51378142FB53A39C10201DD2BA689@BN8PR03MB5137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7c39Ojr56g0qUY8FOCLKIuXOX5wZ1lAMJcobg5bKRYupY3ZMJkeqwnpO/AL6Hfz2Dnlmua2U3nSxIG6qwBx7u4/AXMUFn1ZoabDRzTflM3uKRXZLMmYUBACTJZOb9TUkQzcE0w2h+TWH5AppqpUsAL+GehsgXzgvVznHTUwkTYVIxX1Pgcr6IaZTJLy7yRCdI07PLdurxdKMPi30tRTr1OIlSmQV6u5iWGi6yh5EWcccW5V9mzIKxmeqQyip+AvDUpQzKlgg6MSArKhPKeOxZjla4ucQkKJ4N180jA0I0/1enOm/TvE6J7xaFeRZ6/WXdBwGLqxyS2NR4GZsyu3eU0mc1B6My10wsFpWtz70GncnTqUVRJrbZLNAGobwqy55VajOEp9oJFq1OFL95SkjbU2FlKIAvU378T67IQPFaAPafovd5WmLYvXbiC1KV48KzN0NN/3jjmrTM/AhyXXZhn2NYpbnei+aHeiR2fSjzSWoNBaGZ1JknTvajWR2s8rluC0ZntUF1JRnjZwbdBDB3u+DqJo878rQJFhE/7JxN8qef2ho9TvSuCY6pkJnaKpLDZ2D1A/vm5BYVzXU/2k9x+34A5dO4cBhfPiwFzLqIQi01NX1kMHu/207QYQExJC+63HaxcP8W5HOOuXKizyyPeJBZRMhCo9ZHbZuQ941V4iHSY9PGcPKTw0PRXCCTxrY7LnlUHez9pUHhE2xo19/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(31686004)(54906003)(2616005)(956004)(66946007)(6666004)(4326008)(66476007)(8676002)(6486002)(16526019)(31696002)(5660300002)(6916009)(16576012)(66556008)(26005)(478600001)(86362001)(36756003)(2906002)(8936002)(38100700001)(316002)(53546011)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlNlempoQjJXT2paazhSME00SnZMSVFadEdESzZ5R1NTbUc0eVpncW5PSTJv?=
 =?utf-8?B?WHhSaGtIRnpJUWZJK3VyNHR4SUdmazFmeXpYYVlIdTJ3Y1UvMm13bTdPOWFh?=
 =?utf-8?B?OUhtbTI5Nm8zVytVbUFpdzd4dXZVTzE4TGE0Q0ZHTTZBRzFOSmVobGJFWGl2?=
 =?utf-8?B?eDhVaDlDNjZ6SXM2YmZZc2h2WUM2OFdYVGt0V1dlQmd1bVRPY2lNdkFBR2l5?=
 =?utf-8?B?T2dkcEdTR2kxTGZwUnBxZStWUzlQR2FEcm1RdGFPVFN0ekNNdWxvYTh5WjFB?=
 =?utf-8?B?ZjNtaVBNcVNsdng1SFVNTHpmMXFQeE5MUEp2ZjAyZk02MjhmVnpTWDNVcjEv?=
 =?utf-8?B?cHNZNHM1V2tZbFBkdjRjWnp1NURNMDJ2MVRudUFXTmU2SzZEOHVob255ZVIv?=
 =?utf-8?B?RjVCQUdXS2hXOFB2N3hoWS9aNzI4eXo2SE1uSEo4bnQwSWpnaEpraHVzL1BF?=
 =?utf-8?B?eEZydkVuZ3pDQWo4Sm5XZXF3SnBLTzR0aTNJR3NNeERWb3Q3d2dCbTc2TXVR?=
 =?utf-8?B?RDhwcmNmNTVFVG56VEhWYUZ3TDk1Y2xoZ09ZWEpaaTUxeUZOT1kvb0pSS3BD?=
 =?utf-8?B?SzJ6WG4yU2NSZjNucWc1T0E3aHdzeWFheDlvYSsyTUx3Zi9XMDRWQVdTQnA3?=
 =?utf-8?B?S2c2NGJDdGpvNTdHVmRhVWI4L0cwOFJGTTJDV2tRWEhRVHZFMlBLQlBMTzhQ?=
 =?utf-8?B?ckJHZC9SOFZTWjNYTUgwWERMZUVleStFcDRJZ3F6WlNHeTRTdGFsWnRaclRm?=
 =?utf-8?B?OGkzNjgrYTUwWXRrWFhvVTV5eHRBMGRvQUpwZWtFT0pIM3lsd2NmR3QvL2dy?=
 =?utf-8?B?RUp6R0xGcDRjbE8vcTZFdlJ0Q3RNQkZCMWRvcW9Vc3hocVYxK1d3ZUYrdGMw?=
 =?utf-8?B?L0VkcUFoNGpTeVJmdzJRUGJWODdaaCs2RHE1OGV5T28rNEFhZjB6eDRBV1NJ?=
 =?utf-8?B?aXYxb3lsMjhXbC9hMFBwRGx4RzBRK3hqME0wM3Y1cWE4VmdzWXoxbjZBZ2k0?=
 =?utf-8?B?M0p3RlBVb1FLMjdFWkZHR1ViZTlUWmVYc2JRVndOeG5teFZ3dzYxSEtURjR5?=
 =?utf-8?B?Zi85c2lKL2ZPaXQ2a1EveHUybkZJb1VPSlFZSlN2WUdvaXp0T1RzajFFNnBq?=
 =?utf-8?B?VHpLZFpGVENKMVo1Q29OTjdJcGlMN2VhL2lUaDV6OGlYMTVERXkrMkhIR2ZK?=
 =?utf-8?B?QUpuemdyWjYvaS9RT2t0RzhlSnVySS9BcGN1MDVrQkRFZUMxYzNydWVEK3ZF?=
 =?utf-8?B?cENwazlLNVlQdzJjeEpxMkxmMG91NTk5RFNPcy9hbXdpSmc1Rmk2RXVqZkp0?=
 =?utf-8?B?dEJ3ZDdhZjlyVWF6bUtwa3lzcGdyRndhLzE1UzFobmtLSHVMT21vMHhGcjlL?=
 =?utf-8?B?U05PZ3ViTXFwUE1ZREZkSHNIYWFUN1FaeElwSUZPTHhneUVjUDhpOXcwaGd2?=
 =?utf-8?B?aUhNZi8xam9DRXhrS1VYTm01aXlnbU5vTDFoUkw0aFByWmV0ckcvREFwRFU0?=
 =?utf-8?B?UXplZWdWS3huMytzU21zcHBqV0JMVGxpYnRqYmdxNjB6WGIyNC9MQUhwelZx?=
 =?utf-8?B?OEVtcFNyNDA4alhjUkwwd3lIT282MitncWxKWDhtU1FJUDlxQ21zZ2ptRDJv?=
 =?utf-8?B?L2hVejBJL0xDSFdkTUQ1N3VUUS9oam5XdGt6L2ZPQlZUenl0SE5nallNV1NH?=
 =?utf-8?B?OVpINFFBUEtlUmFhckFMUzM4Mmc1WWpwWUFidC9JVzFUWXVGaSszTlljTWMz?=
 =?utf-8?Q?9KDp6UxeiY2QmaUWuNZCM7n75vEtpox5WhAAx3I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9120d55-5670-4672-f88f-08d8eadfc760
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 14:03:31.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqwpdsCZ0AyDIwsYrf+RH2vE9wbJZme3A2GZSbcPfprFkOMihQfX94WzlNio0HMLx7mE/u//bKJ5GUmk3krTaYZF34vQLRhrBAVqqNf70Og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5137
X-OriginatorOrg: citrix.com

On 19/03/2021 13:56, Jan Beulich wrote:
> On 19.03.2021 13:59, Andrew Cooper wrote:
>> On 16/03/2021 16:58, Jan Beulich wrote:
>>> On 16.03.2021 17:18, Andrew Cooper wrote:
>>>> In hindsight, this was a poor move.  Some of these MSRs require probing for,
>>>> causing unhelpful spew into xl dmesg, as well as spew from unit tests
>>>> explicitly checking behaviour.
>>> I can indeed see your point for MSRs that require probing. But what about
>>> the others (which, as it seems, is the majority)? And perhaps specifically
>>> what about the entire WRMSR side, which won't be related to probing? I'm
>>> not opposed to the change, but I'd like to understand the reasoning for
>>> every one of the MSRs, not just a subset.
>>>
>>> Of course such ever-growing lists of case labels aren't very nice - this
>>> going away was one of the things I particularly liked about the original
>>> change.
>> The logging in the default case is only useful when it is genuinely MSRs
>> we haven't considered.
>>
>> It is very useful at pointing bugs in guests, or bugs in Xen, but only
>> when the logging is not drowned out by things we know about.
> So would you mind adjusting the description accordingly? Right now, the
> way it's written, it reads (to my non-native interpretation) as entirely
> focusing on guests' probing needs. Even an adjustment as simple as
>
> "In hindsight, this was a poor move.  Some of these MSRs require probing for,
>  cause unhelpful spew into xl dmesg, or cause spew from unit tests
>  explicitly checking behaviour."
>
> would already shift the focus imo.

Sure.  I'll try to make this clearer.

~Andrew

