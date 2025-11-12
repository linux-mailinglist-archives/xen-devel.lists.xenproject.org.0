Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0889C51C6D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159695.1488001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8S7-0006hA-2e; Wed, 12 Nov 2025 10:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159695.1488001; Wed, 12 Nov 2025 10:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8S6-0006fV-WC; Wed, 12 Nov 2025 10:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1159695;
 Wed, 12 Nov 2025 10:51:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulhw=5U=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJ8S6-0006fP-7U
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:51:50 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96e10857-bfb5-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:51:49 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB9786.eurprd03.prod.outlook.com
 (2603:10a6:102:2e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 10:51:46 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 10:51:46 +0000
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
X-Inumbo-ID: 96e10857-bfb5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUhiXFLywyOHp5fHm7QOkFavZ5Z6uo2+5RxVw8ZMZKAAmwu4OvahnH02kweCZ/oIAYPHhVhCtsatjVlQ8prw0++LSFFBi+9HNySmfwAL/v6t+ZzyNbD5xdSY/e93YjNmfbB8WOYvmlPxBNsUY9fHRmZNDeObkjJRj6pObQRXKhlk829uRQR4pKXUrXdhT6daYRP1L4svSyT2pNtqwU7f/emSQyeKZ92rs6QREYqcNBv/Vdg3g3J+q0xLhSzZqiCDy9FrQqZZNXqZPICzUI5Bv0bClThFdaZBUClqdcQzDOJL3FA8sm8h0DSCAFrxT5e+Azwnrv36vi3gAJlozSAKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR9jAYTpubrvxc8ShR9MMo0f5MmFAzXVAJSGuuTt3Po=;
 b=TxGo4KenQJT/KDnLydluVvW8I6xiLHJ8nwdKjCJAszoMQyGMfd+n3AHJB2+nLoBCPECq4ZoQauKFiRu3LWr6ScTZvQMRF1OB2iA+pAych+WxXT3haBAkMpebMNMCBjnAP7FERCF7G5I3Z7jQmOvm05bwypoK3155vKZIkrWL9ldWvo3HdHGrSP0EL5YB35GOqGTSC7lJj9O5FLJ6fewc6rcHennRwEgMgZDtNDZAB187pzYJUVF00II5TjvSjTJyEFKv8Bx+1eKtux9goIW6IveFw6dhE1qqwaSditBkbOVZEwIY66wj5g09uX3CNVbiYEoPFEIn6vLuvKL3eCUUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR9jAYTpubrvxc8ShR9MMo0f5MmFAzXVAJSGuuTt3Po=;
 b=H+l0bUATkWjtHceeI3nNgB92GqiSLqPITl/yBYccXm9BYORHgd/6sU/7bDezzlg1B84AAozeWepMW6jst327L5QaNl7I6Ndd7SpNzXt4ZeYJ+r7rxHbw9VXMOR0iqPrZE9b4+pz7xHZ1roy5SQd0lHcLE9v2IAuiy7ZLgTzbNY3AQffakzOybYeOgATSiuH8KIMDwcqrUynezSmc+AFVKWjGst19Y5vDxfA6OeqnRE8S8NerabG2tHqeFDol3t1RM+yBFT4aPOb1AfaEIUukSVbzlaEwxEzqCkSxKoXBYYudGhr3TcTHOBBI/JPQG4JuyJ51FYu/ijcY/85pLURVuw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/8] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v4 0/8] Implement CPU hotplug on Arm
Thread-Index: AQHcU8JXoOHRlCVaaUGVyvNzAw9qGQ==
Date: Wed, 12 Nov 2025 10:51:46 +0000
Message-ID: <cover.1762939773.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB9786:EE_
x-ms-office365-filtering-correlation-id: 8a9cc670-f322-4e49-24db-08de21d979a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?t3okICYxMEpKeL0rj+lK9xBfMVbhXR9BCUyaO7ZVR9i8SZEXCBrdDY9ngQ?=
 =?iso-8859-1?Q?UKpcj9IbCsPbcy0atoinm76rhy1AlnkxgdtwbBgDb44Curh8ok+4j+tBJd?=
 =?iso-8859-1?Q?94d/RrUnH+NV9q+AT4OUCva+fXaKmzb8QfAvmmU6yVfdUE9KcvCgBu03A3?=
 =?iso-8859-1?Q?AshK5vThW1RLn2/RoMcqQGpwM0PL6lZ8LmPCx60jDq13ulVMaD4eK07yWk?=
 =?iso-8859-1?Q?2uIH+tE4bq3+oMcLN2Cm9m+Rkk30I/1f1rwNsy/P7HRRcTpTzB3UMyQZdZ?=
 =?iso-8859-1?Q?XZl8sdtY5KM3+JJ1lU6pvyz7pgXWvz4+0PihkHIHWdDweV4jpf5h0T9dEt?=
 =?iso-8859-1?Q?jYGKmrQZfeOCTIKMMeWFar04E4PszQZljiEGP1W8Kpw3XCUQdV2qT1cSw2?=
 =?iso-8859-1?Q?J8Dcx57+C00jLkPma0q2CfwvbAnbVXCQGF1DPG5/tAFdOiNTIEyP9hZkr2?=
 =?iso-8859-1?Q?t2npyBPm8VgvA208bm6EBLzPqBIxbkwxd5prfphbvfPavQDrKCMUVpxqf9?=
 =?iso-8859-1?Q?yV/uuOwl8ytRlztCiIumVzvpT7c4pRlOANsm1M4C6AINz+kcmmY0fASsh2?=
 =?iso-8859-1?Q?4BAclYXyn6RNtJyKwTptNVIY8vNOI4UdvaTK6AidWgg2i6FliLGkF+NXr1?=
 =?iso-8859-1?Q?kqX4ndWNOTZS74pCaRPe3L2/wJjNxTBteegRA0L+VigqYfOxEzf/zCA+jr?=
 =?iso-8859-1?Q?pllg9yJoytaK4XlKMaIgeo2SKGOKp7KyxXPvmeympU45DEIRAeg5s28z4/?=
 =?iso-8859-1?Q?iD0xUKU3ptUX+RZd862bzcgtWi9sRE53CerT3WXODitvnAzkvEVA+mCRUB?=
 =?iso-8859-1?Q?gyG991pQhrkR7M+zQpBLLvNbppqiGTbM5Icrfsy5tO5m3yzOwtu0MIAnYm?=
 =?iso-8859-1?Q?it5B3RhPCN0mBkc/Zu5SGiLuK3uyJak8+DxRyOZt72ht/jk07R3B6J1v94?=
 =?iso-8859-1?Q?A8X7UEEriDr4Q0PHIC8855Pxu363jzFsnT9JbSY6bvXOdwGYMjRnuTlImB?=
 =?iso-8859-1?Q?MgSW2D7uvWzbHGRI2AeiNZUNw7DgM+CsrU7MHrtgfuBa9ws542wVchhYqz?=
 =?iso-8859-1?Q?hljSRefKG8RO0hbBdy04+PwRwO9PM3HWQ0hg1BcL2Jl1DMOnwZgeY3bO/v?=
 =?iso-8859-1?Q?+1hNYVl1x9CP9Gnh9QZP9baty0ta2xfwIMP0QMwWErHwg8Kf03EWFDDlr7?=
 =?iso-8859-1?Q?roN/aVbRU4maJBEUOLyVj1LnUPJ2/5+9ZrwYc79Ew+gAZocbNhpQWUR3QY?=
 =?iso-8859-1?Q?RQmN6QWM7GI4GetybUSETGssSNxeRFlOMI7kqR1iW94PkzkWptS8YzuIaM?=
 =?iso-8859-1?Q?4Juje8kwrDqxxFa+qOkehslA5mi5uO7CFi0/IA74j9i8PZ0xKi1y8kim80?=
 =?iso-8859-1?Q?M4yxsF5Shq0/2w9SMkslOFjpDl6B9Ud72rXcdWVwOl5xbPfeq8ual1xTAE?=
 =?iso-8859-1?Q?bbrXxOfrZhs6pBBxUj/vCfJGsOveREq1SbTiZ51vPPuFUB8xZredX9PMiL?=
 =?iso-8859-1?Q?4O+wYunFPr2lwS5vjqFO2FJZ8H7UMR+tu4++LRiQyZd/0QvALJQNI55ooJ?=
 =?iso-8859-1?Q?Os9OvnDMWlN5CaGAFeWvLDSYwR+U?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lCMsk5OkLXQqtEF0jzfwqW7va2BrDaVfP035yLXkvzSeAFnwljina7LJIG?=
 =?iso-8859-1?Q?0zhc1PLz+X1UdCP/h37TxNAmvGiyGFF1mOEJTEqRHzEm4JASwGPyIe0Chl?=
 =?iso-8859-1?Q?XHSBkjWxQ1SQBDBGPdt0ufQttD4haWjGFvIZZtyGnGSMpw3aGMmTVaoZN4?=
 =?iso-8859-1?Q?8s+/2Ne9HxFfaHX0o1ZXZifGVdDNc02oH89vlNqW95yuXl9u0hfCrCZgxK?=
 =?iso-8859-1?Q?6egjzV6IJb8OAbV8bImJJZ9/TfWKLiqOAsofoI+gRgs4ms3GdofSyIZIzE?=
 =?iso-8859-1?Q?XoSybI9CQQ4sGQVdSrOnawTPJizKFAfR+ro31imXe4x4YubdzPKYpTUbwH?=
 =?iso-8859-1?Q?p9xdna3IqlcDYVi/gSyfF1T2x+rVLCGA5x3GwT2Lrwq89WaJJ9uvMRC5ma?=
 =?iso-8859-1?Q?apUh6XMszL2rNSfnPTRKMfOnj+rw2CZtLCii629MtM6p1u+39Osd5DinRE?=
 =?iso-8859-1?Q?nYk1RXzkFQW+U+bUrS3uY5bRn2Qf09kLUljcNS6OExm2dsR7jdC+eRpaJY?=
 =?iso-8859-1?Q?ODfvwxs4Bv4eKSxVDec/rvfmz1cll06Zv/N18H4Mv5Shtz1k9xT1OfcRt4?=
 =?iso-8859-1?Q?eo1YcJ0L0DPehu+du/ckZG+1EZ6VLJfVoeUfQxHSaxJWqIjE8eFeiKkCON?=
 =?iso-8859-1?Q?3vo2hne9khy31+jJWikZl+bTWmvQM9O65NML+T3RQMAzfpNyWTjN04YLFH?=
 =?iso-8859-1?Q?sh43kjLUnyJMjiEOviLkbKubNcBGKIMjcntCxwKq8BgOoTVyKtQqcfHDls?=
 =?iso-8859-1?Q?p98MVFDbdZ0gE8AbeHBd8wTFu3gzWl+obdxEMZVaxSCfIrjq7dUz6tGGN5?=
 =?iso-8859-1?Q?Rp6RDTKphe0+1gqd3E6hVRUTcVtT6RaeRy/s5G1AyD/uNw8s/qEDzfomDZ?=
 =?iso-8859-1?Q?/6y3DCMgw+vgFhiEWgOmN3nWBBZIFLAEQxXGFW/lpMCnTb5mUan2mdDhbU?=
 =?iso-8859-1?Q?PMtM9oNzMu3UvWVgt6zzU5Sr5NkVAGRjLuf3/t5qwgjK1ySq/YAN5gUdiX?=
 =?iso-8859-1?Q?g9/WJUuZTzkAG2qDSFn1DUO2oZ+rmW54Qv6LaOn75IwtUxm1soRvUnoAKK?=
 =?iso-8859-1?Q?S76F1qqdN05RLcWsQky3PRTA6s80OsjCO+yCVqyqh/E0Fnqe98VdLEMzkf?=
 =?iso-8859-1?Q?kLcadBSCF69sOIL8tWAbG1cZI2xsQU4d+MA8a4kx5c5p2AVFoZ+ZuDtmfQ?=
 =?iso-8859-1?Q?X0LfKKkO4P9W1CMUytja+rn1kYK3HlrjYLUzfw2SE61G8tSzdNltOln+dj?=
 =?iso-8859-1?Q?qQjqDFUI1G+u3DMqUbvdnjukaQw03YGqXEvGwdoVr60i5tBe6KVlLaDWXN?=
 =?iso-8859-1?Q?QmzSfMXqWB+fjtDDnIO4A0tt5MCjzO0znXfVptGOpf/CD32829FQqgNl3e?=
 =?iso-8859-1?Q?+05Mq643jw1iSpm14S0yhWadBZtYHbv9M2Sf1pseRAAlBofMNPjphijyGa?=
 =?iso-8859-1?Q?98GV9hP7Y6jlftGfEpZSVedxV/x9RP3p3prTiMpZ5MznynI1L2UOPnQid6?=
 =?iso-8859-1?Q?+b8v6IxogZNNFocC8dH7PwCkzq1BWWzZDs3gNxOC5T34MzK16bYeFvsun3?=
 =?iso-8859-1?Q?zF7BnqMxKhS89OVU8berkfBjpV+348g8Sgb9Y4kONWKtHa6nm+IUr21eeL?=
 =?iso-8859-1?Q?xFUnFw5KEvHkONIgeuHfuUvMAI0F4EhBnOjW2T30S3kB8MUmtACii2fQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9cc670-f322-4e49-24db-08de21d979a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:51:46.4892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRRfJtD4jCeDIsJP3xGX/qPo8QxW7ecEwymnx1WOL5/VmcRar6QBZ+gahIl8KAp6Sjr8etlaw2CWFduHka+x7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9786

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
2. timer and GIC maintenance interrupts switched to static irqactions to re=
move
the need for freeing them during release_irq.
3. Enabled the build of xen-hptool on Arm.
4. Migration of irqs from dying CPUs implemented.

Tested on QEMU.

Note: As there are currently no Xen-used IRQs on non-zero CPUs, I used a ha=
ck
that changed default affinity of IRQs in setup_irq to properly test IRQ
migration. The hack consisted of changing smp_processor_id call to some
hard-coded non-zero number.

v3->v4:
* add irq migration patches
* see individual patches

v2->v3:
* add docs

v1->v2:
* see individual patches

Mykyta Poturai (5):
  arm/time: Use static irqaction
  arm/gic: Use static irqaction
  arm/irq: Keep track of irq affinities
  arm/irq: Migrate IRQs from dyings CPUs
  smp: Move cpu_up/down helpers to common code
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE
  docs: Document CPU hotplug

 config/Tools.mk.in               |  1 +
 docs/misc/cpu-hotplug.txt        | 51 ++++++++++++++++++++++++++++++++
 tools/configure                  | 30 +++++++++++++++++++
 tools/configure.ac               |  1 +
 tools/libs/guest/Makefile.common |  4 +++
 tools/misc/Makefile              |  2 +-
 xen/arch/arm/Kconfig             |  4 +++
 xen/arch/arm/gic.c               | 11 +++++--
 xen/arch/arm/include/asm/irq.h   |  2 ++
 xen/arch/arm/irq.c               | 42 ++++++++++++++++++++++++++
 xen/arch/arm/smp.c               |  6 ++++
 xen/arch/arm/smpboot.c           |  2 ++
 xen/arch/arm/sysctl.c            | 32 ++++++++++++++++++++
 xen/arch/arm/time.c              | 21 ++++++++++---
 xen/arch/ppc/stubs.c             |  4 +++
 xen/arch/riscv/stubs.c           |  5 ++++
 xen/arch/x86/include/asm/smp.h   |  3 --
 xen/arch/x86/smp.c               | 33 ++-------------------
 xen/common/smp.c                 | 32 ++++++++++++++++++++
 xen/include/xen/smp.h            |  4 +++
 20 files changed, 250 insertions(+), 40 deletions(-)
 create mode 100644 docs/misc/cpu-hotplug.txt
 mode change 100755 =3D> 100644 tools/configure

--=20
2.51.2

