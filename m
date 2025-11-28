Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A3C9272B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174946.1499892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Iq-00079F-8W; Fri, 28 Nov 2025 15:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174946.1499892; Fri, 28 Nov 2025 15:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP0Iq-00076K-50; Fri, 28 Nov 2025 15:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1174946;
 Fri, 28 Nov 2025 15:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqkP=6E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vP0Io-0006eN-8a
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:22:30 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d23c505-cc6e-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 16:22:28 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS2PR03MB10087.eurprd03.prod.outlook.com (2603:10a6:20b:62e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 15:22:20 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 15:22:20 +0000
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
X-Inumbo-ID: 0d23c505-cc6e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abQTVVIID8XrrDHU9N+ItVsV96YKf4kW+Ay405r3ArPwYPOrH4adWiByRMXkZbQil03Rd2gHNpegxwK+eBeNrW5UOYw8yA92pzD0BoZnkJY5c5jQ1Y7LEr11ipOZ3nvUY2AbgZwRgLp4j2V06WbTEW8bYm5i8fLQmT3kZKkVabCoIsFAr6Hrk6mb8jJI+d9xRr6oZIul8wgKoyhyhP82IE+Ioaa9Lskypvrv6auemW/ugtDLqnB/rVh/5OCDMNDoXK87cAn6soO2M3eAGJLYd0veuWp/EMHiZjoAWJXCAJQoHWRPrEM/gQHUvbSw1vCTBH19AVQ2WT62rZrDmNk+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlxVuTYs1NfOMFAFsbcZYCqFRuwcinV7B4ktZgAo3AM=;
 b=cGA8m0SLFJP1nBddAyCcoPrSpPq5UO0X7pglkpgUIKfB4+FZ5CH2w+kRLboOoMIfjHc9utudNr9PUTcSz/zUCkRRL18sWQTv8OCPOdF67RoAwqiA9V5cJQR26f1QeQScnrHXSjO0PnURQOowfu5wCYgWibnrkYwbR6JGBy1BJeEV60qgX07q20Cp7yuYONeYl5tax0nhKKZjLmSDUxBAoWcSqBUx0iNtKhaqY3WNkJN6HKCfpx/tOWrrXixxhNu+LIgK0z3VisH2OwPeaTj4fZgPzAfpUfApQ4LyuT1LenlRT9AulGn7/4HjH+stw3aewosCuz7EcCD9dMWaVpXL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlxVuTYs1NfOMFAFsbcZYCqFRuwcinV7B4ktZgAo3AM=;
 b=dn8/gon1Xyff7WG8PHcQH+EY9i/hvpzxlg8qDPjns4LUTA1TSx2Ur6YsiJoiVlmIvmzKCmy7UQ7iNgo/3PMXNCR6xJKyaWq3f5n0cXZJzCbFMBsRtS3NJtyC1m0SjMLCgORS3dMFuuyi/dHWULmxViKiVBvR6oNq8b+VEYfgtVrk2se8vmzEXbo+e6pKcXMdBs/65NefsvfhUNeF/VYowtCJ538nYWGrCvOiPoYIWagwA2QnPo5jIdk9uu9RG/E6d0whfu08gRPVuTOJxYhZ68e61+tL7KXIaAC6jerXdV6KNFGrhTmFmTefFuYUsXWUhoNMuA9yCmkIo2xq/+XSxw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v3 0/3] xen/x86: move d->arch.physaddr_bitsize field handling
 to pv32
Thread-Topic: [PATCH v3 0/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
Thread-Index: AQHcYHrJ4PIs75rE1EOUoOM8oMNBwQ==
Date: Fri, 28 Nov 2025 15:22:20 +0000
Message-ID: <20251128152218.3886583-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB4600:EE_|AS2PR03MB10087:EE_
x-ms-office365-filtering-correlation-id: f0934744-5114-45eb-05b7-08de2e91ec58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5UcfTq14kTLDViR/5hktnHE9k7o+7lq3X1AzH/SL5LQUaSS6rOwEXX5VOi?=
 =?iso-8859-1?Q?VQRKjbP1LiTLDsKb7yxacD4POL65a/ghKRsMTjuNAoosVou3vok83hRSb5?=
 =?iso-8859-1?Q?oU+o3X/YfqlrVm7FgUDzpDb8CwTqi/fZnTYrmpoWujUCtKwM48uUORbVhV?=
 =?iso-8859-1?Q?VjRcNjt2bRJVr+kU7qOD6Yal89SoHLqdB9VvcnStA4VcoKlrCwYVbFE0M4?=
 =?iso-8859-1?Q?m7hpUYLUBkiWvG5G+nxvvs2c8rb+3pc/qeGOBgKPHfdAkZPf8b2PlcTjCz?=
 =?iso-8859-1?Q?uRjOJxW0akAAMdEUp34FHF57x7WcX+oH5Vs4CfJ6CD/aszqO/vfWF2PU36?=
 =?iso-8859-1?Q?YtevPI3ek0+rz7XxMxypY9aXsAuIIiNMCtChU359UuxHFIXkVq4lJ8jWUk?=
 =?iso-8859-1?Q?eXC4fDt8IE9EVLWSf+c/uvmyv4Y079gA7xXl0ktZ3Ni60Uo318yXk4Ff4b?=
 =?iso-8859-1?Q?1eQbga6BFJi54SR2aiU6VoPOe3624ytgMHbkicuyp6RBQl2IswaTNz+sYW?=
 =?iso-8859-1?Q?kuhUDZG1FPD8fRKLtZY6QVDMIRmop1fIAKadMQzBGzNRpzpeQ1IdukBhZm?=
 =?iso-8859-1?Q?p6a16kKmjSlms+PGOAYTitZR+CnXzCCDrSXoNhqf7H/0sGZMulXp7pc8PE?=
 =?iso-8859-1?Q?Pj1vpKS7crqV4KHRTUD5yEg61svkmfVdAGTdPn/Mv/BZyXNbJt3tCUVtw/?=
 =?iso-8859-1?Q?O9mjPtbxI7CnlEEdHwuRgaGPYXb11D+YtS7SrNiC8ljSjEpkoBSODZKRJo?=
 =?iso-8859-1?Q?PRaNKd0PpiBwl4r0E2wtYuEi+y9zpXQdQItJfEFGWE1liPKUr6GZiNJlB2?=
 =?iso-8859-1?Q?baAtlZbxyNTJ8Hm4DEXMFM2PpJNNfPoEhlTXHgfTdtjzDU3uqFiGs78hZT?=
 =?iso-8859-1?Q?Zh4jRX87d2doFr1aBWxUiurue6Q8Y2+4cDvrRhD+r+O9+LOUYCr5goNfU+?=
 =?iso-8859-1?Q?FQDmPctthjhkvq3wv8ZS3bIXkyfBBX+/ScOBdXRZdLuSrXdvZowqevzIKB?=
 =?iso-8859-1?Q?//5OSkqXOqIRdioseKulGX0zMptqDwwQlPy5mwVvwOz7s2oPttxJGOpAcg?=
 =?iso-8859-1?Q?8QDO7MG3bcp6aKiyk3nRW+WhukPuiarEP4GvPB6QVFV66LmVIymnwNy3jj?=
 =?iso-8859-1?Q?TZIoj+XL5xGNJZ5fbyO8mcTZVojRs8h/znev+mpaNrmI/B+MyuqRreMUzj?=
 =?iso-8859-1?Q?qHMiNJF02ku8bnRn0Q1p6DIZ37sr3dxo9UqOHUphH2md0FJHJTrj8zAJ/V?=
 =?iso-8859-1?Q?Ic1952kTnqLQC5GX8bnQafsMQqrUnAhFYbBDTnLfvYM8rm+aFpc7NYqmWR?=
 =?iso-8859-1?Q?DHdtZJlTt0Pc4kUvQ6sFyXXMSFsiJmPuSC0MZFV0GlOyB5kYP+vvDoAysW?=
 =?iso-8859-1?Q?eh3ZUgfpMlx3AHpC4WJAEKtHtogaOPp+bL8qxZqBMnCNTCp7qI6n51JhJR?=
 =?iso-8859-1?Q?RNcZUdLg5/J9Ogb8y6xzcuUOeFt6SUFGQ5OZVUHKFOovlItBX5hGTH7XqU?=
 =?iso-8859-1?Q?7mPIvacaM9CMwqU0up7yjagyW3GJ615u2FAPqyHC8TXmbb+MUukrz5M+sw?=
 =?iso-8859-1?Q?9tJSO6mCONDD9XK6yCBV7mlHN9Yn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PXCndH8wHfm064pRAP+vGFfcYXIc2ZLzR7Bs/WWHX3XNMotOljhf/M03rb?=
 =?iso-8859-1?Q?xbJ9d8mIp1vEqwvcTI4Ax8F4GfIgYTjr/Lx+kG1t0NP8HY+3eji4FFou4N?=
 =?iso-8859-1?Q?fk16n5oOR0gP9IVqljbdHUPpm7j7chokTzJQq8I+OwIvdVQhhx4qUKnDSG?=
 =?iso-8859-1?Q?BUCxKjWicFLg+GB7sdGeHAXtdq6sQCNFZGGU3SHWg6UrN5XMbpXFsb408z?=
 =?iso-8859-1?Q?rmZs+MTSsw5EU3IXajsb9mtqQ8rTd54rBC0giftLqR93+I7SgDft67gqQw?=
 =?iso-8859-1?Q?OE9IIGtrlg/vSPneuMa4noapOKdBaBdvWyMtxnVep1k48+c2k8NPdPducA?=
 =?iso-8859-1?Q?aYu2vm/vo8Uvjw6vKl+sz7TVEJ5IQMv76ba2ubyGXKTjItdzNdmalmKJCp?=
 =?iso-8859-1?Q?begLn0PAENMjprsdzbWC+lZ0+bzVzmb7ZvyGo9rP+2G7ordVfRMFr9kTdk?=
 =?iso-8859-1?Q?At1BujJoVBr1Nig1Bv8M/AkFJZYGhiDIcTV25ON20wQZyQour0OT0pfNf8?=
 =?iso-8859-1?Q?1ET9OqX5kLBnh7fc/tNYyeOXJpJyspqhUc6rLrBMMtBQgcvWaLhuyBpJpm?=
 =?iso-8859-1?Q?gUIYpaYKIa43TKxw/4lfLIpMF5qJ2mDLodkppMHiGwH3g5alJ3fsKb050Q?=
 =?iso-8859-1?Q?VhagttqSxpsCyrZasqb+aGhk7jcF5sPBD7c49a/hjzatFegW40H9EV/9mb?=
 =?iso-8859-1?Q?1mWBR2Ce/zrYfXB5S8O8ESBAjteJsOxuJTS2jPktZtfgiFu4XCmycXnUKK?=
 =?iso-8859-1?Q?dlPzET2csgQwYVeU+jfMJc+4oJV0gsDr1x6e2IJ5fvxbSrbG25S9BZ0C6E?=
 =?iso-8859-1?Q?TWl68jbjqjxzz7brW/9f2LLWa+9OnhiSQFHGqoCP8m9p/rVI0itbQYJzIS?=
 =?iso-8859-1?Q?dQYK9xek4TGtFUCwe/F/49tNbdjWQYsQ6kh79/kGotpTc8o+dctZjc3HwA?=
 =?iso-8859-1?Q?ESMiGGfBZ9y0YdI0x/nyVcDNWeCv13oWw+UXQdgUja4IPeXELykDx9Nm2L?=
 =?iso-8859-1?Q?20Xtt33oBxojmNXrxraYR7m3BzuuJUoPhYLS8mbK44MAbWxZZz844f7OHc?=
 =?iso-8859-1?Q?Zo/SYHFtTgbNJs4cHKRTnCQOwvcns8sN8FwX2rUM5nStnGvMZohYXDHQ9C?=
 =?iso-8859-1?Q?7mozkIU00ErFwxVbNhQqcIVZ/s82iC7vgl0M9En9vPtuECNBIojvU8KuDO?=
 =?iso-8859-1?Q?+oOIGwoyI/7Vx0i8BS5Vmr3L9XBVrJy0hZVYy5yICYkP+S5m2ZUv239HbD?=
 =?iso-8859-1?Q?qOXkNHhMN3iiMJoBdSVOZ/2YJzkWXjkyYfewyaKzR/kOmzuDicqjAlXAIQ?=
 =?iso-8859-1?Q?ySFzN2O9Giy8GwWBngZT0dsJzDhr2TagalwC4aZ81YTtb1u30YBDNnXyKk?=
 =?iso-8859-1?Q?soqJxkqE4ChrtfVyNHpFfxOvoe3V2GMfX5PoWpUTtiT8mupVm8TSfqx7L8?=
 =?iso-8859-1?Q?zaF5azuK68DrCjkkm24QFILRyyXFpYIew1p4kRMW0DIqmecppqKYqTbdlX?=
 =?iso-8859-1?Q?f61d9aTlq1Bcp6luYdYytI5KBzZIOtLMWIJJa9ZRScVipZf+W9Ov5q0da0?=
 =?iso-8859-1?Q?lBjKGAK0oAFlxDCM58Lr24YwTBPWTJT+NrEcexDrGVCcj/t6jNSApcm0bf?=
 =?iso-8859-1?Q?7tj+jq36xHrLzI3S52P3R19bRSsUkJva/fB8V7TVVY4/Fhyc2B6LQP8Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0934744-5114-45eb-05b7-08de2e91ec58
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 15:22:20.3232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YvYp0+NGmGiZq/NgVgc3+ueQx3jwNO5yVjR9mQbk8hC6bglMYIco2OSqduB1zJM4uqvcCJGE5xOl6h9H05HxFAXsnion/f7M3U9m9ywYGN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10087

From: Grygorii Strashko <grygorii_strashko@epam.com>

1) arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
2) add generic domain_clamp_alloc_bitsize() macro and clean up !x86 arches
3) move d->arch.physaddr_bitsize field handling to pv32 code

changes in v3:
- added tags
- changed patch 3

changes in v2:
- split on 3 patches
- move physaddr_bitsize in struct pv_domain
- make minimal style adjustments as requested

Grygorii Strashko (3):
  arm/ppc/riscv: drop unused domain_set_alloc_bitsize() macro
  xen/mm: add generic domain_clamp_alloc_bitsize() macro
  xen/x86: move d->arch.physaddr_bitsize field handling to pv32

 xen/arch/arm/include/asm/mm.h     |  3 ---
 xen/arch/ppc/include/asm/mm.h     |  3 ---
 xen/arch/riscv/include/asm/mm.h   |  3 ---
 xen/arch/x86/include/asm/domain.h |  8 +++++---
 xen/arch/x86/include/asm/mm.h     |  8 ++++++--
 xen/arch/x86/pv/dom0_build.c      |  7 +++++--
 xen/arch/x86/pv/domain.c          |  6 +++++-
 xen/arch/x86/x86_64/mm.c          | 20 --------------------
 xen/include/xen/mm.h              |  4 ++++
 9 files changed, 25 insertions(+), 37 deletions(-)

--=20
2.34.1

