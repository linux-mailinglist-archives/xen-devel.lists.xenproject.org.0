Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DF9C3D971
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 23:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157271.1486110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH8RB-0008VW-KY; Thu, 06 Nov 2025 22:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157271.1486110; Thu, 06 Nov 2025 22:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH8RB-0008T5-HZ; Thu, 06 Nov 2025 22:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1157271;
 Thu, 06 Nov 2025 22:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oVY=5O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vH8RA-0008Sz-31
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 22:26:36 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6eba8f0-bb5f-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 23:26:35 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB6741.eurprd03.prod.outlook.com (2603:10a6:20b:23c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 22:26:31 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 22:26:31 +0000
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
X-Inumbo-ID: a6eba8f0-bb5f-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLi1OIYpeKi9Rdq752RoM+Mt+WsPNTGNFnTtzkAuQzZrzZTW+t0iApMfqYvYfkhdI9iqe3nMEZO9mxfmYv8smaKcY5Ar8Ylr2cA3dVwKuAZbPBzl4M1l44T+r05BfPEexjfBY7CQ9AemkjcDRdFQ+jcUG11p9XYeStpyAWQe0EhyoJ8l34vjL3j2zQBhW9FKEb0fAJMkxosAsPzWvQ5CfoHd4er5QtLd6XMkEAmuuh+Pqsd6up+H5EMuNQjS4KXS6VxI4XNupmCLfitg/W89VQ4/FsCcyyZ1qGCr+4j7UZJTE3kS0e9B/q19V5hBMv7iu7higo8FAp7kKVgshmZqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxB9zLfi6wuogk8pMMm18vfwQYKMZJW/VRp6Bnwao9o=;
 b=p4TDTZnKSm9Ls8/lgmGGUn9sRLSimlG0DAZqvJnB+Htg8QbTx5iIq2leBX5xZqhQPL58z6wfZOpJjUEXIb3gj5yjxeeok5LnhmttJgmmC0TDmk8sWdD2SPGaZZtvjvY9XkVi4Kr+VlfTtu+Ww9k3Lcu3D5iMGf3mI5maHZsVHlRT3TnBH3khxX2MFdWVDSNL7Jg9AMCAwNiS3tKk/ayg4yW7+j/H6xX/Z47d7M4ucwzeyoMabhfDpHiM1Fy7A1DxCZpcmKyCC8sRfrEWQHPBpFQW1yxn3YPy/eX7xHSNHidJefJBC4UKaph72wVS5dCKsyCWzrc6VJjgMIMx+YPzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxB9zLfi6wuogk8pMMm18vfwQYKMZJW/VRp6Bnwao9o=;
 b=On/8ODfXGaXrtvOcW7rZYk6P/MhlSGOf7U+Xr91KwpO5qqV54KERx5GsBz3I8q9/67MLB4+WlGyKr47sqA0Ambf0DGu6k/4HcwfjzN94VlQZPVAz4U7dmeRR2FRgUwmcsjuN7ZDpBNWHOd91vMs3dcc4MilQIxB36pNGOvh/IAlc22CTEE9E2QC9GbtqX1hug+D+JwFR0LWWP2n2zVqEa/UyGNCzLh6YYJYtWCQ3Ef2KMdm1hdkrZl9rePDRpSUXrjQ+k/NdJJf+/78coCZ0f7PiJQDz2HVAWgkTvypV2pnOZ7BtzFiq89ozzq44wyKd0ARoW7uqTN/rVVvrZXPpCA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>, Teddy
 Astie <teddy.astie@vates.tech>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] xen/x86: guest_access: optimize raw_x_guest() for PV and
 HVM combinations
Thread-Topic: [PATCH v2] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
Thread-Index: AQHcT2xm+kC+B40bN02/oMva+AgRcg==
Date: Thu, 6 Nov 2025 22:26:31 +0000
Message-ID: <20251106222630.2777457-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS8PR03MB6741:EE_
x-ms-office365-filtering-correlation-id: 44ccbb43-9c0d-4908-4c49-08de1d838959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?n6748lJm7Cydj9dW6jlHHha+3BcqdVrh83S0p8A4d5VEkRFm7pBMj84CMv?=
 =?iso-8859-1?Q?/LzIMxNoudTlNcA45bjAeKJwZmqZm4qZjfuwoKCcEI5tc5N9WuHrkbcPg4?=
 =?iso-8859-1?Q?o/J3KXCZEIpHbxqlaHnW2OCIOpbSEFH7UFLst3uR4DLJ0Q5RhqLak8NBId?=
 =?iso-8859-1?Q?rgODEZN453CMxsomPdjmjQEuGyfgZZgzTLGWnqp9gKLxN0Co45nm1vSwRh?=
 =?iso-8859-1?Q?tyqK48RNmWWXCeOqydCCPjRnvgw1nbnM1evtvBIxR6gmZPFIrlE8C0R2uH?=
 =?iso-8859-1?Q?iGkC28eao3a+Pp6lOaJ+hB4Q/ziEW1UtjsufeF/y9vuUqWt2YqglpIlGi9?=
 =?iso-8859-1?Q?cKZeqvtxaHlaVZBBZuQ4Rz1fxXibmgALNw41mNDSEuZsu4uxxsCdi9YRsb?=
 =?iso-8859-1?Q?I6WgC1dpofH/0vRtPvxj/JirprQ1E+M2Jnah8HIWQqgRYKeCgz8Z0cLNFd?=
 =?iso-8859-1?Q?4HX03P7DjFypesaG5Mk/exQwv4cYuSnwC1UOKS4T5ombZaZQ7A5LE+FbwA?=
 =?iso-8859-1?Q?ugxuZsr3n0uJn3B7Jlv3wBJiijtP+fMyD3jT0SysGOKBXYL/8vp0g1OEnp?=
 =?iso-8859-1?Q?OvFEMvGKRYljED+Drr8V98EcGTmSIQ/P4n8lvHu9ILkojuKT8luYDveVcO?=
 =?iso-8859-1?Q?NyVzRy3GfBbfRkDy++jPZx/YcPKbgGcqIDKkfCr7seHMeG5nnHjkJ4jTIg?=
 =?iso-8859-1?Q?Lruj1pSxHHMPQ5/+p9EhCyYfEP8D+D+jWTIztqLxTRBe/ZkrAjzKUQsyFQ?=
 =?iso-8859-1?Q?S+c4ZvPROaj9L+EDQTFG2f8Jn8GUxq8pY3eFRivpL4kingspaH7FY9f4q3?=
 =?iso-8859-1?Q?/zClznva80fkJRQ6212LZqzxbod8Odhn18OvVflLm1M8dzdKEKWOkhCYyN?=
 =?iso-8859-1?Q?8cO8BR7btenoHi92aTpc/u3kF7qg5O+2YRR4NvdhjXVC1bNX/0Fbdab5f4?=
 =?iso-8859-1?Q?J+0AS+QEx+HtQR4HmCvmSQAJqbV3t1s5f+MMriIBq25a0pA5KMIK1Kec/9?=
 =?iso-8859-1?Q?it66uUfNspl22Frztzj9M1yk7RbumddGFgvH4EGKjMlq9Z79dYLzmJ6nfj?=
 =?iso-8859-1?Q?eL2DVe4TSvYsGD2+2pqrTH34gYTe7VCDMbP70EYiX+V9qq2fX6LNLqq44a?=
 =?iso-8859-1?Q?XwW+a46DCm3sYW213201AZ6tKtWaiyvBZasqsQ5iVWOkk2nspdUVhA6p/y?=
 =?iso-8859-1?Q?J8XmySOiz1GdgkF+u4EAkqTqi6B7+OCLnwwSdBH7mCZciSNFii929U9Sau?=
 =?iso-8859-1?Q?AI0lZ2AaNOar0EazX/nNmzTUiOYHrxoJlEnNAkCUvxMmKfFTDMhbO9vKGb?=
 =?iso-8859-1?Q?7EPIldOjeJquF8a32PkqcEGpA0JK5OfrD5iSaTj8Cd8NzQ/09zj8Oj2+sQ?=
 =?iso-8859-1?Q?Wo1nvnkWxRyH+paKQNLVGLi9rruh+hSbN/5aWhvfBRPghsC+ULHCk5xsJX?=
 =?iso-8859-1?Q?b+dzP86hSqX0XnSoW5ad9Ooeefre3Z/DAsiFNZooVhbpOkaiXqjDAXgpjh?=
 =?iso-8859-1?Q?82gFkoVJFW8gifdIFVuqntjvLc7N/D/NPJHg8V4FxpuNA9/5GhyllV4kiP?=
 =?iso-8859-1?Q?R0GbbhzJO6CWC3+Ns3BwYI/zBDa5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?w3Ob6j9MvjqbTmKcoQWzy81i4kf7fbH1/otIL4FDgPrkEUXIxjZBxq8h2+?=
 =?iso-8859-1?Q?DBLn73YPCwX+t4hU7fZCcpCO/H/gQA81d0MzYgJ1h7XDjEaEeyLKHZ221h?=
 =?iso-8859-1?Q?yP0GhhqUQjkA/Dk62ovW+sRlTvm7b1uhb2EfegiyVapRL4xro+bGT71D9m?=
 =?iso-8859-1?Q?/dYqQdfDqhJcSPOfcqMHPWMmKRHzQiyouTEBG2edXzeDf+gCoJougMmgbk?=
 =?iso-8859-1?Q?aDVoQULq8BG/+Z4bONwE7UCbrYlb9X22MAVi0SfRoGEzauzZuYoG30aMFo?=
 =?iso-8859-1?Q?Nw2UdMiQz37xgKalv1CShu8cR5JKLVjE7jlnhjVSsbU5Oe9yONa321HHoZ?=
 =?iso-8859-1?Q?5dpOaNCbVouULiMan7OS0nC67mc7JRObq0FnnIrZnZtJ/XOGaUrCqGWXKf?=
 =?iso-8859-1?Q?NoD+IO89tFbJu+rv3bkaGDho4OKJxRi8kfedo646SIfitMgZXFDXarhrIg?=
 =?iso-8859-1?Q?SmLDDiRreQMQJUMz9bYroEaI1MPreQHqtnLp+M196BNPM+IYL+f2MRBY0e?=
 =?iso-8859-1?Q?hHqSKAawI2/uzjbwMN5coT13dOAf8wIU6S8w60u4A+jnVxUMLUiFH8dLg4?=
 =?iso-8859-1?Q?XbP8RW68kb7gUCjfnXNFdfOiGzt2qVPT8VeRsT30Xm88A6OmYAyT2dzOGV?=
 =?iso-8859-1?Q?sRvV6LFtSygfRVOwsiqQemp2MCceNWc731agjommXjL2ilRa/oVQm9U1m+?=
 =?iso-8859-1?Q?qrJieKln1kPC9sKtsTu/5kYdl+pxzwq/qurT+t1tRKd9++/WKAws7tdekO?=
 =?iso-8859-1?Q?OG7Pzl4zXwRqMoO3ymiKLeI61IuEIT72S9qFb6cpugZT21lSKznfpSONR8?=
 =?iso-8859-1?Q?/petq0l5JWoJ3c3wRS1gbTTCAbPyIQh6FIEQbTJh27DRgTm+LFCxp4EYbe?=
 =?iso-8859-1?Q?SV0DRZg8Glt6h1NIp2lISOQu9VvNiC9g/ekwZUCYqR5j7u+P+ZIOs1h0zw?=
 =?iso-8859-1?Q?BBUaIBMW63uOU7y8GiY6EKd1mVcsw3lhFxCtzVfX41iF0sbAzW0KEXg8nk?=
 =?iso-8859-1?Q?xzrU8vbqJHeoTFwhrQR6IBFSbS8k8CvG8DgQ+RkHuEma8pMdFPUMucwSe2?=
 =?iso-8859-1?Q?d/SKBkM4z0Mz/8V9p8SbMVdOdn9OUnV/PAKoTaOqbz5dkTPC2nCe9z4F1T?=
 =?iso-8859-1?Q?vuvfOmS6+MvyccNbdytE54qRVHpSiOWliyQiHfPfdWLuIguEQYnBbvqpqZ?=
 =?iso-8859-1?Q?SlMmNi+dZIDQPJytB6asrVB46MdMdtr2h+FK0YMInTKU1P6nlS9epdmlXE?=
 =?iso-8859-1?Q?ef8F36bfkDRLcplaBsW7neE/gpuXt03e/RQZPV6toeDe+Y2LGapq/+92vb?=
 =?iso-8859-1?Q?EpgeROQL636SHpp2i0g4wN/Q8jezh9TysBW9Pc/QFvt/VgRWilQLWM3Ndv?=
 =?iso-8859-1?Q?d8aR7i3VFLv/FGLCb5W15WhzIOqbo8ihJigQ/V5HVUN8vAaCB7emjEceV8?=
 =?iso-8859-1?Q?TAhfpWe7w+zQTwNhrTaZUttj/pyq6ETyPbkc0nTdVtrkbADh5qTzJ7qCcB?=
 =?iso-8859-1?Q?vVMmFrgSMyADRR38rADkuS6az/AbUsIVd8ZNXaqczStwNDAeOsCeSKsAI8?=
 =?iso-8859-1?Q?2y7DtCGVIyI3lISgCZALlM7kIeJrc7f9w8ZOiQYU5Bk4z1rZI96bRZktgU?=
 =?iso-8859-1?Q?96QTjE6gq2qbQdeR2TVlhnDHMriGUli/yqfsuYtjtfO5V2PQmFvEbQXg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ccbb43-9c0d-4908-4c49-08de1d838959
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 22:26:31.4838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2WANFG6ehfmLDjC++Hmu2/DLhz/bCjLwQLt2XLnjYzRmwU1Ou9OOeVpjtmdZNJSSqd8TPuso5PbkK1ZTO9UH4M5qkQ2XCVuqYQKgKihJEY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6741

From: Grygorii Strashko <grygorii_strashko@epam.com>

Xen uses below pattern for raw_x_guest() functions:

define raw_copy_to_guest(dst, src, len)        \
    (is_hvm_vcpu(current) ?                     \
     copy_to_user_hvm((dst), (src), (len)) :    \
     copy_to_guest_pv(dst, src, len))

This pattern works depending on CONFIG_PV/CONFIG_HVM as:
- PV=3Dy and HVM=3Dy
  Proper guest access function is selected depending on domain type.
- PV=3Dy and HVM=3Dn
  Only PV domains are possible. is_hvm_domain/vcpu() will constify to "fals=
e"
  and compiler will optimize code and skip HVM specific part.
- PV=3Dn and HVM=3Dy
  Only HVM domains are possible. is_hvm_domain/vcpu() will not be constifie=
d.
  No PV specific code will be optimized by compiler.
- PV=3Dn and HVM=3Dn
  No guests should possible. The code will still follow PV path.

Rework raw_x_guest() code to use static inline functions which account for
above PV/HVM possible configurations with main intention to optimize code
for (PV=3Dn and HVM=3Dy) case.

For the case (PV=3Dn and HVM=3Dn) return "len" value indicating a failure (=
no
guests should be possible in this case, which means no access to guest
memory should ever happen).

Finally build arch/x86/usercopy.c only for PV=3Dy.

The measured (bloat-o-meter) improvement for (PV=3Dn and HVM=3Dy) case is:
  add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)
  Total: Before=3D1937092, After=3D1906210, chg -1.59%

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
[teddy.astie@vates.tech: Suggested to use static inline functions vs macro =
combinations]
Suggested-by: Teddy Astie <teddy.astie@vates.tech>
---
changes in v2:
- use static inline functions instead of macro combinations

v1: https://patchwork.kernel.org/project/xen-devel/patch/20251031212058.133=
8332-1-grygorii_strashko@epam.com/

 xen/arch/x86/Makefile                   |  2 +-
 xen/arch/x86/include/asm/guest_access.h | 78 ++++++++++++++++++-------
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 407571c510e1..27f131ffeb61 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -71,7 +71,7 @@ obj-y +=3D time.o
 obj-y +=3D traps-setup.o
 obj-y +=3D traps.o
 obj-$(CONFIG_INTEL) +=3D tsx.o
-obj-y +=3D usercopy.o
+obj-$(CONFIG_PV) +=3D usercopy.o
 obj-y +=3D x86_emulate.o
 obj-$(CONFIG_TBOOT) +=3D tboot.o
 obj-y +=3D hpet.o
diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include=
/asm/guest_access.h
index 69716c8b41bb..576eac9722e6 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -13,26 +13,64 @@
 #include <asm/hvm/guest_access.h>
=20
 /* Raw access functions: no type checking. */
-#define raw_copy_to_guest(dst, src, len)        \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     copy_to_guest_pv(dst, src, len))
-#define raw_copy_from_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     copy_from_guest_pv(dst, src, len))
-#define raw_clear_guest(dst,  len)              \
-    (is_hvm_vcpu(current) ?                     \
-     clear_user_hvm((dst), (len)) :             \
-     clear_guest_pv(dst, len))
-#define __raw_copy_to_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     __copy_to_guest_pv(dst, src, len))
-#define __raw_copy_from_guest(dst, src, len)    \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     __copy_from_guest_pv(dst, src, len))
+static inline unsigned int raw_copy_to_guest(void *to, const void *src,
+                                             unsigned int len)
+{
+    if ( IS_ENABLED(CONFIG_HVM) &&
+         (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current)) )
+        return copy_to_user_hvm(to, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return copy_to_guest_pv(to, src, len);
+    else
+        return len;
+}
+
+static inline unsigned int raw_copy_from_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( IS_ENABLED(CONFIG_HVM) &&
+         (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current)) )
+        return copy_from_user_hvm(dst, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return copy_from_guest_pv(dst, src, len);
+    else
+        return len;
+}
+
+static inline unsigned int raw_clear_guest(void *dst, unsigned int len)
+{
+    if ( IS_ENABLED(CONFIG_HVM) &&
+         (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current)) )
+        return clear_user_hvm(dst, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return clear_guest_pv(dst, len);
+    else
+        return len;
+}
+
+static inline unsigned int __raw_copy_to_guest(void *dst, const void *src,
+                                               unsigned int len)
+{
+    if ( IS_ENABLED(CONFIG_HVM) &&
+         (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current)) )
+        return copy_to_user_hvm(dst, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return __copy_to_guest_pv(dst, src, len);
+    else
+        return len;
+}
+
+static inline unsigned int __raw_copy_from_guest(void *dst, const void *sr=
c,
+                                                 unsigned int len)
+{
+    if ( IS_ENABLED(CONFIG_HVM) &&
+         (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current)) )
+        return copy_from_user_hvm(dst, src, len);
+    else if ( IS_ENABLED(CONFIG_PV) )
+        return __copy_from_guest_pv(dst, src, len);
+    else
+        return len;
+}
=20
 /*
  * Pre-validate a guest handle.
--=20
2.34.1

