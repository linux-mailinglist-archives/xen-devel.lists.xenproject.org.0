Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D4B3C047
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101647.1454606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cD-0006CB-Jr; Fri, 29 Aug 2025 16:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101647.1454606; Fri, 29 Aug 2025 16:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cD-0006AI-G1; Fri, 29 Aug 2025 16:06:13 +0000
Received: by outflank-mailman (input) for mailman id 1101647;
 Fri, 29 Aug 2025 16:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cC-0006AC-LB
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:12 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14a7fd66-84f2-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 18:06:11 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:07 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:07 +0000
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
X-Inumbo-ID: 14a7fd66-84f2-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMEwjsMcR8P0y3H4lhXsAI1AXnCh2ad0tqcij4n1U59lct5SLySJDdwhkd4F8k+rq05hA5WTt/4GziIkyB0rUq02gsjvYVuQADP1M4sbBlP2WJ/PoeniSNWCYseAaj6frjLBXqgijl4O4NMh0ZvwEWb7Vh4t4lwRfyx0cHhIJtvrpIVdRmcdmPINTd1gBQzYi1sgDqo1Dfyokfe+Z1O6dYszBc3qy2k6stOA7Fe3FjY3LytSvINiw3Zxs+O1NJX5RjS+fbL8KJRSgIDyvxlZCiFDz+sn5l9t8Po7Z/vP8bA+iPJ6S4M6bpF3PCecoxTFZ3M3VY9EmUcE6PxzoL/azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V7PEb0vuQBSknI6D+YXMfekYTfTq55WoDTdLgn8EB8=;
 b=oDoxlq1JiE3dbg4cspnk+7WtsvdwpYHzX6m4oFerMtF3mD7kyZQgPbZ1Ag3P/gqNyo9tQUhSeWZG15DjFEE6lFLShk5ApcZ+2N4w2E5X3p68ZMmZ6cD1hvAuOF/slvZtvcQ7b7nueMxKlG+z99oLQvCR16oXIUTqBX1pCPspq6uAnq6+Fu44Ecm4MRl4dqZds4K1kxWlCZl8vG2ry/XH9UetYuVVv7Mpda71fnnQ/BlKvExnTlBAC06RBy9+h8m3Efm1MB5XkzZsVYzrrXdh7Qgzt7hvGxzYYD0VDkzdOeCua2pd68agU0dTMjQ9srGtOkUOfl1K4XYks51ArJI6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8V7PEb0vuQBSknI6D+YXMfekYTfTq55WoDTdLgn8EB8=;
 b=iuX9TLIR5U0CUu9EDPLz1DH8c2omQ20RfSBWQbLwVnkL+D7mMsT4sV0t97JrttR7GWCRxs1RmhZmEwdGNpwoaxkv2S1mj2KphFTEgF1+cyRu0roVkPpHhtA1Mdix6DzO04hi5qMBaBCv4zIs4pIlrugfmBcbNMqBpeh2D9MMsGAYrPzIsKejdAzrcc4PSpzMpgdNHnh6K173iVjofr5ly/kzecNbuNCYE2n3/hT7daaKPdvm3ojpUybC++7NNUVM61xusrEZ5UNx1X+2cquo1D9JOzkPMEJZCaL4kGYJiaInQQrSOmoJpet0aGS6mom+geoBbGnfxrnwOm4cPjC/Gw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v5 00/12] Introduce eSPI support
Thread-Topic: [PATCH v5 00/12] Introduce eSPI support
Thread-Index: AQHcGP7UQBYvhtVNRUaCLipIubV2Ig==
Date: Fri, 29 Aug 2025 16:06:07 +0000
Message-ID: <cover.1756481577.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8676:EE_|VI1PR03MB6317:EE_
x-ms-office365-filtering-correlation-id: f65454b8-2252-4edc-4046-08dde715f6bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RiXAC9+4XGB4HJR/h7UDJstkp+/IG+PQmLisnTSsOUo3E2EdayJfhxtbvl?=
 =?iso-8859-1?Q?kyuytoYsind+JfM52rhHeMyWzA3F0PqnXeaYqAKOR8yMpOSZIwbp3oz0yP?=
 =?iso-8859-1?Q?QV/gnMDXU0ZV8igvclKPQ+XmO6Uyb7yLxjCK7jem5sP8yxYQftw3L4S8vd?=
 =?iso-8859-1?Q?cnLlqGtjDtCBuyS02CBid0aWhbsaXR3IDSpXGPeYfRUNqDvP0Y0VVMlKT7?=
 =?iso-8859-1?Q?KzKXqFuxb4FiZPsff+iMvpD4Yp51lEkoWJjbr26CIep0HQ2rmE9LFz5Llg?=
 =?iso-8859-1?Q?Y6meLF3mwSG//U9FTJmkOOg2utoaYD7UupWOah0A9mU11Z4Bw27cHceoEY?=
 =?iso-8859-1?Q?srErP3uYnscJDYDr6bdm+vYpOWRxZElIpeo4Rf2ZY3HZ+F5lxfAMVOyKyD?=
 =?iso-8859-1?Q?uHwmi+sTxlg94Fr5ANwUmOy0gf9hMXTzvqpW65Pt4dbxreuBG8OhsYQJLL?=
 =?iso-8859-1?Q?+r+DfbfROpRlva2mkJF2duk7sHviVdHuji3e7xq6Iu64UdpAcnP4SbCZY/?=
 =?iso-8859-1?Q?wRHEOqE/uVKW9fMqY4s29tC+GIFx+ZtXgaJDxsgnlQdHCP7u7IrtJThnEK?=
 =?iso-8859-1?Q?z38LSptmV+JxzmKQwURwwQMWfHFuoiG5JYsj9LjdozxcyQlIjRJygp6Nwk?=
 =?iso-8859-1?Q?QOO6YgxQaHy46jCyI78MzVvq74XR5kIn32QE/liip9Y1mFTpJQhQ+g//Yh?=
 =?iso-8859-1?Q?UFitz/71LyelJaoiDeAUPAyz/7GqvH6reD2wUmA2UkQ2/DSR5cm5WrN5HU?=
 =?iso-8859-1?Q?lnygzsf+qruWwbabRcbnfUXa1LpiG7rams1YfP3xcn4UXyXSbEfygXPQ4k?=
 =?iso-8859-1?Q?3JpKmvY7tXY1bXJWhm5VoftRdYAMAXCVEo+1EvizDHuizoI0kgl3QXYCxi?=
 =?iso-8859-1?Q?1J/B1iX1es4m3DMgai45+UtAH1hSwUQmn1CrPX7SBBPpsTb/IqSqdgvT7n?=
 =?iso-8859-1?Q?SC4mMvJCI3ZCq5Z4JHhdiDGbFiloQYQ8FQL356jTgZEYhzqX7/Ec7maMfP?=
 =?iso-8859-1?Q?oJYOSrQvYsdrUyzOSS776KAPDhwjJTAypESGaRycfu4cZjfthOvFetPMy0?=
 =?iso-8859-1?Q?OG7Yzh+9ziq72YHAi+2NB06w8xCs27GsdEjyheDvJ2plExaJpwyB4J6R9K?=
 =?iso-8859-1?Q?HAR1GZglSwoiBwieh9kpT9evzKlZxebKiCFp1drIce5Q98axLwBHYPgB95?=
 =?iso-8859-1?Q?L1tYhXhk8MNzQUiYv1QbIF/t+5W2q6dDgNZyP7ZqjO+DPh+2/kyB3SGjGq?=
 =?iso-8859-1?Q?SrXG99vS4QNPPv4gGux8zHhCxTGTddNjNUi/RfOy3yFF2q6FuGLYa/lOqM?=
 =?iso-8859-1?Q?IbGEvxALz819UEvPvKHTKF5+OmYaauSgkbzFLpnZmhKZw+N/24U5C2w1uK?=
 =?iso-8859-1?Q?6CtHE/99xGrvX+/xXCMKHERCokQ1AZ6Otnz9/RfuEroC7M/GoY8oGVeHf+?=
 =?iso-8859-1?Q?2djJI9mGXQaMMuYA+JtdSlgLRDHU1KTRAQ4Q+p2NKmlT6VqlWLU+R9b/xC?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7TOncN+S+otIg9v5MGQrgGCRJXQsFk44pkB5ij9QgSLDT/0Ck/iFuN3LZA?=
 =?iso-8859-1?Q?oMhxooVWGO3s5k7lhxxv/HOBcZY4JXM8cEXU5skyJJSEVy2suSMzBwQVMO?=
 =?iso-8859-1?Q?CnG9pCWWueTI2dp89E5/WCAebVOtNkHkE61H8CI+ECJMraojgbIUeZlQ3R?=
 =?iso-8859-1?Q?pLMrshjru0f8RVB17Mm9Mu46Wt9lnff5n6CdqkEr6amHl+oCFMQTfPl49Z?=
 =?iso-8859-1?Q?NF3jhsR3yu7PpsQEaliKDzsh8nBkSaJZHXakE4eIEDRP2r35a7hIs8Gw4i?=
 =?iso-8859-1?Q?GhzQ6+zYmfs4/6I3qkqTQLK/uznQP6G/Ld7/AquD/OiE3lPLStHd7U/2aM?=
 =?iso-8859-1?Q?mHirC5k0mo/ChDV8R12xdVHYdvHsL8nmU5fQEDoqnE64nYkRUyjhQde8l6?=
 =?iso-8859-1?Q?y+9DKB2/24s86w3w6F9xCTulN6nOF99FT9+QEHUZULAdlUOYoYhStdK7an?=
 =?iso-8859-1?Q?gRAY8S1t1TihnHx5KbwfeusLwhMvfWTjzmkVJh3b6mvEMqzJTf3Ll98nC2?=
 =?iso-8859-1?Q?/3LAOlPXwZVAO/MI/XlzANOSFvaQ5u02s8sBzBz9AKDoAp4r3/l5SI2BDr?=
 =?iso-8859-1?Q?INFq1I8fmHowF5plmp06QaoJTL7Mk7ef7iQrrMhuMNQbvd+84L9M8xzh76?=
 =?iso-8859-1?Q?eImaD1WGZgPifa2+jUsXtfS3GwasWnuppaHLqDuvxSoxYV48uwRTxNhcE+?=
 =?iso-8859-1?Q?Pxwuk3Bjp5rSk9YFD9v3qToL2G2moA4xoIcx+HB4bWxS+3bsPo9GmTpnFf?=
 =?iso-8859-1?Q?I9tVoZnPVp7qqAzVsWrV2K0QhCMywzTfxSNZ1xke3fjO5nUEBqg5dHDEMF?=
 =?iso-8859-1?Q?/QrlVVxGiEs8b8a/ISeSOSVctbC+5SSogWnzu4LbaIyrOPIs0FDt3l1Nf9?=
 =?iso-8859-1?Q?55zQGQhqI4ZER/WbyPoiTQsZYFg7LVZ1U0yBzPHrsM7/K5YB8RrX5Tj7c0?=
 =?iso-8859-1?Q?MagOKu7ImBxsiyKGALU9q77vS7GTINVMLPGuTFBKuJDPV55kg9o2v4Drio?=
 =?iso-8859-1?Q?FnYWgR0d7mZawhipnZI/BnYczxz/uWZRIU4TI4TlqYR5lLm8Kf2AmZhCdm?=
 =?iso-8859-1?Q?D6VygQOkdruMaBu7gCipJI6W11cku6KfEmzG749iRnqfwbE3bmT1i1iyrv?=
 =?iso-8859-1?Q?iEPLcsg7eD+P0tky1BJOca2xZwuPEIQDnLY3T/MPt3JfohYymbvyPvBpA/?=
 =?iso-8859-1?Q?RB1cu8ySJuy1mjlQYQvKpQOdr+SNvw/eYD9m+3VQGg5AzA0rJfkQpW2ass?=
 =?iso-8859-1?Q?qgHXjI6JPCPW4LdR2PqA9vi7ubFfocAvPl40F27V1ocVzDoPa0BzYTqlPo?=
 =?iso-8859-1?Q?9Kg3bH7HLgAZzGJU6DLZj4I/oVCLm4bna85v7Z1vuDdeM9tPy9LqrdCzPK?=
 =?iso-8859-1?Q?IKNA814coaW2JwsNSLLUwWtEvxlsMejEynBZRxKl/GjWgL9+34zv1HaR7s?=
 =?iso-8859-1?Q?TpbRmUn44Zkxle+0GY4p1eaKU2FMK38P3gzGcxhWiej/QymW1/5xIIiaxX?=
 =?iso-8859-1?Q?3hgEHxPcRqciBBmCUovaTqdcYCGcZYNcgQpjafua3Tlcks2/3kYHdhxjfZ?=
 =?iso-8859-1?Q?qxL3Hqcn4Q2uDjRzdnJ+8VuHPMrCAr+vdEV/iALtcSktOSAoXpVEi7h8MG?=
 =?iso-8859-1?Q?GxEu7SD9aZj/53Cwxj6v37bvCmDpZAUy6nVaBmGVhvuUVIVTPxrgGaKsjf?=
 =?iso-8859-1?Q?yEyzadI+tlOHpKjfLoM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65454b8-2252-4edc-4046-08dde715f6bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:07.5832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CRPNd4SkwEFrmfdWCEZsgI7ztPMNa4lpmTUHVtV2ybAyJ16qL3F8hiS2QD5mesCE+6pLow1w4LmpYpKtQLz6OlyfM5x82/dSXkqX0Kho3bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

Hello everyone!

This is V5 of the patch series to introduce eSPI support, which contains
fixes and improvements based on the comments received in V4.

The main changes in this version compared to V4 are related to removing
unnecessary #ifdefs that previously prevented the use of certain defines
and macros, leading to an overuse of #ifdefs. After refactoring, it is
now possible to reuse the existing code for vGIC eSPI emulation, which
improves readability and simplifies future changes. As some patches that
had already been reviewed were modified, I would ask Volodymyr and
Oleksandr to take a look at the updated versions of:

[4/12] xen/arm/irq: add handling for IRQs in the eSPI range
[5/12] xen/arm: gicv3: implement handling of GICv3.1 eSPI

The changes made in these patches allowed me to significantly simplify
the following patch:

[10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers

For the other patches, I have addressed comments and added reviewed-by
or acked-by tags accordingly, based on the received comments.

Summarized description:
This patch series adds support for the extended shared peripheral
interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
and guest domains. The implementation uses a generic approach to handle
eSPIs, similar to regular SPIs, while maintaining compatibility with the
existing SPI range. Functionality remains unchanged for setups that do
not require eSPIs.

The series includes:
1) General refactoring of common IRQ operations with GIC registers to
improve code readability, simplify further maintenance and prepare the
key functions for eSPI implementation.
2) Introducing a new Kconfig option (default n) to enable or disable
eSPI support. Disabling this option prevents unnecessary resource
allocation for setups that do not require eSPIs.
3) Adding additional resources to store required information and operate
with up to 1024 interrupts from eSPI range.
4) Adjusting assertions and checks to pass verification for INTIDs in
the eSPI range.
5) Configuration of eSPI-specific registers during GIC initialization
for systems with GICv3.1+ hardware.
6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
access and operate within the eSPI's INTIDs.
7) Updating documentation and CHANGELOG to reflect the changes made for eSP=
I
support.

Also, to simplify reviewing, please find below link to unsquashed patches, =
that
are on top of every patch, that is changed in the series, compared to V4:
https://github.com/LKomaryanskiy/xen/commits/espi-support-master-upstream-v=
5-unsquashed/


Changes in V5:
- individual changes in patches

Link on V4:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01767.htm=
l

Changes in V4:
- added a patch for documentation
- individual changes in patches

Link on V3:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg01628.htm=
l

Changes in V3:
- added a patch to update CHANGELOG.md
- individual changes in patches

Link on V2:
- https://lists.xenproject.org/archives/html/xen-devel/2025-08/msg00372.htm=
l

Changes in V2:
- added 2 more patches to implement helper
  functions for gic/vgic:
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
- removed 2 patches:
  xen/arm/irq: allow assignment/releasing of eSPI interrupts
  xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
  since their functionality can be moved to appropriate patches after
  introducing patches with helper functions
- individual changes in patches

Link on V1:
- https://lists.xenproject.org/archives/html/xen-devel/2025-07/msg01809.htm=
l

Leonid Komarianskyi (12):
  xen/arm: gicv3: refactor obtaining GIC addresses for common operations
  xen/arm: gic: implement helper functions for INTID checks
  xen/arm: vgic: implement helper functions for virq checks
  xen/arm/irq: add handling for IRQs in the eSPI range
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
  xen/arm/irq: allow eSPI processing in the gic_interrupt function
  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
  xen/arm: vgic: add resource management for extended SPIs
  xen/arm: domain_build/dom0less-build: adjust domains config to support
    eSPIs
  xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers
  doc/man: update description for nr_spis with eSPI
  CHANGELOG.md: add mention of GICv3.1 eSPI support

 CHANGELOG.md                           |   2 +
 docs/man/xl.cfg.5.pod.in               |  13 +-
 xen/arch/arm/Kconfig                   |   8 +
 xen/arch/arm/dom0less-build.c          |   2 +-
 xen/arch/arm/domain_build.c            |   2 +-
 xen/arch/arm/gic-v3.c                  | 195 +++++++++++++++++----
 xen/arch/arm/gic.c                     |   8 +-
 xen/arch/arm/include/asm/gic.h         |  31 ++++
 xen/arch/arm/include/asm/gic_v3_defs.h |  40 ++++-
 xen/arch/arm/include/asm/irq.h         |  25 +++
 xen/arch/arm/include/asm/vgic.h        |  42 +++++
 xen/arch/arm/irq.c                     |  62 ++++++-
 xen/arch/arm/vgic-v3.c                 | 198 +++++++++++++++++----
 xen/arch/arm/vgic.c                    | 232 ++++++++++++++++++++++++-
 xen/arch/arm/vgic/vgic.c               |   5 +
 15 files changed, 778 insertions(+), 87 deletions(-)

--=20
2.34.1

