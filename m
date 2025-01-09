Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E1A06F6A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 08:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867820.1279366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnLt-0006bg-59; Thu, 09 Jan 2025 07:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867820.1279366; Thu, 09 Jan 2025 07:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnLt-0006aC-2R; Thu, 09 Jan 2025 07:53:13 +0000
Received: by outflank-mailman (input) for mailman id 867820;
 Thu, 09 Jan 2025 07:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+x7=UB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVnLr-0006a6-I5
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 07:53:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2612::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5427d88-ce5e-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 08:53:10 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB11136.eurprd08.prod.outlook.com (2603:10a6:800:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 07:53:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 07:53:05 +0000
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
X-Inumbo-ID: c5427d88-ce5e-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvkP8RQsnFYSmCS8OPuhWiLzhDRWmpdlPtxQiaSn+hSrwSdJBgTH6ZIC6ieg4kMh2ZWRrOZIV+OMlytLSKIdo4cJTXJ0nmYtzfGw3RpE6R3fxaAdaxPODcmSyKFBs0+wOIRZ1icMWdCoBumpFDAYNgVEkevJRpsofYoZW7/gHaqAsiul7CqERQd9h/Z5dOf0MYxgZTNP2ykcvJDc/zayWjTZ9L8mGGRrECKkAjBiW+MI11bWp5TFOBZNP+xvEVOHoBTnwOsourhAmy1vjEbT5JLZuuyHn9KsZFm1Lvf7Ote80PHtrz/krku4vffiRqKWsuFMwmIsflVH+LrDQ8lUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cRQigDE4+iPzNEumgllIKC6Jqr6JnmciTa3foKApCE=;
 b=nlc6baH/cutMrLP+aW66ZYSTcEg/IIZBeNkXTDyz/jRC1gyVB3EriFuWvFM8NB8iCVISta440e/OiIflghAqOFGOHl2d1YTGAV78PU7Mi9ATEZYVhZ3g65p8MmjgntoHa2VmhwJDbwhqmHdE0rz9lSgjFkuwMzvb1YsVaJ4GQV3uNTVnDkxN8k6c0UzxsBZ6ftufb+5TA+iEHHKqa52YnWDN/xJfANk0uR2dCl2ptwZkDJBvcJ7AbU1pHUZIk5ZJOuo+W0uZGrf2fQLzjYKvEgTucS6KytJvu6fBNgIlc6n3GcVmNwg8PQUHOOjoffvn0vWca9AA/rm9zDe4uUfSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cRQigDE4+iPzNEumgllIKC6Jqr6JnmciTa3foKApCE=;
 b=QHZw7fWfZs18R8HmzXcr3u1LcJqtLyJJ0pBjiHRUO69qc/cBGNPwGPRa8eKAZrooh9iuj5F4c+C4QZ+S5PNz8D5V4d1i77iuz6AH6c238QU/Lft9Pdlsrg15HA70RTvT+rcaXf4yli7WXenwrhlfAferSQ7uS9sGDZzfJL8teRw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v4] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v4] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbYe83ZG0syumJUEGH2kASpg58SrMOExqA
Date: Thu, 9 Jan 2025 07:53:05 +0000
Message-ID: <E21BDDA5-F268-4127-82FA-1BD58DD6028D@arm.com>
References: <20250108170304.2250917-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250108170304.2250917-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|VI0PR08MB11136:EE_
x-ms-office365-filtering-correlation-id: 1fe6496b-8a28-4541-04e2-08dd3082a6c3
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oQyQAGgrL/At302gt5w6mTwnL2HcMW2Om9r/to3kLjR+gwtbOpg5ZaW1iE0k?=
 =?us-ascii?Q?YMI/p6TdZjrBNy51mvHWpDhC/cCxyTHVQaarAyVC+lCgmFzAzyZWY65w+zvH?=
 =?us-ascii?Q?Ujj774kh7/4dfmzufKPoCy9dKWtnNx4H6ymdOSm4ZRvB/cbQcYuwc8jPb+O4?=
 =?us-ascii?Q?2I4OyXtPeCyG36IRLaGBysgs1wfTpyWFMG4hf0JmcLQ3iV/iTJMNzKbWQKhq?=
 =?us-ascii?Q?VqcuB1o1+S6zwqsrI8pADaF5LG5mCKSR27KGMVM66hjCCm865jMpBFF8IDBW?=
 =?us-ascii?Q?fT+zoWCPG1qHUCPg/1+1suszQRJ08zy47HJE8Sw2JmJaUv1QPxqUhqlGi2oh?=
 =?us-ascii?Q?xM9acMP3Sy+vb5WsKFt2QXWuq94OYq8U0HOqMS8dNSX0yY1C0Udvi5QULk5r?=
 =?us-ascii?Q?rC5VUCBOph2iEX62PsfxYUdGB4thzamhvqH8AikqxoK5twsDgGXIOhPAn4ER?=
 =?us-ascii?Q?JeoRmCZWaL0OO8I5WdQAHry61jdWD2KQLqj3I5V/i85gZW16TJ/fDwtyIyM6?=
 =?us-ascii?Q?61NwhdIYPCay1ClMgBRJIp22xBgO9xF3Z7iNaEZElDGdlKIj0wtcIzF0BhDw?=
 =?us-ascii?Q?SaptwRlRIuYMvloDf1/4N53NO7R1iCRAmn6RRZNLLC5wM6/gQQDdQhE6Xkjm?=
 =?us-ascii?Q?em/37t5KGYDHvnT2zzL7n8+YUb07BEHBWljXudrRQsOI12nYEHoT3GRh4IRD?=
 =?us-ascii?Q?phfRUyddc5dYhQHAYISwcxj4MntyEhVqwfDg/rEWxUsMZ8IgmqvXGLJ14buF?=
 =?us-ascii?Q?rcH2NrrdJDF7hV5gh6SruET9GdKRbYfTYv0gTxuu1q0KDf8DlcHvW4G3TXOb?=
 =?us-ascii?Q?xeEl67+H98qGGltxLHRAUyGfEBpnQOdEUDyOvsQGZlr5v51Pmwg/8tWmN/Na?=
 =?us-ascii?Q?rdoppAKeo4sa291RP8eCpC6S9pD04XZxBe1cZYNscGDjlNT8/utkgM4I6YJC?=
 =?us-ascii?Q?EwZqxVlyvtw9DH7iejCypAvMK5EhftNM+GbTWjaGr/At5+3nf/KdLcugBnbj?=
 =?us-ascii?Q?ac68LH3VCe02SlJP71duXpjbad3VIOzB3si8F8qVKrOkhBbh+gqdElLhvyey?=
 =?us-ascii?Q?Etc8pVGG0sMNb/MVEDZkmh7I5HR6WuwxUFAimxXstPpVK1iPwjIjEjzYKoDR?=
 =?us-ascii?Q?eWzjXO7diYZRdc/e3moEuxZNp45w0Ja+VRNMBpsDDrurmHjeolHW5S2LY5mE?=
 =?us-ascii?Q?ltcHIld+0EvTYTBl3eAKxcyQlMTr+9o15wvwPQSdbxlQv8qAcidueHVm6LV1?=
 =?us-ascii?Q?pPzCO+bmWqQASpv2jCu2+ImJBY/VTNk95SigdEX32bBRd10mQ14SKE+xjPgS?=
 =?us-ascii?Q?ZWQATBlQE4rULvIAXk6XDUPDxlFXgQ2mf1F7cRtATRtbYQSNeYsharPizCAr?=
 =?us-ascii?Q?t7jgx9IJrZ4FfDzjdh29bYFc0bwJrg0sLl7vr3LHaNQSUiqpBQ923BlRw2/R?=
 =?us-ascii?Q?Gnn7H70jnJdFtYUlhHbszjqdv3fFYicM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?me8+ud1KpfGs26UDdOgDYI7CzBPbm/GrZlCv/ykJ0wg7P+LLQUIWDudk7F4b?=
 =?us-ascii?Q?9ZhV+KBU5iEHjbmi77GyYdaQSUnpcISs/o5oXOJ3VlByV/W0xZzBtIULZEoD?=
 =?us-ascii?Q?c5du8PxaWh+df9HMFOjWnwYefjLZHFkImCi1VkaAhfUfZgNUZ93h3s9CAxcy?=
 =?us-ascii?Q?GB46N9xI9IzK+trXE4AviMG1re46dWzTnJoY6WyDfSRCuMvMP+qhDSusiLTc?=
 =?us-ascii?Q?wW5XTtfU5WpZTdrDnnLy94yNw+cUEU3ShoM43IKg7wrfBaojn1orLqNzZpaI?=
 =?us-ascii?Q?SDVKb5ypM/2OiO/JRBo3UmvEt1jhkUyp2cPDe4ulAbEo9424kTcoWuDPz4FN?=
 =?us-ascii?Q?cOErzN6HOBPDjYbeAjJKQyKPAC8YLvxFZkIoZptEW83P462iNgCXkbQDHt/C?=
 =?us-ascii?Q?cS4GgspG3iaPF+ROutga/3PP5fe4k41Dl8d96B9O+ZUv2A/1Yt5uyfLERmRZ?=
 =?us-ascii?Q?qEG6yWSmhw66a30efPxAxT4YC3i/8F/wJ4OkArWS1ZmBFiQwi1QWBxvsUC5J?=
 =?us-ascii?Q?HLP4RdFRlDynklC4fVwDYY5LC/PNVS3YjpqlDor6DNHMl1iaXFa6KCkdrI8/?=
 =?us-ascii?Q?3QLyVWpXAzXl2BbDTTxc1LG+bFXfbSVdotZRsaD9Jmyp/FqHQxmFdsewji5Z?=
 =?us-ascii?Q?ksYzvZNPe3foAIfQU9/A1I38c97sYDNPWIRtTU+XrZy8ogxUg6lmj7V30U6v?=
 =?us-ascii?Q?2A5txVKA4v9lm+yfKz198zJWyk884HScgqX8FTlCn/GzXotHu7PR5IIw9XRN?=
 =?us-ascii?Q?HntXC6R+k3LcABGZK5ER4akJE5qCer6n7u4XoB0Gt8yARPlX0hi6xmUQ6jYZ?=
 =?us-ascii?Q?VXaVj4KIQ2HNKMX5INW56pgn1zE9szmYUU6WnU2hzrnaVogiDqBQpMJSIQ0v?=
 =?us-ascii?Q?Iwn3Ebw0oYrjiWgntHkxlioxLY/j9dQPptnYlQNtVZOZYev/FgtK13LiDK9e?=
 =?us-ascii?Q?8d6ZwpTAZlOI4DqYsiJRZO2w6omSp/2OgcB255Qe7wv7RMDgQeU4OUml59To?=
 =?us-ascii?Q?GqRf4D5AMTZ8tWag3sifCk34E2dtusYt7q/fvinZ0kQ1FR7eTN3Y34Ypat9L?=
 =?us-ascii?Q?0AGiUGjIjSfyLHswE/pgCCWmJJLDqZ//a55QLlyOPhRj9SS40al7joV5YU8P?=
 =?us-ascii?Q?ILh8oMx/AxbDpsEHmQ+GTmoNLJBeaxf8VptDXtEwaKSh1uVMNw04FiAYG5Q1?=
 =?us-ascii?Q?PxY0fWuidibWzDJOC4pF47TXzbtFNPnnNB7LzrGblNtnVajfAImGifWrkBwc?=
 =?us-ascii?Q?3uu76TJ96O7wpY4FP04hwXuKBrVQnDhX9as/HB74S4KZRELML5VjV+QrPLao?=
 =?us-ascii?Q?oO+11OR0Ao5r3rIYCc2qQNSWDJsrY+9RmwfZkVMmzoNO684qGItloRZ1p6dE?=
 =?us-ascii?Q?7dyXh6y8epsHCcQclInk7BRMqdRlcOx+B1LFL5kLmDAxqYybM7FNCwjkJSO/?=
 =?us-ascii?Q?cpmOmF5QHryFHKrUEMlR2fKs+cXhv6MfC1rGU5eMEn5J5+RAg8rP1xYSYTAH?=
 =?us-ascii?Q?2x4XXJLWNtYF8aKjU0CC2GdiJxbOuzo9WgFjP45IL6DlYwCBviHJG3NgNVRo?=
 =?us-ascii?Q?1tuNIyWqFDrLyG9wmpTX7Y0PXh+xWT2vDYh0q0az4DY//6bI/esgMHiZ/POY?=
 =?us-ascii?Q?PkMtzgRLdpURr4KGa6fu+zXlylJMDHLZIFJRfmX4rSiNVXJi9u/jeQb+X1zo?=
 =?us-ascii?Q?7fxE2A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3A20DF84A8D46C489773039FCB5F092B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe6496b-8a28-4541-04e2-08dd3082a6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 07:53:05.7585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idLxLco/B15ZBL5nUXn6duAE9tOZK4KdrL+69TrBToT+2rXYv1OplNjCkCyrxR1X7LuSn/Tmt3tQfzvG+ZdzhfaEV34dhCDGDh0oGswN4QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11136

Hi Ayan,

This is a lot better.
I just have some minor phrasing comments after.

> On 8 Jan 2025, at 18:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> Add requirements for dom0less domain creation.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
>=20
> v1 - 1. As the dom0less domain creation requirements specifies the dt pro=
perties
> for creating domains, it has been moved to product requirements. Product
> requirements define the interface Xen exposes to other domains.
>=20
> 2. For the requirements which introduces new terms (like grant table, etc=
), I
> have provided the definition as part of the comments.
>=20
> 3. Introduced new market requirements to specify that Xen can assign iome=
m and
> irqs to domains.
>=20
> 4. The design requirements will be added later.
>=20
> v2 - 1. Rephrased the requirements as suggested.
>=20
> 2. Split the product requirements into arm64 specific and common.
>=20
> 3. The arm64 specific requirements have arm64_ prefixed to their tag name=
s.
>=20
> 4. Grant table requirements have been dropped for now.
>=20
> 5. Added a market requirement to denote that Xen can support multiple sch=
edulers.
>=20
> 6. Updated index.rst as we have a new file ie product-reqs/reqs.rst.
>=20
> V3 - 1. Removed duplicate mention for 'Rationale'.
>=20
> 2. Fixed some of the descriptions as per the review comments.
>=20
> docs/fusa/reqs/index.rst                   |   1 +
> docs/fusa/reqs/market-reqs/reqs.rst        |  31 ++++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 128 ++++++++++++++++-
> docs/fusa/reqs/product-reqs/reqs.rst       | 160 +++++++++++++++++++++
> 4 files changed, 318 insertions(+), 2 deletions(-)
> create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst
>=20
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 8a4dae6fb2..1088a51d52 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -8,6 +8,7 @@ Requirements documentation
>=20
>    intro
>    market-reqs/reqs
> +   product-reqs/reqs
>    product-reqs/arm64/reqs
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index f456788d96..39b2714237 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -47,3 +47,34 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Static VM definition
> +--------------------
> +
> +`XenMkt~static_vm_definition~1`
> +
> +Description:
> +Xen shall support assigning peripherals to various domains.

"various" here could be removed or replaced with "a domain" to be coherent =
with
the phrasing after.

> +
> +Rationale:
> +
> +Comments:
> +Peripheral implies an iomem (input output memory) and/or interrupts.
> +
> +Needs:
> + - XenProd
> +
> +Multiple schedulers
> +-------------------
> +
> +`XenMkt~multiple_schedulers~1`
> +
> +Description:
> +Xen shall provide different ways of scheduling virtual cpus onto physica=
l cpus.

different here is a bit imprecise.
how about:
Xen shall have configurable scheduling strategies of virtual cpus onto phys=
ical cpus.

The rest looks good.

Cheers
Bertrand


