Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A306A821CE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943760.1342403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SP4-0002uP-Uy; Wed, 09 Apr 2025 10:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943760.1342403; Wed, 09 Apr 2025 10:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SP4-0002rz-RD; Wed, 09 Apr 2025 10:11:30 +0000
Received: by outflank-mailman (input) for mailman id 943760;
 Wed, 09 Apr 2025 10:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwso=W3=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u2SP3-0002rt-8X
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:11:29 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff61ac26-152a-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:11:26 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7718.eurprd03.prod.outlook.com
 (2603:10a6:20b:402::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 10:11:23 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 10:11:23 +0000
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
X-Inumbo-ID: ff61ac26-152a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dugBDF4+4VNS0EQa/+M4xaIzUUe6W6giLg3brpmj1AYszEoI7dlFZEt0QAS4kBuWAv4j+MvsXHpIJT8xPV0aOH3HQM4gtdAvCMSZBPW7FdI+SErqMyACbDWwfEiINlfFzmBpoNnfBd0StKK9p4JlYR/lb8wT3QD4Yjj2HUbnqsMxM0S/VmlJWINUYeNjreq0yLt7WTXNZP/8pUJ/HzHfX9EDSie3F3/2NF+RWX3V5LFs9KK9v1vvgV2w8fJx1eYlsyv6oDIq1bX0sCmtUkFMlS6fvB/6FV1c9Nzu+8fgUzXQVaAfIP5AKbdXGNL84SXXi41sRk+mKAtGwOWhwo8xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqWWxpDoYDsBPgqho41u5hwxdBWPF+k3b6j7HgGhvwM=;
 b=ySXbc+Uamzr2Q3ZmpeP8IZInTkNX/g9EDMGgrsh22X24ZIBSyIxNmqO2XQzsTPaXvYJHtq7YBToo9j9FEJiPWJAASV7W/9sNQC/WdM8ahp3dHPwk5gLa+RmoxenO89bJ+uI9yw0xBF5CHl2v+LrcbJbEG0AVgYAqkGwoNCXpcOlsCUZKlhZD+h/CbRa8E/WLUOeO/eEO++8zRX20Q+Nv6tBaw0N7vRRm4spV5B/AgHkmBcO7MjLX0sQwKtADK/o4j1Qc6ZDaCTu6stMQ7Kr99WjHF2z7MZgdyBL7tqdktX3qpTorWB8Kp0i3uREfXBbEg8St5YrAU69U3blEktkFuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqWWxpDoYDsBPgqho41u5hwxdBWPF+k3b6j7HgGhvwM=;
 b=PopLVEFMw6CtjarbLXMJH/y2OXcc2RF/JUl1UTkLMUnqPAk36I963KmGsPCeT9uDdGMFyyyuLCQshDzTGnV5S6JiQ3ZcageeobleOuEB12OIx1t83X+48iazLMqonv2mdU9UifAWBS6CbvzaL8E9ILcBc5OQi+3XidJBnM/EMFIuI7FlKUCXe7LtJlzKMWI3UVbDDv3bcIlhwdIxgdJbQi1x0BWK67pDckwLCysWDt694GmUukQgnpd4rr6p/v4Wy2Ci1FhGiQERtNcaa95sZZD76TMjsE7NpLvfNaKK7FLWT6uAThwHs6wJyLVr959Q2r1TqGoawJ0P9hmZ8df6Rw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v5] xen: debug: gcov: add condition coverage support
Thread-Index: AQHbqTe/Csu/ncsNI0mulEQya+sOaA==
Date: Wed, 9 Apr 2025 10:11:23 +0000
Message-ID: <20250409101105.2733236-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7718:EE_
x-ms-office365-filtering-correlation-id: de90aab4-7977-4ff8-fc7d-08dd774ee199
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?07WlaSmorn+BTWPHbUntTo5+JBYF8VwenhPqgvVQY1SYGAS+5scW0+jPiP?=
 =?iso-8859-1?Q?22WoDwwZa5sQe+ttJsM74bYR4xKCXECbFQI3fGDZBYxE7ZKIs25mB3G8HJ?=
 =?iso-8859-1?Q?xjsnNSnX56vnsUNBbtRMgaDazREHXz0UN0UH6odpNVAJ0OC883NLQ38H+7?=
 =?iso-8859-1?Q?1PTKQ40v88e2JECXpfulWSIckA/1lSNeq99S+y6J0yEMvvqJCMUj7/GKEO?=
 =?iso-8859-1?Q?xj5ykgtu9GDTXnU0QQR3iDZJax0z2FDVaNwx1eEKM9zZGOI/HGCBnIfhaS?=
 =?iso-8859-1?Q?asxbWehEt/NghMKgpa8dV3Wccb6eGpouIR1/rH5DH0G5QcUY0zCfKVZ56R?=
 =?iso-8859-1?Q?LEq97s4fLB3bAvEn1l9GTn6C113TWE3cC5RnZkOPPU/svJvxLcoM+j0lzt?=
 =?iso-8859-1?Q?eQkDDHJU+ALDCPkYNBHg8ozB7J6UTQtSA92z795W2zthLFFPppnLqKsafK?=
 =?iso-8859-1?Q?WJDbHcW5tAb7EfBNbyBOQEp6dU8VXzExSi1DUqtJHW6TOVAlE0c00Vtl0a?=
 =?iso-8859-1?Q?pv2/YFy9pSqqJ7muOgBEgzhoGEeIY/H+Ksv/rA/9Qu4TXcowBWrGqfWFSX?=
 =?iso-8859-1?Q?x367uF4n3076acmaNtzml6hnDjPIrdjvmOjoLSnZ4yFN9D3vZCWp/5sK91?=
 =?iso-8859-1?Q?Bry+ZmavN4w/y5933m3iNhL7y25VFiB7XwHyfYqAZd6v6ecDnAw2JbP1ER?=
 =?iso-8859-1?Q?sYwcxQu4orJlBBvOZUgm9R0RiSC9xiIZoQ+arohjoGucsgB7M6CwB8yJn+?=
 =?iso-8859-1?Q?tFuC2GS23Tlq5nKgOPMoWZ08mPKLIl4eO8KQuwiK9grtoOCWzgYnQG+/5D?=
 =?iso-8859-1?Q?zp7WBuxAwscVsubwAoAaSdcRdQyHpQtwGvcsPdGI6oVRwOO6IC0+6qcMi6?=
 =?iso-8859-1?Q?DYxT12IQLb7M2iTQWrZmaG2lvlOrhyCZZUlbXVns7w8EGsiMzcefgkcDna?=
 =?iso-8859-1?Q?un3iQdcbnNRuZuN/olc24XCq+/8ZblYPI7KQrTmBYYP3HxAV9uELjoPvj5?=
 =?iso-8859-1?Q?jvHuRM4LMrCR4rh0Fn/k7+GmYM91lqtpy6wNEfnn+STFL/jF3g+VoOxKxT?=
 =?iso-8859-1?Q?8f8Rq+oeoz5VHTwmqTwtRAvkdXjyswh69fMDNVqkfzf6iJ/5ZYPitdb7hU?=
 =?iso-8859-1?Q?mwtbYWyd1ZyVctCUlKFFv8xcnTJu57PGSZQ56SrDkPfbRXVdhZ0INTBuBn?=
 =?iso-8859-1?Q?ve/CHN6mQhG4h1CHuDvxm05KMnHij9aYDzIFDUJZCIDE9r8OV8CpaJqSG6?=
 =?iso-8859-1?Q?1+74DcvwZRV4BDXZUCOSbWZQCvgrFPhyCk3skwmoMonfy7KjWdZLp3GHwq?=
 =?iso-8859-1?Q?V8JpigA4FK+V2l9OjXqWHCluyB7ehvhWS2vnfpPr8Vf9E62IYEFUWAR9G3?=
 =?iso-8859-1?Q?jnU3iWBt8d+j+e8Ni9bQ8NBjKQt4Xv52wuYtOUtn+sHxGg6I1DK0cb7Czj?=
 =?iso-8859-1?Q?mrDJhpp7IXhAwZW/1iDGZcFsteCpxDUBGQDyqmpLfEnBdR73ENBzYRPZBH?=
 =?iso-8859-1?Q?NGDEwqHRDXSWEfUugJ1UUDHXvCUsOwpzpJYYUSoq+l2t340iMSa6YRoprN?=
 =?iso-8859-1?Q?Pa/NivM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yXwCLoLu1ZkpjvREFC64bZ0sP3qD9Db+LMdRZlIsAAemucYId5ULUXVpzB?=
 =?iso-8859-1?Q?0HJo9w0wn01OSat8/TqA1YDT2VlJmap8+aaSkvGy6eMfXs0FHvwmOzc8hh?=
 =?iso-8859-1?Q?6u3M5haXtLEt9k1VkAD2FePtS4FW4Tbungt0fspbd6NPAxRFcDeUm+2tTb?=
 =?iso-8859-1?Q?Xy4aniOg13cVpYZ8FzWrm0OdRopkePDhZPdSxcoomythHQrqapR/4t/jwW?=
 =?iso-8859-1?Q?3vNtwimaxHg1o8zpM+3zpTship5dfXQ9I/mc2nrAzHkZwVPwqDU8GrfavU?=
 =?iso-8859-1?Q?0VQd+pJJfyvgjZwdt9WzyYvO5Bl/qwl4iRXU5cz3v4IH8Ncjj/aP1otL8k?=
 =?iso-8859-1?Q?VOBVSfvyOtsWGKc1/H6Byw8vcqjPtbKEhyywnbu1EI5FiLcbQ3F/5Fo+WM?=
 =?iso-8859-1?Q?ejc/Hoe8FxPTV4CQX2VDYhOuIUqBn9ne4mFuXVLZd1wygBsrdVwhyuDuKK?=
 =?iso-8859-1?Q?RGAZGFzceSLGJUm7N7nOCJvR1MUpvph00J++MJAurApBzxRxD5sX/xvFwg?=
 =?iso-8859-1?Q?gdxRH2FgQJifcaGLzUJ5Ipu956anRwDpzRshTnadNSogZE0Lj7wJcH6Ovd?=
 =?iso-8859-1?Q?2sg0KJGl6w2IfPg3BBKwKfSDJDNQXQAqe4SpHUHRQxtF9v6pssDd0AyxsQ?=
 =?iso-8859-1?Q?z5/mWhynpIzj4Yo8SH+ZyZUgp2oYFHYIf4u7EKKphzdEyNx/DWOclndjqO?=
 =?iso-8859-1?Q?bAzYMFdOsXLNbfU7T4LMoJCLyaP7MHaHXQR0X6D+POK+Q+dmVO/6nzIhG0?=
 =?iso-8859-1?Q?88w6+5Ozvf4T5cRNw2Y9iSwRZ48l+/9v4tr39jnvtxY7ZaYAvbIuq9NRBb?=
 =?iso-8859-1?Q?p4DOOKCbSTrf+gz3vnv2LZzVsFTEzNv9llh2OvrFrjYWMKHKN94hel84ok?=
 =?iso-8859-1?Q?b1M9mTsox9SnqTGc/7oxih+4ejgBDaE1W0lFEr8C8+0HvrnoM55C6FYCj3?=
 =?iso-8859-1?Q?Z6rAbuBZ55YyqcqU3uTDAh9mACST5HkkC4/ln591UXxwn/ABv7NtMqFKk2?=
 =?iso-8859-1?Q?YbCcOFC662ce8NB49sCU5QzXme1ld2jb60ooOoRt5O/5xG4fZadEKSmRfK?=
 =?iso-8859-1?Q?zMubEdoLECKLJKHwNBwq6htafU/fDlUzEZN0S1/MN/dzS4lIbzKkJ29TiV?=
 =?iso-8859-1?Q?eQPeFe5NPWTFry1bT7uxVlDUVcogqtn1P1KlmHk2ltBMXlh0tpSQ0QXGQW?=
 =?iso-8859-1?Q?VVD9JLiprL6qMnoacq8YRCzJvIR5ShYDykQAGJ808bOfNYyB8gsICuH+g4?=
 =?iso-8859-1?Q?b+Jk9t0rwgkkG5xLVtyVoB9/RSwvYAb8/9RDRlFTTbGyEbtwPSk93hIaju?=
 =?iso-8859-1?Q?To2avUXPhfhNCG95nYLyT7e6VxeEnkSFGCKTrPMrKZIhP9ZrCe8SgCYCKF?=
 =?iso-8859-1?Q?yvOhYQOC1zumGxV2JAA8IBdm/QEowuqRZQd4A2wMkZXTzXxfdbs3NZCIF0?=
 =?iso-8859-1?Q?Ul/rBBSCoXkeqQUrwtvghoVBc30RAyd7K7fS1H8wULFkUCb2qjNDZUqF9R?=
 =?iso-8859-1?Q?m4RYGSlk8Sl2ljTznZJtNbR4Fw2+++dzzSb7T8C/nxFsgR7S4+YSnTZn4p?=
 =?iso-8859-1?Q?sid1n6a0if51TTfGuVmDDgY+f0vhIQ1hKH8yVNb9hXI3x+PBicHVO1OmQV?=
 =?iso-8859-1?Q?5l/NDwBsBbkT1fGFuWzUxW9vFIbM/CwWDepn/s9RlEaOIqFRlJTpx3Jw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de90aab4-7977-4ff8-fc7d-08dd774ee199
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 10:11:23.2206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4mKf0aHQgw5vdJf5cWJguj3lTPfw/FdwLlFlsQTtNiHS56s08u7wcjpWG6NZDZWGwznJ/hyANi9zigdyys1RpZYnk+uzr6skrwFmHc7rz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7718

Condition coverage, also known as MC/DC (modified condition/decision
coverage) is a coverage metric that tracks separate outcomes in
boolean expressions.

This patch adds CONFIG_CONDITION_COVERAGE option to enable MC/DC for
GCC. Clang is not supported right now because Xen can't emit version
10 of LLVM profile data, where MC/DC support was added.

Also, use the opportunity to convert COV_FLAGS to cov-cflags-y, which
reduces amount of ifeqs in Rules.mk. Otherwise this patch had to add
another nesting level with "ifeq ($(CONFIG_CONDITION_COVERAGE),y)".

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in v5:
 - cov-flags-y -> cov-cflags-y
 - Clarified why Clang is not supported right now

Changes in v4:
 - Slight formatting fixes
 - COV_FLAGS  -> cov-flags-y

Changes in v3:
 - Introduced CC_HAS_MCDC that checks if compiler supports
   required feature

Changes in v2:
 - Move gcc version check from .c file to Rules.mk (I can't find
   an easy way to check GCC version at Kconfig level)
 - Check for gcc 14, not gcc 14.1
---
 xen/Kconfig       |  4 ++++
 xen/Kconfig.debug |  9 +++++++++
 xen/Rules.mk      | 14 +++++++-------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 2128f0ccfc..3a723db8ea 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -41,6 +41,10 @@ config CC_SPLIT_SECTIONS
 config CC_HAS_UBSAN
 	def_bool $(cc-option,-fsanitize=3Dundefined)
=20
+# Compiler supports -fcondition-coverage aka MC/DC
+config CC_HAS_MCDC
+	def_bool $(cc-option,-fcondition-coverage)
+
 # Set code alignment.
 #
 # Allow setting on a boolean basis, and then convert such selection to an
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index f7cc5ffaab..f89cbd823b 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -44,6 +44,15 @@ config COVERAGE
=20
 	  If unsure, say N here.
=20
+config CONDITION_COVERAGE
+	bool "Condition coverage support"
+	depends on COVERAGE && CC_HAS_MCDC
+	help
+	  Enable condition coverage support. Used for collecting MC/DC
+	  (Modified Condition/Decision Coverage) metrics.
+
+	  If unsure, say N here.
+
 config DEBUG_LOCK_PROFILE
 	bool "Lock Profiling"
 	select DEBUG_LOCKS
diff --git a/xen/Rules.mk b/xen/Rules.mk
index d759cccee3..da21850926 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -29,6 +29,7 @@ targets :=3D
 subdir-y :=3D
 CFLAGS-y :=3D
 AFLAGS-y :=3D
+cov-cflags-y :=3D
 nocov-y :=3D
 noubsan-y :=3D
=20
@@ -133,19 +134,18 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): =
CFLAGS-y +=3D -DINIT_SECTIONS
=20
 non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-=
y))
=20
-ifeq ($(CONFIG_COVERAGE),y)
 ifeq ($(CONFIG_CC_IS_CLANG),y)
-    COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
+    cov-cflags-$(CONFIG_COVERAGE) :=3D -fprofile-instr-generate -fcoverage=
-mapping
 else
-    COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
+    cov-cflags-$(CONFIG_COVERAGE) :=3D -fprofile-arcs -ftest-coverage
+    cov-cflags-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
 endif
=20
-# Reset COV_FLAGS in cases where an objects has another one as prerequisit=
e
+# Reset cov-cflags-y in cases where an objects has another one as prerequi=
site
 $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
-    COV_FLAGS :=3D
+    cov-cflags-y :=3D
=20
-$(non-init-objects): _c_flags +=3D $(COV_FLAGS)
-endif
+$(non-init-objects): _c_flags +=3D $(cov-cflags-y)
=20
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize=3D options need to come after any -fsanitize=3D option=
s
--=20
2.48.1

