Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40285A74944
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 12:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930526.1333145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7zf-0005Dk-Bo; Fri, 28 Mar 2025 11:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930526.1333145; Fri, 28 Mar 2025 11:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7zf-0005C9-84; Fri, 28 Mar 2025 11:35:23 +0000
Received: by outflank-mailman (input) for mailman id 930526;
 Fri, 28 Mar 2025 11:35:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gne4=WP=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ty7ze-0005C3-4Y
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 11:35:22 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb15719a-0bc8-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 12:35:21 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB7228.eurprd03.prod.outlook.com
 (2603:10a6:10:221::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Fri, 28 Mar
 2025 11:35:18 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 11:35:18 +0000
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
X-Inumbo-ID: bb15719a-0bc8-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpZrrSvbFxLek1zfWxTSyzOP+uBJOqDLtervp2yY+AmDLzxeFcoT/IdNlv98Z6nsGxR83DpQonNqhLeBJMM632oW3HAl73mj0raNpUzLUewmFeVU0azA0rmTkh8YiUGjF68S8bHk4gE6pz+WCmyicrRjsfiUN0Hcpgrm9b8TAI/SWLgShypnOdUJ2OwzRFUilL4lgQ3ON6D320O74DGA7/puGNTy7/1gcz8B6iE95FKytFuRXOjiZ9/BPJVWApzRhqiVXHNeaRXdoy4eMI0lvZ7KJHVV+2pnlComgVI7T5eUkIktxXPNjD2JrcRfADI/xCQgjFboaIBKW/7l0IoZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrzf3LGq1boLqwiyP2pDjyiV6/3r6hlYrCRHXsGYAsw=;
 b=zGejxt2CMzP+W55ozv9ayQ5AuhM6NgAX8vVgXnKUcXW5q/9See54AjS0jGezw9glbgt2avcepDP+Pn4qQAWcUTI3ZRGhn/5P2CtkFcQaNAYRbcNRp5rEGw0zcryhb99w1lsf/vuM6K4T9HDB4HllZ3hLYb/US9TNS22eu+fCNtfXspA9WNX+4Rr29bEA5llqMKepKiE9HcenPsfKNeV4Cr92dT75xHA7vIs9E5gRUJCBcYZSj0VY9LaIA8f8vDSmeQN+9vY0HszwTadeJ0GbUizseyz1YvtTX0Og6DH2TYAewQwOHlJaJFKDvyQwLnkc2lRhWwD3Wckaqf+vv4yuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrzf3LGq1boLqwiyP2pDjyiV6/3r6hlYrCRHXsGYAsw=;
 b=u+Jw7CneKZpnB6jMZ7VimeLxJixRGWloiXyWKVBA0LbZppFnKNtuDdHGCdqIOT1SesLvmIDzUpeJTgDPA+xfSoYcrGVzV2KTe1udxV5Jg9pLhP+WnvJ/MW23Z4A9i1fNOcxIvpE4Oz5v2Pt/3lCJ+H5X9ZsrHiNEJIatICiT8FoH3/o9eXgvt/lFbZ+lTCRPOTal5Fit9xO8gImHLIaBN9+OoxG2TShAJRb/XP4vdAO2/RPPxLZzuEPtlN6JKiQNAxGZtfOX+slPErlsNf/JyjTz+ICe7TzUkLM9bQT9t25oYc8ZP3TE9EMDcFL4+lx6S23w9DJC3g2l/iO+Ikkiyg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
Thread-Topic: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
Thread-Index: AQHbnrDjP18EuEhGMUmNMUBtvyYXWw==
Date: Fri, 28 Mar 2025 11:35:18 +0000
Message-ID: <877c49gzgq.fsf@epam.com>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
	<20250327004044.2014048-2-volodymyr_babchuk@epam.com>
	<b56cd8e5-d17a-46a3-8584-cf69113c145a@suse.com>	<87iknugmgu.fsf@epam.com>
	<8d98ba26-b358-407a-9f59-b7c08d1f09fd@citrix.com>
In-Reply-To: <8d98ba26-b358-407a-9f59-b7c08d1f09fd@citrix.com> (Andrew
	Cooper's message of "Fri, 28 Mar 2025 06:42:41 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB7228:EE_
x-ms-office365-filtering-correlation-id: 25da2872-2b98-47ea-d381-08dd6dec9de6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4gEy2Py50ZloNzO+yFBQKHFKKiGm9mSxG/lpgR/AE3wsXmnDyNkAN2jx2P?=
 =?iso-8859-1?Q?T8B01+7+XBay2GF3KUUdxpyIjHSH7SX3DlmJajaz2wzJKC2jncUzwV41zZ?=
 =?iso-8859-1?Q?oVUFVi/3QqJ1mcDWoTPKKdVHjxo5codxC9Ojv550z4tsvMGh1+nKwtS2En?=
 =?iso-8859-1?Q?Ax5y7NP7kY5WB3+xm41ZsHu+OFkiprsVDLInieXjt8RcdRTVq8mj9BdofH?=
 =?iso-8859-1?Q?A+jYs/7xjctKKle46puTyHum2heWhEJYTgOfTKcY84ePCmt4P98fqBZfFr?=
 =?iso-8859-1?Q?ppK9x7jK1wp8dpmoi+IJD4NsehMW600G3nEva4rLiL9bDizCa0X5Al7D7n?=
 =?iso-8859-1?Q?3g6BiDfj8Y00KDmOuvU6JW/X6BPJ0xcLNv5BEhv1Y+WeW2U569DpwTIZwV?=
 =?iso-8859-1?Q?sd1ASV2ekvLjh1LWjr+ar4SEvbCCQKn4ZJHnEQ0GtLUNgugC3+tQ2PNAef?=
 =?iso-8859-1?Q?uMtwONim1495wI1AIoqL7oeaT1JWz8Laxmj2Bof7cwdZl753eXaOAZ9Vp6?=
 =?iso-8859-1?Q?AGNyJmKz81ZylhxcyYypSBAX0kXu0o9DBajZPpzRC+Bew45EFYVK5hEl3i?=
 =?iso-8859-1?Q?EjkAcA5aA5m+/CH5BnSaQsyD+2iinSANMAZctv5iRvxhHEbUW+oO2IJkPu?=
 =?iso-8859-1?Q?ppMyl0+BrUHDjb6x7OtI2jJB+sRx01tRg1WLQr6kzAvblVGhtbprxKV9JS?=
 =?iso-8859-1?Q?TVQYU99R7x9kEA2u2Jc+o5Brb2ixkDZaqs+kAiqT3SqoZ28PEldaq5qSdv?=
 =?iso-8859-1?Q?8V8PyQ+cKnUKlaCYes9kh2o+9cYXqC4yiyAhB52g/q7tQCXCVQyTk3I/Y0?=
 =?iso-8859-1?Q?jVMCGqCl/OQ5DMbFAEDORcRk5nlwem30ESjbwdTAOMcLhv4w2rJUpn5gqF?=
 =?iso-8859-1?Q?nCWOpPOa3kCx8smaIwdbBM73Nw3aOdVo2wxZArYZzp0SIDFNGfBgMhOpOp?=
 =?iso-8859-1?Q?SnheQ+nKVxLPj7bzIQghjjXn7ipj1kG6Euk4W8tiFb56m88js3W4sNNwxc?=
 =?iso-8859-1?Q?ul4qiDDYMAnJYXy2r/6pBIxXlbUz1wsdEdfOoeyT73ykem80RKbLZCcry2?=
 =?iso-8859-1?Q?KXjoDomJhQcBqhP9I6eyRR23FE2/CvoQT5vRfXPjgSIxi6u+iaIg4fbAdW?=
 =?iso-8859-1?Q?pRV8eQjnt/M6m6NzGdjxz0tV2ZFBq3FuS/F4LDln9HemB+ad4+JmS44bwQ?=
 =?iso-8859-1?Q?yV+xeK7ZzCFXbIiMfstzhfec0B2EyyZBr0vkdw68FUYJ4aCDTEAOjFPqoq?=
 =?iso-8859-1?Q?95mYYx1jqsjDGKQQkaKYtxdHuQV6FcesZmmJw1/ddIAqPfNhg7c9Iftm5I?=
 =?iso-8859-1?Q?lxpfUPSumY6TDxHMdAjBpfqLlxeqMkzXL7ty5x0yKNx0EyGyj3ubify3qB?=
 =?iso-8859-1?Q?yUW5GaAeCq9rtWmq4k9iJKatpHYDHXLk6zBIngVJIzx5mrV6XlIUAvmJCc?=
 =?iso-8859-1?Q?LvgM6yLttSIeRek0IWGtv18JDU9xNo2+b2i2sTXnMtonJAq0k/KSG65sSR?=
 =?iso-8859-1?Q?PUV0wxMbx1KrU7mezBenz3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SZZmMNpzs+OuVjorm0k6fuUEkr3X4fJ5Gh4pJ8c2tDeoDWC1aNIDHiH+Ds?=
 =?iso-8859-1?Q?tIaFsr2Zd8qqmp91mxSDkR0Z/4+lco42IZz2jqdyFzVFigTEse/ihrrI/0?=
 =?iso-8859-1?Q?075DTo7UeZ5DPUlK+nYAVP0TSgqG6EKMK1Vqna3gwwQlot6qSpuOiUVSFp?=
 =?iso-8859-1?Q?9V8gLb7ep7S6aIDsqDPUedakkxU1AnZ8xQ99hf9sCVuurj6uD19ikhT6eu?=
 =?iso-8859-1?Q?QLPAfAWenw0gHYyTLt+gjwV760B99zyXO8ViOGSdtl8BkbGbGX6DMaccBa?=
 =?iso-8859-1?Q?8fI7jVfmXZAjGIDXDEDrsLAs6J8jNFQnGYrv5g43GDx5eeXtjql7F/AbwZ?=
 =?iso-8859-1?Q?cZjJcpqnRJeeuYoHUkwgWFix/kbUK1LurvYAMdKiz5m2vOJbfrRbUTkmpu?=
 =?iso-8859-1?Q?rMD2Z5Je57LT0ZAmddqM0RKnRDcHEBxTOS1GlOQwl+qwL4TFn3o+ZF2FGi?=
 =?iso-8859-1?Q?K1BEJEiaZ6wM0WsDqrdRBl6kDhIJ2e/eudrnWpG/bJtbJRlxAx+7zTJDII?=
 =?iso-8859-1?Q?evAqTVU7raFcic33aQfR5Nsv33Drefz7JQXKs92naL9SL2b5xRNcTekToj?=
 =?iso-8859-1?Q?JmcbYZSa05ma0O+k5vwgl0vAteIStd0GW7jCtj8UoRgjcPylN0RGeVhjKM?=
 =?iso-8859-1?Q?62Vm4BfaMDkA5j+Lda2J+TK5+FIMBScc8yKzBzmIWBXIUUKFHyCvt99d8D?=
 =?iso-8859-1?Q?qfyWonqhPvz7ruvlPA3akt55fy0uaBPgVdBG3TJXxqMsVSMPAtN4H+EuXZ?=
 =?iso-8859-1?Q?D7qfJJezS+Lh8eQPfvOcGCrZOhOUXwfq6i0NJ+QiupRI45RBQlPDx0e55m?=
 =?iso-8859-1?Q?vEbhEThfxG/5SyMoXq6ogUIMMbLUQXJS84mHGlKMOu6bIpoX740XUH6q9Q?=
 =?iso-8859-1?Q?7CnaZEvW5KwznqyV4S2y0v3xz9TUHU82b/RxJ6vkumCfGWUSyAX6js47Yu?=
 =?iso-8859-1?Q?9uaWJBAMkA3QMr1YBk7hfbrhNMGujBByEKtsN1ZWhDqwbwZKh79zAWRtL8?=
 =?iso-8859-1?Q?62OyzdR97wXgpOdHLeLehpYGYkNxdb3wqjq9oGRvzNRMRsNxS55oJXRMD2?=
 =?iso-8859-1?Q?icwRNWPu+tmIblBeJ+P8cpSe5GuI8zC1cUOCkMG3TVMEaaV16KBsRcUFFg?=
 =?iso-8859-1?Q?nsD9MbCde8707QcOW9Z1pJuCUsg5g3HQueao51kiVoSTuKLzpPNxixBRkD?=
 =?iso-8859-1?Q?gLIyrKaKQVLQLOD8Xfb7Qaqq3Q2DpHxcJL8yH6x57Vx5vMTLyfOVF8gLpI?=
 =?iso-8859-1?Q?QCEJQuqI60UCU8l+6MxWop1lLVzkj3g493B5U26hLS3tL0OgBi/xtzA73d?=
 =?iso-8859-1?Q?PZg1yPYolmhHKt6LL9n0UxpDZ0HUTNorSQLBLHkr0/Y8wKJrEtsOWGAnGk?=
 =?iso-8859-1?Q?3wAQAvj2Fc2aV7wZcx95zS9Sjhu701VNzx3MJj2O7+1ALhA3W8t6r58cWE?=
 =?iso-8859-1?Q?metux55VblPiX6ILQGfSnJo8XtjqjVFSGpG4fGigeYGZukFMZYnaKLyMRT?=
 =?iso-8859-1?Q?4n+Gpgwb1ZOvoYG2ZnH/pO8t0rP2le6u81/5aGMNQGk40bamXSWliB8Tj1?=
 =?iso-8859-1?Q?XdLU/3eGPOsMsB5F9lVqm4Lu5ztr0tPNpLklPDtkNumlnnn9dDlEv+4NBK?=
 =?iso-8859-1?Q?3g1JbqeKByg4mxuvxqpA+wcYApC9Pbmr/MUUGU9bgK00e3FdBQD/Gr2A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25da2872-2b98-47ea-d381-08dd6dec9de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 11:35:18.5192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZzMQgAyU+qJrEkcoctnxkVaM+R4K0y51t04gU8iSWvk134vWJR50wmRfsn5eZgLXPxtvG9mitRdHbUfRSs3PQ79vJ7wbV5Eg80eqp2AdYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7228


Hi Andrew,

Andrew Cooper <andrew.cooper3@citrix.com> writes:

> On 27/03/2025 10:03 pm, Volodymyr Babchuk wrote:
>> Hi Jan,
>>
>> Jan Beulich <jbeulich@suse.com> writes:
>>
>>> On 27.03.2025 01:40, Volodymyr Babchuk wrote:
>>>> GCC 14.1 has 9 gcov counters and also can call new merge function
>>>> __gcov_merge_ior(), so we need a new stub for it.
>>>>
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> As to the title - what about 14.2.0? Or the soon to appear 14.3.0? I re=
commend
>>> to say just 14.
>>>
>> According to GCC changelog, it was added in GCC 14.1. And yesterday they
>> added another counter... So probably 14.3 will have 10 counters in total=
.
>
> Do you have links?

Here is the patch that added a new counter:

https://github.com/gcc-mirror/gcc/commit/8ed2d5d219e999aee42015a0db38612011=
c2c507

> I'd expect that to mean that GCC 15 will have 10 counters, not GCC 14.3.
>

I can't say for sure, of course. Anyways, it is not released yet so no
sense in trying to cover it in this patches.=20


>>>> --- a/xen/common/coverage/gcc_4_7.c
>>>> +++ b/xen/common/coverage/gcc_4_7.c
>>>> @@ -28,8 +28,10 @@
>>>>  #define GCOV_COUNTERS 10
>>>>  #elif GCC_VERSION < 100000
>>>>  #define GCOV_COUNTERS 9
>>>> -#else
>>>> +#elif GCC_VERSION < 140100
>>> The situation is a little less clear here because the development windo=
w is
>>> fuzzy to cover. Nevertheless with all other conditionals here using onl=
y a
>>> major version, with subversion being 0, I think the same should go for =
14.
>>> Unless of course there is a good reason to be inconsistent.
>> As I said, 9nth counter was added in GCC 14.1, GCC 14.0 had less counter=
s.
>
> In GCC's numbering scheme, .0 is the dev window and .1 is the release.
>
> The 9th counter will have appeared somewhere in the dev window, but
> that's all GCC 14 as far as we're concerned.

Ah, okay, thanks. I'll rework the patch to check for major version only.

--=20
WBR, Volodymyr=

