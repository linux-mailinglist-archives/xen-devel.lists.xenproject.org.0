Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A1C74CEBF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561051.877334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlYY-0003Ia-PT; Mon, 10 Jul 2023 07:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561051.877334; Mon, 10 Jul 2023 07:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIlYY-0003G1-MC; Mon, 10 Jul 2023 07:43:38 +0000
Received: by outflank-mailman (input) for mailman id 561051;
 Mon, 10 Jul 2023 07:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIlYX-0003Fv-M9
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:43:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe02::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a6454ab-1ef5-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 09:43:36 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM8PR04MB8003.eurprd04.prod.outlook.com (2603:10a6:20b:240::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 07:43:35 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 07:43:34 +0000
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
X-Inumbo-ID: 7a6454ab-1ef5-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMIucmI7C/V8wOWwfDf33NFBbrVN1O4RoMBeTLegEk8/mPpZeg/GOWeVc3DmHzIDwnFwtyZhbqivRCcxp0ZqNedCN+lj8/O2JuVLRGWnbV8g+tPQrKhpk5BrTPNPyD5ZuehmCQHitdmG4Wg+7BW8IPXESMyXIdoEguYiaeFOGhYOubL+8ZbBu2cqkBZllOtcF7+k58NG0XVZCeE3n5XG9INMhVgFmXLk0TrNfUgF4C/WS0rHj7A5eQdQRRbFFTsrr03ZoqHRecoMFNyTBhi6nMMMjqpO9E3YgiOLCklPY3A0bDiXW9YT2rkLYI6AEwMQD5/dKsJUMhqZXXkCgbdjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQt1i772a/8IewftbY+2LpHC5OCoBLspVSVdblgVqlE=;
 b=j+4vsBVME41J0zhPAGsj6/W66JsDvVvbxTL4LCz2+W6sRP1+uxgw9HDzYIQr0HPIzJqmcZ+e82PnF37lObueSj9t6gSvtIV4S7gu58YV0AUxgk1osxpz0V/NJzz1T0pKYHbNWDmuZOJQJIByXqYVcNSM0SVeq43wWtfVcWS5sbZAbQ8edE5yIpy3FikYil0EHugaMAd7WNRMskwkTFpnFk99JAwzXSL+6+BL9P9J1/LzUT93J+gt2RtBfLovYwOsNK8KTz3wxKLSqq4E5LmhqewKOtMBH76win+x/DJhkGLg2Wx1nAW2DaUkX7PaB51MUg7RAkHzzWlrVsaa8e0qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQt1i772a/8IewftbY+2LpHC5OCoBLspVSVdblgVqlE=;
 b=lTkkSc4SgILIPcpPTD/4Qkv5KaTCf9Ou7zornYi94kzWONbsqIiPSuh0H6Uu0XzaVJ0Sa+h0USPp+7X5tN3XlR5Ub1VsjLoK/UafeQe2qdyd9gMLM5THuFpfNCWDbsD/i8YvUvrUYrzqtpWIpnybqtQyAZhQ8u7VB6/cOMhz0UX+vQiDcBVY43u9RJGcE2quQ3nhED78Gqm4MxcDCN8bDJtv/DEJPAk96Rq3zhRik6CV/qrpD5mb4hO/uvZN2HjpbOczgur9Vb4De8r+1gKSdG+Rqp6nunlB9YbEy+4LhuKnZdFR2vqUGQDiHjJzS540paBQ2ifzCmYYHzXdGc8UwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03e5e1a7-2c04-c991-e3b7-cea6916ec59b@suse.com>
Date: Mon, 10 Jul 2023 09:43:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230622140237.8996-1-alejandro.vallejo@cloud.com>
 <e7d3daa3-7d5b-1c36-51f1-453bf11b55d2@suse.com>
 <64a83575.170a0220.2c96.8158@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64a83575.170a0220.2c96.8158@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM8PR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 3799f7f1-2296-4d1f-a0f3-08db81195d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ap0JqGtuR24Fh4phCrXvA+IHtAaIiIbHIULNXUcZ6bcIv1ZGVFQ3Vw1EvNVU1BSMtaLjLg4r+GndTv57InLg8j2P0POxXZ+nl5Ywc2RGVR3XrYNb48RMu0JktlQZVJCMjVbfdqye0haxEciJBtGf/VfhEB/5GmPBGs6iPMzQHRlhHSmolgkVo9Qp3RzWb9+FHqcdiCaXSEyJQRQp/jU296HEFU9wtLCNfXy6JNJeiDD/e6nCRSfMu2Oy5f2m0W6R+quTZS0r/x/IEwJHLP8WdYqnhr+3ZY+LjMGdSLGrnrP9/9Bnnnku6UJtORRrKiHW2G+QywGEtd9Z/ZewPjq2iYnct0hvzOy6EVMNhwUcvl2HA9arm9OJjZYVDADzVaj9KZDA+ZCoOLd0fBzBUYFVmWxlFp2WwnG4QWACoScr8TGaidqZKLD5UYOjRWXB34O0vmZBaDOwI6gMzqJ31d0UwAYBa5oDwMbBXeRxc7PQfLczmpbz9lv0nmGmTE2OQEs29MJN/N0HIgEJIXV/cHC5QYfcssgyuly+ax62MXuP0HTcNuxuIANZ60z1J8CsrhSe4oDY/33rZ+GCyjy/6lwmHGs/gunazMdeKY7CbrO3bmlz7kHsjFqK4ncdUj/+YP6scVOG830hvjmqjLsF0+oZTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199021)(86362001)(38100700002)(31696002)(31686004)(36756003)(6486002)(54906003)(53546011)(26005)(186003)(6506007)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SytOaFJaTThDZmxseEpMUVNNQ3UwdzFFWDZCZThMUmF5VGcyUERCMUhLcWd4?=
 =?utf-8?B?aW5YMXNNV3ZHYjBsRkZHa2VWSEdobHV5QXkxWW9TWEJFK2NIL29uYVVuUE1K?=
 =?utf-8?B?cGppU2lzLzFWY0dDU2FNZmNQVS9ZREFqZU84RjI4MFVrMVVHZEc3b1VZR01I?=
 =?utf-8?B?eDJaMWpnWHRzMitCM1ptb08xa0w2blRqTnFFSGxMaForK0IwNnIrNC8rcU5M?=
 =?utf-8?B?OWRIVHNFS2hrQVZLTVpUL2JDR01ob1dsd092ZGgrRGlXT0FhN3NWSTZvaUNO?=
 =?utf-8?B?Q3FRbFlFMERkSzlMNEh3cHlwRGQwQzlWYWU2cGdLanFuZi9PckhRYmNJL05Y?=
 =?utf-8?B?OE9hb2ZpTmpNV1hDbkViekVCV2dnVkMwSnV2L09vR3hHUnJtVTFWaWRWbVB5?=
 =?utf-8?B?RzF4VlFyZVp5R29YdzNGVTZWUmh6NmNGKy93MlVzU1ZKVlVyai8zaDBmUFY0?=
 =?utf-8?B?anJyV2tOSFNzYWh1OElrQVl3SEZYclEza3BvdDU5cTB6SnlrZ3dYR3lKWms2?=
 =?utf-8?B?VE9kWkVhUnNyNWhnbVJCcDNXMzczb09CenlETzRYU1A1L3NRT3R1U050c3Ny?=
 =?utf-8?B?a1VONVIyOW5PY3E1VWJYaUFYYUtKUWptYWhSRkNRYUtnOEdrSGxPbXhRSGJ5?=
 =?utf-8?B?NFdvY3VxZjZOcU5aRm9lbDhwTTdGUWFiUVJIUlZ6UzBXc0RUUzhGbUErWFdT?=
 =?utf-8?B?eEwzNnp3ejQ4Y3BLR1BJZGNPaGZ4eG9UWTIrRWhIRUo3L1VwMkFVK1NMT3Z6?=
 =?utf-8?B?Lzg3L0dLZ29jT29QaGxNNjhKRU5aNTh4L3NzeGJWTUlScjdxZGRUbXV6U1Zp?=
 =?utf-8?B?ZXRpMlJra29ycFdBZ3BJU1N1VDJWV0UwNlcwMlV0eTJhMGVzNmFwWHJEcElU?=
 =?utf-8?B?UnF4SWQzc0Z1dTczUVVwSHJTV0ZjZkZXKzFBcHFhTjNSRU4zU2huaGlDUTFK?=
 =?utf-8?B?d2JSODdFdUVFOGZpbU1tOVVrcXBlRWRTQlFhTXdVeHBJdUgxYTJvMjMzU1dp?=
 =?utf-8?B?N1Q5cUJsOG5vdStsMENScHJ3dk5rOGFJcDlrVkRnTUY0UDJYSFVNVXh6UTFv?=
 =?utf-8?B?alFRbUVPRkNwTUdFdkk4TEtlRFg2NDFnM1FKSW84UVQyWkozRTVRc0hIeDBk?=
 =?utf-8?B?UlROV1VYNkVvV0RKenhoak1rSXdvV2IwK3RLMnRYaGRSbDh5YWEvMEpPdlNx?=
 =?utf-8?B?VEI2RnB0MVBjSTcyeWRoVmxOaXNvd3FRYzZEMEk3NFdHN1A3OUdhZnVya0VT?=
 =?utf-8?B?RCtxUE5qWTU3WGpja3lqTmFKZ1RMdCs5S0x4Y3JiaVJvS09UVjlTdWYwbGVP?=
 =?utf-8?B?TWJYa2J1VER6RWNXc0xvZjRCRVV0a0hFaGl3emVEemlSR3J0N01nT3ZzbElz?=
 =?utf-8?B?Qzl5dFFGYVBnemczVE1xZFc1MnNOTTdmSlVSY0l3dVhLQkN5ZDhBUDUzb3dV?=
 =?utf-8?B?MjhKVlpVYUlNMUdHSTdQTHN6b211THRkdnNvZW5SYUVXbDhSdkV1MUV6RGo3?=
 =?utf-8?B?MVlsVjlheFYyN1FIeXNlQ0h3c2FRUno5dXZ5bHVZUXIrZzJ5MUdINEtKckQ0?=
 =?utf-8?B?bUVTSFA3RG9WWGNtVTdneVNJYUNFRmkzekRsbGZFeXJwemVyTzQ5ckpFVDVM?=
 =?utf-8?B?TmVjOHZyUmZrTHN4WXN4T0tJV3EzdDVSc1Bha1JqbTRRckRzTk0xUFVxM2VI?=
 =?utf-8?B?eUdjZ2QwYXJZV25ma0R3WFRZWWQvZlNzWnZFZE1ZWEM0a1I0SWJZRlRDYlFP?=
 =?utf-8?B?MEMwb1BXTTNvSXozK04wWFFXcjlzcElIZjlHbytyeHFQcDZTeThjbmJnRkY3?=
 =?utf-8?B?c1JEeDE4RXV3RlR6WTJlUTgwZ0lNRFp2b1R1NEhMMmJhRUIxZXllSXNwbzFh?=
 =?utf-8?B?eS91RStYQ21kL3FiSmdrNitReTF1OS9Hem9RY0hBQ0FJMkwvMGJWUG4zTjlQ?=
 =?utf-8?B?YnZpTDQ0ZmYwWVJZSjR0Q0dZQmxUU05OcmFPcHVNQUk2ejBKV1lTY3NaZmJ2?=
 =?utf-8?B?MkVsajZueWFoUlBtVVNDZDUwbFE2KzkxVW1VblBzWldlVnlEbHErRmlhWFJN?=
 =?utf-8?B?VHhUbHdoYlB2VFIxVHJxakFRbXNzbVFIZFprYVlIQlN6Nis4NjZpZHROSXBo?=
 =?utf-8?Q?rEJfPklP3V2OIo6WaHEYtAc/Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3799f7f1-2296-4d1f-a0f3-08db81195d9e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 07:43:34.8962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xvXbegFCI11FryMkUgUvK2Pi8uPxoyeKkjVbWTqGd0EmEigdmAPT53zpj3kZdInFz5Byr39m2ol9nBzPSsAEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8003

On 07.07.2023 17:55, Alejandro Vallejo wrote:
> On Thu, Jul 06, 2023 at 11:50:58AM +0200, Jan Beulich wrote:
>> On 22.06.2023 16:02, Alejandro Vallejo wrote:
>>> @@ -57,9 +100,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
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
>>> +     *     then msb(fill_mask(base^last)) == msb(last). This is non
>>> +     *     compressible.
>>> +     * case msb(base) == msb(last):
>>> +     *     This means that there _may_ be a sequence of compressible zeroes
>>> +     *     for all addresses between `base` and `last` iff `base` has enough
>>> +     *     trailing zeroes. That is, it's compressible when
>>
>> Why trailing zeros? [100000f000,10ffffffff] has compressible bits
>> 32-35, but the low bits of base don't matter at all.

This is ...

>>> + * ## PDX compression
>>> + *
>>> + * This is a technique to avoid wasting memory on machines known to have
>>> + * split their machine address space in several big discontinuous and highly
>>> + * disjoint chunks.
>>> + *
>>> + * In its uncompressed form the frame table must have book-keeping metadata
>>> + * structures for every page between [0, max_mfn) (whether they are backed
>>> + * by RAM or not), and a similar condition exists for the direct map. We
>>> + * know some systems, however, that have some sparsity in their address
>>> + * space, leading to a lot of wastage in the form of unused frame table
>>> + * entries.
>>> + *
>>> + * This is where compression becomes useful. The idea is to note that if
>>> + * you have several big chunks of memory sufficiently far apart you can
>>> + * ignore the middle part of the address because it will always contain
>>> + * zeroes as long as the base address is sufficiently well aligned and the
>>> + * length of the region is much smaller than the base address.
>>
>> As per above alignment of the base address doesn't really matter.
> Where above?

... what "above" here meant.

> As far as I understand you need enough alignment to cover the
> hole or you won't have zeroes to compress. Point in case:
> 
>   * region1: [0x0000000000000000 -
>               0x00000000FFFFFFFF]
> 
>   * region2: [0x0001FFFFFFFFF000 -
>               0x00020000FFFFFFFF]
> 
> I can agree this configuration is beyond dumb and statistically unlikely to
> exist in the wild, but it should (IMO) still be covered by that comment.

Right, but this isn't relevant here - in such a case no compression
can occur, yes, but not (just) because of missing alignment. See the
example I gave above (in the earlier reply) for where alignment
clearly doesn't matter for compression to be possible.

Jan

