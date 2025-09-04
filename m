Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61731B4470A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110837.1459863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIX-0004Ou-Jr; Thu, 04 Sep 2025 20:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110837.1459863; Thu, 04 Sep 2025 20:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIX-0004Lu-Gf; Thu, 04 Sep 2025 20:11:09 +0000
Received: by outflank-mailman (input) for mailman id 1110837;
 Thu, 04 Sep 2025 20:11:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9e-00062f-Ln
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:58 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdc7263f-89c9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:49 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:47 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:47 +0000
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
X-Inumbo-ID: fdc7263f-89c9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGh7ce6t98TKWKP+DlkkKCEmKJE3p8LJEAkteex3YEeTHL3XHYCR/gz+xMROBvazMOpsS82+kBr2zU7QrJ4fW7GHJjn+PsVu0/xuCjtMRkveAltqx2s8f1DLO4TbW//KY5qkyzBjwFF/y1+7phqBO0DHDCPC9LDlEy32hjZetTzMj7lm/t9jHwYbue/D2ifsnLPMXLu/wZOExmohQ9G8KG4Dz4uKxZjjQHkvIzM3TyfRBCYHGCjO1/lbp0wi8k26P0PcgdL/ezYjKUrQJ25NFyW7WgXJIgm74lHheOzih88gF89oD3PGZthJdaKR0fED8LcmT23Y27mqh6Iq9I9vAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulbjelc154dqs7jw4b5uy0AtSPGi8WMKNq3cnXML3hY=;
 b=BmITs1d6sKzZqZztufdlfmCLOLD8XDXKVZ1AS9U7tp0jDamLLnnLsalmbYaxm+7j5arJOuCqYot3kUQOhImdMWU/ciRVoCvH4alehD6KLAWhE9w96CI91PuyN4HZW5KIx9G7YzykpOyM2tieIq1W/B5OtHhoQhoOw1wQXl+ZVECR89siFNLkUIPg7rH30L4qj0KwsYerJnvfuQFN3x98X0bitVFI/nQoa1jHLJeaDM7SPx26l0/FPzjnpjlqcmJCxSjFwXELZQjHe/HoOu8b3/2fow8+qpuE3Ewy2kPaQQ/gXfS3xlWOgOVOGqMMlfKe0aFh7H+MTGNjdLoVB6SC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulbjelc154dqs7jw4b5uy0AtSPGi8WMKNq3cnXML3hY=;
 b=SzI9HKZO42jZxFwcePkUUomQDAAIgvoLrBmQuueCh4dsUlmZojgkth2Np5Cu65i5jScoDMfnbmVkJI8fQSS18yUeaiu6MBZdOJFiYewl93Ykz0QyI3IpSwPOVkHdt/xaGoIgGkxJfaO+JNXSjfKu+cJ2H+TPWKbUkxnolA0vqBVEi36Hd0OJwQ76a2QdwRSKBuZAepV+dkDE/t1223y/uFO2FMM9HFy9+NmH26Ht4XERuHnhXebPFE2oaHFUi4V3nd4b1u90tmaR3QZNhgA7dD5oMrTyPIhi+OFfoYxZV43Nzf5LMNe/GfVQ1w+pyBlQxe/2GP88US4nAavrU8KbVg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v7 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v7 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcHda+wKKiul+Vs0aU6H1MBrjnQQ==
Date: Thu, 4 Sep 2025 20:01:47 +0000
Message-ID:
 <be8d723a3cdcab9bda68c8582734cd93d77f08a7.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 9b03d8a4-834d-48e9-78b3-08ddebede104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bB/RJFutLZf4m7xPDTLxaVCT+jcMHbzZCmd0eZvi25FlZQmkDPQi4RfDG8?=
 =?iso-8859-1?Q?2Sh/7Ie4Bgyij41Hwnw5NWiH4XOW56tiVU2o8ndIVVJIInIk/EIIM2ReSL?=
 =?iso-8859-1?Q?cdM8WKZh6b2wR1D2/nxIKI9TD161Z8hRSPqzo39S3InazP+t5WamXcywOB?=
 =?iso-8859-1?Q?B/PSehMUmJZp7OSdZGF0adgEq+81Nj2z8v3uzACNVlRMvHpB2CYnOZ/4Dv?=
 =?iso-8859-1?Q?0X/fe9okiueuMXXy8iKOI2RaySS3wh63XKOT45PFFUfUEuNYF+g2X6ZcFj?=
 =?iso-8859-1?Q?i9b5G6HPT4tvWgs5t+KyaGh8H2SjIZK6DBURvxIGPf4qizcKFrX3Zx/i+T?=
 =?iso-8859-1?Q?DjwmXbB9KLFS+M5Gjozdz/Ycx+YrnhmAusIc8MdhyEYivBNEfG6P0iN28S?=
 =?iso-8859-1?Q?fwq9zfMha4vv20KcUpHUhT38e8oGl0vPDi/iSA2DRi+iZau/9b81T3xMbU?=
 =?iso-8859-1?Q?Y3lPoWumT2F8d1yuetR4QonBdtmNKyhYz58z91wunQ70NIowhwYDawmllO?=
 =?iso-8859-1?Q?UeHIW1iyb3rFr/y4AywWZy+AbXoPBV58FVBw6aNK3ixFkpuyNGZ7fa+un/?=
 =?iso-8859-1?Q?VSg3q8IIc6HjBKTXGQ0vMOXqlv5Jk+hHtpVwTlep1RzWt/eq+rlon/t+Ma?=
 =?iso-8859-1?Q?jw2HY9FE6TIhSXI9C0B7Wtk77fv+i0+xXsERtYL6Fg+bgUDarsKbZGVM9i?=
 =?iso-8859-1?Q?GMhI0Jdmne6a6G/BIAq+rsz9KIUK+XYI6A7rBnzXbthiNttU8XNP7zbTHe?=
 =?iso-8859-1?Q?FsxRAI0dRDKc7OeMEhQ8OQmX30NcMAHom6j2jgUSbuYcCYA4jdUCpii5Ms?=
 =?iso-8859-1?Q?7PHTqdiYxEH5n9R9JCem8n91UeHSj447yzGPsxIq29KIY9q4FZ1jTjOs2t?=
 =?iso-8859-1?Q?HreUnz57Ahk43BXV2/EdMEXSFltwkf1VHhqeGWHhJ2XGge2O7DSqZGd69N?=
 =?iso-8859-1?Q?ZZ2r8vQW7rss/lJTn4nCKTchHevV7fuDegCwbVshRHuGTfGH9Vcr9i9cKQ?=
 =?iso-8859-1?Q?ZDvqmugqGSPpc72RmLboeOshJ2LbHHki8vXAM7iS7jlYsq6GJBgvvMA6Wp?=
 =?iso-8859-1?Q?KqJUf5XdbH1nQExLnwNNR9Ktt/+LxUTLy6Dbhy41AakHOrQbBpPp4hULFw?=
 =?iso-8859-1?Q?HFRhjaKYGnXFsPyX0jL1GMFdL3hz5pWs69uW5Y0rP6JxXe/uLEHh71sVnC?=
 =?iso-8859-1?Q?a0ta0pcRMP+ZxxT5ifZFkuHfgIcbwpJikMH4x7LNdPkbGsw8FGY9/owKuB?=
 =?iso-8859-1?Q?KLp9TTQ6CXyo3rmYjqPeQGmzFyZ0kM8G+M5Dn3pYhH1sH1nz5nvsqXOtig?=
 =?iso-8859-1?Q?il/FjM3M12cmCX/2NiNWTt8EGyU2lgBLFeIRAJUZ8a+Rr3/mvJ0X20/AGZ?=
 =?iso-8859-1?Q?8yuPrd/IOKa5VAZJdSj1PAvdztHnSZMcB8HAg9aNXh0YygDa3o2oR5DYqp?=
 =?iso-8859-1?Q?rtUjwoh5VLxOgBFIYWBuk3DS83bySPBVLe/+kqre/LwryjO1UtDCtu9HxQ?=
 =?iso-8859-1?Q?DPjlx6gFf8hd3vAk0cD5C1TvKTNmaSD1veZRxdhxKh9A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Bj4uHUIWxBFKfexArwet4w5B0sjbQudkZFEdmsAkb2FQ2zogRpx+pe/ywG?=
 =?iso-8859-1?Q?y2gbgTZ7503nN86sqmmR3sAc+i4l/z/NA15264OZFie7yn6uO/wt0VX14M?=
 =?iso-8859-1?Q?4AEZZdqmYJGZ2vAMYYysPYuLT02asaTZNEGt6iz91txzEGadSJ8jOMmY+k?=
 =?iso-8859-1?Q?RyBrsgTgMWK+kIgsOGx1aX+it/2uqkOwVbW1tDCv/a6XsDNJyWo4/jeeEw?=
 =?iso-8859-1?Q?fycQXVjaKiUUGwhV/O2FM/Nt5MP5cjQkgLSxcuY+A1uXVnYuuW5q4HF6Ne?=
 =?iso-8859-1?Q?ozKSgqrC4qPQ+MvN7tNke54X1qA09f0TB6Cd7wAZbZ57/weugy+HU6EgB5?=
 =?iso-8859-1?Q?1PtCV9Wum3k8g6hvLb+mwMjbJG3SbhnYXZYUc6CZNBfXJXQxWGH8EYr+Kd?=
 =?iso-8859-1?Q?FdXOGjF1nUeDmUkX7B6XMduXX3hfdTlBtgWXe1OGKaTHM5Q1dmBOuZhdOe?=
 =?iso-8859-1?Q?XCjZkDngihmDSepbsDWWXSKgbjabJc+xsXxaX1QfRNbx9nUuq2cibRRwtB?=
 =?iso-8859-1?Q?G5WMz4R1vIUsh5+3zhFkNuWiD7nqVTjgr9hzB5iOa4PrqoXvJi250KKW4A?=
 =?iso-8859-1?Q?TiGx5tSRfqE9HcehKTzet+Qlns4pWSm3b8y5+5P/0uPx//GNd498f71YQ7?=
 =?iso-8859-1?Q?CNKaSm6vkj+rrhyZLdlmGEbbt2M4FIPCCvYxSdQZLw5Cyy7nUn+cr1LO4l?=
 =?iso-8859-1?Q?yhf5GsF4pFP9OAkVFwiIbx46rAN/eXns/Clx/Sj6frUrPHMrv661Ez3pZ+?=
 =?iso-8859-1?Q?v7ZUIaWkwgjNyB/nmcGsSJnFe0gVzkAHboHW1LfNFO0fhJ3J/An+QDPMAc?=
 =?iso-8859-1?Q?WM39xKBykw0IToywFSpJb5Ydz5wjfCG83H2pa1yIrtwdOnHDLEKV3/p1e9?=
 =?iso-8859-1?Q?rq8H0P6YxBnNxHi/xgbEnKWNTHSeD5Ssefy4uRgH6geUZFONQtrKuoAQ1I?=
 =?iso-8859-1?Q?tWrPqo8+ie94xGZ4HHZ3WWoOlXgxySwhPhY6WTs3T5Q4dvCDgkr+fGiJ1I?=
 =?iso-8859-1?Q?Uk8nolvYoAR4gWp8VuK180tsUwczC5qb8PTiqs0uy+sTcxnSoubuvmrVWH?=
 =?iso-8859-1?Q?ea1ehntl32ApwOUXNsJrAwhx6G6g3g7WI7Ij1SrT+7GxiC0giQNzJHoCjq?=
 =?iso-8859-1?Q?n1jX5eII3VgufdSzZZjLecifkFm37KeElUaHYjv28oHl4OoGs3M+KRa475?=
 =?iso-8859-1?Q?vCaAawujtG6N9/0iXGmmuoSHUurwWFtOWAhCoqsSM0z0TpjC1ec1YRieFI?=
 =?iso-8859-1?Q?RbtN/uBSkzyKlXnLjk7+q/+c1CXVArCfhXsDji9FoTjiZLjwUZ/NJMsdjZ?=
 =?iso-8859-1?Q?p66/Os44k7YwJ0Uluuj3nuQpPGBRSyMWWOmMmcG4OQRBSPkL6QVHD33OkR?=
 =?iso-8859-1?Q?ocBPj5H5vs4DX7LngPL++p4HAkRx0WlhBooyyaP6oVhYRe4jTr4ekx44TR?=
 =?iso-8859-1?Q?oveSitiQUHF6YWiw7UfkDpPcjAWXm7shrckjHJg/pngA3s9FbAfC07obUY?=
 =?iso-8859-1?Q?utCQ7ljxuvssEj+CkkZHKi/qTPwEY3jnaVWeJEX120heO2KL8Y1Tkt6p12?=
 =?iso-8859-1?Q?YytDrVfRcnV9h7SE1W8leLj+hYA47IaXqQUhvpYqL96DNeoXmTwqZG8IoJ?=
 =?iso-8859-1?Q?lOFG62LY5VCMr/8b4o71T+8WpdAEEmDWKo4lop9F3orYn/dpFsXPzU8v0H?=
 =?iso-8859-1?Q?vklvS2bdV3sn910o6ls=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b03d8a4-834d-48e9-78b3-08ddebede104
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:47.1224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ray5WYfmUamo04/wwyWZSlGt90foHIrqJEVlTC8UE8AKmO9FiKU0UDkwXYag/bhvahTAKECfcWJrMGL8H6MNZuJYcIUte++QbWMReW2keRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

Implemented support for GICv3.1 extended SPI registers for vGICv3,
allowing the emulation of eSPI-specific behavior for guest domains.
The implementation includes read and write emulation for eSPI-related
registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
following a similar approach to the handling of regular SPIs.

The eSPI registers, previously located in reserved address ranges,
are now adjusted to support MMIO read and write operations correctly
when CONFIG_GICV3_ESPI is enabled.

The availability of eSPIs and the number of emulated extended SPIs
for guest domains is reported by setting the appropriate bits in the
GICD_TYPER register, based on the number of eSPIs requested by the
domain and supported by the hardware. In cases where the configuration
option is disabled, the hardware does not support eSPIs, or the domain
does not request such interrupts, the functionality remains unchanged.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes in V7:
- minor: renamed vgic_get_rank to vgic_common_rank_offset
- minor: updated comment for vgic_common_rank_offset
- minor: restored comment for vgic_store_irouter
- minor: added sanity checks with asserts to helper functions
- added reviewed-by from Oleksandr Tyshchenko

Changes in V6:
- introduced helper functions: vgic_get_rank and vgic_get_reg_offset to
  avoid boilerplate code and simplify changes
- fixed index initialization in the previous patch ([08/12] xen/arm:
  vgic: add resource management for extended SPIs) and removed index
  conversion for vgic_enable_irqs(), vgic_disable_irqs(),
  vgic_set_irqs_pending(), and vgic_check_inflight_irqs_pending()
- grouped SPI and eSPI registers
- updated the comment for vgic_store_irouter to reflect parameter
  changes
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch

Changes in V5:
- since eSPI-specific defines and macros are now available even when the
  appropriate config is disabled, this allows us to remove many
  #ifdef guards and reuse the existing code for regular SPIs for eSPIs as
  well, as eSPIs are processed similarly. This improves code readability
  and consolidates the register ranges for SPIs and eSPIs in a single
  place, simplifying future changes or fixes for SPIs and their
  counterparts from the extended range
- moved vgic_ext_rank_offset() from
  [08/12] xen/arm: vgic: add resource management for extended SPIs
  as the function was unused before this patch
- added stub implementation of vgic_ext_rank_offset() when CONFIG_GICV3_ESP=
I=3Dn
- removed unnecessary defines for reserved ranges, which were introduced in
  V4 to reduce the number of #ifdefs. The issue is now resolved by
  allowing the use of SPI-specific offsets and reworking the logic

Changes in V4:
- added missing RAZ and write ignore eSPI-specific registers ranges:
  GICD_NSACRnE and GICD_IGRPMODRnE
- changed previously reserved range to cover GICD_NSACRnE and
  GICD_IGRPMODRnE
- introduced GICD_RESERVED_RANGE<n>_START/END defines to remove
  hardcoded values and reduce the number of ifdefs
- fixed reserved ranges with eSPI option enabled: added missing range
  0x0F30-0x0F7C
- updated the logic for domains that do not support eSPI, but Xen is
  compiled with the eSPI option. Now, prior to other MMIO checks, we
  verify whether eSPI is available for the domain or not. If not, it
  behaves as it does currently - RAZ and WI
- fixed print for GICD_ICACTIVERnE
- fixed new lines formatting for switch-case

Changes in V3:
- changed vgic_store_irouter parameters - instead of offset virq is
  used, to remove the additional bool espi parameter and simplify
  checks. Also, adjusted parameters for regular SPI. Since the offset
  parameter was used only for calculating virq number and then reused for
  finding rank offset, it will not affect functionality.
- fixed formatting for goto lables - added newlines after condition
- fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
- removed #ifdefs in 2 places where they were adjacent and could be merged

Changes in V2:
- add missing rank index conversion for pending and inflight irqs
---
 xen/arch/arm/include/asm/vgic.h |   4 +
 xen/arch/arm/vgic-v3.c          | 203 +++++++++++++++++++++++++-------
 xen/arch/arm/vgic.c             |  22 ++++
 3 files changed, 185 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 24a4a968c3..31b3d3e5ec 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -324,6 +324,10 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct v=
cpu *v,
                                               unsigned int b,
                                               unsigned int n,
                                               unsigned int s);
+extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
+                                                  unsigned int b,
+                                                  unsigned int n,
+                                                  unsigned int s);
 extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int ir=
q);
 extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4369c55177..8b1c8eef80 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -107,17 +107,12 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_ra=
nk *rank,
 /*
  * Store an IROUTER register in a convenient way and migrate the vIRQ
  * if necessary. This function only deals with IROUTER32 and onwards.
- *
- * Note the offset will be aligned to the appropriate boundary.
  */
 static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *ran=
k,
-                               unsigned int offset, uint64_t irouter)
+                               unsigned int virq, uint64_t irouter)
 {
     struct vcpu *new_vcpu, *old_vcpu;
-    unsigned int virq;
-
-    /* There is 1 vIRQ per IROUTER */
-    virq =3D offset / NR_BYTES_PER_IROUTER;
+    unsigned int offset;
=20
     /*
      * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
@@ -673,6 +668,36 @@ write_reserved:
     return 1;
 }
=20
+/*
+ * The assumption is that offsets below espi_base are for
+ * regular SPI, while those at or above are for eSPI.
+ */
+static inline struct vgic_irq_rank *vgic_common_rank_offset(struct vcpu *v=
,
+                                                            unsigned int b=
,
+                                                            uint32_t reg,
+                                                            unsigned int s=
,
+                                                            uint32_t spi_b=
ase,
+                                                            uint32_t espi_=
base)
+{
+    ASSERT(spi_base < espi_base);
+
+    if ( reg < espi_base )
+        return vgic_rank_offset(v, b, reg - spi_base, s);
+    else
+        return vgic_ext_rank_offset(v, b, reg - espi_base, s);
+}
+
+static inline uint32_t vgic_get_reg_offset(uint32_t reg, uint32_t spi_base=
,
+                                           uint32_t espi_base)
+{
+    ASSERT(spi_base < espi_base);
+
+    if ( reg < espi_base )
+        return reg - spi_base;
+    else
+        return reg - espi_base;
+}
+
 static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu =
*v,
                                             mmio_info_t *info, uint32_t re=
g,
                                             register_t *r)
@@ -685,13 +710,17 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* We do not implement security extensions for guests, read zero *=
/
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         goto read_as_zero;
=20
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ISENAB=
LER,
+                                       GICD_ISENABLERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -699,8 +728,10 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ICENAB=
LER,
+                                       GICD_ICENABLERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -710,22 +741,29 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
         goto read_as_zero;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
     {
-        uint32_t ipriorityr;
+        uint32_t ipriorityr, offset;
         uint8_t rank_index;
=20
         if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
-        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 8, reg, DABT_WORD, GICD_IPRIOR=
ITYR,
+                                       GICD_IPRIORITYRnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
-        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYR, DABT_WORD)=
;
+        offset =3D vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORIT=
YRnE);
+        rank_index =3D REG_RANK_INDEX(8, offset, DABT_WORD);
=20
         vgic_lock_rank(v, rank, flags);
         ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
@@ -737,14 +775,17 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     }
=20
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
     {
-        uint32_t icfgr;
+        uint32_t icfgr, offset;
=20
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 2, reg, DABT_WORD, GICD_ICFGR,
+                                       GICD_ICFGRnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
+        offset =3D vgic_get_reg_offset(reg, GICD_ICFGR, GICD_ICFGRnE);
         vgic_lock_rank(v, rank, flags);
-        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR, DABT_WORD=
)];
+        icfgr =3D rank->icfg[REG_RANK_INDEX(2, offset, DABT_WORD)];
         vgic_unlock_rank(v, rank, flags);
=20
         *r =3D vreg_reg32_extract(icfgr, info);
@@ -782,12 +823,16 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ISENAB=
LER,
+                                       GICD_ISENABLERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
@@ -797,8 +842,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ICENAB=
LER,
+                                       GICD_ICENABLERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
@@ -808,8 +855,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ISPEND=
R,
+                                       GICD_ISPENDRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
         vgic_set_irqs_pending(v, r, rank->index);
@@ -817,8 +866,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 1, reg, DABT_WORD, GICD_ICPEND=
R,
+                                       GICD_ICPENDRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
         vgic_check_inflight_irqs_pending(v, rank->index, r);
@@ -826,28 +877,42 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
         goto write_ignore;
=20
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER=
%d\n",
-               v, name, r, reg - GICD_ISACTIVER);
+        if ( reg < GICD_ISACTIVERnE )
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ISACT=
IVER%d\n",
+                   v, name, r, reg - GICD_ISACTIVER);
+        else
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ISACT=
IVER%dE\n",
+                   v, name, r, reg - GICD_ISACTIVERnE);
         return 0;
=20
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
-        printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER=
%d\n",
-               v, name, r, reg - GICD_ICACTIVER);
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        if ( reg < GICD_ICACTIVERnE )
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ICACT=
IVER%d\n",
+                   v, name, r, reg - GICD_ICACTIVER);
+        else
+            printk(XENLOG_G_ERR
+                   "%pv: %s: unhandled word write %#"PRIregister" to ICACT=
IVER%dE\n",
+                   v, name, r, reg - GICD_ICACTIVERnE);
         goto write_ignore_32;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
     {
-        uint32_t *ipriorityr, priority;
+        uint32_t *ipriorityr, priority, offset;
=20
         if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
-        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 8, reg, DABT_WORD, GICD_IPRIOR=
ITYR,
+                                       GICD_IPRIORITYRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
+        offset =3D vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORIT=
YRnE);
         vgic_lock_rank(v, rank, flags);
-        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRI=
ORITYR,
-                                                      DABT_WORD)];
+        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, offset, DABT_WO=
RD)];
         priority =3D ACCESS_ONCE(*ipriorityr);
         vreg_reg32_update(&priority, r, info);
         ACCESS_ONCE(*ipriorityr) =3D priority;
@@ -859,17 +924,23 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
         goto write_ignore_32;
=20
     case VRANGE32(GICD_ICFGR + 4, GICD_ICFGRN): /* PPI + SPIs */
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    {
+        uint32_t offset;
+
         /* ICFGR1 for PPI's, which is implementation defined
            if ICFGR1 is programmable or not. We chose to program */
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
+        rank =3D vgic_common_rank_offset(v, 2, reg, DABT_WORD, GICD_ICFGR,
+                                       GICD_ICFGRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
+        offset =3D vgic_get_reg_offset(reg, GICD_ICFGR, GICD_ICFGRnE);
         vgic_lock_rank(v, rank, flags);
-        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR,
-                                                     DABT_WORD)],
+        vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, offset, DABT_WORD)=
],
                           r, info);
         vgic_unlock_rank(v, rank, flags);
         return 1;
+    }
=20
     default:
         printk(XENLOG_G_ERR
@@ -1129,6 +1200,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
             typer |=3D GICD_TYPE_LPIS;
=20
         typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_B=
ITS_SHIFT;
+#ifdef CONFIG_GICV3_ESPI
+        if ( v->domain->arch.vgic.nr_espis > 0 )
+        {
+            /* Set eSPI support bit for the domain */
+            typer |=3D GICD_TYPER_ESPI;
+            /* Set ESPI range bits */
+            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - =
1)
+                       << GICD_TYPER_ESPI_RANGE_SHIFT;
+        }
+#endif
=20
         *r =3D vreg_reg32_extract(typer, info);
=20
@@ -1194,6 +1275,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /*
          * Above all register are common with GICR and GICD
          * Manage in common
@@ -1201,6 +1292,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mm=
io_info_t *info,
         return __vgic_v3_distr_common_mmio_read("vGICD", v, info, gicd_reg=
, r);
=20
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
         /* We do not implement security extensions for guests, read zero *=
/
         goto read_as_zero_32;
=20
@@ -1216,27 +1308,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, =
mmio_info_t *info,
         /* Replaced with GICR_ISPENDR0. So ignore write */
         goto read_as_zero_32;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(0x0F30, 0x0FFC):
         goto read_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
     {
         uint64_t irouter;
+        uint32_t offset;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        rank =3D vgic_common_rank_offset(v, 64, gicd_reg, DABT_DOUBLE_WORD=
,
+                                       GICD_IROUTER, GICD_IROUTERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
+        offset =3D vgic_get_reg_offset(gicd_reg, GICD_IROUTER, GICD_IROUTE=
RnE);
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vgic_unlock_rank(v, rank, flags);
=20
         *r =3D vreg_reg64_extract(irouter, info);
=20
         return 1;
     }
-
-    case VRANGE32(0x7FE0, 0xBFFC):
+    case VRANGE32(0x3700, 0x60FC):
+    case VRANGE32(0xA004, 0xBFFC):
         goto read_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
@@ -1382,12 +1477,23 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* Above registers are common with GICR and GICD
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
                                                  gicd_reg, r);
=20
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
@@ -1405,26 +1511,35 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         return 0;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(0x0F30, 0x0FFC):
         goto write_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
     {
         uint64_t irouter;
+        unsigned int offset, virq;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        rank =3D vgic_common_rank_offset(v, 64, gicd_reg, DABT_DOUBLE_WORD=
,
+                                       GICD_IROUTER, GICD_IROUTERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
+        offset =3D vgic_get_reg_offset(gicd_reg, GICD_IROUTER, GICD_IROUTE=
RnE);
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
+        /* There is 1 vIRQ per IROUTER */
+        if ( gicd_reg < GICD_IROUTERnE )
+            virq =3D offset / NR_BYTES_PER_IROUTER;
+        else
+            virq =3D espi_idx_to_intid(offset / NR_BYTES_PER_IROUTER);
+        vgic_store_irouter(v->domain, rank, virq, irouter);
         vgic_unlock_rank(v, rank, flags);
         return 1;
     }
=20
-    case VRANGE32(0x7FE0, 0xBFFC):
+    case VRANGE32(0x3700, 0x60FC):
+    case VRANGE32(0xA004, 0xBFFC):
         goto write_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 878daa71d4..3efe23e01a 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -170,6 +170,18 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
 }
=20
 #ifdef CONFIG_GICV3_ESPI
+/*
+ * The function behavior is the same as for regular SPIs (vgic_rank_offset=
),
+ * but it operates with extended SPI ranks.
+ */
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
+
+    return vgic_get_rank(v, rank + EXT_RANK_MIN);
+}
+
 static unsigned int vgic_num_spi_lines(struct domain *d)
 {
     return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
@@ -210,6 +222,16 @@ static unsigned int vgic_num_spi_lines(struct domain *=
d)
     return d->arch.vgic.nr_spis;
 }
=20
+/*
+ * It is expected that, in the case of CONFIG_GICV3_ESPI=3Dn, the function=
 will
+ * return NULL. In this scenario, mmio_read/mmio_write will be treated as
+ * RAZ/WI, as expected.
+ */
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    return NULL;
+}
 #endif
=20
 static unsigned int vgic_num_alloc_irqs(struct domain *d)
--=20
2.34.1

