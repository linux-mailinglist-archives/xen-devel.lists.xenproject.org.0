Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E320B3013E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 19:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089167.1446834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up9Fb-0001m4-4Z; Thu, 21 Aug 2025 17:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089167.1446834; Thu, 21 Aug 2025 17:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up9Fb-0001jK-1Q; Thu, 21 Aug 2025 17:38:59 +0000
Received: by outflank-mailman (input) for mailman id 1089167;
 Thu, 21 Aug 2025 17:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up9FZ-0001jE-EI
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 17:38:57 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b593e51d-7eb5-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 19:38:55 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBAPR03MB6520.eurprd03.prod.outlook.com
 (2603:10a6:10:19d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 17:38:52 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 17:38:52 +0000
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
X-Inumbo-ID: b593e51d-7eb5-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dbd31zp35xCg9Ug88iyFhI2oAW70ZllAIjWWRmQgwmx8tXMU0gZiwEn+faQu4og9KKqOQUN0XFFQneikK6voRcws0wyW4pLXGPMLRXvuNJl1+p8mgAURDurg42D707N9wfvLU3t3fTMQOnMt2iBeeacIg8k61tqseJ6OoFP5D3LaR7rskU7nxZ0Q7WbGjemg8sJzNTeUTP0WXXBtshPJXMUDTYEjovoINEG/fErhaChMiHqOUj0pA3jtUZXtVFCGTTpJc9UvEgP78x1BmG1rQKcSNrBx49V7Mw8au7lZO5BnqzreidNTDY/+rcAqRYpvvGDYEIX1/PP4sih0el0SYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r291w6cZSx3+Y2+OZFA+Fj/rb2a2dooD1U0z0Tajzqw=;
 b=egEevF+Z8qhOYhMr9iIdaUVOL46b9aFc6iEk+v7iWAEz8c75hxZJu0ocx2nJrOVtRH1lgtiI3+RegkZmAEL2uVvbouOZRp+y6BYLiMpuRMbvDWMktmUX2H0DvbFcEtaYcQ2b/L5lZscK/3aLpE5iGCogMZrmW/QxRBrf7i2ECWc8SsSdasP8VqSk5BYbW/e2qKol9FcfMFBQHMaQ56bTHE1u9xx9TfAViwYq0XT9KK5c0Z31muWtaKNsSfCfrDjaHjPJ70Ih8rMPDjXgJZmEKjMie0pNnmtASVpU+iD2O7+G+67JdgeqMDcTaGhI2cXGDk63GGaT3FEPVsBaRebQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r291w6cZSx3+Y2+OZFA+Fj/rb2a2dooD1U0z0Tajzqw=;
 b=TywGKvQ7/WAraZizmf+AIB8lmrq9uiGQJTLkTMZTONLnNhGW7HQ7bq87Od1e+6CbZaWpd7k0aNpAP06pEhfbLjD5Vj7SKiAFbRlpZcuPuiVymr6Gh1nqjX+NLOuvLq/njUqqjcigpeeoJI9vP4IDCYjNaR+ubGRBFjGKiZCPRC66upce9cOktxtxyP4fzTKtpasj16M3qa/6Gt5ndtAUffYRVcFsLtUUxPiCUcGYb//vKkkwkonKiCOSl/6UxW65dxQVO+3Z5XZzTM5wrgoOwZzKvBphfJP8MFacUU28Cpx671xdLQ/WoWFynYrDxcrYBZxMx1dtCO98UbGDtaJylQ==
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
Date: Thu, 21 Aug 2025 17:38:52 +0000
Message-ID: <874iu0d178.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
	<87ms7sekdx.fsf@epam.com>	<9922f7f1-7249-424e-9bab-3aee2ce3b813@xen.org>
	<87frdkd31m.fsf@epam.com>	<20328499-772c-4b32-815e-7527aa6b2cc7@xen.org>
In-Reply-To: <20328499-772c-4b32-815e-7527aa6b2cc7@xen.org> (Julien Grall's
	message of "Thu, 21 Aug 2025 18:13:41 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBAPR03MB6520:EE_
x-ms-office365-filtering-correlation-id: f4dca9ea-a797-453b-d8be-08dde0d99846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6qXvKKG9pyzvbnn0xa0J8BtV4xAdlOK6mLG6odwh/0ugk+OWSfrahIerWa?=
 =?iso-8859-1?Q?XHH6ZtKBEJ+1qZHaZ2sOGtqcOlp8Ysdl8zvXMTYH/4zJsZNSL8pxAfS2fS?=
 =?iso-8859-1?Q?iOhOnYOq8QScXmO01L8tHyYi01qpvxx3wGf9UMoAzMAKbdgmL5W08Msr//?=
 =?iso-8859-1?Q?8UkYezgYdIy1LRWFPCC9iax3Osjvl8KTA2pHFD1xjQ4tMdWyIVqXsH44sf?=
 =?iso-8859-1?Q?0RqhDk2vFxP+S22kGxqk98wgBn+puHAcL+67qCQ7We/9QK/m5RZypI7Z5J?=
 =?iso-8859-1?Q?Y/oqD5E5C7PO9YgjWYo6HmwMZXU89GkoVllP0AxikrujyQvU+4E12qFp1/?=
 =?iso-8859-1?Q?4XnM/cr2z0MdWNP1NcpAGtP0roDIo3q4ydVjujUTuW78bXiW4freB027gl?=
 =?iso-8859-1?Q?/pFtq4n/9fnvCcvJRuA8952lyep9rSdh8CMJhXwlE/3ZDyWZD7/F7dTdpr?=
 =?iso-8859-1?Q?mkTywJe15xs5LXlzcZb30kt7E4uglLR2fMog1NvH1PS/76nhA7xqG6HVI4?=
 =?iso-8859-1?Q?0Tq0j0a/hQM6tsqJSWvuzcHm5MRaHzNhjFTaUzmB6PeJWA+5sd+DP0bN0E?=
 =?iso-8859-1?Q?RToXW4noTIKxIhimxXIkObAntYXhQtkz1Vyxp75J+fWhmdZIxIvvPktpEs?=
 =?iso-8859-1?Q?zQC8jF3YDn1El00pndfUD3x6lAE/YRGgd43BUWHEQ9aSS3JeovGUxoFhuF?=
 =?iso-8859-1?Q?CmR+hMx8SOvtgxjqjp8W41r43kn+W3buSN05+9rTFNZUx5vBbheos3dnM3?=
 =?iso-8859-1?Q?yw0GdtAxdLooyATsrmP044lObtYAtDXLaQNpH8X1u26nhCVoxxE79EN4Lk?=
 =?iso-8859-1?Q?JMpMTrDu0awQh1JjhEx0rOINsGJ7k0aD6unBGSObzwoGU1gL2jGC1h34oI?=
 =?iso-8859-1?Q?KLG2w0TXYfm9N8BR4Hx+4d0s54NFUZJ+XdClsNJUWcr3UgYuFaK+OAXAQ7?=
 =?iso-8859-1?Q?Y8qNMgh6W79Yd9UNQ+VcxpruAB/Tc9J+BJ2Ed8INM3x2cnryJOJaREe9gL?=
 =?iso-8859-1?Q?M9eEFA3b8VVvP+DEcn4w+CK63JqIcYHxp7f0Z5dOGyyHs9EyX2WVlZMbjp?=
 =?iso-8859-1?Q?lHzEhMZ2xlScTWaVCbOMr9UDn+6fUC2/B22iC/0A77ep0bra2blro10fxZ?=
 =?iso-8859-1?Q?dA+ECMOoU66GqLbaOwOGwWS+cxVCRXlngH0+6z95oHNIe1yjtJDsR5L8Pd?=
 =?iso-8859-1?Q?vYeebKklzCYjxZGnl/brWqYyW6kqT61wUeY6MwWiYoLJTh4sSCvmFwBean?=
 =?iso-8859-1?Q?TU5CzTakPH7nCefkiAVEOi5M7aJ8/Jeg5SIh21IUFSmDj9FsNetzk9xPK5?=
 =?iso-8859-1?Q?7Xzw1JnZ7ggKfbB95jJtdZ0WILUx9BEmywDH5yMbi6JeZtEpe68LirpkgP?=
 =?iso-8859-1?Q?GACCsHMKy0k1pxfBupra+5ajJ2WcD+GqZn9xBfhPDfJwMYUJx+I43WQiHt?=
 =?iso-8859-1?Q?Fz5NNpQKcUqgE9P9St4nsQtdNMMXXNfHG3o5//xiAvouyXX1CCoQvp88DS?=
 =?iso-8859-1?Q?cW2DIQ2wqzndoqopZItsneA9G39kGdfJS1Bou4n05SnQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LuWfTXtYdQWSRSqb2amPncg0B2t+htekAYQOyPyhwbLcvPVjgYwWUHVVmk?=
 =?iso-8859-1?Q?9rGImgXTqDa343jxIZXf6/1wJGZS21ZZJxYXly9TSkflAmwDPxXn70im5I?=
 =?iso-8859-1?Q?rlnYgNy5pjr/OQoeC+RoQ1GKbaGsDjR1mgb/FJ0+FRRgg2ILFGY0841iaE?=
 =?iso-8859-1?Q?oaM7CfIRkzSYnMQPtHV8HXyG+TLsnPolPpxi4mZTZIpcZgJfkg9yulHm2u?=
 =?iso-8859-1?Q?NSMPq4hIl20cKKbjGRenF83iGkYK/+flzzRRS1vHBX7+rx+O4kirrPohYk?=
 =?iso-8859-1?Q?xu2LekGRk/RRWQkueoSs4wVMDA20cbflsqu+1jphNGl2YXYi4rnaTxb8MR?=
 =?iso-8859-1?Q?l9fNHxXk3Ux6M1DFykMGRSk6yJy2MCErB5AySg13zwKUWb8idsd4/5GZUl?=
 =?iso-8859-1?Q?K352nByRJdeYYm3dhUU16qQhhAciBmy8hJR9ettm9dS1q6HLK2VLavRpq+?=
 =?iso-8859-1?Q?0F81FvSt5iDz2VXiM/EFOyymV0KdKdvufAWLhVNLQVocV0IHEezFLkFaS2?=
 =?iso-8859-1?Q?FfdZIF8gJVC2k9Xt2HmyVKcfJAuyGLzA6omYLme5tFejcNfvWqcYLqOHJa?=
 =?iso-8859-1?Q?2Q4JeW2ggfzHYyhg7EJXPS7L8UPcOKupcAcm+pPyoDxp94i/4qOedxU0w+?=
 =?iso-8859-1?Q?Ys/Qm1G0lxwlPOh5WJHmOZvcitd/ENwkfTUw1KSPTm03DQXfo9lpDl/aMe?=
 =?iso-8859-1?Q?Cjgu4GCC/hXaxTi6mU4wdC+JpsLsIiY+3f7lKkPIXHbl3RTmSUnWLZMIN9?=
 =?iso-8859-1?Q?nMu5S7oVbilmnKzrM/NgsUL5ZuYE6p48TKKHA6hCril07DF7SrI240ajed?=
 =?iso-8859-1?Q?FFCHJTwRW15ZPUkEinkJBXHESIFDNHfSQC9eKO5/0xH8njgeZ4jLZKsbDL?=
 =?iso-8859-1?Q?yEFeSQk96QajXGaLOSgkgM6URpIIeTm0pY2S9vlzBwzAmd06fMRrCSEnGZ?=
 =?iso-8859-1?Q?KGKrv/Acng4Aw910akdqswU6YJPOqYmCmktCWCNw76ujOTBn3HrUhSrkos?=
 =?iso-8859-1?Q?OC0XNTlBcqETVXbUIAXGbNXSejDI9EkxQySUemvGqRQh3KWa8kI8xqD2WR?=
 =?iso-8859-1?Q?wyr7lbi6P9gRJHs+QEiEyjbiAGzCWtWsFW89a+amXCm6kqJ/ljkPozRtPV?=
 =?iso-8859-1?Q?7n0bJMh7+rJezR7bZiW+o2mVmzyfTsJM9Pu54W6LP/UAqiap0U/agqRuv7?=
 =?iso-8859-1?Q?TEaCxGNRJpCVgxVDtpZp7125hnp3UyU9OuGf8xqlyGRHOpfD7OFgo71TzQ?=
 =?iso-8859-1?Q?te62H8XkSS3SWu2rLBS50HhP+wCSPl/iOVlvRYYbrG5mzImKBqZgW1Konq?=
 =?iso-8859-1?Q?wrmmB/79k1aby6GIQwfwDOXhjwEJyIgduSxEPX+LuIVz30KWXOV+dGSvRL?=
 =?iso-8859-1?Q?s+HzPjLXwJHgfEVutN3d+DF2smFi/Uj4liFW4L8dtZRi/I1tbJ9lrrK2dl?=
 =?iso-8859-1?Q?SarHY7cJlEIqDJcA1bI/Q6pNbS0wFMmjfCQhHhpBrT5p5ULFxmg07Fkf8x?=
 =?iso-8859-1?Q?IuST48cWS8liyKeI0qV/GqusYMwoYJPW5xVq22Xij3+E30Vdwiaip/lHcO?=
 =?iso-8859-1?Q?CsEfaNI0mcSBe5ZmWSgVFGtdQBElNHfvlvPr2LXhnBf0icyr8lhjsGKxUd?=
 =?iso-8859-1?Q?tZ+DXgyMtAt3zKc/Ju4QpOYHGza50ml3cwKhPg3s7DV/HTTZNgkrcTUw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dca9ea-a797-453b-d8be-08dde0d99846
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 17:38:52.3634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5K5C6V+otkzGOI2TuCK7EtKzQYzlFBpL1DGmEEmqKlPVRO6F7YDXXTia/Akzdw91SSsRQIeEO+wLjdnGX4jVctlfOodO4bkuw6PnGAI8TRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6520


Julien Grall <julien@xen.org> writes:

> On 21/08/2025 17:59, Volodymyr Babchuk wrote:
>> Julien Grall <julien@xen.org> writes:
>>=20
>>> Hi,
>>>
>>> On 21/08/2025 16:59, Volodymyr Babchuk wrote:
>>>> Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:
>>>>
>>>>> Currently, Xen does not support eSPI interrupts, leading
>>>>> to a data abort when such interrupts are defined in the DTS.
>>>>>
>>>>> This patch introduces a separate array to initialize up to
>>>>> 1024 interrupt descriptors in the eSPI range and adds the
>>>>> necessary defines and helper function. These changes lay the
>>>>> groundwork for future implementation of full eSPI interrupt
>>>>> support. As this GICv3.1 feature is not required by all vendors,
>>>>> all changes are guarded by ifdefs, depending on the corresponding
>>>>> Kconfig option.
>>>> I don't think that it is a good idea to hide this feature under
>>>> Kconfig
>>>> option, as this will increase number of different build variants.
>>>> I believe that runtime check for GICD_TYPER.ESPI should be
>>>    sufficient,> but maintainers can correct me there.
>>>
>>> I haven't seen many board with ESPI available. So I think it would be
>>> better if this is under a Kconfig because not everyone may want to
>>> have the code.
>> Probably, we can expect more in the future...
>
> Well yes. But I was under the impression this the preferred
> approach. See the discussion about disabling 32-bit support on 64-bit:
>
> 20250723075835.3993182-1-grygorii_strashko@epam.com

Ah yes, safety certification. Welp, can't argue with that.

>
>>  Anyways, after reviewing
>> all patches in the series, I can see that code will be littered with
>> #ifdef CONFIG_GICV3_ESPI, which, probably, not a good thing.
>
> The solution is to provide wrappers to reduce the number of #ifdef. I
> haven't checked all the places.

Yes, I was also thinking about that, but I got an impression, that in
many cases it will be hard to provide such wrappers. Anyways, something
is needs to be done here.

[...]


>
>> As a bonus point, we can't leave this pointer
>> present even if CONFIG_GICV3_ESPI=3Dn, which will simplify some code in
>> latter patches.
>
> Did you intend to say "We can leave" rather than "we can't leave"?

Correct

--=20
WBR, Volodymyr=

