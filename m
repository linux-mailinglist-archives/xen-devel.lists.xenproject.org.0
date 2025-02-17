Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0CA379EF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 03:49:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889651.1298709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCF-0001q5-W3; Mon, 17 Feb 2025 02:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889651.1298709; Mon, 17 Feb 2025 02:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjrCF-0001oy-PQ; Mon, 17 Feb 2025 02:49:23 +0000
Received: by outflank-mailman (input) for mailman id 889651;
 Mon, 17 Feb 2025 02:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGlc=VI=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tjrCD-0001oi-Sj
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 02:49:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f403:260e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9084f50-ecd9-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 03:49:20 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9534.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Mon, 17 Feb
 2025 02:49:17 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 02:49:17 +0000
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
X-Inumbo-ID: c9084f50-ecd9-11ef-9aa6-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj47tkysNFM2kwX50vZNp8PqFhLwWsidkqXdeZyMJWL2/Ar1trZG5MWQlcgClrCTPzWVk4Xpm1Q2pI/Yfc/f5h/B5s+d/ACmM56DDpT7TdjWB6N9w1vaLmAqYC9yWzfyuyA48Iq1Cw9LY0OPKEjCxpH7coPIbZkKnVWTRYCvTv07wu+0J3AU3ZzIBbA0Yytozf5vG5T3vH/eQU4y2PyfqhTOuUWEr3qbFRgWiUFVGJQXca79B335sU+g/8IUlfnA9WECXNy+pBDRrFJIUDLYgR/syvmwcVZ2/JKIsZzvLpzOGWiPzwVMMJm9NyQHo7LebO4YvPoaNo6RCcNQgvT4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyIJ2a/VO+kFwu4+ErznKiMqdqaPnBzvYdVAEx1yfVA=;
 b=bLDq9k/5ud1pUkPrHj67Y94hyX66dX96ilN8Sdy/eQwQ8M6ljopayS4p2sEjNLlvJ5fAiy6vt6sGKDbivof/PAna5UMdATAh8aeNWBKqPHkcWIXtlEyDyxb2BeG9NnnmacDJ4ZHX9N8mMYPLJ2Z5vBbPotZZpvIZLkRFa0580sFGpXdwuNLn3gOM5q0uUbdXUifSOBmQkQmPKtbHMOPLepoEkgTfLYt5jf5VxhtWyxXiEoySLGFWmEqMtoCvEEnhkjhK2W24RXqX8ZPRTHlCsIaDCXH8uUhc8PzDE5g7yy7Uo8cpvJTjcIODylWRMXH1HcT8IxllGifucqLKjmZ2pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyIJ2a/VO+kFwu4+ErznKiMqdqaPnBzvYdVAEx1yfVA=;
 b=pbnWiBzZMpIxS/WXhWwNvTZr4hpdpw5IASD/ANKiHP5yqCIfvL+2kjgBdm2rICYKpTnK4DYmAZR4pemfVy3lD2axALM1nO2KKJr27Zzl6XrCqgXN3g5lsrzvm8gamLvk2DGCeYshe4i/Zxv4DTDE7h3NQB3K7MtvCpIj03SdCuhOHo3RDf7RTIXjXoKq2SdIDGdyM+fTLYvc2JcjUIFfcOoIOPGt7KNwdkhYUf86wHnCFeebeT8TeLXQgdsYyqkWZwNTb6GqtiuQqMa+hbnY1iWAAp7EpX4o7DXlzo8o9UttGMDlVeeSJGTR0Jb0Ogye2S5907vN2GeVgFtoeZ8xdA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v6 4/4] CHANGELOG.md: Mention stack-protector feature
Thread-Topic: [PATCH v6 4/4] CHANGELOG.md: Mention stack-protector feature
Thread-Index: AQHbgOaJbtm4EXoPpUKhA13Cq77mpQ==
Date: Mon, 17 Feb 2025 02:49:17 +0000
Message-ID: <20250217024848.3059635-5-volodymyr_babchuk@epam.com>
References: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250217024848.3059635-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9534:EE_
x-ms-office365-filtering-correlation-id: 7986e5c0-1d1f-491e-5e18-08dd4efdac2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AtPD1jL5fRep5aSIB9yis1Vm7oAfyJi/v8my+i1lhsktceYKBPGiwSZEYe?=
 =?iso-8859-1?Q?zupdQGEHPvfkywew6ICpHNxEzXbB3hcXFWfjUha/Yox16jJiydrWtTv7Q6?=
 =?iso-8859-1?Q?GdHNGB3jdgnFlEM0bxcKs/80/HSGQFICjvDNk3M/TO2NeBTs5bii8Pv1kc?=
 =?iso-8859-1?Q?C+VLY0VIEFW68Xi/HavA9WvprOi96GLhNBeJ0kw2UI4Qn3EvUq3wJrtQRa?=
 =?iso-8859-1?Q?HDLZNlUEJPPmndRN0A9FzAe5r0C3bW4hMHMiOIaTFOXg1gQutQebmLjHB2?=
 =?iso-8859-1?Q?pJVOorP8lwgNJUhQO2tOtD5L+Ap1Go2z0qC9/33D6I4UfzPTDCf0sZdRlZ?=
 =?iso-8859-1?Q?5HjuXw8W7cIv7cBCzxuy77HWe/+9i3hbQll498O59k/vjX/jwMwKNVYbZQ?=
 =?iso-8859-1?Q?1eXEpD6LEjnV14purkiZTbKHYKQ+JCwEp97Fit4IJqVC8nEkPaR2BDywzL?=
 =?iso-8859-1?Q?uAAi7xrkEVFMf9olh5jKfgRuYcy9lVbdTqON07YSXj8dve2BqVGrwx193R?=
 =?iso-8859-1?Q?VjvKB2a3JO00mySeLdH7M4m45Xk0VAZ9zRr5x5EmTn9+urRAOUPs7vCzSr?=
 =?iso-8859-1?Q?E+ZGsLJ2/o93xgUa0E4+km/cg6ukuAN6G9TkL3Es4obOxp5QfaEYPrbJlf?=
 =?iso-8859-1?Q?fKRy+qyHp5g7LXwIbEpB/7nNkFX+/QbIt2GW9kQMfHTLGB3joLmUjLggzn?=
 =?iso-8859-1?Q?+XC2/xS3v/o9NgekYP/q/id8h01J/rwAuzROkmV0aP2BakbuXhlUwqCe69?=
 =?iso-8859-1?Q?/T2KzIzqCfs3kgCvO3TdtclCe54X1UGf7UhhbcZYJwLZtORNBjruMDKZJS?=
 =?iso-8859-1?Q?WL0o66gm5e4lkqvPdHTWWdHlhEIHF2vH8iEqsYI7xqhFvlZbpQz+/RudjS?=
 =?iso-8859-1?Q?q2FhqYaa5Ed9/l7L/VqUJLAs1NJ4zzMBYUo+3itSD9YWkd1yIgEIo4KRc9?=
 =?iso-8859-1?Q?bjpzlycNKiy6mJ4hvwao9BIvGbO722qQRaHEGfJe3mnt3dlh74aV7b+Ev0?=
 =?iso-8859-1?Q?ZunX+yyEXWRu9BQatRk8mzTJeGZ+zBXliHZDhzSaw6v05CO2ts1fHZvS9G?=
 =?iso-8859-1?Q?SEtTnsepvUNurh9MEBl7+CZBnRKSE4EUpdoszZJyzA0A9g2x6w1UiLo9++?=
 =?iso-8859-1?Q?8BzLLWk9mqFVIcY1/NG7hJXiN8iUIW09HeloalFMZ0cWCaUINn5rlgMnmU?=
 =?iso-8859-1?Q?/D5g+MdIzInNQoSUYelOqCCzchWLuoiknicM38YL8BvPQSm2oXxvrlbFSN?=
 =?iso-8859-1?Q?qvtFJD5mwuI7DvV01Q9lTltstfe2cHIFXvVz99MbKDoytFKzL1twQez8Ul?=
 =?iso-8859-1?Q?F5iMlg9lHAdIBgGT5ya6NJNgIg0oecuulgRKjc6kCqhwrfZS0qHUCu7rHk?=
 =?iso-8859-1?Q?hCV2a+WCbyy8FNAGf6n2ZHyJhP8jePNaEhmVOoSfdodqyIwa72iCpdOaBd?=
 =?iso-8859-1?Q?zn+DbQNIXrvBwCRn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mWP8MvdS+8Pg+CFsts16Nmmu72yB856FBAUIwnmWmkSU41X5i8D60ec6hD?=
 =?iso-8859-1?Q?1pQCBiHT8w+F5//vYR4CyAjdAPKU69MSNgmpB1BtZPRZaBKj1EY0sCJj50?=
 =?iso-8859-1?Q?Hm7dfJW02BGbwRF7PLKsG4MLj/CSn8/uCocCPaUM+N05+a5AJSbEROkDTa?=
 =?iso-8859-1?Q?gsgRkJ73nMi78nWwoUKRlYhLOguKrXXzdbzExypK5OyGRMxBLdB9lRcK8v?=
 =?iso-8859-1?Q?l7+EpaSiVZfArOHQqR/vLjtSogbztlizx28WQlHo3vKHKE9NDAgmUIyT3r?=
 =?iso-8859-1?Q?uTnvUdgNwXhpLvV8gmM/1azsqA4ifcH4v2foVtqrsqKhYCHqHAgZ3TjiKv?=
 =?iso-8859-1?Q?m0rSyshOF5zkQboAGZzGQPyoIm1SSI6E0HUfBMpyclySYOG/8tybt4xfMX?=
 =?iso-8859-1?Q?h3Gy3BQxRX6h6ZGA8NUn68/fNDfbrtxLAS2vJZ+c4HnntS7NzaPRdrvYil?=
 =?iso-8859-1?Q?1ChyIxVoiOysMnZ47oyke2MT4VRxDXXiij2Xzm9xARjGcn/09FbAyVRia3?=
 =?iso-8859-1?Q?sBSdVsWHdyyjBDWpf5FtAVajL6JEPABahiN6UHY0dfw2PXc8SxRoZAYNO+?=
 =?iso-8859-1?Q?/YL1fFxFAz8zm6J/pvEJorD3+OCxyTQpLEY3dFt1Eyw5Rkqkx6HSep8N5h?=
 =?iso-8859-1?Q?SXnth1Wt26c0yB0ANcPngbwSKCJGx5isD+yFahAVGc1B9oxqzxuVj7JaS8?=
 =?iso-8859-1?Q?FZ2ZK0cgKZ7vSkViPlSnwpA6GQ/xyFQecLcEi8bGq1Z6e4V9Yl6DD2uSWM?=
 =?iso-8859-1?Q?POD+OtNKSkh10MCMWsaIYNJC2cnRv1LQDlFuzW1282T9PoH6sfrPkuAsob?=
 =?iso-8859-1?Q?BgxyVrT89Z36mPdMG2PMpQA2Pf0Xj/BsgSgZtZ9Q4f7yNwmvAJW4pFBrqf?=
 =?iso-8859-1?Q?+6qFPjlxQhe/mLM1e0Vf8rg/5vxdgX1DNxEZcrhSjAW07irsqDgf+ptX45?=
 =?iso-8859-1?Q?7LaLY2iBi0GhglQ3fQUsHusOJy+9ffZCTHr9iQdJsVp3vlnW34KD/I1QIG?=
 =?iso-8859-1?Q?5OJ53+dr4ElsGsSYe+YDu3U/8HaWWUIB8VPiE77L7ZLW+m/1WFabnFIteB?=
 =?iso-8859-1?Q?95LEaqp3SRTpHPpKuusAnmurbZuzVg4vg4Yk840iVvMOSrp2c9XUG6Ek8I?=
 =?iso-8859-1?Q?AOMkchMzvQlc059gnzqfeI0pVv/SVzj4Sfhso3UCn42ZCKaBxj7IBj8EuO?=
 =?iso-8859-1?Q?qvt9cuzw2x3GuhQBMajfQddSrRZhlWkBDdTPt7OEiaTq4DuQVA+U7M5y7u?=
 =?iso-8859-1?Q?J/RafevgfFS2ywxsn2bW1W0/oaM8evoAGkC3k95s3M49GtNIMu4eoO0o2n?=
 =?iso-8859-1?Q?1UcuwYMgGSVRtoTMkCAiU0MgjdZkyZ34ZbiUKCpqMpJv26XqnM6WT6d1Rj?=
 =?iso-8859-1?Q?no8GRdx053xJr8SwPIaB+14RmjSPCxPHU4nc17RTEev9tOBxSfdnhXzA2e?=
 =?iso-8859-1?Q?odQRgw+SQ47e4B+qOAi6/a8qQEo0PBGnwlOhEvrQgnoABgZH78T0voovFP?=
 =?iso-8859-1?Q?o6rPEpqT5JrSy4nqwOZFwshxU3vMu7DRNN5zi47xi9Zbk7vGc5dJNmxzyW?=
 =?iso-8859-1?Q?eYnDk1aRJWnt/ZTukLYAetsZ1cT1oZvw0LmgWzwFs5bUJh6BT58USXM2lV?=
 =?iso-8859-1?Q?yjWztYKu/kHvE7hOtVu9vdoQxiFdFpuWzSUaQvFrZyGaRHY3+h6XGdYA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7986e5c0-1d1f-491e-5e18-08dd4efdac2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 02:49:17.6890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XeWuTM4usAnzKJAX84iNZwElai6TCQ+2x3+lyLaH9FlSfnovBD0e744ybAztvqfMA2niSHWN0Tw8cTzaEfsf6dJjZnAv4z+JsRFgFHiGr3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9534

Stack protector is meant to be enabled on all architectures, but
currently it is tested (and enabled) only on ARM, so mention it in ARM
section.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

TODO: If this patch will not make into 4.20 - rework it by mentioning
a correct version.

Changes in v6:

 - Dropped Andrew's R-b tag because there is little chance that this
 series will be included in 4.20, so this patch should be reworked for
 4.21
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1de1d1eca1..4cac4079f0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
    - Basic handling for SCMI requests over SMC using Shared Memory, by all=
owing
      forwarding the calls to EL3 FW if coming from hwdom.
    - Support for LLC (Last Level Cache) coloring.
+   - Ability to enable stack protector
  - On x86:
    - xl suspend/resume subcommands.
    - `wallclock` command line option to select time source.
--=20
2.47.1

