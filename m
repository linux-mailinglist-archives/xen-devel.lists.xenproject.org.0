Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A7FA749B2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 13:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930547.1333185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gO-0006xI-Kk; Fri, 28 Mar 2025 12:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930547.1333185; Fri, 28 Mar 2025 12:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gO-0006uA-Gn; Fri, 28 Mar 2025 12:19:32 +0000
Received: by outflank-mailman (input) for mailman id 930547;
 Fri, 28 Mar 2025 12:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gne4=WP=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ty8gM-0006CK-Vg
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 12:19:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2614::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5bf5ee5-0bce-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 13:19:29 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7313.eurprd03.prod.outlook.com
 (2603:10a6:20b:273::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 12:19:19 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 12:19:19 +0000
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
X-Inumbo-ID: e5bf5ee5-0bce-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8NvOlarJar+BiNnC+f7gRPfIsBBKi1zZvVTY1bxZg+QiAKYF007vXhMOD/TEetbUwWy8J+4nhLcIlcIuBcK9L0lX5EdRnWiZQXHHS9kLD0CbLHZJqYv5tGzXjGJGWst7evIzEWlj507aSGGKvaBLotVbKNsId9uFsIeW3CnhePugmSTYdOhGb/mdycvFjhISOclEhFjh8Vzf927ESZKbeAW+vaB6I9XRPP2fZAYF47KfbOtvxMiQ2wt1KBMs8uOaR74E6aV86jY/vmnqcnOrXWvHadTFi2MUvzYxDso1I2ptmaWol3ZNoyd3pLvjMed7n3ISzy1H9vD/C+bka9upg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QGXNEjm7ttDKmdBwGlsNjsh7q36VyjAuzP/PBSR9M4=;
 b=wzgbZiEKHCK5XonavSguj/w9gwn9X8A9zAHhe3jrhP6q9OLKGNE5ZEztQ/UwX+jGCqAy7EYp8z/UavNnK8FUoWhcPIKzBz3f3ggRFgi0ZK1JmO12NZR3iC7rpMXW481UovTHwB4ZEMP6wIkXd5DdJYJZGZaaSolIYIztuHAc1/ICk7HjENUbYA4GoCPYhDGz/OiCngzoVAGZbjQu+voSW2MDdqJhY4Ap7weMoNW2FdhTfFd0c3sT1ll7dRFgZpnl53BhabAHS88DArwdWHReesFNkqSfweBHysAIjjdnrlKK7HUe76qPVFqcJXKCkzyhtN8YxVxpUgnUylevLUNLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QGXNEjm7ttDKmdBwGlsNjsh7q36VyjAuzP/PBSR9M4=;
 b=Wzem83yASdpsiYzomsR4fHTPgXwiCoeSidrefYqiiqZrPxcX8KocBRySlCpCeQ/EIx2XlmztxzM+chxQ8Ndv+AnzVnYbvSYaBMMlTU1DR1XGQReoNyYUUw7fqA+XMUkQAKqcaI55ZG2o4qmPb8OWs2OqyHlQVOGIBOfgJ6yag30+8DecO7B+WmXwST4CFeRZGPIvazXee0ouvvd7k1sTCkE1AyzNsO4EJzrv44/sVAcrkli2J38UpiSYjEVdLVU5Ch26NkZVRMakqXy8HGZjAV7SQEINpoQh6a+u8h4q1xf9S2jgEKx6PLuMyWDKnKmA+4hZYKkfO58+qGcrLZHO2g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v2 3/3] xen: debug: gcov: add condition coverage support
Thread-Index: AQHbn9uhgPsYBM+3ZUSZ+mjdepz+rQ==
Date: Fri, 28 Mar 2025 12:19:18 +0000
Message-ID: <20250328121902.2134020-4-volodymyr_babchuk@epam.com>
References: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7313:EE_
x-ms-office365-filtering-correlation-id: e2ca2012-e2f4-4fc2-bb7a-08dd6df2c3cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Pjc/pKIWk7r4d06k674jWDpUXrHieznNHVyFHysy1yocQXW/jlYNAR+meC?=
 =?iso-8859-1?Q?4hfwcSM01rXnuAWXH+Ny6yZvF55tWpyUWYoSwqUwueol2sjOS5NeJW9+T5?=
 =?iso-8859-1?Q?P1SBzuuD3n0ZnZK77xa05b4I8qYhVv0rdbfu7+6i6+mL1WRcbjJJBAZOzp?=
 =?iso-8859-1?Q?Pvr6XetZ1VIDLy8YkXkcLFNEeO/bgvB3qb06jSrb8v1Wh6C1BAInyfPIBW?=
 =?iso-8859-1?Q?DdNJwKXuDImWXKxzmyeAyv+0F/c1xUcLbHUED77P6nWtPN7mH/dWL6zfHT?=
 =?iso-8859-1?Q?CmA5+THMxBcKtzkEBzzHIqVS2/CIW0oT8BzBgZm0NZBQS3/toUwgdV+lNR?=
 =?iso-8859-1?Q?CV258wP3tp5GYOzcXKegJIy1dTWIRYLMlxg8w1jwTJf77E+hvlVDGMq3y6?=
 =?iso-8859-1?Q?aJrWne7Y5Qem6g10aATf6cYd24krRB/ti/ZJPbo1U0kO610AxOJpsVaKJB?=
 =?iso-8859-1?Q?GIjuJ1KGgc362J5mJkK32OIqfhBwhhOvQLa14CZ6pRpWL18YC1p0vt02zl?=
 =?iso-8859-1?Q?o4SYiBf0ZBDYZcaSj6aSzE2tuHthA6CY4CK5ksF7yW3c5m1g26TP+Xh+kK?=
 =?iso-8859-1?Q?oCTc7UdRIeYLkVKlKdIJeL42/xasO+EkLphjIvcf+tABRk/orVDn12CCCG?=
 =?iso-8859-1?Q?/BpB5mQ9xbcADb0h6ghnw4oV+RzEe/cBwW0Ji4grCscuYMt9jFA7Sq94XR?=
 =?iso-8859-1?Q?VQ52v/fkykQcnF0F7Y3D2zjO2IpyaXzgRHGhfcP4lfkpTbNhfIcNlMdehZ?=
 =?iso-8859-1?Q?Tj1jbo1ek3BNV7Plr3ccsxEY90h+1cW+dtfk32oxJZXfSDO13cCBA+vPeF?=
 =?iso-8859-1?Q?IGspDlroHJN3X/Ut+6Nlxc+bgNq5ZOYbLjBElbMiQ2I97yrM62fO+2TNZd?=
 =?iso-8859-1?Q?+PL2UUZONAcZG17Qf4/rsGWwfa4v/OoDozogqKOojwSsW1UAEFv5G/0W8G?=
 =?iso-8859-1?Q?MzBz1Gj4j9GKw2ew4ffHu0WnsS6uhYNS1m9IUpZ9chdQ9z3lGPrF+RPCvX?=
 =?iso-8859-1?Q?YAYtWyj9K3Jfw6NZCWQdk1NMT7Slac1C5k7vvQMrpjhEHJCvHjz/miT7vt?=
 =?iso-8859-1?Q?hxjbRXfyuMN4tZ5I/MjCFrEaJuFFpak96LSjViN+NX2Wz1GBVkK2GhjKKa?=
 =?iso-8859-1?Q?nntEiZCPr2MuqNkF9tBbefMtyzQbrg3oLn+P/z3LIc9soYS4k7MjylHCu5?=
 =?iso-8859-1?Q?y2hkv+BlkuUqGedKNRm//yL8yZs7Lq7K7SPVVG5HdTf24aZihEKFlzQAYu?=
 =?iso-8859-1?Q?WHBpx3EwcGmN1hjXpQRFrQ+z+NXNVWxc4skubG9knfvw7bhxmCgMaBwreP?=
 =?iso-8859-1?Q?ZAU63xTQavOiEzMeNCiWFoDHN6Zg279y+08Qa8Sd4Sm+fUsQWKI/u8a65n?=
 =?iso-8859-1?Q?FgcXEzVlFz11QCpvXJPHXZCrddv8dCvvw0ZaCotC+kqTjCx9a7bbu1jMjO?=
 =?iso-8859-1?Q?hoZlYOxdl/Q1rw/WLj63Egnh9BvoOtQGKQLQujc+uFw171BRDoZzRu91wN?=
 =?iso-8859-1?Q?d3/QS7dAvdMyHDz31dHffF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4MDnG4ovEsHgYvebK+z8cOksPAnaUAuidhOsXWWxzNwW9jSfsZq1xfmKwX?=
 =?iso-8859-1?Q?DHBdzA9hnQ/WeHnT/6nv2uN8k/YU2uB1kqTSYyxRhUXL3Ifmrflj3ED6zA?=
 =?iso-8859-1?Q?0O4qv9PenhcQL8APUoKKK/6EY/mB4bQde5XfWLzSaGlXqEWZy7WcnigiAC?=
 =?iso-8859-1?Q?OoguYnbZFJSSRLP7pDfvNY42l4QGJeB0syR+i8MxCdr6pyPPb/e7VWUAJF?=
 =?iso-8859-1?Q?zXnMRF1Npq2WETbZDzG3wWJqqDw85H8VcKvHHGSxTW6nC3uoUfXiyqRv6f?=
 =?iso-8859-1?Q?GgTMxV6N7sDGbyRQYmY54IWOQv0JvF+U412RLisbvbdZjkOFgABmnD0jf7?=
 =?iso-8859-1?Q?AmuJUqD/gtk+QmD9joEOBiUxk+1dqUoKLG6X1RyysmEPJU3ryhvcVCh0Od?=
 =?iso-8859-1?Q?2o/ZZsZdUVZsRn4YBN4u1yZPuMYMulBI3xpOgciuNTqb2F8CazEW2jXQVs?=
 =?iso-8859-1?Q?Og4Lfb+uOwkpS/UT3sdEC3Phwyiq1flsA+Fxiu+B2dKzCh5ND5ZHBeYTcN?=
 =?iso-8859-1?Q?zUShdJZe825kOHQ4yQgoEuQfKRhSmK5AgyUjyzt8Sf2BOjyGnqRZPFvsgt?=
 =?iso-8859-1?Q?ydDvJdX6qcApCSk2Cf6CI2t9qzdftqKP+M56eFlG2CC1Q6t1I2QwF6ZdH6?=
 =?iso-8859-1?Q?gd8Q/aKAqjRfnRgDe1Nf9VVZFolbpsHWopZ4+ycGiUX7rIFT3LqLHJa+t/?=
 =?iso-8859-1?Q?Uv2KqtCKN13ZDxGeGBd1izUpY0Ug6fT8a2tEgOZJiJ2UAHN+Uc/kv4zE+s?=
 =?iso-8859-1?Q?Q9WfMnR80uGHYZAJWUR8sdfhiiI51IPYB+bhO+rhswToc0b/IR+RATXXSz?=
 =?iso-8859-1?Q?zwj35RUecOYKuojL9+xXBeetzEFZVbDn/J5RFEni2EPJuZpyTKhG1vMrUe?=
 =?iso-8859-1?Q?50kMVzx+bYBF6K5YiKCBf5ATX+57zqNvNAWWtRDWOvudFqcqkDqPJmJpIa?=
 =?iso-8859-1?Q?kYbfw6n3YesEG/tsP5+QzeR67XMK/oSl8W7Xhf3DSd11UhHOaOQ/PLjgk2?=
 =?iso-8859-1?Q?y4VkeXHSktL485vz9NNf8TVnStAKfo3bPOr1MxSJAkvikFlEe8GCDCiun8?=
 =?iso-8859-1?Q?o/Vxz8eqtoWmH51IN1/dmK11udAyRIE0VZuVcM8q6ZH9lE9aXjXcpr0w2H?=
 =?iso-8859-1?Q?SZ0bowdezx29X4LDPzW48zZtz+alLxwG9G+Jui79EqfZrgM9PSZi4AdZZl?=
 =?iso-8859-1?Q?X3am1J0rNDZfSmT7hEML2zpC3XTW3IqjrTxguWXdWuYIKbOgzM3mUYpfCe?=
 =?iso-8859-1?Q?vkAgZHcfeSn5tyHv2J3yUCqPP/jhpEPGbElcHutN92E2OPlspu0y+vE7s6?=
 =?iso-8859-1?Q?wDmGY14ev4LbufqvtYs6fGr4gTO3W9zRjwk3V5ic+wNTR8/YEzkdmSapGd?=
 =?iso-8859-1?Q?AQH1QOtN8qQs4cgp1CTYGFDmiUD55H6JoD6OnzwE4WdSub0xRgC07nF0T2?=
 =?iso-8859-1?Q?U6WB8fQtu6mJhtICCBW8xLmHgy50OSbG3k2frERVfuem6xM9hgxSG9SckN?=
 =?iso-8859-1?Q?mZD5HJeSIZoPL+eWh16lQZeN5gZLGrXLOwglt2Acn0vLFpVT1IXdWyo3/B?=
 =?iso-8859-1?Q?X7HgVK+2iZ8kKOOaCpt6igbZArZslcB57XxQShnRSpLPsdCpD6ibu2KaWy?=
 =?iso-8859-1?Q?ZiUg0kUKJ1CwlPlgFnsAhSzNq5B8uYqaZ5l86HmR0L0VTm5Rjafgn2wg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ca2012-e2f4-4fc2-bb7a-08dd6df2c3cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 12:19:18.9969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LbByMNeZ44eJev52IjwiGTezUkXZWEeEv54t75RDNOlPb6BZeIJmxl+TfAfo0laAwFemkFpkw1oDQmD94RiahWyyTvnfg15a3jVseP4a4bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7313

Condition coverage, also known as MC/DC (modified condition/decision
coverage) is a coverage metric that tracks separate outcomes in
boolean expressions.

This patch adds CONFIG_CONDITION_COVERAGE option to enable MC/DC for
GCC. Clang is not supported right now.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v2:
 - Move gcc version check from .c file to Rules.mk (I can't find
   an easy way to check GCC version at Kconfig level)
 - Check for gcc 14, not gcc 14.1
---
 xen/Kconfig.debug | 9 +++++++++
 xen/Rules.mk      | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index f7cc5ffaab..7f758d221b 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -44,6 +44,15 @@ config COVERAGE
=20
 	  If unsure, say N here.
=20
+config CONDITION_COVERAGE
+	bool "Condition coverage support"
+	depends on COVERAGE && !CC_IS_CLANG
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
index d759cccee3..b6f83caad0 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -138,6 +138,13 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
     COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
 else
     COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
+ifeq ($(CONFIG_CONDITION_COVERAGE),y)
+    ifeq ($(call cc-ifversion,-ge,1400,y),y)
+        COV_FLAGS +=3D -fcondition-coverage
+    else
+        $(error "GCC 14 or newer is required for CONFIG_CONDITION_COVERAGE=
")
+    endif
+endif
 endif
=20
 # Reset COV_FLAGS in cases where an objects has another one as prerequisit=
e
--=20
2.48.1

