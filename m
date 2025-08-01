Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3AEB17F2E
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 11:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067003.1431983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyV-0006Zy-RT; Fri, 01 Aug 2025 09:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067003.1431983; Fri, 01 Aug 2025 09:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyV-0006YU-N9; Fri, 01 Aug 2025 09:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1067003;
 Fri, 01 Aug 2025 09:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0QZ=2N=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uhlyU-0006Wd-CT
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 09:22:50 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16fe0891-6eb9-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 11:22:48 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI1PR03MB10032.eurprd03.prod.outlook.com
 (2603:10a6:800:1c7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 09:22:43 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8964.023; Fri, 1 Aug 2025
 09:22:43 +0000
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
X-Inumbo-ID: 16fe0891-6eb9-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKoIukvHor2GWksWgFDwCcUdFSXFjLTkTyy179S/xnefcXs4n2ZoYKTL/wN9rXgQXQgqwq8yh0sN1xlfoyjucysrhhQIZT3qO38OC9EQOGVzSuTsjn3ir9rMv/j+ok9YnvBdVwpt74sveeGd7Y+ucPrwy4YwMzQNkDA526eq3zC77SLaEaCXmLbZwxp8qN72iojVySxln7GClbPk1XJbA/bIWyr3x8wi4p3OqXNt+6f0cWfm7aLIh4Fz9+6VJ7qZpjLJHm2Lsz2kMNgSEpeD5NALP1P2nq5peHpaT2esikx8jiu/CIN5TpdIzeUk50hXmDsKAOSFsjBEivGzIZGnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BanVMEjZRx8aOaNUyzbBjnmHksdpZUi3wpwgwjwI8Ts=;
 b=wwR6194Yxmg39KPd89kVWLI22g7UqtDOUzmEBjO+qYDIKb2brcbcQD27fvqM4mgNrmPE9eXdhNPA+tS56UCyEfZOi8Txn2XO2p1NotSDWRCvGVZ2L2hFx7UKipqzkeOoACGzwD/W2jz54S85bQ4bZDifVk9/8eFeCA1qoh5XTpeOi1RaQu1hCJyVeRNY9ZQJYFpFZPL/l9INBnoLndG334I6UPqgztjuoKnLMHuETmsHVi6P9Rgtw5j+Q456FN0szZDLq++EWt0bkE/mZw6a7QroJsxWmjDZUdrcaaOXRMiw03QaFqN09M/Wae5roE3UWLPGNEYKJdKq+YpctllPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BanVMEjZRx8aOaNUyzbBjnmHksdpZUi3wpwgwjwI8Ts=;
 b=azufd/HJo99V295DXIK/Or3Ol7rOJ4WSRXK5eUnlu85or00B7gfkGclmSmRgnhWTPY5ASoeALfT0pWNwmRoZbooMuWzCzN0q1w/lo/VrsPQw7SI9bzDzfJkBkLqT11fEY2mUzNtnap0gpv+xpd+WKnr784wmAE8ptvi2T+SVcL8XwmJ9Ub273LjELMUgiBlQHyu+avs/TQoB7uQJc79Mm9lhGAedpapcWRY8dVZuo5uXtnxVs+cxZNyGyno+pel3R7N6aoXMZySfNwJESvmOb2f8Ytyp1j+QpRPj4FqGolEtA9WF5NwmVzmDC+KKISgcxp9C0mKj7B4GpCTwB1hf3g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Edward Pickup <Edward.Pickup@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>, Mykyta
 Poturai <Mykyta_Poturai@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v1 1/3] arm/pci: Add pci-scan boot argument
Thread-Topic: [PATCH v1 1/3] arm/pci: Add pci-scan boot argument
Thread-Index: AQHcAsXViqFNiGIadUqVpLIjHx6cnw==
Date: Fri, 1 Aug 2025 09:22:42 +0000
Message-ID:
 <98c8889e07d6c82067309d8458e15dd52145b467.1753968306.git.mykyta_poturai@epam.com>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753968306.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI1PR03MB10032:EE_
x-ms-office365-filtering-correlation-id: a3558229-a14a-40ba-93ba-08ddd0dcf80c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vkjDhpB8nkXoFKeTwgSg/GqQE45tNaUw7yLgQGYurPMiJFAaenlA35j4wn?=
 =?iso-8859-1?Q?XYUXRU7lq1nHoY3mApFBt4RlkbvoMN6x/ZzRqrIKLGMg7RjWeI94ZcMbQY?=
 =?iso-8859-1?Q?xnblMjUI7yZlnstsDvvz+f33ufZLd9TCnxiBJhuue9NMZYVrr0ms8EFRkq?=
 =?iso-8859-1?Q?rgBWEBKFmusLP5XF0KG5unt9N8dwKX4dWGgQvAxBIpcEkyGwEw2OEXt45a?=
 =?iso-8859-1?Q?BGnTwUH+9WySncpc4/VDN7ABkBezUoasTjtZH76SbOud4r1cd1TxRup/Dg?=
 =?iso-8859-1?Q?0Qr+VzfkaAvrZTnKLvtyI3aeYPOfCbQUrok2snYGYMzEKwAp7W4oCh5AmR?=
 =?iso-8859-1?Q?sRjIBzHNzWVBQh9CHmj0BjtMlk0GH+0f2DOVzmuUq/HFgB+KywbCGHSUDU?=
 =?iso-8859-1?Q?Pe91QvC6SacIU2qU7HG4FXaepqIz2FjN1oKbg6MvX0H94hTjrIEqzonsS7?=
 =?iso-8859-1?Q?vbYeYMCfnJK9dnuoOyxKnmWB9EQQ361e1rzY7bqm4KZkQKPSeQJ0uhIfCC?=
 =?iso-8859-1?Q?XbpkjTLicvR8CkqnkrrH4q898i/wbF4Id2GTieY8lPhnZs39yXv7nB52UP?=
 =?iso-8859-1?Q?sZfFremX7ceUr8OjpfW/hgeOvDGK5cg0mue1PusgGAN1f/IUHET+D3XU03?=
 =?iso-8859-1?Q?zrh/NWz8NHLMGMiZbiAxcqQuGutlChsjtVjvjT5cxwu1i2StjzQ+ezzu+r?=
 =?iso-8859-1?Q?RWcNaOt3wMUIxTbAjW4ZPkXMHjrj8ul43yf9R8gL4B5cAz4R2yCHQuXWI4?=
 =?iso-8859-1?Q?AWd6ATbmtO8H28mE6Dz3kpI8xhTHS4BdRQMesURFRb+CZn9ngP/C51pEiF?=
 =?iso-8859-1?Q?vM0pzOWAH71ufmZSiXxK/qPbhEq6k+8Sc+qAoUKoEIckfn4sQPYPaaWYH9?=
 =?iso-8859-1?Q?DbiacnQiDcZ2jfF+c59tFPMmHqM+sPisr7z9gckcV/JCSNlZeu6fEVbRPA?=
 =?iso-8859-1?Q?nZeXLbcreqVwWr3ZCXFROxf8RmcSfVVW8GnLvHev6bUZTl0y47HHgPnPa6?=
 =?iso-8859-1?Q?Er4TPctnEuhu1TyTHU54BZpRoXJHMSgwgKmsQw61jT9ek53eoIzXvgaClZ?=
 =?iso-8859-1?Q?EhTL/wJ5agdemMxsZ1t+c2tdIAkrRgwoLTexubhClZarK1h/Fxjcn91FDX?=
 =?iso-8859-1?Q?MAq4X+bSjIAKyyPS1KbMjrhDfLDI8JtG+sWHU8GOlFJqQaSCHudXSe+NUj?=
 =?iso-8859-1?Q?YRplQpac18o9/HxsNsOZ+QjxT0cxhQR5BaPMTMuS32JrSrooWzmtBt23Vn?=
 =?iso-8859-1?Q?GVKEKRTHaItG+mJ0sbVre6o0tBw1lQcUai4KEcip+IrIUwpx6i7OtCmq8F?=
 =?iso-8859-1?Q?6yj+R3f9ItBDu4JjWk2lt7evCR8tAQW+6wEhEsJ8DSrnwQy5wJhn3qJ01R?=
 =?iso-8859-1?Q?XEPJv4JLQ4VLUA+PO0Azi3LavpKDLwQCZm+HCiyB1NqhTXa5hhY2hHbN4m?=
 =?iso-8859-1?Q?HkMXO5kfL9i1TvOk71Cy3bI6kvW5Th/QmVUYr9H0aP+kVlNoMaA3Gezey3?=
 =?iso-8859-1?Q?MvHaG0egNeGGDITDaCYernlilLIwisNQpNAzSrC9831UYRyrSNGouYEA5l?=
 =?iso-8859-1?Q?/72JuoI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5khTiqiQ9MCdb6XB1n34rWYi5ssjJfiufwXOJ79ZB7P3CkBmNcH2j19lac?=
 =?iso-8859-1?Q?uN4AATenip6mCjXnpVF761YPOAdvyDprnk/Tb79QMqRa2ui6yp89WiG3TD?=
 =?iso-8859-1?Q?+icn0znMsgZStG2iQVDKXl18vpthlbAwy2xpkZd1bKnqAzG4oOsOJiq807?=
 =?iso-8859-1?Q?NipG3TAz5BDIWiIoBL1LJjiGwJQUA+EElXIpZnh1wj0CUtmQSDMxcjYeqa?=
 =?iso-8859-1?Q?i3kU7ggj24bYQ3XwcLLgcY8g+uf70+x+uWklwb1+Pe9nFQUHisLzYm+uKD?=
 =?iso-8859-1?Q?WImfTC8PBFMZVUTyD+FvuSUSmK+1NIgi+HU4sODZWRcHleLdBC24Gyp0i9?=
 =?iso-8859-1?Q?jpeGpQvQBS18WuN0zgyHW3BwRVaVTMqCWznQXqm8Ppdjg2CsIwxtXLCJJ9?=
 =?iso-8859-1?Q?y1Gv6lM6fXLwO4kWflGfKKJvdYiPt5Iar3Bgsm6nq/9X92nd8GO8ASFNEs?=
 =?iso-8859-1?Q?QHhCgYN9gnyFXK24azaUEbRslXnFJ9iaKEsQpMqfbeNcHiRr8B98HeDTNS?=
 =?iso-8859-1?Q?8gn4uqLoMdGaVWSBrqmEd0sfdWJoTLzrdzw5Qu5/bBlj7oI97UX5vPxAR3?=
 =?iso-8859-1?Q?L863e3GNmvoNskzXoQwgQQTTtklwYXTx2NVY5iv9HMGSYX2sfknc+QUkFG?=
 =?iso-8859-1?Q?Y+eR06R9Vw4Kb/Oiz8eHdZymYMBzqESuOgBHOJ6Wf7LJqBTIQ14x0etOEN?=
 =?iso-8859-1?Q?W5FBC2erb6jx6rUKYv8L5A3PH7K1OU4ImzY+zQ54MkBsf7yeaHN5TW9plu?=
 =?iso-8859-1?Q?gcuI0/GvDcPpufBG3BzjGrfAjKKzW5N4aCQ0xmumlJL1gcHVmulnVFrOZb?=
 =?iso-8859-1?Q?XcrnyO8dXBoG/NGZLa0IXAry8fY8FxziADRIpxDVRvHYd4AlMBxAeTPTIu?=
 =?iso-8859-1?Q?db3yejgQ+y1fSVZgEgmVaFHwWh7ruLMJuBX/ki+ZEzWBQEtU/4/S73uacV?=
 =?iso-8859-1?Q?U1BObNTrsp31HAor3gkd7FFHXt//xx1igD+ieuSIiMztzFfyvLbmVMfvUe?=
 =?iso-8859-1?Q?PrS8VBnWSedLj1lnHAAjkZBr8dv3G0BbpTtlpPXPJbiKnTITnIEkYt9QOi?=
 =?iso-8859-1?Q?B3SPpALvFb70+Ai39ID4iAO64a67V4E0EJ4RdyjXV1O7O8HnM56hZ8nkiH?=
 =?iso-8859-1?Q?8GycIzkoIaNwW08Ga0f7k1svFcVyoQ6ZAjIh+VvYo8kN4CpZ7k4LmN5n2Y?=
 =?iso-8859-1?Q?jZoKw3mUXCsNEntz/qQrb2DJ0Q6kT+nSWACUDMakN08lcXhOYiqTCjkGLv?=
 =?iso-8859-1?Q?OR2KWd9mWwuUEdHqbBNJ0LUj3PXL8VPe9Y279OWM77tmrMAiqLwQ5gV89l?=
 =?iso-8859-1?Q?XP+8fmW1P60QEZwNkQ6qAd64Ae9sJhEVTqn70zqfWamZnHrr98NS31Fci3?=
 =?iso-8859-1?Q?KrcZwhmTGPSZFRBsZx4oBN2uTV1cT4qz1rK5zsAw4iNfoWq4vNMn8/EADJ?=
 =?iso-8859-1?Q?Ty0Ykr4XnCiEfQW659DG4P2aB/zm0bJzWbAJzQ0MhJ0WXzZc+Zt+3uTSkw?=
 =?iso-8859-1?Q?pWaeWFeUIca9iFWMwhpkEeCOU5u/9oH6ISK0RajMsFaYgdTFCxI+4uV/3C?=
 =?iso-8859-1?Q?OU+k8mV9VicW/1+rcO+/NMlSBTzsTY0a0pHg3fADKidfs69bALE5ZyI44d?=
 =?iso-8859-1?Q?oQVIePgBmQU7C6I8Ls+3KH7yB62F3C6zaODxnXnqhPmJhGQC8yNGEO3w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3558229-a14a-40ba-93ba-08ddd0dcf80c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 09:22:42.7687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tlqLzpDlpN8ckIrqlWBS98Uuij3EKWnilJDXBtf6vzIDlnesUt33hDHqoPvkSPbN7SzLMmgBkgoJnnSbKyp1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10032

From: Edward Pickup <Edward.Pickup@arm.com>

This patch adds a Xen boot arguments that, if enabled, causes a call to
existing code to scan pci devices enumerated by the firmware.

This patch also makes an existing debug function viewable outside its
translation unit, and uses this to dump the PCI devices found.
The debug message is controlled by config DEBUG.

Additionally, this patch modifies segment loading to ensure that PCI
devices on other segments are properly found.

This will be needed ahead of dom0less support for pci passthrough on
arm.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Edward Pickup <Edward.Pickup@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
(cherry picked from commit bce463e1588a45e1bfdf59fc0d5f88b16604e439 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)

changes since cherry-pick:
* s/always_inline/inline/
* replace additional kconfig option with config DEBUG

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 docs/misc/xen-command-line.pandoc  |  7 +++++++
 xen/arch/arm/include/asm/pci.h     | 11 +++++++++++
 xen/arch/arm/pci/pci-host-common.c |  1 +
 xen/arch/arm/pci/pci.c             | 26 ++++++++++++++++++++++++--
 xen/drivers/passthrough/pci.c      |  2 +-
 xen/include/xen/pci.h              |  1 +
 6 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 6865a61220..72c122ea32 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2058,6 +2058,13 @@ This option can be specified more than once (up to 8=
 times at present).
=20
 Flag to enable or disable support for PCI passthrough
=20
+### pci-scan (arm)
+> `=3D <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable Xen PCI scan at boot.
+
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
=20
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 08ffcd4438..0afdc90de0 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -23,6 +23,7 @@
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
=20
 extern bool pci_passthrough_enabled;
+extern bool pci_scan_enabled;
=20
 struct rangeset;
=20
@@ -128,6 +129,11 @@ static always_inline bool is_pci_passthrough_enabled(v=
oid)
     return pci_passthrough_enabled;
 }
=20
+static inline bool is_pci_scan_enabled(void)
+{
+    return pci_scan_enabled;
+}
+
 void arch_pci_init_pdev(struct pci_dev *pdev);
=20
 int pci_get_new_domain_nr(void);
@@ -155,6 +161,11 @@ bool arch_pci_device_physdevop(void);
=20
 #else   /*!CONFIG_HAS_PCI*/
=20
+static inline bool is_pci_scan_enabled(void)
+{
+    return false;
+}
+
 struct pci_dev;
=20
 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host=
-common.c
index 487c545f3a..d3481b05eb 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -284,6 +284,7 @@ pci_host_common_probe(struct dt_device_node *dev,
     }
=20
     pci_add_host_bridge(bridge);
+    pci_add_segment(bridge->segment);
=20
     return bridge;
=20
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index beb1f971fa..eea264db0e 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -91,8 +91,13 @@ bool arch_pci_device_physdevop(void)
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
=20
+/* By default pci scan is disabled. */
+bool __read_mostly pci_scan_enabled;
+boolean_param("pci-scan", pci_scan_enabled);
+
 static int __init pci_init(void)
 {
+    int ret;
     /*
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
@@ -104,9 +109,26 @@ static int __init pci_init(void)
         panic("Could not initialize PCI segment 0\n");
=20
     if ( acpi_disabled )
-        return dt_pci_init();
+        ret =3D dt_pci_init();
     else
-        return acpi_pci_init();
+        ret =3D acpi_pci_init();
+
+    if ( ret < 0 )
+        return ret;
+
+    if ( is_pci_scan_enabled() )
+    {
+        ret =3D scan_pci_devices();
+
+        if ( ret < 0 )
+            return ret;
+
+#ifdef DEBUG
+        dump_pci_devices('c');
+#endif
+    }
+
+    return 0;
 }
 __initcall(pci_init);
=20
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..fa03dafac7 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1384,7 +1384,7 @@ static int cf_check _dump_pci_devices(struct pci_seg =
*pseg, void *arg)
     return 0;
 }
=20
-static void cf_check dump_pci_devices(unsigned char ch)
+void cf_check dump_pci_devices(unsigned char ch)
 {
     printk("=3D=3D=3D=3D PCI devices =3D=3D=3D=3D\n");
     pcidevs_lock();
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 130c2a8c1a..5c242278b9 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -217,6 +217,7 @@ static always_inline bool pcidevs_trylock(void)
 bool pci_known_segment(u16 seg);
 bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
 int scan_pci_devices(void);
+void dump_pci_devices(unsigned char ch);
 enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
=20
--=20
2.34.1

