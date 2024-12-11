Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B036C9EC1EB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 03:05:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853574.1266985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5d-0004cN-5W; Wed, 11 Dec 2024 02:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853574.1266985; Wed, 11 Dec 2024 02:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5d-0004aF-2X; Wed, 11 Dec 2024 02:04:37 +0000
Received: by outflank-mailman (input) for mailman id 853574;
 Wed, 11 Dec 2024 02:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZaY=TE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tLC5c-0004a4-8f
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 02:04:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2607::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44d2ef2b-b764-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 03:04:35 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9365.eurprd03.prod.outlook.com
 (2603:10a6:20b:57d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 02:04:31 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 02:04:29 +0000
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
X-Inumbo-ID: 44d2ef2b-b764-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ateuc/89uYLq+AWZwc/O/XrrNINlCu1oghvI7Q/QydrfTVCw1DLblhLtS0qnRiV8XE2QCwpzXKAjG+joj4KUG5tt8VFurtq7PoKzi1sPSZ7khxuagjCJpakX5qhdsJPGowY/ofkmJQ28AftkYzxed/P60x/iHVR2AmJGUMQNpt+JJ7luTpgOcR9CihM6is2tqCLWaiM1iI4x5/xblAUAuxzPd56Euy4lxsNtL/fKE8WqEj3tnJtMXx//Ym4HxwU/vHy5RwVjpM/G2Fybt6B8md1QgT5H+kABt4YYmR/+YTHvGoKc/zaTBTJO34jk4Z338dTSSmuMufgGSQHggNi3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uyBEB374CkngndbajozsDBZqYCopKoEd2ngGW9fDSo=;
 b=mscycyAlL259n0oPg0QusTRbSe9jQ6OruQR7hMzDbDgY85ptBQLoa9WBeZJMn7YkXQoR6zRUJd9adso83D9k0ZFVYwn4twC6ehgfQC65TbzAOn++6ZLKEgjslQD92F8rKVVapSgoKix5u7BWLlKlV3XdHDPZWrG4pZtjPma3lLey1opAGDKFYDcErVQUj/+oHeEvv26FBEqkwLmaQ9RhkEvWZWQxoh9YYanCKwjQif7luKnCvb/XSDbVxBIjUQepiWR0Na6PqvLyrkZ6FW+hmjrda2m+uRePKSLSrizBiNZPgYcBiiiyqY3Wv6lxYc7RSFjoV7Btc8s/aFQOYl8RNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uyBEB374CkngndbajozsDBZqYCopKoEd2ngGW9fDSo=;
 b=s9NurQTpMoQH5RbjDWihsCXawiE2+8SoQqLxDCVP1OjWDDx+MqwLsHNwfPi1Ws5jm8RZ3hhrk7YnvOm4JFUJg3iSVI00wdcQqM15xlrzMe19Z+416aF5AO6eMlUSCDiVJ/cA+arh7Iy2lbr/wTe7khIiZ14v9F9Cc1L1Tdh7NYAqgAMKE54gj9oF1erSIqw+Gip+7Gz8kxg9tSCDb2FqiA5QRptDYiy9osL3tXnBMrKSbGDM45prrIPwsVgH3kpfwmtlbJyBUeE9+Tyx9gtGaOrbDXExbENLo3iOtlX7b5fbkQ/06+1e/YL0Hl6lllPBMHOAKp/sTPB8EF88zLlZ6g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/3] Add stack protector
Thread-Topic: [PATCH v3 0/3] Add stack protector
Thread-Index: AQHbS3EDPfnUwIrgWUmXfq3bo38udA==
Date: Wed, 11 Dec 2024 02:04:29 +0000
Message-ID: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9365:EE_
x-ms-office365-filtering-correlation-id: dd24ca12-a166-495e-106a-08dd198825ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pfQRhg3l/RI6QZfYOm6U5donfnKRg2D8OET4SpphdqdcK4c30yJuTeiPH8?=
 =?iso-8859-1?Q?zJb0CKuYpe86WgtLrmpcX+YYTIAgyegOWCSBy6BUt7y4sTKvKTYIP9saAE?=
 =?iso-8859-1?Q?M8uj6szn2/u434rSVqGWco9hFb2IZCmTLgeB+K/4BMbllDdck77xsSpBms?=
 =?iso-8859-1?Q?aYC0zSRVB0HyLfd7Mf7mmdck0l6e6dLXL+U2o4ltwDIIUROutD4muGFSPi?=
 =?iso-8859-1?Q?bxA8o3G9JrHh7DqADKCxgar2jReOgzrEpq+llb3RprlVZW4YLeLAEgg3Rg?=
 =?iso-8859-1?Q?oNItC2S3hqWdrytgD3iPbVRnPAXPEt4vuwEGjvW2TaOeaE2ak+whP71ya3?=
 =?iso-8859-1?Q?7lkN9thX9sWxI4yArGr5Ujc5FupHtRo/wznSmfXlXZVWAFp1VyM3rGvAHX?=
 =?iso-8859-1?Q?8ZeyPw385grvfjz1tW38PVjart6RCamN6alrdT3FyCIKmga3/j4ZvjgmgB?=
 =?iso-8859-1?Q?0EDz63dSxnn0rdfnS6/gra6/H6bY+Nik2XAHhFscR2OQZ8FCG45vxWiRuY?=
 =?iso-8859-1?Q?I8C2P+ja3yAp2izOSA80tc0ji5R6ya1u6hr8IrWbdnu0BRhRCwRWbP9aI6?=
 =?iso-8859-1?Q?iKO0GdIept6wPv2zty+570nhM88yuurzB5p0SWCoNUbhwuLhoYWOr5cFYx?=
 =?iso-8859-1?Q?5mFQ89j28A52nOaNbyydhBKtWwoHyd+Pwj29vXxQBKFOtcVg5iahmb2D42?=
 =?iso-8859-1?Q?N/63LHAuuLBK5wDLFA8tpPFnIr9yXUTsptV45/1LekYBE2fW1MTJwJbDGB?=
 =?iso-8859-1?Q?PWk42QJkLQxnZymFOgHwNEX4bwwj78p6SCOQ/5tEtdz6ERpxj5VZLIYFl8?=
 =?iso-8859-1?Q?KSy0Ia8NUtnOyPGkG1ebSa/fcum4gqY2MujHy2tW2QeHXK/j/gYDAA5KhH?=
 =?iso-8859-1?Q?XOYVSpgUCKGJp60uXvYCUK/CPuzfpdt6GXvzJJVuSS6gujuxgEYaSHw2Lt?=
 =?iso-8859-1?Q?Cb6I9Y4onv+ZA0tWh9b2+SXhZb8F2mC4Mn3rSJTHvJbfqApL970jiVU9TU?=
 =?iso-8859-1?Q?ShXxbUJdRhjdsyOXRGRS5rsLTx3Mv4eUPjUyV1u9TDyS0VLzOjd22HuqGt?=
 =?iso-8859-1?Q?Llr+yZsDG8T5W3nmExUvlgvfBSFGyEiPzTiw1H0YHq2dE7Q0U01ysvKe4w?=
 =?iso-8859-1?Q?NYRRtXaO2LGdzoJb+58P+73rgzYZZL93iA5QRIHDGbdzD6rddCtFIE//86?=
 =?iso-8859-1?Q?VKVYxwUnXwFJhZPtweOzfdr0piDQZcCYkpAHrOx/Unb7Sz63EZSW1f3CTS?=
 =?iso-8859-1?Q?D5aAnqUNHp9N7HG5gNmoUlbMQ/8LKp4/BdBsGf4jIP5yU0IGsAZSCiGofh?=
 =?iso-8859-1?Q?1XXgV0Q7DtRwu6YlWJ2Iqd3KNJuHajJW1MucYWucMHdeV1bno0G2i3vLul?=
 =?iso-8859-1?Q?PSE7JoGmzWnxde2+HEutOS5averLIwTAamk0GeRqUbsfVoZsagsqQ/5z15?=
 =?iso-8859-1?Q?dVuItg2sYMI+NZ9ngdVV8B/bAYdpGNbn5OaPyw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?zz3CLDNp7SH81XDGzigaXfz7dTv8QhrxcO5zWkJ4jvKKn7A0CApwsj64Jn?=
 =?iso-8859-1?Q?uPk6sbxY0CLtj8RAcTNCYfl23rI+X1hfeko2EPOtA0X1lMqvP64YI4r25g?=
 =?iso-8859-1?Q?8CRJL4C09hihWSWSco6mNZniU669+IMnJnbrwFSSKmvMzj24QgONLk+zrn?=
 =?iso-8859-1?Q?Ft4a5f1jV6FUeUJi0WumEzPZu+C5z4tMNQn9sQ38mGbkrk8qbw7MnqODMY?=
 =?iso-8859-1?Q?GxuM75nuNZJksXlkuXB2bOKjDaL/cjY0pacUT/ib0wu1mhMpvWqXcoQGR+?=
 =?iso-8859-1?Q?vi89B3Xks832F+C1EGGcOVLjufC7ZpeE62hi1A5XSnKFABCFT1TrJ1LksK?=
 =?iso-8859-1?Q?JwCJn/ZhVCwtPTdXvLk7b8zxC2maeyJdEqi6bbii/Jquw9welrSbry7yHQ?=
 =?iso-8859-1?Q?SawOKyvFYgwdI52oWlOKz+2VCInDLSRKsq/XfBEI1BDDtfka+b1lMwzrSS?=
 =?iso-8859-1?Q?d7XV7mxXXhIzbdKqcJIUEek7CzbvEsUol9Q7SEqlDZXG6/c8Zc8VWUEA6L?=
 =?iso-8859-1?Q?rIu8AaHaRjKyKi4EC47Vy/vwkx7xXSk994S2w2OAlBQo/Dm96MoGNfUfnR?=
 =?iso-8859-1?Q?7vDjSqjUDA2Nwv5XAOb94NHQD67nrDbMF432f65bQNgM3mfrmlS4V/WlUp?=
 =?iso-8859-1?Q?L2KWnILokkxyekg/5MKJHje5qy901F3uqRU4Om5PIgGoEXvZk3WFKMW42V?=
 =?iso-8859-1?Q?QSXxo7vuP8FCEONRjRjQGY/cjubmrPn3qZuKG5Gj7jAiIkHH+190AWKUhv?=
 =?iso-8859-1?Q?TL9iBZvPU3iitE4mA2T8rMazdwJt53+lFEAoeXLBSb1GZ8iAtG6ndGpeaR?=
 =?iso-8859-1?Q?7RVe2bmMA0SstlZYR1kE/MnplCa38/X9A+9/HbzrgCrAzCf+kxSYCUZHe2?=
 =?iso-8859-1?Q?pSJozd6XS26bSJcXSWraMehNDbyVtFJOk1UUHL9tbxtI2yt/9fvOZaMMiZ?=
 =?iso-8859-1?Q?gp7XA67DiWJu6Dt55WwItxqeknQFJQRt9Yvk1BskThN8SsfbcfrtFk800r?=
 =?iso-8859-1?Q?NLDdQq0o59ncTuTz0UvVWHNUM7jXX1vvWYDJlG6AdIXGlYeeTnvxF2ec0f?=
 =?iso-8859-1?Q?/1SWGG9V9nHypZeFNjhOQohvGLWiExQsZ2TmnnM8bQoDFn0o3SWegjnyJi?=
 =?iso-8859-1?Q?c/2oD1lG+Z8I65Zyg6OL8iZlHKGNHRPy5708svpSbHtSGnzfbSQf/sot6U?=
 =?iso-8859-1?Q?935Wqu40MCuqMYsLJnD2Si7n0uEoU8Eei8OtAjek/4kszZudUjHQbDx5Dz?=
 =?iso-8859-1?Q?0bdYINPSkpMBC4HZ/ID8zOaNlbchQqOW3dqjC8aLyq5qxmyA3H0m0Caerv?=
 =?iso-8859-1?Q?/ttXO1sKqGqZKqMc+28lrqi9fNC4QhbHqXgnMzZt4CdPJVTbzHb5O2TJ0s?=
 =?iso-8859-1?Q?Qq1bvgzhtzOiF0G1z8vIeD+B6q3/pC5DOBkZNvc1z4knL3SUJUjoldNeaE?=
 =?iso-8859-1?Q?VO2AaxLSFNV4DlbSDY44L67gWYNtw2nPJbk4ZLVSYujxM04kzaVvr3R6fg?=
 =?iso-8859-1?Q?yy3ERBLyRMm5J8CXVqKDMwtwoAnl9NdX6t6SzKR21J76eDrovyP0UIn5wu?=
 =?iso-8859-1?Q?/XVsOEk0xkopp13g6TH0yeDVFXKNg5sbtPeg5Bj8+gIsxQxoJg2ltFZLsr?=
 =?iso-8859-1?Q?1Sj/OjMH6+x7B6g50lRVm1NZI6Cm6WLfbT0ps3uEyQpZ9VDpQ5iLq8+A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd24ca12-a166-495e-106a-08dd198825ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 02:04:29.8916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0bjWrczd/9bM4om1FGVNX2uU1gsNkWqpEI1T/oum5xSjuYv0Mny1F4HtY3o2oOJzE5yVQbtGQDTAFJg89I60z1nKvsYMSOPehrqBXh6ITQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9365

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This series
makes possible to use this feature in Xen. I tested this on ARM64 and
it is working as intended. Tested both with GCC and Clang.

It is hard to enable this feature on x86, as GCC stores stack canary
in %fs:40 by default, but Xen can't use %fs for various reasons. It is
possibly to change stack canary location new newer GCC versions, but
this will change minimal GCC requirement, which is also hard due to
various reasons. So, this series focus mostly on ARM and RISCV.

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
  common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature

 Config.mk                            |  2 +-
 stubdom/Makefile                     |  3 ++
 tools/firmware/Rules.mk              |  2 ++
 tools/tests/x86_emulator/testcase.mk |  2 +-
 xen/Makefile                         |  6 ++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/arm64/head.S            |  3 ++
 xen/arch/arm/setup.c                 |  3 ++
 xen/common/Kconfig                   | 15 +++++++++
 xen/common/Makefile                  |  1 +
 xen/common/stack-protector.c         | 47 ++++++++++++++++++++++++++++
 xen/include/asm-generic/random.h     |  5 +++
 xen/include/xen/stack-protector.h    | 30 ++++++++++++++++++
 13 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 xen/common/stack-protector.c
 create mode 100644 xen/include/xen/stack-protector.h

--=20
2.47.1

