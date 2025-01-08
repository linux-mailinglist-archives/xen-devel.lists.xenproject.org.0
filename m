Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77309A0560C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 10:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866991.1278388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRwn-0006WW-Qb; Wed, 08 Jan 2025 09:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866991.1278388; Wed, 08 Jan 2025 09:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRwn-0006TL-NX; Wed, 08 Jan 2025 09:01:53 +0000
Received: by outflank-mailman (input) for mailman id 866991;
 Wed, 08 Jan 2025 09:01:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7HK=UA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tVRwm-0006TF-PT
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 09:01:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f403:2614::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32de0065-cd9f-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 10:01:51 +0100 (CET)
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB9696.eurprd08.prod.outlook.com (2603:10a6:20b:614::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 09:01:44 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 09:01:44 +0000
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
X-Inumbo-ID: 32de0065-cd9f-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7hXHnOnie0g/T93wGsJYHQkQTXT+NDpUy1LMnl61E1weEwf6jGUdi9h0zbojtkdoqcdBzyKkEZRj82RAC3OAhHw831a4FlIsREPDEilzZDu5hUAR3ta+5v0IENRqv/C9MHxDXok0+NvpkPZdcn67W7CjEZssE4Oz4Uz2A0iIhVyJDMSzmcqvGuNKC0dOBOqmiUM+Adsc+3cvHwuDHp5wbJf0fHKhrR2Pub1oZHn/E27Re2Uj2XYtICoLkyc/lOJp2CaNxd7/jzFuc040tL4jk4zoId8glgIMAImhT8pIZZvif/zqF3XTTs/+Q680IGW8XVX1yis29SzSKhdoCfmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpUZZj6Vod7rrCGnR+H55XmOFSKDUdg5PMyT2DI5QGI=;
 b=Ebcjd+fa3mQ3NNS+ddV0WR9Kz2Cu8ZF2XcyNwnf1yxe+PjGxOeaEAvD3XpFaDQwDYLvNjbAsXZDBstXZbquUge4m+YqB6oLhXgw9tOK4tgJPqtmL6U084/Svlo5jUCDtNJ1wmuxzpxQAR6YA2CJXTR+HXYv1iesWiiUuEqufHy+6qBROQLvbk+BPzangcjPrd00IVy5cH6+8t6MDhUU5WWNTKoprpD4RoIOdU+1YeQGkvDbB0pS/UTyr02skXGJ1BDjuHcoRkeWi/DdLf+Pa8JMufR+3VkLWK82uFFPRDgz2tlFG61lsqtzHlmahiBQfng9bE3JqdYUAs8c6xiWaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpUZZj6Vod7rrCGnR+H55XmOFSKDUdg5PMyT2DI5QGI=;
 b=YBINreV/eY9URkbHIfvWJXkIMEczRKdAY4QRCaB4sxI9aQBykyjM09cmI5tCql+PL3DNQYjoNefac6yyXN6AZrIFZEcQLW554MNULEnYzogkTJCveHzNVs32Hd6N83Hvdq5bXiuclMYpXHi2yqMt8vgOFKFITEy68NoPXjObmnM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr() stub
Thread-Topic: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr()
 stub
Thread-Index: AQHbYaMBWdxQ1v99706M5qRoUKAKv7MMlHaA
Date: Wed, 8 Jan 2025 09:01:44 +0000
Message-ID: <5DA66273-7255-4EDB-A3F5-C1F4F61C9CE1@arm.com>
References: <20250108075719.84967-1-michal.orzel@amd.com>
In-Reply-To: <20250108075719.84967-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR08MB5798:EE_|AS8PR08MB9696:EE_
x-ms-office365-filtering-correlation-id: 525fabdb-3796-4c87-9a29-08dd2fc31322
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j1C0CXhJJM46RO6Vx+g0HSBj27FibHjoehw0viImRM+V94HSFzH0R5HElvOo?=
 =?us-ascii?Q?OEEJt3ePS2qLKDvp5XzuF2TsxzSHM3qb2VnHS22/piXZPKj2X2/oXZO+Zd1A?=
 =?us-ascii?Q?3JPTzBCJ7EM9vHBcJkhaW5BVKyniIDI6YPju8dpDb8P4hY40kCICq/Fpm9Of?=
 =?us-ascii?Q?A/javG+x2dpxpsmxL3XtIqhIcGEzbrxYIvRc6eosdAz7zlIqMz3/U6jt+IVB?=
 =?us-ascii?Q?VeStqskL7Uc4a0surZaiKRlBLLP05neqOcDNq5jlAEOYvzGzMuqAHTV6IL5I?=
 =?us-ascii?Q?02UxxlV0QhzkXkc6+yShNrihc7dbYdZTpTgJC8QrfOkyWEglGpCyUPltWrqu?=
 =?us-ascii?Q?5bKj4PK54ALCzhRn992Dx8+ihUKMthtePea1ZoeGYTDjB5PNgrDbeCCxwvbl?=
 =?us-ascii?Q?kIWnlFzHhmE3zaITMne5UyXocgE0Ym/wRkWCBcyYhDTbFVBmIcIER7qEzGEj?=
 =?us-ascii?Q?PuQy3Ea5GK3qEuLA5gb16yZ0v/bBbyz2199eZ+AwJixaoo5YHOIy9EYsL1Dj?=
 =?us-ascii?Q?zjm4T3tw3K9jHtGY1JmuGyzXAsfCj+SQigbdFvahjjRe2M/sa6aeQcOWWB4p?=
 =?us-ascii?Q?dOngz/jslgkeyzNSqektwsYfi8mRYDsPoN1c/U/hv5kEFOWbKLK86VCBC2fe?=
 =?us-ascii?Q?cJS4Wog755UHjkFUSOjfYRqJjtY5Uo0R3vmJKDOfxBz6SUycNiGBtbD43pZl?=
 =?us-ascii?Q?/4ANnnh/UT+4jnFZneoODIkQUMnAXkMCnOD75ZqSbc+nrSoQlp+pYsg01f0w?=
 =?us-ascii?Q?1XSFfBgx9ZYv4EweT5Y6gORJTfTgrlsTDY0xgJyTqcbma/FT9zXPQZIRVkYu?=
 =?us-ascii?Q?Ntcs5Mn08jqaEofU1Ysg/ZA2Rjtc4KMdcUf2WO4QbVLPDFz4Uk/TWm1MZnvB?=
 =?us-ascii?Q?jvukIg+lFd1hdvF0eUT6gQrv03fi102/PN0ZWWZqhzlqqFgfwAbcFF5n13Ge?=
 =?us-ascii?Q?dHFvu2K9MzTL5ck2Fm5yCLapl6lxp0L3QwDudyXolMO0PXbmt7TjGyf/prYH?=
 =?us-ascii?Q?OuXVFMCgbpQiS6LqN5dKa5/8pMGvqjQaG09gsgi9eWaJf/Tqmoh35xvNNUq8?=
 =?us-ascii?Q?59EJskbQFmJpnu8UFYlwdlFzTb1I/ePgnFez/gZUSSqzqOEdSWAlg8kJ5Onk?=
 =?us-ascii?Q?RyfRlTtNGIQzmDnHfxK2WuhX/20YvRb2CZ0rvoBscmYj/Aq2dD/Dt+XcszIH?=
 =?us-ascii?Q?yc16sYkTZ6m0DKCS9UgGEi2AhQd6XfKG93ARAXIeATgOyldQfIBUFB5NNwQ9?=
 =?us-ascii?Q?gP5lLiWxZM1y/E2iYJ0c9Ox18jM0IILBiZ03/uR46vxmnbHC+hbr9mkbiPiZ?=
 =?us-ascii?Q?U8T9CKVkCwXevgaanOYU/J6xGbAm11Lkctk1dZd2uFNMy0vREMJlUAuhm37W?=
 =?us-ascii?Q?2aoSkiwpeYokzmzegDxZgEu29S2WtG9sdY6VTQicamtk0hB8zYqzy2t0aKtO?=
 =?us-ascii?Q?nOUebua0wKwOouMyviW+/CTAcq2ghTL8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oD3uZnaz/dyP+3i+ERSVMF8fyyjkQT0GSFOdaCwaFh4SPLOJsEmHGaD0jlzH?=
 =?us-ascii?Q?v2ms4QM19QvzgsKY2PFrqGnPqmf5AO1Dssiu/v3ibR917DCw16eSpeVzBQHK?=
 =?us-ascii?Q?lXpn4pPYR42PtYtSZTZ++TQlxTUf2ZoCZAAxCRRaYMxQTgJzRPA3DNPQ6vNP?=
 =?us-ascii?Q?utNWUj8NUgz87pRmoeENDuK64Jvv2xAQZWiMfEQO+ciZ80loSO8l34Jq+1K1?=
 =?us-ascii?Q?HzgV+TRoSp+nvHsEQoQzwdqAbImSsTrz3D7b2h1L6DZrx2WyhhCuTAeaMHIm?=
 =?us-ascii?Q?p1dDKUzcGzqOZ4JYo2qjvI9mf9Ih6G/jNUoKO3a5EkdYHWKwlNndF+HjzL1h?=
 =?us-ascii?Q?iDuV48zGRDldLub22NtaLBUIImgrlMFOxYys2lQY33XsD/6k1+a6Gs5fv4ua?=
 =?us-ascii?Q?wna8/Y2rCIbugKHwCWwSoeXr7psnrzxSGQZKHFn4lkIhT9GKPXp6CkOJBKJ5?=
 =?us-ascii?Q?NJyuRxwV7d15grKKbmt93bT3/nPcVAnCkf2zPcqDh7uTUkpS904T90YUDMjP?=
 =?us-ascii?Q?11OyWaXB3Dv5GZZW8MpphaxAliTdlSVsgLnFzHe7ZLwpLq0hFzjoZFbwwc7+?=
 =?us-ascii?Q?4/Rb7qpYy8gv0XtEAr4IugQE4qmtfTwHnwfYMRWPrqMeRbw40vN2bxz9MTW2?=
 =?us-ascii?Q?E15SWPzqg1O43Gmmy/D9usCUu14iaVlT5HHgNonBN8gf3qiP/fRLzfabQze4?=
 =?us-ascii?Q?uCwPNPKy+0vvs5aTASpAUMGBB59fukctyRHPTpRq9bwZhtEvbkGnnTLW+tOv?=
 =?us-ascii?Q?1BAZ7OzRYE4XS/GhaF+JsxYHR0VQD/9ChOasz8jZRigeqVttjyaEMT0CdU5j?=
 =?us-ascii?Q?SlhrBebTH2XQMrx3nsxiZvRGuuHt0u2eRO8rX6dOnmBbX/46f8poDVfQScsQ?=
 =?us-ascii?Q?Vz60+KwYepS0KYpKo4UQOV0YSieuJxaQisjTuULe6hIppXBCdTMI46bI5N+6?=
 =?us-ascii?Q?cGwKbhW9bIVpTgYudnNzJCXeuQXsr06xmwCIwzCmDdnK0QwOW0UZnIbXV1QS?=
 =?us-ascii?Q?KNi7md8cIfw15KH+MTtb6QbHPwDGNo1hTuAsFV3cTv+4lW8XMnlaZCq/O8qX?=
 =?us-ascii?Q?/n1wbwq6SDHO/HDnTzuesxCTSXrTlEzdqGSGKYCiG9RweVfWHWhtz3RcOQSW?=
 =?us-ascii?Q?0ZgzBgMV+dzBkF/c/a4xeaDBS6Jup0MFfWJgA1pe/2WGHYxN/Fp9NvE++rKY?=
 =?us-ascii?Q?/LcdlnsTWCl9QWnPsxfWcZ6ikn2oABLDx2gIGFsP7fzlItxPK0HoVGsOLuEt?=
 =?us-ascii?Q?St3YmoEG4ezzg8eS9trAXiy/fsOrFZ+hQ/nar0+ripPsLzKDa+DYBwrXr+TN?=
 =?us-ascii?Q?gD6Ex4gUZIjkXYJnd+8AC146Hnxzs4KP7e+4h0PkQtGuzXHGhfdLZB68tKJP?=
 =?us-ascii?Q?16lveDQTcSEdHQRuGucjEUKBZvbFBPTH0eSPKpV5uPqT5ptok92p8rkHFeh/?=
 =?us-ascii?Q?sVwPe2TTP4DONaBEPWdv4LJE/hHTJkVsyv1q31j9QnQAw9xwBK7HRrzKJQGs?=
 =?us-ascii?Q?8MNusVmCujDbXRibQOEaGno3O0G5DrncmAXagtJJY6fDYOs5DNVLhy0UYanP?=
 =?us-ascii?Q?p04u5Q9GQplYoQ1LPpr6DHWbvYXTkWv8Li6uSq3o?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA4F9E932693894A89685870473C1899@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525fabdb-3796-4c87-9a29-08dd2fc31322
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 09:01:44.2525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2GEhuu7NriHNhDDN12+j7w1Zzg1Wb9JsPqG+TtshKLpxMqoZ3KmFj5r2PJkA0ADMl2YQHYEkUapvs/cuIhHdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9696



> On 8 Jan 2025, at 07:57, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> In the original patch e7a80636f16e ("xen/arm: add cache coloring support
> for Xen image"), the stub was added under wrong assumption that DCE
> won't remove the function call if it's not static. This assumption is
> incorrect as we already rely on DCE for cases like this one. Therefore
> drop the stub, that otherwise would be a place potentially prone to
> errors in the future.
>=20
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@gmail.com>



