Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1729BC25400
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 14:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154315.1484388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEp74-0000rN-IJ; Fri, 31 Oct 2025 13:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154315.1484388; Fri, 31 Oct 2025 13:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEp74-0000oo-DH; Fri, 31 Oct 2025 13:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1154315;
 Fri, 31 Oct 2025 13:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zurH=5I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vEp72-0000oi-Nv
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 13:24:16 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ec3281-b65c-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 14:24:14 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 PAXPR03MB7564.eurprd03.prod.outlook.com (2603:10a6:102:1df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:24:11 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%6]) with mapi id 15.20.9275.011; Fri, 31 Oct 2025
 13:24:11 +0000
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
X-Inumbo-ID: e4ec3281-b65c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4QbHaYTbyTvO4FLIl+r/6ChM0xcJmQfhSwxKQSxDjE0GbVGgYJnooFBoX9LfcWi4zfmVechkE+TiHieTYux+ltkTJdICED4TcE2i0Vs0Kp+BtTTRIs6+Y25Q19BfvBEHCwmMIOSAcf11/kiThZz3US2b0KRMOtmGHUkQdyLbkp1rNf+EYhJm0pMqQcJO7UOk9xmm0/YVrz1lTPKEjT9d6wV6GDL2r2Ohpvmf4mgTuaqNqAG0pxDkyOcC/46xOdPy1/sbSGRO1dzVw4h7tC7FlPxoYR3J0p6O+i8ocTRBRKXuGBlmDjGiH6zqCC+uYlzd2bPZcFvDPUyB0k2XkVToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92UQgZfy6zd/34QJFmLoFlxHFsewVbBktWC27QeQ3Hw=;
 b=I/hVH0ANU8oO/gf0YXVQqeFiw5DDHhFutlGWkhx8QXVr8GvqC5kLSsnHWxZBQhRvlLXH5AdDmLPH++sdw7aTh5nfhOepj+IP9mBQU+kJdi63Tql62BSsSqehjWtKmGjmFHdfGkxFcgSkzvkSadaiGV7/IV8sMDb0MrXGqz2lTLRL6tbQujhEVBtH/fB9twSai7HQs6fJT8IteTtAq5gJfyeegYqIu4MkxXGKLt0BzLp6x1bsPPTkvqZWDAVUVokGQnW5dBTq9fA/LbCu97e0qUpr1K/F8g9DniAPaDLYnklIvWFTX3whRAvmkKdPWKSpS0u9PUxDA7U+W4BoBw6MkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92UQgZfy6zd/34QJFmLoFlxHFsewVbBktWC27QeQ3Hw=;
 b=OxSDJFlObT0unA8Jo8u/SMhhNzDTKxgNurggxa34AvD0XP0F/gPWvNn7Xb9OWTXSA/D3+VZJrse043sF4cx7MASIYop218UJ1jG2mxE9ScMdzGU9D5LsKMaZa99GSgUnGjoNzMUHWWAMHwrc5b8zQW/DemIMMrWEo3wwjZNkuFvPI58jkvV7nHWWo2on4pBlsxSicJhMTTD3duBsCaB1Ajn67zEVop9SUe2OWsiHnK1R4/G4fKBBo3JwvjyH3zwHFxQ+0mPYyecX+Xq7f0rQUX5X42oS9VE7ZfjV70XB0/Dnb8o9GvIgDzd6k7mEsoTrNd+LpIipLBLcTojoj7c4qA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
Thread-Topic: [PATCH v2] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
Thread-Index: AQHcSmmkIQ80coKXgUesf7WJ2gZ4Pg==
Date: Fri, 31 Oct 2025 13:24:10 +0000
Message-ID:
 <e53aaf80d9f51a93885b1ff0d2cbb848468f7f08.1761916782.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|PAXPR03MB7564:EE_
x-ms-office365-filtering-correlation-id: f0a89680-6dd5-4ded-3091-08de1880c72e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pL9Jol5ixPSzJdXQG+iUwbxiwJcceUQ4YL1wHpXWaznkNirzTyEC5Xbgqz?=
 =?iso-8859-1?Q?bTtVfjFyW/WyTNypZ9T1QTLaXS5sU1pRyw4Om9QNRvpkc80UZqo4s1Xlq8?=
 =?iso-8859-1?Q?1DzfckN2NUBqqbV1NgyeKsUFKWWBBtcUL5vjGpsRzPpZSYhINR3FUeVZNr?=
 =?iso-8859-1?Q?QMUvuTk2NcdgHxH91tEUBa6OzfLPN1vGg25cH2cF+h1BPqJc8hw6E4Q73t?=
 =?iso-8859-1?Q?U1iEjPs3PNtzERChZguvcDjWmy1ZkmVrEd78AGAxhPFqs9IW1uCyZEXX47?=
 =?iso-8859-1?Q?QhqHBxHqESfXUtvLa9lFm9dGovwoNwZneuHhoX6sv3qCCeOsyo6klGr+Lo?=
 =?iso-8859-1?Q?qImN/XJXphT1dRsrXNAY0hvQzAvTzW5+zVxTUwkSRvzyiqecXB/amnppBa?=
 =?iso-8859-1?Q?w/OIeVj0wjWkTsMWM7RqNYlk1H9Ax3VcCasvQCUKEi0fX3cuzDVc0Oy+uR?=
 =?iso-8859-1?Q?TdFyXOwdhCuDvTCQ8DKeF5eLB/Op2XbsV8VcjDPLi6wQlHHERDFuzJAa1y?=
 =?iso-8859-1?Q?VZGp/VNGBEyxsjYhCOigfenWaNxHhWAChl1L0pOGHKXr2wTAre4XW0lzJq?=
 =?iso-8859-1?Q?HaGwreU3NDbUeAO1216i7spOhUtEYpaOEwiw0A+6RESyG+Nd2Tn+TsYoOi?=
 =?iso-8859-1?Q?pDqW8LAW7+mo2J2793ZncLFhh5K8rI0zvpOdoZiM/kWkbI5afnP9x2vtKl?=
 =?iso-8859-1?Q?/Orrrqe/8uERTjYC//EfZemclrIODuyfWo4LBAYOxqmuC333gLVIHzJGdh?=
 =?iso-8859-1?Q?+L6XnswobLJRLo5dIyOKz9Fim/r/gq7IQ/8cpAN/ubjKc6aK8/1dl7HOiE?=
 =?iso-8859-1?Q?mtNh+INdwfuXZza3daY26qNcNvJhzCf94oP23agQ2aWG3ruKZM+cP8XuNg?=
 =?iso-8859-1?Q?5P9tlL/EmCpDdzQFn+7H/Y0rlFP7GJvzsnv8a0VOs/Q4IT9qbf+ogbVrue?=
 =?iso-8859-1?Q?ZinX+UJSFdswmYhWGaRFHDrGVeu9Eo/iBtcZvun6AwVaPJK1w+97ngPWSg?=
 =?iso-8859-1?Q?m/9G8s3GTVo6TtlhuCB80m2Cs7TaXWQprEMUN0gPg2no+2WMNl/OuSR1Tk?=
 =?iso-8859-1?Q?OknpFfu6zVe4XLg7arDX3pczKCplFlPqY1Xw2UoHXXeQxeWqTkM0GdpspK?=
 =?iso-8859-1?Q?IPP/IZdFvv/ut/jWkj6plwSBZjGqxhzQsEereW+oiyxDCFJlnzIEeUMds+?=
 =?iso-8859-1?Q?0wLOToLdOy+F2sWHSP4rPsAgX2JtwJKHmV2oLDjHYIeIhpkJGPVONN6tpb?=
 =?iso-8859-1?Q?rZ02YGY35hJ0ZZ/yJAh/RSw2pmnUWRwvSUY/lFlB5mCfTLKp2oCP+ehDtY?=
 =?iso-8859-1?Q?ik8F4T+DedVn7/0GdVfcaEPa7ZJZSzGyw6YkAiROv+cFOrXBn3O9h7IN0L?=
 =?iso-8859-1?Q?UyIgw2Q+WuHwqRS318VP5SioVm1eqZJov+h9+yjP0z4ef9aXJnbw9/JmHq?=
 =?iso-8859-1?Q?WrXfgMiSMszXVmOm1QCSmDdM7Iv+IyRLgpXbXc2XC0ftnJVy1lGJSjW+kp?=
 =?iso-8859-1?Q?qK7qQAXr/JsGgdQLkXyDTtJ5aOZUAdlIwIH7Y7sswtRQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ez35fJr0HlrWcL/429zXQ8CP1H2JO21GUGX6Z4id9W3yMFtMnb/guBwVn+?=
 =?iso-8859-1?Q?VEPHYBM0hCOdp6czD/dBLqaLH0+jrmiqn65fnJO4c21KHZMRloaJzpKCfn?=
 =?iso-8859-1?Q?KjHQNnQEDdHx4aVs8uesnWZK95hQE3lq9aIyz7fDS1zLfZfNw9Udm1D1B1?=
 =?iso-8859-1?Q?Qqq0REcQdwy+i6EE7bCyG4Jv9rJd+8qgA4x6pQ34Owx/nYDucnITsrCWmh?=
 =?iso-8859-1?Q?mVWBoNYIRRWkJZwnotClwv2Uu8/5NGs6Yk0nM5e//9ISkj16S8SAZSYoBw?=
 =?iso-8859-1?Q?rxMR5jaP+0U5eMSUt00jEMye0TGEIXdQUgkon1P7gJlQJ14ozzO2cGiw3E?=
 =?iso-8859-1?Q?NJb1rz/PcgJ2rF4cGEkNRz0OwI47uYwgJaKLKNZFCpv6386p4IfuyD9n3E?=
 =?iso-8859-1?Q?l+IKZdNdVW/sGIWNgYSKppfKtrM3168LzgwzV8UoVGBq1tiIIP1pf1TdP3?=
 =?iso-8859-1?Q?8OEm2JSTPeDZkQihslu+Srn/+5Poi8YYPARtn9FVIdYIIvtly39dC752Hv?=
 =?iso-8859-1?Q?d8zFknkJp5I6qNeICJHFUkpfkOf1uHCeq/JhsmEPLDv7s0g4F1YYNRDpsO?=
 =?iso-8859-1?Q?pQs1NAAOXo/a9a6Wv0PVPkOpRLYL42QpzJ2F3Ui5EJDn36eYxZOxztTmTK?=
 =?iso-8859-1?Q?/dJ8IOVKdCOvzM6v+TzOUxthDJybsCeTnsOzTBbPz+KQXXXSyGawRwrBK4?=
 =?iso-8859-1?Q?J8bUsx4itAeeOb1nSb9j35xSVkEv6Mm9pPKZgmb4NTH1MzWtn9eKZVavTU?=
 =?iso-8859-1?Q?ufEO6hohmoA1HVBvB/Jbs9hyymEXcsHcER7FW+m4zr9hzA+UHAMuYiO2im?=
 =?iso-8859-1?Q?uckh+4JpTz1/v4qI23/cQBT+RKFlFOM/bcw3Jkf5lW3vKq2XUZhMRrGddC?=
 =?iso-8859-1?Q?zrHkx8TGqfG6HIQ/7zR1lnzhFIWQ6R3L1cA8tHLUkZIXE7rJD8D3S7vC9o?=
 =?iso-8859-1?Q?g530rfoae9tqwGKSN2JpVLrTXhNy6j/S73/WZu+a5gS4oiYllK0pow0zPC?=
 =?iso-8859-1?Q?ixYabOwIkWHanayR58XgycIPie2LDgxOyWVkHhmaIY26JL+yT1DfhNHaHT?=
 =?iso-8859-1?Q?lMamTgL1DQllH5ZpyVZ8N6W1wpDpNJ83a7TZ7Jsavp+hd3HkTJlx6PhaUz?=
 =?iso-8859-1?Q?nN9Oe2sxArPAApsrkiptIz+QHuzGhiAPfiKfVyB3WB+v4ENziYcS0IPq+G?=
 =?iso-8859-1?Q?ZfFmvmZuYKZf2o2rZyUgnklyLHOLtOgJ0OLKY8EtLDIZAt003NM7i2jf3I?=
 =?iso-8859-1?Q?QkOm0FX7yTzf9y/4QhmYbXCIXQaXpracsJKFRh4GH980Q3oOKkQqsaq3Be?=
 =?iso-8859-1?Q?iK9Ejk525K8YLCzGx6MxLlsG51nqtWoxaxbeND2gYu0awuxsVVjd/6GKKN?=
 =?iso-8859-1?Q?VJfTu3Z7rQf9Jo8Umx/kcikpUBRHnDmnxU5AMQQ7VZl8CwRsd/Gc/YRAzp?=
 =?iso-8859-1?Q?PSXTGYOXNqQ2zRIEDDCOV6MJjh9n9MI/XKXSsGORUpHSENMASI8NmjwPHE?=
 =?iso-8859-1?Q?CYX3w1aA0qlRIB/DfUhfCN3o4Zs4oQrXKdgoa8UcZityRMXygysH11NCuz?=
 =?iso-8859-1?Q?nwRlp/27Nys0DOOMhkM6s8JnWuUmT2VQYa+PpcgUFuvpsGr3fWpi9YXy6t?=
 =?iso-8859-1?Q?QZm5U5VtZxbnZ45HdQfQDXvDId3VaJOsXgaFW1Y6no5SmARbn1cBl2oA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a89680-6dd5-4ded-3091-08de1880c72e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 13:24:10.9703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZgB3ZSGbVjIDRimJNTx/SuLXb0x4BsWPcSUX9Z99D3qAvYr6C3zC/1BOBt/vAVK02c0hoHNdWHmJSslp+iSijz9ys8YGJBMFFp27+ekHTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7564

These files 'docs/misc/kconfig{,-language}.txt' were deleted, but
references are still present in Xen. Remove them to clean-up.

Fixes: 044503f61c95 ("docs: Delete kconfig docs to fix licensing violation"=
)
Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- specified two commits that are fixed
- provided links with specific Kernel version v5.4 (not latest)

Link to v1:
https://patchew.org/Xen/6f72dcebf5dbb69e9496b7f0ef96198e9bb9f1e9.1761745058=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 INSTALL     | 2 +-
 MAINTAINERS | 1 -
 xen/Kconfig | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/INSTALL b/INSTALL
index eadf108aa5..c2e756bf4b 100644
--- a/INSTALL
+++ b/INSTALL
@@ -23,7 +23,7 @@ Xen Hypervisor
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Xen itself is configured via a `kconfig' system borrowed from Linux.
-See docs/misc/kconfig.txt.
+See https://www.kernel.org/doc/html/v5.4/kbuild/.
=20
 Note that unlike with Linux, and contrary to that document, you cannot
 look at Kconfig files, or the default or generated config files etc.,
diff --git a/MAINTAINERS b/MAINTAINERS
index ecd3f40df8..190da0cddb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -389,7 +389,6 @@ F:	xen/include/xen/iommu.h
 KCONFIG
 M:	Doug Goldstein <cardoe@cardoe.com>
 S:	Supported
-F:	docs/misc/kconfig{,-language}.txt
 F:	xen/tools/kconfig/
=20
 KDD DEBUGGER
diff --git a/xen/Kconfig b/xen/Kconfig
index 07c4accf88..a5e5af3b76 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -1,6 +1,6 @@
 #
 # For a description of the syntax of this configuration file,
-# see docs/misc/kconfig-language.txt
+# see https://www.kernel.org/doc/html/v5.4/kbuild/kconfig-language.html
 #
 mainmenu "Xen/$(SRCARCH) $(XEN_FULLVERSION) Configuration"
=20
--=20
2.43.0

