Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A53B07F88
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045825.1416137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9d4-0007il-Mu; Wed, 16 Jul 2025 21:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045825.1416137; Wed, 16 Jul 2025 21:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9d4-0007gg-JV; Wed, 16 Jul 2025 21:25:30 +0000
Received: by outflank-mailman (input) for mailman id 1045825;
 Wed, 16 Jul 2025 21:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvkC=Z5=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uc9d3-0007ga-4q
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:25:29 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64344438-628b-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:25:27 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI2PR03MB10882.eurprd03.prod.outlook.com
 (2603:10a6:800:27a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 16 Jul
 2025 21:25:23 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8922.037; Wed, 16 Jul 2025
 21:25:23 +0000
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
X-Inumbo-ID: 64344438-628b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsQdebeKe4HAB1s3K1/HOctBtCtWr7o1qwMBiIegeciPQTYJjjQ/SxqY4hwq8yxmlAMHvywvNnPxxwfnyVQ1c/Qv0UhsSMXpF4dROkV+74GbPgrTbFz9IUbdXPVql9pHfZNR4P6HcKS62TstuPy/BdD3Q9MPNqZqH+p6PLjUX37bZ9b9wP5UXjbysBKr9JNbYmV3rEqcsUDrV+M0McxxFKBM37N59jP0ZX09FEYhkKwzN0USIx8yw3/RUz8aNk83zqqJI8ghtPe9c2GJBZRIwy38O7UBcVgUESCYKAhhvm8QsppXBhp857FMWWxIVszNpygS/IvTW4nCpJM/BBp1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxY3pxeSZO1sHFnDlZyvBpWkws+xxer0FBqoWZuy7Hs=;
 b=bm8vcTmV4L3TBqUEBsvuacJEilQXA882tTOpMy4qRm80UFUaNlTzV8ZIsV/vE84BFxfc5BoRrhDAzUgk47j1WBXfmIc/2TrqDgb8XpIcaFHYL9SU1KT2nmjyHndWrJmr/1pW7lAZlEp9aUXkNyJ2RlOZpe7rvxXTTA/1Y0uvH9vS6WBzNsv+qA78iY2F/rjqRsc9QWqofVxRkXIu7JoQ1CZ/0j1pKu9q1g8Vve2SrDD0snK3HYa2ggpg7eoxixSaxJPk31WN7UKikMauY6Mc6pG0YO0xYn19ufJKTvCzbEyiMgn6SKhQYGF3/jiSB9n00Ud/EvlXc6soXFKu7MdPbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxY3pxeSZO1sHFnDlZyvBpWkws+xxer0FBqoWZuy7Hs=;
 b=bkysjmOfzAniJcw8PsyAO4+/amtLF8Yx1DNWsC2fkA4mI4eVOEgCuz9beS+PkedvDOobO1UIdb3mFBD0pOtwXPdsm35y/RWlIlS7hLEpCaTDdw5B7GJIWR8c+lgnvQ3ou6HNClRJACs+4JSrEAe3BNKV7hQltnDDer+sofGfqw2ecOEshjjJuzZLeARiR1bwG4XUqaPQzecGsrSzihbNpvugSBwu95avkAQQ1L+lUGHqm8hPLWaLp9FgxDOosf7T4Th8J+ICZ83q6UCM+Gg0qggdIn/jYgfNlXyydYHvF3io2zeWSqbkwPND1Me41q6JoaEVuMsnq5MZlFHyDJZ8ZQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] coverage: add support for GCC 15
Thread-Topic: [PATCH] coverage: add support for GCC 15
Thread-Index: AQHb9pgjCJcbvNNKPUeLsgib0lMzZA==
Date: Wed, 16 Jul 2025 21:25:23 +0000
Message-ID: <20250716212504.406565-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.50.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI2PR03MB10882:EE_
x-ms-office365-filtering-correlation-id: 24649466-10ae-485b-35c0-08ddc4af4674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Bevak0o22ONA68cbQ1Ghx9x0Y+YOvjfIiqgjDJqL+RsFVdhid2SqyIJ0Lm?=
 =?iso-8859-1?Q?o9A6xolvflKuhxDTJwLd2VkVMCxSMTAxN/XBx/DiFcmtzuYFWIkDRFJQ5m?=
 =?iso-8859-1?Q?Hg3DOlSx/OJAdBx8pb4L7cA1PmQocgHhv2FLRcdDeYN80ncoPI/Kh/lLrF?=
 =?iso-8859-1?Q?pW1Aftza7NK6Mw16F7Ua9ubAY6mVKvkkkI+DDFY1UD76bpZnsVYg3laL6i?=
 =?iso-8859-1?Q?Euu00Gv5u7Cq1lasPZlRsx5wzZakNSE5+BckjfTH7nOOQWFD0wyyFp1DDF?=
 =?iso-8859-1?Q?/ameaaLT2IaoeD29uINA9YcDqFOEVDVNttfwIfKuwTsRv1Pmf+Qt+YkTY4?=
 =?iso-8859-1?Q?y9B3dTBsxuRhdhwTqUblZrSJZ4JXzncXB+UMBn6P0mME0ifMfzFCrvdvwh?=
 =?iso-8859-1?Q?0HeGK4jbuY+koRlUHnxF2XpY4Cf+YznT4zz/ZGNoCDA0746pZGVLVdzGu/?=
 =?iso-8859-1?Q?9h1O2TTa5gOJpP/qi1VHlzweCTENGtOVRmxUBgQUxkguZhlPdryjSozbZb?=
 =?iso-8859-1?Q?vRo+fRJAxp5W/RX4lZ3j0I7QRwtnVlQ5hkpZwkw1Ry0JomliEcfowB/Xux?=
 =?iso-8859-1?Q?sy9LOBbf9nPkdyyyJdhtICBk/KkjXlxNE6eIvsDczvybtzbTIddmQPbaWn?=
 =?iso-8859-1?Q?lGvh0dXgRNyXgoEQiIFQZ6pLd/Jq3kPQLyw59HUUe0I3Tuh02JPAEWU7sy?=
 =?iso-8859-1?Q?ubapOHpo6yHkI7rinPwrWWlj0EEJvQYoCD4uTVrB1zu4CM/tWNU84xm3Gv?=
 =?iso-8859-1?Q?GVAnqKlFoqgOcOYQpAmi5Pdhr6b91EB6wR/9FzJvfVopkwy3OksJi5yAQZ?=
 =?iso-8859-1?Q?hE8G5i4Z9czPqw2Xwcj/TG9KoaBPx2GnP5MoBzalx9v1zise8s/XNHPn65?=
 =?iso-8859-1?Q?SFzMfP9ILvP9hDWu5etJ0BfhVS3UQZX3zhbYZlzLDiaYQiyBmEmr+97sH2?=
 =?iso-8859-1?Q?LAU8Ggjl3b7sCfdIbU5ixTIzblB4DIKrUWLPU/x1pBmGMrU7+mM1Z172gm?=
 =?iso-8859-1?Q?ef/7pj2n5Nr36mThG24bD4eqVs7dwsw7N3X5BkdoJh5DgI6IxDjl2WvbCa?=
 =?iso-8859-1?Q?DdWvIm3TcQDqeFUGFPsFsYH4zByM1B+rWDaAyqz/lE0SdaRyzmAGiy0mFc?=
 =?iso-8859-1?Q?Ri6fY4llgz16biHYhee3HijbEGe9QA53NfWO80h8VjO6bS7q1Uz14uS6cN?=
 =?iso-8859-1?Q?LybhXocS/EtrejIIlp7Ib3xCjgyzvOjxBM1KI7t6vGh6JRepLZUHHiRqnQ?=
 =?iso-8859-1?Q?ze2BFfcTyZTHKx2ZtOAk/qW4i0rhsH2GwpDmfvdPwgvZQ5HQwfi44nQGsp?=
 =?iso-8859-1?Q?u2qobTdTBsNJF6fpkgxC0zQk6twB7dVxaB/KQQjHZFTV7bJc1UT7HZ+8bk?=
 =?iso-8859-1?Q?UcHnXtlUchvWA9/mqaWxrAooF+ud4rRsndhVsKUU1YXuozmOkNasvq6BmJ?=
 =?iso-8859-1?Q?IWrPG+VRGtNSn4y76CVVj6MwGxCWm3p74Zmg0/GPaQ3g8v9inks1TXmiID?=
 =?iso-8859-1?Q?Z3ajJ+NAt5/hKnJ2ReCRjmU9XDuufJIgK6FE7D0ABNIg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HPgBdbNuSDM2ROaYPS7zeWt1yJC+1qq+P/NxmXYtrO7uXlPHKCpaujfNk7?=
 =?iso-8859-1?Q?H2f8lXE6j2JGQKfm1d6HeqpBV/SCieqcU03jvP7F3soyZDMWxFzNs320S2?=
 =?iso-8859-1?Q?EUu1DiCOxXLSoXbOtGwQDtu0kewFyxbs3x/F9pZIoVaTiTBBukMqFZRG4K?=
 =?iso-8859-1?Q?nhjdzFtohQy6cm+VNPQ6Z1ATfCXz6dpyFTwGO46QodPGlt1cnObJZLdo8r?=
 =?iso-8859-1?Q?e7i98sDjkYXQ/PHD6pHcmxG9G6U0L6qjVRevV6YxYVxRzkWnxnM79Gszzt?=
 =?iso-8859-1?Q?CjmZ3EZyRTO3ngMSEALoWU7ZDFvouBhwsup7hyPRVczlQ4FtRMXmWdEnOG?=
 =?iso-8859-1?Q?FVm3o0SuMIVbkOHCH9fSI1q4eDiW1HbjSSkv6fekYP2sFpc8NjN14O8P1v?=
 =?iso-8859-1?Q?1rYlz/RnRMx3j1qL2J6f8iM9fjLznQKgLgRvfGpQa7KIdy2KSc884rJFAj?=
 =?iso-8859-1?Q?3oVer1COBIDMYPZzKQjgQwajoHUb+Hqqi7kMoNAr0FWT7RvhJfMIR10DFh?=
 =?iso-8859-1?Q?s9Qyk5ttriMElTVKS28HyZY2CpoHU8FqQj66C+f8nSZPxtzyHggao0NsQO?=
 =?iso-8859-1?Q?1kMArw4q/jMxuLD7w2kwa0DpW2xiD08XaqjhAEzK7bgpiPvFhbSofDSFvU?=
 =?iso-8859-1?Q?RDAbwQ1b4iczhdTWpZyoMZUllsK54wRhchvuaVf1N7KDS1FzuGC9d+ckzz?=
 =?iso-8859-1?Q?aFWAl1TItYKZH4D/5kFkEC1Mu4dyEPzmkDApayG/s32ORHj4n5TW8XkNt5?=
 =?iso-8859-1?Q?ArmxtcvWzYub7FfZve5PcKYRtOZbWCOnsTy3wgU6+1vuaTWdUbPtjo4YRl?=
 =?iso-8859-1?Q?TkuTPJ2Xjnt9UNzKVB4PodPi4H+FL3pSD4NK+eT+xahdJGqYWiAQQE2+un?=
 =?iso-8859-1?Q?z4pZNy+7FLu1WKeXZvkb/L8XNVUAo55H61ziDUPTJkdu6yJOx99SN38e8U?=
 =?iso-8859-1?Q?nEY2N9rUyHcLJElsTxV4g9L2e9EdgA97eyutpYTpMEgxryt6DjCf4DZJ6E?=
 =?iso-8859-1?Q?BcT5wagZB+yrEjwrTADndI2nIy7oNKDjnDIqCDr8ydd6bGnGNT6cDWVfBh?=
 =?iso-8859-1?Q?+3VyxWO3QO23vR/iStYJ71MOtOKwhbxgG3P+MF4t9/5psB5qu4jZpMTfr8?=
 =?iso-8859-1?Q?IuIXWmt7xFXTPM6eUGAfgqHnWB3opSsZuLUTgHAbZHSWUZyv6CfrRyEG8K?=
 =?iso-8859-1?Q?NZPfd7uQG9hTEJ70G0f3L0iwkaqwPViU7SJ9001+XtmCzbO1jwHgL0DSlh?=
 =?iso-8859-1?Q?/Ea6MuUlLZlfigTyJHAfD8Ch9oYaxj3ABkGc0u9Df8hKseqAm2bZx/1ae7?=
 =?iso-8859-1?Q?1zW2xJunOWqgU8WaiHjDzQedx0Z9E6HN6NCmT3AMlOVtjUDfbj5XWewpX9?=
 =?iso-8859-1?Q?Lkj0EOQnmr0ykTqP+IEq1roCw4AFEZQdgRZwxZPcO/DGuYlOj8tPP8Osj1?=
 =?iso-8859-1?Q?giVf1Q51uaz+2Xl1XQxuCMjegm2b3XkXYhEIQ4bfmrr5PQTiEjqDtNlwzD?=
 =?iso-8859-1?Q?7dkZfZvAo6C3BYEZ9dxdqDFUBTftGAGvY+WfIPku2NacEW1NRyfsl8UA0o?=
 =?iso-8859-1?Q?TOAkiEtrXFg3tBn7LEPA2r+qPDthA2LeHlTSgpClDtMh0FQeNl+CbBC2lZ?=
 =?iso-8859-1?Q?ey/Mn/0fW4Sqxd0LrHiQC+f7EeLu5EWMKmeyTfAZx2YVV159C01n2pig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24649466-10ae-485b-35c0-08ddc4af4674
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 21:25:23.6759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eVAIle2P043lNFb6f65/ue8wHbiXeLB9d0nLNK4/3lLCjBPw1bDPEHnjQpZlbgUKM9ouCXggVJkHJ19lkPl25G3RX3fioL5goZIJAqoqVws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10882

GCC 15 (with commit "Add prime path coverage to gcc/gcov") added a
new, tenth counter. Reflect this in gcc_4_7.c.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/common/coverage/gcc_4_7.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index f4c1802303..0d83f60180 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -30,8 +30,10 @@
 #define GCOV_COUNTERS 9
 #elif GCC_VERSION < 140000
 #define GCOV_COUNTERS 8
-#else
+#elif GCC_VERSION < 150000
 #define GCOV_COUNTERS 9
+#else
+#define GCOV_COUNTERS 10
 #endif
=20
 #define GCOV_TAG_FUNCTION_LENGTH        3
--=20
2.50.0

