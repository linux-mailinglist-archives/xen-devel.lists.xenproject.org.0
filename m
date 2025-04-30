Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D5AA4AF8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 14:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973562.1361658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA6PG-0003Mn-0W; Wed, 30 Apr 2025 12:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973562.1361658; Wed, 30 Apr 2025 12:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA6PF-0003Jh-Tu; Wed, 30 Apr 2025 12:19:17 +0000
Received: by outflank-mailman (input) for mailman id 973562;
 Wed, 30 Apr 2025 12:19:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYFu=XQ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uA6PD-0003Jb-Go
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 12:19:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f403:2614::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5428840e-25bd-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 14:19:14 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA1PR03MB10820.eurprd03.prod.outlook.com
 (2603:10a6:102:484::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 12:19:11 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 12:19:11 +0000
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
X-Inumbo-ID: 5428840e-25bd-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQaNIrN0Bj30PMIjN7xlCIycPFPieOMhnxfz2YtWlZjiGbs4RtoDVGoGhcLNHLJkej5K0xfxawxEdA/+p5pXnP+2eQPMOd5BbIez6FY8Lz4MCrVTvar6HqVLeWAVWb5Wz+erluGCJycMBIxGHob3lAqkAaMuAjcIit+E5QqI5NtTTyMl8/Y+G2o7bkKM3h57B7Bekj+oknrrJydhfOFHiP2ZVP3sVe2MLR5D2xf7Jsk3z06UnX/j65CNioZIrV+BVeGBcPAsNPPad95cJIhEadggIC/oOKhiZBgTqSNdrENev5ssinYalmaemUqnwB6oElnfFZrEx17+YCIbOrdT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6u0LZnp5OfwJNKBFY1it0+I2TAuIPUj2L9Ln1iIjojk=;
 b=aHP0P1kYFg1b/2IJ4WeAfH102zOF0d8xG3Om1GCipk09w/aSt7JlNya1jHGJJZZZiwtyb5mcf9tkT9umMj8GIHm4L5rAoG6LnBIGpQjVUQmwkWve4DCBj8CMK2fB2W1eu6NbztM/teX/BNuzvS9JVbSLhgyGYL9uIW/TSlJdbIMqezbL1RfskL6sfXnuwBsslMCRCTUGWuezF6rP2iwrJzPVlI8g7Bnl743mS3KhpubP5GW1Nyvfzu2LG6xPNbbUnDoa90Ew0+pvYQY7JWsawc2Gd7kqujAfsql9lfVV/smURNQnqmf9NBn4If6C6vLy6ftMx4s11HJBo9ytl7qaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6u0LZnp5OfwJNKBFY1it0+I2TAuIPUj2L9Ln1iIjojk=;
 b=luIDtYupweraW3LzF1oA3/OU7BoPXBuGGCe0fDKAHMtfANJQSD3Z5NQ00QFX+I4qs8BM0oYWQqA5v2z3GgpNBMxyTqAIp42ektjFz15RTlEC2f1NDbBrdSMWGrB0OriBPT3AVnj1H/7ACNtQnt0vMy/H2LklFmusrXENYEuRXDIGwVuod2gsWo/EMYqE5nQgxbBgVLxH9JgXXlTSxzJ2yohuG23IoxT5a8RjAim6Mpms/29/bfIqlPXmY/ViyVNsPdXjPhTxb3T313hGwjHfArnNtj5K/d6mVrpT1dxk3L3BIRvb0MT3tXejMh3f8sm3QQBh58QdcgMwzK/TQlYmyg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
Thread-Index: AQHblUI7lWJ91U/YVk+TK2sT0KKY9g==
Date: Wed, 30 Apr 2025 12:19:11 +0000
Message-ID: <871pt9eta9.fsf@epam.com>
References: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
	<5d519ffd-8747-4367-b92f-01c20a483e72@xen.org>	<87cycue6l3.fsf@epam.com>
	<14fed5e0-643a-45cf-8929-461e11e7f4c3@suse.com>
In-Reply-To: <14fed5e0-643a-45cf-8929-461e11e7f4c3@suse.com> (Jan Beulich's
	message of "Wed, 30 Apr 2025 08:42:53 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA1PR03MB10820:EE_
x-ms-office365-filtering-correlation-id: 76aa9f07-3952-47d4-cad0-08dd87e136d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?23lJZJtZEWKRZp+gx00jf0+j2/nADom/cAriFLFWbjxM8Yjxm4ljq+kgIn?=
 =?iso-8859-1?Q?VLnNOP5Z4nV3RwW+oWWGyc1TB7wRMtyGh+Mh+aOyh3kvAwWK2g9FQBAHz7?=
 =?iso-8859-1?Q?DKvRdLK4uLZKShYdWM8QckKOjxcHig0oNo0Uw3MLooJNivCehIPuJcptAV?=
 =?iso-8859-1?Q?Wxt8rLfs4BUzpEZXHB8HICOdOiOZ++Sfv90AuYQqVpEUP6JneypSAqaDvg?=
 =?iso-8859-1?Q?5OC+2tUwQm/bRJyQc6uwpz8fS+xl+NQUCfWrjGKHUtYsiqbpidt1EakrsM?=
 =?iso-8859-1?Q?q58r11PF7F7wzB1bx5c3BVb+5DbHtBBbOY6kjBjNlzCkw49yG0WfO+4okO?=
 =?iso-8859-1?Q?T2JSjaohmSJ+foITaram8StPSiMqgBzKP6l/8tRClvDgMTdefsFDzNcbGF?=
 =?iso-8859-1?Q?B/R3nd44/YxqllwKvl+lEjsXadGbu++G7uwL52fga7uHtE2A030JEd/Gcm?=
 =?iso-8859-1?Q?zbA8rcCMW3Jng2Y/VDB2G+ZQD8tVv1f4fvcbeJhZN3bm2VijVQvEo72EEx?=
 =?iso-8859-1?Q?XpVCujBjtb6neqUnGMBlGopxC+FmAlpwtXmNfoGbQGtKp3evBffOSJy00C?=
 =?iso-8859-1?Q?YRFxit0uJn4Pv8KHgmIbX1rZ1m/F6bcbGYXqr39sycAitivv/GQ0IbovYk?=
 =?iso-8859-1?Q?O16WsbbHrcLQicPbK7XWeG9Ww+a7K0asLElIFZ0hkIcnXhULwXMtCH8hYX?=
 =?iso-8859-1?Q?yWO5i3J3maYWgU/WsdfRWIEi/EBXCKbHY4fEqmtJFRA37nPL91eGjQsuSw?=
 =?iso-8859-1?Q?D0xxvM0dHLfWPVAG7pCHClHFKN7hskNPzVIDezhh63jPNmlCPrUtKu+Xsj?=
 =?iso-8859-1?Q?zW6ztInS35S2ZXWxHcqMHX9YN0E2BnWKn5Xuorgp6NnA6br5rIHqhF7JGd?=
 =?iso-8859-1?Q?9Cp3zog68TnsilhUo5tWbcxmU1n73ndKijqC8fl5luQiUAl/qtzqBLg5x+?=
 =?iso-8859-1?Q?hozvMtFJdc/+JwqWbEz3cRXz8Y+7BFhha4rjRdIEFHiaIR/CEg8cKeZd86?=
 =?iso-8859-1?Q?zJiKk4tpWX/Kcm64cClOFDdVcnmdNjLZT7eOmHnZQQIg7ZIO1yr1HXQv5Q?=
 =?iso-8859-1?Q?G4I4VU1z3vcKxdthmMHyf0SSrvJjzthb3pOH3QfhI4xCyL+izECpoWNEr4?=
 =?iso-8859-1?Q?ZMOn1EDxZi9Dl07DlXc3rwqBoMTrzaXwgUDTlxVDDr+4bG/+L0dqW3HxOf?=
 =?iso-8859-1?Q?qNxRWhsLUXun7u6KU5Tmuaqb27LWYElv1yjpmSSLC39XtRnYzyHH1aej+B?=
 =?iso-8859-1?Q?ydSSPhSQzRaQmRuhqQlEe5rTe6MBYj0nQBqliSYl5KxPXTyeC9V7xqVEeO?=
 =?iso-8859-1?Q?xZm39iUF/bXFhFaGtnA4EWzrCNtN3lPgdOYlHFrqjZ0sMxidKkld7KSTOa?=
 =?iso-8859-1?Q?DwXoutYE2Ad0hvBO32Td/p9/rbXZRlQZsLwR4j+uBiPEHU81P4o2g22hw9?=
 =?iso-8859-1?Q?eSgGRRtuspFb5O/jR+oh3oy3Lo+Ome4jCJPhnTkUTikYcKmABuoLYJW88P?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pK6qOlmtDAMv2H1QC3tbA56doFk/8kb50PVvSSJWqag/dQHKbTDAQS0MMO?=
 =?iso-8859-1?Q?9FIFPxOXCjjJSVNu+VN7R1axC4I5EsOxatdMpUTOIwHADua/Fhx6N/zK+Z?=
 =?iso-8859-1?Q?MT0jnhRVmWCQpEff2c/oFBMP5ooqg/ailsqfKbEvXKEcVYwpcg0ddabveM?=
 =?iso-8859-1?Q?RK0jr4Jf8ILjth3H3CFPvRQDDnuevAH8Vgk/9bTrTU2FpuB7PNSlRbI/nQ?=
 =?iso-8859-1?Q?ZrI8KWuyXIEf+vvjCJM5YljQ0w9oPFxBBVaizRRprYwOmCYdeMkdfOGmz/?=
 =?iso-8859-1?Q?LhdDIvhbMbz/MZCQ50HMU5+RSK+DKc/l9TK+0IeFdvERxkH+otPg7tOE/Y?=
 =?iso-8859-1?Q?q+gbAN+yNU0JP8xHhgkR+VcgPhk8yrHJP+KDVbsJ8ZVCalmAaxp9NtVZRk?=
 =?iso-8859-1?Q?2E5nPAgGDdf8osfdoRdEnumNRViAFI4BembnOqR4j7SkkXBlqog3tjHiEi?=
 =?iso-8859-1?Q?P2J8n3VKyCE0E/EbHp5kwnuuPxx6wr9yXiEQmzWxx4uoyVNIvnl2RRwX3a?=
 =?iso-8859-1?Q?CYRaC5c3G92Z2lPNjIkmpAzP8zvgPxm92F4kYoCAIsCM/OUcyFy34p3rSf?=
 =?iso-8859-1?Q?T9NWsfFMW3k7ito5iHyFzV5mXjKWkmBP+S4kcG9PPZo4/yMx0Wr2JnkMVv?=
 =?iso-8859-1?Q?J037gVUSR7/1SMiIx4oTAgDfNqWFxvAp82PmNqLSbFvho53YWeFxFYxvKF?=
 =?iso-8859-1?Q?u3vM4n1CgeiK9f04Gw2UXIh5sHzbUGhf8LyqeP9HkUiOFP9ahkhqoItfmH?=
 =?iso-8859-1?Q?gYh3FzU7HnOoz2Bbcf3SntMjviayfnnOfWwR1rrMytus85VzQBM+vGp6ig?=
 =?iso-8859-1?Q?tw7WkWyCCQS6tc8j2ZD2LBb72HXg+dBtkdmuPiCREesqGBOvM6x2aoXg+l?=
 =?iso-8859-1?Q?JrN7SBDJfkR/gA+WxoStzSbfRoWUXYkxssvatzH2L56EFIZcKjej7N4O1i?=
 =?iso-8859-1?Q?aKYqGcEpfXKrErs/8to+ngDYdju/aJbC4fqQo3CuKX6WBAL0fbdCYnxyWp?=
 =?iso-8859-1?Q?bNJrzgiEY4aC4jkqqjp6Ex+SpBg/2uxIebIBF8CnwHlRuuj9oLM/zap/zh?=
 =?iso-8859-1?Q?c57iJdHRsFMLFAGnvM4Au0mTKaCvKyz5vS9p3B9H+4Bi7IWnA7ayXRfF6+?=
 =?iso-8859-1?Q?5TLjQIjRgaPzn/mkmOmEtWJj/aEd1GSl8HdLPQhdYnfWGecRFB6tNneZjJ?=
 =?iso-8859-1?Q?h58iSeJW3nEgpc6xpG2ekWQ3WESINo2KJdpcXSHCTd6NSamx0ZDDnHPcyl?=
 =?iso-8859-1?Q?rNTXRcRS5/y1YQNQBvExrQpdc2wogPVZ0TnpzUxGWzoM0h6IoMI3ljjifi?=
 =?iso-8859-1?Q?HHAagbXA9ao1zIzs8h1/1NeO3YfFNK812fms9td9doQtG7XOR7kPbM6cdH?=
 =?iso-8859-1?Q?6UpbZMNN1g7iYfA3tm4SD+ltBIuPLjsYjXr6/5jtf+Lj7sBVJuWGYjdQ42?=
 =?iso-8859-1?Q?ieAq0NIczQYdIUx5A1gZhPiVY84OTv3WSQuOw/b0VqFBDzfk68QuUJe/Fr?=
 =?iso-8859-1?Q?Epw657E/WQy1SWZvrJoUgaStEbKZEs8xVSX5aYkXMhTvGQwaPFLCcpiyJi?=
 =?iso-8859-1?Q?RR4RthWNSd69dXiw4O+EU9x0OgV3tMlsf8E/CDpSwRzcxTA7XUdaZLd299?=
 =?iso-8859-1?Q?4K6UdPoozciTyfRcnHFsQqesWKgZKdeP3T9aAVX9LR1Kvj3EX9R+VLkA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76aa9f07-3952-47d4-cad0-08dd87e136d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 12:19:11.3838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFpVzALNrrfZZg9qKmfz4ffrECRcQ/Obz6h7KI+bHDxZs30YerxZj42i0vo+4Wz42Km5zkt4L4eYvyjnVkbkpQ4LCI9oINITGmaKkEMTjhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10820

Jan Beulich <jbeulich@suse.com> writes:

> On 30.04.2025 04:17, Volodymyr Babchuk wrote:
>> Julien Grall <julien@xen.org> writes:
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/include/asm/libafl_qemu_defs.h
>>>> @@ -0,0 +1,37 @@
>>>
>>> Missing license. Also, is this file taken from somewhere?
>>>
>>=20
>> I add MIT license, as libafl is dual licensed under Apache-2 and
>> MIT. This file is based on libafl_qemu [1]
>>=20
>>>> +#ifndef LIBAFL_QEMU_DEFS
>>>> +#define LIBAFL_QEMU_DEFS
>>>> +
>>>> +#define LIBAFL_STRINGIFY(s) #s
>>>> +#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
>>>> +
>>>> +#if __STDC_VERSION__ >=3D 201112L
>>>> +  #define STATIC_CHECKS                                   \
>>>> +    _Static_assert(sizeof(void *) <=3D sizeof(libafl_word), \
>>>> +                   "pointer type should not be larger and libafl_word=
");
>>>> +#else
>>>> +  #define STATIC_CHECKS
>>>> +#endif
>>>
>>> No-one seems to use STATIC_CHECKS? Is this intended?
>>=20
>> I used this file as is... But I'll rework this part.
>>=20
>>>> +
>>>> +#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
>>>> +#define LIBAFL_BACKDOOR_OPCODE 0x44f23a0f
>>>
>>> Are the opcode valid for arm32? If not, they should be protected with
>>> #ifdef CONFIG_ARM_64.
>>>
>>=20
>> It is valid even for x86_64. They use the same opcode for x86_64, arm,
>> aarch64 and riscv.
>
> Wow. On x86-64 they rely on the (prefix-less) opcode 0f3af2 to not gain
> any meaning. Somewhat similar on RISC-V, somewhere in MISC_MEM opcode
> space. Pretty fragile. Not to speak of what the effect of using such an
> opcode is on disassembly of surrounding code (at least for x86).

Yeah, they made some questionable choices, and opcode selection is one
of them. Also, the whole libafl-qemu code quality is not to the highest
standard, but there are no better alternatives.

They just hacked into TCG translator code and are looking for the their
special opcodes byte-per-byte:

[1] https://github.com/AFLplusplus/qemu-libafl-bridge/blob/main/accel/tcg/t=
ranslator.c#L184


--=20
WBR, Volodymyr=

