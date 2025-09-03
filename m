Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FBB423C3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108463.1458618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVq-00033C-Lt; Wed, 03 Sep 2025 14:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108463.1458618; Wed, 03 Sep 2025 14:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoVq-00031R-Hq; Wed, 03 Sep 2025 14:31:02 +0000
Received: by outflank-mailman (input) for mailman id 1108463;
 Wed, 03 Sep 2025 14:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoVE-0006B7-CE
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:24 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8513629e-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:20 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7844.eurprd03.prod.outlook.com (2603:10a6:20b:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:30:18 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:18 +0000
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
X-Inumbo-ID: 8513629e-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPbYd2o0IOrjxvHjhYStZZ7cEfo2JH0sSBmtynJS5oK0gyRzg5Wv/RFRBZgqljhIKB4cOeQsnZG5jooNBUhVxXNq2aSTdcz6dhNtMja7GvKaBCp16PJOGhYBFC2aQFKUzK/A/sRCyB93sOo8lJD3xRFbbdtpqv4KGa+ReVE3khTXWvpGvcPNfSK8G7GZ7KJIiEsHwB5gBsJgiALLtZtihZ0y++ieSzx6bvmDUEALh32YdrJ22e8basUht8xSbdkfmX8ZE8mFxpC5G8kcoD/qW44a5Vw9LbZzAPhDdJTeQYFYOe9tR4rPGyupcjborNynT84xjqe4sCV0zQaMx8eiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WkysxZgw+5syaIui0nLw+HYZM4/1UBCEinESOtulBE=;
 b=aSFr0DRJhyQ6V6cf4zAPMplBgx+Tm3tvJlTPsuxwA5lgVVCHUAkppnXxLFZB+wY9DgfWPyK9djxZ4jM2f1Jn8H2YrpsbB70t6mApJCJ6Mt7TL/VfXu5NWk6YbTanilFmZR+/AJ8gaxP3C+GQVeLOHqidGwpmdZKh/qaeQdD4iAHNDLlk8LC9q0xVRV+19HwbJivg3hIDxSz4a1snwHq5FuaATARm7H4QL8nnVqtfwIZp6nqSR7XXbqXn66TaUQMP6hUApAJDSCf+mf/YHjClG8CvCWkc0t/5dCesZvx8RsYOm5D4fvT0H2g4OhmUNVa8lLFZs61CzEQaF/hYoaCGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WkysxZgw+5syaIui0nLw+HYZM4/1UBCEinESOtulBE=;
 b=iMt4muewn8i5K9O3BPgtReaw3b52XxLqmz7S6ci6LD+B0kNnBcsP9DLTQntOqP061+hkgWRHubbNrnKn+QSTg++LvFrnqaNb3uJEQ7mG7YhqyGwV+RnfxYlz+CSK/+BSObdPaY6/V+iCmPMw+GQ2WMQCtlFtgR8BoGqZJmmCSpLjeRhdbxNtNni+Y5Vf5UBey45ZVn12tI3YG9OqRvQHIEEGuglA7hIulH65Z4xuAEAAzQY8/127rfpwetwxMkHF/GsClnvuWsvK4mN/7Oc8GizONFm+8uRoSFmYGBFAPmuRDO57yG04fUEihyL3sG6Hm6egWlDyAKrsRd0Sh+crZQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v6 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcHN9FrhwGrEUPyUu8gbPtoBO0RQ==
Date: Wed, 3 Sep 2025 14:30:18 +0000
Message-ID:
 <345da260fcb3bb400834f8a59dacfda8b37440a1.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: 53c3db52-e49b-4bbe-c758-08ddeaf66826
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ysaTRuYytc/nfMhIF9P/gaLoxRjAkFNJyHG8PAZ5s00xTMV/BackgRgFIp?=
 =?iso-8859-1?Q?PBi29laNuYCoTmo8T019H3Gm0YJB1wnymNJB8FEhAyakpHn9A6auLDFRp5?=
 =?iso-8859-1?Q?PW5/XG44PQfzNcvqmcJQelRyC/pB4JJ+7rMqfGLQ7Mnnqf26ofIDGlodqZ?=
 =?iso-8859-1?Q?noxitMcMdfZv3dKktM+nY63/P1ssBCVi/O40+2fCP4MDDFQ9IVrAvBLYJr?=
 =?iso-8859-1?Q?j8/MEo4Pr/Qc/VT8rOFck4NQxOknW6SOvRjm8k27ksfz16v8Qd8wKJR8FC?=
 =?iso-8859-1?Q?VVAXVfVm+WhoyWRxXti6arbembxJVKTdWkM+YbroOixvFE+vdPjg0vql7O?=
 =?iso-8859-1?Q?AsWQE17QwraTjCAmVJz1QB9tIMlSqVYYgqMQwEyL0S1zGosbWsie9YZIVu?=
 =?iso-8859-1?Q?t3dqvL0GinhcABtf1RDkHwPj88e5PWeu5GJ1SX5MWDIqc1g7TVu6WHDsQy?=
 =?iso-8859-1?Q?ny5YcLrG/eSrQTNXdZqTIPyC0gkbe8oBdYwq5glWsSTW6bPmqdsF21golq?=
 =?iso-8859-1?Q?XCoMvPRGLD3rGOQoPsVIV2WCrzjK5/CR7LqvltHAYPl75hHXPKo4Dbcxca?=
 =?iso-8859-1?Q?nKFFvE4KPFlurww2/w2TIyBlG/ETG6ppdeQOmwrXdqCyLjhxZFC2Jx+ffx?=
 =?iso-8859-1?Q?nY9NpAg2ozMaDwLjFTH5cP6UcXafTwjIdKHDCE+1D25Fmh1xpaZcPhPvbv?=
 =?iso-8859-1?Q?vB3883Fw6F2zL68O2yOoQUvF00Rs06G4frvuV7gy25YD+2kXX4EQqhbUiV?=
 =?iso-8859-1?Q?ZoAHrxynpgE63p073rrGeXmMmIHfV6HpZjpofEQlxxlO+aJwaJYtTT2MXP?=
 =?iso-8859-1?Q?8K8xai1ocaZyHFZdjEv8h5owct7PRWlgwstpO24/DFfukTFzmdmXMNPrT/?=
 =?iso-8859-1?Q?ThL2CqLHB8jltBFsoH27xYC/kVm/ir2MT4jgvbeZKNU5tNci/GZh6k7QEn?=
 =?iso-8859-1?Q?hAhgGxh0M0hwhl+0QWKFge/zOw6Whq1MuOvJdnV03ZWcljjrLR8haHZwLf?=
 =?iso-8859-1?Q?HHaWwB5VrX0tw50w23mKZxdeWZkpVIpYgsy7vChy4UtLAxXD6b8Zv56usF?=
 =?iso-8859-1?Q?of67kQw148IPjhpAxhKv+BJJyu9PHetJBEANcKP6Wd7pXIfOon4MF4LKKq?=
 =?iso-8859-1?Q?OzyW1LAImh4LSwxxRpAKkOgjnU5shgVIiOqb49sdlrekX4otBjojeBh3Cc?=
 =?iso-8859-1?Q?XvTky8Ke4yNUrMkT6RJ9jxKmOt18uOz0bTvoP0L30w+5Qv0aEd1mDL8tvM?=
 =?iso-8859-1?Q?6kN+O3QqszUrVBDVwVLCGY+3rxPYPlm/gzHeXvMxganhQOAM46lsCSBe5h?=
 =?iso-8859-1?Q?/jDHtBQGHGjMDxTuBuKqOtBIblDX5VwKi5LHUvHJg4+V4OpUuXIS8VD4QO?=
 =?iso-8859-1?Q?xtaw/tpAqsA3aEV5o0LKckAjkGMVFaq9ykGHD6RFsFPgKwvLw4G4tQoF9h?=
 =?iso-8859-1?Q?HOBH0fwTqz1vwOOVB69+qsD+XxZ9fJsa5zXpo7YinD/OXPmho17A5J33+c?=
 =?iso-8859-1?Q?HEVZc4MRjALIr97fEkDg0fLsGZWXvgHVQ9+cKXLDr96w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PSIZkWShYSeXGbOaf3kBtO+L55sEmPxt3t0cHKyUqYb2/Ad2R7/FkxtP8c?=
 =?iso-8859-1?Q?ZAJTkUR+IZhNymV0doRqoGVzEhg3YqiSqKwvJjh1bNx7mOMSs2uZb5jCmR?=
 =?iso-8859-1?Q?XdBes2h3tXMRY60fIltPzKmGJleTC0DushHkHh4UDQITRRPAcYLbHt+tco?=
 =?iso-8859-1?Q?3sJpJ+VEpNLT5OPw9xQSY3DnLOl+0i+2qkSBcatxQS5dnleezFVU2KAeMr?=
 =?iso-8859-1?Q?47lozjA2WTSHpCLAKp22igCmr/oXsICDXrhSElacZRqRK4I9uBcaWC8QQF?=
 =?iso-8859-1?Q?9aXjNLc8Gd4bEbURMWTcylCb0vy3Sp6ZhoUAlhYn5Z9BP7q6wkswdL4TQx?=
 =?iso-8859-1?Q?59yHHasvvfwAiqufYzfCFXos3xKMm1OFvBZzSRfoZ0RnURt2C1Y8vXa9ex?=
 =?iso-8859-1?Q?8Hu6iPz2UMzPlCNpCQSrk7xK+PiWyyIVt6NcVgIhqLJP346SqQtwWL/W7U?=
 =?iso-8859-1?Q?MHZzVSdtPPUjOhlYbFwauHi3YMrooaQQotTw2b/8CHoxlj8lHdRh0vcNqs?=
 =?iso-8859-1?Q?ZCQ8QWx2LcTNkdqbl42MzOSipkPuSFxT+almg/hTC5nw2pPMRODMPpU3JJ?=
 =?iso-8859-1?Q?zPlD6Paag35Scm/F8jl6wqpwv8G4xactiji5rPFmS4lXo9iA7nx70sTR4b?=
 =?iso-8859-1?Q?4p8LXIdm7NUBRhLXrmhNyiUSVmKv0JWwt0Ug8rKrzGO5AgjloQs/aeV/VD?=
 =?iso-8859-1?Q?58d1PxUZ8YoiGJhtltgtzxOQr4++NtqXRXGKRwKceFJSuq0GX9R8tudFLt?=
 =?iso-8859-1?Q?wJ/YcSIjMW+hdoYV5QFqgOGsBvlZ/NEDOJ+BrNJfAzbJDtLTxS4y21Zcn+?=
 =?iso-8859-1?Q?2bZY6h/LPH9lT0ZAHquQfyI3H86LTNoNntK/kZevEepmunOjKqMQEgUAlR?=
 =?iso-8859-1?Q?HepHa4QZOJi8VQjJhig5xOv+Tod9bUlPoUDvk3sybdByQYSZlF9j9VTjA5?=
 =?iso-8859-1?Q?JuRe8TG7QMa73RxgLxHIVC1Y35CEZQL+1xo3r43vV5EPZJX++llFhxlT78?=
 =?iso-8859-1?Q?mH+tX9kvOUxH4ASuvgGqXvcBS22HK3/aQ0MB31JyZres3GsC5lXwpv4sfL?=
 =?iso-8859-1?Q?6+hCkmHGe9okmCwFkyDAIkcdZNhI4KntiSMmzYJPsznV5M6aUurNiTN8Sg?=
 =?iso-8859-1?Q?oYJodjPkTp+x4aMrDsb90ZJCWfrUSw0uBVtk14f/Yi5Ew23Q7AIcaMyelQ?=
 =?iso-8859-1?Q?1x3HsnJJIepyK7CbzjCGUKpK6deWXElFM+/mU62VawE1HbNS0CMBlOSTV0?=
 =?iso-8859-1?Q?AfrPvdX3/OM/cm1zBgnOOaR9By9DGYIEA51HFxYFeX3CJi93h6EY/nRyBL?=
 =?iso-8859-1?Q?Q0k2UsO0Ovr9bpguKgBmyKzY65/4LiJ0KjzUm4tp3gcNdprLe1UOW1nlO1?=
 =?iso-8859-1?Q?3a02d8pvfH7GSNrCzMaEkogPU+ZEUFCu9hmecV2zhdhNkP4wfEDzdiLdIz?=
 =?iso-8859-1?Q?0LLyRbP4mm/opSHxkxC55mfzgEUSkKmrJf+wExx17hWpQCDnsw2FGfPgUn?=
 =?iso-8859-1?Q?5i9BHvvwBI460lKKgnzTTLiZM41nSicnIa38C0EY4Iy5svNn3GHX1GT2st?=
 =?iso-8859-1?Q?fgqh7LX2+diAGWPqXkb5l3GaD+1lArjmZ1RftkLiaVGy9B3//L46dSMylK?=
 =?iso-8859-1?Q?oxUwrK6lnHBUCq7J+Sq2TpN1vjKwci9Wzex7WflCk6EOzx4YMs9tkm0+XC?=
 =?iso-8859-1?Q?Ykt08fITAl7NXew7fOw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c3db52-e49b-4bbe-c758-08ddeaf66826
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:18.6620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lJtdnkN1dhLySMofOadcw+/AGeZqGFXde1z3tR6eGfXZnN+ya/iLg5Se3gUg4Bl2MwlG3Xe+W7r6NxO0DfsCxYmQETNhQhJ1pYvTms32xNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7844

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

---
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
 xen/arch/arm/vgic-v3.c          | 198 +++++++++++++++++++++++++-------
 xen/arch/arm/vgic.c             |  22 ++++
 3 files changed, 180 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index c52bbcb115..dec08a75a4 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -314,6 +314,10 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct v=
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
index 4369c55177..27af247d30 100644
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
@@ -673,6 +668,34 @@ write_reserved:
     return 1;
 }
=20
+/*
+ * Since all eSPI counterparts of SPI registers belong to lower offsets,
+ * we can check whether the register offset is less than espi_base and,
+ * if so, return the rank for regular SPI. Otherwise, return the rank
+ * for eSPI.
+ */
+static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
+                                                  unsigned int b,
+                                                  uint32_t reg,
+                                                  unsigned int s,
+                                                  uint32_t spi_base,
+                                                  uint32_t espi_base)
+{
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
@@ -685,13 +708,17 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
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
+        rank =3D vgic_get_rank(v, 1, reg, DABT_WORD, GICD_ISENABLER,
+                             GICD_ISENABLERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -699,8 +726,10 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        rank =3D vgic_get_rank(v, 1, reg, DABT_WORD, GICD_ICENABLER,
+                             GICD_ICENABLERnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -710,22 +739,29 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
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
+        rank =3D vgic_get_rank(v, 8, reg, DABT_WORD, GICD_IPRIORITYR,
+                             GICD_IPRIORITYRnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
-        rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYR, DABT_WORD)=
;
+        offset =3D vgic_get_reg_offset(reg, GICD_IPRIORITYR, GICD_IPRIORIT=
YRnE);
+        rank_index =3D REG_RANK_INDEX(8, offset, DABT_WORD);
=20
         vgic_lock_rank(v, rank, flags);
         ipriorityr =3D ACCESS_ONCE(rank->ipriorityr[rank_index]);
@@ -737,14 +773,16 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
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
+        rank =3D vgic_get_rank(v, 2, reg, DABT_WORD, GICD_ICFGR, GICD_ICFG=
RnE);
         if ( rank =3D=3D NULL ) goto read_as_zero;
+        offset =3D vgic_get_reg_offset(reg, GICD_ICFGR, GICD_ICFGRnE);
         vgic_lock_rank(v, rank, flags);
-        icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR, DABT_WORD=
)];
+        icfgr =3D rank->icfg[REG_RANK_INDEX(2, offset, DABT_WORD)];
         vgic_unlock_rank(v, rank, flags);
=20
         *r =3D vreg_reg32_extract(icfgr, info);
@@ -782,12 +820,16 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
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
+        rank =3D vgic_get_rank(v, 1, reg, DABT_WORD, GICD_ISENABLER,
+                             GICD_ISENABLERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
@@ -797,8 +839,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        rank =3D vgic_get_rank(v, 1, reg, DABT_WORD, GICD_ICENABLER,
+                             GICD_ICENABLERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
@@ -808,8 +852,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
+        rank =3D vgic_get_rank(v, 1, reg, DABT_WORD, GICD_ISPENDR,
+                             GICD_ISPENDRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
         vgic_set_irqs_pending(v, r, rank->index);
@@ -817,8 +863,10 @@ static int __vgic_v3_distr_common_mmio_write(const cha=
r *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
+        rank =3D vgic_get_rank(v, 1, reg, DABT_WORD, GICD_ICPENDR,
+                             GICD_ICPENDRnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
         vgic_check_inflight_irqs_pending(v, rank->index, r);
@@ -826,28 +874,42 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
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
+        rank =3D vgic_get_rank(v, 8, reg, DABT_WORD, GICD_IPRIORITYR,
+                             GICD_IPRIORITYRnE);
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
@@ -859,17 +921,22 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
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
+        rank =3D vgic_get_rank(v, 2, reg, DABT_WORD, GICD_ICFGR, GICD_ICFG=
RnE);
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
@@ -1129,6 +1196,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
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
@@ -1194,6 +1271,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
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
@@ -1201,6 +1288,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mm=
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
@@ -1216,27 +1304,30 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, =
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
+        rank =3D vgic_get_rank(v, 64, gicd_reg, DABT_DOUBLE_WORD, GICD_IRO=
UTER,
+                             GICD_IROUTERnE);
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
@@ -1382,12 +1473,23 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
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
@@ -1405,26 +1507,34 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
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
+        rank =3D vgic_get_rank(v, 64, gicd_reg, DABT_DOUBLE_WORD, GICD_IRO=
UTER,
+                             GICD_IROUTERnE);
         if ( rank =3D=3D NULL ) goto write_ignore;
+        offset =3D vgic_get_reg_offset(gicd_reg, GICD_IROUTER, GICD_IROUTE=
RnE);
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
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
index b42aee8d0c..9458ba93f7 100644
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

