Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C00C2700A
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 22:21:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154549.1484491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEwYU-0001Jq-A0; Fri, 31 Oct 2025 21:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154549.1484491; Fri, 31 Oct 2025 21:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEwYU-0001HB-6x; Fri, 31 Oct 2025 21:21:06 +0000
Received: by outflank-mailman (input) for mailman id 1154549;
 Fri, 31 Oct 2025 21:21:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2XW=5I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEwYS-0000kZ-IE
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 21:21:04 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8077bb82-b69f-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 22:21:02 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB11113.eurprd03.prod.outlook.com (2603:10a6:150:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 21:20:59 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 21:20:59 +0000
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
X-Inumbo-ID: 8077bb82-b69f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOa0VFJ4UGmvW3yeGFWU9MBE0J05M1VaTGzeQlfrsBcn6cMMMgwmdDKYmwu2vKR021O6PfAjMiS8B9EDFFDXnIiVyQHbyV/pJZHAQ0Uvkhnu9s6omCuSIsXGk7EPZxoN9l6cpYYaueZcMT1KXRzVnZGA981oM6ctfqlOtK30Y0UxYaU2XJgppm/gVAWYRo0jBO5/O3uToGFpXFssSxD9bTIWxDNgCC/ta7z66aRDOhX2A0gXqEO9WtAKbn+hHz2T7d7ia+QRmA8pUTP6v6JCMk+iADTsK/YyYQlg+URpusAxVCIIEiFa0r8wxc0GyzWLGxXs+rwouDG9cMnNoMBOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yql+YMp6LxiHTlTuLO8u+TJCsTRo7LRRKzLhNdZ2bxc=;
 b=ip0g2lNIfbqf98Re8HjgT3LITn/2JUm+Pzgrrk3t6z+kTaF/PUM0xslA1AyKEyLGbXx8dRscdytFRBiNOVydOPFZ/MyrLV321nHHZ5CzJPEk0bfRGdj264VofFHsjA7gQTDPNJYb57m6q7mG14s++NdtZjCtK6NWVB4Y8fylQkujEV8fl/73jYlkQtK37th+fKsaOJ1q/Aj1IAIeZYFre/PxvEILT16byDs+18YxjNtwLMOsjg0m3ncQeBaC/Ox9+NbFJmHz38OnC0248RLsGBQcVM3XXKnRylmx1+44RIpZkYapaxoE1VBStmWvpq072hJwkBbFtCmPwlCEozlR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yql+YMp6LxiHTlTuLO8u+TJCsTRo7LRRKzLhNdZ2bxc=;
 b=ErUOv7npNmK78zEd85adpFBED58VSbqyemK41anQylYIy2jqq3XYFqd2ztoCffQHyxhLlII2dE3iDXb089nbbF1GNjpaaqpktc0a4RjZ/cnRDuu965E9tkv7tmnfuE74AWCR9+mqKfbOYLP4A34p5vUGPlySvGcgUrxIoSeZ1nHp+KlkWZ20GeUHxLt5FrhcReooMXIKEqAKLJNv2l0YavkBfMxH2HdNsCuZMm+t6M23CmuXbhPja9EGeOK7Fi2d+LkIzpLFvoigsAkxC+ZJ8IaGRsGubldOf56sadh36J6LWFw38XjcVLy2uENdqHe2hcvCOcPmu2m2pkTaxp9iJA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for PV and
 HVM combinations
Thread-Topic: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
Thread-Index: AQHcSqxAdPIGSrQrCEKoBzZqiDZ5sw==
Date: Fri, 31 Oct 2025 21:20:59 +0000
Message-ID: <20251031212058.1338332-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|GVXPR03MB11113:EE_
x-ms-office365-filtering-correlation-id: 69b0d514-a2ef-4a95-71d1-08de18c3633a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SiH9780GgTq/+wpreRxxGHpnFt1YWOZAZPV3nmi0rNorOlplNqxHGXcxMB?=
 =?iso-8859-1?Q?G54k4Y1zHnNbGaUq2moG5ZXngp1eXBFDuvUwLsY/aFHpJ3IJ9hVpEa8+Hy?=
 =?iso-8859-1?Q?xqRvqMYRlyDYkB8UCcm5DoUaM3Qm8Sg3ccxHJw5tqMnnuGVXgfN4/i94jF?=
 =?iso-8859-1?Q?hpHv7RIjixd4vzVaGWiF8R2YFOqu2PanBwUnEPZHYbCLtBIjdSYY0pYpIE?=
 =?iso-8859-1?Q?zs5s83L+y+CF4BA+7Rxn4OKOiliJCR9myqi4b0Ee4b1MztOaeC6eHMaZIq?=
 =?iso-8859-1?Q?m7YdjTb/2nTv8of0DukidDsqG60Sh1PH9smSE2gOcCNaKe88OqpAHDsCeq?=
 =?iso-8859-1?Q?jgRR8ifKPcl9ab77ylPN3nMOYJ2+hCJZp6VLFaG5RGRSE4atyUeLzBHwDi?=
 =?iso-8859-1?Q?nMs9LgonB6LBAUkCW+W4tAcrUQVm+xq4oxBxMyi45Lz1JSESoXG4fbmHhp?=
 =?iso-8859-1?Q?rd5xxTv7O114N5jI+6NqCi3Hm6j7tzFZ9x0471ArHIyrvD5M1Wz/z9yvz7?=
 =?iso-8859-1?Q?VZuVf60oLvehKAUT/6Z7mdlj25AWgwFJw5Y396G//hhEHvhxJBZlj7Mgew?=
 =?iso-8859-1?Q?LGIfUvcKj3DcfHpNqvGLY7GCJfhmFNtU7giZFmH9LqXOOvp//La5cQj0eX?=
 =?iso-8859-1?Q?OPQI+Kzbw9gyb8eQ6njE0mcrHwVOGKTBQgbwZA0qZjcb4JPTWUIY32rhTv?=
 =?iso-8859-1?Q?iQOGQDY9knCIuAEgOYW5m4Cnk+Zz2j0aXsTtM+UK5XxQnda8KxqPKXh0we?=
 =?iso-8859-1?Q?My0zz/yvpMELMolnLunXmOZrrGAq8UvnL9g6hUqMzNJTkg0zSKBMIRK6Fq?=
 =?iso-8859-1?Q?JSgbXk/rlqZYxIIYtH5CDK6icWW5Yxv+ITEyVJpmuZBetB6hxzguCNWkex?=
 =?iso-8859-1?Q?yS3d33XF7vf+BZSisxm2QYkur8Od0X1toMvzbwF1TjkvTHFoBxoDcNwIfR?=
 =?iso-8859-1?Q?JrrmuXkdtHDYSZneTWkgV9izZppfhqhOlnvxhEWO8tmFXUgbYM7rABjOvt?=
 =?iso-8859-1?Q?a0vEulDD3XUg/SU5ShiCSHn16ZqVmS+/NpbQpOiFuen8UQiM0FO/tZ4sMG?=
 =?iso-8859-1?Q?CkRninjvL24q5dNMSYDN1BTaYwdcNLpO6Igd0OBm6Hz35w0p32HuY4BFny?=
 =?iso-8859-1?Q?22lkYcUzklg47JSnJoeWaiPhcdT0E2PA3XQKZJCkOLlrR8tKjoGpMJhx2s?=
 =?iso-8859-1?Q?OEVAteb8WJl7TnoM69jZN53YwTA2lvXf7q7aQvLoIwOIZ4nEygYZeEb85q?=
 =?iso-8859-1?Q?4D9pGgrcdkjlcjLv8qJmlaZexGEqyf+HBBoSLbGiNOSSXkpZEjv3ken6rb?=
 =?iso-8859-1?Q?Yy7JpPX2tI3zh+yBMqpr8g2EGoPe1JtejVwLTpEQrMO3IwwmRFdfCxddDA?=
 =?iso-8859-1?Q?gmGEPfvz2+YOZGSvLP0eyEVdPBNFzbyCr7JQPCJ1igxmIsoXrtolAZBHMS?=
 =?iso-8859-1?Q?KVIJ9XaxA5FevR0gXGjuqD5I/jLXXQLdHhPADC1BEQB9R2eiMB2+fohEd6?=
 =?iso-8859-1?Q?RdwvTwxBnbcY0W1PsY3vRnewGYSL8EoIqy2O/HT56cHoX0JniS7BIzvrG+?=
 =?iso-8859-1?Q?HzDvhF1rTLlXR4C5NIhOAoN6+0oS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LpigE/Qrmx6WGZRhsb8VvP+abO19yr1CzvpTeyHNnXjbWL5Xbkly82XIOs?=
 =?iso-8859-1?Q?2FU5GRqnaX37l3aGwE+JMRji5UrUamoltJ/efSRGudXkEoSyUxpEnjNtRz?=
 =?iso-8859-1?Q?V6f/KnMeuUzv9cZxMkDaTl9IR4QUSBd5SL6LLe/svFGXOIxwTNXTIm+vdu?=
 =?iso-8859-1?Q?IeXcKDSg0hLkWhAo8DYvSKo/r7EymF4YbdyyhmLwlz9RNRrCeGeFmrQXQs?=
 =?iso-8859-1?Q?WTO5PX9eJZaDrhy+aL27svIYxCr5GfxOkIjouPRBuZ8JcchUUJZcgpBluS?=
 =?iso-8859-1?Q?LX/8Kxg5Xp/LIf/r42Owm3sW7io43ecw0qm4fISh6KkQpjZJ8LRHPT2Mtc?=
 =?iso-8859-1?Q?w53QYTD3xUrpNHWq0I664yROq/S1seps3Kv9bHvizHrBsNirtm0PJcXKDt?=
 =?iso-8859-1?Q?OricbNYaMzAraw3usHnEczT7+/m6gh1uY1MpNIOimTyQmZB49QIuBRNWSP?=
 =?iso-8859-1?Q?WuTIWnNJUZmPCjtNWRWWb8kvQQKxI9vAfdX4Ep+NIO1IQDRQm3cHydI9zE?=
 =?iso-8859-1?Q?+ihGoX2s7xithlslmKBA9ai+RdMEme2cutdPFtzXUCdxm543V7S3kS2Jpx?=
 =?iso-8859-1?Q?uoEcYdfdgxprhTrVjO1gYmJKWuGcaflcgppl9eM89ilzXRViWnJhoa+Mpi?=
 =?iso-8859-1?Q?Yjw3BcyMGXxl0kFZ2eQycqZOmPltMz1++LQxUXfzam7TfeNo271xZKcdgH?=
 =?iso-8859-1?Q?7M5AbfsaTQSU0ve1nHWcXHyQMH+NW0i59TL80YkNsTz3O961oML5Efhwi+?=
 =?iso-8859-1?Q?DGQdQSAScER5rYMfLIT1MY2CelOYRg3S5D+5WwoImfr1zgJhFiUOo10bs7?=
 =?iso-8859-1?Q?PxMNDaRp9HAoCPc0GqKVZkr65WICMtAulbsTFNEGdiBzmRRiRt5+KoCgCz?=
 =?iso-8859-1?Q?HGON5YeTQrsrMZ+zBXwVavEuxrV1BHFw6CQTYsvs+miJAaIsAQW9E2VOw/?=
 =?iso-8859-1?Q?ufgCe4vd8FrJ6UIoB3je4ZRTa9f36T9fSgoJ6GMVwdJbkY5J4WMvSWNpJu?=
 =?iso-8859-1?Q?RvT8KYP/MHiZ4UX+XWi8/0r/XUjT03H8BZCXqNl+VcE8OTm/Kd8IH/VJKD?=
 =?iso-8859-1?Q?vqsyP2Bro8pRbwKuHX8Y9yaToQ4nrlEz7z+Npl+Vk8b7iuyWu9RUikbriy?=
 =?iso-8859-1?Q?r+FNSw6zV4Y8G8F8vFR6N+CUkwgDlyYVPNWuwcrIhqhMcaXNRYHPftcuce?=
 =?iso-8859-1?Q?bL2hZO/0d9l1bktWAD3a6eEJJQ/uF+1mk49wEzT4ICD2pGbQ8CsZBt5bfF?=
 =?iso-8859-1?Q?LAgMDGfFHXsyOjFFefZU5t4vfes3DG1BzKLpFY8Ru/lo+O8FYB6qnwFO7n?=
 =?iso-8859-1?Q?zLT2pQMmPHER9IDDlrLvzmctiXyKCd2edvo41rSUk/hWNgH+9NgUXsfB/p?=
 =?iso-8859-1?Q?62aDVcvHs/LJZ/AtDO6sOaz3c+T2ZGT51cqPtckaXmWhZrbwBkOhybd6lH?=
 =?iso-8859-1?Q?isVthnddMGDP+rR+zU6rN31s57JnnMwL5U5eHXDP3DNfZ2kSaoVzSfQhOX?=
 =?iso-8859-1?Q?V0Yg4Iw0Df4bZvPezmLfsf8RRT7m3CB0v7Mxm0XE7sReVVTggEerK19Z9b?=
 =?iso-8859-1?Q?3mNZRST58HSQVcP0+/oRoxipBMJCE9zCZrIp1XfI84Z0F01HC4WfLHlnWQ?=
 =?iso-8859-1?Q?z4Sbuf2PoMM3jd5m3butfoz6903ij1C8ezuDvOjCKPLI+WWLy5fUdM9g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b0d514-a2ef-4a95-71d1-08de18c3633a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 21:20:59.5348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PeXPFxtg3F+5O/1X+kNzbPXsF35x6iMLt2ebj5qZMvsUDkMUajv3fhvKteKYvuUKfnXMQzuOgK2ebkSMmlAv0eWsP2ZJ5U2Huuda+AME9zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11113

From: Grygorii Strashko <grygorii_strashko@epam.com>

Xen uses below pattern for raw_x_guest() functions:

define raw_copy_to_guest(dst, src, len)        \
    (is_hvm_vcpu(current) ?                     \
     copy_to_user_hvm((dst), (src), (len)) :    \
     copy_to_guest_pv(dst, src, len))

How this pattern is working depends on CONFIG_PV/CONFIG_HVM as:
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

Rework raw_x_guest() code to use required functions explicitly for each
combination of CONFIG_PV/CONFIG_HVM with main intention to optimize code fo=
r
(PV=3Dn and HVM=3Dy) case.

For the case (PV=3Dn and HVM=3Dn) empty stubs are created which return (1)
indicating failure. Hence, no guests should possible in this case -
which means no access to guest memory  should ever happen.
The two calls of __raw_copy_to_guest() in common/domain.c->update_runstate_=
area()
are fixed for this case by explicitly cast the return value to void
(MISRA C Rule 17.7).

Finally build arch/x86/usercopy.c only for PV=3Dy.

The measured (bloat-o-meter) improvement for (PV=3Dn and HVM=3Dy) case is:
  add/remove: 0/10 grow/shrink: 2/90 up/down: 163/-30932 (-30769)
  Total: Before=3D1937113, After=3D1906344, chg -1.59%

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/Makefile                   |  2 +-
 xen/arch/x86/include/asm/guest_access.h | 38 +++++++++++++++++++++++++
 xen/common/domain.c                     | 10 ++++---
 3 files changed, 45 insertions(+), 5 deletions(-)

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
index 69716c8b41bb..36aeb89524ab 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -13,6 +13,7 @@
 #include <asm/hvm/guest_access.h>
=20
 /* Raw access functions: no type checking. */
+#if defined(CONFIG_PV) && defined(CONFIG_HVM)
 #define raw_copy_to_guest(dst, src, len)        \
     (is_hvm_vcpu(current) ?                     \
      copy_to_user_hvm((dst), (src), (len)) :    \
@@ -34,6 +35,43 @@
      copy_from_user_hvm((dst), (src), (len)) :  \
      __copy_from_guest_pv(dst, src, len))
=20
+#elif defined(CONFIG_HVM)
+#define raw_copy_to_guest(dst, src, len)        \
+     copy_to_user_hvm((dst), (src), (len))
+#define raw_copy_from_guest(dst, src, len)      \
+     copy_from_user_hvm((dst), (src), (len))
+#define raw_clear_guest(dst,  len)              \
+     clear_user_hvm((dst), (len))
+#define __raw_copy_to_guest(dst, src, len)      \
+     copy_to_user_hvm((dst), (src), (len))
+#define __raw_copy_from_guest(dst, src, len)    \
+     copy_from_user_hvm((dst), (src), (len))
+
+#elif defined(CONFIG_PV)
+#define raw_copy_to_guest(dst, src, len)        \
+     copy_to_guest_pv(dst, src, len)
+#define raw_copy_from_guest(dst, src, len)      \
+     copy_from_guest_pv(dst, src, len)
+#define raw_clear_guest(dst,  len)              \
+     clear_guest_pv(dst, len)
+#define __raw_copy_to_guest(dst, src, len)      \
+     __copy_to_guest_pv(dst, src, len)
+#define __raw_copy_from_guest(dst, src, len)    \
+     __copy_from_guest_pv(dst, src, len)
+
+#else
+#define raw_copy_to_guest(dst, src, len)        \
+        ((void)(dst), (void)(src), (void)(len), 1)
+#define raw_copy_from_guest(dst, src, len)      \
+        ((void)(dst), (void)(src), (void)(len), 1)
+#define raw_clear_guest(dst, len)               \
+        ((void)(dst), (void)(len), 1)
+#define __raw_copy_to_guest(dst, src, len)      \
+        ((void)(dst), (void)(src), (void)(len), 1)
+#define __raw_copy_from_guest(dst, src, len)    \
+        ((void)(dst), (void)(src), (void)(len), 1)
+#endif
+
 /*
  * Pre-validate a guest handle.
  * Allows use of faster __copy_* functions.
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 4f91316ad93e..c603edcc7d46 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1985,8 +1985,9 @@ bool update_runstate_area(struct vcpu *v)
 #endif
         guest_handle--;
         runstate.state_entry_time |=3D XEN_RUNSTATE_UPDATE;
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, =
1);
+        (void)__raw_copy_to_guest(guest_handle,
+                                  (void *)(&runstate.state_entry_time + 1)=
 - 1,
+                                  1);
         smp_wmb();
     }
=20
@@ -2008,8 +2009,9 @@ bool update_runstate_area(struct vcpu *v)
     {
         runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
         smp_wmb();
-        __raw_copy_to_guest(guest_handle,
-                            (void *)(&runstate.state_entry_time + 1) - 1, =
1);
+        (void)__raw_copy_to_guest(guest_handle,
+                                  (void *)(&runstate.state_entry_time + 1)=
 - 1,
+                                  1);
     }
=20
     update_guest_memory_policy(v, &policy);
--=20
2.34.1

