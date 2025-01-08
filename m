Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE5A05C3A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 13:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867257.1278712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVdi-0006Re-2P; Wed, 08 Jan 2025 12:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867257.1278712; Wed, 08 Jan 2025 12:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVVdh-0006OV-VH; Wed, 08 Jan 2025 12:58:25 +0000
Received: by outflank-mailman (input) for mailman id 867257;
 Wed, 08 Jan 2025 12:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HByp=UA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVVdf-0006OL-Gs
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 12:58:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2613::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d239e59-cdc0-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 13:58:21 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB9613.eurprd08.prod.outlook.com (2603:10a6:102:2e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 12:58:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 12:58:16 +0000
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
X-Inumbo-ID: 3d239e59-cdc0-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhmUsOGrDisEeXyeSb375yDvnra2Ra9vezkXEk4kz85IPxUsU2sJ73yNxofflbWTIVf5QAqxRbFWz/uB30LgYwjn/WIBk3mp7Cfyxi1UazZKAK/5z+2XWkTWPG6vN7aUTiJhfAl7Q+gBEjvrzqxS3IIWFkHhEi4tWDgJpJA0R8E/UxmPtst5OK8lD1SRS0XhgHrDq3lfTxZ9K96eY39s05NpseRVCH1h//IkPsRIqulnB2ZIvAWhuAmHcV/8Fe/2+DdXL5JphPiOccMoYN6V2XA2AzZQ/YPxGkDVN3pp0cTDragzu8Ymtdrwv5JIguNo7yahbHESvLavdHbxj2e/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Qj3dY96vrj9T/c4ZHoupqeofSh5WUv/P7+cweYoVtk=;
 b=JDL0QDC3iLkpgQBBwjKDWQL5tk5rdV5/tK8HpFPhsWujBULf9pCIVNX2uKOYBL0VJtpXHpD5DROY+VgZq7bkRbJ/LiPVzlw1a8L+ZdurCCu6D2N7sW4rAe43qwDh/VywblyqSC0k/KHXGrPouY7LWfQ5bEpiKeRu35cVIOVKJ5Pu0TCUgpo/ZMIMRgbjcwQm9XU8LVfJMZGbi5gAqz3LVAf/1E/7Ajcj/H0KNO5r/7g3xFzWDnc8AqR/gG/kj1xas1hLn1/k3mD5ce1mh7icX1myGnEh3COYTM7a+3hXQICoO/qIVHzQmYxKb62NM8mKVcRezkrCVLOUnAXJJKX24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qj3dY96vrj9T/c4ZHoupqeofSh5WUv/P7+cweYoVtk=;
 b=HlnpZJ/XKRPeQI4kzJ88P7oHHx/EAkClzmed8C+6jF/U6HmV+A1+2rJKi9FJ7Lx1GIp6CL7E8zVoy57yIksTPHrExNfKlT+k92yElQ4958KDbNd7X9sXevhp06xveX+yQ3WCa7eoWDlDuYIrv5ePJs07amee/xnazFeRT6COjNg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Artem Mygaiev <artem_mygaiev@epam.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v3] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v3] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbUgS4JJcMvJVd5kOG9/I5q9pAibMMoCqAgABUqACAAAEOgA==
Date: Wed, 8 Jan 2025 12:58:16 +0000
Message-ID: <FE2F5B8D-B4D6-4DD1-932F-2409C1D835BB@arm.com>
References: <20241219105640.3294591-1-ayan.kumar.halder@amd.com>
 <7402DB1D-61F6-467C-89BD-6985A6817362@arm.com>
 <f377f3dd-c367-4ab9-bdd6-705aa5970cbb@amd.com>
In-Reply-To: <f377f3dd-c367-4ab9-bdd6-705aa5970cbb@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|PAWPR08MB9613:EE_
x-ms-office365-filtering-correlation-id: fccc32a2-ad8d-4995-a497-08dd2fe41e52
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NmMrZNL/+iJ7BoZiNInRZU679Qwcv1pvUXzhhl/n6pVMpveeh3TrmfozsGJE?=
 =?us-ascii?Q?PaVFanqHMBa0sMj90Wd6HqK1zJnQmdU2Ts81gBiZGVjGsK0vG5kT2DFgGG8t?=
 =?us-ascii?Q?dD+hWENNQU0aLn7CQ0KCdiOIHa4Do2QbmKiOrKogoA7uxrWXyvS09JZSBrQz?=
 =?us-ascii?Q?qK1bpTTGS82uW5Mq2MAloM+KIzT8yuP3d3cLx4X9eyzeCslyE0DBrUpvfYTS?=
 =?us-ascii?Q?k39VcY3A14ZkASlDxCIgDfca3u0olelrwVH98TzEw/uy8nOjDS7G66lZyj2m?=
 =?us-ascii?Q?fFUDBFIDaLSRHQfgVHHJ4LX6F658olyQsvseomfRdPGul0ves+w2aT+fxFT0?=
 =?us-ascii?Q?iKunn2zCrQRv0X9DEH+m9t5oLXJU+VMADTnO/Qhos/oNH9L5HiKnnE31aKzY?=
 =?us-ascii?Q?dx3eI8Jl54s3NELzIM+yxsBVEtb6sEWWsrAYvsWpZEiz720/XkOohebKmqhn?=
 =?us-ascii?Q?grvGjUW8tNKrKbg8dyLMCqS1Q/3CYyNKDhcFWLY6e3LcE5+uJv/QfN1gVP+4?=
 =?us-ascii?Q?i6VsEcq9fEzuGd4/3K5zzKWaRxsl9NSDwy31VzHEVOdqli0iV3+/AxpxBlwu?=
 =?us-ascii?Q?wH9DQEMruONJREgyDGrwiGsdcDOKSBuq+m8CjsPaYkmWlDI8W89m4TFmpK16?=
 =?us-ascii?Q?TRmG+HxWnpg8VHjlfKhDWhfHPfxQljuP2yZCoGIsr6EAIuC4thW4tCvtdbDe?=
 =?us-ascii?Q?bCDu5E3ytcqR1dIs3sMUukhIt/iWKmlICTyywrQRcRX7sXTPkIIRFzPcSMaG?=
 =?us-ascii?Q?4zNEwvYvyvqITxGGWfN5NzgmzoE230kJl12ZU0aMF2FZUc2ipHl1pHWlxZcn?=
 =?us-ascii?Q?VCa3q38VONCuABAXLsO7RfOP46N93rb26QR/FSrw4IvNNMcWJw7uwo1qG6r2?=
 =?us-ascii?Q?yAf3d5e+Ip/Uyd17+NpKSmsazSfsUHVNs1IoI65r3JY5pRTC4PwkoFgwLEJS?=
 =?us-ascii?Q?/qH3CVPuaiAixB/Q2/nH81sahCkKWbAg9X6H2itUfsZDgEQySEkJVA96ECFx?=
 =?us-ascii?Q?UpLxCsXHtbfXaOnCuLAQfoNkT0f4Scs+iwF2UPbMY52h5LaPtBjDSJ/IRPIM?=
 =?us-ascii?Q?4U+MZmtcr+yTd6dxk7bnD+7qUkzngm328gi/+o+yTlanWrci40TnCF60BmbD?=
 =?us-ascii?Q?lb7thSgsYETWpez9dxbIFRcwXmlS/8R1FVnqjHC7Mgpo7KNPGSAxIteLxcCh?=
 =?us-ascii?Q?TupROq5DOWGidZVy/2ZGXf74CNSHDaXzI9Jm0mwZLnk57q+p36jQYSb7vUil?=
 =?us-ascii?Q?bStcSZO5SV1JEaMFJNMfm/bj1FqNcy9F+hk7deVQfkhkjfxZ/FaJliopNsHg?=
 =?us-ascii?Q?3MZx8v98JL6HK6N7HTxxQWsFuRPVY1nFHzNi0iQUfZVAC6aWpBGDJHHtJPPe?=
 =?us-ascii?Q?rL3cJTCKFJ7l0KcBhGTP94qpr4mmhutKdejf81zaS8poaU/ux8rVdIfMxsBA?=
 =?us-ascii?Q?kFfsegkTx+YDfASJoJYswJa9BsgMn3j2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ms5kRY1WgiSa09XhMNqcvbCa7XHAy9rXGp7CGzbLSxyBPX/xCS9F/sGQZcR7?=
 =?us-ascii?Q?+kTBTXE0fuClBAjMPu39X3u4Df7BsKKJeQ2cMkOC2NUNy6cZGMP4U1H1Z4+w?=
 =?us-ascii?Q?DLEglCHJd4QEadfOiUhhzs1YiJobY9X6R+oO5iLxWvIrbpm98+CpT7sdFkXz?=
 =?us-ascii?Q?cxHMWi50nuEvtcEGE1z+Mlqn7KFnS2/BNv1VoI6X/bvejyVBXxlfAsjHuEIM?=
 =?us-ascii?Q?wDFUjig4vH1Zwc3vaxCV2s2CSBetbb4jzuuKV6dzmFrdt8AFmWLhMd854iWt?=
 =?us-ascii?Q?1iupnACG9lcK+kV4Tjpg7IoU8oxCU+CPlKOKqynbAiwO/P3bWtSYDZ/aRlUH?=
 =?us-ascii?Q?C8dt4XK9/bUJfSQih/J0V/Pla1kq1uM1b5Ap9Z3gyhMnjYv+yTRpbALmfmIU?=
 =?us-ascii?Q?XhY/AZA2ZN27LWJAs51gLtoa3b4GSjhd/wJyseLt2ulA3UlwJe2lueNcDfB1?=
 =?us-ascii?Q?4bSYMU7pUvDjOOSPw1g0D+dND2o4zyfAnTmH25px5jEzETfUH+b/xGCq1G+G?=
 =?us-ascii?Q?uhBCbnfMOX9XCtFm2KW5InW2nmSk/l9afSA6u6DjolPKK5eFl73GnoAHA7Er?=
 =?us-ascii?Q?n4UPlAU75G/i53bRpJQfwMOR8dR9r1I5ZxZrlYTM/GXjVVkV1iZLa5FvT33s?=
 =?us-ascii?Q?zlj4HB+kxDRe71RPJnEHJs0HuUWDqZ/0Z/6+RUzJ7wNvP1+UC6T1prNqEUzI?=
 =?us-ascii?Q?LxduBwji4vSmHEm9OMgOv5SEwPWQ4IognYGiTDDpEMIOhKBGkAuCnkjRjJ+B?=
 =?us-ascii?Q?WcIsCn98YJbi6c/4yx/dUBMc4wCs4cG+c8c61U7Y+WT4hyLHIp+flGFFPiZI?=
 =?us-ascii?Q?KBRVjKqBfdyUsqNWbDXP6fgAP3vdoT22j6PiN7fcrkiT4CW4esFSHPnaqubI?=
 =?us-ascii?Q?Ex/Ygfb1aLfkrHA4xKjBzAfgGytNU2HGjJNb7UO/W+Cv/lwZ1NWMNUfWk7oy?=
 =?us-ascii?Q?IGjDJi51KS4fzhVpoSHHC2w8i9IrS7g2wsy7ugr79TT9k3MhWjMMvpMy6Evy?=
 =?us-ascii?Q?ssjvLS06G+q5cTz5yhiwRLHQl15Lc9VKgkerEefD1QElvcP6kGxAeseTponM?=
 =?us-ascii?Q?cXRljrM238CUUqmdN4jyu0Y5+3fSGmaD8G081O2W/Qcb4lkT6ynogvdZnysV?=
 =?us-ascii?Q?BwggmhMx64NLKS6thAs8Yk8hhmA6SKXrriUQWFmZRGxRlMn8TVS7mv0cLddy?=
 =?us-ascii?Q?rFIjgH+/mToFjN2Dm5rhm2w2mPhpgIIhBxvQ+X6gNvBOu5W9U9Keyj9+tIrf?=
 =?us-ascii?Q?EL2xfNayEcIjzSMlvAS3YG3DSgo8UvUOT8SUgIlPiAMpPQr8tivaS2BmGyS3?=
 =?us-ascii?Q?yxPJoiugg/82pQFdAWyGAUke6kbkY3fZF+r07HsNodb4xSviJhaal6ybFdZ6?=
 =?us-ascii?Q?suzzexQO2mhIlrjmTDoHwMF9df5RwnQBi4cp+caAG6ftM61Ruv6xT05WJo7Q?=
 =?us-ascii?Q?uxM7rCxSL9eFAQ4HPcEJ7DZmL+mjQNIvtxgwgRd2DkmdLnMNzQpQniDgKwVR?=
 =?us-ascii?Q?LApTtA9NKT6nTs6BVjPYS1ffOGPKu04sGIYcCNWeHbwFRy6mGHn76UCMobnS?=
 =?us-ascii?Q?i0iIJtANV6Sx2UqTOp2wHCXXQ/a3Yc4sTcseOFV4/V85uz4NFP/SFRu7R77+?=
 =?us-ascii?Q?QA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C4BEDC85128354A8BF2489EDB2EBA72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccc32a2-ad8d-4995-a497-08dd2fe41e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 12:58:16.3935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mqmQGDXGfxvREa3zGdfYnbaT3VHdL7u1HK54u922MeostsOfDesYK/0YCeWIEhcs3lDMsZA/y+bMbmePgHlIFdm87+E2FZ306gf4/GDS8GE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9613

Hi Ayan,

> On 8 Jan 2025, at 13:54, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 08/01/2025 07:51, Bertrand Marquis wrote:
>> Hi Ayan,
>=20
> Hi Bertrand,
>=20
> I just need clarifications on the two points and then I can send v4.
>=20
> < snip>
>=20
>>> +Domain Creation And Runtime
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> +
>>> +Kernel command line arguments
>>> +-----------------------------
>>> +
>>> +`XenProd~kernel_cmd_line_args~1`
>>> +
>>> +Description:
>>> +Xen shall pass kernel command line arguments to a domain via a device =
tree.
>> Would it make sense to say where the "command line" to pass is specified=
 ?
>=20
> Yes, although I don't feel very strongly about it. Let me know if this so=
unds ok :-
>=20
> Xen shall pass kernel command line arguments to a domain via a device tre=
e
> using the property "/chosen/xen,xen-bootargs".

In fact those can come from several places (xen command line in the case of
dom0, device tree or guest config) so maybe not the simplest to specify it.

Please ignore this comment.

>=20
> < snip>
>=20
>>> +
>>> +vCPUs
>>> +-----
>>> +
>>> +`XenProd~vcpus~1`
>>> +
>>> +Description:
>>> +A domain shall have a configurable number of virtual CPUs (1 to XX).
>> XX should be replaced with "the maximum number specified at compilation
>>  in the configuration through CONFIG_MAX_CPUS" or something like that.
>=20
> Actually we are talking about virtual CPUS whereas CONFIG_MAX_CPUS refer =
to physical cpus.
>=20
> So, it should be GUEST_MAX_VCPUS (which is hardcoded to 128 in xen/includ=
e/public/arch-arm.h).
>=20
> Thus, s/XX/128

Right so you should say 128 here.

Cheers
Bertrand

>=20
> I agree with your other comments.
>=20
> - Ayan
>=20
>=20


