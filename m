Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3881BBDA979
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 18:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142940.1476835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8hhz-0001bG-9B; Tue, 14 Oct 2025 16:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142940.1476835; Tue, 14 Oct 2025 16:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8hhz-0001YU-64; Tue, 14 Oct 2025 16:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1142940;
 Tue, 14 Oct 2025 16:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MYj7=4X=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1v8hhx-0001YO-Hz
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 16:17:05 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 367f0c42-a919-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 18:17:00 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM7PR03MB6481.eurprd03.prod.outlook.com (2603:10a6:20b:1c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 16:16:57 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 16:16:57 +0000
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
X-Inumbo-ID: 367f0c42-a919-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0ZBQQp0UDUETDFvGn7FXhLjxQvglCvRN9hWWul1h9aZ9GKEldOZDM2dYJ3IH4r7aP7u4vdAFfEROH6OQqetHVT1kbiNznEbQaWNc6W6Pq54W1II3jmA9fq5eOYh8d2JPgMKw+Uycm1weUZOeKZYp6zSlezwhTP3ddqwP7kqsSW8SENdOcSpYTHnyWP3R5led6Q3WbD0JUknu86rKjuzcFk0CuSI3zlORuBEYxXU+IP+NIhdpirXWZQ6ZsLeM+L1lGvY/upzx5vugvQ00IXMJiR8iCBw+r2A0wH3iYi2wN6cikbMDgOligCA4gbwEDcg0p/uctf8AkCzMb8Gf6PTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZuuBIGRZzc4yFBjQ6QLxpsvLWHqTM0ma5IeSuREYUA=;
 b=QHAJFbrBkJab+UliWAJWYv9m3v66OWZIj/Riy8mIJezdWhJEqv3ZMAFL5WNQJkn/hUELGjSCfLsWCK+923gQO2r3/WwXtyeV9RBAnJRtfGRnvrq99b4WureDfQomFRvvTKpAYKTRdo5FidNYwvcivSr4slrvAY2gnPAPusSAzoq7gEppT37kozlNfnQcQYsM/KNpTww+ScrJV9GPwLd+LxmhQRA1LH3v0FER8jYALLr5KiactR5TimCG93/SEgJjGw07QqBIbRYmyjPpWhyxMx4kMSBdRmGq0T67A9xw3manJSt+SnPaoam5YugF9pFiGEF2+ETm143kDu8kkmb2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZuuBIGRZzc4yFBjQ6QLxpsvLWHqTM0ma5IeSuREYUA=;
 b=YgysN/21LJDDe87bsuAHJKLR+YoiiQs5NoeRke11+ZBGcMoqTtdq5LCRrXmJEo38mB8Baslcuz9Mjtl68sxw+V4F/U5V4kyaqHUq8QdyrJa3yOkcgowVeq7aF8hT4GK946bThlSk0Vk4AIVbRQcsCuOzFb2B668i2K29HJqCKqIakbnUHZ/DjT5k+BiGS+sjsZlJh8jyiPoFjFJx2yH/LfhWLP33wggwyHmlPmvB+Lj+kDwOc7hrp+EbQNZd7dLXhbeKT+ddmdvk6zbbXoqEEpYlI7NfTFLz5Wf1NyaA2NrH3dpxtdC77OAjXgCwl10kufOn/VpaEfu7vOFWYBkcVg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3] misra: consider conversion from UL or (void*) to function
 pointer as safe
Thread-Topic: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcPSX2fWa1eZv9x0mRzqs7fz2kjg==
Date: Tue, 14 Oct 2025 16:16:57 +0000
Message-ID:
 <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM7PR03MB6481:EE_
x-ms-office365-filtering-correlation-id: fdfe72b5-401d-40d6-987f-08de0b3d18e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jxgF3OI4+DJcqQZJDiU97PeBPWJwt0JmNowjOuHgJ2rhm6YM8y0XBzLFEe?=
 =?iso-8859-1?Q?tE5AsY/nLeMbTeGQmRiYWcA4q81bgjODOIHjMmcgK0pvTgvJiFok5YSoue?=
 =?iso-8859-1?Q?p3yEZp1Y8GQ8Iq2EA/MJZtfCGlklkERHR+yndYHlvEy74S9a7OkwpZ2u0+?=
 =?iso-8859-1?Q?+P2e0MUU1ubwJxmGa4SpX3XIAzBNdh6IES9g3aiHpf+ggEOkJQszB+kTPL?=
 =?iso-8859-1?Q?DQSeK8ESp9Z0itlMtmRoYPkRkzVmn74e/W7+ZRiQfYyiSRMVhDJ+R5NX01?=
 =?iso-8859-1?Q?fDQiEqLAF5AK+1HcIUPYu3QvxR2nZ8WudZeniB6rk6myBnYZ+vW5nDYU9f?=
 =?iso-8859-1?Q?+Ndl04F5tGD09XunpsKNgMHXN5TvNBi+nMHav0mWnbx1UdBn1euxyouV2k?=
 =?iso-8859-1?Q?bQoKadn6VVMnt0g+h/WaCdAYZVhGksvUpiHZ+rZWQwVP0eek8rLhx86xjX?=
 =?iso-8859-1?Q?6osgSbK5X77VjaLECxQJR7EEOzCTbR3YYFwKLJfwN/ge9su9NHfqEhVnYQ?=
 =?iso-8859-1?Q?Jmdv1WKG8C++ICktK5JfitYwyQ4D4ymdDeRWz0WaVudaStsHTZ608FsPeR?=
 =?iso-8859-1?Q?PamxnJ4qIl+MvvlLF739FdeYy3Tc7tjFoXsP0pCRjpOftZ5iLJppbCn/XU?=
 =?iso-8859-1?Q?vsTZBr7Oq7UxMK+oqGm3TMvP8V7wLojLXex6/My1keXiy1AVWXJ4uniV1x?=
 =?iso-8859-1?Q?yBYTQHv+NMpSMKmIz7y9oAZTOH7E0yElO5rkQTdcoqSLUMoreqKgBEQg2U?=
 =?iso-8859-1?Q?WcWPQeJEJ1eiGlVgL9boKhLS3j80Ew+sYRfLPqEbJFtWXofwFy8yRKN/lg?=
 =?iso-8859-1?Q?DPzGCeWCb51NeFZAKvQlDfgSA0lC/Qi+OqPfrggSruYGPsTikJeRtvT3Ng?=
 =?iso-8859-1?Q?O0LtH5AkbCCGjlwlkoxv8hN15NdC77KvFZMLyYiVikWr9hfafqCGAGy0HL?=
 =?iso-8859-1?Q?G7foBQZHfNPoDVfKcXklpALc3n6J+6KKdTm/7XhftO2utDrI/IOW7SL2/D?=
 =?iso-8859-1?Q?TQtifB1LYflJ/SSTVCaUc2rKENLIJOMw33tXB5mzUnCZ+1E23pH7VI7Y/T?=
 =?iso-8859-1?Q?k6Z5GTmXSumB93Nd827JFwO3XwtDSGlgTCr4wltO3GmyOdFb4B5PCAuQND?=
 =?iso-8859-1?Q?PLxq3LyfNHiELVId+ei+kOpyh7rA6WicMzrXQYQUTDeMOvoQO0K8YrSyWI?=
 =?iso-8859-1?Q?121Tfk/mQlU/vDY2DGAFxMuDwdq/W9K5cR/SAUZ32VMyk1KAlwQ9jDyyie?=
 =?iso-8859-1?Q?25eP/3Egy5a+3VQwpfODvm2/AQXbSUK7phyLC70zZW89pRuzrZxEw89lQ6?=
 =?iso-8859-1?Q?X6K56aOejE4N9sJmbKiMsOyKCTVvBNELdIfV/Da1CzQYTb2b0Qz6dc3CV2?=
 =?iso-8859-1?Q?t0PKk618rzdZPyM1nwrfddrRZQAj3Hzv2poK3Yq9698kMgiZIUQhkMAEKq?=
 =?iso-8859-1?Q?wO+7136XHndDB/n7KB9sx0hsBESIX1Ir0JxcIrha1xYHSlIXaSRhcioi17?=
 =?iso-8859-1?Q?B9kws05Hq5bBJeETamwdnxoPN9sIThGXqFqnr42Wh5jQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?blPFPJW046p9iPRidDQf4dauj4cQR7OEw5KMuOJEQ1+FR4Vflwk7bbKbmR?=
 =?iso-8859-1?Q?jrP8Jobe+tEWpz4pi77bMZx9l84Y0vWLw/rci+OrhwdKhxjEyQYkHcVhZ6?=
 =?iso-8859-1?Q?PzRb2B0xbeI9tGS0+2/Nb5hLbY3zL6whXv0yb0RnGr/ri3WQNiZrZB8WGQ?=
 =?iso-8859-1?Q?KRrPXQxG1xHAfPdg9hPLImEaCP5L2BLQg11xW/cuCMveVtUdDprCbtzYYQ?=
 =?iso-8859-1?Q?RT2kjToQFuBDyq5SKv9YuzbzNnw/zlt14ewZ3KOZHJ9sxFXuDn0s+Nl3wb?=
 =?iso-8859-1?Q?tA5CDANoPMQ2O30aOE0FtJ9P244TwjfJVInLmp+fS1PORDyFLZAQC0ZRPx?=
 =?iso-8859-1?Q?goLFWYREn8VnatXetQ/6PTKtXgErquV18uXAmjqe9rj9oomKWfuTG9ub+V?=
 =?iso-8859-1?Q?uwI94PnrUMkIKSAjA/jVV4sqHBoNaL6ZH5oYbPI2fohm7Nn58jwKds5CQ+?=
 =?iso-8859-1?Q?Jq6nq7svpfKgwPqAjPyd4uR7haC9ymtw/OGXINdYng7QE1TeV7wBQeEfnQ?=
 =?iso-8859-1?Q?jm1Mcg/clTw475snYuOCEo8XkTOY2n2KxB/7pKGAjZPOkcmipkA741b0Tj?=
 =?iso-8859-1?Q?5qemgTaClnZvPhnHcLhcMt2kLpDpvb/WfZtpOru/y3iHj3qACLCbJR7GLO?=
 =?iso-8859-1?Q?nCl0r5crIt+Ml7igo+RxeaeAWFB7BrqdbGUQeZINJ7uikFuDjKEJKXxIw8?=
 =?iso-8859-1?Q?AbYtf1nktPe4c4lwyEnPDFGF6kKlmu6/RABNsKGNIbJG4jMFRt1e52Idei?=
 =?iso-8859-1?Q?k+8nx1aaOfKj4pCEDSR//EQbU7GRzUAyb0hbJ0fNv46AuSI1CJHntFpA2Q?=
 =?iso-8859-1?Q?pdwA77bdsCaem7KxiNcXRl2etDXrf9oPGFwbF1n/Gzvjmi/3IlsUJxmIA1?=
 =?iso-8859-1?Q?9fZwEVGg/LDFJy7SZ50HIDu2KHF6DjcyzKvGMt4zhT7EZeG01Jq3DVKBy6?=
 =?iso-8859-1?Q?1czGC9/LGETjbRcedk1aK4cX96YlZKfh9vSKqwlPlf/l+PDQlDqkJUFyL0?=
 =?iso-8859-1?Q?Xh8eSlT7uCERq7XfwcH934sT5aWyBNihjy8REslwfYg2m6Hccz8dYIfyOF?=
 =?iso-8859-1?Q?I1ib27ZJ1iRPUonLZUnddwi6QtZhXAZtnabssDvZPTMQ4etBOhxaNi4ReS?=
 =?iso-8859-1?Q?itmfoyyRddy4LFXUXasn8zYKt9dZdlwgDtV4ZrGmGH2OHdsY5hKwIjOdRv?=
 =?iso-8859-1?Q?lazQprwYrYhBu+7z+Nr7HZ0FISNa2OycURICsipU7jJ6MTDb0vy1llf2Hw?=
 =?iso-8859-1?Q?keqcJ7zztgi8gpSc2aXWLPMSckE1X1f3TR1Y8vYDnJdO/GtEMtX/kZ3a14?=
 =?iso-8859-1?Q?+n3Bc4lPP1rsB8iNXR6ktXDnd+T/ezSbpWS0dYl7mw51QzwVfxWjMUv2FL?=
 =?iso-8859-1?Q?2uL9tOa3kDAmk/dRh6eBRag45tr1ZFL1FoxcA2WRgygOFRhcU0wD5LST++?=
 =?iso-8859-1?Q?ua1zRNTpoMo11+gk35pIOzRoLiGlGVGHX8QxslHvxcPeE199xRlge0ygm+?=
 =?iso-8859-1?Q?9p3yaUidNwYeHR06znF4pIBM1yHXBZY8dPGrS/ER1qQ7NgcDgijqGSXhGL?=
 =?iso-8859-1?Q?10OFBj5D3enfA/NPmRQgOmrqPs7r3y9ADxC63vQjsyCoqbaRGe6n41U0Xe?=
 =?iso-8859-1?Q?Az0b3Zh72FCsav2KiPYTx3iNRIG/4vvkyQX8eDoaEFFHYm2RNZ4dDMeA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfe72b5-401d-40d6-987f-08de0b3d18e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 16:16:57.1547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OM5KL+un93DymlaGnhGmsRvf//a7qAP5QYo4HsoRiImVpHaowtaUeRmqtOLZFQ9CVXoxOdAYePXDzFZID6LbOfrAsDUCXiGFiFcqToY73b0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6481

Rule 11.1 states as following: "Conversions shall not be performed
between a pointer to a function and any other type."

This deviation from Rule 11.1 relies on both ABI definitions and compiler
implementations supported by Xen. The System V x86_64 ABI and the AArch64
ELF ABI define consistent and compatible representations (i.e., having
the same size and memory layout) for (void *), unsigned long, and function
pointers, enabling safe conversions between these types without data loss
or corruption. Additionally, GCC and Clang, faithfully implement the ABI
specifications, ensuring that the generated machine code conforms to these
guarantees. Developers must note that this behavior is not universal and
depends on platform-specific ABIs and compiler implementations.

Configure Eclair to avoid reporting violations for conversions from
unsigned long or (void *) to a function pointer.

Add a compile-time assertion into the file 'xen/common/version.c' to
confirm this conversion compatibility across X86 and ARM platforms
(assuming this file is common for them).

References:
- System V x86_64 ABI: https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/arti=
facts/master/raw/x86-64-ABI/abi.pdf?job=3Dbuild
- AArch64 ELF ABI: https://github.com/ARM-software/abi-aa/releases
- GCC: https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
- Clang: https://clang.llvm.org/docs/CrossCompilation.html

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v3:
- wrote the similar wording as was written for conversions _from_ function =
pointer types
- limited a compile-time assertions to x86/arm architectures

Link to v2:
https://patchew.org/Xen/b0f269822312a442e87ab02c8deff028b6b040a9.1758787340=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
 docs/misra/deviations.rst                        |  8 +++++++-
 docs/misra/rules.rst                             |  7 ++++++-
 xen/common/version.c                             | 14 ++++++++++++++
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..219ba6993b 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -375,6 +375,14 @@ constant expressions are required.\""
 }
 -doc_end
=20
+-doc_begin=3D"Conversion from unsigned long or (void *) to a function poin=
ter can restore full information, provided that the source type has enough =
bits to restore it."
+-config=3DMC3A2.R11.1,casts+=3D{safe,
+  "from(type(canonical(builtin(unsigned long)||pointer(builtin(void)))))
+   &&to(type(canonical(__function_pointer_types)))
+   &&relation(definitely_preserves_value)"
+}
+-doc_end
+
 -doc_begin=3D"The conversion from a function pointer to a boolean has a we=
ll-known semantics that do not lead to unexpected behaviour."
 -config=3DMC3A2.R11.1,casts+=3D{safe,
   "from(type(canonical(__function_pointer_types)))
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 3271317206..b3431ef24e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -366,11 +366,17 @@ Deviations related to MISRA C:2012 Rules:
      - Tagged as `safe` for ECLAIR.
=20
    * - R11.1
-     - The conversion from a function pointer to unsigned long or (void \*=
) does
+     - The conversion from a function pointer to unsigned long or '(void *=
)' does
        not lose any information, provided that the target type has enough =
bits
        to store it.
      - Tagged as `safe` for ECLAIR.
=20
+   * - R11.1
+     - Conversion from unsigned long or '(void *)' to a function pointer c=
an
+       restore full information, provided that the source type has enough =
bits
+       to restore it.
+     - Tagged as `safe` for ECLAIR.
+
    * - R11.1
      - The conversion from a function pointer to a boolean has a well-know=
n
        semantics that do not lead to unexpected behaviour.
diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 4388010ec9..4e94251887 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -431,7 +431,12 @@ maintainers if you want to suggest a change.
      - All conversions to integer types are permitted if the destination
        type has enough bits to hold the entire value. Conversions to bool
        and void* are permitted. Conversions from 'void noreturn (*)(...)'
-       to 'void (*)(...)' are permitted.
+       to 'void (*)(...)' are permitted. Conversions from unsigned long or
+       '(void *)' to a function pointer are permitted.
+       Example::
+
+           unsigned long func_addr =3D (unsigned long)&some_function;
+           void (*restored_func)(void) =3D (void (*)(void))func_addr;
=20
    * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-S=
uite/-/blob/master/R_11_02.c>`_
      - Required
diff --git a/xen/common/version.c b/xen/common/version.c
index 553b97ba9b..57a4a74c3d 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -217,6 +217,20 @@ void __init xen_build_init(void)
 #endif /* CONFIG_X86 */
 }
 #endif /* BUILD_ID */
+
+#if defined(__i386__) || defined(__x86_64__) || defined(__arm__) || define=
d(__aarch64__)
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * To confirm conversion compatibility between unsigned long, (void *)
+     * and function pointers for X86 and ARM architectures only.
+     */
+
+    BUILD_BUG_ON(sizeof(unsigned long) !=3D sizeof(void (*)(void)));
+    BUILD_BUG_ON(sizeof(void *) !=3D sizeof(void (*)(void)));
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
--=20
2.43.0

