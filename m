Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB00B44709
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110820.1459853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIO-0003tO-Cj; Thu, 04 Sep 2025 20:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110820.1459853; Thu, 04 Sep 2025 20:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuGIO-0003pp-8O; Thu, 04 Sep 2025 20:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1110820;
 Thu, 04 Sep 2025 20:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG9i-00062f-M8
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:02:02 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00734357-89ca-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:53 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:51 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:51 +0000
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
X-Inumbo-ID: 00734357-89ca-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8f0gH35+5sa01sCh7h9Rkr9tUwQrt43EOoJY8KRVQPwIkXxxcBGAamoVnUU6V1lHCxyQu5GREbEDipfOdXjOCVKN8CcO87ig/yG6K2OfZlObP8jYlV0M7DrihVOBZHgT+B4EBuPYaU2OdHNp/TT8zM90a+kSC764Vl4u7gzqLrAAdcT41t6JfZrQLu2mXaoqeyMGEHSig4cX4I9+N7CBhCZzVmiHUDtZo1jW0r2fmFrRSFbjotEfMA/Ty7E8Foa14HyUbv0iWbNoRYeRpeKR4V2CyiTYG+p+sIEK1PZCUWT3/cYNCKSLMqFCZCnnFaFPZtBpzeHMVhGA8wcaF2wGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APCi5+B8JdVl+YRWSgmdXC3fYo66EiTHOdPIrONfa4Q=;
 b=nc/+zPD3rKKRBOyxEe+k3NkY2I0A36+dqSy340Xa2cSsOVXqqTRbydtBloWD0uQLzcmSdbr8JQXaptwR46ypYx26cIABC5UipDtnxnI7Qgpz0h0rP+BMZcIaEQFrOcbpJLRMXv+5zUG1xO4JCUxSue25uPQCh3gCZrMDzdjJ0/pt6J96PlcL/lEAKalT5V/1+8lFeojkNHWRfuBEri+vIiJC1mG74gESxtxk9yyiIYBbmTWYDoNLvk7WMQWksn2bVPLm5+wocs96gwyDDMQOmX+2dIv9RJT5gNUxnUyBF5sGsbo40/lP+AOP+r6WUlUtEGgw44aga7E5qowI6WDuGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APCi5+B8JdVl+YRWSgmdXC3fYo66EiTHOdPIrONfa4Q=;
 b=vDL3sG5AycgPE+KKQRJ6fgY31CV33ce7VywTeuEu1OnSwJ5gWESzfyvXUTxBOE7BPBiBVJgteMsjodvTNqLhhX021D+ug+w8H37uyhOLaVSvLhY/BmKV2u3e6MPmksnFRn3v4llph5e6Dl4mtCHy/1beAkB6IuzpeEMv0CRTJwNhFfVkT0hnlE8T5m1KjT7DBuPlIluBn++imcRBniZevMT1v2d/vl8WVOHtys4pmWyANh+Ye+fUJhfxwd5urgkRIgvS9G52xzeFNFoWQCW8/45ukCanI/9FTiiKG7D2K9ikZ3+IFJqEyQfWiKher4HaFqi9/wXsCVXPslZOLtPbQg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v7 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI support
Thread-Topic: [PATCH v7 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Index: AQHcHdbB9wlNQ1oV4kGWY7CqZflnXg==
Date: Thu, 4 Sep 2025 20:01:51 +0000
Message-ID:
 <90060a66131b799fc14249e4f3e71a0a04fede55.1757015865.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: 5e082a27-2672-433b-9af5-08ddebede3c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Tf1pamZ3Jzq7w+w/luTqu7C7TtP7VKX7nyIsKfm1v+uldFY/v1+4K2+zyC?=
 =?iso-8859-1?Q?b6E8oOIIshrLTn16HAmCs2UP1ckRqNRSDSw0pKLb8AHyX664jcHXEbAPQ0?=
 =?iso-8859-1?Q?WVC1dT28aNQ3/kwrVt7c0JCyHAzwmWNeRoSK3FM1nDBktJzTlfSmUrjK6/?=
 =?iso-8859-1?Q?P8jKFNmpbk2JZuA87x8K0hM97rXYnm3MF+ZuEsS211Qzds691i+/L3r1dR?=
 =?iso-8859-1?Q?BMeD6zRnms00WuNdP5ZC1z40AAuW1vnHxXJMU/0aQ8JdAdGRefjjgGVWKb?=
 =?iso-8859-1?Q?cGnexcFMCyQ1llhKyXQEPzukKu+lxhslyk6e8tjmmSCZUOzusP/lT4cqaD?=
 =?iso-8859-1?Q?bb2ZXtgIpmF173DCNurMoJHtgpn8lxsW4ZtooMd/5RwKcuODw+6ClOZxGU?=
 =?iso-8859-1?Q?0DARmuOm8M+Y0hG1PxIK6HmDnvwUecbw5SUiwUeH0s4U1hm7PG/fWEQl83?=
 =?iso-8859-1?Q?sJefjjoEl0rarzO5po31QJT0xqLQR24TJDMBCHmetsS9yJqFiW0AkszIDJ?=
 =?iso-8859-1?Q?cvTQ5tEUf9PK6/V+t5p6WACcMrBnddNhQrgEp010wevZNwLGvZo5+nMgZc?=
 =?iso-8859-1?Q?UOi9dM4ukTqK6BgiCiUtt1bjsujjXKQmhlCUxJCn45N96ARCv/lFhYgKq9?=
 =?iso-8859-1?Q?cbaehfXQ6eHfMnMJtXFz8pLEAlu6d07GNp+q9heJW92onjBGE/8/S0IAT7?=
 =?iso-8859-1?Q?ksU9fOupQaxRJ1letMGIR7x0tjUnEXRbkbqXfwlRXjwPuPIGbcyvU+iRhc?=
 =?iso-8859-1?Q?iudP7VCJhzbeBLyoyyp6pyf23Wyo8riRJILIELjcyUNO/gOEtXdtRVbySu?=
 =?iso-8859-1?Q?uNtVxXBzOqSW81Qh3ZmRuFIvRH7Zc0dIUjT0gsHdeEUJRkhC5JFNrbSlzd?=
 =?iso-8859-1?Q?LAmtkhF86nhAHv31ijijc6k2Oyv1LwT9iOjIeFRKe07sw5U/8Apb4F7uiI?=
 =?iso-8859-1?Q?vaFLbAx5ccZeWp9reswi+LY+7CztfFVL8Kvpbti6mBM0XJIvyz3zjf3PD7?=
 =?iso-8859-1?Q?Whhg21UcuIEtxh3ipa1eH5mzV2zKglhwSrxYas8Ve4E/MH5yE6vn5WODDM?=
 =?iso-8859-1?Q?ELIEVqBNrTYP3qdssOE7/XGTWKnYH7z0C1BYgomrU0Ob4PRD3aDLkMuowM?=
 =?iso-8859-1?Q?qEDrYENB7q5NDAZpZMDBPBDmqQi6Bg6ZhFJC+LTFtKAKbWCXz5MR6lJ5kW?=
 =?iso-8859-1?Q?3gS+daT0pQm0euCzB9ZmM9DOjH4GUyORAMLT/GVUEj13Zu4WSgvnZ8zcng?=
 =?iso-8859-1?Q?wgRnfnDI+O/sLIR5gGPeJ1WAiVXdedyrVPXqKYIMFvhB+62HpF18B3a8uM?=
 =?iso-8859-1?Q?zIhz9IzJDoXDJ+ermdIWznTyJQLvPaUOFmrFvv4n57cYjvjuHGA3Lqp6AG?=
 =?iso-8859-1?Q?cvLtX8KoMUfMF7hgM/zM1sMP4jTfgyfbg4bQGH3gZjxC41rw1o8OWqd17H?=
 =?iso-8859-1?Q?bwmPnV2KLJtfmBBSLYPREk5z5HExktitrd97NpTjUARQOmaDdMygf+3URD?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2YNbWijHOfvfyIyR8V2elKEtwQLL4/kv0eLTaTjN6qcdo/ILXp+UMfgnTK?=
 =?iso-8859-1?Q?VtRS3aK0R8Muwdk6l22BFgc6IjAjZYl0/OjxgifP33+FKp9x9KMAOdl4OV?=
 =?iso-8859-1?Q?TrwxIP0itji3tiIKZF3fGYUEJNY1piD1mkrxYgNHxVR/PS2H2GAHlLC32H?=
 =?iso-8859-1?Q?v65N0ncmG2EumapF29fFvmMoVVN+x13lUm+WydF4I1dQX/c2JSOzAOafQT?=
 =?iso-8859-1?Q?/yNguD9hq4qKSC4pqkNyVWMA2Bsj+693b+dBp0QTGOY4z3PN1NO4ALWEZo?=
 =?iso-8859-1?Q?eqcM9ZB4dk8exf73t0rw7rxl/zGpouguZRAa9p6Yfm7vy9/F0RXh6BHXwK?=
 =?iso-8859-1?Q?PV09CiwS2rRSfWmRcyfcYHO4XerwA39FRDGdmUdXVNAONu0UFXupsvKkYA?=
 =?iso-8859-1?Q?u71AJVCxt2rTGeKwIwxlcUnieWZU5nXn0T22hmIo5c86Xj3ey1iqjKv98A?=
 =?iso-8859-1?Q?PjHTtWc6OnBUDhgHXACKLE72S9gLsPYOWvKf3jpCpGfUfe8PPtAi/6wOj5?=
 =?iso-8859-1?Q?CUuaVToGKXD9sUD46Y1gjwih5ys2qE68cjAO+GBmN281Mj/Nl/5vaOe5P2?=
 =?iso-8859-1?Q?WDZ7NuzseC4PCsC7LNHYnqbLglj4lmhfgYaskcsz+kK/pKFMRo/ePPYHWf?=
 =?iso-8859-1?Q?/tcMhTbLuQ6e/n5wmGmrhcmtdP23B4hstmYz6ZFMmGglnxrNI7o3Mvvq9y?=
 =?iso-8859-1?Q?J1OQkAD0s/hLK/kgID3VOxSeK0nQj4dlTGvpWAOPFgOt6XltvZzup4UPVR?=
 =?iso-8859-1?Q?pcbjvsGETVxShzM4L+vRiEdmNHmnv+/MPEbqltqi0yHqF2vPjaoWZJ65IR?=
 =?iso-8859-1?Q?/wEb+tx1tbTKTAUZdVyW3Ot3TIo9rkiD+sJVAkgFvSmWD8VujXHlwNGt5Q?=
 =?iso-8859-1?Q?SB4/1QjQfxoh2YT98CljzvBuBDBR9vlqvz+Ymg18EIE6I/CCcIQX7osaop?=
 =?iso-8859-1?Q?Du+G0A7f4gT44ZZBVYWQA36OX992wsNPO4SnPFqqiF6lQyYXTlHqyg73l8?=
 =?iso-8859-1?Q?d6qS60UOjGoQvsWJybyrV6heedczDeS+UhHakuID2qxx1r4/arIvB/39UK?=
 =?iso-8859-1?Q?bs6tn56mUIFyAY9wQblnesy9rmbZURNyodssyGX1g44wOA3G46GQeXaqcl?=
 =?iso-8859-1?Q?FzqNqTbUOMU7sKWuz6E2hHPpDxhU846bR6KvUfQ/xolzCopn4WMGMALZmo?=
 =?iso-8859-1?Q?sHsdfaoOvXGqdbB8Q8opV1EZh4Za+cOg9Dp/JDfmd3ABtN16Y1LREvpk1I?=
 =?iso-8859-1?Q?MHFiLM/cyGHteMj/8jaqAue23hb4Uzyedco/Qdyn638CuVaPwk6CjRfc8W?=
 =?iso-8859-1?Q?4k93jXWyq0zjdIev8YYuLtezzHVvOeHzEd6W1q0d9rAq9zvhyG5l4Mcw6I?=
 =?iso-8859-1?Q?czEzIb+inyK7nIMI7q5G506gpJyoJ8VEBrk45yS9estJP5Su6TrF4tqhyz?=
 =?iso-8859-1?Q?gCa1ahubbUA3m1A1/DOnY49+ZrFz5LAVq7hZQjJYOCVzhmXJF5bevMwyT4?=
 =?iso-8859-1?Q?PADuCGcCPgGRqQe4pweMJCFS/sak1DeSfQGaQNlhVHeYW5KsVP/jLSce/7?=
 =?iso-8859-1?Q?G5LlWYBtHx8rIow4Ut+9fVx7rL92pfKrasrPXKw4AX2mdTl/C+CZ3Chg67?=
 =?iso-8859-1?Q?rQ5p6f6bdcim9CAd0UH6CKUjCiLr61OwsdTPDgwn93klSX8CPSyjyRdCWR?=
 =?iso-8859-1?Q?oc1coHcu72TS8akGS/0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e082a27-2672-433b-9af5-08ddebede3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:51.7319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxDC8u3ma911H84UcMfxmn3ycCR+a36odQtqbmRqWFByP56PCrTZRNj2JwcY/bYEpEbRefpFN96sPxsoE752zDpK+QPOlg9HMzVgaFzZ0Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
already supported with CONFIG_GICV3_ESPI enabled, so this feature should
be mentioned in CHANGELOG.md.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

---
Changes in V7:
- no changes

Changes in V6:
- no changes

Changes in V5:
- extended changelog update with a brief explanation of what eSPI is
- added acked-by from Oleksii Kurochko, which was received for V3:
  https://lore.kernel.org/xen-devel/bce5e07c-eee7-481b-a833-4d5d8bbce78f@gm=
ail.com/

Changes in V4:
- no changes

Changes in V3:
- introduced this patch
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..31b4ded444 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
=20
  - On Arm:
     - Ability to enable stack protector
+    - GICv3.1 eSPI (Extended Shared Peripheral Interrupts) support for Xen
+      and guest domains.
=20
 ### Removed
  - On x86:
--=20
2.34.1

