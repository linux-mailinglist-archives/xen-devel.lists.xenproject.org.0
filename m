Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5459A74096
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 23:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929955.1332698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txvKU-0002aG-Ua; Thu, 27 Mar 2025 22:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929955.1332698; Thu, 27 Mar 2025 22:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txvKU-0002XE-Qq; Thu, 27 Mar 2025 22:04:02 +0000
Received: by outflank-mailman (input) for mailman id 929955;
 Thu, 27 Mar 2025 22:04:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKAi=WO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1txvKT-00020i-DB
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 22:04:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f403:2612::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c2d8aed-0b57-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 23:03:48 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBBPR03MB10269.eurprd03.prod.outlook.com
 (2603:10a6:10:536::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 22:03:46 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 22:03:46 +0000
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
X-Inumbo-ID: 5c2d8aed-0b57-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcSmZ1DJBCi/H/7ObxPrCEJaGzJxfMYPr/VcPINYTq4AWMwlDm7znte1mgXJ+yTMRnpqhlJN99roVRwt6uEkMCvISOsCut6UPdTKZDeTBHgz6kvw0+qUMUWw3iixqscB78lbM98vYBZ0Q34A0tWmY/kOTCVKF9sklqJv7uA1rPV1HVUxLYKSvrDKmV8WD/RODJndmlmxR6iFHJRl7YHzauzmGZdkItoZsRBSCX6l3smTM+kYD4jU8W1gd+niIr+16ofj5X44Jb2swbVWm2bl9JvLW9YCcG/s1YPQhDw4eTl4cFojyFBtm0GaNRWhZE2jG5VZvldQlFJzMzf0nfIK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNeKvu66ucjhz8G35DH2Eyaeu4A3Qcujp9Xa82gHBnI=;
 b=smldSMnY9LM4GEy0+kwzj+WLwzB+jxNypa9asiGktJI0IorWBGDeEidjynfZzas7BXQM0BPu+2+cR2UwWrVD3B9bA5bxuqXMVrL9Tv78qPAW73iNVDDRvIJQB/nGCJLoO3O4pBxtzzTCasHhGjpgYKJfN1XY0rUdupuDdaKUw3dNjSjjLMLXsiofIEi2NvR8pPABf3jKH4cX8E/IllA5vmicxBZplN6O41KsTC9Aq4GrceIEDwEmD0UY8mC9TtW4o4FExOoujCEBH2aweXekW9EvnjdvqBS4aVRI5By7qK8MKC376ux8ijLGy25EF9ZGIddFnDBeX3tSNycrOJ08hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNeKvu66ucjhz8G35DH2Eyaeu4A3Qcujp9Xa82gHBnI=;
 b=J2e7hk20XiPmEytMSTMqe+9bD0dYVOR7IqMDyAzTkCUpBY9qjg6cohODyfQJvjrWBiqQfA/Xt9yoTRgmgiHh1jmEucSRXoPUnoalI+P+dNViLbPKDI6FPY6SrYx3lIbp87X8hawde3eKRr68p0fOMBawkQ0iHw/VrmAe3J/qVfmO7SoqlJWrN/KnZjmgOqfSMI/BW1Fe2obLubaOLtEcMssViiEQnAJ5HVLUnoLXWyp0B1JRqOaN4iv8Okat/Ie5zcypvRRIMWdRpNqP/CCygSqedpOQrInFlePOrNmGBYA2bsxT96lHdHgvRHkqsqRtHhh7GgiHWrKPkl9Qk7P5OA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
Thread-Topic: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
Thread-Index: AQHbnrDjP18EuEhGMUmNMUBtvyYXWw==
Date: Thu, 27 Mar 2025 22:03:46 +0000
Message-ID: <87iknugmgu.fsf@epam.com>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
	<20250327004044.2014048-2-volodymyr_babchuk@epam.com>
	<b56cd8e5-d17a-46a3-8584-cf69113c145a@suse.com>
In-Reply-To: <b56cd8e5-d17a-46a3-8584-cf69113c145a@suse.com> (Jan Beulich's
	message of "Thu, 27 Mar 2025 08:55:31 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBBPR03MB10269:EE_
x-ms-office365-filtering-correlation-id: 021ad491-7140-4602-ef91-08dd6d7b3ef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VOy0xw4HCF1KrSy2wtktle/RQWV7ExbSY/V6Ic6QEto03/u4KSZgH7NQTt?=
 =?iso-8859-1?Q?sKFFqxPsCo4Dt/TZOLJUjYIDPnTnjAL1sovb46kGieNAGJCLH6mDUcZyfQ?=
 =?iso-8859-1?Q?wbFUjC5d8DsxeAXaGfkss/G8STylJ6KQYpe4RotTUM4zLJoaVydaQFdBo6?=
 =?iso-8859-1?Q?FZgJmywsGV2A7yMlbJ124DzSoKP22DEgqb6pwghfMO9UkrtGLpJa2SRZ6x?=
 =?iso-8859-1?Q?9ypmhpgrwOqvQuHq7qeGaR5Lah+hu+G5Om+962hm0/E4rXHWFXjamQGfAs?=
 =?iso-8859-1?Q?TPpCUqnTjii7puHFeRERYq1WkZj89msdQNMHcfTLB9hf3vjQ2BHdAGDCXB?=
 =?iso-8859-1?Q?Ei8DfXxeIUPKBhqG5R20ec7as6ah8dgBbES0DT8kpji84nuLiZmogHVtjh?=
 =?iso-8859-1?Q?tKJMthLhuP0hrFD/W/g9BH2kpUPJxpnj92SQCeHWu+KwRnGBxk+g9L79u7?=
 =?iso-8859-1?Q?bswdej38jzkiDttqkTgRqiYQ2aX7lwcRAsmmJh4r8JFNQzHXvv8VnuFrh9?=
 =?iso-8859-1?Q?E5J24/CSxKu52S3hxZYtl8MxUxNNxO0xW9rLc3y50TwYFjMRJOlNzXmBod?=
 =?iso-8859-1?Q?RIinc4DT+w+K+CBdQp5wyPaVcAc953maPKW+6JVcnyCFkpku2FC9kUG/4t?=
 =?iso-8859-1?Q?TzZskIweXve7TbuljzUvt6xgZlBV2dzpgZOBbnGJBIRV6lEiZlUxIf+3Oo?=
 =?iso-8859-1?Q?e1V+L2T7+C/Fu2giVU76CfAdr74Z7/Z5F00PxdKcFM2R5NY+OfCebVfm1N?=
 =?iso-8859-1?Q?esk9k2UaCey5vI7rDBouGceVWm77RKtJAnuqgqNqEWRVvvSvSEOIcIn5MG?=
 =?iso-8859-1?Q?rt3ZXGtqYZVyD8ae+SOiB9CgiHDXRyefMLlWMbjOF+rkE00b0jvdzJTWTm?=
 =?iso-8859-1?Q?/22Hf0DsDpnAZWYXvTaCvvqyoUGtuJHJ3Ng0wuqwBVUAl2HseCrzsGDjty?=
 =?iso-8859-1?Q?t3OvvXJIffTMCCIpuvq0gBvjIsY/pD5nNUNxUitN5ZA7qlwOFLKTq5ClbX?=
 =?iso-8859-1?Q?b0wfsTwT/lcis/3Y7jNMpPnj7IyL9qBIIaVi9nDHy2oHYU1u+EBq7IV1OA?=
 =?iso-8859-1?Q?BD0B99W7onVWIveMtDHF5aywIvj1QsvNN//XU9uz8BYggNl1gFLfLIX5SB?=
 =?iso-8859-1?Q?E2BD/reaXEE+SgjyvkNu7Tfjur3FFqZQh8lnZP2hh4seR8/9N5fULXay/3?=
 =?iso-8859-1?Q?6fk+kOCZCcs0Cj3yAStu5hgaLJTE4wmehCYwbTKlKc+NFoeIbHhCBsdwTu?=
 =?iso-8859-1?Q?mKVu/rgyKXsrXhGO4xmFSu9Z4m02kFJPJQSzMLJ4OM5LlFJHWZ5Y/9XFcg?=
 =?iso-8859-1?Q?Efyn8FZSofomjt2TehVwgIJMzT1kzBdOj83AYBnKggy3GYj6fDGYpFdiWr?=
 =?iso-8859-1?Q?g2ISjRkiRtoQUet0Akj7lJvy7MGm38Tzf13XOfb1jSyKtUn+P3mLv4CMKY?=
 =?iso-8859-1?Q?cITZ62wehuC/aNO3gWtu/h3otoYlxGu16/1Uvut26/ywSO/Qa/CRyWm7Dp?=
 =?iso-8859-1?Q?XjJWHNVvA56S65eVhi3JWI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TCBlOUkJ/EFXi6QdoyErvZfom5JuA5pLEKIhIOY89TXBGp4VFZhuPLR35l?=
 =?iso-8859-1?Q?jmPsvth/p3H5Mtw9IfNkERvNSV2uSkckTfQJqSNCBcZf18xkguyNrdegwz?=
 =?iso-8859-1?Q?sX2ojU1egBLNI7M1td7806fmRXeWVWdrfy4V7BQ0HNwnXk/GjGLw3EmC53?=
 =?iso-8859-1?Q?k08Nlcj1SXE1XyfUrtGiZfVeSisn7pn4HAyUhUnFsgDmURGZwq5haeLq4a?=
 =?iso-8859-1?Q?zGN6IjTPtjy+OB6r0TX+Jlc16Ojo4bMDESXxi/2tV7rjH3CAISJ0eccIA0?=
 =?iso-8859-1?Q?pGq/9uYoyvYguzqJuU1wLNLrHfhwdTlUMd/NjM9VJua47+Cagjsw/+mdsx?=
 =?iso-8859-1?Q?M1VjaRiFBipWAnEdDsHoyxDWmUBlOmb9z59zndjl/J9cnx5pg0WSf4S0sD?=
 =?iso-8859-1?Q?4nAI6slE0Naf53Drlct925kQvscNHYZoUg0WsyuXcG5RNs1wMxqcf+95eP?=
 =?iso-8859-1?Q?WcjC8lG3DX2pe39UAvQyJ7sVzSvq0jOXMTq4xTWJiz9xL7r4/byNCSvmZZ?=
 =?iso-8859-1?Q?66j6/TIB3MwwLifEJCK2H2deR5W8iQcfNTTfDK7TSQA0VWfya01KD/kZx8?=
 =?iso-8859-1?Q?zvPcAIZHIkXlowoHBTdnNgvX2mrsDB1if5NYEEyYJBJaURENf1hJwxBBlW?=
 =?iso-8859-1?Q?fqWKXhKtKS151Vw8SqFVTtkhagpUbO1IlhtM+ZBSYOd2ENpEf0Hw4w4MIp?=
 =?iso-8859-1?Q?WNQ4saKX0hKNMAaGiA6EMMD6QyGLfb8c6w1mrF6CHSvgsg9TROlP639YRs?=
 =?iso-8859-1?Q?4Bjq7M7OvIOCCvUVFddX6GfEeSdy3/0wfs2uulS3Yj+j8EtFa+KvVyV2S8?=
 =?iso-8859-1?Q?UW7gP1MEFBC1axKFL/sCta5p2h5vTWxaqE4L3vQzYv7E0+rjLSBYoJMjsw?=
 =?iso-8859-1?Q?YyPIMA1IVX+GGYQ1M1tOpzmIBJwpYqBIMYE8e4SesPxgZfohQRWnGilt+4?=
 =?iso-8859-1?Q?87okT1Y003sZXo9HRtPRObY/wjlx9UFYG+NACs8aZg/KSr9EH3y5WzQLZ9?=
 =?iso-8859-1?Q?CbRUkxgeqsgu7paN8LhG25mRTPkSDnEurjsw7AH2lQ38GBOxT0kgXrKRmv?=
 =?iso-8859-1?Q?VMX9LuIiT4u+60E8TngsDASvuo9bZHs2Fmn6BUVfe3LZTO22qUW+VwVgdA?=
 =?iso-8859-1?Q?UnXGt/kuzdbjt9b1ySzmhTv4i+3FrV77EkilN0Miq9H5VtqXWKysCl/j/L?=
 =?iso-8859-1?Q?PKEUGdIijuCk+ooC8EAR7h5bpYv40jLkxKMiJWFKB//7+Vyv6nLSb6+Vik?=
 =?iso-8859-1?Q?IRWC3VnhUn9946owtUoPxbOWfmSCO/a0XSR8eJxgCag4+Knvx/l3jnohe/?=
 =?iso-8859-1?Q?vFpYkv1jtW098T7lyjZEL8u0XzKo6i8T2hI4mqVKjdJhPnCawmA2WDRqUW?=
 =?iso-8859-1?Q?CizvHEmNBlKP2vj6lLislfdT2v2O14w5rtum8N1ty3PawpbikLa4JcuXDk?=
 =?iso-8859-1?Q?KwRxl0FGeQSyW6rkmRlhCLrM/FSUYKhupUtrFqQOJDdGd+0OSCD/gayb8L?=
 =?iso-8859-1?Q?6+92C9toUnr1KAY4Ma4Cr6GQzm+L2d4fhej7FzYcCRkqX3nOUqrUJcqubu?=
 =?iso-8859-1?Q?Fe5AWZ/j2vabYczkXUm0B5v1YGVShfFgpXRPcgP5vd/cy4bQf7ntOwWwHZ?=
 =?iso-8859-1?Q?dZ2YrSzLQD8Ejb0ujwMuva0Jgi3jToV75TCddkXOP+piChYbHwdw46Fw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021ad491-7140-4602-ef91-08dd6d7b3ef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 22:03:46.1006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuFZnBopwYYrf2Cg/Lz4vetesd6lkYK0ztWoC53lodCNUCfd4OfH8/3NKfS2z2eqMYrKKzHfWLe6XcIAZyDmm+bC2eYk5Btl/wkN0uAUN10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10269


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 27.03.2025 01:40, Volodymyr Babchuk wrote:
>> GCC 14.1 has 9 gcov counters and also can call new merge function
>> __gcov_merge_ior(), so we need a new stub for it.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> As to the title - what about 14.2.0? Or the soon to appear 14.3.0? I reco=
mmend
> to say just 14.
>

According to GCC changelog, it was added in GCC 14.1. And yesterday they
added another counter... So probably 14.3 will have 10 counters in total.

>> --- a/xen/common/coverage/gcc_4_7.c
>> +++ b/xen/common/coverage/gcc_4_7.c
>> @@ -28,8 +28,10 @@
>>  #define GCOV_COUNTERS 10
>>  #elif GCC_VERSION < 100000
>>  #define GCOV_COUNTERS 9
>> -#else
>> +#elif GCC_VERSION < 140100
>
> The situation is a little less clear here because the development window =
is
> fuzzy to cover. Nevertheless with all other conditionals here using only =
a
> major version, with subversion being 0, I think the same should go for 14=
.
> Unless of course there is a good reason to be inconsistent.

As I said, 9nth counter was added in GCC 14.1, GCC 14.0 had less counters.

>
> With both adjustments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Jan

--=20
WBR, Volodymyr=

