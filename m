Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8217DAFAF83
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035406.1407662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1v-000175-3F; Mon, 07 Jul 2025 09:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035406.1407662; Mon, 07 Jul 2025 09:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1v-00015W-0G; Mon, 07 Jul 2025 09:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1035406;
 Mon, 07 Jul 2025 09:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd65=ZU=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uYi1t-000140-97
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:20:53 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a719f998-5b13-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 11:20:41 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6305.eurprd03.prod.outlook.com
 (2603:10a6:20b:157::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:20:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 09:20:39 +0000
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
X-Inumbo-ID: a719f998-5b13-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmvJ3K76haoUvEUy9X0iXFIZDZy5SHkg7tC4MMJlxRDdavPVKP2gAWFLnBpY3D7NHPwMsoma80JDcQVaLG96SC4ar3Jt951IKUOqWZSm7qChHyLeWOUGIDbjVcYGsaP3Jfnfs1CFRBM8oA2GGyUCaRHJIsI2TK+sPiurpc4M7UyIs/0PE31wMWFOp0ZLgrfDJcQA6AkGOqmJMlUZjXSpRciXmlJSbwSJZkjgP8NggICShuIRZEOv3f1hJ2EX4TPO+NIhsPtDHjbAAyUp/jKJAWyudKCS31NqqBvWTdYxjptYQJ1HLEk+YP4Sjf2zGFkfP/LuBeqewAVWIIeT+bc6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENWxXETFXbFb66Gnc6tEcbaB3lNMsQyGY9v9LuOLDl8=;
 b=OP0fu6RDyq8Tk9sJGH5t20BTOpIja5W6uJg6uTE1+ANZceKzi3eHHMVzdu5KmT0uX8d+Hi8biiPJGNfJp5LJZklxMdpavPI8fSGnNMj43OkajXalCmFKdGKTyrfiuosupHBOGzQLwYPcLSoUeGx47efz5Pvk+RyXMw5HNMF3Kwla5Peka3zw32RIt6Ix06kRXpbGdyC4za/Mm5DBWew4mUr/eeFBTqGZBJF50tEdQMkxYD4JcNF08UZ7b7szAFHY1AMnvo16a5y2Y/GhEToWgGlR+KZxWZw1tZnXfrXGbCkVm65w/WpaPKk5RvVMskoLBdBe+ZvE4z+if305apvA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENWxXETFXbFb66Gnc6tEcbaB3lNMsQyGY9v9LuOLDl8=;
 b=r1n9IK3J2t/rTKcSjonkpaHC75Bp/aiTWMO3IXkm3Ez2T31Mkv2Lba5hpQ/g2s07znJJHCEWgNH5zKiocFByYO2g9g7WXmP9QGeqTuCHyel7KhKvUjUsLKN1NKkO0Wub3uZfIjqjgqi5RsAkE/nGhPwdPjjz9Jrxqofm3DW2ZSh3nmNr8pwiqBvRIv78gS2MDlXq8VKkIs3xapNtEWO8qNEB0Gtx+moJOLGj6Asp0QP7dWC1cBWxjq/A8W5ElZTTq7W+QfOqaZvi7ft2hkLX2Hjv8K60ZFVxwn8i+Vb7tqQDzkfPsWlBgC6f1V5HcVu5JnnD0DnHjNEB6DB5YlUtkQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/3] IPMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v1 0/3] IPMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHb7yBnswZZLzWQ7ES490bgTlRUoQ==
Date: Mon, 7 Jul 2025 09:20:38 +0000
Message-ID: <cover.1751874601.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6305:EE_
x-ms-office365-filtering-correlation-id: a38cb513-f159-4210-2cd3-08ddbd3789f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9Y+RM/BcIclVAhBDHM8A1yVagj75a1x0x932ZQJyexfaYtYcL2hrGl6iJK?=
 =?iso-8859-1?Q?Jf5Ocwk+1ZuIwBVnC4NeWweKC/29K1a2ZekE9IDzEQAl4aWHxoNnYM8XfC?=
 =?iso-8859-1?Q?LOFBo4LndSMvWPKXT2jCtz0Bkida92O99GhjhNuRLucVwYdHD7uWPEbym7?=
 =?iso-8859-1?Q?HomKjaGr2jBM/SBu0Jv+FBsBXSt0df7qAQ54FNdtOOUg7SKD291pnFe+k/?=
 =?iso-8859-1?Q?5GI2GrXoZfUsNhZwaVwJv1UsGkos2Q1D68+gADUsHt51SjWnDwzzTHfdK+?=
 =?iso-8859-1?Q?kHK3FR4ACDHe3ZALIgjAZ8ThnTP5DxjfLNC8YxOrAtc8GZNpY5eiFohaee?=
 =?iso-8859-1?Q?D5uHqi+3d5MYQrC02UmSUTsANSyUTFD8NPukX0tgKVhfL/uyD6thMc6pyH?=
 =?iso-8859-1?Q?S0Mn3Z4H+VnuCK80560j5VcgpxI0tvsKfzyd30KBxayrJKUmwOXxYAcNWy?=
 =?iso-8859-1?Q?eN6B9bBfMo/SfifHOvkha3pEOB2lIvjysbGNWjbHQKLOiNN6qCQ3sFFCpJ?=
 =?iso-8859-1?Q?WWObGScu0ABs3A4glaPtNbWlfNkkuTLMvrl7kYfW499ne4P69pYJY4F19u?=
 =?iso-8859-1?Q?cdYLqX2zFF4tVA/IOnKTjaRkJfUuA1xOkD/1rGhYzX96S8nF5ShBlDSir+?=
 =?iso-8859-1?Q?WFYMaeJTxqkQlxyuyXOSx2tzHLOc6k3t/7rpP+dV8OrcLIQGZy/epnz3QR?=
 =?iso-8859-1?Q?1ZCXTzupV2Tqt8M1iaftdRZjGhivcw7s3C73J77E9BSn6VVqEg7fk/6/i5?=
 =?iso-8859-1?Q?nFgI3QhiuBxL76uhDZv2/9/pV2ei4KsYLlDWQDKLP7xwXuvzp2v7odo/kZ?=
 =?iso-8859-1?Q?pvAmrl2qSHQfF293PlVjMNdkIVz3yF/z39ShR7BHh1KwOvgRBykJiB2PJM?=
 =?iso-8859-1?Q?cemy1Cz8YgnHHok/Ns56Yxm/IbYzZ88DaK6gwabNl4C+kFtsb6PKn4V1nP?=
 =?iso-8859-1?Q?EO85BVBp0ieqbkk+ghvQYGwFY4nr7Fi8EkroVIvtcImWvzSC/JQOPVDOMw?=
 =?iso-8859-1?Q?qMOpSo9vBkEQ/UHadkMRuMVW2R4cu3ZVatyzsYvyXYOwi3LaldqkyLUxMQ?=
 =?iso-8859-1?Q?PaFiFNT/cPYMWndTnRhGt28D/I/5WgwjBmGIgd5fGDWZCAzXnKjwlWlrLU?=
 =?iso-8859-1?Q?TlX/gNYULK7+ywhJBMVy2UMpHaL8IuUQVyq+a+ij3TaYCXNfZlKDPmPZBy?=
 =?iso-8859-1?Q?kOMe77THCoQ1JQ7YgM0HJUWzhhPO9EJSj9lqqRK6BHv7jbK5dbGwioOejg?=
 =?iso-8859-1?Q?Y5RaAytLFn0RcCnFzKBbz1+Od16QkoD6ExPR3ac7b14NTMtmqoGbxHNFVf?=
 =?iso-8859-1?Q?E3DMy/Ef+Uzi/YHtIey7MAARjFAUi0Dz3RJXMZhs35vilWAyKYXq79I5EU?=
 =?iso-8859-1?Q?BPnWIfnCFJnQO3EgutVvDOFyvEieFAJ1jMRs//TyEFh3OGw1mXDIbwV0Wh?=
 =?iso-8859-1?Q?7fR9XX6Zvj6WcFrBd5trvBCtUb9R8EcblYkOxU1e1OUGJa5an+JoCYzEiH?=
 =?iso-8859-1?Q?ugcEoJnoFmPcgvHqHP5JVZNBHRTFHBn0ODgqmeYiSS7w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PtN66u22oHm6UT3v/x3rUSxYGBEVAkVBAeHS7ak+NFvj8wSMGm8VIpjrYV?=
 =?iso-8859-1?Q?Ct80cW/C0i8KtPnoZcBGwP+xE1ZZ5wvmSjb+u8EAmC8NZ2VSGuvYEoNwOI?=
 =?iso-8859-1?Q?kYXXuk7d47fNl8I8Mx6b/Ub37ITlEmNR08I6jWHzK4twFHj87fWYZjSqxo?=
 =?iso-8859-1?Q?RqpcZRBDSBZ86I8Z2K+Achl2OU0jcTTacPdSrX0hEZ5CG2tOyi0rGGJP0/?=
 =?iso-8859-1?Q?2ZMIqFgVlvEp/VDEyV9u9RbK9cMBE0j37Qt4QA/EgyeKALxkr0eJc3QU8b?=
 =?iso-8859-1?Q?MDeqKv2woWJ2nx/zumZJzRU5FeVGcXIUen7osrcmZhh51zQhwF065Quk2r?=
 =?iso-8859-1?Q?hZMrxzUVV6/XRS/j+UVrCdict/VSGDrCyZdR4CPcOfibZXZI4zP6Hj+GqD?=
 =?iso-8859-1?Q?dI/d4cE3Z9nbNaobqtQrCMLL86dDdcEkFloFmtRX5LtvQgYScXOBEc/zRf?=
 =?iso-8859-1?Q?eho9eCrUpUte1uaS7nYHg3vz5zpjcDVYKApHZicRIvMk/xWcNn4HGEtG64?=
 =?iso-8859-1?Q?+piJJdSS9gTm2+dAvgPzyWw5vrLhZReIgyUa1cyzpVZ1JT/E57+wIDAdeS?=
 =?iso-8859-1?Q?uGHKYR80yuEVYd6BzKAFxebBm4JGQgS9IB2TnQ9xunkyvznjvrpJaN4v2o?=
 =?iso-8859-1?Q?xlxgMUszgR+gVn3a0Ad32mcKhRALLppHAeSkcchqfczgCqin8XNs+4isOJ?=
 =?iso-8859-1?Q?kTN2m83/kFDVdAoKSe1AOQlQxiSUBANKo0VshUFqtYl2iFhGyzUJsxRkja?=
 =?iso-8859-1?Q?7HFBV8rPvWJQNV2g4gYHFK2f1FUWkaOqDnaUqbfDzjYXEhXH+P8NtaVpbb?=
 =?iso-8859-1?Q?C2S/L5PY08ricrVawCgmouaVbHKtycRBhvadz0wrgOnEfm6RnZqBoAA28o?=
 =?iso-8859-1?Q?N04yHIR7A0GpcDGrPfK4Epgs02v2/dCMgNOTWvC7D5xLsvAnau6KVsBysT?=
 =?iso-8859-1?Q?NQHBc4OUv+SIWA2jJuAenjvghLgGgSWK5SBWFeH+v7TC9J/F0ZsLix+u/b?=
 =?iso-8859-1?Q?7ILyjA1diWoS7dGkcuCJBHtMrKcOp320i7vf2b2bFRL0qJR0vh4uJhrYv0?=
 =?iso-8859-1?Q?+09Ry+6SFvIThqGDRRi+eDpwkqNY+rwht8spgY3CWNY0mGz9TQ+EhmWjsO?=
 =?iso-8859-1?Q?xbm+xnTeVFfAZr5QgGh0xZBcj8dRABG3J+O4hUr9JhpljSX7Y0NDVxKn8+?=
 =?iso-8859-1?Q?PHD7QaV64YzNJ7LG+aP7hO36HgTFi+WBj2wOGCAOxtQQ4S6QLRSkCtuH0+?=
 =?iso-8859-1?Q?eURxhrr+jUwIyxy7LAklu/IXpbJlMIsVqTMPljSIhIBizK/ItBD3SgNiuM?=
 =?iso-8859-1?Q?lowGcgX4VTzwcGhDXqSuqt0eTJeeUOb0nTohRdzVukQDKjXRm5pMutQBC2?=
 =?iso-8859-1?Q?2AxcDTbCzBXAOuULG+54psb69w4Gr5ufGlbpuIwvYrO9XwnLQ2Yc0/a/kw?=
 =?iso-8859-1?Q?iFmeWBDjBve9W+bWH2+bcvpmr7lDQcSiKttWOB67XtM0ihDE6o9ICRQ3MS?=
 =?iso-8859-1?Q?JqlQ5CyVWmxndlyEQEWAi6BfRZOkActK7ErwN3rj4f00E4BgyeL+rdhUnG?=
 =?iso-8859-1?Q?HuyaSLoqsdCDS5fqkpjT3IiiGPNAeya/hXiMY7MrA9Ko+wT1jck8E7iikD?=
 =?iso-8859-1?Q?ZsfSQqvMI7NMcFQCEpBmcWxFKPTJ8UmJ78g2yB7wz235CTNf5l+Wi5tw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38cb513-f159-4210-2cd3-08ddbd3789f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 09:20:39.1423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yghyHFSw5hkQjTYkLc00yu8FiDCkMoWBmIUwlVcGwAfS2t7zWs3Ma6oQpwD5Jsqr4vJqRL75Sl47S8FadeugrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6305

This series introduces IPMMU handling for PCIe passthrough on ARM. It inclu=
des
changes to pci-designware, pci-host-rcar and ipmmu-vmsa drivers to enable
configuring BDF->OSID->uTLB translation chain needed to pass different PCIe
devices to different domains.

Tested on RCar S4 Spider board.

Mykyta Poturai (2):
  arm/pci: allow designware-based hosts to have private data
  pci/rcar: implement OSID configuration for Renesas RCar Gen4 PCIe host

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID support

 xen/arch/arm/pci/pci-designware.c        |  12 ++
 xen/arch/arm/pci/pci-designware.h        |   4 +
 xen/arch/arm/pci/pci-host-rcar4.c        | 148 +++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-rcar4.h        |  18 +++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 141 +++++++++++++++++++--
 5 files changed, 315 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.h

--=20
2.34.1

