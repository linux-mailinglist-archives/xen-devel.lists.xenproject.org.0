Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE479B52B78
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119649.1464946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcY0-0005HZ-LV; Thu, 11 Sep 2025 08:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119649.1464946; Thu, 11 Sep 2025 08:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcY0-0005Fc-I0; Thu, 11 Sep 2025 08:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1119649;
 Thu, 11 Sep 2025 08:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ApBa=3W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uwcXy-0004XB-QL
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:20:50 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 390e50a0-8ee8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:20:49 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9468.eurprd03.prod.outlook.com (2603:10a6:20b:59b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:20:36 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:20:36 +0000
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
X-Inumbo-ID: 390e50a0-8ee8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f31kazE/sanvu0MA5dvAsIS8MwlQtE9F4Lh755PvvUP3FoiAL2rU4ZaNNtzJXiRCvoMHH69kM3vy5dJqelmfpeFAwG57APzJA3S5UGfJgX1bmY6/BmOO5jzf6+S8LyTpg/j+m+TQscKQLxLRyoHTKj0koeujVBdIa+qz9h8Z6WTEs3OMD1Un8T9FzZBM/h56vpxPZgKjzG6Fa3RG32JB/1+EDpm8dt/Px5Gipgcv0eV7MQVL0FuCH85myY9HNtk0VRIEfq7bX8P2Q1HKtX4TfkEkBZ9PjlpFFXjh5rh7q3U7+pWniXlni2VSbX1EAIs/4jtPRuBYzHYTx/wT92vNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z65KxaMTQr4KAm8lPnNDYzfoTXixatyIXL79M+shcKg=;
 b=vDFOXOBJgGDKzHNYKeCnCB11hUEwgKYKIjVrOygjB/YcM9dfAXd+uLjPqOyayoDXk/V3aGRGvCaiM+x6dKoxSdcIT7fOc0V3JIIUhmIDUp7Fl2KdgP0vLdxvXMglwajGVMGLvXIEV1n27zdiFLn2Equu8F3/dgFrB1mfKMMLW9zROIgTYGm2/KcLJqHzN82z1ifwy9B7YFcJixOXHbtHFUsnvhZb2IkLqYqVu3pDwB/QobFBCr8N0t1GniddTRhZXSsvcmCV1Tq447Fc/E1hcfycsLXM0FWTfDmbMKTG9vGmAYszUyzOKy7d0LkXrJic8773yxWBwRUEtYRcBVw62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z65KxaMTQr4KAm8lPnNDYzfoTXixatyIXL79M+shcKg=;
 b=RYo+O7p5zcVUkShuPfkdLw6A5rvM4EpMlh9v/CfhL5Xr3N3Ep5ezPWD4LefzrnfPfBb9U2YfRZnWXGymBt/e5Mvm+boDy+DD10PkRx7sixU75v+Xm9wx/PkPnXgtYBD2wlRV5N3+CX7VKKSzJ0+T9rCt6mGP3ZJ4j+d23dA+ir9cjHV7XLyv1hj0bER8sqtWh2uFK/wDwdgLmW4G++E9ssgWV4Ln7ta1ICNOAkPHtuDdFxbf+1rZ9/dNKyH1coYcjq9KuXCIUGpI4ihR6z80SS78WFYz0sn/Kxmrzz9n3w0iX19I7HzjJ/dRnbuw5penFdXWVneYk4Qw/WWnd42K7Q==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/4] xen/arm64: allow to make aarch32 el1 support optional
Thread-Topic: [PATCH v3 3/4] xen/arm64: allow to make aarch32 el1 support
 optional
Thread-Index: AQHcIvTzIqcmf0LCqECkmnRAIM+hSA==
Date: Thu, 11 Sep 2025 08:20:36 +0000
Message-ID: <20250911082034.1326377-4-grygorii_strashko@epam.com>
References: <20250911082034.1326377-1-grygorii_strashko@epam.com>
In-Reply-To: <20250911082034.1326377-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9468:EE_
x-ms-office365-filtering-correlation-id: f2fbb5db-4568-4c2e-0791-08ddf10c15b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FZt/mBHoz3QVv2q9xZCw0KU+lIacH8r8SVUADSDXzpcVQnZmhEAi8Ry2d3?=
 =?iso-8859-1?Q?Sb0bYXupP41RB6B0YmU6cTlVPpcWLiHJiy0+WoZzrhJFHgMOU+O43VXjuw?=
 =?iso-8859-1?Q?3ZIGsli1s2OPH09XKTMGUGRnrg5xjutsqrr7/xz8sog/MAptU2rbrdBsUV?=
 =?iso-8859-1?Q?gm6AMcBGQhDq/x16tSDcwaGPbQibLC0JaI+97lM1t5iuFW5q252VTWFBsE?=
 =?iso-8859-1?Q?a390MNouUY8YXlyZ243tiFMDRHa3efTMoI23FPhbWCboUkRYo7laLr6As+?=
 =?iso-8859-1?Q?4B9MXWOQs6gBN9a8irGYmVagmztIO902GQXeUlkTCQEFuI70XGw8Mucrfj?=
 =?iso-8859-1?Q?7+KQJG1z7sP7f50b583h8BEHBaFSPRsJLa4bPRpZQ2y0uxb1D8SJphLvs7?=
 =?iso-8859-1?Q?nrYLsYgDb7+V3o2fKvUIAVkiBQ552N3uAjK+ZvtRqlxxLqLazkWZHdoi4J?=
 =?iso-8859-1?Q?e5r2bZznf9fdIRJp67kI/bvCh3BB/M1XeT2mWfHnQeMAjQDdVLllDZl2sr?=
 =?iso-8859-1?Q?++NBWE6HbMz596l2wdiQTfhrL8lrMwbgHNKSd6G4/aorwjf6lmNsHkhnSP?=
 =?iso-8859-1?Q?cL/CUo9bMRlZup+sobRd2ypnVi/K0wgiYXqhQygoQAT6cwxBPV2MDQPR1i?=
 =?iso-8859-1?Q?SYOAwyjgif5Wgbr094e2I4w12R0ffz6b8MjZQ+NrpvLSh3s3LEuiZup8fE?=
 =?iso-8859-1?Q?BVnctAAg98t0zS5mogcsUP/jv6CvHukuvoruSEavWO7dHSehVgBL+4cjR4?=
 =?iso-8859-1?Q?VQ7AhkIVT8rOXsEEAQ3vuzK2vk1v6ZE8WCbvUwlDnpJB71rp5DHtD3WY84?=
 =?iso-8859-1?Q?1ATDOZXxnKzzfwu5jsGqaD94WqcvmKbu0C3mBQlvuB0jjvOu05oLG+Kcjc?=
 =?iso-8859-1?Q?jc+EtZxqdPmRpGgWNLT0yX/jPhaJHfDY0dX4SDs8TqA6UEtnLqaaDVi1Yp?=
 =?iso-8859-1?Q?eLZ3tgpZZ4MPPLsx0VZMpwZUbcdHUJO1/3EKM41LZO6pceob/cMjuUmm8x?=
 =?iso-8859-1?Q?vUv2P1hLWxxIJhsFR124f7zmC6AJIehb9P+TwvVjT2siOc10lZ841EY3yU?=
 =?iso-8859-1?Q?MQsjnRUqJLjI2WG4LMJxKS0E/MSki93HiHDoFDt2+qe6OlzateKujVdtAi?=
 =?iso-8859-1?Q?7CnsFVdJr57P8j94fh63+rhxI9rHTwHY+cOoFxm1mz3A9FmgqQ30yi5Tey?=
 =?iso-8859-1?Q?v58eQvAQHtQr7D8kfdohfEECci/QwBlfzbvjSpaVFhEc+CphRy8MyjaCkw?=
 =?iso-8859-1?Q?UHVAqVyHc5VKDecA99LDjfru/Ck64n6r1cImO2iZN88FjOIY1B4ujv5Ov2?=
 =?iso-8859-1?Q?rHog/ykQcUKcMaHgheAnCYeaHdOWIOvwq+ZyxL9YlPKlBuZIINuJg1zhkY?=
 =?iso-8859-1?Q?UX2osmd/16aOPxOlQZBVM0a19y8+T9zHANmxJFmjnIOAsx4+n62a+69DxL?=
 =?iso-8859-1?Q?HwyB9VKDfCHtuEen97YtuhsZxW1HurobgDuTvULAim4aWmPTHah0IetMmV?=
 =?iso-8859-1?Q?e+4unSxzTJYHfnJptNVJD9suxsMd6NIKbcUZ88dMLiCQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/XjDFVAA5bI2LpvNPhSr42yvAWBuQ52zoCj7BcC/T/ORshhLH7wDVVZh2J?=
 =?iso-8859-1?Q?mrUvQaXOnxyMX+fbelVWIE4b7agdnuCZC43BW5g70zyR3JNFIzoBubLx9q?=
 =?iso-8859-1?Q?BBIDsMc332wFypXrj2iztrgjzlZl9x94tmXNqG1JTaH1ACt4HXp5ZBAVF4?=
 =?iso-8859-1?Q?oRxF2QXSPhTo/+t2eegKJ8LHJGr/aPxzROx9wGqH+SNV4MIiCDPZUhxndn?=
 =?iso-8859-1?Q?IYTP0oEjAtRiAZYS464lVFWv3mq1Ci0lAdj+MfwL5nhJeAeP/QJOTO6SQe?=
 =?iso-8859-1?Q?Hnji4LOC/keSnKAx7vpp/cFEklT6yzVqkpP20pHLtvgh7mWuPgSeiXMvWq?=
 =?iso-8859-1?Q?iPdBvRDiGHvgjK/gN9+TeJO1L8uPgZYQM5d41ci+smIgTiaTo0R3BCbQmT?=
 =?iso-8859-1?Q?6qy21CxFoplw+We1DAexlk3Tw9frzg/dn5v5CC8/wccmB6nAVm5zOvEPF3?=
 =?iso-8859-1?Q?Q8CK04el/zUpqw5W1unOILxnIbMCOb6rIz6neBY0p9nZ5395A/BZLVhGZh?=
 =?iso-8859-1?Q?M8ytTGza3owYcWMkq9d5RMuoqC9UEZFe42+LzN3mFGMSadObUmgVjB5/X5?=
 =?iso-8859-1?Q?ZHz9fOVtC5FcYx/0VO/rf407JyjjXpSyECVjTzbQ78kNKqMgm/DZbJP2vp?=
 =?iso-8859-1?Q?vaAlmX2o3G24qMpSbO0NM11LQwpbFZpS+qbQ30WRpAPG43KQiIA5yfC1vc?=
 =?iso-8859-1?Q?RebQ4ei2V2E6HIELDYMaVSPgLYLFXBITWZ5cKD8ARVrvzjoDxsGUWeSg6t?=
 =?iso-8859-1?Q?iqbwL/D4JHXvRoou33j22oy/kpPI9NavZTEbw7mWZsqu0awyLcEXrTIplC?=
 =?iso-8859-1?Q?C2ZGX7zHX6HRgCoQ2Q6xu6HHVBqN/Tfrw0gUz1j8J9cZHsuDrBH8vjU5LQ?=
 =?iso-8859-1?Q?UHiPBgf8ZOf3kCwQ7V/WNEcpndUCwBFLs8ZXiZUGqBLadvWVCIYYjb33FU?=
 =?iso-8859-1?Q?JbUzZyrtpE2wCTQ8wLF2Rqd2bJbFYp9lKNQqLG3wV7VUaplRnCDYj6fOoj?=
 =?iso-8859-1?Q?PjBxZMzz957krnjvywkUIMxX5tqLmRkdq3o9DJYxpDm+/WM67MuV/Gdh5d?=
 =?iso-8859-1?Q?KzNC7e/4trD5DhIlJR8Mq9dnc2ge4lEEBjhZFbflFlXQ+InNpFXkjYj+S7?=
 =?iso-8859-1?Q?LDrSR8358EYt3IhF8gWVmNxzBq9eitMB7otVYer24kHhOHZxrk9LGNADgG?=
 =?iso-8859-1?Q?RGrs+WXXSho4Gz4onqiBqloRcQFlzzoFhaAKGwHjoAg2HRCBCbXfUaWArz?=
 =?iso-8859-1?Q?djReQINhSRdYN6ABVQQiCmLhsdKg8WSS3R2JJc1uhZSctCRgKvluNSFI7J?=
 =?iso-8859-1?Q?ndyrDvRRw6d2q7i+iKFJCq8I0gsHyQU+e/ON+xkbuIZ/xa3tePl5r/7hzU?=
 =?iso-8859-1?Q?I3G5XZnLfVHOEwyCwQek9Y3T/HIgXaw50jvicHXSTdkQdyKHg8NF1CxdhW?=
 =?iso-8859-1?Q?rQ/Ec4pd5K045/EuVEktqrl9tqaihOGxA7kmWWZcDa/M/kdYXcFUh9VO5b?=
 =?iso-8859-1?Q?5Vgtpeq3JwLJ9g2bi8SqDxjmKSeu9RDTxuLAx9dks54M/vqnoLO6BYS9+m?=
 =?iso-8859-1?Q?6PpdVHD/R1doCH2pyxjOfd0Zn2sE1DNYnf54gjW+cjd50Qjolu7u1S8VUy?=
 =?iso-8859-1?Q?22L+/uOq+DxzbmXomdPyNWSEr5xmPnT/sk+Yx9ayrdNBHi/K+1LHuHeQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fbb5db-4568-4c2e-0791-08ddf10c15b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 08:20:36.2416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2RVB5thyNyxW+o/JvNw9FKA/P35BOCaLbLV9GioYx/zB2ByPEUqLFhKMRWdVa/noRzm0epgxP+eS6Mv5TJbfMIYPzmsoUU1P05xuQE4kJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9468

From: Grygorii Strashko <grygorii_strashko@epam.com>

Now Arm64 AArch32 EL1 guest support is always enabled and built-in while
not all Arm64 platforms supports AArch32 (for example on Armv9A) or this
support might not be needed (Arm64 AArch32 is used quite rarely in embedded
systems). More over, when focusing on safety certification, AArch32 related
code in Xen leaves a gap in terms of coverage that cannot really be
justified in words. This leaves two options: either support it (lots of
additional testing, requirements and documents would be needed) or compile
it out.

Hence, this patch introduces basic support to allow make Arm64
AArch32 EL1 guest support optional. The following changes are introduced:

- Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
  Arm64 AArch32 guest support (default y)

- Introduce is_aarch32_enabled() helper which accounts Arm64 HW capability
  and CONFIG_ARM64_AARCH32 setting

- Introduce arm64_set_domain_type() to configure Arm64 domain type in
  unified way instead of open coding (d)->arch.type, and account
  CONFIG_ARM64_AARCH32 configuration.

- toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 is
  disabled.

- Set Arm64 domain type to DOMAIN_64BIT by default.
  - the Arm Xen boot code is handling this case properly already;
  - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
    updated to forcibly configure domain type regardless of current domain
    type configuration, so toolstack behavior is unchanged.

With CONFIG_ARM64_AARCH32=3Dn the Xen will reject AArch32 guests (kernels) =
if
configured by user in the following way:
- Xen boot will fail with panic during dom0 or dom0less domains creation
- toolstack domain creation will be rejected due to xc_dom_compat_check()
  failure.

Making Arm64 EL1 AArch32 guest support open further possibilities for build
optimizations of Arm64 AArch32 guest support code.

The change doesn't affect on Guest's EL0 32-bit ARM execution state
support.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
changes in v3:
- Kconfig ARM64_AARCH32 use dependency from EXPERT instead of UNSUPPORTED
- drop code for "do not expose EL1 AArch32 support to guest in ID_AA64PFR0_=
EL1 reg"
- apply comments from Volodymyr Babchuk
- reword commit message to mention that patch affects EL1 only

changes in v2:
- use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 suppo=
rt
- rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with =
any
  initial domain type set (32bit or 64 bit)
- fix comments related to macro parameters evaluation issues
- do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
  AArch32 is disabled

 xen/arch/arm/Kconfig                    |  9 +++++
 xen/arch/arm/arm64/domain-build.c       | 47 +++++++++++++++++++++++--
 xen/arch/arm/arm64/domctl.c             | 12 +++++--
 xen/arch/arm/domain.c                   |  9 +++++
 xen/arch/arm/domain_build.c             | 21 +++--------
 xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
 xen/arch/arm/include/asm/arm64/domain.h | 23 ++++++++++++
 xen/arch/arm/setup.c                    |  2 +-
 8 files changed, 112 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5355534f3d5e..0289ebfe04f6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -266,6 +266,15 @@ config PCI_PASSTHROUGH
 	help
 	  This option enables PCI device passthrough
=20
+config ARM64_AARCH32
+	bool "AArch32 (EL1) Guests support on ARM64" if EXPERT
+	depends on ARM_64
+	default y
+	help
+	  This option enables AArch32 (EL1) Guests on ARM64.
+	  This option doesn't affect on Guest's EL0 ARM 32-bit execution
+	  state support.
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-=
build.c
index 3a89ee46b8c6..cb0afc9df19e 100644
--- a/xen/arch/arm/arm64/domain-build.c
+++ b/xen/arch/arm/arm64/domain-build.c
@@ -4,13 +4,56 @@
 #include <xen/sched.h>
=20
 #include <asm/domain.h>
+#include <asm/arm64/sve.h>
+
+int __init arm64_set_domain_type(struct kernel_info *kinfo)
+{
+    enum domain_type type;
+    struct domain *d;
+
+    ASSERT(kinfo);
+    ASSERT(kinfo->bd.d);
+
+    type =3D kinfo->arch.type;
+    d =3D kinfo->bd.d;
+
+    if ( !is_aarch32_enabled() )
+    {
+        ASSERT(d->arch.type =3D=3D DOMAIN_64BIT);
+
+        if ( type =3D=3D DOMAIN_32BIT )
+        {
+            const char *str =3D "not available";
+
+            if ( !IS_ENABLED(CONFIG_ARM64_AARCH32) )
+                str =3D "disabled";
+            printk(XENLOG_ERR "aarch32 guests support is %s\n", str);
+            return -EINVAL;
+        }
+
+        return 0;
+    }
+
+    if ( is_sve_domain(d) && type =3D=3D DOMAIN_32BIT )
+    {
+        printk(XENLOG_ERR "SVE is not available for 32-bit domain\n");
+        return -EINVAL;
+    }
+
+    d->arch.type =3D type;
+
+    return 0;
+}
=20
 #ifdef CONFIG_DOM0LESS_BOOT
 /* TODO: make arch.type generic ? */
 void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
-    /* type must be set before allocate memory */
-    d->arch.type =3D kinfo->arch.type;
+    int rc;
+
+    rc =3D arm64_set_domain_type(kinfo);
+    if ( rc < 0 )
+        panic("Unsupported guest type\n");
 }
 #endif
=20
diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 8720d126c97d..46eb3083cfad 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -13,6 +13,11 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
=20
+static void vcpu_switch_to_aarch32_mode(struct vcpu *v)
+{
+    v->arch.hcr_el2 &=3D ~HCR_RW;
+}
+
 static long switch_mode(struct domain *d, enum domain_type type)
 {
     struct vcpu *v;
@@ -21,14 +26,15 @@ static long switch_mode(struct domain *d, enum domain_t=
ype type)
         return -EINVAL;
     if ( domain_tot_pages(d) !=3D 0 )
         return -EBUSY;
-    if ( d->arch.type =3D=3D type )
-        return 0;
=20
     d->arch.type =3D type;
=20
     if ( is_64bit_domain(d) )
         for_each_vcpu(d, v)
             vcpu_switch_to_aarch64_mode(v);
+    else
+        for_each_vcpu(d, v)
+            vcpu_switch_to_aarch32_mode(v);
=20
     return 0;
 }
@@ -38,7 +44,7 @@ static long set_address_size(struct domain *d, uint32_t a=
ddress_size)
     switch ( address_size )
     {
     case 32:
-        if ( !cpu_has_el1_32 )
+        if ( !is_aarch32_enabled() )
             return -EINVAL;
         /* SVE is not supported for 32 bit domain */
         if ( is_sve_domain(d) )
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 1a8585d02b45..2e084dac0a7f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -792,6 +792,15 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+#ifdef CONFIG_ARM_64
+    /*
+     * Set default Execution State to AArch64 (64bit)
+     * - Xen will reconfigure it properly at boot time
+     * - toolstack will reconfigure it properly by XEN_DOMCTL_set_address_=
size
+     */
+    d->arch.type =3D DOMAIN_64BIT;
+#endif
+
     if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
         goto fail;
=20
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 89448fb4756e..ce7053ba6d59 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1881,19 +1881,6 @@ int __init construct_domain(struct domain *d, struct=
 kernel_info *kinfo)
     BUG_ON(v->is_initialised);
=20
 #ifdef CONFIG_ARM_64
-    /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain =
*/
-    if ( !(cpu_has_el1_32) && kinfo->arch.type =3D=3D DOMAIN_32BIT )
-    {
-        printk("Platform does not support 32-bit domain\n");
-        return -EINVAL;
-    }
-
-    if ( is_sve_domain(d) && (kinfo->arch.type =3D=3D DOMAIN_32BIT) )
-    {
-        printk("SVE is not available for 32-bit domain\n");
-        return -EINVAL;
-    }
-
     if ( is_64bit_domain(d) )
         vcpu_switch_to_aarch64_mode(v);
=20
@@ -1991,6 +1978,10 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
=20
+    rc =3D arm64_set_domain_type(&kinfo);
+    if ( rc < 0 )
+        return rc;
+
     return construct_hwdom(&kinfo, NULL);
 }
=20
@@ -2002,10 +1993,6 @@ int __init construct_hwdom(struct kernel_info *kinfo=
,
=20
     iommu_hwdom_init(d);
=20
-#ifdef CONFIG_ARM_64
-    /* type must be set before allocate_memory */
-    d->arch.type =3D kinfo->arch.type;
-#endif
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
         allocate_memory_11(d, kinfo);
diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include=
/asm/arm32/domain.h
index 1bd0735c9194..30e8818ff2ae 100644
--- a/xen/arch/arm/include/asm/arm32/domain.h
+++ b/xen/arch/arm/include/asm/arm32/domain.h
@@ -3,11 +3,23 @@
 #ifndef ARM_ARM32_DOMAIN_H
 #define ARM_ARM32_DOMAIN_H
=20
+struct kernel_info;
+
 /* Arm32 always runs guests in AArch32 mode */
=20
 #define is_32bit_domain(d) ((void)(d), 1)
 #define is_64bit_domain(d) ((void)(d), 0)
=20
+static inline bool is_aarch32_enabled(void)
+{
+    return true;
+}
+
+static inline int arm64_set_domain_type(struct kernel_info *kinfo)
+{
+    return 0;
+}
+
 #endif /* ARM_ARM32_DOMAIN_H */
=20
 /*
diff --git a/xen/arch/arm/include/asm/arm64/domain.h b/xen/arch/arm/include=
/asm/arm64/domain.h
index 1a2d73950bf0..99c6c97a8057 100644
--- a/xen/arch/arm/include/asm/arm64/domain.h
+++ b/xen/arch/arm/include/asm/arm64/domain.h
@@ -3,6 +3,10 @@
 #ifndef ARM_ARM64_DOMAIN_H
 #define ARM_ARM64_DOMAIN_H
=20
+#include <asm/cpufeature.h>
+
+struct kernel_info;
+
 /*
  * Returns true if guest execution state is AArch32
  *
@@ -17,6 +21,25 @@
  */
 #define is_64bit_domain(d) ((d)->arch.type =3D=3D DOMAIN_64BIT)
=20
+/*
+ * Arm64 declares AArch32 (32bit) Execution State support in the
+ * Processor Feature Registers (PFR0), but also can be disabled manually.
+ */
+static inline bool is_aarch32_enabled(void)
+{
+    return IS_ENABLED(CONFIG_ARM64_AARCH32) && cpu_has_el1_32;
+}
+
+/*
+ * Set domain type from struct kernel_info which defines guest Execution
+ * State AArch32/AArch64 during regular dom0 or predefined (dom0less)
+ * domains creation.
+ * Type must be set before allocate_memory or create vcpus.
+ *
+ * @kinfo: pointer to the kinfo structure.
+ */
+int arm64_set_domain_type(struct kernel_info *kinfo);
+
 #endif /* ARM_ARM64_DOMAIN_H */
=20
 /*
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7ad870e382c2..7e6e0541e024 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -530,7 +530,7 @@ static int __init init_xen_cap_info(void)
 #ifdef CONFIG_ARM_64
     safe_strcat(xen_cap_info, "xen-3.0-aarch64 ");
 #endif
-    if ( cpu_has_aarch32 )
+    if ( is_aarch32_enabled() )
         safe_strcat(xen_cap_info, "xen-3.0-armv7l ");
=20
     return 0;
--=20
2.34.1

