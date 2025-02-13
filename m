Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C6A350CC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 23:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888110.1297515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihG7-0004dF-D0; Thu, 13 Feb 2025 22:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888110.1297515; Thu, 13 Feb 2025 22:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihG7-0004bd-9s; Thu, 13 Feb 2025 22:00:35 +0000
Received: by outflank-mailman (input) for mailman id 888110;
 Thu, 13 Feb 2025 22:00:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tihG5-0004bW-BI
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 22:00:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2614::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f14eab3c-ea55-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 23:00:31 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7069.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 22:00:26 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 22:00:26 +0000
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
X-Inumbo-ID: f14eab3c-ea55-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCtjg6GymaLUCNBTNJ3FxFaKQze7hTi0pWtgPMc3CCke7/EOkeUmruvssKv8uhKWklx9mCZI5YBPCoBMleT5EzcfnDMgDysHxtvcQ3+ATKfJOM2huvNsie/zZu5zMEinljSxDI7XlZNzGhJyrg6I1tP7Yo/4QCA3xSYVm9AnIHt7ZxTHODgBSEn+Uo6faQyP/b4mzTSNNxHaEPAL9qEX4HDjZsx1AjC89ySEQHwStSu9pUrVTlKRttbeps6btMqIfQ0lVsl9nHF8qRv6ILhTPgFzLnh1pJJzhozSCQRPytwm+G2grD2nOxzGvsLAA1RswF6fmmc9L2qagQYry0y/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z48zfstCPipIM0++rCO079r712GdgAxs3SjTRnumUCs=;
 b=BEyGsPMEfvjM9lOjeuWS9YghI5XFsZtHmgClCyA0tLGp6iWpXQ1mINn/abaKkWOso9yeHxys6WJ/txDe/KOkgwMfSJn5QzCwj8acYD18s8lVDiT5UxtR1xoBtSdHa2t+OqH6wm0AcBBpTTFVFBiy7xjvIU01nXum7RxxGr18dJ0xMRWbLaTgej2cTTMYgAnLpB22bmmo+vIzBfupCgt4Ej9f4lVJGNXToyhJCPWfNafv57MpdBJoGcGhCELG5qSqGB7yNeduKePTZxrv/Z/EWNF9yVv43J2iNabm6FNi4DOfaAkjL58g6KCtil0419PWUeukYiJCFnLd37ihqG4o+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z48zfstCPipIM0++rCO079r712GdgAxs3SjTRnumUCs=;
 b=hjhiIuYPNBqLyY05TXwx8Hgb5wKLhZyNo25Qlii/2+UThL0LwgfzDDLhS5pCHoN27H3xl8Ps1to2vzntW3BAtYUcNcxaXWYnfJs9DKNFlXKTjHtjidPSowRqN51L/PiR1nHSkQfpWFIsYkc05V3sj6aJRLqJ6jONmkw6ym+6A+YLaouO7t0F13tJFSXip0c9WnrQeAYz4Ioyurwe01J47t8+5QPp4HGENbbMco8M9N0EDbvTU25slZZPaou7UE61lvhdZAk3zxLYCMMfTy+/OOFL20RHmVD9ggtoie6RPr8AGO/jHG13CGzJKc8FrXdhTXO6Y34br3BFs+KJHwSg4Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v5 for-4.20(?) 0/4] Add/enable stack protector
Thread-Topic: [PATCH v5 for-4.20(?) 0/4] Add/enable stack protector
Thread-Index: AQHbfmKw/tGT9yjL0kaIj8ILYUmnHQ==
Date: Thu, 13 Feb 2025 22:00:26 +0000
Message-ID: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7069:EE_
x-ms-office365-filtering-correlation-id: ab5aa7ef-8c39-4cb1-8d1f-08dd4c79d29c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/2o/b5M+v5xPwE5pLjjuk4ifYW3kcDpohVUniJgcZuO20o87InWn/meT3A?=
 =?iso-8859-1?Q?yO+k+6gM3Nqcmom9O71k5V8G7zvIbnNXwMOfRfN45z2G1K8XF4lochnYnw?=
 =?iso-8859-1?Q?K6PJ/CiPp1SHssu/NoNEM0NLKUkO8cFZlh1FgnuawKH4KiebLdXA3IWGs+?=
 =?iso-8859-1?Q?FfBEQKFCctB+uhyXv3dHtDI/Z4uF4AajkrSX84p96GVAmN1XWiswS/kjvt?=
 =?iso-8859-1?Q?fZ4BO7bjj1Z0e0d/oLBRpkUxzHcTx1TPPpBEIZO8baNmOOjeUV952j8KMA?=
 =?iso-8859-1?Q?aqi91f35PnxYAxBmvhyMFILvTp0j0lZiwzuZLUIHQs5ftNgq86hMlhd+E7?=
 =?iso-8859-1?Q?72cX0DnkDPoJLvdm9YXhlQlo2Zt9WvnSWLafXaSYms1PglxzuiZKnx6HTm?=
 =?iso-8859-1?Q?IH6cpOfMoCApeMcAcMBomOb3UgSvQclxuNNXIzCDqtpPnLX48xpCMysjZT?=
 =?iso-8859-1?Q?pZDH4pZV0VeU01Spsa4Sudvb2lgA9p/HuKNvfnqQK/OxMey7Jy1tCJHKSp?=
 =?iso-8859-1?Q?73Gu+epOYEG1vOdYHDrgFXGpKGWbc8F2cmJrcrTxpW/rgTiX+MO40HBaaY?=
 =?iso-8859-1?Q?PSegh7Lk/bbArIfZjnRvnIyaXuuz37M8zzo6SmlQizuvmd8ybwhgKQjbRq?=
 =?iso-8859-1?Q?2WwP51JsXf7KZUza9Qr5XkmrODWj7BLL4v8Uz9AExFKhZMX+kPAuMHR40v?=
 =?iso-8859-1?Q?USyZTeEY3SgQu159E0/Ju7MD+li3s2apieRX/7PRqu8b84TfiEFAr79i7h?=
 =?iso-8859-1?Q?bgh8DXwGd4GMFy+Eo8qm30Rr9zsvLQYSaAaLWeW6BxgMIxMo25fb/vPFox?=
 =?iso-8859-1?Q?sf7FR5HV4s0QuL1gErvTPhdmNhjQT+2kvVk5L7VO3V/awIjt1+xecmj3JI?=
 =?iso-8859-1?Q?7JXn30gXxZZozaeD4UrwRuQSUSzPYJvq3ZQHUFTrWWqS+yPezP/n6LxVhl?=
 =?iso-8859-1?Q?zM9gZSwVi+kSTlWl5HVUWSOqBIn+uM0fVM5XfqlWaCsXnUkNEOKjK1v+1x?=
 =?iso-8859-1?Q?lneFKd/Ur+47CMTbt3RmgbQHnCEFdFjPVRSLm3r63K8CZiO3OwEiYCan4G?=
 =?iso-8859-1?Q?wPwr61+OXTxoOz6gHy+D/TlrL60c/YzjorFdOavaliRl1w9tQWUKtplQzn?=
 =?iso-8859-1?Q?HB/gK3bX+Nvgjt30NGVfF+oXobf+gmwrzLECjkn9OcOH8TCCRMScZrOz9k?=
 =?iso-8859-1?Q?SGtErEhvXEhoXc9hfWqte1DS+vmsvLZE2Fl8fntxwBB9WPuvk00wgbEH7d?=
 =?iso-8859-1?Q?VqA0KuBTEPkle76M9Tiam+03eHeHBxMgSNjfAr+poM/i06VBEobK2nNImq?=
 =?iso-8859-1?Q?bTx+Ct9I2lLSIIC29n+dmO32YqdAgYRFwArsY96VVKaoSxPusxfeTAOyv6?=
 =?iso-8859-1?Q?VpAgDvdwasT9kSlp9lAAonpYySN7GuSSoRYGv2YAtKRRNlPAKQJ2XIkTwl?=
 =?iso-8859-1?Q?BIKcjDPyDZcQ6XLgdORJmokLwABos61QVnOWOiyiIRKtgpC4uyaUX3YH05?=
 =?iso-8859-1?Q?huTaMOBAUaj/0dgApZSWgO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xNzANNcczKkA257v5RI9ElWgjoecqc/+E310rK+PQEdGeYVN2ZGS0TGv6c?=
 =?iso-8859-1?Q?xlO2EXuy/GLukX18WpecTs8PHU1iZu+aCJNA9oyQHg4tMZRLVkKMGgaoU5?=
 =?iso-8859-1?Q?NtUj6WQA31nXnZzcjgz7yBWp/WRkGNQpMfeNjRc/ZMMAsGaqS5Famuhs4R?=
 =?iso-8859-1?Q?moB/aB/tOX/C8CqD9Jt+yXG7U/gyoZIlHWB3lW/1PasjZtCrEt3YeldO2g?=
 =?iso-8859-1?Q?5S+whMv7lBV4EqEN2qF9E96uTHtf/hJSZXyiINJW5CPomkb+BaJmtf+aEM?=
 =?iso-8859-1?Q?1boi1qlr8pJYP/yCYlI5mqMek8cvKSxP0+BfN54vbkMt3toGT46140oXMe?=
 =?iso-8859-1?Q?QH90YYUA31fmWJpMnRBrL3BANjeXxImOOM+yd0yMSiO4X+7Wpjglk1by1Q?=
 =?iso-8859-1?Q?4Cf6SVfDTtPA5p1LRvPvfK4DHgimHoWdrrFup+mvE3cWUe6uSyKJvzEyvu?=
 =?iso-8859-1?Q?TWlyjkTqNi/YMqzmRq/C4ORNWgQco+e/+hPKONUrAR0efJWImBwPnR9swc?=
 =?iso-8859-1?Q?4I27/gQuJliImw2M7CpDTuYTSXd09swePRkpQqn21SfAj25hQxozaQ5FJM?=
 =?iso-8859-1?Q?seKC2tc2SVzLY1UaA9/Fu9JiYEWLjOGSo1y1Iq5gIM/8pk6ByxCtdCDjjD?=
 =?iso-8859-1?Q?gVITGm0A4wnosVEm9UHdiiwTAhw6vRRVQvLkqhR+6qjanhWxjckE5YJR0H?=
 =?iso-8859-1?Q?3SlJYaiAto+mdsQTmRy6NU0dbcJhprvAVCcwloGkEiJcQiMb75IYbsWThk?=
 =?iso-8859-1?Q?x2D9uYO614AQ61T9rwNOW3PCO+oulZG9HB6NZu+1cRJ7+mEJSAD+vL5Rp0?=
 =?iso-8859-1?Q?s/kKVgj0oKPfS+r0Ojp//lBY9dnPd/6/oJYiPAva0rFgQtLZ5goWJz3sVB?=
 =?iso-8859-1?Q?rx0w+eNdh2KICYqmC+RIyVCV/rHcq3Bz8MByRmvRS6zQpg48xxwwOGgeF0?=
 =?iso-8859-1?Q?KQv5ZqWF/v0t95u2UM4r+1KMay9KlKZGk2hOfolT8NzESiscshmBmuUkvL?=
 =?iso-8859-1?Q?5akvGkcUlltB/FCv7Ftrfe+32Vbsp0XsOKDqpedIYziyrCRALYaFwS9JZq?=
 =?iso-8859-1?Q?OlolguVaX6MJY+VDIXwjIkLUDYHvqofHdnprVVJF2ik3ytq/J46mu9FVqn?=
 =?iso-8859-1?Q?D9kVgREhNkx+htt6b0npKjsWgWDnfs1XT7zRcgxTzWhJmShucMLP1+x95+?=
 =?iso-8859-1?Q?YtPAmOjZYINtx2j71ny/n2K3OvfEAl6uFqu2LGZhkS5esRsQfZMmXD8gCI?=
 =?iso-8859-1?Q?+zShqfC+Y0j/sfTG0+LslNs1j/rGL2qsljsjhYO7yew9xcMHdfl19UwpFD?=
 =?iso-8859-1?Q?jabs/Jt2jdHLBNTZ15Qwuv9ZbOf17KP2XVuXv3JRh+O9vTt+QdFsEgs1z1?=
 =?iso-8859-1?Q?pLZ0P/DNk+SgvGEiMSsxvNln86W06vpH06o7MPkq7k9/8M4Pq6y0ZT/5tc?=
 =?iso-8859-1?Q?RK0sGYLGHPorDUwvV3nMPjVE2xnbx9qGIzPESKPlI4f4WH6K9+SaNAMMTb?=
 =?iso-8859-1?Q?qWLSwZsxXi4RL4EqnJZ/dcxx91W9+v/2nOq4/Uka9lnMX0X1xhufFQstR5?=
 =?iso-8859-1?Q?rqEe4gosXplHlWzY0g/RO5gaKHMTshSMOroMDWtjTiCbJl7A/S0lGsvGUr?=
 =?iso-8859-1?Q?2BPpM+jXxn40Z1k+N/UUvvSNPf+uqczNNtXrZm+t3Fq7lld2g7v/yf6Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5aa7ef-8c39-4cb1-8d1f-08dd4c79d29c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 22:00:26.4275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9SO8+Py1RcTnlMClQf2NMb0PBtBPl8j/Mwyb880kJEOsY3/oIOi4tZu4ak131gDt0RizbRxNIgJPHwZt8Aw8enprlRS8NVvCckrkzwzBTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7069

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This series
makes possible to use this feature in Xen. I tested this on ARM64 and
it is working as intended. Tested both with GCC and Clang.

It is hard to enable this feature on x86, as GCC stores stack canary
in %fs:40 by default, but Xen can't use %fs for various reasons. It is
possibly to change stack canary location new newer GCC versions, but
attempt to do this uncovered a whole host problems with GNU ld.
So, this series focus mostly on ARM.

Previous version of the series was acked for 4.20 release.

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

Volodymyr Babchuk (4):
  common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  CHANGELOG.md: Mention stack-protector feature

 CHANGELOG.md                         |  1 +
 Config.mk                            |  2 +-
 stubdom/Makefile                     |  2 ++
 tools/firmware/Rules.mk              |  2 ++
 tools/tests/x86_emulator/testcase.mk |  2 +-
 xen/Makefile                         |  6 ++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/setup.c                 |  3 ++
 xen/arch/x86/boot/Makefile           |  1 +
 xen/common/Kconfig                   | 15 ++++++++
 xen/common/Makefile                  |  1 +
 xen/common/stack-protector.c         | 51 ++++++++++++++++++++++++++++
 xen/include/xen/stack-protector.h    | 14 ++++++++
 13 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 xen/common/stack-protector.c
 create mode 100644 xen/include/xen/stack-protector.h

--=20
2.47.1

