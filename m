Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F8A7C78A
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 05:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938824.1339299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0uFK-0002lp-MY; Sat, 05 Apr 2025 03:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938824.1339299; Sat, 05 Apr 2025 03:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0uFK-0002jV-JL; Sat, 05 Apr 2025 03:31:02 +0000
Received: by outflank-mailman (input) for mailman id 938824;
 Sat, 05 Apr 2025 03:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XGR=WX=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u0uFI-0002jP-US
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 03:31:01 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260c::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60c953ab-11ce-11f0-9ffb-bf95429c2676;
 Sat, 05 Apr 2025 05:30:53 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA1PR03MB10842.eurprd03.prod.outlook.com
 (2603:10a6:102:484::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Sat, 5 Apr
 2025 03:30:50 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8583.045; Sat, 5 Apr 2025
 03:30:49 +0000
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
X-Inumbo-ID: 60c953ab-11ce-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pICko0pwkef4S5haEYwX3zWMdRbE6tiv1V6V1IQr+EwKUiPGJWvYFYyOqVSAaGsiFxp2SN2WUvKv7GmXmweLJDAwPmalCxhqdhKL/2uPNqp5CgvtqrFFhjAOqohpcCbV9mKRbEfAw4LyKbvlCLoCZJaR8jxQG+GsB6ZB8x40TGu6xsw7mfn3dO5LGRMwyvzueQapSoU5UZrlydqgi5JSCVL4a73t5T7K846L+7dfonUbLdDGF5NA+Xe1J+97eeo7KqAb6uDh6t6Bwm6dd6aZzn2ApVSta9s5U65PzJ5xSLYqCpC9upTF83EnC6OxQMZyi8wJxMPc9iijtxoXHERxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe0axswOcNBDvQNWk9iFqLODNOeRV4wn+a/ajQqhuGU=;
 b=Kh3UP5B5rGUjXF10+U89c8CczzVZgTHQLcIOMdHOU73w6EiuId8zrjoWLkk3D5uhL7K/DiK2JaeAOte2GeuX0796meqLtA3ZLTQcIuvDwfMdTnAR1bq4PDjyodrB1ZHW4a5QAiyAGgN9Bl8a7Pgq6p0OoPumvOGQfVMM1ZaP3quSakjWwN/xaEsJXdrw4ia4m0Bkx0RPKnVk6TswonbA/bV5wx2wsE0APP/E2owHauM30w+AMMkWZweDyMGJdzWkhKILX8c5Hvt6nfM2tg3+VbwGFT5yFJ3ce/QGc8o1z+rInKvANmgIoT8IPwbFaqYnCRKJB3O8irg54Ic3fGQ/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe0axswOcNBDvQNWk9iFqLODNOeRV4wn+a/ajQqhuGU=;
 b=ETq0RdEqTPjso68iuJSpeJTW0p0M6fj58W+KQWM0ne8F2GXWq0RnMJNCSBNFuu9ENf7WNOf8CP6DTNAI7PpcggvpPyF3FsfhENGSQuPytL8NvccsDjp5SLKMgECBb1/GWM5L22G0I+rl2okAz5QgRPrFIfZ/z8kjUdfN/MJ0HYgKIFGaQBR6Au/cYE5elnl7Pr5GPdG/ZVFIYu+SHdN90uFOoffqWED4G5IpxN4ItS3Cr+Ryhg5tY+3RhgPiAbWeCQAzRhO1RY7nCqv/3yfJqWiI3Lw6ly2c6VEmAmvaigtHYvWavNaiWponJnwnPzlnsWYDMQjuCfG8o5OcZd3vrw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
Thread-Index: AQHboqPjQYlXeZrAE0u+zEMqLR0ZhQ==
Date: Sat, 5 Apr 2025 03:30:49 +0000
Message-ID: <87mscvffo8.fsf@epam.com>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
	<20250401011744.2267367-4-volodymyr_babchuk@epam.com>
	<7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com>
In-Reply-To: <7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com> (Jan Beulich's
	message of "Thu, 3 Apr 2025 09:30:21 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA1PR03MB10842:EE_
x-ms-office365-filtering-correlation-id: 3cfec733-4ec6-485e-8a6a-08dd73f242d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nZtQDIPGCwxo+Ll6UR2kWRKgwFL1EMuhmPbYxdCCtxJPUuwIt4sc1EaAjG?=
 =?iso-8859-1?Q?LbQ8g/c3fndvu9iD59eqHapakOLby0z/CAH1879v8JgG6XAsAf9zkHIJq/?=
 =?iso-8859-1?Q?nfuYpowFy88v1otrKf2cIlzYRK5ZzHV29aKo0FK0+J3JcFNMAHmbKTtNum?=
 =?iso-8859-1?Q?XnGi+pDVO1ZiUhYI8UKgLLu6kACusUFqgD6aDpdl2CodJ0ZzoJkf3//NfZ?=
 =?iso-8859-1?Q?2Ty/7fEhchpJPvYFtfCa/W+qQgcJoAX4W5Rof5nkFrE7IU3RmWV1TK6UuW?=
 =?iso-8859-1?Q?L/Tq0uu4gcGxdg+sAWNlhy3eWEJydvMknMUZSmSazEFa7HUL1MkZq2tiJU?=
 =?iso-8859-1?Q?vWcSuZruGSWh52epsS1ss2Rs14OV62nLzOk6XVW5rMhq0d+A1ACmkte9QJ?=
 =?iso-8859-1?Q?fbPODA8A8Q1SA4E0kjXiTh0zkLxNDgla+ATtxzHw0wjGxT75pFKUoYtuOe?=
 =?iso-8859-1?Q?U3x5t65MkPMJtPlzktgc9XbwXJxW7puVxdRGu4FZ7NPzPTqYFdJEEfDfn5?=
 =?iso-8859-1?Q?4Jd7/XAsfChiSh/0+EXIk3cg44HyxKL8tG3bW5cGFrk8N0x7MzKdQthyXa?=
 =?iso-8859-1?Q?5XNKCOBw5BVHNk/RmpPygVacHm+18AkVnM7sU2rA9cl/myDMcomnKrgnfd?=
 =?iso-8859-1?Q?WYgjl7g0wiKCP/iJt4Ksh6ayGs54FapfTMe9Fz22N+rUy7dc/X3pp0CMKX?=
 =?iso-8859-1?Q?kEwHO4h/EEVdb2zJLKmRj2+b5tQw28XB/q7q7Hc4kjHOxSJsy8v3+riZwn?=
 =?iso-8859-1?Q?/kdxsklPraJH/KStaA3ax8H4CqBKocGno73MHywJ/eZcvEAq/ZwOj2WSHG?=
 =?iso-8859-1?Q?hwHWQ3e68J7XPQ0X6XRYPhqLFxfOwrcy+6k2ulI9wyeo2neuRcOAWryHN0?=
 =?iso-8859-1?Q?Xu88V6ORwqCfa2eRHVfbYPzHi6hgZtSlpTNfasr0GOtBDJ7vAidg+GKKLL?=
 =?iso-8859-1?Q?NMDOYT8YI6V2KNJXEYukC4jC3pOvqYrm4oekFOim3Jwjele8pBpd/dO9vl?=
 =?iso-8859-1?Q?9sgvxhHXPi1RD6r/Ey7qgLnjtjv+qL6sy64MiWDBVnHm94DHlz99CPj88w?=
 =?iso-8859-1?Q?omx6JdQcsyaOE59vzVQm+pQ3EuI7U4EUk/nM95efiD+gahVbhxi3TQCduF?=
 =?iso-8859-1?Q?9SY2X3muJTh0tt4nAqtdVs955Nm73a6FIyAoszaeMebsWWxeSvpbLmmhFc?=
 =?iso-8859-1?Q?nMcXPhI34BapL6jPby4nq73RzKFEqRrcR6kHk6AltX3c5sqypT4Hj2Kyfz?=
 =?iso-8859-1?Q?60NCPY9IwBU6K7R/B+LuEHbqQWwjehpwS5VCOS1fTg3SgfUUbCFZr1JXxP?=
 =?iso-8859-1?Q?N8j4H5j0l8bqlcSTOAN8fMcBk1qdhTXvirdcAghbvY9ei6h37WabQoKldC?=
 =?iso-8859-1?Q?YJBbNlq0VBA4AzBEOJeZBdQk0o8+3ckHxIhaLcuUrwBFTBNJr292pqXnKu?=
 =?iso-8859-1?Q?KBcjlulKsUywrHfc/HeZuxgzrwkJ4OnsQCA/kgL3yNj/AdneajZZ6iV6sZ?=
 =?iso-8859-1?Q?lPe/9FQKNimCaF3Rg7pqzW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LjBkcCCfvdXANytYVcLQ5YYWg6/fxmpiXV0HoRcamdQR6HXPO4LkiDiuR8?=
 =?iso-8859-1?Q?yFizj+SgHroQvKr8XCHxbSY3tZybGIUbE448iO+C8ViLTvr8WCJhkPPqdV?=
 =?iso-8859-1?Q?gO7TUwoQgRJddf679R6i0zBwYgAF8qzSvLj6xkXN1jydrZwc2bhzCx8JDm?=
 =?iso-8859-1?Q?zn9SEWITvpVWErvEwEWaz/cVwt1S3k+mYb1O5xjtKVj1AQC4hbKnBwxtlY?=
 =?iso-8859-1?Q?Ek3oN5PA0YOTPk2RAx0HZv1Ei9EwtcMbFV92Wqmpwj+upchZZ0t0NXOXrC?=
 =?iso-8859-1?Q?rgeiwDp8xxdENGf973cb9dYb0vVRKXDpbRk3qWyizFXV/QNuDgIdMTTnwb?=
 =?iso-8859-1?Q?MXlqeJND1smjR41jZDysFSIMrZ/0tJ0Z9fhfuGFu8HdslwY32p2IQViIm2?=
 =?iso-8859-1?Q?UpVLfaW+qmJyE/KCjJ6SKISPMPNl4pHiI7R8LvSKrJIAX3HQ65iX3rf3wd?=
 =?iso-8859-1?Q?9djOHJPK3MlPLuIT9wQ8yT93W+1WNsUiUHxrbYQgWdKP9es0TXKP/xxHWS?=
 =?iso-8859-1?Q?LUJLp1y2bSgTswIlesW9w97T3ti+tJmSOMdy7H94gSInv8wMWruNkvI13p?=
 =?iso-8859-1?Q?qUAMbKm13PGbzRQKAexTCGj8VTB/lylOpf3yl8SYg9T/6oSiFFBn0ryprx?=
 =?iso-8859-1?Q?fcrRpQkojsUXtsT6Jh3gzaIDrQLrB5t1rZ0qjC8y4UdpAERhRxBWQ4lfwS?=
 =?iso-8859-1?Q?TSbDh3HQ1yeqYiW2G9nZZCBcgrd8w07dY+ysWOdtQ7yLdMk0X1Ctslxp6g?=
 =?iso-8859-1?Q?nd9iU6SxAryFugD2CMJdC41mIYKHnJY7x/q0+hmZAZARGE7YMsoQybJ3h/?=
 =?iso-8859-1?Q?kYliOS5us7G7fUsslFY9RHwIsP6d7h77yWvMevJ7EAbeYkf37I66PIeWGV?=
 =?iso-8859-1?Q?+WRgnUo/1HrvssydBLeBGY25rZeDZY7fo8KIbMZaIKDYB3vo1N0/Oh3VwV?=
 =?iso-8859-1?Q?2cVF1PDXHlhlMdT5yrDaeNfdLFMpTwJFaAjOxzfsqR+IFp56wlTRg9ayNy?=
 =?iso-8859-1?Q?xS0buNA8v1wTttV8bNDZb3ij3YDvrjNzC8bn+g1aLE0kICfWO7alamyx9R?=
 =?iso-8859-1?Q?mzGA2EdHVhoKE2Y6kTvF4YsXPU3MTsP/FJjkaX8B09LxExd7LI1CLO8Ec1?=
 =?iso-8859-1?Q?zdA/ByfgG3tPTrUr6OJusD1xYKaySCwf1T7I2XAWk/odx/riGZOMtmv1O5?=
 =?iso-8859-1?Q?GycChCa2WGrEU0wa0iXBvRUlkhxV0wlbna0b9A/L7mdEK+N1Vs6YQqOATV?=
 =?iso-8859-1?Q?V/ePU4RZL0mjtguagemkspm68Q35bPIQf8NS+Leg74EzY4HP+LGcCM4/rq?=
 =?iso-8859-1?Q?IU4hBKyGHA6ahrFcHanL3gIVS6hsGjIQb3aYByvKuBhUR8XPgjn55o7fIO?=
 =?iso-8859-1?Q?583MXNeSjdtkE7pN5U517HyrX6+IzdwdDOy5tK8z2zAhucROHAM7NussUw?=
 =?iso-8859-1?Q?WLDuOicEcYED7XxlSH1RW57O4bDXQYJsGOAsCf7NH/YCC9YppUwCvdKn5x?=
 =?iso-8859-1?Q?eYm/qgOFmRyRBuiPTjvchKdQ6q29GlxTU6rKqDTN8cp2xKSKNvaZIVJbbi?=
 =?iso-8859-1?Q?IbjEqjSezC339UmciUqwy6BpB5esxUIrqke17nwDCPHMsG+VTC1+xhlVoO?=
 =?iso-8859-1?Q?e8x3RC9MJfcKbuSeTULRcdF03/E/9sE1OKdMmAK9Pe0BG6H5z+nCRD2Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfec733-4ec6-485e-8a6a-08dd73f242d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2025 03:30:49.6260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWzBJ66kmuDoZ+xqvhOQjpFnaj10d5mfaUswTK+ckOoDfu1ROP7rkeSw7wlLV1y/wlOLyjQ7UQCQ5KG6VptLc1yjJjbCBxBVx9WJ+3MIg1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10842


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 01.04.2025 03:17, Volodymyr Babchuk wrote:
>> --- a/xen/Kconfig
>> +++ b/xen/Kconfig
>> @@ -41,6 +41,11 @@ config CC_SPLIT_SECTIONS
>>  config CC_HAS_UBSAN
>>  	def_bool $(cc-option,-fsanitize=3Dundefined)
>> =20
>> +# Compiler supports -fcondition-coverage aka MC/DC
>> +config CC_HAS_MCDC
>> +	def_bool $(cc-option,-fcondition-coverage)
>> +
>> +
>
> Nit: No double blank lines please.
>
> Also, just to clarify - until the use of Kconfig (alone) for things like
> this is properly resolved one way or another, I'm not going to approve
> such changes (but I'm also not going to veto them). My proposal [1] is
> still pending with no resolution, nor any counter-proposals.

I checked your proposal, but I am not sure how it maps for this
particular use case. In your example

> config XEN_SHSTK
>        bool "Supervisor Shadow Stacks"
>        default HAS_AS_CET_SS

The default value will be "y" which is desired, but in case
of CONDITION_COVERAGE, the default value should be "n". Are you
suggesting to put

ifeq ($(CONFIG_CONDITION_COVERAGE)x$(CONFIG_CC_HAS_MCDC), yx)
   $(warning Your compiler does not support condition coverage)
endif

somewhere in Rules.mk ?


>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -138,6 +138,9 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
>>      COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
>>  else
>>      COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
>> +ifeq ($(CONFIG_CONDITION_COVERAGE),y)
>> +    COV_FLAGS +=3D -fcondition-coverage
>> +endif
>>  endif
>
> Personally I find ifeq() uses like this unhelpful, and would prefer
>
> COV_FLAGS-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
> together with an eventual
>
> COV_FLAGS +=3D $(COV_FLAGS-y)
>
> (if we don't already have one).

I did in this way:

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -133,18 +133,19 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): =
CFLAGS-y +=3D -DINIT_SECTIONS
=20
 non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-=
y))
=20
-ifeq ($(CONFIG_COVERAGE),y)
 ifeq ($(CONFIG_CC_IS_CLANG),y)
-    COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
+    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-instr-generate -fcoverage-=
mapping
 else
-    COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
+    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-arcs -ftest-coverage
+    cov-flags-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
 endif
=20
-# Reset COV_FLAGS in cases where an objects has another one as prerequisit=
e
+# Reset cov-flags-y in cases where an objects has another one as prerequis=
ite
 $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
-    COV_FLAGS :=3D
+    cov-flags-y :=3D
=20
-$(non-init-objects): _c_flags +=3D $(COV_FLAGS)
+$(non-init-objects): _c_flags +=3D $(cov-flags-y)
 endif
=20

I hope you don't mind having both changes (COV_FLAGS -> cov_flags-y and
introduction of CONFIG_CONDITION_COVERAGE) in the same patch. With
correct commit message, of course.

--=20
WBR, Volodymyr=

