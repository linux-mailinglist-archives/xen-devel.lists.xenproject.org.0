Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC0AC1DD4D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 00:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153176.1483624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0N-0002Sv-BE; Wed, 29 Oct 2025 23:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153176.1483624; Wed, 29 Oct 2025 23:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0N-0002Qw-8G; Wed, 29 Oct 2025 23:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1153176;
 Wed, 29 Oct 2025 23:55:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xz0O=5G=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEG0M-0002OI-1j
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 23:55:02 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae037674-b522-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 00:55:00 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6336.eurprd03.prod.outlook.com (2603:10a6:800:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Wed, 29 Oct
 2025 23:54:53 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 23:54:52 +0000
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
X-Inumbo-ID: ae037674-b522-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXxIGp3rS5bBBgb/FsxPP9voGWWcnOe6pgTVSXcmF+GEgsqjlRu1KUQ9r4zjDQARwGIbpuIpxvcqIke5/i+NsPg/J8blpo99444KttzZnhP82ORBcxcID1gACex8E/Pj1HcllM7v9+VNT0IH61Dj+yF8pQL6ezAFTD98/+pl0HdPyA/uYQt9kpyxKWOoBBrU+37WWTe3B1JxZtgRiyDrrHySIwvYQNRS+7GymGCwL08L89EdHnNl8hZIEG4tl+fK/T7ku6pHx10UHkT8w1On8drrsT8chxaREFXr9Y7R6Vnku39cbSAl0o/go5QIU15d1NKZy8RFVSBMB1jMPzZHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nB2W6kvPkMyCwnn3lorcsSQRs/CY2MtyjSCDhvSFvo8=;
 b=Ll5vT2tzF3YpzjzwDT17m879ULz4+MHRDio+ttmfmL/kS078hYmy1brYZSBZO2i8i94vi4YvxeQQ9IepXYb8df7tMlmgtn6l8hoMaCueQZ3HIk+y5vG2/ClVG360caFfaFdQ6ayMf2GRZfOVnkQJZ9WXRYYtlCc7K7kzgSq9sX+ffeYys3ACOgeH0HnDRtymrLoIXT84isJ232M8zNd3HPEVB5iAvegtk1aWQpxGaTakdnpGuD/WNV4NerJ7alYsLTXeSSq6rtvCFP4F+bNBE7kLuWJjCaz4KD2Yf6l6uPiJFfG6wG/wv0g0OxMyurQxKHw5punQB/628CKSgSrz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB2W6kvPkMyCwnn3lorcsSQRs/CY2MtyjSCDhvSFvo8=;
 b=jtIpJBlgAInzWmhMp6Br+N8Q6WDTyZYi3kmb0NJ3KbKPZBL54I2DlJz91vOdSe3pWs+p+4lGASIfHEbNCRjZZNfKwxO+k3P+7CKwlBteASyg+MKCrQWMg9rXTFh9zYCtXDPOFiMEogulzGJQtC76r70aQsrRZ+ya4RlWwkvRikkiygITpV5ZWCHLsNQgSpCsAHcOZXEb6k05jE+miRL8hDpUxGaTIhSMBFZRIerqFGLH5jm88VuMjkQBY37YyRuxD49ngc9FQZwDLdmVfsUND4ssjwGKzJTTMoncD5T3yMUtwzzoBqNxUvcaqDrmtiGYAOvqUbKAH7T4LR1bciWFHQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Tim Deegan
	<tim@xen.org>, Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [XEN][PATCH 0/3] x86/hvm: vmx: refactor cache disable mode code
Thread-Topic: [XEN][PATCH 0/3] x86/hvm: vmx: refactor cache disable mode code
Thread-Index: AQHcSS9rVSowLTGsJkyGsEcuP5+npw==
Date: Wed, 29 Oct 2025 23:54:52 +0000
Message-ID: <20251029235448.602380-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|VI1PR03MB6336:EE_
x-ms-office365-filtering-correlation-id: 7d52d166-5906-4b83-2743-08de17468ddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Z2xzQZfgE3U7eFuNNxAcZ+VYECLb58AM1UqMpSsUI1P1rRuKWHAu9PRsbx?=
 =?iso-8859-1?Q?85OQAkn8jyrbZwmI0OmkLUCBsjJen6f595uO1O9dN4frAQW4Af1SSZNPzk?=
 =?iso-8859-1?Q?XZ0mfsU2UUztmLb0cu1367RbIXoIx/CqnM4o3YJ9fnlCUN+txQZ/tdlwC1?=
 =?iso-8859-1?Q?56FQQogYcEJHIzfjz/1jQyzL2eKZD0EBjo4bO6JOa8N+n8xW3yYvu/HJfP?=
 =?iso-8859-1?Q?6YG9To1OceD8TMNnXUNDbMf3iojYSJhOSSciM6tDlQdcAAtZ9bJcf5ro8G?=
 =?iso-8859-1?Q?WgfcdNM5hRpq+uW8KtPnAVEPLduh++0EcCQz9xO0x6isRNQYZbGvfm+UoH?=
 =?iso-8859-1?Q?VtaqVavkHscqGMjEnEDR2GzsjDJEC4dLNZ05As5z30miEPq3d5AKSdAY11?=
 =?iso-8859-1?Q?dpk07P/igYeDThF1hMAunIUvpDJTB2OPSwA6D2nPm5f2SWIUN9votmY+Qs?=
 =?iso-8859-1?Q?TfjLbYwzEGVHQGCagnhmKL1IkTowKSgJXTb0XQjaBKIbEuZkqZEhCTpdSQ?=
 =?iso-8859-1?Q?pV7fkt3E9Ozj2+3+X5lEiYKbdYIKpIXTrT/ydsS4IZyBC/1XcILYbroyF8?=
 =?iso-8859-1?Q?MPwipPdL/SeoZy1VytjjqyNJWIxLqvUssOuXbpp34SV2GFdsdRvpnZM9Od?=
 =?iso-8859-1?Q?nRBTyCkdTLA8N/0PbhNE9Ljp6Wx+liOekt+Qx2E/xzy3uSMVt3AsyU2Utw?=
 =?iso-8859-1?Q?xDm0TOrnW0GMI0tcS55icUQmMguEZcPSJd5aCBgAASnWLmpMK7VQjbNFeR?=
 =?iso-8859-1?Q?39onaFqMaX41DYNxjOfLACWSUdWKOVm8/b/8zqoh7jpj1s02A0M5KxA0jJ?=
 =?iso-8859-1?Q?LL86db8Y0RRcScHZxImojkJhSc/rw//VrFhhqb8aokqJBc2n/ScKMbiNFE?=
 =?iso-8859-1?Q?d6nts4aIeB2Cnj0RgZhWCiZH/lMpbfcnI8V+/eGxCmKi273gNPRvWV6R1c?=
 =?iso-8859-1?Q?SyV5eerT7IiCp8NzuygAfE7wonim57MZvIyEi64ryE/66QSr6ZdPXXKiuh?=
 =?iso-8859-1?Q?Zy+TjrdyG80T2nHde/B/z2pgFOEz5zrRDLAof/wB1OHITV7I8eoVUYbuJN?=
 =?iso-8859-1?Q?EjmoqnVcEk9/Tk/jpTP+w3r8C8hyDMOJuXKx2Nm/WbNM3MeDEPLPi0rgsd?=
 =?iso-8859-1?Q?D09wfv3+BcBqGWn6pXBnnf5QipxzmBbE60dXF2VWL6G5nDxeIldE/I6LNl?=
 =?iso-8859-1?Q?RAW6ONn7lou+yKKwuPeHnLZnSXpDJ126sYMj6sZpk0wj99vk8lxMbC36Ex?=
 =?iso-8859-1?Q?meTzzGBw0CYXE3ZplgrwHrf6i6X8K+k+CTWzhxZdrmR257YYyuRkym+EHo?=
 =?iso-8859-1?Q?WeEMF1vKeiiYpX/T+M7ZwOP6pmA9hoeizVjpNt7NTDjNCJw0GItU4X7Whn?=
 =?iso-8859-1?Q?QP9BhjXkJV7ZZxGCagqsoTfMk/Ok/RRx7QjZ7u9xj+PilGmU2uh5AfOEqE?=
 =?iso-8859-1?Q?VaSqzZaJHkfnGFw85HLTXjMlHKFJnuHckQbMzb16yYBblys90iThUVGmFi?=
 =?iso-8859-1?Q?tnpg6+NAIATIW/mmvHbKnsRVNj/fxIlDZOnsT2PW1Zq35DTTCISxiUxNAC?=
 =?iso-8859-1?Q?Pp6gfAcoqJnDo/KfTSfr/mYLNPaV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QfSUt+J201hJGYDGBJCP2ys+Vm2u/HLAgFyfeGfCPC3/bcfa8h4PGXfxd5?=
 =?iso-8859-1?Q?UFr87yDxD9rnavqc3MP/eqgRZFIJyORwQ/VzDwrnZvy8cmeFOXhvrRZEMy?=
 =?iso-8859-1?Q?XIG68kAAP3VovtWmd7RMBYFdwvi4sC6TYvcuzTFB779r/e+nVSb0Uyn+FN?=
 =?iso-8859-1?Q?x5U1vgq68tASoYPNHSjrTPMCvB5J4G/r5+GGp4cDJFunly5gL6wWENi7Rh?=
 =?iso-8859-1?Q?qla9Ss0+RPuRyKkupKdw+k7D+mmGfVRUeI3QdpLhDZqxCEoRLJbor9jRqd?=
 =?iso-8859-1?Q?A29DPh9LLjZ3nxtuAgikyqU6VbaB2Dl+HNa8bouV3BAUXxQHRJzcZoh5qV?=
 =?iso-8859-1?Q?VtTxsUTZWHGod+E9RyP1qlLoy9MlFb/c56SuIJBZwbNyneDyYFOcqMKn8U?=
 =?iso-8859-1?Q?HW1POKhP4SOGMSyDxcWzKxDwHe9exXawzhggaEa5eigWbIslJWOyAfo78W?=
 =?iso-8859-1?Q?0CQqEhisNJvWKWKYWom2cclX1rnIi1dfmZcob8dU6pqWM8CDoOKiPyrvaR?=
 =?iso-8859-1?Q?bIcVXgAeRjDpfbgF6TMbREHf3tuj4XBbx5DMye/VVCgh9bTGBZTwD6Lrem?=
 =?iso-8859-1?Q?nsmU3o6BQD3es3QNRpvl4ihYvsnEF7CuKERHuOHULDh9KO67eBxpmvHBFm?=
 =?iso-8859-1?Q?IPI1hNrwPtgBW4f1AXgh937J30qrxgFaJM9pBzPvNnt+0RBxJFMjpwUPca?=
 =?iso-8859-1?Q?fy3WjRQfeaSME2mSWTDzxR/woauk5uh1m+FknLVQAjztq9g4mAa+EHP68Y?=
 =?iso-8859-1?Q?FpSBoJn3mkIEqyMKBj1oPilbyrmBo//Qqaiy+sa/ELNW6grW1WgUKjgrly?=
 =?iso-8859-1?Q?UeNpLHZbUk2OKA0O5G7NXoAqEpP69JO6KBZ34OMS5ssxprSwyMRwJL4YiW?=
 =?iso-8859-1?Q?QodJiUDQ7EX8ViFRkE5axht/1OuxXlSnPAK8bnufvm9x+IhT2a2RR32l8w?=
 =?iso-8859-1?Q?ZOFcwoAg+55KxkRv0nhxPI13xNtsXpT0QrsjJAZdlymczGZTqLUDmaypUa?=
 =?iso-8859-1?Q?NvUyY2npMjGIrwcfoSNYEjtGexXYV1XToND9AAkh1LMy+x9S2pmjfnKZGX?=
 =?iso-8859-1?Q?N/q+HlYWsLz+qXeQ0htJp/DuTU7LMGAEXLBudpd5l50lGpXlbYDxX4peQx?=
 =?iso-8859-1?Q?uO20J51CSENA0uG9LQGVcYn/F/bihtY3C3jfKgmUKapRiWZ7Fm8spkFSXY?=
 =?iso-8859-1?Q?vE0+k95OXje9O5OA9S66kEKAWT3vyt7DzVlpt/LMXzjuDA4qBudGW5H8BP?=
 =?iso-8859-1?Q?e4XxlHrlvj2Ohwyfut1K9jmX+py6oNXkJsEP3zZHWBBZP48Q1eQweuRg66?=
 =?iso-8859-1?Q?oX3Rq3mRtNSfOj2gUmlAwLLxaxwUaq1xFvN8Z1rQph9aPqCVwfQ2bA5mcn?=
 =?iso-8859-1?Q?0UyLHaHyPbcBcFb2J2zYNgEFHD6GOoMFhds2XtpbZ1Xx8MKPpti59k7rMj?=
 =?iso-8859-1?Q?UC/FDwdbkIxJ3+fvkcnOJqALAImN0gTgvj9J3e0CUEYLLZI5l8OvAq481c?=
 =?iso-8859-1?Q?RK+7FNO5kPia4ZRb8+AhlHLSiUExQKec8x07TuYeTVUhdZygWLzcFP3w+B?=
 =?iso-8859-1?Q?eDi5chcLUsCAxB19IwkxHx6GxyC2iFC1n1vbjDtpGznXWKKgFYoIXiNowx?=
 =?iso-8859-1?Q?ViKWOe8RsVSBWS7nUSNgQbBRGI0FBpd8hrc0k/o/L9SWP42YfW03zKdw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d52d166-5906-4b83-2743-08de17468ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 23:54:52.8230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2FQuSr1PlXOrxGCtJ18CAHdQWLG8uHY8i8wlJmNIYMQ40dv7voEc38aSRr5DBB3HHCWsrzs/1MQQCfnw+RG8ZC0o5Kxy1ltCl3QmLpohuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6336

From: Grygorii Strashko <grygorii_strashko@epam.com>

The cache disable mode code (hvm_shadow_handle_cd()) is relevant only for I=
ntel VT-x (VMX),
hence:
- move hvm_shadow_handle_cd()/ hvm_set_uc_mode()/domain_exit_uc_mode() in V=
MX code
- account for SHADOW_PAGING when use hvm_shadow_handle_cd()
- move cache disable mode data into VMX specific structures

Based on discussion [1].

[1] https://patchwork.kernel.org/project/xen-devel/patch/20251023151903.560=
947-1-grygorii_strashko@epam.com/

Grygorii Strashko (3):
  x86/hvm: move hvm_shadow_handle_cd() in vmx code
  x86/hvm: vmx: account for SHADOW_PAGING when use
    hvm_shadow_handle_cd()
  x86/hvm: vmx: refactor cache disable mode data

 xen/arch/x86/hvm/hvm.c                  | 59 ---------------------
 xen/arch/x86/hvm/vmx/vmx.c              | 70 +++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/domain.h   |  6 ---
 xen/arch/x86/include/asm/hvm/hvm.h      |  3 ++
 xen/arch/x86/include/asm/hvm/support.h  |  2 -
 xen/arch/x86/include/asm/hvm/vcpu.h     |  3 --
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 14 +++++
 xen/arch/x86/include/asm/mtrr.h         |  3 --
 xen/arch/x86/mm/shadow/multi.c          |  2 +-
 9 files changed, 83 insertions(+), 79 deletions(-)

--=20
2.34.1

