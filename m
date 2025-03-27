Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE25A727D7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 01:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928335.1331083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbJ2-0002zY-Jg; Thu, 27 Mar 2025 00:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928335.1331083; Thu, 27 Mar 2025 00:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbJ2-0002x5-Fn; Thu, 27 Mar 2025 00:41:12 +0000
Received: by outflank-mailman (input) for mailman id 928335;
 Thu, 27 Mar 2025 00:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKAi=WO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1txbJ1-0002GY-2z
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 00:41:11 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca53e0b-0aa4-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 01:41:08 +0100 (CET)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by PAXPR03MB7698.eurprd03.prod.outlook.com (2603:10a6:102:204::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:40:53 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 00:40:53 +0000
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
X-Inumbo-ID: 2ca53e0b-0aa4-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0eKmNW5+C4LCYhzi72QR6kHQ8mS6yP+quXeRTBxQuyWgxm85gA7xozF9y9cWJboSgChIwi0ag/sr+Oi7E25ZT+dOB/4n4U640EoWUowd86wIEluAx94DeRVfgaE30+2iev0bL6yGFbTFHdzDXE9EEVf61r4OTWXsEkzrOsgllTuyL2g0k43U26bTRfUW0ENvJLeso9M5HfVjX3Tsa63IUHF+1yRcY2ReYsIvGtnxWhw9ySGGxdNi4fMQeToim1fCceE37Zf4I2+2PqkMTZj5vBa82EOtPkws5MEkFo+yYjSWSHaqI565ZdJ7B8R0G6W/UwZqRck6/xHogENpTsVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1K3MmhtzYn9ZPBR2hv+3NHFuXqvZWBepKWcFj7+iASY=;
 b=E4irhX1N3iYRgA4aq7SygNw5egIiiGo8lK9gwzGsERBxZL4mu9V6FlAFxR3dXmWim/xfwCT5I1A3phviho0nZXQ3jwuBDWRHRhlmTBvvSsDLD5h0vyZVm9YSZmN4leTe7M0Zgw680/DbEIMW5+rQUZAnUrOHYJJU/vPrIZt59v37sgiZFzqnryGi50jiq4bv4ujgFlJqeibwbifGllo0SO88GSOU4aBEXVrZ6udvdNc5KVQ6HV58Dyh2d5+CY/7XZkckdkpjbZBHQPVOqOPq2SXZdbSyf4RSLgTss291yBaFtT6VRTGEMHyb7K1HZX6ZRa7IFVHzjpwYXcaBdvTo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1K3MmhtzYn9ZPBR2hv+3NHFuXqvZWBepKWcFj7+iASY=;
 b=CwHr016ns5O9HMiQkVqIGKurQc6UPLyReLY7Ylss2+NyKfkCkm1O8dwG7SW96nrj7Cwx0f4MZC1/dPWgwC2Pueq7X9ijuyxBYwJADj5wSXkXqZDq4tcZ1SOMdU/H7lCtnwzAZV5D0ZijUfFI1S48ahxii8k2SMj1/Jv8ynmak1pbkvWmdCIHXWMIbffcwUxKpcGTogOJFJcVK2uJeoEr8iAxcjnAXbqKAUO6AOhMm4HdfkYIqNicqTqanonmjPdHDz+FNK+guSY+pLpIRXSMv1aRo2/vZ7MfzZ/BmAbGmgtQB8OHr55fYx8epkIkZpx9+dS+UrT1IT4m/R2aCMl4XA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 3/3] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v1 3/3] xen: debug: gcov: add condition coverage support
Thread-Index: AQHbnrDjCZFHUEqigkeOtdvfE9127A==
Date: Thu, 27 Mar 2025 00:40:51 +0000
Message-ID: <20250327004044.2014048-4-volodymyr_babchuk@epam.com>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|PAXPR03MB7698:EE_
x-ms-office365-filtering-correlation-id: e981628e-2b7d-4a61-1853-08dd6cc807ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XqcutFNOr8lCnB9q3OF0kBXg1SBCaEqgjInoEn+GEAMqk1RJtfMId6RpdR?=
 =?iso-8859-1?Q?MhRUHbDjKxXHLUt7WKvjVk0CYweRTEHmVuGPnIaTbFyRmE2aEqPAbb9U9l?=
 =?iso-8859-1?Q?v7Fu3cY3j8ojbEQJaN0g4Xr0r5agKZue+ntzPs6/anU0Nx5aylIXP/nGdJ?=
 =?iso-8859-1?Q?FqSG7xnxhsl7HHJnJzY7gOlV33kjIenix0oi7o6+1myuwv/6fEfjEx4xwL?=
 =?iso-8859-1?Q?y+3sAAw3VB3RqXH6Wj8s2warTCLHYfAQunQptEJzfb2V6fwaGyMKeQMTDT?=
 =?iso-8859-1?Q?wY/h9ha0KA9jr9yp/l/iLSzZdOuVyWZ5rXcnyIJfQL5EtBA2PfSBSvXNvg?=
 =?iso-8859-1?Q?Zh9PfiuQiNDGC5/jvJ1S4IqO10LxwCYRoU9eVprNcBvxY5DCCnYtwotYxX?=
 =?iso-8859-1?Q?QnY1OygbYH56rb/vxOkxgd46OF0UpCNbLNCA02Y1eNpy9Yc4mCKymANZxm?=
 =?iso-8859-1?Q?lH5TDOu06XBKOfv9yaTmpeG+YHn+ICIWeqhdXNtq+g67LudpecJ0PN6IN0?=
 =?iso-8859-1?Q?Lv+lhoCXcU7QPtaozuDYLYSDJLvN8HcSw1AYO6Ydo0cvg27rbGYQueg0QH?=
 =?iso-8859-1?Q?0kGO7l5klcnEGG0n25tlNaK3WHxE3uEGdUukNSFp4iYp9CQPC+L0Xy7v5o?=
 =?iso-8859-1?Q?an5Ku/f4KUw8Gw8ASc9jG0M6ivCxdj3aQvnONqDLkCUcNiF1qaGD5ATPvj?=
 =?iso-8859-1?Q?YazKD3XB3N0VENwZpu7Fiz4WIcUgDh3OaaLta8GIYtU5M5nncgNaDJsIIv?=
 =?iso-8859-1?Q?BRLXT5vNf/POj83UV4cxdEtjCDWQmh1eCKRGyxsmXG/uhkAB4+JUNQQsAv?=
 =?iso-8859-1?Q?Cx6WXuQ4SrKqRUlVCPKqeLixTtClpJubN3lfeIfYbpkbzYvciBbBHujC2X?=
 =?iso-8859-1?Q?y60PwwGpNXU//0nWOUuxZ+FU3R1T9VFd1tqBs7hGLjVvgn6CJw+s9vg1o1?=
 =?iso-8859-1?Q?hRVAcb4DSIluWbACUeuiW6HnF7Kr0kykBLT38NVwmDwHdaQLEqR5hqUBi0?=
 =?iso-8859-1?Q?drl39hoxS6nXwrOwcgwIiSZG0e+5fIW1SgXILbqtI47hjjTsdoE9rbcmst?=
 =?iso-8859-1?Q?BlX2kquRw54g4oLXkTLEgDtv5fwyjXLuyFgz2tFZ4L03ZK0iaghxFMg0rr?=
 =?iso-8859-1?Q?HNf1eOHbua08NCbhIb0qEBz5OnmorClibA1ts9qBnFB21v6m3AyWGf5VTD?=
 =?iso-8859-1?Q?ZsUTzqILF8s3A9x2eriZdyDeu4X4htB/QlaCQaW6fPXdZSI/zvTUiyEhg6?=
 =?iso-8859-1?Q?dytyyICBuUU6HAma42cSyO0IE/l2Ay0+aN9xsYhP5Qa130ZPdK7cP0N0zw?=
 =?iso-8859-1?Q?jKFAXPGFVBACEQ3a1ourbTOfdL0Zqh6L+tt+sTwsrtEvDUdgBO9w+uBgNV?=
 =?iso-8859-1?Q?lBSKC7VvYRQWCctmWiVKOQVb5ZdDMAk/8ANua1rHpo1mBUh6xizOBoNwP7?=
 =?iso-8859-1?Q?HrTRMbNfanOvMfjgxNQq82oZAtdJc2qsJhEmFAJVNJL5sMA02ryjlpgfkj?=
 =?iso-8859-1?Q?ZUHKs2BxgllNCsMWh1tK/2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3HD0dS3IcOHR3wGnRHVbkCylCnAI40CEpAw+M8rFfYaViWC7lBlqWE9kGb?=
 =?iso-8859-1?Q?DxOnY2BI12IuXUUUGlYUyhVPZEjpw8gLNNGmG9kYP0vv8hsI9e3+GCatZ6?=
 =?iso-8859-1?Q?+Sg0LIhejHBdZqyPNxoyMFjEJL8HRO34igEdk6AWnkKKO0hcVR0b15uCmb?=
 =?iso-8859-1?Q?kYdSlF0x0T8/5u4qgpbjlqvD+P6yUG3fWXPRAUpntE8dXm7VaVNjzXVkjC?=
 =?iso-8859-1?Q?krshUEW+8jllt6oA7C36NUt8ghFhLgW99D6Pw4XMUl0ohc8fuNgmMb7mVL?=
 =?iso-8859-1?Q?UW3sJOCmEyaMpiF5bkfZ0QaAM7Y/SZ0dbTwKBHJZH+jAag7LOME7qhl1GQ?=
 =?iso-8859-1?Q?kM7VbpwF+QRzIxETIUmqo1vOT7R9hB/A41sv5z9Vvw5hAEGflV+FKw03Kz?=
 =?iso-8859-1?Q?W3GMRCjTo/UsPhgLjtlu3IbGDoaEhHpfP3ZSkEdZgESeLixHA69g01YHWK?=
 =?iso-8859-1?Q?gmsu45Z+4oarU+G9mMaHT+g4hmMTZ5U70jrfhDqdkSYfhCNAk8AcofvWc0?=
 =?iso-8859-1?Q?pqD3HMEcWJNacLWmWUHsnDN0K6+JgeRxvxeSa1QMe713m9L17U0Mao/djL?=
 =?iso-8859-1?Q?IauAzOBhQ5AJ5EUD3VP8Sd7KjRXes47g142w3FSmr+FrZQuQ1IIL755k9a?=
 =?iso-8859-1?Q?OqHkeX1SjgD+JtIcx68V9c7F+RJH7Ny8Q+3I1iBB9gt4scTDtSk1nT8gy4?=
 =?iso-8859-1?Q?G9e0AIU20LG9t3P/Nc1j2b+A2YDTm9NVLmSWWDw051JfLaix1786WQplPI?=
 =?iso-8859-1?Q?nwbtcaF6owq2REKLsMfbHKwWM4MnaWigg8bE1BR5w0MJOgVpNoi3pZ31yZ?=
 =?iso-8859-1?Q?rM9/jIOLGv2MCvfRU7uM3q/pJ2d4Vt5E6plwCBLEOjYCiqBfQOWJPZR6b1?=
 =?iso-8859-1?Q?QFTiHyoS25hTr574mBoIsVupjFuVuEI4NEtDgv/NX/bdOt/cQnVu2I62hU?=
 =?iso-8859-1?Q?PKvrMyb1pVcWCDPfeysSYXOtQhz2R5wlQULFU5EZ3XijCOkvgTKD8jNywt?=
 =?iso-8859-1?Q?ut7KUry34lz8LmCWMBv5jTShgtdwT6fGnT22jXr+2nx9KGGkMRxPs6kLG8?=
 =?iso-8859-1?Q?qBfR//Jf2D9tbc1H260SEBnVE31utpydlWtSTGHK62Ee5waFDfhYr0VtY4?=
 =?iso-8859-1?Q?11/8O9uUyBfhBb/Vv9kKIjcepVAr6g1/7daAfE8aSVIqLV3p3aCzwYCGO2?=
 =?iso-8859-1?Q?wwnA9Fg26Rt0sSU60fzgLsSA77XHQXCnfaej5rNI6XIPpAWmUNIX0BrmYD?=
 =?iso-8859-1?Q?bcpfr4WWFf0txIEVfnzqVXJtx+fbq3kxy5D9I2NBezjDVoND3PM2BgWo4L?=
 =?iso-8859-1?Q?17e9+T0N3SY+LufFks/2FYQd/V8ae3jYlRmzQTw5uGIIMnbeKH6UsBT7dD?=
 =?iso-8859-1?Q?M574ZBoiYOiotAT+/3FpTOzN2yxWkkXIvB7FqLXg847kgZssH+vEGEmc/+?=
 =?iso-8859-1?Q?yRqbWyBCMDTx6/JbaObBvT7y0dMQJKbTY+r0uJfhdpxyBrV/ZiwhFnGcbZ?=
 =?iso-8859-1?Q?9/M7Z1uARrGfTDDR2MXC6mAlNdt1F/a0c32b51+X+xf13ySw82ojmwawGW?=
 =?iso-8859-1?Q?mDTSxC/yFDyw6+/2kSk7DZXZ/35S7dkdiqDkuBQwgVn/m08armkyzvEdhD?=
 =?iso-8859-1?Q?qNfEmlX4VrT/PtDfFNm/M5uKUW2jNxkRdepCvg6Dx6fRRS6Jto34Byqg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e981628e-2b7d-4a61-1853-08dd6cc807ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 00:40:51.3936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbEtfYveFGKTRPZWx907UQNvClYJ8zTk5ijuklFQmHhlHjifHqbQgCK1m2mnlfaxUjN0p9Vl7NaS95XP4D8u3t6obT77EKoRIu2KB3bmWug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7698

Condition coverage, also known as MC/DC (modified condition/decision
coverage) is a coverage metric that tracks separate outcomes in
boolean expressions.

This patch adds CONFIG_CONDITION_COVERAGE option to enable MC/DC for
GCC. Clang is not supported right now.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/Kconfig.debug             | 9 +++++++++
 xen/Rules.mk                  | 3 +++
 xen/common/coverage/gcc_4_7.c | 4 ++++
 3 files changed, 16 insertions(+)

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
index d759cccee3..0a2933cffa 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -138,6 +138,9 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
     COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
 else
     COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
+ifeq ($(CONFIG_CONDITION_COVERAGE),y)
+    COV_FLAGS +=3D -fcondition-coverage
+endif
 endif
=20
 # Reset COV_FLAGS in cases where an objects has another one as prerequisit=
e
diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index e3ce69dc2e..d10a16c9a8 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -43,6 +43,10 @@
 #define GCOV_UNIT_SIZE 4
 #endif
=20
+#if defined(CONFIG_CONDITION_COVERAGE) && (GCC_VERSION < 140100)
+#error "GCC 14.1 or never is required to generate conditional coverage dat=
a"
+#endif
+
 static struct gcov_info *gcov_info_head;
=20
 /**
--=20
2.48.1

