Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF140675D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 08:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184087.332634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOaI6-0005Fe-2t; Fri, 10 Sep 2021 06:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184087.332634; Fri, 10 Sep 2021 06:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOaI5-0005DC-VT; Fri, 10 Sep 2021 06:45:37 +0000
Received: by outflank-mailman (input) for mailman id 184087;
 Fri, 10 Sep 2021 06:45:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOaI4-0005D6-C8
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 06:45:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eed68b8a-06e5-429c-a58f-177ade3d5eee;
 Fri, 10 Sep 2021 06:45:35 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-gXv_cU46O_mSBStKmmIJbg-1;
 Fri, 10 Sep 2021 08:45:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 06:45:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 06:45:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0037.eurprd03.prod.outlook.com (2603:10a6:208::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 06:45:30 +0000
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
X-Inumbo-ID: eed68b8a-06e5-429c-a58f-177ade3d5eee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631256334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iYQthzBh+79AvcHHM7e5E3Mis4sMFNPv/bvg2n+qhfQ=;
	b=Cp9F6Pib7gmdb2QfxsvkFp6YgTiSKHj/LT8SIrXzDThbsIQU80YeyQn0Bss4nUG3XqVrN/
	8Hlu41bmk+oQdbRDqcCvzs3s4XhGOjLQ90ja6T77bOGZoIt2NihC9JktWoxQmYAavlnmck
	Uh12fkKvGn9ApHZMxY0uoilKuUCSrwA=
X-MC-Unique: gXv_cU46O_mSBStKmmIJbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB6PpJV2wbLG1fqHMj/A5akLZwfn+uIgKxTKmGb5dDHUWeCH01+kAGbN0UslDyr/1lKag/TNrTq4nx9ZYPqX03Itp2fMshqysU10rwpKDbBnJm7DhxUNpZ3gaEdm9sF88TuUx01kjVs56fWc43MGSYgy8uItjXYuJL4kbtCeeWKXapTpdlCWY1qtEXzVLcAzSM9jf/soZTSP4CnXD5B1hE2GLYl7rC+R8ernn9S60VIYeRIstilrSQxaeiWT2IoM55qZby3fboFTE89LZ8DiZGuLu0zO/5fi54KWHRH9yS+1pN/YF/SyyT2B1M0ARwta3y26+6Uv8rv178+5l4sGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZFtGgDZNEYcRTHzgveHza0cShINv9CjEiQ+hgj/KJdA=;
 b=MuAiYOK5a/bYFvKgNq4Hxb8W2Qgmgt2JlxSPy4dzTCg3DeZZfsEuX7lY7xKf2oqh8ibtwTarCYXNG5I9Stwz/mX5C4Tpyez/+c1mPPfSIFfWqdaEGVdJ6BrUocLL3IIwiejT0eTQ1n4hZAVmXpqY0+mYNC2/32bAVHzhJvyB+GePIfrOyitLEBfiVlU9JaUkpWPkNFJF8XUMU2fR8X2xPP79mH/3q7cJZx/bgoQckHDE8KIdh3o44ROetLjUKoZtyWbpz+K2rEgTejDJt+MtaGM8RC/eNsWCkT/m3My4m4zPS39u5kX17cqcksgRofOSrxFMymcl6+tsjB6ybeJ1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: correct asm() constraints when dealing with
 immediate selector values
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <87278164-2395-1fb4-7569-9151d0151e8a@suse.com>
 <0800289d-7744-2c77-b369-707f4947595b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b93ae2d-cce0-d36c-e3ac-d5c619ba6218@suse.com>
Date: Fri, 10 Sep 2021 08:45:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0800289d-7744-2c77-b369-707f4947595b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR03CA0037.eurprd03.prod.outlook.com (2603:10a6:208::14)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c39f02fd-b04f-4e18-82f0-08d974269552
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590320439634CBBAF52CAD7FB3D69@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z48FlflMn/rGpND3M5Jpww21p9lzQbBWk5hCY+LdnBNJNVUYGzZqrTYb5rFV4K4FkNGqWUJnDcnUfJ2Zlhms9S/WJT2T3OOnNFu+QkQ+aXVfEJf9cZ495pUBmK/WghwXKIL1AHMQGfz06JTZ3kMbjjsvRmN5u/ayEDv+b/SJa4OyxMehtmRzin+fhWbHIBFqDXGY0PPXYyI9aULgmkRiEfUgT3i/SKtbgzHSsCNW4Eol9e5RCwsOMynVsaHY4WmHDE07lZaP2jXa1zrRcRwhNS/bYDTdSBShcIzbIWZA+LBch/AjGE+7ZF7PyDsrtfinHXYzQ2Fo8a6GFip2HOsgB/Qr6UJMNhTLBVBQOFymxZCCsg6/gAN1MJ9FOlgiZqW7/pspsVFKaQ3YM+g+19bZwydpGFzPIjKB3UKxQphdSeKy/9g0L48cXi/Ux7mS7FxKMwabz0X3GOmJkhvI8+WVs6KtG906fmIu45+gnB/qsNT8gXzHeFGBxioogQc3qBDGM+uwx+cpm5Ktj6QqRsBbO839CuNMpWjhJhHE4GFXo9PwvXlfrOHFaQ3eZB8Yo8DUDY4ZQdSekt/eVCpu9HNPjkmJgV8OdcXz0bSS6QRBWmwesIsnqA0ZHNoGhK+CLx1Ds7lLgp1M4Qghp+1NALOAW0ZooFxM8jQcCicBN9FLCtTklbPV5ulrQ5Csfg8I1QfBQ0S3ZKNv1kchc+MhymGuBguCPt1B4gFUxC4J7OBUBrOdErCZoyr2KAf2cm8EoH03rzsHVs5SPPsjxGQiRtCxDGmsHTHNoKphXeBnMOl2eYkU5yQl+1gBjB4uVR+5sOrWfdXK+T9AM0OpBACbpPIxMdwh1oXUBn4x4X7kDavgAiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(366004)(396003)(136003)(186003)(26005)(53546011)(5660300002)(38100700002)(4326008)(31696002)(86362001)(956004)(2616005)(83380400001)(478600001)(54906003)(8936002)(31686004)(66556008)(36756003)(6486002)(6916009)(8676002)(66946007)(16576012)(2906002)(966005)(66476007)(316002)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E4BmW1cB3sWR/XFN9mzuy6kNUN+s+ndHkoM5H1LL9/sWfZ4qkpm1ftbv5dO1?=
 =?us-ascii?Q?1uRrTXU8hC/gVs9GnpD0OUak87ZYMKzqbhKuLx8GUkQ5Z8wDffks8+aKizGr?=
 =?us-ascii?Q?6LMpBkDtX9I3sTIh1X7Le6RrGMQ/Y20JD+5q1eL/nVcywUkp2aP/h5eFssaB?=
 =?us-ascii?Q?RrHU/vjh3j5zWLa4arP6nIJTO8rjIV3E8B5DvZdKUEUTMMx5wFA4Nr6mO6Jt?=
 =?us-ascii?Q?6lzmv+2JraK1Q/THVM4Ffotvnx6iL4NhBk5lPjf1aBOrpAxxBME5QlfCsGHf?=
 =?us-ascii?Q?TuRxIguN9Lu35CM3JGlqKtkGCFP0KqUwYo8TqMn3jXLLvp8J9aSgcYGHrCaF?=
 =?us-ascii?Q?4MQKjbsAdPJn25ZW7Rty0xjBvU3l2HH649ZcPzJr3pxr/1TbRgMiIR2SdS2s?=
 =?us-ascii?Q?XU49t/WfWLTu0efQvV9181i3p0JRWbfB1a8Sf+FtAEVcrUYEzmSDXrQm+T9a?=
 =?us-ascii?Q?3DHP7AKFa39Uv2b7BY1fWa/kLg2QKgYxs0YcljsyN0LswLtM2nT9JrFYLhDH?=
 =?us-ascii?Q?3sS9w/CXBg6nec1jbIxzkukZAm/sVcH9qv5xQmzdYWshCiR6xF0/SPTJe1CC?=
 =?us-ascii?Q?CCeH9Yd1GvQxstibd4/7gffAorevFMLWR4SYfUcU/yATA7lFV+ZN6eun8cqG?=
 =?us-ascii?Q?qbPBxkLmzQKG/bhRcg2FI5JEL5F+bI2w5Z8w0s1y/SCrTz6keVXv1H+sE0Nb?=
 =?us-ascii?Q?b6ctH5oe7rd/BiVmLTJ9yO9uXzZ465EUMGtAoVAxP8KHMs4avuPRQ4Kah3Xt?=
 =?us-ascii?Q?jkXgMqePBJIsqBud20QK0btVa1uqIldM9Y2ys4q7wDFO5jNIWh3mCO4JuK+9?=
 =?us-ascii?Q?hJ+YNsw53NgphDyCRD3IU0G+aBaJjfpBsTQzI42DLazAKwMh3xy0qI/jA4DX?=
 =?us-ascii?Q?Z2q1D3f8+M3n+y6V7vuQ/3fac9J0TTiUN08r+BgzV2oCD5y2V3Y+qLn/D0cp?=
 =?us-ascii?Q?ThwlgZEAzWniWM50ON7HQLJ61rExDDFP1Lhghv3WY/D6TSPLPPm27Cig+bJA?=
 =?us-ascii?Q?hf48X2oSXb1eQr8PDgIm4wIGMFmOF/IzPAoPBKhs8rMG27khcEEu4YsmJnQD?=
 =?us-ascii?Q?IDXVHHt/j81TwTi8WApflqReEJYddUdfcHBq2WhrCbgTqfPxKhTwrBnKdH6s?=
 =?us-ascii?Q?oxrsXQgxJbwewLZ9lmS4BHtnthw6Sh+i3Yw/nGdAsorTo5ndhHsCmwhWbUkU?=
 =?us-ascii?Q?UlXMYzp3cbKBwEbeyDqbe03+uNfuHCi1KPCb6t1xFp9KKyEV60i5o1rmIe7y?=
 =?us-ascii?Q?rFkk4JQG1ZjTDCGcb3wVDm2e25ZSnfWtpi8CnAJp/SCrBeqZ78O6y1JhUkrP?=
 =?us-ascii?Q?IIhphAC7r/utLSBeb79jfCWz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39f02fd-b04f-4e18-82f0-08d974269552
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 06:45:31.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9/LaxFQFNuHpv2GT+km3LjW4tAiQ84yfAMLQrxroV3KUFYBXWt2njhAMSL96O/GR568ExwEYHMfZ7UzMzPLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 09.09.2021 21:31, Andrew Cooper wrote:
> On 09/09/2021 15:56, Jan Beulich wrote:
>> asm() constraints need to fit both the intended insn(s) which the
>> respective operands are going to be used with as well as the actual kind
>> of value specified. "m" (alone) together with a constant, however, leads
>> to gcc saying
>>
>> error: memory input <N> is not directly addressable
>>
>> while clang complains
>>
>> error: invalid lvalue in asm input for constraint 'm'
>>
>> And rightly so - in order to access a memory operand, an address needs
>> to be specified to the insn. In some cases it might be possible for a
>> compiler to synthesize a memory operand holding the requested constant,
>> but I think any solution there would have sharp edges.
>=20
> It's precisely what happens in the other uses of constants which you
> haven't adjusted below.=C2=A0 Constants are fine if being propagated into=
 a
> static inline which has properly typed parameters.
>=20
> Or are you saying automatic spilling when a width isn't necessarily known=
?

The lack of width information is a secondary aspect, yes. But the primary
aspects with inline functions (as opposed to open-coded uses) is that the
inline function's parameter can be taken the address of, and hence is
both addressable (gcc) and an lvalue (clang).

>> If "m" alone doesn't work with constants, it is at best pointless (and
>> perhaps misleading or even risky - the compiler might decide to actually
>> pick "m" and not try very hard to find a suitable register) to specify
>> it alongside "r".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> I'm slightly surprised you didn't spot and comment about what Clang does
> with this.
>=20
> https://godbolt.org/z/M4nrerrWM
>=20
> For "rm" (0), clang really does spill the constant into a global and
> generate a rip-relative mov to fs, which is especially funny considering
> the rejection of "m" as a constraint.

I had no reason to suspect such imo entirely inconsistent behavior, so
I didn't look at the generated code.

> Clang even spills "rm" (local) into a global, while "m" (local) does
> come from the stack.

"rm" (local)? That would be racy (and hence imo a compiler bug). DYM
"rm" (constant)? Or DYM spilling onto the stack (which is what I
observe with clang5, oddly enough independent of optimization level)?

> I think there is a reasonable argument to say "m" (const) doesn't have
> enough type (width) information for a compiler to do anything sensible
> with, and therefore it is fair to be dropped.
>=20
> But for "rm" (var), where there is enough width information, I don't
> think it is reasonable to drop the "m" and restrict the flexibility.

Correct, and I don't do this. What I alter are instances of "rm" (const).

> Furthermore, I'm going to argue that we shouldn't work around this
> behaviour by removing "m" elsewhere.=C2=A0 This code generation
> bug/misfeature affects every use of "rm", even when the referenced
> operand is on the stack and can be used without unspilling first.

As long as the generated code is correct, I agree. See above for a case
where it might actually not be.

>> --- a/xen/arch/x86/x86_64/traps.c
>> +++ b/xen/arch/x86/x86_64/traps.c
>> @@ -248,7 +248,7 @@ void do_double_fault(struct cpu_user_reg
>> =20
>>      console_force_unlock();
>> =20
>> -    asm ( "lsll %1, %0" : "=3Dr" (cpu) : "rm" (PER_CPU_SELECTOR) );
>> +    asm ( "lsll %1, %0" : "=3Dr" (cpu) : "r" (PER_CPU_SELECTOR) );
>=20
> Any chance we can clean this up to: lsl %[lim], %[sel] seeing as the
> line is being edited?

Sure, no problem at all.

Jan


