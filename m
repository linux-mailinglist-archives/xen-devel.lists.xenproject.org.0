Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F4B4A999
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116138.1462561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHg-0001qb-BI; Tue, 09 Sep 2025 10:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116138.1462561; Tue, 09 Sep 2025 10:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvHg-0001mT-7B; Tue, 09 Sep 2025 10:09:08 +0000
Received: by outflank-mailman (input) for mailman id 1116138;
 Tue, 09 Sep 2025 10:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvHe-0001My-T7
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:06 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04c357ab-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:06 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:08:59 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:08:59 +0000
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
X-Inumbo-ID: 04c357ab-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1upfLNI3NhaKvMGgTF98nX55TQGyHkLX7rI0dXOEY7xuY8znvbB/8zrG6Zprc8+Oi+pFnoqtN2cc/n7vqmEGwnDvILR24DjIj1NZ8UTEx9NYmehCfv9Zai4S4m5XRmkxBFnBioU/mHKoOjNI10Xt0BeB23I9NSKh1nt3Q+L03pBV5bPcXOJDCG6NBeQ9TVs+IplCadJdvr71GqNb4t+6+K77OzywSE9Dp/1Be/PrDT3V4U4KqqmkPjNncTsLxn81AacsqVdisg5vyimMKtZL8ZolIvs1fd3hIwn6S7bwL7BJMFxNtQDII/jYPRsJZvakkCszk+NyVp2cDg5tv5PuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+cNpr8L6MC8jcvfDetjjAbGfgyiOuFSGmAfyQYgrRk=;
 b=xg8ep6huOTTUnV+5546fLZJaAs9e7Pct5hbHAK5eb4N4dXgRIucQ4g+C4k229tg0ywegQhK0T6lDJ6O7I8nYwQxWV/hGZ5ks08orC72kxZsyZ/FZza630ZnfHFFDlJNgG7BEv0k8UGGfuUosmML3ZgRVA2pwWBZqcCkKcSO7euWUn21i1jBv9//1bRlyrzFGHxxo7moqstu3/sSDVayiB0yIi6XT6VtRfKQcDDEiucsuid4ZaPk77+u7HGdTwTebxfeaQjDok8tGWtm9Tbeq/3rPpPwqLdtiIpIDelfbI0AHiUXupe38JKHYYzpTCbNpspIce8Yo7ArFuJwdaEMbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+cNpr8L6MC8jcvfDetjjAbGfgyiOuFSGmAfyQYgrRk=;
 b=nRzjHsthRS198CRKZCYlMUyEnaqRaroW5LcciP6wQKaoDCQ6IjLgPJGCzeJ4QV452hRF12GnMcvuWreROfOM1HkRT3KLIRnW2/fXvOcAceKrRDXZW2UAWHR14gXTB8G6XX//JTjFZwCBKvFTtDvklNk+YMh+fS1+gVjgZjwXB48m7MAgURLj7ebO0ujqxN2XHvd0BngBCLcxviJapmV7uLbW9t3ih4KuSU9f7pLphuPQLT6a2Yo2+ALCnbYYhxLALYJkEiMuYc/sk40fTaxTXfZ4uajg5rJPycQmFTat9alp8ujbsX/69IJLFvv/vQkPR/4vDpwQdD0dRWHWE9pvzw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 02/12] xen/arm: gic: implement helper functions for INTID
 checks
Thread-Topic: [PATCH v8 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcIXHC+ua0MD6H9EigKiS7S0iu2A==
Date: Tue, 9 Sep 2025 10:08:59 +0000
Message-ID:
 <453217b044f35378076eff292ffb5a2ba54f516f.1757412099.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: a5b05688-4e93-4661-2183-08ddef88e4fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9Pwkb5ku9GkwtrkUwaQlSYCcq3KU5WTgLTAbc/SGwA95NyKvFsLnCB5TVq?=
 =?iso-8859-1?Q?QEqsnbCTFwn9pkb8F2khFJRYpapRkDLir7nj88wg+dVxJ4rL2COLhhjw9P?=
 =?iso-8859-1?Q?YgnLABEEffJeliAB73hV62YkkZgwYKcjb+4vTEo7AcQFBERZtWHs+eI9Ry?=
 =?iso-8859-1?Q?JuZfHhuylGBjobZWoaTNr/IvQLOBnAHosGjQzdydFxdNMMrdYaeTT38q+V?=
 =?iso-8859-1?Q?iJ7FoRDlMWdxO6NJ1UkhEqOwucAMmGaaS6BP5uAX8LTjlOTzvDyVeh/vBw?=
 =?iso-8859-1?Q?LyPbaFmuwKHQusdYVEjzpia6gWEGt0VXqoVJM5STtk7V275vWvgGXn08lL?=
 =?iso-8859-1?Q?IJx4ANacUgrMdEJM7tPIfvOOLSrZlAHCWFP4reVPh67R1fK2dvrzjzPI05?=
 =?iso-8859-1?Q?tga2Pg7cCHTtDBVclcsVwgqMGYDqDOH8ZQ4RaqZ33oAMuiVImhRHnkPgds?=
 =?iso-8859-1?Q?8Gdaqkv894hOrRmiZ8O7XEMM7U5NckqZzsgYfXeXfApRQ3xLxJTq9+rVCA?=
 =?iso-8859-1?Q?eefRzvtTgJX0d7cv8iynp2137IZBnDC6w1iZIQxoYF4qGxtRhuPT2o0WZ+?=
 =?iso-8859-1?Q?kEPGNFesPW3aTUz+mzNW/iWeMI04jwYXAzO+qQO16qYFd45cv77tCqfJa0?=
 =?iso-8859-1?Q?r9IOxEpECi9d4SfyP1h86l+LcOa0CT+uyA4O6KORY9FkxUBvs5kKuuuKtp?=
 =?iso-8859-1?Q?HQp+diLDwXJK1/WWSBqVU9nrPGunTA2eKh2jP8D2imlOjh+XLf7GtmeWy9?=
 =?iso-8859-1?Q?ZalrW8zbLk52teSpH0MuL9eLD0KLZElVubEiwaCiQpIgfPm2Ski+NmEHTa?=
 =?iso-8859-1?Q?dwMqMHOypIRu0qDCdoYf3Wn7ue7+GMNm8xcvFiJlv31wazUrECWwR34sOt?=
 =?iso-8859-1?Q?EaT5sqfISZD77mug0R1LnZvee+vdT0c3jqC7GSX/NE9mQPQnzMN4lWLdq2?=
 =?iso-8859-1?Q?NeqRD3ohz1xTAcklwQNpuMo4py57Pn831Zy2q00rAfDi7Pbo7AAX12FaKQ?=
 =?iso-8859-1?Q?xLabCDu9dRCaYWcKPVMrCMup5Zqlcz9Uj7EBV5IiE9siA0hhZzjNo7cnGZ?=
 =?iso-8859-1?Q?gT49cfJRW/2EtNI/4J+Mz6/Lul9YgEC3n6f8MzA5zmMjV5ESevG+6LrYZS?=
 =?iso-8859-1?Q?D3YWEezC98N3GhplmjTfvfbQTwczNtJ5sGWfdZlyiinxQzKCxXbjJNwLFF?=
 =?iso-8859-1?Q?XtV44chtQP2/K7pDLnXIvmVQGO3sn+3iCwdZZeodwaIKJbKnIcphm3ur3P?=
 =?iso-8859-1?Q?ugaf3WdXK1qnzWqg5GkpcxMwB9rmHlqeZYBgVsHEMnspWPhCS7RLyTkFi+?=
 =?iso-8859-1?Q?t3O2FDxiq4K3iBiQHdSkSTS5mI0T2OHsiibwlxQ4KZP6bnhpswLvtFzdGB?=
 =?iso-8859-1?Q?z/o5aZzO4ky3rzTfAh2V8ci4uFzNNEgD0ZiLpIZqg8pr+lP/Cp66A8CaA+?=
 =?iso-8859-1?Q?dFsgmzai1+WEXSLV9TReT5FPzPr1ECkImlzEkIrwqeW4YpVSd0L5Y/4HJN?=
 =?iso-8859-1?Q?30TfnBGHWcv6T38QSC0ePIPeyrYjtIKTEQvE6h222jIKXnPL8iRUT5raZ6?=
 =?iso-8859-1?Q?JUmuQnU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?EjBLxemdkagfrHS5qDMY78NTPckw76JIueZLA6zU0nK/HDbTa8FEu6WHdc?=
 =?iso-8859-1?Q?xHpapCPxpFZ8eH8kORRbO+86t777nLRceIyhmGYd1HTFOhNhiw5CH7qyKb?=
 =?iso-8859-1?Q?WB4//VMueOmK5JZhBtX2cZ/9UnXjeiZkPwTd67E1HXqHnNa8CtdXgPaLk0?=
 =?iso-8859-1?Q?sHlW76h7wkcTXSo8Z/W/YORo63ab2qh0cI5zjvuy3T/Ekq4d3aJdfdkfjn?=
 =?iso-8859-1?Q?VN4e/7Jg4zJEKhBHltykkfDxU4mr4u/auDuDzSwaR22iCBmf/FJXfbXcb4?=
 =?iso-8859-1?Q?GWOYYVMrhpfdhcEGuoJBfl0Z3jH6b0/KUQ9rMtbqj10zOokGng8CAKQjbz?=
 =?iso-8859-1?Q?A11+yGPWdi3Nz4eU7wPuQwDJG1lLP6Vj0a698vH9c3u1tPjvcWp6I4VP1g?=
 =?iso-8859-1?Q?sbUQG4Fq3M19kINsbWLBZiU/1yZQx9h557FCO3Y6VdsMfWwO3z8fyMLwIy?=
 =?iso-8859-1?Q?QDa+PEJjOlA4wrjkqob7CJXdmWaarHEYmNkfwn8wDX+rHzU07mPPNlZdim?=
 =?iso-8859-1?Q?LsBVwLoCH3TkcZ3L7hqpn9nKlAJMVp8iLQ33Z6k40fB95Q1853oo47tTPt?=
 =?iso-8859-1?Q?4a2uAeD4NGODdxr3PW/94slYoVyfY2nLXDjgrnz1zjNyfY1tbKZMhFFkml?=
 =?iso-8859-1?Q?7uO4PNdaRAG7GSxSpLEC/M8RkJARWg85uizuiIgcZLpBmEn3AqyO8/cqjV?=
 =?iso-8859-1?Q?WQXtha8ZU4q2CgmKSRs9zHs1hJQNW2awf1EcpN4S3k7Z81icY84iDj30+s?=
 =?iso-8859-1?Q?fX53MLvu3ZxbXxRkoJsX1lBkhFDC/IIZPX4M3PFdkT4xiyX2po/7hbjvmn?=
 =?iso-8859-1?Q?Iwmkj6ZUz7I/u7GXJUtAxDwrVt/0NgmGDFFNM3X2N6j9aQvJfRfqFV97x6?=
 =?iso-8859-1?Q?ESb/BI7timxilcpW9eY8w7uFbOIR6d81CLNiSUpyHwQUo7r3E7Z6IVjzR3?=
 =?iso-8859-1?Q?vmtyPvxiMg5YT8JqyC4EKlVXAoHERuIXLYPVE4sbmibhMjqX1YqfW5EQBi?=
 =?iso-8859-1?Q?2/WFTcLay9Y5jPi+VYA1bwv1IsH9LF+2Ztw9Vyd5lslW5Bi4Spyro1eFdg?=
 =?iso-8859-1?Q?2PN34XWhx356ugL/Vgf0CYr1yK5U9bV+Fksiq+8oSXh5cbclf5FOiGCTEJ?=
 =?iso-8859-1?Q?1UjzGcgcAzFxtpj39t95nmavQoT1M5rzerTTHrf5E0yhBQONyWCaph5Dgu?=
 =?iso-8859-1?Q?RHnp1Eyg+fya9u448A1AacsRr+ADceMKyuYAsTB9NPCOerIcqymvg82euk?=
 =?iso-8859-1?Q?MvvoVtvfAhxIN2q5evmsHnfHeRiVIuEhOuOm8EGYzorTG9/iv1HvRt24xS?=
 =?iso-8859-1?Q?gzGgttVVjPrar39VT0cLSb1FAg31OIOVHp7VobLUMAhHwztmwFxR5/Pqn/?=
 =?iso-8859-1?Q?YLKRDwcB3UG1CRG7p+kApFF+sCYo20bfgUemM+VffXZuVGttqHPMX9XjfS?=
 =?iso-8859-1?Q?yCSEm+iaL+uFX4RqH3fqLOvnvuQ62JahiNFF2HhvqH8/pH537rmSNa8E6q?=
 =?iso-8859-1?Q?9rGIytc3gdIKqX82/j6uzkq0EWqHaNUHm8itY8N9MD0tMGqhCtCmrgX646?=
 =?iso-8859-1?Q?kAagbKc39kG0ezOxSmhGKyWibdBEd1JiD5iLVWkdIz4zNuVLIM//OEG6dg?=
 =?iso-8859-1?Q?2k1YNc/o9Iya8NpsKLhbqe1O+gC7TrPGn+jsB2iPvzDNLbmrkQs8FqicJl?=
 =?iso-8859-1?Q?j6brtWTn7eB0PCIzWXw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b05688-4e93-4661-2183-08ddef88e4fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:08:59.2218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMFjln359MZ02dwHM0BrROTIttngBI9fPm976hndjY/xdqUqOp04dHbJ81vYkQZVyfaZWx75xrf6EJ+hO5dJmHRDq3UP6Z6gf2mCD0ZR3To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

Introduced two new helper functions: gic_is_valid_line and
gic_is_spi. The first function helps determine whether an IRQ
number is less than the number of lines supported by hardware. The
second function additionally checks if the IRQ number falls within the
SPI range. Also, updated the appropriate checks to use these new helper
functions.

The current checks for the real GIC are very similar to those for the
vGIC but serve a different purpose. For GIC-related code, the interrupt
numbers should be validated based on whether the hardware can operate
with such interrupts. On the other hand, for the vGIC, the indexes must
also be verified to ensure they are available for a specific domain. The
first reason for introducing these helper functions is to avoid
potential confusion with vGIC-related checks. The second reason is to
consolidate similar code into separate functions, which can be more
easily extended by additional conditions, e.g., when implementing
extended SPI interrupts.

The changes, which replace open-coded checks with the use of the new
helper functions, do not introduce any functional changes, as the helper
functions follow the current IRQ index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- no changes

Changes in V7:
- no changes

Changes in V6:
- no changes

Changes in V5:
- fixed a minor nit: moved the existing comment to the line above to fix
  formatting that exceeded 80 characters
- added acked-by from Julien Grall

Changes in V4:
- removed redundant parentheses
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
  gic_is_spi
- updated commit message

Changes in V2:
- introduced this patch
---
 xen/arch/arm/gic.c             | 3 ++-
 xen/arch/arm/include/asm/gic.h | 9 +++++++++
 xen/arch/arm/irq.c             | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..4bb11960ee 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,8 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    /* Can't route interrupts that don't exist */
+    ASSERT(gic_is_valid_line(desc->irq));
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..3fcee42675 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+static inline bool gic_is_valid_line(unsigned int irq)
+{
+    return irq < gic_number_lines();
+}
+
+static inline bool gic_is_spi(unsigned int irq)
+{
+    return irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq);
+}
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..7dd5a2a453 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -415,7 +415,7 @@ err:
 bool is_assignable_irq(unsigned int irq)
 {
     /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    return gic_is_spi(irq);
 }
=20
 /*
--=20
2.34.1

