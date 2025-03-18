Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051EEA66658
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 03:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918400.1323091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMmk-0004jg-9a; Tue, 18 Mar 2025 02:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918400.1323091; Tue, 18 Mar 2025 02:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMmk-0004hr-5z; Tue, 18 Mar 2025 02:34:30 +0000
Received: by outflank-mailman (input) for mailman id 918400;
 Tue, 18 Mar 2025 02:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvL5=WF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tuMmi-0004hg-Mc
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 02:34:28 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81a7e48f-03a1-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 03:34:25 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI0PR03MB10565.eurprd03.prod.outlook.com
 (2603:10a6:800:20c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 02:34:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 02:34:16 +0000
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
X-Inumbo-ID: 81a7e48f-03a1-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieQZf0wYoua4O0TsTWw53R8IxlAAg6vVkWScsxEC8V4TgYE7JoQNxdszET+Bj3vqXu5XgHTWaMJN+lR3ZJ9Fo/kWnxlHn9k5nqAn93Hws+64r8UzmHjz5+vqcjUCFdM8Dyz8O0Smy2a1TQ3xkJRc7PPTuxd+EQOmNVo1dgxTxxhtZkMm1zBMv7vDkBeYC1Ckd4daSxg+wUhUTLzIlBpQr9wXez7IzxyeYMFjjO/xxmfhKyPV/CA2WtZudFQmDPjn4IXUKxpGF9RAtoNBh6x+dorHPDVXZ9CsVPNw+5wWpQ/zr/OWft5edL/FUWzNyALcnT8VlGabfYPr1rrRT4FxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnhnxeg1mJ/n/WZk+8SXTjTDXgISXPxPM8J5Ut+ImcE=;
 b=y1/fK/cPIrq5bA8GpoWJtGRtlcroXaIcK2/8epS3heKMpoKKWExLgG2lDmv0sSf7/uBWB9WqRuNI8/Fwjg6V8BCn6yaIopzch57FZwpSu2E/H2QUd9wT2qqtfoS0aTavFN9v69l5efwp0DB+QIMDIsS+DtrSFv9kM/T5qcVlJh/OjkIYPbat0A9GbwSPfBl3iixNG3FhRxcYxURXSYmfr8D4DFywz1/cyNSDFS2Gb0tzws+6t3vIbt5cUnbRjzY0cvd0RPUSvuEANt2GWFDuikR2cIU/7aHJJ5iWg0V5zfKurzRRM90cNOKRfeD2bfWLYvjBNkfJR7FCFQphCElvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nnhnxeg1mJ/n/WZk+8SXTjTDXgISXPxPM8J5Ut+ImcE=;
 b=Fe1P7XlIeHDpC9Da+XObnsoBdG4T/WKS+sOfzxcZCBC88BsGC7mpYa1nY3F7oNAd25kZTqiMB18U1RRGt3UmbPsG0NWe9emX9YGa/dW85zrln2jd4Np3iRMD4ikvWZ+mczHAG1XY99Q1OK4hBQhHW6cbFMt6qnOa+RUTfea0xek92lrF+B/biPjxDMIhvcRPyjC7uWDEkV6AkUY9KkIsN+7BZDt8HMKI9hBEdxh+96cP4XRoBtT/MgsI1FU6zcGGPw5vMXhenG8zFk/R61T++2ty/wh8JWlRB8J3ux0b1TAwL6v0UMgtEadekOdylQBNtAATInhE7EYuW6K7/4gayQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v7 0/3] Add/enable stack protector
Thread-Topic: [PATCH v7 0/3] Add/enable stack protector
Thread-Index: AQHbl64+8qKW+lt+PU6sF6TL8sA38w==
Date: Tue, 18 Mar 2025 02:34:15 +0000
Message-ID: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI0PR03MB10565:EE_
x-ms-office365-filtering-correlation-id: e0578836-42e6-4abc-7244-08dd65c5609a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Wa0aALeRc6kT0ycpIP6ZrHEaEP+vJ5lT1cRNorJIQooDUKvuF5ZaPcZsUA?=
 =?iso-8859-1?Q?TZZtX42rTZvHKfSlm/yhlgYptRPDexYOGswNYPON3zJ7L3wgEE+mldV7uy?=
 =?iso-8859-1?Q?RSk4A7nl0FZKcXMPrDE8P7kYkZXrdgiR/kC9bj3ajXPnP0aw7+oZ1gSxDC?=
 =?iso-8859-1?Q?cjk3pVjnKosEaQlXuklNRNuDBv0vUObQhO1Yn5ml6RWJNqdNVxbAwp0M03?=
 =?iso-8859-1?Q?w6xtknwF3NXe8iNjU9TODmjiJmd6KlarlKlb6IZ4BYpPRUgTgq2itnaq59?=
 =?iso-8859-1?Q?CzQTZ8TbBc95uqYOdeZmyzjeVpTTjBpwoRnhz/xuvx9TgzvaCNtWAWOT3h?=
 =?iso-8859-1?Q?4ZMk/1ERxwnxUOrF8MzZvE2/JdoyKPCCavTDtzayR7OYjPOmH0zURoJZJx?=
 =?iso-8859-1?Q?J4kflERJ4y97xotMYRNvb79jpplKiKbW9BTApIULui0D1H1hsXopbJl0EB?=
 =?iso-8859-1?Q?DUBscZUkyCfS0n150zPcuuE2JjdwKZ/a1c+6ct/ZrMgimLC5Zj23t/diM4?=
 =?iso-8859-1?Q?Vl9yJwadMgXGcv/3j5kJQz0WNDMxoKIhCVGP3H3KkRAzDsBZIFUNFJVFGL?=
 =?iso-8859-1?Q?kJ01RN+rd0dpR0tCrRbyUtwk09tp/fyTOag4brxQ60/8862OGiEqziN3nQ?=
 =?iso-8859-1?Q?v+2W0wm2rlrz3VpBuSI3e1bKSjtad5Hyxr4rk0udEjWzlkk0wE7KFQ3ieN?=
 =?iso-8859-1?Q?A7AHrx5zPUREPJwa8T7lCfBZCwegqGgmh+S5SDhFGjLw/FZHsyMgAP339r?=
 =?iso-8859-1?Q?ia+G6F5XSK2da2o4N6Ke+RQ//uSLCja/+FudgxE8zDCYs7S05/Q4pOnVC6?=
 =?iso-8859-1?Q?/M7PRDkbKlxLXsJJXwGtTSfZmD5BUq/KvS3OhQ7JiP3OZ0MGM3BkYiCt6a?=
 =?iso-8859-1?Q?fCJ0mJki6LrolvbhfXCiNy3Tn6qt2K6+6gJSyUGoHJTv2383hXT18VccEr?=
 =?iso-8859-1?Q?P3Qgg43+zLzFkZQEI5v3lDR+COTUE3ZRQRtbdNOn2jje2B/auAihLKhrAC?=
 =?iso-8859-1?Q?wf2G624e23DXrMdwKT41nvZ8PzQZXZnhJk7Mgyh4hU8Amgqj+xzkkR979+?=
 =?iso-8859-1?Q?TTN1E/9G1yArNq4F0tr1dsJzMUdP7KiWCV1pEeaLwcA9UrDwdirGNZ2K8C?=
 =?iso-8859-1?Q?I9yZeQ8BClOEOW5Rzwcm8UsLlvMLN2V/3aEhzwuede5YAfW0ZJ/AbX1WN/?=
 =?iso-8859-1?Q?Evr3/gs2dSd+0MJjwBwcPblISoCSFMDTIBzVAiT7wfK3RWfK1z96qbyyG2?=
 =?iso-8859-1?Q?4m02ibTfcndEUXfjyfqrSFcUs4TNNsBO4qKsQqHLqRwijKl7T3/POHIyIA?=
 =?iso-8859-1?Q?1bR1/VKoW26uf9lZFj9eq7vpQ7hUJp7PYFiPBkb8ECSNRvKHYbhA76bmNV?=
 =?iso-8859-1?Q?MRL21fFaaKwt2T/GOt4GQO2u2/XoezrApJBqtc11tYvVtLKoN6OW0xs3XX?=
 =?iso-8859-1?Q?yWoQugbekKXhVgsiCJNSVB28EvGZF6ELKjPBL4pqtg2End4GQvwl3HJu+F?=
 =?iso-8859-1?Q?GeIsYWyTHUBtcFovsTdq/f?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0lNHF9ILrttFl/XtfR7RlWX2FhkA2oE9SKGTuZsQ/bmIQerZ8XQVv/iFRC?=
 =?iso-8859-1?Q?mu9fCBng/z72d56W9+TtQ4nL5x/WUvj2ZhBzuYcZTrWRFs4UkxAnNtfpoC?=
 =?iso-8859-1?Q?BbWT+dP+igOdzA7PqEGzOOwgg6DiIyzm3Z1etd1RKXuYC36zzl6NBUIG7Y?=
 =?iso-8859-1?Q?q/Mrq/mmdM5Rpqn3pcfjN0eCk3voXZV8U2Mc3/1KW969nhFaAjS+6FgLAF?=
 =?iso-8859-1?Q?Pvwg0IUiU9xDTN91CRDtokTPaYByb+O7JAvG8OAlDX9GI3SvFOMcPbdbiu?=
 =?iso-8859-1?Q?Lxsw7JcXJlcOWgmaymcg5rrML7IWTvHAGvvrSFVprUGuwsbP9EXOTDqzwL?=
 =?iso-8859-1?Q?zsXDbH06G22YM4cDZpPdELzjQuC8v38jiZD7BkRthcT1t34Gf5T+i5j7dl?=
 =?iso-8859-1?Q?TldhBfZ2tkyIql9i28tOEOvzgYvsGnkk0m8XCFFExVv3GdH6j4Lz6rsxWI?=
 =?iso-8859-1?Q?vqpSN9kgjLX6Us1wLJXl8BSZnWPwP0X3U5enhNFQXFVEfbD/SGiBKfWNOv?=
 =?iso-8859-1?Q?NPdkF8jIu58M7Pk6tkYD+4fZQzIgJWIjctLSsgBBQC/be94qkmLjWrYD2q?=
 =?iso-8859-1?Q?mq3VhZRqLqp4uKO1T/IvsRtNd4Of0HfRcCJQuhNv0/K7Lxl/47HnsZXlme?=
 =?iso-8859-1?Q?JpeAUJXVwQ38H8Td3zCXqGp7yfwmzIZtp5yPkxMrdRmAtzTqAYuxVEbAa8?=
 =?iso-8859-1?Q?zAQTtJBCFj8f2VVqsbMIhQ5O7EqApNVkWRRQbJyCu1IDHXn8hxJ35l6qCe?=
 =?iso-8859-1?Q?iqevqeZYwJtnXVpZCd7iQgN6yJy1oNZWHh+TFqGjhS7s23jsIvOq+sFgAa?=
 =?iso-8859-1?Q?Q5jGSdYN10/+kKcWAOJq/QTA0jyM09BRkvak5i4pIOjUXmY/7U79XtnkHa?=
 =?iso-8859-1?Q?5zooUmA5CRKam59Ei7BKZaSQqWVFt1Jq5xQ756LXihoBDB7ea2VpgAfZBj?=
 =?iso-8859-1?Q?n1I13GFt2CkC3e5MZpKeoFom1EWpqa3AEFgaHpwdGpjfr44O2KJrh5QOrr?=
 =?iso-8859-1?Q?P1ak+JlOxHsF2ixFprCH32WYe/+RP7ahEsYmCWlOLldtlL9Ys+CVevRoif?=
 =?iso-8859-1?Q?tONCE/P+PKVAQym7uAf5V+hjKCuwPNyF2HkBDbSxOmbs+OcgOIbM1H7/J2?=
 =?iso-8859-1?Q?9zvjgeybuTz7wvou90ynuvBSlqlKT8KD5/7zCZ0GTJ1r3DGSMl9k/baD7y?=
 =?iso-8859-1?Q?2FrZ1Gu1vs7RMnNsObSdjGHFB6MTM6lR+FyXivscR12eeUS/dUcU5HUl/Y?=
 =?iso-8859-1?Q?9vMRX5JogoJnFCrQjTkt+iD90RhOP6UA0vw7IMllkxLmqRae079R1mhvfm?=
 =?iso-8859-1?Q?QAMpdTKd/eVu0l8KADzawfja0vloo7ZkOLCoqL0i/LzmAWH2MFHG06coJr?=
 =?iso-8859-1?Q?cQkbOOa+3DIsZHdr0FsepW6vHCv8Oj+gBSIDrxZnNotooujkX+QgSx3cxP?=
 =?iso-8859-1?Q?OKTQiRqkBtHx+Kmxp25ia4rie4gaujkYXHmNVesa1zSd5w19y3K0VZiTHM?=
 =?iso-8859-1?Q?QiWADJBDgyj1YW5sn0dcIWXZSdaNMkiqEYs5jh8bf0HnrQMDg4/bi2iNWW?=
 =?iso-8859-1?Q?YmFuPX9t0WqTz9Nz0BlRF7cMEWomJ9wLVmJmW1u+9DvmdemTW0hxhB5N8+?=
 =?iso-8859-1?Q?5AvKHIXSv9NMSveP6ky1kNCQ7QknAI6pFg53uwxlxLlusN2jk61Tybjg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0578836-42e6-4abc-7244-08dd65c5609a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 02:34:16.0130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8i/762SC/KzsmrjtAuuNihrvG+nBMHiV82z4VrRDc7WT939L88apL/40++GB2sBqZpIIK0KGxod7hMGwMMt4CLTxIHu+TxiVWtKIjXZyiPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10565

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This series
makes possible to use this feature in Xen. I tested this on ARM64 and
it is working as intended. Tested both with GCC and Clang. Also tested
with "-fstack-protector-all" compilation option to ensure that
initialization code works as expected.

It is hard to enable this feature on x86, as GCC stores stack canary
in %fs:40 by default, but Xen can't use %fs for various reasons. It is
possibly to change stack canary location new newer GCC versions, but
attempt to do this uncovered a whole host problems with GNU ld.
So, this series focus mostly on ARM.

Changes in v7:
 - Patch "common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS"
   is taken into mainline
 - Updated CHANGELOG for v4.21
 - Updated stack-protector.h as per Jan's comments

Changes in v6:

 - Moved stack guard initialization code to the header file
 - Expanded commit message for "[PATCH v6 3/4] xen: arm:
   enable stack protector feature"
 - Dropped couple of R-b tags
 - Added comment to "PATCH v6 4/4] CHANGELOG.md: Mention
   stack-protector feature", mentioning that it should be reworked
   if (almost certainly) it will not get into 4.20.
 - Tested with "-fstack-protector-all"


Changes in v5:

 - ARM code calls boot_stack_chk_guard_setup() from early C code
 - Bringed back stack-protector.h because C code needs to call
   boot_stack_chk_guard_setup()
 - Fixed formatting
 - Added Andrew's R-b tag

Changes in v4:

 - Added patch to CHANGELOG.md
 - Removed stack-protector.h because we dropped support for
   Xen's built-in RNG code and rely only on own implementation
 - Changes in individual patches are covered in their respect commit
 messages

Changes in v3:

 - Removed patch for riscv
 - Changes in individual patches are covered in their respect commit
 messages

Changes in v2:

 - Patch "xen: common: add ability to enable stack protector" was
   divided into two patches.
 - Rebase onto Andrew's patch that removes -fno-stack-protector-all
 - Tested on RISC-V thanks to Oleksii Kurochko
 - Changes in individual patches covered in their respect commit
 messages

Volodymyr Babchuk (3):
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  CHANGELOG.md: Mention stack-protector feature

 CHANGELOG.md                      |  2 ++
 xen/Makefile                      |  4 ++++
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/setup.c              |  3 +++
 xen/common/Kconfig                | 15 ++++++++++++
 xen/common/Makefile               |  1 +
 xen/common/stack-protector.c      | 21 +++++++++++++++++
 xen/include/xen/stack-protector.h | 39 +++++++++++++++++++++++++++++++
 8 files changed, 86 insertions(+)
 create mode 100644 xen/common/stack-protector.c
 create mode 100644 xen/include/xen/stack-protector.h

--=20
2.48.1

