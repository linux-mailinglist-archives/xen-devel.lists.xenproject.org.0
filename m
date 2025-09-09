Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C4B4A99F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116155.1462594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHz-0003L7-AG; Tue, 09 Sep 2025 10:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116155.1462594; Tue, 09 Sep 2025 10:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHz-0003JL-5z; Tue, 09 Sep 2025 10:09:27 +0000
Received: by outflank-mailman (input) for mailman id 1116155;
 Tue, 09 Sep 2025 10:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvHw-0001My-U0
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:25 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e769569-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:22 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:16 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:16 +0000
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
X-Inumbo-ID: 0e769569-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo4J9qJQhJp7Hnqaqm8Xo+NCzo8HLwm2doy1rvo4VPOJSV+Eo9/Wd3Q8r9MK38JNWgt3sQlhhr91/ewR3CUv7tWQOhuu+Ig1/eE/P7tAvRohbnoq8kxGGnoffxqUT5d0f912X+pNDjy0wZ4IMIYetJAxZTeArNxF8o7o5uhE0mlfRgWFLxZj5LC0xiCYver6b5m9X9IQMhVAlAREpq7pvXyoUxe/buVQ3/fRSXoBo5yD6jGlg4sti4i/esqPqx4o17PVLxtUwt3nbktcxDMZC+4PZRgOJeSwtSLQ86D0YoXdN0ZkFwatmp0k5PYczQLgRkL50Gh6gzfJOdZxgZtACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77VmsMWkYw2kko3f++NVL2YCmHBnjCG/xskj3x8x9yg=;
 b=FE1gIM4vRZ9oEaZDRWBioNHHSbf290THqdkh/E1cPu3hELmxZXY2TBfQJuZJDWKARV3lBmiM8zOgdvRjXDJ2KeDa+iVxg2dnnyAwNA570q7cQEIMRuz/2sajH+GmhPhpqUTLqFXT4ZOb39pIPJt4MhaDosuY4iGIaU9kyJBvfV1TFEX9I+3QvbAxhlvpUCja/XBmdsGX/aYr1tFCYau32TeZL9LvHovfcieUPOJZXzGaxfOws+354t/qvddDorTvPW19G8YQe20rg3ApR+Np++GTL3o65cJCpIRwLSQ50cig5yPufrr1Wr6aBquUp+G5IKJGmh3K9T+9hicKMTQijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77VmsMWkYw2kko3f++NVL2YCmHBnjCG/xskj3x8x9yg=;
 b=iEZaeXttR9Np5RriEp0FusLMr9ebLQ5DTMqvRisWsmJ6vvy5Rc3OUyp5lCJjwUj4tO93OUB3RBF44GAIxWTSyoMVXSN8n+ZbdQGVu5ELe9rInGoax4lPQil5ExiXBG1qjBURvACIV4vywYJrlklC9Z2+WSTuiWt38PJY3UHT594RXwzwovJJSggfPHR6cEWjjBmksK8qit4JRV1c+gifGzvEEP6Xk1XSgmdROVW2ad0KAxsjd99h6TqAA3WUii1gU5ja1DF/3AuuVQMkVE1YmMshJMcMNFeXg2HL7cLeGsbMJxGHrZjih7oEelfJ5TPSK+5re6pfDiFd3lZ/RMzuqg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 05/12] xen/arm: gicv3: implement handling of GICv3.1 eSPI
Thread-Topic: [PATCH v8 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcIXHMU/gntH9UQEOAUqiND1Mh1A==
Date: Tue, 9 Sep 2025 10:09:16 +0000
Message-ID:
 <186b85b8c01eef4b708397f369e6b2c886c6ae61.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: 9dbdd22a-f338-4d83-ee08-08ddef88ef5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dUqQDaybj2o9fFLX1Jl26dYGgWuWYnZKwJwDpTfeI4v9H2qtWAgOQMh1Qw?=
 =?iso-8859-1?Q?0rxBXWMgZrhjCnyrCpFOoNIcgIDC5acLsAuSmsep+QY/zFcg5iO6yIVcLu?=
 =?iso-8859-1?Q?gEXHnHaJTcsybBhSYHIaloFZ1jZiIUuEUHD1BFZXff4mAU42rSydnSZk1X?=
 =?iso-8859-1?Q?aeWUHq5HA/Thr5GQpI91jkfpfDgdgUZH8U42hPmZVEgxKNlYY16R4pOpn3?=
 =?iso-8859-1?Q?xit0QWMtaZP1/xnkLj2xVCAap+OViweubXJZdyVgIRhTlUk7KbPmPMBzW1?=
 =?iso-8859-1?Q?lBzr7ZuORij4bBibAqYDKkT4gIcXQOFamkuzCEtqCYLLIvAoB8eaf6uVdy?=
 =?iso-8859-1?Q?hBYcWpvlKHcow0X+7y3W0/Bm/hrJa/xlI6q/GYoTPXSwFe1/seis0ZTq4W?=
 =?iso-8859-1?Q?DtCVO7pwPSza/EkcGoIlRfesYKePYT0w/NKxk4gRU9buKqpza28MVVDIwz?=
 =?iso-8859-1?Q?VZe+/BvIvrKRK3aVnKZuHtUte8vJY7PZY67/DPdO+ynL0RJ0LIX0lg8J6k?=
 =?iso-8859-1?Q?uBoowU1e1LG07Ll9TcEFHX4U5yRhqcXeY5XUrXLAnSnnSBWWZeZ/sFpHpa?=
 =?iso-8859-1?Q?4ewaw9LhPIa7y4/O3DXWc7S5+qXdHL1j0MD7SJmI22JIzElYvmc6cXWRiG?=
 =?iso-8859-1?Q?ZuNaHX4yPHaAAVFJ9i2jOKQgicEZg9NL1Xo2WiqWyFsGmQjHWSwAAF7CGn?=
 =?iso-8859-1?Q?fCdlm1wCtsIucaMoLtLPk63TXb3Ja7MNzir6SLlbgJt95kq+ta3/gKj3hJ?=
 =?iso-8859-1?Q?oruErS/vrxv2WDhttqningtRAjVX648iF2E8OZcFssjBAxgJzd1UHR9ATE?=
 =?iso-8859-1?Q?jE6zoDSI3TOGuFKoeTYycNrwN4bBrHDVB8JAwXqFkvVzUISF6rNtUP1iTr?=
 =?iso-8859-1?Q?4HceCSMP8gi9qmuaFL7dnrfBeNuMW8GwT8kwmMkLGiVVw6SpeuNwFPUbVR?=
 =?iso-8859-1?Q?1gFZA4NQoEO7dtMHWzpi0G+nh2z3RkWPBJDAPgnE5wd9Xb6mtc7bDkchnP?=
 =?iso-8859-1?Q?2rX/d82vNf9deJEDh3Vw0WCIihZqYXSjJEBGsIxIYdatcHJcZIGpzKjkaA?=
 =?iso-8859-1?Q?LHo+or+N7L06q4645gIM/dGSDFlPBJ436JBhMF3KYwqJigyXdTThCcnrww?=
 =?iso-8859-1?Q?B1aP7KUBFVz+iZDSCAE0jKz84OYMTODYz1tgpH/ktMso8CyqF+oTowpwDW?=
 =?iso-8859-1?Q?SHxotw28y+dwmKAT0Tv+5U28rl1JA/qNDIDFFzRg3UYtfA6BWF3oD1rpXf?=
 =?iso-8859-1?Q?BUha3Q14xXWgUEV/EtyuQ4LHUouo/+u6np5Neyq0MWd85PoGi88dbBqKKJ?=
 =?iso-8859-1?Q?CUZDArIM/XHZysddTlcYSvlhB2L0zM5afg0NxS01Sz+nYx6v5GV6eHe5ON?=
 =?iso-8859-1?Q?TeFhbz1SZb7s/8FzCUpXca1WJmGxVhORSeRSD+w0QtxNR6kkj+8lNO8G9D?=
 =?iso-8859-1?Q?y4GDtno5EHzHgeqM2/txfU3ZVt4g1b8SwQCCjeVIVsdGgjZZA9bs3wcU8f?=
 =?iso-8859-1?Q?dLe58g36nITPk5GGylBGg4GqZZUmWSLA3ckjDSDp4Cwzz0Vp2U0RMzr6DA?=
 =?iso-8859-1?Q?fwzGTcA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?P7aWIbihhpfDHcpq7eaEjsoTqp4B1rZAFLRKIWBUlmqyz9fWaexpAZ8/dM?=
 =?iso-8859-1?Q?xqAVrlAPZJIm4tZobhJGFtB4ZFT2X45B0hL/i15J8uLsRTJsfLzK0AhIGl?=
 =?iso-8859-1?Q?sRmMIufniR8/WYTujigp7t0eSuKyVJmulQDOf1OJzwfDTkV+3OvL9uUrx0?=
 =?iso-8859-1?Q?/3ZXlJ6PvHIp8271KfJ6kZ2aLHp7f+AJFKGtA/M6aVaMbxdF5ns9wsuype?=
 =?iso-8859-1?Q?54MxMToFXMHpyjnvnw08/LSLeBisoacpgmbTzIzL1kIj9X7HAGhG+1vP4c?=
 =?iso-8859-1?Q?bganqpRKBsZ2ahctM0Tt47sOd2szX03prDO47T2eBttFiXSyU4wSR5Hv0Q?=
 =?iso-8859-1?Q?O7+DbOy3aEseFEpZ9DDw68SUn0OkmWhvL+SRiJrNsuJnO40Ul9I93fKlQ4?=
 =?iso-8859-1?Q?7OPC9QiM5jTHw0CGIVa5/cTFUr90/JDT7aVEEKKK3uQmiMNBh2BW+BIFfP?=
 =?iso-8859-1?Q?pnS3ASz4CU9xSWByWwpHsGiUSmFfxSOJ9dClPxrTVwGRzavAytCqVWx+w4?=
 =?iso-8859-1?Q?wsVda8HhuNcAT5gyTCbEU4VJr9osFJONsdUtrsfBJFTm5PplYffFBKPyTe?=
 =?iso-8859-1?Q?aF28C+YlYD1AzpiijvgpDuhrJ+q5bRR8zdEaO1+uq/b46RDQ0gfVT1m0Kh?=
 =?iso-8859-1?Q?U244kGlnjp60/CVoGk0dPZMEV7Q/lN4tZz6bkDVJTAZL97GFyzen+2BSr5?=
 =?iso-8859-1?Q?0bWYmwSq7MyFzuLg2PnI+Ytmbx9jXNb346Qi6KM45mEXHU1hcIsNSmYJAp?=
 =?iso-8859-1?Q?2zmcVEcxgs1ygFlE6dWFQAN1geKcHPYrhItV6UQjiu5mzhT3zWHJ+4kvuS?=
 =?iso-8859-1?Q?1hGc/Ch/KDoaCrw7JOOkpIgQTLpMIy7fl3W1kC2vqqOZah8TTNyb4eGpFe?=
 =?iso-8859-1?Q?ObvJVXpDwIVKxwpzi3uA01pRCBvrv3IWJSdTJ39naIQz3H4OclvKdzoDNr?=
 =?iso-8859-1?Q?XdkE3TXGZBjfZALBC5Dh/poyqh4TLgzpir3fzc/uJkKGIWOPm61rcqEw8X?=
 =?iso-8859-1?Q?W1ji5UjztmXRT/k1pbgAgLxQd0otTiyOCucMLoDnSKbSnHiSQLRurBY9Zv?=
 =?iso-8859-1?Q?Xwvg7mWr8reHZTrXfh9tCQS/FBYXcEIm4jX0JY49oi3DM9WXfrqc2eG+S5?=
 =?iso-8859-1?Q?0oZXiYVL2wM6BBTkrQn9d/MVXLaXKdY5ITEiA+6uAjQV+TFKPaGoPJGnU1?=
 =?iso-8859-1?Q?+phovsB9j/NdngXqKoPPk/NTo4Zr6ovcj5bFo1/pVAmaC0ZO3jdH/rvpTF?=
 =?iso-8859-1?Q?L7tkJ24MpN68sPTBzCzftTOOhnreC3eu6c9iBG91CM8ggDCdCjKnSOJDzE?=
 =?iso-8859-1?Q?jOClfppmn4nRpGdlyFdcjSUTzoBT8p6GleXr8IA/L6M16yDPqT9bGeWoN4?=
 =?iso-8859-1?Q?Cv4G3PQwqa0NQZ5WC50HEeF/kr3tE5FhWJF981+mv0LWaDUiYnzlKs5ng6?=
 =?iso-8859-1?Q?7mE0ENd22GGcPlXoWsOowy8jqMciN+pM9MK5vDGiw/pZwwQOFbxjYFF7uT?=
 =?iso-8859-1?Q?ICVnXnrVjzyzBIyA0oSq2g75R6xR+6Z/v3YHypEycPAhcl+Zus5B23wl8p?=
 =?iso-8859-1?Q?gMAsWMTxYPwpmXB2SIyGSnq8Qlxh0C00PHf/V3L1rrvuLU85pYfCD+F3BT?=
 =?iso-8859-1?Q?lk9WVg+RjhqRlEOLhQ0f/DX2YwsHNCrtS55oYPkoc7/H5+I671KuOpHZrS?=
 =?iso-8859-1?Q?Je60kKV7CfzG/PtxKw8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbdd22a-f338-4d83-ee08-08ddef88ef5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:16.6734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjZGUeix5PYPmTqkY/vffCkSEeVnzVIwv3FDBqinyAx8E+/Ys0VWmB6AJvDmjaVkHPlj4eHl6/cv6UTckWtBMSbgPqtJtaEqekX6n5n5PXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

Introduced appropriate register definitions, helper macros,
and initialization of required GICv3.1 distributor registers
to support eSPI. This type of interrupt is handled in the
same way as regular SPI interrupts, with the following
differences:

1) eSPIs can have up to 1024 interrupts, starting from the
beginning of the range, whereas regular SPIs use INTIDs from
32 to 1019, totaling 988 interrupts;
2) eSPIs start at INTID 4096, necessitating additional interrupt
index conversion during register operations.

In case if appropriate config is disabled, or GIC HW doesn't
support eSPI, the existing functionality will remain the same.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- add missing break in switch-case (fixing potential violation of
  MC3A2.R16.3 with CONFIG_GIV3_ESPI=3Dy)
- minor: add comment for default case (fixing potential violation of
  MC3A2.R16.4 with CONFIG_GIV3_ESPI=3Dy)
- minor: as nr_espi is unsigned int, the %u instead of %d is used
- added acked-by from Julien Grall

Changes in V7:
- no changes

Changes in V6:
- removed unnecessary parentheses in gic_is_valid_espi()
- updated gic_is_valid_line(): it now verifies the condition irq <
  gic_number_lines() first, as it is more likely that the irq number
  will be from the non-eSPI range
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch
- added reviewed-by from Oleksandr Tyshchenko

Changes in V5:
- fixed minor nits, no functional changes: changed u32 to uint32_t and
  added a comment noting that the configuration for eSPIs is the same as
  for regular SPIs
- removed ifdefs for eSPI-specific offsets to reduce the number of
  ifdefs and code duplication in further changes
- removed reviewed-by as moving offset from ifdefs requires additional
  confirmation from reviewers

Changes in V4:
- added offsets for GICD_IGRPMODRnE and GICD_NSACRnE that are required
  for vGIC emulation
- added a log banner with eSPI information, similar to the one for
  regular SPI
- added newline after ifdef and before gic_is_valid_line
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- add __init attribute to gicv3_dist_espi_common_init
- change open-codded eSPI register initialization to the appropriate
  gen-mask macro
- fixed formatting for lines with more than 80 symbols
- introduced gicv3_dist_espi_init_aff to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled
- renamed parameter in the GICD_TYPER_ESPI_RANGE macro to espi_range
  (name was taken from GIC specification) to avoid confusion
- changed type for i variable to unsigned int since it cannot be
  negative

Changes in V2:
- move gic_number_espis function from
  [PATCH 08/10] xen/arm: vgic: add resource management for extended SPIs
  to use it in the newly introduced gic_is_valid_espi
- add gic_is_valid_espi which checks if IRQ number is in supported
  by HW eSPI range
- update gic_is_valid_irq conditions to allow operations with eSPIs
---
 xen/arch/arm/gic-v3.c                  | 85 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic.h         | 21 ++++++-
 xen/arch/arm/include/asm/gic_v3_defs.h | 38 ++++++++++++
 3 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 2fdd96dbb1..bc07f97c16 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -489,6 +489,38 @@ static void __iomem *get_addr_by_offset(struct irq_des=
c *irqd, uint32_t offset)
             break;
         }
         break;
+#ifdef CONFIG_GICV3_ESPI
+    case ESPI_BASE_INTID ... ESPI_MAX_INTID:
+    {
+        uint32_t irq_index =3D espi_intid_to_idx(irqd->irq);
+
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+            return (GICD + GICD_ISENABLERnE + (irq_index / 32) * 4);
+        case GICD_ICENABLER:
+            return (GICD + GICD_ICENABLERnE + (irq_index / 32) * 4);
+        case GICD_ISPENDR:
+            return (GICD + GICD_ISPENDRnE + (irq_index / 32) * 4);
+        case GICD_ICPENDR:
+            return (GICD + GICD_ICPENDRnE + (irq_index / 32) * 4);
+        case GICD_ISACTIVER:
+            return (GICD + GICD_ISACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICACTIVER:
+            return (GICD + GICD_ICACTIVERnE + (irq_index / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGRnE + (irq_index / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTERnE + irq_index * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYRnE + irq_index);
+        default:
+            /* Invalid register offset for eSPIs */
+            break;
+        }
+        break;
+    }
+#endif
     default:
         /* Invalid INTID */
         break;
@@ -661,6 +693,55 @@ static void gicv3_set_irq_priority(struct irq_desc *de=
sc,
     spin_unlock(&gicv3.lock);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+unsigned int gic_number_espis(void)
+{
+    return gic_hw_ops->info->nr_espi;
+}
+
+static void __init gicv3_dist_espi_common_init(uint32_t type)
+{
+    unsigned int espi_nr, i;
+
+    espi_nr =3D min(1024U, GICD_TYPER_ESPIS_NUM(type));
+    gicv3_info.nr_espi =3D espi_nr;
+    /* The GIC HW doesn't support eSPI, so we can leave from here */
+    if ( gicv3_info.nr_espi =3D=3D 0 )
+        return;
+
+    printk("GICv3: %u eSPI lines\n", gicv3_info.nr_espi);
+
+    /* The configuration for eSPIs is similar to that for regular SPIs */
+    for ( i =3D 0; i < espi_nr; i +=3D 16 )
+        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 4 )
+        writel_relaxed(GIC_PRI_IRQ_ALL,
+                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) =
* 4);
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVERnE + (i / 32) =
* 4);
+    }
+
+    for ( i =3D 0; i < espi_nr; i +=3D 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + (i / 32) * =
4);
+}
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity)
+{
+    unsigned int i;
+
+    for ( i =3D 0; i < gicv3_info.nr_espi; i++ )
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTERnE + i * 8)=
;
+}
+#else
+static void __init gicv3_dist_espi_common_init(uint32_t type) { }
+
+static void __init gicv3_dist_espi_init_aff(uint64_t affinity) { }
+#endif
+
 static void __init gicv3_dist_init(void)
 {
     uint32_t type;
@@ -706,6 +787,8 @@ static void __init gicv3_dist_init(void)
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i +=3D 32 )
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4)=
;
=20
+    gicv3_dist_espi_common_init(type);
+
     gicv3_dist_wait_for_rwp();
=20
     /* Turn on the distributor */
@@ -719,6 +802,8 @@ static void __init gicv3_dist_init(void)
=20
     for ( i =3D NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
         writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+
+    gicv3_dist_espi_init_aff(affinity);
 }
=20
 static int gicv3_enable_redist(void)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 3fcee42675..3947c8634d 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,9 +306,24 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+#ifdef CONFIG_GICV3_ESPI
+extern unsigned int gic_number_espis(void);
+
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return irq >=3D ESPI_BASE_INTID &&
+           irq < espi_idx_to_intid(gic_number_espis());
+}
+#else
+static inline bool gic_is_valid_espi(unsigned int irq)
+{
+    return false;
+}
+#endif
+
 static inline bool gic_is_valid_line(unsigned int irq)
 {
-    return irq < gic_number_lines();
+    return irq < gic_number_lines() || gic_is_valid_espi(irq);
 }
=20
 static inline bool gic_is_spi(unsigned int irq)
@@ -325,6 +340,10 @@ struct gic_info {
     enum gic_version hw_version;
     /* Number of GIC lines supported */
     unsigned int nr_lines;
+#ifdef CONFIG_GICV3_ESPI
+    /* Number of GIC eSPI supported */
+    unsigned int nr_espi;
+#endif
     /* Number of LR registers */
     uint8_t nr_lrs;
     /* Maintenance irq number */
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 2af093e774..3370b4cd52 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -37,6 +37,44 @@
 #define GICD_IROUTER1019             (0x7FD8)
 #define GICD_PIDR2                   (0xFFE8)
=20
+/* Additional registers for GICv3.1 */
+#define GICD_IGROUPRnE               (0x1000)
+#define GICD_IGROUPRnEN              (0x107C)
+#define GICD_ISENABLERnE             (0x1200)
+#define GICD_ISENABLERnEN            (0x127C)
+#define GICD_ICENABLERnE             (0x1400)
+#define GICD_ICENABLERnEN            (0x147C)
+#define GICD_ISPENDRnE               (0x1600)
+#define GICD_ISPENDRnEN              (0x167C)
+#define GICD_ICPENDRnE               (0x1800)
+#define GICD_ICPENDRnEN              (0x187C)
+#define GICD_ISACTIVERnE             (0x1A00)
+#define GICD_ISACTIVERnEN            (0x1A7C)
+#define GICD_ICACTIVERnE             (0x1C00)
+#define GICD_ICACTIVERnEN            (0x1C7C)
+#define GICD_IPRIORITYRnE            (0x2000)
+#define GICD_IPRIORITYRnEN           (0x23FC)
+#define GICD_ICFGRnE                 (0x3000)
+#define GICD_ICFGRnEN                (0x30FC)
+#define GICD_IGRPMODRnE              (0x3400)
+#define GICD_IGRPMODRnEN             (0x347C)
+#define GICD_NSACRnE                 (0x3600)
+#define GICD_NSACRnEN                (0x36FC)
+#define GICD_IROUTERnE               (0x8000)
+#define GICD_IROUTERnEN              (0x9FFC)
+
+#ifdef CONFIG_GICV3_ESPI
+#define GICD_TYPER_ESPI_SHIFT        8
+#define GICD_TYPER_ESPI_RANGE_SHIFT  27
+#define GICD_TYPER_ESPI_RANGE_MASK   (0x1F)
+#define GICD_TYPER_ESPI              (1U << GICD_TYPER_ESPI_SHIFT)
+#define GICD_TYPER_ESPI_RANGE(espi_range) ((((espi_range) & \
+        GICD_TYPER_ESPI_RANGE_MASK) + 1) * 32)
+#define GICD_TYPER_ESPIS_NUM(typer)    \
+        (((typer) & GICD_TYPER_ESPI) ? \
+        GICD_TYPER_ESPI_RANGE((typer) >> GICD_TYPER_ESPI_RANGE_SHIFT) : 0)
+#endif
+
 /* Common between GICD_PIDR2 and GICR_PIDR2 */
 #define GIC_PIDR2_ARCH_MASK         (0xf0)
 #define GIC_PIDR2_ARCH_GICv3        (0x30)
--=20
2.34.1

