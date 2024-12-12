Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608999EDC61
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 01:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855395.1268320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLWpp-0005zO-2O; Thu, 12 Dec 2024 00:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855395.1268320; Thu, 12 Dec 2024 00:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLWpo-0005xq-W3; Thu, 12 Dec 2024 00:13:40 +0000
Received: by outflank-mailman (input) for mailman id 855395;
 Thu, 12 Dec 2024 00:13:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiJC=TF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tLWpo-0005xa-34
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 00:13:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2606::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef4ecfde-b81d-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 01:13:38 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB9PR03MB7625.eurprd03.prod.outlook.com
 (2603:10a6:10:2bc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 00:13:34 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 00:13:33 +0000
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
X-Inumbo-ID: ef4ecfde-b81d-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os26MnnPP9Ybn7PkGV4f/jUb0oLy1U+s6rutc5rtBQHdrjZnYW59s41IzILAthYGumAynAdbbyoAe+fM0ZpIp1TdlvYg5C2AbpylTLP8m5jCDNvcoEN1dyhX54ge10eHuLgwTTv1KYIq9JQl6XWZZLRoTE4Aef56jLE2G2D5gNzdeR5VIbRCw7S6r4S7XNWwxaW1leACqyh24xoxIx8JxMItVu2kfOSy2q0eRxERnx6eBMpSycYngRykex2LhGbi2Cquap++HR+JaoA/2lb34NQMH3uXjdqL29w5UeZUczOo2FduGUl/wsdR3z5M6meK/Q6YPp7xQLRyIa8ccQRL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axs4QJ77roqbYqfnnAkUbciJgFdMd1ErBhfaw24jMAg=;
 b=EC3iKvKoIVwbkAUGyqaena/jIcKwyrJKUsjk2tsr9YeanTTm08lWnky7+ZKSAXy4py74Y3dcGYD0RI/jls6HDM+0u4u5NKYTahs0CtmCB++IVLhhQWI3CSiyV0/OEVKKbjqtwsOsCOc17n9rzgKD4oyABlbN2pRC0sXCTBIJ0uoIkWTRZkX/qpV5Ni7AQ8rKQNTrX/AFqIQbZjm5K6w0MbLGixzWJAGWxjUAgxjcZ3Limwv1j8MapstsaR69j4ZsiJ4rSFvPlHh2ZVl6DqpyuQcnUeSWCpqGyGazYwjtP7uVMU0HY2EC6yswGlYqgfhjD4JUTEJ+crWbvxPf8OpPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axs4QJ77roqbYqfnnAkUbciJgFdMd1ErBhfaw24jMAg=;
 b=l9nUpI78hqm1pnn0iD2ieFoCdlf/77OO7fTm3EnKQmzxzJsX8SPX0aYcKJBHNc11v9iLOR/GMHHzvAVtHHyXJhpAWWLuOKpt71g9nZMk+85i46m7wCCeZIYKja8GOvsL5x7lwbUfemxQ7C/5JTjUr9eXZzg7KmYoie1690OOuxPMgs3ev6swSSvS2m+jctiZkwhpbaO3iUeBISQAi6pJEtIdvJycW0MDnELVPi1z3yH98iZyaTy8W43/W8EXgFA7+uCK4sfsa8IRQWW5LoTd0DJGg6/A/4OxOEmS1lsKknEPrRahUosGa5O+VXrQsu1GGa2KVbHCDiqRhkMP+Uspmg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/3] Add stack protector
Thread-Topic: [PATCH v3 0/3] Add stack protector
Thread-Index: AQHbS3EDPfnUwIrgWUmXfq3bo38udA==
Date: Thu, 12 Dec 2024 00:13:33 +0000
Message-ID: <87pllx3gib.fsf@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
	<f1e86e0e-985a-41ae-a94c-979288275257@suse.com>
In-Reply-To: <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> (Jan Beulich's
	message of "Wed, 11 Dec 2024 08:46:37 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB9PR03MB7625:EE_
x-ms-office365-filtering-correlation-id: 9c18fc56-c30e-4c0a-4c14-08dd1a41d0e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IwQfvcVJV51fXXF9LLMNTCAXJ4rXUrfPONPFluUhYmolWPjDZZ/m93RIzX?=
 =?iso-8859-1?Q?s1ylnoRKE9kVLOzCQzm7RLc+NJnwfCnDSLqQ6K7NM5DbLjvJVTOh6SPPLV?=
 =?iso-8859-1?Q?Rsw55LF4LdC4JFh/oyM2pf6ZIP2G7xYAbSGciEmJ+Q2z8/Ebk2yDqm2ejW?=
 =?iso-8859-1?Q?7QrnAD9y4P4bzZvpRO3ONVoJVRgpwKc8qmbF5qUtAUjqfc4ETfNs3feAua?=
 =?iso-8859-1?Q?vt13mHL8S2ipJPUEZqlL6qdFUV+Y18Z9lL3VtLuBuVZ4xBeT7cLR9+yOpz?=
 =?iso-8859-1?Q?kFzp2XyVPNm3Keez6ZVDuEHFtzbNRSi9kWgKgO9SmvSDpITuqbaD8nScR8?=
 =?iso-8859-1?Q?3190MY2aMCoJf/1qW4dV25P/Y9Lwd5yitLOi6rYUoHC5gI/A0JfbkVycj2?=
 =?iso-8859-1?Q?BoWbojL6zKWAKJUoWtuNu/2Kmq9dCJcjR+oHUAA34sv/PQ9xQzleIt4aqS?=
 =?iso-8859-1?Q?CwsU1VJlaiJMxc06utuEyTqqX5HnGGKqYl3TbxiTE4qeC0OH5Bzi1d2bo/?=
 =?iso-8859-1?Q?hgH5H5ceWl0AcPYEfK+nOr3v0P41mT4vMG5nnsQMyvAGkqkBzCrdPAjVoe?=
 =?iso-8859-1?Q?X+vCsGW0Q7CU4S8aUMSsnPCW/PUBUFJtAK8ukSZahxgFXflpirJ2uf/Ege?=
 =?iso-8859-1?Q?ox5v9FwTFQiIP23oNYpqQXa9VR7PE1d6ld2Z5QFDOCXTXnQxyGl5Cwk5DR?=
 =?iso-8859-1?Q?qbJ0VvMH1m9xuYsPYsJLOxXr5fsjxmuUJ4BeeA83BBNRvrV4WlAiJjEKxc?=
 =?iso-8859-1?Q?I4ISAXT2Pgp1ZbIn4HiO6jWIOUAzYeLyj2psF+nJrr9zYGG8Bsn/ydKYq6?=
 =?iso-8859-1?Q?EEWVi0xRb6dSh7yl6BT6ctJL/qFGe/iH6HZf4huXU3VlrnFj1SGgeI2rsD?=
 =?iso-8859-1?Q?y5Rslw0ZkcvasvJZAEwB4K1wGSr1sgN4p3AqCuyWxTExx6RTLtXsd3PLNd?=
 =?iso-8859-1?Q?5P9DRW86LzndgvUosQUac3PJs2c19I/fSisJORZNhy/3bjfhTg2qtu+6Tu?=
 =?iso-8859-1?Q?Cb1yODYe/3QmWSmwMNZ1iDJn46AhQ07F6lOoyhQqC+2/X0AGEAnbmSMbus?=
 =?iso-8859-1?Q?CknK0SvWsqhi8JK3iA8Eh7REBjCJB1qZcQscoA1TJgNCaAFviabtmz1Nzq?=
 =?iso-8859-1?Q?4r/BX0D3h4a5nwUOiBqTY+fAUAgJEF3NpFX6FIHP19yRxzUOrQEeXMUFN0?=
 =?iso-8859-1?Q?rN2QLQWuV4Ltm+HkaLfYhe0yAOX5kxHk9FKh9kw1VO1HYgtC0IyRKzXyWW?=
 =?iso-8859-1?Q?MYqndykd9sw+I0VB+0S+LSKloxhE79XdFWV8/6K0A9VMAtub9jbHmEdzpj?=
 =?iso-8859-1?Q?ORrTmgIPdJicIQOLAVfNajnoU6SsD8MgMXjNCiAiswQDUIuyMe9/hZuwDw?=
 =?iso-8859-1?Q?iv30Daf545OZ8vMzSzHhtj5Crol+FCIIq5sY9u1e/iu8UTqJ6EM6+S8aZW?=
 =?iso-8859-1?Q?epMaEXi2g/QN3w7Hd9j6iyUczUi6bwE/ulCkiA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6e9iny/2nh6ZcI6xvrowIU5zPiiHBz3nsvfUqriRGFu7MjSI7DGqwRZO4l?=
 =?iso-8859-1?Q?JEBMYyMfx9Lk5NWZ8ULRCoVuhQ5Cb0wyOP2xc926RfF+3xzIcB7l3r0gxa?=
 =?iso-8859-1?Q?M4M8OKdv/5v9Qg0zyOWxyDcMiEjFeZOCxFRoB9In6gMhGljelQOtQGZhC4?=
 =?iso-8859-1?Q?Wz/L7Nkwz+IWma+4AH3vImMJDE97U8qRAhPlF32ECsoDsE0AEgkEgQ6gOA?=
 =?iso-8859-1?Q?sIEh7p6xw++PzktKjUTce8Q5oLNcx8+aucI9sij0oJxZT8Grk1/bpLmoaC?=
 =?iso-8859-1?Q?huBDo3eXmxYxI+RoUFMZiZerbt5BGADsFdmyscOAotVNrSG6DkYI/qFhan?=
 =?iso-8859-1?Q?B53IGdkOC9niS2kfrbszytGA6BMQsNAPLaMUL4a+OyvVWdT1sWKHdeA4eo?=
 =?iso-8859-1?Q?89a8PdoQV1WOqeUQOAIKr0JpxyegmFXsolp0W35OufWVNKYWbhqkYr3dya?=
 =?iso-8859-1?Q?avk/R8nlPRgOY7/Pn1SBuuYqnhnofPQiJiulu2L7Y2P7+nKdfT1jNXuljO?=
 =?iso-8859-1?Q?ANCCmDamtvLjyGQRdhV/zWd0AW5mE2kdZZDz/pGI5XvchYkFxT/1dT02TB?=
 =?iso-8859-1?Q?Bm3Y8sKt+YZD1eW5dYVVlzKpJjVi1eobZf+vFqwJYRZvrzrr5YBPz2nKG8?=
 =?iso-8859-1?Q?GWX27NvUKzSMJdmzx/9XY+JJkT8aacpAQVGBxbDQpf9Mh7YCJGOjs6Zq7f?=
 =?iso-8859-1?Q?KvhM2T9ZD758fyClJcRhi6CjqOXgG9uf/4Y1DGkC9iIH7HARA+r7Thm1Pu?=
 =?iso-8859-1?Q?vLQuMIDvR0yXt7k6KGv8lb3xAkcMfYOUoUAcpThVIR8d/G9d5MvX/966D3?=
 =?iso-8859-1?Q?XoM7+c4CvCpm1+yoMyqNPvo0swtoQieEOjzly2nzaq1YUSJje9d47RGw6c?=
 =?iso-8859-1?Q?hwDXfobKNeYOMH2z4pmijVRcUwhADLHOUgPzLei7C1mIPAlfA9U7V2Vos8?=
 =?iso-8859-1?Q?oEejVSEtTa70W59BhUOwDEw2JJ0LCNQb7OE9CLWrFa22bxfN2PURYPjLUk?=
 =?iso-8859-1?Q?H7BH7O6qwWDBtZ+3FZmCODvnt8chizbMN0pJIjUtDetOd0kCUvglmW7BoL?=
 =?iso-8859-1?Q?itGaqrzNLcaVS+LmddPkiPHEHMlzm/KaBYVbg0/UmCNhOtDalzdeSyF0qB?=
 =?iso-8859-1?Q?NHbn837XwhCfc+R34WGvIIYgPOPVCzHIMzB9VrkRLzw6eT/vg0E64LsAX4?=
 =?iso-8859-1?Q?3WJoDseTcOvPt5QqxkVRBrBwefmIpG4tBMoT9I2ssTtGfg9qcVSTymTQD5?=
 =?iso-8859-1?Q?xbNVVXzYR5oegF5uO57yqsgKzDKnn3UGkP5bdRgsk00thfUJH/rNzvbJ4x?=
 =?iso-8859-1?Q?SGPb8Ji+bdwEHYM7l8NkGDVToazriMoWzU2Jv8WrYbet1tzw9IHaywLSuu?=
 =?iso-8859-1?Q?dPdXU21rpkEwzjEMhKvNMTG+YEWF3ssMjWo72YbaSgyiefwLsHxLXJtrkF?=
 =?iso-8859-1?Q?fnC4M28AvLahOeHdc4ialF51Err7HVH51uuSwenV2WURpz3bUkO0cHSqB2?=
 =?iso-8859-1?Q?mTzixpHwih2c5VlHYJu5JmbY4hs3Mh4mGq9mQAdXwMezBETIvrWC6XLjTf?=
 =?iso-8859-1?Q?Ti3Yoer+tIluEq68GwiLoXo/vj8ZH5WdAYP7DLJEWrIxZhA3stDEs9pV1G?=
 =?iso-8859-1?Q?Ds1PmlZF2+f3H7CAI5ap8RLCrmBjNTNkqDoKfU1oy5Xbva+Am1x2Lv7A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c18fc56-c30e-4c0a-4c14-08dd1a41d0e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 00:13:33.6370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbBoZfuw0e5U1ePHHdHtUEtHMhCouksTCRKe8bwcniGKVigH/83Np3wl5qmScsfOgEh+6LNEStBHrZaQsUZTbTDWWIi49zkMZYyhBA058ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7625


Hello Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>> Both GCC and Clang support -fstack-protector feature, which add stack
>> canaries to functions where stack corruption is possible. This series
>> makes possible to use this feature in Xen. I tested this on ARM64 and
>> it is working as intended. Tested both with GCC and Clang.
>>=20
>> It is hard to enable this feature on x86, as GCC stores stack canary
>> in %fs:40 by default, but Xen can't use %fs for various reasons. It is
>> possibly to change stack canary location new newer GCC versions, but
>> this will change minimal GCC requirement, which is also hard due to
>> various reasons. So, this series focus mostly on ARM and RISCV.
>
> Why exactly would it not be possible to offer the feature when new enough
> gcc is in use?

It is possible to use this feature with a modern enough GCC, yes. Are
you suggesting to make HAS_STACK_PROTECTOR dependent on GCC_VERSION for
x86 platform?

--=20
WBR, Volodymyr=

