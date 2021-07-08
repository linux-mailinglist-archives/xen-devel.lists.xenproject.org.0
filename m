Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CB83BFAB2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 14:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153103.282845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TX2-0001eR-U2; Thu, 08 Jul 2021 12:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153103.282845; Thu, 08 Jul 2021 12:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TX2-0001bn-QW; Thu, 08 Jul 2021 12:53:32 +0000
Received: by outflank-mailman (input) for mailman id 153103;
 Thu, 08 Jul 2021 12:53:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUKi=MA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1TX1-0001bf-Tg
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 12:53:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ea6d7e0-dfeb-11eb-856d-12813bfff9fa;
 Thu, 08 Jul 2021 12:53:30 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-rVdwFxZoNvepsIM_FrX4yQ-1; Thu, 08 Jul 2021 14:53:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Thu, 8 Jul
 2021 12:53:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 12:53:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.26 via Frontend Transport; Thu, 8 Jul 2021 12:53:25 +0000
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
X-Inumbo-ID: 7ea6d7e0-dfeb-11eb-856d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625748809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckRA/k8NtXCisAyIk+Nh4vI6YTPAVVdhC7LXo6uhO2Q=;
	b=APEx96JQ8roB8HCDxUzGhnAnJUyeLZuLr/fy7AnJyRTNt9inKXhyOd5y7Rw8IxmHoiYx6P
	GRx0IRypqZHqjrdNtXOT8+6JArWzo2Pfjjcdl3a5DduIBWyKWS2iNOeNjrssEtuABvj/73
	C8OFd3P+TQIb/9ZKIAYYWQhRkR1tQ1w=
X-MC-Unique: rVdwFxZoNvepsIM_FrX4yQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoOCVQgyF9kz9DOStTsaf9lpBBBjGkX3gv0JA+YcIJP1g0j6yaf01t0kFxr6caJwYVSfo/gJ9+VAIeTNZG2LmVmI5GqQ/amwKibJfFCNbUPv/fpv9kx7qK2gH//GithEHtlONU9MEt1OCTUg1lulmjSrsXODfP/rlCPCDZ4hw77vCEBg5uHAujKfDVxDu6BGv/pOQniphzb1vJk+UoXxtHkXxD9Gx1/1FritqhgDDjBJHHkAs7zwAfupweN8s0dMruIfnpohO5o4HS4xhxq9Q5b+pMCkJPCap/CUFiHV8LVGG0JsudPf/0MtoruIRw6rxGLWh4hOCVOpF+A0c0wu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91Vc3yL3Dj95o8w0qk28ld+UBjCT9m9oRccVquHOXtI=;
 b=Bujyn0LC+xIOegKRJRLUcbqSFVG2xG896eEc+quI6fGIT07F8zYrDn2wEgTkPIDN5qOSClvzcZqupgL0hM2HnPfeNRBiEUMiZOuxGC+a6SGHfWTyDub/uFf/6HobsCpk7qozzgGyEiEIP6WZNFtJvVPsFnPz9j4MsNQskoEG4XRU3JAE4cwMXAeCSuGKjMm9gXeqhaxNGfp7Z4lja4Rkvk4a8u/tS6ArTfyiWUZYmYrn/IjC3BECwhohyxQD1/OB9zmNF5tQ375Cv5J+ZAqZzHpJkUoJlZw+IKk2+tDOxd+D7HYdERCKoZHf8Esvx41coktgPUJgHpjLgW6wbnCV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/PV: address odd UB in I/O emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Franklin Shen <2284696125@qq.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b9bbc584-db3c-0b03-0314-3dd907f645bc@suse.com>
 <30186860-de22-3e71-bdb1-52f42b0394f5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <268610e8-a974-a9a7-8a53-04de8a2cb751@suse.com>
Date: Thu, 8 Jul 2021 14:53:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <30186860-de22-3e71-bdb1-52f42b0394f5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2bdbd90-ff03-4f39-4a3a-08d9420f608b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71498666A870E17AE558266FB3199@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z25MFZc6HE4PLY9b7bP6Dqa4TRBpq7jUMsQFnDyEnaSqth4a01HpsOuR+pc6IxoOAOfvqtPvX+j2TUh5fzhJKtQypDPtSp5qe/Ewd/Z7B6zq7TLwZMT3XRuztwt3vppYAcuNlaF+BtORAl6/cOURpoWwWkI6pD6wDDpsFT9Kz5FFb3RJ/e/MU9/uzX48XILra/LdOdvFQVuFKrHfzwc1wcZKkIGNRM6F2evxFMY8sDk9jVmQrugmH6fMhnknEyzyKn1Vmzsuh9o3iL5IHihg/iumh7tmUnZv+wcth9gqC1KqX3Ahcjofpch948+SxvLR6lYAXlWGyTKJxPF+w0smxAhfGnJcYRpeWv7WPK46hSYZGXDAK1188XGv89RW0PENliPOYeAP1NTFXI8MZBzXEHVCVtcq22xOW3dpeQ7sqCyI5GDpWZ3CI7UbyfzB70mAfY2w2ux6OjFHyovMH6+01F4vaPe1IZX38X56xXfzzsp1c/qAx/jcn2ADRCWR7rALpxWvETpPGxmmCkPyV6jq8U8Q8FZCMm58JSQm4hdRUE3tsbP8WdyDam4a7RDfod+rc1yTbAw3tYUlwPV64nsjOYwHUzvmGBFhm83d1XBx2vf0lzbdpSh1A5GE5/FF6TiIUTTjJt5marUdVRfmwoQe+nIHU9oJz1Qzn5S1uPBMCm2EJwXbjbrR8vLojLqnz1PWBhrEvieN0Xtute8ZeeHOjpTGWXqvPUrDhqYStPFElys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(53546011)(316002)(8936002)(6486002)(186003)(36756003)(86362001)(8676002)(31696002)(26005)(2906002)(66946007)(54906003)(83380400001)(6916009)(956004)(2616005)(31686004)(38100700002)(4326008)(66556008)(478600001)(66476007)(5660300002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yS5rChIqhzWLI6/vacDmqzQinhQghLBG+84Cr/qMikDU0leWKgFj84SqdR+c?=
 =?us-ascii?Q?gg8zKgBLwqKkcHRH3G1K7aOnuBRCmWu9ZLlxHdK/EAZ6XJDJTmonpBIMMjMJ?=
 =?us-ascii?Q?wIGsHDdL38pJ7X1vGPgMD7pMQyoC9g3xsUaut2C3+QQFjDIOx3lm6987EqFE?=
 =?us-ascii?Q?v2ti2LgvaaXflVVnyz/Gm87AcjwT8ppLW8ghQ9r6A5knBiOO64d08saGTxXk?=
 =?us-ascii?Q?6cz+1DyGdnSL/Zh6BuvG4UjkJSE5iTlzVcbSw6ypZTzwVVUe4H5dAOsC2ua1?=
 =?us-ascii?Q?XqtEm2e0jPv2ybIKDoFpCUNkz85mgpFtrA7oGZABwtBbxgUNErGXXl8dv4se?=
 =?us-ascii?Q?XSkQdQJwV1s6SmMinj+Owcou9SKGFEtg2qJAY+bislD80a4Ey8snhQ+KBVwn?=
 =?us-ascii?Q?hoX5x9c6gBt0CPojoM3/P3Mq4uf5TBV+8uTDFAg1tYbiekMSi63cG/UrQ1DL?=
 =?us-ascii?Q?NrUppZYAhcQHdZ5FrBVHe1pXWSReev8JJ/S85OOAhzokU/G6h5Alrthgs2e7?=
 =?us-ascii?Q?0FhtPY8uj3Ehfkjv22XyDoAXD7cOSldo9aX9g/dm3uUn7AugZCWoEa1Hl/0L?=
 =?us-ascii?Q?+veqBXk49s1V+6nKLdqIVR7xBfupZICYWcUx6r0/QsjdrPjIwGShSLN9zDGD?=
 =?us-ascii?Q?4cbl3FUT4t/WaKm5w5aZgz/h113M4LZD8eJoceX0cVgDaqhsF2k/dyLJLA0s?=
 =?us-ascii?Q?VZuLB7azV2nwKXs6tj+fw6OYvYZE3TTIgmRTqzRn5QcgG2n/cIlKizZ9DPsm?=
 =?us-ascii?Q?xT9E8T2xdEy6/twwgxMXz3l/YF+myzQMThHlsMmf7fKw5p0OyzBBmkg8Gs7S?=
 =?us-ascii?Q?/I7GeBIlaNprb8eRkLhv6Z5sJANzMiNNoC6NylWnQu7E09+HkE1Rov0ed43p?=
 =?us-ascii?Q?cQHdrwV9QP2M9BuxhoCHYWuraNJkFHR9+XvOfAixgt5DqfLUd8OwDlbhc9Jr?=
 =?us-ascii?Q?+THlGQFUYFoJw26vlYmE87kaw0D6X0Hmi469i/tUiENVa6gaiA4x9V/ZNtqs?=
 =?us-ascii?Q?f0TpW6sJXvMd/HdxL5egq/VVEtXEEf9S+RAw6p4D1fFAAJN7rK++UhMqgTaK?=
 =?us-ascii?Q?7GLvgMvISzwN87j+KP98kmOsdahVjcLTE6tsKGG9nB+zgPDR157dzEy8mZsH?=
 =?us-ascii?Q?lyaNtmFT4W7fQdaXGT71KO41NwNyh2wmgxOaKiHeBhLOVKhU+hHcvlxQLX2J?=
 =?us-ascii?Q?zBYh3nRdW522nK9mtSMp41/9cUpjthQJZbxs/mHU+M0tJP4mPoiJQfuPd5Fq?=
 =?us-ascii?Q?2pDFB658cN+MHHDZFs9wx5o5Ap6+n2Zl8cAaz7O4xMtCPGFOmWACa0LbGeGb?=
 =?us-ascii?Q?VRBlSqY1dUaEjCjT1w2bMZgW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bdbd90-ff03-4f39-4a3a-08d9420f608b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 12:53:26.3168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrNbvFClUee3zRO9Zu15hXuQEUG7xuYUg/9iOXhXNq109h+yHi6qSUcmvoQb1VQj3OuHccLwFsRQY9CMl8dZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 08.07.2021 13:15, Andrew Cooper wrote:
> On 08/07/2021 08:21, Jan Beulich wrote:
>> Compilers are certainly right in detecting UB here, given that fully
>> parenthesized (to express precedence) the original offending expression
>> was (((stub_va + p) - ctxt->io_emul_stub) + 5), which in fact exhibits
>> two overflows in pointer calculations. We really want to calculate
>> (p - ctxt->io_emul_stub) first, which is guaranteed to not overflow.
>=20
> I agree that avoiding this overflow is an improvement, but as I said in
> my original analysis, (f) - (expr) also underflows and results in a
> negative displacement.

And how is a negative displacement a problem? ptrdiff_t is explicitly
a signed type. The language (I'm inclined to say "of course") allows
for pointer subtraction in both directions, i.e. one isn't required
to know which one of the operands is pointing to the lower address.

> This is specifically why I did the cast the other way around, so we're
> subtracting integers not pointers.

Iirc what you did was to cast the result of the pointer arithmetic.
The fact that this has silenced the reporting of UB was suspicious
in the first place, as I did also point out ...

> It appears that we don't use -fwrapv so in any case, the only way of
> doing this without UB is to use unsigned long's everywhere.
>=20
>> The issue was observed with clang 9 on 4.13.
>>
>> The oddities are
>> - the issue was detected on APPEND_CALL(save_guest_gprs), despite the
>>   earlier similar APPEND_CALL(load_guest_gprs),
>> - merely casting the original offending expression to long was reported
>>   to also help.

... here.

> Further to the above, that was also so didn't have an expression of
> (ptr) - (unsigned long).

We didn't have such an expression - the left side (the function
pointer) is already being cast to long.

>> While at it also avoid converting guaranteed (with our current address
>> space layout) negative values to unsigned long (which has implementation
>> defined behavior):
>=20
> ?=C2=A0 Converting between signed and unsigned representations has explic=
itly
> well defined behaviour.

Converting _from_ signed _to_ unsigned does, but the other way around
in only has if the value is representable (i.e. doesn't end up negative).

>>  Have stub_va be of pointer type. And since it's on an
>> immediately adjacent line, also constify this_stubs.
>>
>> Fixes: d89e5e65f305 ("x86/ioemul: Rewrite stub generation to be shadow s=
tack compatible")
>> Reported-by: Franklin Shen <2284696125@qq.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I'm not going to insist on the part avoiding implementation defined
>> behavior here. If I am to drop that, it is less clear whether
>> constifying this_stubs would then still be warranted.
>=20
> You're implicitly casting away const now at the return, which is
> something you object to in other peoples patches.

There's no concept of "const" when the pointed to type is a function
type. Or else the compiler would legitimately complain about the
loss of const.

>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -89,8 +89,8 @@ static io_emul_stub_t *io_emul_stub_setu
>>          0xc3,       /* ret       */
>>      };
>> =20
>> -    struct stubs *this_stubs =3D &this_cpu(stubs);
>> -    unsigned long stub_va =3D this_stubs->addr + STUB_BUF_SIZE / 2;
>> +    const struct stubs *this_stubs =3D &this_cpu(stubs);
>> +    const void *stub_va =3D (void *)this_stubs->addr + STUB_BUF_SIZE / =
2;
>>      unsigned int quirk_bytes =3D 0;
>>      char *p;
>> =20
>> @@ -98,7 +98,7 @@ static io_emul_stub_t *io_emul_stub_setu
>>  #define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p +=3D sizeof(b); })
>>  #define APPEND_CALL(f)                                                 =
 \
>>      ({                                                                 =
 \
>> -        long disp =3D (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5=
); \
>> +        long disp =3D (void *)(f) - (stub_va + (p - ctxt->io_emul_stub)=
 + 5); \
>=20
> The only version of this which is UB-free is
>=20
> long disp =3D (unsigned long)(f) - (stub_va + (p - ctxt->io_emul_stub) + =
5);

As per above I don't see why you claim this is the only UB-free form;
for now I don't see any UB in the form I've used. Plus your variant
again utilizes unsigned -> signed conversion, which I've explained I'd
prefer to avoid (but would be willing to give up on, as that's only a
secondary goal here, and we surely have very many cases of such
throughout the code base).

Jan


