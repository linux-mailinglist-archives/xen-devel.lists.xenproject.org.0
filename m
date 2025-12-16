Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE2CC572A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 00:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188429.1509590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeEy-0000Zp-EN; Tue, 16 Dec 2025 23:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188429.1509590; Tue, 16 Dec 2025 23:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeEy-0000Xl-BU; Tue, 16 Dec 2025 23:14:00 +0000
Received: by outflank-mailman (input) for mailman id 1188429;
 Tue, 16 Dec 2025 23:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rmh=6W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vVeEx-0000XY-Ce
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 23:13:59 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e34e3c09-dad4-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 00:13:53 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GVXPR03MB8331.eurprd03.prod.outlook.com (2603:10a6:150:6e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:13:50 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 23:13:49 +0000
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
X-Inumbo-ID: e34e3c09-dad4-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsTJpRv4bK6AHARNikhTCnOj+ClS6nGJb0385zYa0Fw9XWZPm68mxsIwAszFJi0fyuG8X5rNWbwohpAp7CM5MZOQle+UyuaXWGNrauV7HlSKb6EkZw3Wl8zbR9+mL1w0YB7ef9OkoXpQla9UDEYajXAJbzufkeoPaI/ZkSNR6WnQVcp0gGxx0vdAjxWygzagSV0oVe5pW8yJxmQS3paFA3e/GwN+mR3B3hgvx8y2qGzlxd884aG/VPOYTqaRVsvy4wXaH8S6ZcXH/qfV7VTIAPFixUCz9LFkKc+jxAUM8MZCmzD2mThXe/pvd5PKOSRVeamoh7pxPChcPQvNubnEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/jNC9Q/jDhHe0OfTbYK7vyetju7vlu+Bol6NZRc2L8=;
 b=Xyvb6jEikCd78OjCSYxWwkyemjuGINkt3675cto0xlYtBakC5L5pDMyH2pB4IPIAlW9T3RAgFsyw+mJb1Ud0vB5xVB4CgrPkZphaqVFvXEFdQHL+VmAEHc1V2BmcByI+TgQarnJyJ242eoC99j7ErYNi3kIZ5hOiAtJNVRLEH8cmuOpsoTcJqZSVan3EFgwTNpAWoJxcXhEQgxeTHx0kyHkuw7jspscBp4v/qtQGL2Bbm3IkXNsOZmRNyUDCgGAAPgeAg8LyL507MXXvmHQhoBZI4mwDXhferQvU/hLpsZn9bXGQ/cvH3EjOITajruoNKoN+3s7lOGHGMVXi3Ruwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/jNC9Q/jDhHe0OfTbYK7vyetju7vlu+Bol6NZRc2L8=;
 b=UueL88RlwzOXfRW+z7I+qnU+aM2FreNAJw4ml6Wnn2CR6SY8s7Ktni0vHyvV5qK+4N9gvxcP+eq96tBlIx42uhaMqT1vWT2030VB2gxZOdcSaTbSAdihdZ5IvKdA27LYUc/Kvu0GNYuQC7YwhwrET9ocjiIyqMJ5IETJp8TSVEGOQd5ym0mrwX/tpkGka9HZinJLx+A9Azr6flxE7acdVnxFq1T9IXzqHDReaK0YU7ZNmS9NBrYbCqZgT4XxJBMy77AXUAGWAWqvVKvokR6khRrpSCrqHUI9lLvG0GAcP8aoAqOTOcXkk4Q+zoPgMHND3TpVLf9erEp8/oxeDQPE1Q==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/2] xen/x86: move d->arch.physaddr_bitsize field handling
 to pv32
Thread-Topic: [PATCH v4 0/2] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
Thread-Index: AQHcbuGi+63bPvad30uwtETYu9iVYw==
Date: Tue, 16 Dec 2025 23:13:49 +0000
Message-ID: <20251216231348.3897820-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|GVXPR03MB8331:EE_
x-ms-office365-filtering-correlation-id: 3b3c3668-fc7c-4cb3-4518-08de3cf8c579
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IAMPzNAdlGzJ3IgE2TZt8YWvGSzsSx+GODzo9fEvkbZcQj6gKnx+tLgyNs?=
 =?iso-8859-1?Q?D6kZsbU7nJcblKO47pLrflecnn67vfOQLCwg1lwB+gBFkZfV/thxJJWBTD?=
 =?iso-8859-1?Q?/BaUZtXb+MWcj8Arm8z5SgWRBhnKBSvT6D63Ztc7RPH5eW+8PwmajlMvFo?=
 =?iso-8859-1?Q?arS5t1Yn2TwvwcxCbDuTWY/GMmhKJ47b5OnhtwOkoaoShNCJa/P2wMOZSc?=
 =?iso-8859-1?Q?UuQgi7Eh5f1b/gw2N05JlUHPJwsBzYM5CWJxhRPi53scfrmxbn79fiz8hj?=
 =?iso-8859-1?Q?2q++BrAv5aIS0C2oNHmd3/y+s3zzqZXmEKqf7XfpJyYOGdPIZpfDpT5A5K?=
 =?iso-8859-1?Q?Pk50AdPafeolouCeGJhgzS8t0szOl4It6VngQhg3lteZH/Te9a60VVN0QG?=
 =?iso-8859-1?Q?J9m1oxPrX7A6JKsFdgQhP4/Zu8+oIY8uIEypddVloUvjV43mEv7qb4/9Ad?=
 =?iso-8859-1?Q?p8OFS52GVxLHbAMOgqBjx1X7ZS7v+LMFJabe4r/+MN06CR5aljk8JdddS3?=
 =?iso-8859-1?Q?oHU92J20kFP2Bi7gbWAr/wFh2jCrt1OBK+f0x0+VmXl6oB4ToN8pA3B+fG?=
 =?iso-8859-1?Q?tQkhRopBfCmnbP7VhgDjlm9XOLdp8NMkBkVtlMiBWLBGfUi9tnBxxuaGhN?=
 =?iso-8859-1?Q?0cOrfZc3X6POZly7Vkdugu7ttwZsXRzRrWK2GbDTajgdyOiSqjJSgTh9n6?=
 =?iso-8859-1?Q?a68xay5rdRRND9cOSnsrQ9pfb0LTRGblGrcWHTckpnsVxvot3kBOQpORpa?=
 =?iso-8859-1?Q?8XAUOG1HXc0tZwGA+a8QGNUlhpY6Kpuuvh3l08RlNdANr2Jkup0Wh6J8fD?=
 =?iso-8859-1?Q?GU1CRPl9AlAMSJYfzUZKO7klNee3CuozHj10cnG9+pDfbXdrLi8HzJi7nz?=
 =?iso-8859-1?Q?ZMY+oa6fYnKZuma/KvtwHmO+8aU+ntTkUt/CD/WCFbVhB/3ExWPHPXXPqN?=
 =?iso-8859-1?Q?a7c/HpIWXFsPRinnWBg5HB9FUSntHLsiy1VvsJAaknfEZOeVKq1YnADnRf?=
 =?iso-8859-1?Q?j3s9sx+xw3i+VhEz8uzXdi0SzkozJgNyKP5JtGFGLKFWZUVmSTgL4sHDJZ?=
 =?iso-8859-1?Q?Sm7JgOAtwkKfKSRUJrfNCZCorfB3u3ks9GGxbUR9/86M2taRs49Y+W01aO?=
 =?iso-8859-1?Q?UrKhqA57HztEXiDTkVWIIW2NOz9/SAWG/m2o33SE21U63VEm+iD6VXlCpX?=
 =?iso-8859-1?Q?6mf7bELhZ39K2mEER/9aLOqNLQ2vUiAEjt4kxgwrvZf2uiETHUmMZv11nQ?=
 =?iso-8859-1?Q?0H6AwLdEs1rmf+ly29hdVxuFX+hl38QT+PRIelLU88dB9h4SHiUGXWmNgs?=
 =?iso-8859-1?Q?jDmBK7Nx5YPqewagm4DWRWS9sQ4hqCzSS+DfN9Ox8JiTH0VUJFd7aqR9RV?=
 =?iso-8859-1?Q?wZ+MkazBrg/Gohd0Eu4u3YOf2ykoMbDRNE5aqy8AqbPy9RXvXTHW3NN31u?=
 =?iso-8859-1?Q?4XWkK25VJImgOZbmhn7IfKJcDS9zaTpfjHLf2ajg/ef2Mv/ETOzZ6jMCaB?=
 =?iso-8859-1?Q?Ff1ieqTa+Ra6WoKbPruVLzNG2tH8Nhq5xPfJLsnMPM4CWqa9KSF5aTmInv?=
 =?iso-8859-1?Q?/L91afCx42S2lIlfUHMdeA3vl5iK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SeB1GwJ1tpJHKhZy2PBlR2cYTpHJuFxzK3/q7R3iKBtjPLxzf4bxpCZ0dd?=
 =?iso-8859-1?Q?m2hV3+8aweCK7ZPqeReq8vicsyqChmoYn48H/LDbAlvQYZcLQUhcbnouxd?=
 =?iso-8859-1?Q?YbUO1Bl1JWOqoKFE8SXzz1XvrpjHDQT9guE4voSgsOKYfHiDc7ZMTpvQzj?=
 =?iso-8859-1?Q?2mtoea/1XuNKOSKJxEOoNagYRfna77TJzeE1HETO7/Ly7vWy6DLpjLC1FC?=
 =?iso-8859-1?Q?0yfhVHKvQ3uotzpLmyV31mL819tpSvkfYfPoNf1GU5i6f4mFRAWFXl6s+e?=
 =?iso-8859-1?Q?4Ovd8XoM83/argcBGALEIRVyVTegaYc++TYS5X3pADs+RuRJ5gwLOgpduj?=
 =?iso-8859-1?Q?dM91/GpZXgS/MvbfSmktsBCN4wXMGp4cyehOXDuoADrG1M2UdhxuaeNdg6?=
 =?iso-8859-1?Q?S1g9FwlgAqQN1938U4TlHriWsEIMQpla7cB8ooLCbCzJiW+j00cfAbtRdd?=
 =?iso-8859-1?Q?GJUmf19Jk4hNv5wsbhwpDCu3S7kaym5zRCir7GKxHtYhUVM1M1/kdQCOOI?=
 =?iso-8859-1?Q?pEUoLd4V/jBT25hTBOaFQOwHyqpJTX+/DBEGPGMP4eZHytRvsFqhNq6VZu?=
 =?iso-8859-1?Q?QH3WheKMv/YGLLKVjq95TRwe9+M8SxiJEqIAhkpPrkHsEV3CaXIzkd8y8e?=
 =?iso-8859-1?Q?B8mxxcNzKiyMdWZSGzPFC00aKWGciCPJaKhXcaBCumdmlD/BekK6XjFZPW?=
 =?iso-8859-1?Q?M9NEqtAzX3XPA9QOxm8sNlDLl275faBrF2YuYshMTIApW8ofYnU/mVq+O1?=
 =?iso-8859-1?Q?k+jQ/kDCFcD0LRBSGo0hJWCORszf0cLzSnWylduM4UKCFl9BMo/MFqwhxo?=
 =?iso-8859-1?Q?b5lV6q59aSiHnzettSp279uG3+/ypDVKyg8GyOL8LSZfH+Tfoxu61qHWSJ?=
 =?iso-8859-1?Q?a5wkOFuEZc4hfpga/dd9n/lS5lA9tWaUpXVcR6uKIWZzqwlrTGhw6+A0ig?=
 =?iso-8859-1?Q?Z3UMp6xGKkFvZNOVoIaBTLIo8LdFDH5I48yYvD5W0YA5tndt8Ig9Zo374l?=
 =?iso-8859-1?Q?auAUK1Wz6kR/AeaCuesRWD7JRiTreN62hlYjgE1szTiBKR0A+G3tE4Lqnb?=
 =?iso-8859-1?Q?W22uwJ0o7DzYUNVJCWRgf0RdXgz2UtR1DR25jasAiVvVukwD8eLvonlcrC?=
 =?iso-8859-1?Q?FzPjSxeGfEqmtkYH2AYaEfdTxNNTjZ4AnSIKwNapKyhnmMcCD2t/mvtKq/?=
 =?iso-8859-1?Q?JWvOXZ24KUMLAlXlpzc9sv+GNKMdi2ecAewrU5DpdThZz0wN/uklGWl/TO?=
 =?iso-8859-1?Q?3oahibN4bdsOk+I+I/7J+J1074+Ndz6cipmzuyMsAgSXMbR16jubA9yi8h?=
 =?iso-8859-1?Q?SKeloUvZ0YMKIi2+Sce08jkxf9w0DYOr47TjgZXOOIygK9cG/cWsLS2TTP?=
 =?iso-8859-1?Q?PElE3AaxJ8mFDkX0dEolLstezI9/dgYpwDVBZN41NzFpc562UPsHdaFTm3?=
 =?iso-8859-1?Q?/1QzMFFxomaY/PepBuxRmc3vVAz4tyBEsLEj7pd/g2P55PbhmeA7zz8TUx?=
 =?iso-8859-1?Q?V50XUo18rCMiS6FSNyEualqtxJZ6E508ET6v5kS+RnvgYeP+ngIx+s8Ulf?=
 =?iso-8859-1?Q?01pZWSOISR2wQhokhcXRKZ24c31ma0VdBhnds+i8vY0SiR+D4oqQ6QmXiP?=
 =?iso-8859-1?Q?T1+xTF7wZBPxVvaAdpDSNKoq+JdM7fD973nKVDEqG8OzLzFIwwB08lYw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3c3668-fc7c-4cb3-4518-08de3cf8c579
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:13:49.5218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0k99ng8VdIkgcj3sVGhM/wFNa9p/Ml06RHjt6V073FJwbi76CH/l/qYWVMF04l80rTLbV8SI29nDWzXeuUAD6eKECuE+dcJ0aj/m8KLDlho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8331

From: Grygorii Strashko <grygorii_strashko@epam.com>

The d->arch.physaddr_bitsize field is used only by PV32 code so as the
domain_clamp_alloc_bitsize() function.
So move them into PV32 code.

changes in v4:
 - rebase
 - split patch 3 on two:
   move domain_clamp_alloc_bitsize()
   move d->arch.physaddr_bitsize

changes in v3:
- added tags
- changed patch 3

changes in v2:
- split on 3 patches
- move physaddr_bitsize in struct pv_domain
- make minimal style adjustments as requested

v3: https://patchwork.kernel.org/project/xen-devel/cover/20251128152218.388=
6583-1-grygorii_strashko@epam.com/
v2: https://patchwork.kernel.org/project/xen-devel/cover/20251127221244.374=
7918-1-grygorii_strashko@epam.com/

Grygorii Strashko (2):
  xen/x86: move domain_clamp_alloc_bitsize() into pv32 code
  xen/x86: move d->arch.physaddr_bitsize field handling into pv32

 xen/arch/x86/include/asm/domain.h |  6 +++---
 xen/arch/x86/include/asm/mm.h     | 12 ++++++++++--
 xen/arch/x86/pv/dom0_build.c      |  7 +++++--
 xen/arch/x86/pv/domain.c          |  2 +-
 xen/arch/x86/x86_64/mm.c          |  7 -------
 5 files changed, 19 insertions(+), 15 deletions(-)

--=20
2.34.1

