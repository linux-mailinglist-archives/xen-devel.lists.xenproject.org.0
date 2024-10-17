Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F421C9A29A7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 18:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820811.1234422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TkR-0003pv-BR; Thu, 17 Oct 2024 16:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820811.1234422; Thu, 17 Oct 2024 16:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TkR-0003nj-8f; Thu, 17 Oct 2024 16:53:15 +0000
Received: by outflank-mailman (input) for mailman id 820811;
 Thu, 17 Oct 2024 16:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rXRp=RN=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1t1TkP-0003na-7G
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 16:53:13 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2607::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ad24bdd-8ca8-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 18:53:11 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB8808.eurprd03.prod.outlook.com
 (2603:10a6:20b:537::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Thu, 17 Oct
 2024 16:53:06 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 16:53:06 +0000
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
X-Inumbo-ID: 4ad24bdd-8ca8-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoYeH/t0SASCbg5BZrfSFOluQxT48807GfnDZliWkfQAlyQaqYuKmWO/jX1fhc667BmWx1Luy4Y3quHd8WYIK6TvL5ucj5mGKTQ2UQO+lA7hUXj89YzkMY7AbKkxue5t/hT3SEMjpsOZ3zHaKUNJW6CX0p5fZzx2blCxaJYmzUf1NqVpijpQ6ngGkEcBWomuFA/UUOmWzVf1PgSvB1Ll0VDg+6TFvz4qw/B1n70GuUBQybF3xsrnGQ15iyu1MMK/qvITr12j7VxssKlZTYyGvMLMBiAg8AugLbXMjJqXM/XfH/SVxKHcOydUPnNyMYXE7QMBE4LGfAZJH/uPxyv8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUD2Jrq9fjp3vA8DtcPFBUdXVEZWwv052vpfQluUuY8=;
 b=Ff1Yi8H9YQ6S7qRifBGwQ8za1InYcu6Xq9QCeHBnAtlK2LW1IgNGnHP9WasaI8ZYe71Q76z3nCQ8bybA8Uzp+R8K2/gknItV6UaV8+m4PAK4ZM+Ao1bkPrnbfcuV3fYsl9DotYu3vJLoI4n/fARycMqUkUSy1h4zU5U7iqIlGokNLCJivgJoHSsubNFZFTs03udCbSeAMlITkPKhBcj7Vy7Pk4CYQ3U4rauY2nKq96URhlZeY6eAfJtyjx/O8hUyf3xu6+7ao3p1YQCpAux0G7QLmHCwqLwGpMkANFN9Dn8vAD5JGRg/80/cdOPobeK7noNMHKTBuKYZv5Y8EjiUHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUD2Jrq9fjp3vA8DtcPFBUdXVEZWwv052vpfQluUuY8=;
 b=uc0CnemGCeeUL+Hq3aYlIYXAadA6MtmPsgdYvReMEmWvXoesa0WNDOvnie1EiP847+5ORN6yvywAJ9aQKko7NEupXJ7JDJuVUQNT+msmUhC62+D8MxjMEn1OS9t0B15WhYGbBjqeo7A1G90+2nJn3KFs8IFy/xcQe8RZc4q6KwTNgWwawNsjrcPnzuYrRIYuoM84/G1qzbqEQrxPBW8632pxnh+o8CVgh2J/T7FVn1dx4OF3cS8Y6hcQA/IQS8zd7GjRrVcJY86q/tvJgOuUyAXkxO1wj/S2buhCgnc2YdV6dcLKpHQxpI22YuqPaauTVczGKY5cvlSAdVcns2gEiw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] MAINTAINERS: minor file line update
Thread-Topic: [PATCH v2] MAINTAINERS: minor file line update
Thread-Index: AQHbFk40xUuteohYiUWl6ITrxLtdtA==
Date: Thu, 17 Oct 2024 16:53:06 +0000
Message-ID: <87msj24qoe.fsf@epam.com>
References: <20241004111127.897937-1-frediano.ziglio@cloud.com>
	<2a020197-e061-4d8d-9d49-df7878153d85@suse.com>
In-Reply-To: <2a020197-e061-4d8d-9d49-df7878153d85@suse.com> (Jan Beulich's
	message of "Tue, 8 Oct 2024 13:48:41 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB8808:EE_
x-ms-office365-filtering-correlation-id: 37fed862-8e98-40bb-288d-08dceecc2c55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?naQ3rEVR/8e5gtIhAzCGOt6S5Bm3vrlmx1YQu+N0ODq9iRCNGzyLV2Dp3D?=
 =?iso-8859-1?Q?7AcszrBL56hhhHa1tnd82vzbuomLpQ0EcB+01FF/LLX9gPAZzrmitsdPiG?=
 =?iso-8859-1?Q?1jthjm376Pzw0xeoXvN0PVag8jizw5jCF5KhMqbKiWUNmpiIVbO8cBUSaF?=
 =?iso-8859-1?Q?/d4hxBhtIryVajvmU8VOe/ivzPUo0rQK6CgHwZsooqCoMuwXYAoAKGP39V?=
 =?iso-8859-1?Q?FGadqHiIRvzQwGms6obh/pu02t3rUmpTwLYN3IYN/3QVZbcStZjk/V6uVS?=
 =?iso-8859-1?Q?JtKEZ3bNnVbGMmW3JXIcpGCF++zmn5Ks9aVSIXTGfyUpeTu2ehNSFMNXyh?=
 =?iso-8859-1?Q?2GlTIkjBq2ityo/jssV6xjNbQHLq7jFHEji9lgJgjqUhNObEVv3NaFCpf0?=
 =?iso-8859-1?Q?P+byTQkZx30c9qUyhMXIXrERaGKGpeNCZN0lItZfz4Hsd4dhtTa6WzDMPN?=
 =?iso-8859-1?Q?xsSVramGCCYrCymuv5vLMjNke+vkGW+KTspx7CaHufNkLsFuuh7zFVcVTc?=
 =?iso-8859-1?Q?QMrQzujPypia7xOJAAWziZXbOsCnUMg5eebDyvDjgdORUE0TV/Ph6kJBvl?=
 =?iso-8859-1?Q?80pDCvdsI2qdvPXT6DG0Ajnmw1lN5Cd9CE8j7K1RAZGHtsjy5z7LA4KkOm?=
 =?iso-8859-1?Q?8W0FAg/XA3JSnE5lPnAXxMShGkQhjMqFRHd/i7UWDioPY6ykeXnqir02yc?=
 =?iso-8859-1?Q?Gk0a96PoodQYXhSp47aoRBpq3H9y96NGEwSBbIOmwA+DEbY+QgIPHX3dRI?=
 =?iso-8859-1?Q?caMTZu3BZsXCtK1SBPd6HOftmj4Pvu7w2rW4a1bTj/H80VkGDBqIOjM8ID?=
 =?iso-8859-1?Q?xdTOaoBUFz8c8Q/wEV1GW6YkGWdI2HlwIdSVeQTJ4O9w7HELDBqOvO2kC+?=
 =?iso-8859-1?Q?ufHwvZ80gA4eZOWLgn/OUXrQ2U8nGv43n7U/LLexXQv/J3NLTkSHXXwizA?=
 =?iso-8859-1?Q?sf9NKkU6OamTZdC6ab6KChKvcsbFIRooR1eHq9oq6lfLhoWtWb2LYgAuhk?=
 =?iso-8859-1?Q?i2r61ENYZT0S4z3/ko2g1xkRWq0u9BaXbfg2uzCb/z2RdxeRzQv1G6v091?=
 =?iso-8859-1?Q?oky3l9qch7DbNHifD1gwEc4K4Okj6D/wBp0VvZTEWX26HdsUwRY+50ISP7?=
 =?iso-8859-1?Q?cVKIJSaYIEiubnzgJ/rfSF6nYY5VNr0ewR1S/PCLR09zNvBW15xtZ5tbXz?=
 =?iso-8859-1?Q?ej+KJTABgjv0RMV3nQzbOZiqCzoCjX3jlgvnHOs+/kZujg+6rqomvMmHxz?=
 =?iso-8859-1?Q?kAaUuFYKCBBpOZFndxBpPib5ZuEI6xEcY6IoxbaZ1r7tLXdqCAY6uuT/dY?=
 =?iso-8859-1?Q?B8BOe7abAUZYnX0o4LOlveGMuNpJJ8v84BeQ1eEjuZb2FvzLVLQpuwt4zD?=
 =?iso-8859-1?Q?4ynGgqwhqbdiDWScQWg9DD8Xo+KzFyt/nCi0iofu/a8muh9gX8XZ8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hJb7dYPYmZZ/TCE1SuzB9pq5+bFmmUdaNsx27NeplxgA0tmQ5pUbqVPhAu?=
 =?iso-8859-1?Q?ow2rznveE0hoP9f31HfJEINe+fuXU8BYU2knhTEQRQ2Phe7aF7Z8WZzYKq?=
 =?iso-8859-1?Q?vG08CB/I3s9bxnKLxSjO/io1wZzjnsswsSRg3tMXYwXT9ZGsyUACYICHIj?=
 =?iso-8859-1?Q?sGGWvtknAUWD+piMnkG8+XEngOhWrnKMdUmpxslN9hLiiTDsv2tQwkxg9Y?=
 =?iso-8859-1?Q?qsclfHrfvzbUsO/4t+qDN08YzY6TRf7ugQkBdeufMAqFlgyE5sl8DiJfhF?=
 =?iso-8859-1?Q?LgsgB57IIDoWJgyi75Gch/vg96AydFKYQy+0O5NYOv969WYFFTE7WFdDXl?=
 =?iso-8859-1?Q?xgm1KvxRevMjvmYb98GVbcicj2OtA3Qtlq4tJqZebpfyd3/zPy5fZu2rxF?=
 =?iso-8859-1?Q?TQZXJRUZOKevUOeJo5aq9eNiSdEyThMl76yx4NiWR+uQ6mCjQD0/hIDmxE?=
 =?iso-8859-1?Q?keCxgFmmrZOniqUO1hee22uiQSpXKmpslh5AwtMFmPxQWr4GASDrK+R3sN?=
 =?iso-8859-1?Q?sXEvotRYPoHz3dR97dfssN4PB7Xj9ouQRw88L6l4FznTF+kL5ceF4wkWo/?=
 =?iso-8859-1?Q?C2Rr/OagM9tWsGbDfU0ns2DivH43QiGfzaIM5wxKZQ2zI6NtU5KkNM7t7I?=
 =?iso-8859-1?Q?hYwQGAN5GG2JlD4HSHeilojtjZC+sjVuj+VoA7NfA4XFZ0tKPOZ3tphePq?=
 =?iso-8859-1?Q?1fjlrd2e+z/7uatUkW2GSdwCEA2sbi4B9VMzwPSscw0Y53OKwxGRGeI/CQ?=
 =?iso-8859-1?Q?TmCoyunq5NX85mnUniIBvfBCfQ0kgTs3lghxrge3xgOSEOHU5zkMTAiR5u?=
 =?iso-8859-1?Q?mrk+Tet0gScPVvdu5pZoQXBt6pKFWEjuICXDvgNI9zSWKB4yOPlstY1/vU?=
 =?iso-8859-1?Q?a3HkIWuEmRztNXAF7icT/lquPGRD4/y8+ifU3naDDutWV1b8fb944novzN?=
 =?iso-8859-1?Q?HQRAaJGrr/Ge6p4TVu6fvzHIPLwK94YXzxwvSFRxZCtX5/nXp933aofTB5?=
 =?iso-8859-1?Q?PLufJRCGQzGyZzs1EbIaQNjkN8PeraxnicLC2BnLoL9jrBkHmr+OCl0sx6?=
 =?iso-8859-1?Q?HcLMnd+0KoCIXC3rue1yRZFDN1Z1/kfc/FrXUuB2CD6pblhHozWYwOLn3E?=
 =?iso-8859-1?Q?yt0WiEso7eBwsfionA110c+Oy1mcOldclW2r1oHNYR7I9lQzfgRR3NYi83?=
 =?iso-8859-1?Q?pmfveq/qKxN8XGtb5o0ymo9yw/+3lcdD62brS/J7Fyi/6c9pVIOTuResIu?=
 =?iso-8859-1?Q?jsUMEKkIjYBZAsVKjc24NKPwr3C0yfUu9XzEZg4t1huIop37L7tHqByABq?=
 =?iso-8859-1?Q?JHPSsnJs19yx/pfYrR3YCcSO/YcSLLLG4V9DNAPodv4Kws15Hl7/vT2qcN?=
 =?iso-8859-1?Q?iU8na4B7FoG+km/aDdqWPUsXb9F7mJUf6bJasOYZdMp+PB7qGPlTrq85ui?=
 =?iso-8859-1?Q?ijzZGoMC8JOrjFHXSg3TOLq6J8CMDMVZbONjsFlI6J923Jw/H92if6tp3s?=
 =?iso-8859-1?Q?Wp2RiM2saguwy2KBUZlVIvZoe36eyCa9ie4lHvV9XXHnkqO2DTPc225rvM?=
 =?iso-8859-1?Q?+KPugR0ZadtkngnFHdqZdVTG90WzzUxikizkSThoMEg9ut7Ke1jkR9huVn?=
 =?iso-8859-1?Q?HVZZP/aQafabSqvgv4Y8elj2q3jxlzEKvC6ZhmZp5qb0SMcx7blxYCTQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fed862-8e98-40bb-288d-08dceecc2c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 16:53:06.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wvYEP4gbAc7BunIv/D60TGp1W2GZ//AsluTZVPIZ0MkHxHKNDpLM6VA5RlTBFG+4oP38mYKBbgpat+fyyKS6w3kMY06hpTjrE8AIZDNGYRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8808

Jan Beulich <jbeulich@suse.com> writes:

Hi

> On 04.10.2024 13:11, Frediano Ziglio wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -517,7 +517,7 @@ F:	stubdom/
>>  TEE MEDIATORS
>>  M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>  S:	Supported
>> -F:	xen/arch/arm/include/asm/tee
>> +F:	xen/arch/arm/include/asm/tee/
>>  F:	xen/arch/arm/tee/
>

Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> I think this is a change which actually wants ack-ing by the maintainer
> named here, not THE REST. Cc-ing Volodymyr.
>
> Jan


--=20
WBR, Volodymyr=

