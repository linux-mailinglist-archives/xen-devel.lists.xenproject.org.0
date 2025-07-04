Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D58AF9BBD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 22:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033715.1407015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnC5-0006Ye-Oj; Fri, 04 Jul 2025 20:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033715.1407015; Fri, 04 Jul 2025 20:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnC5-0006XD-Lz; Fri, 04 Jul 2025 20:39:37 +0000
Received: by outflank-mailman (input) for mailman id 1033715;
 Fri, 04 Jul 2025 20:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSlO=ZR=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uXnC4-0006X7-5P
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 20:39:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd4d42fe-5916-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 22:39:33 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by AS8PR03MB9414.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 20:39:29 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 20:39:28 +0000
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
X-Inumbo-ID: fd4d42fe-5916-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGGo5880JsnoyrhyEIqJlxwBMCKu+g70WU86fSNOfbLcw5eYt+kQ05cKRV3/N6btecAcYJbZTggrDOyfQpA5ddAZ6DEhD5FxYxrEBvb1elpYkHCDNNiffQt0lTWC1uRlKn2L6Ui0vK37XOEH+WWJkY4SqiiDCoJa+fodrclmGT3gTXGUEJ1V3nxDMvXhIskmv+gAtBa8jKDfVm92gvM+Scuq5mwJZj5mtB8DP1BZCitOAsbEyS8zBGRxkj1PKvuSA686BlgrrTp6HOGtzP/L1j5n51LKqrNh/05E6syZnMyd6wFvSFSJxZF0IzBIdhKanTOhvfvYKgkJuGinME9KXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDxDC2PFyKagNJ8j9medAs2q+xpv7OqdKyve4CSmW8U=;
 b=dkzwyiu7P63hLucfHZTSoAhQCgfjVDCNa7J+IjkyskaI0rVuOh8h+bJ43FQbSotQo+RoD+GC0s0WEPBbN/0eXXWcpPR25RUweq+bZXEACAGsBZ6ETB+ab1sSqeIHtRflqwr8VtxH9h9zb3v84IvbuzFAomluI31dYDrOescx7EHa/8nlolEg+Xkm8ExKg5QnQloS1X9seyRATxtwPhaIDFic3h/1MMsQKKrVx7AK0AKtsgigqaKwN9nAlU1md7OsZjaneyg8azMOt6os0hSTuZobbC7OmupKIr6g1igPw17Qub/OXBwg5Ukr2tSLtK2ZtKsgB8dh5AE5poqqJiZtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDxDC2PFyKagNJ8j9medAs2q+xpv7OqdKyve4CSmW8U=;
 b=PmVwsebdVQ24CcCWO+UnKOvaoEssLoLT1E3dyWh5Sm7Rmw9aBJZN+bjWPSuaUcooCCoZhbXn0ILurtN3gJmwLr58CnTi/okgKoaKFcKBIRFLODrdUq933h1YdVfeUj3hb1JlHMVdLl3KX32oXbU7vYO/jODoElQmA5UgIvXnsdmopnbEphR9H4DkrAs1PaXP8+0c5VpCtYqzEk//kQ4I0naIpijlz//xdCAkisH4K2qfbAIGiJUlWLPJaiKiBLnKL6M0CBj6BwsjMimW2TFuuEYmjYdhwZWzqpz8fIjLCkP3WDOh8TAfkS8Q09VFUM2LoHvXfoI/C810XWphNaG62w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH 0/5] address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH 0/5] address violation of MISRA C Rule 5.5
Thread-Index: AQHb7SO8zwZmOLgOOUWjtzVlzh0I7g==
Date: Fri, 4 Jul 2025 20:39:28 +0000
Message-ID: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|AS8PR03MB9414:EE_
x-ms-office365-filtering-correlation-id: e765fc9e-0be6-4533-a7ca-08ddbb3adf40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?l0ZvJMnSt4kSA/Qg1TaUG/davteJKXDB/4j1FDRjNIZh1ydQqzpNLZZqm+?=
 =?iso-8859-1?Q?r3o/tnJ9FqSR1cUh/YVAjuwuNvkwOiggyIAhjri9Gb9DR3AfuuHeXXJExA?=
 =?iso-8859-1?Q?dRZeB7RVAEjGTPpBcnDISMKLjM638Z1LEpwivSdqu9wCoghav3wy+VrRel?=
 =?iso-8859-1?Q?sWrw07OB8MSl6Kv4IQY5HFRFUuOmIlgTgO9O12LDOMzopu536UKrjSY534?=
 =?iso-8859-1?Q?1Q3zOabrxaxZBTD94MkigaK/UUdjfBPdAVS8QBr/gCLd/0f1b/7VNFgWqn?=
 =?iso-8859-1?Q?7htxUvJOExjlncec0UVjsRvcRTNiUpb4FjGSBisH9n8y99qpLblp+FUFhW?=
 =?iso-8859-1?Q?Wqe8OCeyG31j0rpBbjNzLBMaR2tJuSq6ehZ2BJSpofNhalnQ4Ms7kk5RPn?=
 =?iso-8859-1?Q?KKO6AGpZQuwHLQE7xfiZaTyQp9jW8Y+802YdlXPlfTR+rPz7wd049ILRLJ?=
 =?iso-8859-1?Q?Lo8zlU7btESCRd/S9oVo+h7p6OLzytcAigdb0Ro5a0fK0YwkCU6Km+aNxi?=
 =?iso-8859-1?Q?R2HevfYa8poSk725Ss3PZV4tVg2XWITKA4Jg5Yecw6fFP1OcH19VhORfEy?=
 =?iso-8859-1?Q?Hysg44xyjqGrUDZ41vvW7lTco8NsqoLXsa4H59kQP+f7aSwt5Qa5T0rEre?=
 =?iso-8859-1?Q?SyWdDqGRAqakBRMi9ljoPoFXzpn58kuszqTxtv8y8xckPTQa4xq70E8H4P?=
 =?iso-8859-1?Q?7uUDfRqPVOmBgOkPZBZ7bd+Y2hqK6DL3l9e5jOrkmEjyfP/j9n5gn6Xk5+?=
 =?iso-8859-1?Q?w191/9TfKrlchjnTU97EvO7D0WBD9VPtgKO2kL8Qz+THGoS+NciLXv7cV/?=
 =?iso-8859-1?Q?BhtSOsYcJFKoIxFuHjzHQzx/UDIclV8Z1Ljn/xnJPbwjOxnBoZHRzQ2GL8?=
 =?iso-8859-1?Q?7DyGlVItGlSNfe15KC3qis2GLlwr2hjM0Yrv+4zN+londl4u939Cr189xm?=
 =?iso-8859-1?Q?9K/FlXMz6mAe85h3YJGv1TePShYavlXLZkOjzU+5ejePGCRhGCFfn9vfa1?=
 =?iso-8859-1?Q?kqoF+mcfUqRb2mNHiCMvmPJGcxjRqGqwFAEDISVg/MOvqvFUCoUJYQLXvt?=
 =?iso-8859-1?Q?gpZgHOghO3Myqpd9McSQTogpiyZmOKEJkkJ/9HnPyimmeoNdYZdvw8yfiA?=
 =?iso-8859-1?Q?iEr4AvcvvdMJgJOHdWV8Q8/1CW8AxmsFkjuZv0UOJQjyoT52oKpkJlZpuR?=
 =?iso-8859-1?Q?ms+pjBoTMXwhRJ1dnK1A+PrLCMvfVbMMtyjhF9JirZOBiG2SmwFJsajiHG?=
 =?iso-8859-1?Q?yV+12riq+JUoW7oLdnW0kE1M4Dnd+JY5bKgCHfox5i385BT971yQASLVmv?=
 =?iso-8859-1?Q?SlBXqd/A0F6OfvuMMLdiKmlGnSW7abypjS48K3o4uycYGFyGgZPd8noJjF?=
 =?iso-8859-1?Q?/tNndOxaCXO68YHPQaUoEQuBsQgJ1chCYSMkEsDj1ERZnEXNL9ErXNcms9?=
 =?iso-8859-1?Q?G4Xlux6Et8SOnuE/MgVo1EEcDYZZFfsAmgtsbNyTI8QvJRCxkw9jCWbIvH?=
 =?iso-8859-1?Q?PwkDg1oTK6tBpU2FFDTE7aAJxgf/yC+Tlqht/+FYR5kkbqG9U+Pq6pgQ6g?=
 =?iso-8859-1?Q?En7m7Mo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aEjlxzmuiFb307xGGrORuEZa2buNR1Y8+eIYjPGGyL7bMrU6gYDLtpefzY?=
 =?iso-8859-1?Q?J35fqA3PluUW3fnuoAdPj9a3TeXxyXKWhPvDu127TinI55EB0o/yzXtCHo?=
 =?iso-8859-1?Q?jqPE7tx2zsrY/W7zUhUeO7ypj6a1+FBRjuS6nni/SnvjtKleS0fzu14eYZ?=
 =?iso-8859-1?Q?rQFlQMAaBsOLgJxPe0kKJ30OaE8SlvTd58dQ7yUbDDhel0ylbH5/kCdpvc?=
 =?iso-8859-1?Q?UQ4vFfn2COXLbRs62el6mGorm3N4M194YgVrtX24o9Aw94WLtXKi5rXE5P?=
 =?iso-8859-1?Q?yywe0ZBn1Iyp8yw2nQZM8I0fjV2igr192/Dh7w29W0EjLBAyI8sCwzfwU1?=
 =?iso-8859-1?Q?mbSdy3afNbR+Ruy97vvqQ0btrZ8FGz56d1to31qiNDMkAWaG4ALHDTNXwQ?=
 =?iso-8859-1?Q?Xdxzp9myqfap9m2J1PiXPNWqBLwfOLXaC/fwsIII657Mh7J/VxCtkn1llX?=
 =?iso-8859-1?Q?GTWdvONADFahvNOKGlutzFRZfegqV25zSUDEYa06Bgcrda2ua4oCJX2fjn?=
 =?iso-8859-1?Q?G49Ke5IusWebBr3WPMhy1GZrm7LeLqnjRAkEYkr84isGA82DjmV6+QuG3W?=
 =?iso-8859-1?Q?06+E8qkTG/3xP+zZ7cFiTClaOnNK71/FR+Q6oADv+YpKM+rXStD9qo8vtX?=
 =?iso-8859-1?Q?3nBDdq0SQd7RDCmt1WeTq869d5IhQdIX6LRrXP3q+lQ1ZkyQIpbgXa5Vsp?=
 =?iso-8859-1?Q?x9dDoQeJg7z2MNhH/r9LLwncf8HXzPV18aa1RRHc+CutgZ0Be2n7DhK88y?=
 =?iso-8859-1?Q?PQZFgdERLndDGvOcSMeMUymEYFzPnalMkNWoj3KpbaXTnRFvEonesj6Yq0?=
 =?iso-8859-1?Q?FlRvA727zv4SzF3SeFVMd9cChF+TS3Y/FqLzqUc8UlrM7+cXkuyXfzB/vg?=
 =?iso-8859-1?Q?D0XeiveG9MbXMza2n41QPQa6J8ga9UG/5fGp2Me+G7th3JCfIQjE5Vld0r?=
 =?iso-8859-1?Q?nYtu/EmKXZuHB+VRb+4tF7TR5BUK8yjR1n5h/jfk8SCeicH9BfQgxbeCdS?=
 =?iso-8859-1?Q?WY3CrcxYlmnZACzbvHV2w0pt3qJ5+5fg2K+auUr1FnFfPhu60NC0o+Q4wl?=
 =?iso-8859-1?Q?QsGMNUUGmtx97jlvkU7bQhLjRAapco2bx4aSm9Z+3JGditgG4ZNxcCkqpI?=
 =?iso-8859-1?Q?UwFwYmwKsa1U/BIwXTPoCwvVLfbyAwokFPCTeTwk9MKHICqyxW4uWfQ0+A?=
 =?iso-8859-1?Q?eNuwKpXAAaR6RWn1iObqycqVYCIp8NYFk8fIa/CnuoDmgJ+8O3DgfdY7pt?=
 =?iso-8859-1?Q?Cb9FQ9Vsjoc5xx9lIme9KgbsXggGJmAA5cdVqWl1lw7n+5pRDfoVAOlt7R?=
 =?iso-8859-1?Q?EsD9wy5/+e1nwLEXG+IgfoM/yTYApWV8ZzW4VqN//JGxuHkt8L2DoTypLi?=
 =?iso-8859-1?Q?fF2A0aUON4AMN9Iw/DQrEzuOGE8kmVjvekgnv6MnO81iCFf4wBPntR7PIe?=
 =?iso-8859-1?Q?zX1CFIYxOcd/3wVdyGzCV1WJhumkpwIuo8TqoCmhbIIRyCwyUBLSSq0WZu?=
 =?iso-8859-1?Q?g76spL7piCD6jgJ6pxEK7o55k6ml72bCLimQRgfyhjmx7JV9b6cia+l/7k?=
 =?iso-8859-1?Q?8vpXf8joHKP+TR8UvMXxEJKq7rak6gC9HTX3j+wHeBmspwmNhcBitwCwD8?=
 =?iso-8859-1?Q?z6IESViYwfU18ihDjJvT9WsOCV7zd7C9eoha5rdqVraZTHIEgSL+fCQQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e765fc9e-0be6-4533-a7ca-08ddbb3adf40
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 20:39:28.4463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COQ+Jkau8MwmQjW9hdHe9VoGCxwnwymY4o2P/6ooPYBdf3Ek4KFs4971oW+9pNUB8Xp8IT9uYoyupZBMb1PIvFwr9LuqLE29cMxnknuuoKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9414

This patch series fully eliminates MISRA C Rule 5.5
violations for ARM64.

The previous thread is here:
https://lore.kernel.org/xen-devel/48c7830931a98b2bf70ef1509f309b262b9e5792.=
1745427770.git.victorm.lira@amd.com/
where that violation was proposed to be deviated.

Dmytro Prokopchuk (5):
  gnttab: address violation of MISRA C Rule 5.5
  iommu: address violation of MISRA C Rule 5.5
  x86/irq: address violation of MISRA C Rule 5.5
  device-tree: address violation of MISRA C Rule 5.5
  xen/bitops: address violation of MISRA C Rule 5.5

 xen/arch/x86/irq.c                    |  2 +-
 xen/common/device-tree/domain-build.c |  9 ++++-----
 xen/common/grant_table.c              | 22 +++++++++++++---------
 xen/include/xen/bitops.h              | 24 ++++++++++++------------
 xen/include/xen/fdt-domain-build.h    |  4 ++--
 xen/include/xen/iommu.h               |  5 ++---
 xen/include/xen/irq.h                 |  4 ++--
 7 files changed, 36 insertions(+), 34 deletions(-)

--=20
2.43.0

