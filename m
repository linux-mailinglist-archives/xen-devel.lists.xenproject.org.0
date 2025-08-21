Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03EB2FF71
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088973.1446673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7h4-0002Cn-7Z; Thu, 21 Aug 2025 15:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088973.1446673; Thu, 21 Aug 2025 15:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7h4-0002AZ-4M; Thu, 21 Aug 2025 15:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1088973;
 Thu, 21 Aug 2025 15:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up7h2-0002AT-Fx
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:59:12 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6639bf1-7ea7-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:59:10 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBBPR03MB7146.eurprd03.prod.outlook.com
 (2603:10a6:10:209::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 15:59:07 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 15:59:07 +0000
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
X-Inumbo-ID: c6639bf1-7ea7-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndP1wtsdpyWuIM8MHfIcjGYiT/gZ4rJQ4zezvX0FCo6fLLOYywxeAuTCqdIJJgfJvpxp+ePXmFTkZCma8hd4leAa63P7q1oAvQ0+kZtZb25JF+C17mYWW2nAmawFC5DV/LGoCN35m7FkklmKyrIfW8pWCaR4RpBk7CQPGu+IA7V/MZ1GB/1BNxO1dsRqB9U2IxiIZNQHFUSGVgXHpjEodpg4/aI8G8TBMLYNRqIwGrLOTdLvrLirSalo9WG2qqSWTZTnb5DnpVaCw0MzzvlPi393xQ4NL0JMrRK6oT9nWiYw78MLEXwo11l+miaNFCYwB6LbTbv/YEwl+CoW8q2RBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5plupPCXInDySXXvgRmYFiudmRKlD/Q6oY72gAR7Lo=;
 b=X/z/5Q3QnuhstnZLfey+rurQT/bmOWqi/KG8u5zA+IjuvoVDnSowZjTCGw2cnOdgPWOje3jlR3Hi7IyDtGO91OeBHu2NUA+bA0ULNC6cbu4VZR8yUIVxVmzO5fUPOrrgmJpJgPgFT88jpmnccfjPB8Uc0vsXno/26vr+tqQjn+uc2mxEpUxaxpp3BOPO05/VgttcXKuNxag/hEsG6CPH6uLR0yeaJzCRAsK9R1A1t1UTACBCZHCKWdurd+Hoj4lLrDB66GugQbzokyu2sWzUfIwmYWvn/bwR/I7oBm6Xkjg+JeIr51xerHFdwRRodNozUp5Qnj0Lva7g0h2Nm4IeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5plupPCXInDySXXvgRmYFiudmRKlD/Q6oY72gAR7Lo=;
 b=kQl4fLxq1PbBBPSdzpYr67oTigskQHMalwg93MpBzZWBVjwsXM7GdfReeliZ6ZGTr5kV3pfIza9gcxTeIkKDCwpz3hu8XIwQ0Cx/kRFVeUlYtTzRdNou/hdEKkzH6KujC/GpcM1fXQRiotsxqcYlWgeYU5Xn1/ITUKDbpRu8+oCtA+cyjP7zu3lx+C/Uq0efkdGv2idcA4+WmM0C3f1JgSURqMKU/xc58xHhESG3gBBmVdZoHbSTEK2N2zJyUwUWHUWRBm9HWkMR0mFGBceah4IhtIl2ggEoKpKvQQ90G/nZKIY4SeTdr9R51ozcow7lLWVjymjOcWEzNTYyI1yE9g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcB5d7kgaRrTB4eUK2JDUmO9y7Hw==
Date: Thu, 21 Aug 2025 15:59:07 +0000
Message-ID: <87ms7sekdx.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:31 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBBPR03MB7146:EE_
x-ms-office365-filtering-correlation-id: a0fe37d1-2a56-42db-4ada-08dde0cba8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GyvR49fA/VK298L8DPGbBG0Jb6iPGkdPxV15qHNOOJB+HgXJqK8lyawKim?=
 =?iso-8859-1?Q?TLRGQZ1DBCQLJ167IFPjxlt4cP7WQCrsHX9t0wzLWypqZ07CEup/ic/urX?=
 =?iso-8859-1?Q?I3/jr/1PSNQySqErJKNdH4LumhEgo3OaNwhO1FUcJfMuSPJD4ESGvmxPNU?=
 =?iso-8859-1?Q?xHCGEAPbzfijA6IIkHU+YLREJEQDYamloTr8j7LbBJk3oo3bRsE0jr8oua?=
 =?iso-8859-1?Q?WWX4a9suTAAIDW4TgKQBxMk8QovpZjfXl+qmAUe6pqq/pjvUzJAWSl9UAd?=
 =?iso-8859-1?Q?fnpqOJ4bKLLJcKrcs1QbhnSbXo+k4oEVTdI8Lhtab2z1dBdmlxb1YBVOEo?=
 =?iso-8859-1?Q?iSTmv8quEmEVNdcq2rmzRASKupQKnuP9hv7j5u6HSjyH3fjXcaO/xxsJj+?=
 =?iso-8859-1?Q?Ooq4SU4rHn8S3BtKGzVGPNBJZP08CB/L6oY/+dmSvzm5liHTMadO9U2bBd?=
 =?iso-8859-1?Q?YFCRVU/1RJsd2ND9wgoa99K/8tYzXJOjagH2XxnmXs5sEE+hQAzljhg8wq?=
 =?iso-8859-1?Q?lLAK3z3wFtRCxza7LTa1duJr9b6CXBKaLNCwjNEaMDZIpuI2T2NSBPOuJT?=
 =?iso-8859-1?Q?Jxp8BVTmliyvCVQcJQHLEAFOkELGskH0+vDrqdHccJD0aXd5+Irt9ireuM?=
 =?iso-8859-1?Q?E0QeC6gbg+F1YuJYPImvwnJiZ1fT0QhvVa2f5dfgjsz7KY+KCo8uqZFAHO?=
 =?iso-8859-1?Q?rP7utjf3zufqEvx6YpxqDndfOymCv2JBfyfuhe/LoeUnyQxmqPY9+BtMpV?=
 =?iso-8859-1?Q?lb6NOUpItWjbmYd1JUNFP8UToeJDM3YYrETpDjth3yYX9G87T457FINcUf?=
 =?iso-8859-1?Q?LR+EY7Fk7ZgmoU9Klrt8SyaEHbc06euFe1ItHWJ398ccg9xJeWj2VeIM1F?=
 =?iso-8859-1?Q?l2jwsdvymAqoW10FpDzQuYrs49swAGdqaOh+JQGXxMng5gt8VSffJPaDzR?=
 =?iso-8859-1?Q?oycjcitfs4UO0TmiMXQcyFZbIYZX6lQlcu9EcNh01/BfsNElGS8Pvjm2UQ?=
 =?iso-8859-1?Q?5rvdD3jVtXCqZK8/e/p3Ml8lVoie7VFFhUrd0nGzPA8IfdxjfZFDbX1gEQ?=
 =?iso-8859-1?Q?f1eIgwkmkfVzysjcU0MtyHm+CTmboRIEFuN8CMTTP+FfYyhvzlIssTkCQG?=
 =?iso-8859-1?Q?q43DwEJlqHWgRSzLWvrbpb7BSOYkSwziPZpLeUqoqKdRn5wnP3VxZrTTZO?=
 =?iso-8859-1?Q?A4J9C+Z3i2XeSm2R1ad/E/Fm6q6FVg7Wdd4956/H8DRVGjnQ5NuJT7Q1rT?=
 =?iso-8859-1?Q?Qj2I4UobfLvjNHRbZGqnIJXW+t4AATToyFyze8bPB7vQ78Y+mFfvPzHc4k?=
 =?iso-8859-1?Q?7bdgAreYETGj7V15zd2AKNrTp0NyjtmWs6Wvemm1IrOhYHU7M8rpt/Ujln?=
 =?iso-8859-1?Q?UYY67d7aeOKlnhtE9IfDGh9uQjjl/bYJheAim6Xuc5jfd2fQBwR7T8NQsI?=
 =?iso-8859-1?Q?dqsLSNBMNunmk7xsM4IgM9MlEkWtcvJpVNKIzBfwWIvkdzybrG+25QxhRJ?=
 =?iso-8859-1?Q?UVt89+hRU5AuMzG5ngVoFGR0YcJ1NE2a/31UWyHtGEUw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lkmqQYxvsg9ZukCQveY9O2SpycA99OFR8QplaZUkJF+tWURcwiCzaYch3n?=
 =?iso-8859-1?Q?YglwpmQKqeQD2hxXD3NcFaan/lWRrRfJ14y0PlBwTdL2RRJ8wa4uBuQk+D?=
 =?iso-8859-1?Q?am9BqyUX4Uf2hmgo9MaSUIV2EdDL6V6eX1E1HOM2yW8gDvJwa1QoA0wX/4?=
 =?iso-8859-1?Q?Hw+LercQ1InrergKs4PSNSw9L1d9IBpIA6ho6VSyWnhg8ihRAlpSbQma2u?=
 =?iso-8859-1?Q?QRl3oYtz9ZD4IvH53Wh/oYCru6SHGBr9Ka0mpa+xFmnCPLu2pkA/zSVlnu?=
 =?iso-8859-1?Q?GMcKR+HscpKRrPj9M7NDQVP1fPUnB7yNOpFip4F8MZUOlKNsv799QNfnNt?=
 =?iso-8859-1?Q?WsKM/qgEz5rX98YJB1g8NPlTxUEqcCDACWJlmN6bBC9QjYyWxHL83OtVPc?=
 =?iso-8859-1?Q?l+9/Lrggk5xDIN3LAJ+156bfBF4IlzjI8ZI930Neaib9NhF4JCAdzvT90Q?=
 =?iso-8859-1?Q?YogTIoLonIsnnae8WKE7XzVsq1tvRyJ/7Zgf2jwy3uNLhV6mwTUmCI2ffH?=
 =?iso-8859-1?Q?vd2i86YzbY0955gVEbzyMp82Kt/9Ya6l74eGUidmeRdaqzwupAAWmpQsjQ?=
 =?iso-8859-1?Q?uSwfh97N1opbZCF8W1br51L8AWyxMYFdZHq39Jr9hzX4FfQumxXT7ljB7l?=
 =?iso-8859-1?Q?EO9E4bJFziH6EcZP0dddwipKyPvn3564Q7sIADn6dczHCJX+FlliQUQ+Tg?=
 =?iso-8859-1?Q?82HkizAOaCpdE3NOT5by8Rz2yrF1W4Oalr29eHkTcj9QwtOV5d40oDsGms?=
 =?iso-8859-1?Q?7pbToGuphohuwWnB0t4v226H+gWi4yoZQDOf5olsL9/NAM7ljufVhmiJQG?=
 =?iso-8859-1?Q?L515WMFEVvh1IaftpWysORo4+JcAXobksb2sivQEJFhkNr7+KSTi1VTHnP?=
 =?iso-8859-1?Q?x9yLRpYtB0c/t2AQIw0gV6RPB5L/o/N0aD/v+k2BF43fIM0TF//XFEDAV8?=
 =?iso-8859-1?Q?DKyB4u936gEFRM5Kpt61XsyBmc5Eq0mT9hbX7Qs4hCpxuNv7rNQDNqo7iS?=
 =?iso-8859-1?Q?Rwv0xW3BlPZWDEwWzEld7fGPEFBA70kxXoEqh01S6kOewTFseMeQ3BKikr?=
 =?iso-8859-1?Q?YSWhh3svwNViEsEgzM0LSPVXCkG9a8HUaWgFUNDc0n5Srifu1Pk4ITaIMO?=
 =?iso-8859-1?Q?Sau6LD7GHGuX45BtYlDtEJqQRA4tSznwSEDYfg5W7Ja2dWOu82RRNRjzTS?=
 =?iso-8859-1?Q?mZptkrSZMeZeKvOplS8MQlZv8q6cWOgZfZ8hlCnWK4tyvHFw8qqoYlazZk?=
 =?iso-8859-1?Q?X+Y3CP7VGH8diIHEXqas+yRXg9e1EpCdd5YxPP+GpMA06zhIm+d650mEzO?=
 =?iso-8859-1?Q?gAO2ByAmKxkENIM8SK3Il9A1nmVcqtj6mapHghfubFpaf/Cj7FVnyemBJv?=
 =?iso-8859-1?Q?13mQ4IdSTKCJmpIq5WGF3SUCgprMi6nhB1Lll8QQFo0bIv5FGNOxQBi1kO?=
 =?iso-8859-1?Q?kgIgO3z9M9PBbB8vHAoLPxb9M00G3WZAz0Af1h+VuWTqfN5b86sCiNzVE/?=
 =?iso-8859-1?Q?1NbT6Fckr3+VfFwMJA/p4dkEFz1474rHQHprjt5KM2LErz8E+FtCKXDG7k?=
 =?iso-8859-1?Q?lXWxPgOCUJjfZsLzYMSWf6ekmuC6MExQJ8saWU/3V4aftLiX/JkLe1Da1U?=
 =?iso-8859-1?Q?lnpGm3UEc0x2OGYTVbxCBeGaX1N83EsrtM7RQ8+KaL0VKEcsQXrCr/UQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fe37d1-2a56-42db-4ada-08dde0cba8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 15:59:07.1877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1H5QXuStVs5TZEZLCAN2Qj4Vq0QNRJezCIDKWCjwLrOQUvSvPKpsXM03XBzPMnyR2xuuspgXKrkrS/EhgRTdNTiwET8cexpDVNDB7ZhMDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7146

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Currently, Xen does not support eSPI interrupts, leading
> to a data abort when such interrupts are defined in the DTS.
>
> This patch introduces a separate array to initialize up to
> 1024 interrupt descriptors in the eSPI range and adds the
> necessary defines and helper function. These changes lay the
> groundwork for future implementation of full eSPI interrupt
> support. As this GICv3.1 feature is not required by all vendors,
> all changes are guarded by ifdefs, depending on the corresponding
> Kconfig option.

I don't think that it is a good idea to hide this feature under Kconfig
option, as this will increase number of different build variants.
I believe that runtime check for GICD_TYPER.ESPI should be sufficient,
but maintainers can correct me there.

>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
> - remove unnecessary comment for nr_irqs initialization
> ---
>  xen/arch/arm/Kconfig           |  9 +++++++++
>  xen/arch/arm/include/asm/irq.h | 25 +++++++++++++++++++++++++
>  xen/arch/arm/irq.c             | 26 ++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..08073ece1f 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,15 @@ config GICV3
>  	  Driver for the ARM Generic Interrupt Controller v3.
>  	  If unsure, use the default setting.
> =20
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	default y
> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +
>  config HAS_ITS
>          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPO=
RTED
>          depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/ir=
q.h
> index 5bc6475eb4..acebc3d42f 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,14 @@ struct arch_irq_desc {
>  #define SPI_MAX_INTID   1019
>  #define LPI_OFFSET      8192
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +
> +#define ESPI_INTID2IDX(intid) ((intid) - ESPI_BASE_INTID)
> +#define ESPI_IDX2INTID(idx)   ((idx) + ESPI_BASE_INTID)
> +#endif
> +
>  /* LPIs are always numbered starting at 8192, so 0 is a good invalid cas=
e. */
>  #define INVALID_LPI     0
> =20
> @@ -39,7 +47,15 @@ struct arch_irq_desc {
>  #define INVALID_IRQ     1023
> =20
>  extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * This will also cover the eSPI range, as some critical devices
> + * for booting Xen (e.g., serial) may use this type of interrupts.
> + */
> +#define nr_static_irqs (ESPI_MAX_INTID + 1)
> +#else
>  #define nr_static_irqs NR_IRQS
> +#endif

Don't introduce defines that look like variables. I am sure that MISRA
team will be unhappy about that. But what you can really do is to
introduce variable nr_static_irqs, which value will depend on
GICD_TYPER.ESPI and GICD_TYPER.ESPI_range

> =20
>  struct irq_desc;
>  struct irqaction;
> @@ -55,6 +71,15 @@ static inline bool is_lpi(unsigned int irq)
>      return irq >=3D LPI_OFFSET;
>  }
> =20
> +static inline bool is_espi(unsigned int irq)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
> +#else
> +    return false;
> +#endif
> +}
> +
>  #define domain_pirq_to_irq(d, pirq) (pirq)
> =20
>  bool is_assignable_irq(unsigned int irq);
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 50e57aaea7..9bc72fbbc9 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -19,7 +19,11 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
> +#else
>  const unsigned int nr_irqs =3D NR_IRQS;
> +#endif
> =20
>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>  static DEFINE_SPINLOCK(local_irqs_type_lock);
> @@ -46,6 +50,9 @@ void irq_end_none(struct irq_desc *irq)
>  }
> =20
>  static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
> +#ifdef CONFIG_GICV3_ESPI
> +static irq_desc_t espi_desc[NR_IRQS];

This is really confusing. Should it be something like espi_desc[NR_ESPI_IRQ=
S]?

> +#endif

>  static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
> =20
>  struct irq_desc *__irq_to_desc(unsigned int irq)
> @@ -53,6 +60,11 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( is_espi(irq) )
> +        return &espi_desc[ESPI_INTID2IDX(irq)];
> +#endif
> +
>      return &irq_desc[irq-NR_LOCAL_IRQS];
>  }
> =20
> @@ -79,6 +91,20 @@ static int __init init_irq_data(void)
>          desc->action  =3D NULL;
>      }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( irq =3D ESPI_BASE_INTID; irq <=3D ESPI_MAX_INTID; irq++ )
> +    {
> +        struct irq_desc *desc =3D irq_to_desc(irq);
> +        int rc =3D init_one_irq_desc(desc);
> +
> +        if ( rc )
> +            return rc;
> +
> +        desc->irq =3D irq;
> +        desc->action  =3D NULL;
> +    }
> +#endif
> +
>      return 0;
>  }

--=20
WBR, Volodymyr=

