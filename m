Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6BB3009F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089124.1446804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8d5-0002ed-JA; Thu, 21 Aug 2025 16:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089124.1446804; Thu, 21 Aug 2025 16:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8d5-0002cA-GK; Thu, 21 Aug 2025 16:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1089124;
 Thu, 21 Aug 2025 16:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up8d3-0002c4-RS
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:59:09 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24e56b5e-7eb0-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 18:59:04 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU0PR03MB9176.eurprd03.prod.outlook.com
 (2603:10a6:10:474::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 16:59:02 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 16:59:02 +0000
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
X-Inumbo-ID: 24e56b5e-7eb0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POPaQ9b/498+iwpdKPBBTCd9HN1f2MOAsu8CufCkMzqe5h9G9KdMuDkFSyVS7UJNPPDaJalW+hCWe8aI/Nz29zwz6wJbK0a8ZD7tYMJSMUP3u7YK7c6jl211H1H30I35cS7FHHOTx4qaJT6D7ZTFV+pX4ByrA9BVnAT1/vDDBpwcmkvhqvvH8zr3Rkf5pNjQnkUhSjTNSrdtXHWELy+0r047WloX8i2x/MDIGPkNo2tDTQn3eRfFz/2Wb+f0Drvo3dPXJd7cURaNRwzSrBpOtjksn3g2DOHlZOK98DnyAPapD3pcDzNaPNsp5Yjq2A4sudtU9aiTZW2X52/NLCkP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BBJG93VLQXbjKcMFc6Nv4CZA9G5STOfdO/GzUXahCY=;
 b=lhhWyJIl2Y9FvdPFJ01eOBOf/Nanorp3k6z5RdSQd7JRk0LvPnVHDMzXH6PIOJp6v/DRvw/eWSFCGOul7T+p273kK504/msrWhU4bzu8fTihjyyCP34zjKJa70fL3VUkvN7KC6uN4zNtDpJa4ewjzSP7j9g4o1KHoVgL1Pq5CEJD0U8uhIwEaFDaeD//X+EFvLN7W5qE4LnA/hcoGfSwlg5HuCrhF9/nloJJVPhflxpYv5mpcmaCSmj0KSRy6x1ZwwS96IkpiNL4cTAIJ6tsuPoj1sQMEGcjP2GNewxMOpFFKPuMxrRKUL35cfv8eunajbqrPmVxVriDlkqnH0JXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BBJG93VLQXbjKcMFc6Nv4CZA9G5STOfdO/GzUXahCY=;
 b=QU7CwFLkwsU8r3M2jSrPmO4af7A9gAiUEB2EkX6KUw8GF1yyT6obRK3rNONyoXyJbq96ePDWGaqekfY8Ns/yv0sUqcGEfSOpHwBoqnYdQm9p8xyw1w4xN8GM6DHTqvPu2hV4baTr7pGZbDmuntVjFIFTqeWos8BtyPKcDbMZ/LB3Av3FYjCJAHYZ9fqQ+zf2ywRMWEnC+or5B9rMLk9UelFy61VthxuMTuRO197NTJgvVxCN9RQ9yo+DnxByTdHD4TKMUTBsUXzdcPNEqbKBY5whMMqN+ZdNfsSCW5IQ+VES9jvLvhy3u0pU+q9dnC9UMq4/0VIqI9FYKs9R/GoS0A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcB5d7kgaRrTB4eUK2JDUmO9y7Hw==
Date: Thu, 21 Aug 2025 16:59:01 +0000
Message-ID: <87frdkd31m.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
	<87ms7sekdx.fsf@epam.com>	<9922f7f1-7249-424e-9bab-3aee2ce3b813@xen.org>
In-Reply-To: <9922f7f1-7249-424e-9bab-3aee2ce3b813@xen.org> (Julien Grall's
	message of "Thu, 21 Aug 2025 17:46:31 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU0PR03MB9176:EE_
x-ms-office365-filtering-correlation-id: dd4d73fa-80e5-4a44-3024-08dde0d4077b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tz7gpA7S8f079iwO4zYsNjeiAhcEmJOPGzyJo6TRLhVmcyJOJ+/EiZ3u4T?=
 =?iso-8859-1?Q?DfPAC/kbPowhn0g0smZArbv5wRXNYkiPnLY9dTK+TNvHRvGMGrfS+yUF3o?=
 =?iso-8859-1?Q?Cljd2/ktp5ZFTBBMDQOripI1OiUKKxA27FJOYAXzBL2LOFF4L9Lz/D5AFZ?=
 =?iso-8859-1?Q?AKnN4YAfO2I2EUiFmheqsUIeJXEIKx9TyrVwzaQxtOJzVj9rmuYIRjqH3M?=
 =?iso-8859-1?Q?hYT/VpUaOwRkAR5+yrJLw9+gS9KZECqUyM+XchAQ0a9Q43KzMRHlhdn13S?=
 =?iso-8859-1?Q?DzNKpsUXp/jFhsZLWuAB89Ursq7+Tb2AYbS1jzE0YaM8Sk2vT4vTw7+EYi?=
 =?iso-8859-1?Q?jEAbm3kTbu5vbvqEYYByn6OcpyNGA8fUYKk307fzjIcOr8KxShEaOxWHvU?=
 =?iso-8859-1?Q?s0QvLgastWf4oOZgXdODLiw0pLd7CP2gvzJIc41cgiMHgfMvNT+8AIIWIA?=
 =?iso-8859-1?Q?0uTPRDfosA2n1JcH8v0QgrNe6BAfqOtXZckrfDDfQX4KoH8dWmiy7OJHhW?=
 =?iso-8859-1?Q?mHorWhbiSrVBk6+Q5wr45mOyhZ0FPyPvbToRk0MtEVJqN/zpYqmN6AZloy?=
 =?iso-8859-1?Q?KdBAFyr7JBS5ZQlm8XYA/8Auuu+OYfjWXE5uruC4CFgoOALlwky5l09qNC?=
 =?iso-8859-1?Q?p3hjLQnnLWOFaaTMusaKUq9iILo48uLlDI/cdTEk7EuUOmf7r/DOrfNGYe?=
 =?iso-8859-1?Q?YbW4xgZhgjcF/rCOJ86u5xRAojWPHZk1iRTpri5TegXqFBs6E8b1f19H7I?=
 =?iso-8859-1?Q?AiQH3i9KNtRItceDJEvU9CyktCTOPX1DowE32l/tCoeJHj81QOciahoonI?=
 =?iso-8859-1?Q?djbS2ASoyr+tY8H5CXI/Nr0vbtFNMPFMXbUrYw5NG2g0rSl1tTTeIU8X9e?=
 =?iso-8859-1?Q?NBuwl099HzWu704hyuD9vnHbo9s1HlL+MBe8+oTawyJTrV6HIsIrLGUX/w?=
 =?iso-8859-1?Q?I9w470UH1s8fzC20QZstVFUW1193m1BDJFKl9oZo4TqMmqTD8YHx2ZZBXN?=
 =?iso-8859-1?Q?IGTMOpdY4nsMt42gzRsf+d/70bBeeruo2/COEHna6Hppwieod5Nfe4k9KP?=
 =?iso-8859-1?Q?32hjwT/NVEXHgwBF4R6ws3D6eLrIj8/tPe4AWvKNyhe5z75va1jl2ICBN9?=
 =?iso-8859-1?Q?kLyYKrxr52evOT8dXY2sP8uhGH+aXgyWMZmciar3b5ItI8pcnq1w+84ysT?=
 =?iso-8859-1?Q?SMcieqg++pv8lwMTQ04BOzHsMpfxb9dNPcTAcPNb+ZEe/30prUuGns0HHf?=
 =?iso-8859-1?Q?gaZC0Ycwls4vzx7khfh+2gtdt6AJJxV3EOg79zZsdN4cIGWXB7MUCNC4r0?=
 =?iso-8859-1?Q?QmXkPTB1F7R/Ct6k8QpDINLryePKqliTS7oIjCFrHK7ifFq/4VWA7EFvq0?=
 =?iso-8859-1?Q?nWx5YKmk8mZq8QZItaC1VusoYvUi6kKsGri/mwlBZHJDiIJ6OSieH3mtyX?=
 =?iso-8859-1?Q?7awdSWaNy7XpxjdsrSEJgz3OUUbpYmA3VPHAi9oben1Nuvox/Ne8YBJpT7?=
 =?iso-8859-1?Q?EBJ7TzkZ2kr030xx3BaE3yMJlPKWomPRGmePQe/9bs+g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MFRbxUOuttEa6UEsjVnH8w6ig1pHbQr+UDyx/pg4osxGJZofYY38is7amx?=
 =?iso-8859-1?Q?RHnvWc9gkamDiXIAqCtxgE3VAcdtGAe4oRFGvGO8U4fKo8NF/T6EJzywVT?=
 =?iso-8859-1?Q?zuAL/zDB58QTyk9ivR8NM/JNEVJ8bfjYIeoVVTmPsoBBObwakdxhWiNuMd?=
 =?iso-8859-1?Q?PZI2IOQ69vgMnpJm36GJaqDDUhUzsM8EbP6gil8va02rBazfF0d74RHKDk?=
 =?iso-8859-1?Q?EsBHXJ0ieKzq/9GYDyidrNZ57PEEvOtsFjc1fSbji0a7jV6fFN/s96slDb?=
 =?iso-8859-1?Q?mQoS3ew7mepcLiw3TerWFprKJxnTPlhkgBZShfLkugrfSbvadpyKm3T8i/?=
 =?iso-8859-1?Q?yTCl9cP9yL4N0Ui+dI09bLfnTNeD8a2YoFPseMuyDbMXVrkVasJTR1FG9A?=
 =?iso-8859-1?Q?tpFmPSrL4aBZqkESV+y6BHPR3NK9dKGO69YMtAZNa5DyaF2iEpMX6KD0qG?=
 =?iso-8859-1?Q?yKyOWIYz9eMm5AqnrmP0ida46t8G1UL0G1hyuwXtymevSw0LQatQnnTzbv?=
 =?iso-8859-1?Q?SmGU6NKKkG++Qa1fat5x0rFxAlcbGEIkJkytzmvH8UJ68KFL21zn1ZPIpN?=
 =?iso-8859-1?Q?pBAJbMzbGga7EL+fvLN/JEfoZRpX5mlb9ZXWtqxYzJWmLA3kGU/fPwvCZL?=
 =?iso-8859-1?Q?gOpWQZynp1UQc0FGdvPUOkB3/X6yl/pFlJPXXwtjF1olf3LHXUDDfrvJHK?=
 =?iso-8859-1?Q?oTT4gB90YUaMfEnODgE3aVUQo44kYCO2HHy9GknxCEqRNxStoc3FL7zfUR?=
 =?iso-8859-1?Q?6M8/vrtKM8DsIc1XdV2Ko1CynqskeXV1nAQlx4xF7Vnm0cZbwX5cIJszBp?=
 =?iso-8859-1?Q?l+hpNXIM8krVB1wTYcBbOnFNseqN1+fhTv0OHkfocb7xiGx2qA7GTH3DRU?=
 =?iso-8859-1?Q?nJJO7jWe82Ihv7bZBdPF4ID3DtwCuG7MnVAsmNaJGZAcEh4z5mV7tyGNhx?=
 =?iso-8859-1?Q?DMZpeMd8ITxo4F0egYdD1eFVhgB3PtNJTzVcH/UNKvam5p/ZJWrxnH+NtS?=
 =?iso-8859-1?Q?oM0FfFgY/lxzi408sIsiGB0hlBS3bXOoBws39/WzoC/r+oAAbhXB4kW+Oa?=
 =?iso-8859-1?Q?wyVwJ1YrJhnLtN+gSFWoOzW4JhHFXMSU0PS+f3S/I/VHwXZ50Cf5trcdce?=
 =?iso-8859-1?Q?COKuUF1zMnie4CnE8ERq1EX4BWVec+dK6ZXsizvOLY3yziOW4t8aJGRBPM?=
 =?iso-8859-1?Q?AMU875VbxvSYOLi8M/2DO6KDHt4z6/CUnY5fw7JqSAX4/tg1bHhwqWS8FC?=
 =?iso-8859-1?Q?3evZdBlnNDKQrww2UveNHT9uqWsNmHo6Na1tTHEWrAnChwNa0KkBF08ZDS?=
 =?iso-8859-1?Q?q2NUiKDHVA8L0vAfdYINVWlbS8DN8QIprowGyGjLYEER7vg7X3iBBvfad9?=
 =?iso-8859-1?Q?aAdbIzv9CEp4n9Ruf5n2w0xwPinY0ENeRdYqPbxdJEBjDHIVd4rSn+a8Dw?=
 =?iso-8859-1?Q?+f3B2XedC8w2KirtE+32OxvSm/w8uxaBnFyh5CYVldXOa+nPth6nUxwV54?=
 =?iso-8859-1?Q?Ga5mfejMievoNw3FWDcfIegLGsgRdtwGOeKaqpVdfBxauwt2gEpPM9909U?=
 =?iso-8859-1?Q?ekUelIMprkiOKfXClGLsmSNZ5+p7WY33ZQW1LMsudE446PMBMTfHOxTSe2?=
 =?iso-8859-1?Q?bfrpWZQnjsLn4S2VOp3pOdl7tXW8YWvTOeH+e6LwPxzsTKIDX8uXqCPw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4d73fa-80e5-4a44-3024-08dde0d4077b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 16:59:01.9422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CExO/mu/2M0asC4t+QjeagOH1y+cemLpdXo7H/egLqh8W0Pz7xdFC1G/nqDpn015exkH8di5cv6IyuL3riPRC/d/FpIhKH6q7V/yGAu8eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9176


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi,
>
> On 21/08/2025 16:59, Volodymyr Babchuk wrote:
>> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>>=20
>>> Currently, Xen does not support eSPI interrupts, leading
>>> to a data abort when such interrupts are defined in the DTS.
>>>
>>> This patch introduces a separate array to initialize up to
>>> 1024 interrupt descriptors in the eSPI range and adds the
>>> necessary defines and helper function. These changes lay the
>>> groundwork for future implementation of full eSPI interrupt
>>> support. As this GICv3.1 feature is not required by all vendors,
>>> all changes are guarded by ifdefs, depending on the corresponding
>>> Kconfig option.
>> I don't think that it is a good idea to hide this feature under
>> Kconfig
>> option, as this will increase number of different build variants.
>> I believe that runtime check for GICD_TYPER.ESPI should be
>   sufficient,> but maintainers can correct me there.
>
> I haven't seen many board with ESPI available. So I think it would be
> better if this is under a Kconfig because not everyone may want to
> have the code.

Probably, we can expect more in the future... Anyways, after reviewing
all patches in the series, I can see that code will be littered with
#ifdef CONFIG_GICV3_ESPI, which, probably, not a good thing.

>
> [...]
>
>>>   struct irq_desc;
>>>   struct irqaction;
>>> @@ -55,6 +71,15 @@ static inline bool is_lpi(unsigned int irq)
>>>       return irq >=3D LPI_OFFSET;
>>>   }
>>>   +static inline bool is_espi(unsigned int irq)
>>> +{
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +    return (irq >=3D ESPI_BASE_INTID && irq <=3D ESPI_MAX_INTID);
>>> +#else
>>> +    return false;
>>> +#endif
>>> +}
>>> +
>>>   #define domain_pirq_to_irq(d, pirq) (pirq)
>>>     bool is_assignable_irq(unsigned int irq);
>>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>>> index 50e57aaea7..9bc72fbbc9 100644
>>> --- a/xen/arch/arm/irq.c
>>> +++ b/xen/arch/arm/irq.c
>>> @@ -19,7 +19,11 @@
>>>   #include <asm/gic.h>
>>>   #include <asm/vgic.h>
>>>   +#ifdef CONFIG_GICV3_ESPI
>>> +const unsigned int nr_irqs =3D ESPI_MAX_INTID + 1;
>>> +#else
>>>   const unsigned int nr_irqs =3D NR_IRQS;
>>> +#endif
>>>     static unsigned int local_irqs_type[NR_LOCAL_IRQS];
>>>   static DEFINE_SPINLOCK(local_irqs_type_lock);
>>> @@ -46,6 +50,9 @@ void irq_end_none(struct irq_desc *irq)
>>>   }
>>>     static irq_desc_t irq_desc[NR_IRQS - NR_LOCAL_IRQS];
>>> +#ifdef CONFIG_GICV3_ESPI
>>> +static irq_desc_t espi_desc[NR_IRQS];
>
> By how much will this increase the Xen binary?

I am wondering this also. The struct is cache aligned, so it will take
at least 128 bytes. The whole array will take at least 128kb. Not
great, not terrible. As this should go to .bss, it should not increase
the binary itself.

Maybe it is better to allocate this dynamically? I do understand that we
want to get rid of as many dynamic allocs as possible, but maybe in this
case it will be okay. As a bonus point, we can't leave this pointer
present even if CONFIG_GICV3_ESPI=3Dn, which will simplify some code in
latter patches.

[...]

--=20
WBR, Volodymyr=

