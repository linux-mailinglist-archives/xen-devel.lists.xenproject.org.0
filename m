Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D28C8CAC9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 03:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173397.1498444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vORnJ-0006cU-B1; Thu, 27 Nov 2025 02:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173397.1498444; Thu, 27 Nov 2025 02:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vORnJ-0006bB-7c; Thu, 27 Nov 2025 02:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1173397;
 Thu, 27 Nov 2025 02:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjNd=6D=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1vORnH-0006am-VB
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 02:31:40 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32a3103a-cb39-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 03:31:37 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7781.eurprd03.prod.outlook.com
 (2603:10a6:20b:405::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 02:31:32 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 02:31:32 +0000
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
X-Inumbo-ID: 32a3103a-cb39-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxSMR8TwsUGEiDfnYHx1tTo05GMz8ty5+lMxJNNk31fkvRsLchEXz/2FzPDmm8vyFATKEoO9uIwJwKLVR98D86jQp6Xjcz27WPUEXTPMfAU4WrJfDGZ9u2gl5RWiXCzKxIRsGpDct+Ff403klCxiFiLRnJTbkrA/UscScKUisQiuEHYDndtZt8ebvDAgaIhbI1lUp3pyECgwTrzkW+77dQKQ3s7+Xr/gWYgmZOuGB61pgTXVxwPloZ4wqmgDdz85RFzlDJAzWEG2N0diX+zATsC5NrcW3+39Y7fuhSjfF+gPJQuPcO6mQMe4zx+0U6zXazbZ4pD+Yon5vEwBZk1OOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KudwijRkpMHAGrHsBiFPP/Rq/llgDEszgrpzXVriWJg=;
 b=hVcztdyaKYByCI6yzKa09mzLHdbKMNY+eAXEhJd/ss4KI5f/h7nSRiw3XZc6eXPzSRcwXIIeFEHnn65g6wcxjzpo9AYPz4vIo5Z94zagEH7BPV5tqBMh3EX2Id0FB2d0YziSSNUOXVwLEaTCE7eILRoAg6kiSMDKkB3sm6DIv8Apmjf29MpNVi9C6IEfy/QuZVlUGfSIfmtaJMf5OgaJBouCCX8MKKVceJ24B6gcKp2Ex7O1LS1SAtK1wrtlTyH5kKSUjn0hNPotzXTD0trbNZEmILqn2txOVmPDHWGI+14qa4vZsZfrzMMEGjq52y3UxM5774jbOGgpRPKXnEtSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KudwijRkpMHAGrHsBiFPP/Rq/llgDEszgrpzXVriWJg=;
 b=gHrOkqJ6Gx87G0XBkqa+VlVBTEsNx2Cbxmce/B+oQpNoBbXk59/amlk5ps+WzXlComXa+z/32DTxcCk6q+fw7Mb7G66HOWEsiRVROAhWPd3hnySmOXkljo53YSzFFp+7IGZHWfzvT2VrI6bp9FODKRvLZnKhR8cVoG2gGJA1FQQr4VuNlIK+nWajpd6GvAUG3nG0jIgvOHPRGsIFi93EJaKV5a4PYj/PqBxdYL543GLSfKM/4f8GSEU2KS0XxmW8g/cCfU/qygzy0rWHHIsqliC6y9MBjLkxiHWaG8hD60iU3lIhEz/hLPI7hGeGmSOaCaDOQyfLCzY/EFWDi9rVkQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap
	<gwd@xenproject.org>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Topic: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Index: AQHcB7wdmg15F24Gc0ClRsxpCVedRA==
Date: Thu, 27 Nov 2025 02:31:32 +0000
Message-ID: <87a508kxz0.fsf@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
	<CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
	<12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
	<b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
	<a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com>	<87v7m93bo0.fsf@epam.com>
	<6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com>	<875xe6ytyk.fsf@epam.com>
	<65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
	<5df30dbf-17a2-446f-83f9-0e4468622917@epam.com>
In-Reply-To: <5df30dbf-17a2-446f-83f9-0e4468622917@epam.com> (Milan Djokic's
	message of "Mon, 3 Nov 2025 14:16:40 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7781:EE_
x-ms-office365-filtering-correlation-id: 8cbd0fe8-9bee-4594-f044-08de2d5d1403
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?A3SBDBXs+4uMQ1xcgYFh9zLkZSnukOsTvM5YwxaTg4WPGoqmx6N+gOzknE?=
 =?iso-8859-1?Q?YJjN92TKthDMg7/d1H+E6EzwqpEMF6A7ptJSHjAr7sPPiMrdo1sT7TkHim?=
 =?iso-8859-1?Q?h4uO7NAQqXOvn4TXQDlGfIMMudbVi1ezBdYMzjubsO3mJf7J/7D7oqbrvb?=
 =?iso-8859-1?Q?C7HQF3yja9qG2kW2i+q1oC5NuijPb0CHxx7ORBa2aqzfseAgu1GnAYXyNV?=
 =?iso-8859-1?Q?T2nIU26Wt36+lNp4YGluRdiKbhyfTLpo/N/ut+jETbmUw/0GreMTU6P68E?=
 =?iso-8859-1?Q?Dc5WCUExJwtSMSi2H6gFuVuGaCRZmEfbsf3csn8LAVvimonQxiNfOX0Z2R?=
 =?iso-8859-1?Q?7TormTlPn5jz8Wozze4q7dT5EVCpgjwi65fhINIlnwWbyAKaDPcOXU1rTQ?=
 =?iso-8859-1?Q?CO/v4pH9jFuyjqjd1ZUfk5ZM1TCQjzyjLzaYt5KB3HIxMjsjDGgVsfD2Md?=
 =?iso-8859-1?Q?9MhCSu8XUnEeFNE0/8XAs4yfy3OoGAnF4x94ikTRwjFbH6kxE2z3q7bEYG?=
 =?iso-8859-1?Q?+P/vA7J0SqO332HIH1MyWpxllf3Sekf5k1gvVlpqjQUInNMhyDNDYl52Fi?=
 =?iso-8859-1?Q?Bb96YlDhkwmI/YW3v5xOHE4gCGbxAm4qlYs1HXmoukNY6mH3DmVQptfEWK?=
 =?iso-8859-1?Q?xJrJCb2bNRHXtkfJaTjrlu6LEABZG2qh+8b0fH2dUKtlgPNdZpjJvQHyWs?=
 =?iso-8859-1?Q?omOgxzwbUqT6L+H1Pr2r1wfzNRvZI/jg5kt34k853ryT/lwR2L5PgtRgue?=
 =?iso-8859-1?Q?pGNHr5G88/IGRxbNDWmmxRsp8o0bwU5WFjuXuMqB1kZ3CzFXvQaQe60i+O?=
 =?iso-8859-1?Q?XIHlNei05P3z2F7FXH01hEdTGmZsE9fPHX7lCMxL6Q0KkbgvKXAFuVJucZ?=
 =?iso-8859-1?Q?PoDnDx/Ip0J4yP3jgXE30NXiC+cxcTU+3BItUSa7oA8hEj1tXwzgHk1IBk?=
 =?iso-8859-1?Q?4yanz57Weq9tR6XBF/SoxIiD8gM7MJyZDpI4xQYcEes3lPHQgdsK0OSq0P?=
 =?iso-8859-1?Q?aASd/J+o7AALoHlmhWo8pStL/AxcpCq3gsVWn7o2Z7NR+o6q2TqBqHPmRV?=
 =?iso-8859-1?Q?iTN9leosEvCp/CK/0smwhxAh//RPfXw+aFF+qBLby8EJFNEnEJWMajgPyI?=
 =?iso-8859-1?Q?X8xOvjlHeqcFalg/EEZIPR+jasZQnRmYer9q+GFdJ8kW1N372J8Pia6YJJ?=
 =?iso-8859-1?Q?KGck6fsnTl26ApryYrMr0mC5QbwY9viR6ag06XA6Sj2NSi9/8iCXGSrgwR?=
 =?iso-8859-1?Q?Ht5ZO5flX3j4QquCwhrbyAb26vpXhK1sQEhwFETjmMRS+g8bR4Kn5wLFGb?=
 =?iso-8859-1?Q?4RH2N4XbddmoBiyVo1ZOWWEoVqO+kJKq32Jtlp5ktdTTXoSULGVS5/TbcT?=
 =?iso-8859-1?Q?kjjMZMPLoK1Yy2cMGmNXQ1CLSyV3qF2i7c/NuYguF5K8AvM+/zrPnahmm/?=
 =?iso-8859-1?Q?cSLKIlJk/8MzJBOsACcBBzbO1AsghAOVFTaWM+S5CZMrTEPL92LMk8p7Lm?=
 =?iso-8859-1?Q?yHcT7IIRToSWt3mSCK5aGYxLh6g54E6J4dIT7QH6AyGqjlDUEcLLMq7VNK?=
 =?iso-8859-1?Q?jBFS1pX9AI3W+WrUCi/RqR8aFuAd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?poKlCtgAWa3jL4VmX3qgn+aGxXEbDQcJJxiEWGeBGBJmERHVLA9B3ADmwx?=
 =?iso-8859-1?Q?mNp3Znmsq9lRly5dbkALdz5ctYPHaDmX/Aq0AeF8wmat9ik9q3rU1QNtb3?=
 =?iso-8859-1?Q?Igj7l3v/vF4BKeL2c+Tvl8wvfppjxOj53MzfHxv1ueel4DsqLyLfCTEqjX?=
 =?iso-8859-1?Q?UxIjRjHS6QHz764jbX73BxPsGxfoy9BndYHFn0K1AD8B+hixyaRyWbn8XY?=
 =?iso-8859-1?Q?tuVHLMs24YBwhWPl0T8ukGVYLGTH9PyriBTViBYTj7Z2Wptwe1HWLHcvdD?=
 =?iso-8859-1?Q?bxMwadvVF+inJj4BFxIy708AlN8/VQDP5oiOph9NAcab3a8Sm0WatskSlK?=
 =?iso-8859-1?Q?DGLX5+epRFcwbguK7UuPghThyL0oM06dmQrudoUHdGSLh5aEequf8sRz+N?=
 =?iso-8859-1?Q?FxqgkuWi1KrdMfAe273aTNGRFY/vd1OhMEBEGXzr7cQGChZyfD9D81jppi?=
 =?iso-8859-1?Q?g67idZ2f1h5IZ+WHboAfwmY1ynTlBqY16hLgmFfa6Wm4Uk00v/g3hQdPDD?=
 =?iso-8859-1?Q?5ykQfyKgaQD78t1E17gKBpi9n7qDjTTK9cz8SyM84MT+a3h9U70dOKuAX0?=
 =?iso-8859-1?Q?7JyYJF3JOR4MYn+TAAfUr+6sGL14VRDIeuihPAGS/AN+sxcjEew4Lo+cAU?=
 =?iso-8859-1?Q?pX2fr+OSkFQ1naxXBzoz71zcovJXkNR/kISqKXp9bptfeSz/AQLomrE5Kq?=
 =?iso-8859-1?Q?hBuW7wkhKwkjks/wpdq/XIv4oj49iGxO5iLFK6t+9zK8Uj5gw+uFuZbfZi?=
 =?iso-8859-1?Q?HYwsUL699W6mRtf4SgFA7jB7cMbck3HQWNZ5BWqhlkwyksLpQSYZkhAISe?=
 =?iso-8859-1?Q?NOythHcroB7dkvHzFXGsd8VlWx5qT/BmUZm7eIahZC5jnsip8MLwSlhzLf?=
 =?iso-8859-1?Q?n8od4f54/1FJMPpc9IIWS0C6aN7kUFfnJPzmPiY+2dX4L6hqcU1O45RJUT?=
 =?iso-8859-1?Q?cDrs0aNmAIDDntS8mjPhkzjGt3NRmCCSYO95mmGE9UttGy9IL3yzJimXiM?=
 =?iso-8859-1?Q?AyOOsj+ZSNtItOmGkhIJj3vjjn2XN3atsIrx0I536FvQRRDy+KkZQpy5RV?=
 =?iso-8859-1?Q?sfCeZvGAqFSopzP9gefQVH57mU2r0TQPlO4+FUz7Pe/KB7oN9QCRIFsakp?=
 =?iso-8859-1?Q?Y/yTjzEDPGe4mXeRiTori7kyskL75Qdr+7kA38UM+6BG8D99Uf61WqwLgl?=
 =?iso-8859-1?Q?A+A0XIRdP3wCkYYe7iBnnkT8dYAFu5ANE57EsAF8C0tS0aEF9/zMh+reo1?=
 =?iso-8859-1?Q?rXV1OySsgriscBNTQvKACVvu2+0aPCtlQyRA0Z0RRxVLToqjgEN7KSt/1r?=
 =?iso-8859-1?Q?asT2oMXXHYe6YX9fNhLL8JeJSCdKa5tFzU5OR2AjpJMfhYPEng2AagnMNV?=
 =?iso-8859-1?Q?qngfrcJGCNvF15MHucrM5YpWKTJdnu/0uw/pymM4FeGKjVwQKZYPzYKxrE?=
 =?iso-8859-1?Q?Tjws7pSmj0NU1lbeDOi+yJsF4i0vdecQrOo/t6KyMcTiRfmtK0WD1tsxF6?=
 =?iso-8859-1?Q?iUbh2oYW0z9w7u6AA1UFNUqfaSwTh/ziaxGZ4NPNoXqXHMoiS7sDp6vJ9+?=
 =?iso-8859-1?Q?N0QZo3UD6ShY+VaC3zd3wLPXOtzqpKipO5epdei74USa2aW9RdbM9/9uKy?=
 =?iso-8859-1?Q?rEAqOVgO94lqUnwWqAQJUQ6nyvkQ5FXPIV8XB3XEOBYajJRjjfhJ+WoQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbd0fe8-9bee-4594-f044-08de2d5d1403
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 02:31:32.3564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZaMPpkf7vW+b/8Bbtlq5N9YktGULMCe7FYlqXGdvq7A1CJvWEQVitq1cXvp34Wo7Y6S5OqewiUkyks0YYySXfu23rmVseksGHclz8V4GZLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781

Hi Milan,

Milan Djokic <milan_djokic@epam.com> writes:

> On 9/1/25 13:06, Milan Djokic wrote:

[...]
>
> Hello Volodymyr, Julien
>
> Sorry for the delayed follow-up on this topic.
> We have changed vIOMMU design from 1-N to N-N mapping between vIOMMU
> and pIOMMU. Considering single vIOMMU model limitation pointed out by
> Volodymyr (SID overlaps), vIOMMU-per-pIOMMU model turned out to be the
> only proper solution.
> Following is the updated design document.
> I have added additional details to the design and performance impact
> sections, and also indicated future improvements. Security
> considerations section is unchanged apart from some minor details
> according to review comments.
> Let me know what do you think about updated design. Once approved, I
> will send the updated vIOMMU patch series.

This looks fine for me. I can't see any immediate flaws here. So let's
get to patches :)


[...]

--=20
WBR, Volodymyr=

