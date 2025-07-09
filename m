Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF630AFF2BE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 22:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038628.1410930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZb9y-00079G-NY; Wed, 09 Jul 2025 20:12:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038628.1410930; Wed, 09 Jul 2025 20:12:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZb9y-00077k-KX; Wed, 09 Jul 2025 20:12:54 +0000
Received: by outflank-mailman (input) for mailman id 1038628;
 Wed, 09 Jul 2025 20:12:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1T/0=ZW=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uZb9x-00077e-Ic
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 20:12:53 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 154b98cf-5d01-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 22:12:48 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS4PR03MB8556.eurprd03.prod.outlook.com
 (2603:10a6:20b:583::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 20:12:43 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 20:12:43 +0000
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
X-Inumbo-ID: 154b98cf-5d01-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX11pI3RRXd4pH2Po2k+LS7QqXQb4cPLfU7r1tb0xKc2FjmOe6KEfWkPctXaftLzsi7kAHjBZKVb77UyxgvvCMjp2VJFrktAjXpPUOx5eZKuw/aMj6zBwbyFlmEuByWK8ZWH1U8W+AKWStbIgSIbyBDXz0pf0RZcC0tONCn/oycdi5yGmw4VB2EbkF/UKnC65Upe7GRpJ3DSre4TLg/LVzcbHXx9Tbtsix8vB/qKDvTQNyLf/6UW9YXvr15ULNjTEzqEo4qumbGDOYV/Gtb1cbdhelTq6jPr+ev1CjBrlP15nTJSpVi755ecCjrVxp5PaBdkKcMkv/dar+VZGgTpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWQ+Nc0eVb7PoDdAkDe+FYuYwP1xDm6QLVuNAQHja3k=;
 b=ccFVVymmhfX0dJ9Zg8/0ljCYwlgaruou8QtBtL1tfun2ecUsYoCMq3lYXTpaoJqIg0IyfvRe36crzX4Zs3fFxkOGNNN0Pjb64EHv5Z7JXGUrUalJpaGdN3KBF7/BtE6AvjnmimOKFIbvNmSMki9gKhL64C8QWxMZ1t6L1a7ks6inxKvA/bZ/93iseouRuSlXgejrcT7aBlzssZGgNASWvnQlsCTTlznNb1EtJOPiMZ113/huc1J4PDpE7IdWBXwvvuCFXB+kqyVGXyw3HEgw2r7YFDuqMRpNQtFsGxIqdHwLCd4GQeqbXOtkLVketiZgbu0NDdQ7tZdt0EW49AhChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWQ+Nc0eVb7PoDdAkDe+FYuYwP1xDm6QLVuNAQHja3k=;
 b=jtSIhZnEkLlwEC81eSTFtllXJwmzlHVfdMxpKXR3V35zM3wYN5OHAZCMViPp1n2nivKH/sr7oolBvdMLbHUHaNMDT0ks0QMf1IhpSKNh1QSPWiOqvmqGOUWrRAHrIrxW0uIrbPKRf/iRvrc9n+UE1/G3UfIPZKeuvnrTdjypB23CkSy2U4+Qmw44bebMvSnebSJwLUTtm+lU26L9bwFucC+PukN+ZmTJOwJZ2Awi0EQV1tkuB7Zl7BIholIlKHG8q3lV7AYcKGePKp39QCve9BLJ1aQ38+llps7ory49swXCzb0rtOulNXq6Wa6JxBmz9xppBgX2T8HPBiefsz6ffA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] build: force compiler to use atomics when coverage is enabled
Thread-Topic: [PATCH] build: force compiler to use atomics when coverage is
 enabled
Thread-Index: AQHb8Q3T4onJ/fNwmk+3ZG7sC0Ohjw==
Date: Wed, 9 Jul 2025 20:12:42 +0000
Message-ID: <20250709201154.235166-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.50.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS4PR03MB8556:EE_
x-ms-office365-filtering-correlation-id: db10e1de-ec1d-45c1-f711-08ddbf24f65e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DgKG3ajhgsa4lu/KJcJSI2F+x5crlpA9363ds0dsHBfi6ZNhRcy1tOKrip?=
 =?iso-8859-1?Q?xLYm8foXdvYyVPR7UhYMLrsLmCQf+4fqmAPO9iWzi1ZVxyJMeNgwTRPiz/?=
 =?iso-8859-1?Q?LncdJC90WWVxOW0+PWSdtYQcsGjhuWwVaQjbX/gocQMQKAzgofh/iKFx4c?=
 =?iso-8859-1?Q?MOu305SAy0V8NOOxsPHPNCDdx0G/Muf76oXuhj6wuvfwb6Xa0JR1rpp2lE?=
 =?iso-8859-1?Q?CedAWo4gzKGilbXhfjoe3mNA2yOnMVCxzVDPmzMg0Q2rsqAu/9a8z1b5sS?=
 =?iso-8859-1?Q?RFgWn9z2r3kXFBNFWwRL7cQvysrlNGwZyBKDVd5Z0Ccf664XxIZjYMaC0x?=
 =?iso-8859-1?Q?dlHdV5shlpVi5oS546Xb0Wk8/qJJn5Ncgjr4N9YK94aSyt6PIF57WchnEY?=
 =?iso-8859-1?Q?Uu0JTtxWZOHTOonHBR/Sf7ilUfXHL+phhXy3VMdW9oySYcRRNjUgcOUvkG?=
 =?iso-8859-1?Q?4Rb3lL/Lf930jVoZkyVMGCwQrzJEUOxJsw7VkyouroZqsSoJkj1b6vt6w6?=
 =?iso-8859-1?Q?fjC83DhAzuOdaeIIJZTr/NcHR+bOroC4ldpnzFWpaksvN75WJPETvmaYxq?=
 =?iso-8859-1?Q?mmSCxLRa6najw2yqMAOzz/Bc4DxZfC0BzB5lTpP1yVcsMn89v1EwJOdu/0?=
 =?iso-8859-1?Q?G8jAXC71G6RNtpWxYl9BiIeY46hzGCDnjdl20bOb3Sb8gZOSBmjtZgikWn?=
 =?iso-8859-1?Q?LEJ4YKlg/6Si3ewEZfpr62v7/CF1b9Vaa+4C6uqksB+5Y+YYlU3otQMLdv?=
 =?iso-8859-1?Q?fYXnDH7SuGeUmeoWKQXIWYX5fRE9NJpapufY9/1Ddj8EFiiW6q0UQWoqcj?=
 =?iso-8859-1?Q?jlf7xb278jHMNPDy2lqBLOjTtVvkqcH3HjBlS8pWu+AgZgiyyC5BVdxr55?=
 =?iso-8859-1?Q?YMUKXToZegh+6DgNba0OA8wgeRJVbnrHFOgi5FDWYZMyIEoAe5gj2DxT0l?=
 =?iso-8859-1?Q?ifSXK2Lq5O5EUB+XEchqKD3vHehw7JH5ipYvNRf4jQGt4EfImj2jWvGeZ7?=
 =?iso-8859-1?Q?cZotqcM3AsB/8oenawKP2fXVB9M0klcbNHoWE6sxtVTTcasSo58sTiw1OT?=
 =?iso-8859-1?Q?oq3q9Cxc67N2onNsGwFUTkv269NECoXlq3AT0AcsbNc+FqpOiy2CnEaalW?=
 =?iso-8859-1?Q?Gg8sM9kSUiKOcO4+VDOy7470MIrKCxR29OqFp8kcDwITAySF2fvoCIHlmx?=
 =?iso-8859-1?Q?t6yoYW2n8QmnXOfk7CZ/Xt18Dd63jhMeNU3rtB+NaRMX09UyQF/TnCVcLk?=
 =?iso-8859-1?Q?KOMjVj5vYJZH/mS0z+IINEMVKfGxLMV9LqfjQDEOF/6OsaUC5BOVYf0anh?=
 =?iso-8859-1?Q?1l2XxThVlAgqyb0z9uBjp2bNjI+H9XCER6JTpSvU2SYJhMLwBt0ABv/KwX?=
 =?iso-8859-1?Q?dIkGe2FfzPKUnDVtOJnWS9PYc66dQ5Qfsc0mEByoyPcFq/M5Mtd2khzeoa?=
 =?iso-8859-1?Q?W1kUpB/iIn1g6X2ke1JJI5fRWeoF1o2QGPUgYbbg6N3mxN/o+Y1MTuiN9V?=
 =?iso-8859-1?Q?kTiEMBsWgkb2NuA1LwpYGRmiQ1lWMJDsHatu2Cj1CS4g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Mn+RJhUOmyarxEWl8EggntDDo+d66i85ct1D3maKdbxVqgKdQHe69hfZs7?=
 =?iso-8859-1?Q?/lSIspUAPExF+3evQN15LXRO9Y9LS3gpiu9StkuCf5ftrT9KwvD4jBueVX?=
 =?iso-8859-1?Q?X90Socj5HUAevCc0TuyYPYNQuKU23Z5e/dWoPqEUOYUHNn5a0yoVYTx5cb?=
 =?iso-8859-1?Q?CCXx1L+PSlY5izuz8eNoAAAdE6eUGWOySzBNYUYGqOdFfAlVrgMlps3wDw?=
 =?iso-8859-1?Q?MNp6Pabd0Hwhgz3Etqoip5P5EyeFoLcw6MVf6e4s9/iqgiU3eoEyqUBak9?=
 =?iso-8859-1?Q?O/o/SgTfXBJc051OTYcAbr0hEWJLp/qbtOMNfCjCgASoDEbresEABN+yu5?=
 =?iso-8859-1?Q?lerWM7Q3Xk4K1s8aIeA/Q+A1uox1o6DmU3p1lI9YK1EOtAdK3iV21eSJEf?=
 =?iso-8859-1?Q?IGWT8lrEbdw4jil6/CSoXCjooQkhKIFkKFvB2UbDN4NGDYCXnPIW/m+hV0?=
 =?iso-8859-1?Q?ZdgShuoNPd5VIoA223mGffe2raVKhSVzGEXXIn04DbbIDkax0n366mLm3b?=
 =?iso-8859-1?Q?gR5cYV3ubAYIsdqxKoelG3MEdvtSy9DRLDZFMyJVshDwjF4EPjh4woxSIU?=
 =?iso-8859-1?Q?2n1rZHGNCAH3dOG/2pisCsuxFbYsjqtO2MTO8hGX6nvXVfKuP6kN/79heC?=
 =?iso-8859-1?Q?m9uaUcLWtN6WAOC7Z6swfYv5bsC9qCaLqmiiDTGT0COBx2ghdzSoxHUQB5?=
 =?iso-8859-1?Q?du25haz5ZnmY+8BwiYM1nGyib4DkKjyYGkmbt3nCg0+GrCJ6sQmGYha9tf?=
 =?iso-8859-1?Q?OBKKj4JxmDk/76F18p/Htecr+BK97KhG5b8/3vuQ8YkuuMv9kJ8qE8qGTL?=
 =?iso-8859-1?Q?FJphHVgly41DyUp6p6OvCuTta2yM0UBnoM7JD++KKGyaaMWiqRaFwWS5Wa?=
 =?iso-8859-1?Q?FIvjcBdZcs7Dn08E8zfZ8yW610WPmdFQ780vjxDw1MPx26nGGT2bcU0owW?=
 =?iso-8859-1?Q?tSB64ylgMp3XoZnaESMQlU4s1ZJSMNM+PKzSrT58EnED9bArwUtS+UKmHT?=
 =?iso-8859-1?Q?EXtJusKoQ7zcJlRTJcdp73wPH7mpfo6s95wAVAlTfaF6N5VZYFxvQ9uTZm?=
 =?iso-8859-1?Q?SqtL2PEtIAniyDrQ8k2fejKFhZYKX0GuGag9n5JSvpBUMo8JUjTzHyUMtq?=
 =?iso-8859-1?Q?c1nf2J+/Z3FHhrVoeYlO6IkY1ovwj3j4Y26IfFnjha+SGsbzSr4bvVDznK?=
 =?iso-8859-1?Q?Y5fzZOgmvPZkpNwXYf/8QLUZ+xzQqlR6Xr158AeOrOg1HW3V1F0RKovExn?=
 =?iso-8859-1?Q?2YfAKuUUZSKLMjQT33himvBlFadlfPZ0S792c+zSFSFlzUbVuqUljLM4IO?=
 =?iso-8859-1?Q?1cd79ETHv0JbxWVAVsSGQfY6tVEDmdnC0as4uJNuSiMAwuZ+ARXKXfgj5Q?=
 =?iso-8859-1?Q?QrVR2t7fpHYDlbsMRLCaacHZfVruXPUGdV7i30eEwY3WPjPjGGOg5+rKKk?=
 =?iso-8859-1?Q?/uIegRoghzV4YrdbOqe5WxTB+K2Wwvc9jkoTSrj941/tG7e+Sw5lV0RChi?=
 =?iso-8859-1?Q?j05vcF4iCZkyjmOsC1/ys0MezhzzR6dBivT9+vndqg2wxOIBbFB+nvMGbg?=
 =?iso-8859-1?Q?xOWDXo/24U4Oy0B2705oI+MlkHV3yOQCo6/vl/ddq60vBeP9xda+uD86+N?=
 =?iso-8859-1?Q?BSh7D6kN6M0K680kiurTjMZb16Xb1k5pM5/ZgnC7z/FuAlddqOWWWTrA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db10e1de-ec1d-45c1-f711-08ddbf24f65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 20:12:42.9003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lnxXPi1vckomDNYVcf/Th9XwafE9GCWFvDbV4eV/bWnmbzDru/Io0ZWlgNQKUCvsGwBKneUMGB8mIhwW1PTvbzq25xz7mL6hSFh8UEcZ2/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8556

By default GCC uses "simple" coverage counter update
mechanism. It is perfectly fine for single-threaded (or single CPU in
our case) setups, but will cause race conditions on SMP systems.

For example, I observed that counters are going backwards when running
Xen inside QEMU.

GCC starting from version 7 and LLVM/Clang starting from version 11
support -fprofile-update=3Datomic option, which forces coverage counter
updates to be atomic, which resolves the issue. As Xen runs mostly on
SMP systems, force use this option if it is supported by a compiler.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/Kconfig  | 4 ++++
 xen/Rules.mk | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index 07c4accf88..3a6635ac74 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -55,6 +55,10 @@ config CC_HAS_ASM_GOTO_OUTPUT
 config CC_HAS_MCDC
 	def_bool $(cc-option,-fcondition-coverage)
=20
+# Compiler supports -fprofile-update=3Datomic for correct SMP handling
+config CC_HAS_ATOMIC_PROFILE
+	def_bool $(cc-option,-fprofile-update=3Datomic)
+
 # Set code alignment.
 #
 # Allow setting on a boolean basis, and then convert such selection to an
diff --git a/xen/Rules.mk b/xen/Rules.mk
index da21850926..7219a3033f 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -141,6 +141,10 @@ else
     cov-cflags-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
 endif
=20
+ifeq ($(CONFIG_CC_HAS_ATOMIC_PROFILE),y)
+    cov-cflags-$(CONFIG_COVERAGE) +=3D -fprofile-update=3Datomic
+endif
+
 # Reset cov-cflags-y in cases where an objects has another one as prerequi=
site
 $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
     cov-cflags-y :=3D
--=20
2.50.0

