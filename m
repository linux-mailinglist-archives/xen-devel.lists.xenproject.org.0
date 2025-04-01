Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D486A7724D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 03:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933349.1335349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGN-0007WD-Vy; Tue, 01 Apr 2025 01:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933349.1335349; Tue, 01 Apr 2025 01:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzQGN-0007Tb-RJ; Tue, 01 Apr 2025 01:17:59 +0000
Received: by outflank-mailman (input) for mailman id 933349;
 Tue, 01 Apr 2025 01:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZL1=WT=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tzQGM-0006nG-Ce
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 01:17:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20630.outbound.protection.outlook.com
 [2a01:111:f403:2607::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 245813c6-0e97-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 03:17:56 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB6703.eurprd03.prod.outlook.com
 (2603:10a6:102:ec::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 01:17:52 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 01:17:52 +0000
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
X-Inumbo-ID: 245813c6-0e97-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oj+tm7K88H1MPomCItq+65O8sldxVITws5ECAYwPaFuFd8OMpYF6sTrLRHxaBQzcwoRO6o01Bep1Dd9K+PLR2DsjXewyw/JT2DO88KbfTHr9uNvBHmxjssO4Wmg6odxAjRFKbZuFDm4BEeFF4EB2w8o7eBc3uljOCSwGTERvURgjePz/whmkrLIMQ5UNUrh7dd5fxp4WGh4Nzn82dbzI5U5jQn5q8C8cfKQs7+Ru32RLt3UKFNonNzu9sAx+v42VPA7r/QWKyez2TOaxSLiB9a1hp+cFEpw8cMR5boi6iF2AMPjjMezK+Pe9iWWrOxF9SS2QfvHY2iujJpcf1i6cVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGPtfu1XySmVw/zK9unEnF48Uef93WdT2NZnuvi0GjM=;
 b=e8K2eMp3aRnoPoUtuAnQxa2oI+MtKt7CQW9vMI5/JdBXLSKw3MFvmrLn/TZk7nmczmKK45rElcmtP/vIXVlc9wHnyWGk6Dak1KmcAwQYbhKNwpIwYRqeQTFkeb2DCMFUnUCuqLSokXnIqSvcOI8UamgdhSb/zZMkHrKJ9KMRMYq4IKsNSvrpLxqbvLpnz0EodwIKorx1tXoxvFAt28rBak4dk9DdNJAy6gqsOCv7QNJ26ucgh0zQY5mWsV9Dvr5WU9IK74jlc2WpcQjsls3rqFxRyUR2XafV6M0A2d9i0aUHImxVQzUCnxdCKn/xC6qh8HuK9hqych/VFEOktOrvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGPtfu1XySmVw/zK9unEnF48Uef93WdT2NZnuvi0GjM=;
 b=QIyQF/3BBmLCCUbx7fSOsupVbRyKEukdcYmFNy7RLNSoxvgoRWNH+F8NnF0h1K6kJV8qXNmiwKt6EdGo1cbKUsyFV/yfT60k2BsYhCnTY6rpncpRr5MPDblFEl+WJKA+xT2l+k9Usvb2VWcoTgI0R6f0oG3g4u5wajGx5VqlGQVM5ksxtUQkBZbCP/qQBI6sDcgJw6TsG0JIu/49Q9O+ZtluurKxQdp6jn1BPNBjhv7ksITzBmigEE4kaddErnA43oyPK+1/OP3oVMnNyfkn5WJLzX5gu5KJsMOgg61+IBD5L10OjyZQPiGrx8JDEaeU6c1qFtRup9o8e1Dwrjnjgg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
Thread-Index: AQHboqPjQYlXeZrAE0u+zEMqLR0ZhQ==
Date: Tue, 1 Apr 2025 01:17:51 +0000
Message-ID: <20250401011744.2267367-4-volodymyr_babchuk@epam.com>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB6703:EE_
x-ms-office365-filtering-correlation-id: 399a3fc3-8d76-4b02-68f6-08dd70bb064b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Jg/adk7Pyci12INTJhjq7QhoMvO4U8qyLLFmtl62heHCbflCPXprux4npv?=
 =?iso-8859-1?Q?Cj3qXUGEN33w7oH8i/p3lt8i4Maxqm81eUBv8S/VZE5H/Ts6kDujmTeI8T?=
 =?iso-8859-1?Q?eArPLxjPI9IAxPh+QZanQ/DD0nU1TncB9gY2zSYmjfmKbMGSCm7wjoCqBj?=
 =?iso-8859-1?Q?BgfqSnizv6oU0KJnKKXfRPMG8Zm2zqhcPpZ58ZqcezLAFcjmPz5UnhIIT4?=
 =?iso-8859-1?Q?4Jsl6HalAXsszYYUpNxreqxqJYzvDsHqG6FZS7YXQQQApkrbNdpA+Tya/U?=
 =?iso-8859-1?Q?aunDnsRx/VCgEGI7NQ4MLMkz2KQbWCvHznRi3w43NONOUBzI+yzwUkjekK?=
 =?iso-8859-1?Q?7Lcfv8Ps/GTqEBVcuwd4c9WWAVb5mFC79gKtcxNTu7J6ay4dtBo+RKLBH9?=
 =?iso-8859-1?Q?yDdp1WrtwsGLBnaA2PscFTkLkvJlk0YFjVCNI0osGkJOJMdCNy8apM6Bol?=
 =?iso-8859-1?Q?uT06wvMfsrTzhKqx9VwTsu8Xe4Snvk+t2iAI/kK/VJ2Q5f15AsfUyn9fus?=
 =?iso-8859-1?Q?YpVuJWFyt9XlA05sB9D+SwPeqPJuXpa+2qaoN+teoiGYODMjs3wjdiV2SZ?=
 =?iso-8859-1?Q?xNp0mnKICTEKDRwey+e5z/oXHYu014CkJtu6eN/grtWTpNO83/QNonZCSw?=
 =?iso-8859-1?Q?aLi5Z9SOIHe1H/srqAqjx9s1ulHQGOLS0lqjvJgeP+cTHVi6Djj9gj36zo?=
 =?iso-8859-1?Q?yAv5ImxPoSFEQaLSH+zyypWi3FIRvjyVjPDirFiOQ+mJ6P4JgJM2lG59bH?=
 =?iso-8859-1?Q?kfTztwx7HauhZyR2zTALGBoGM/p2RReLURsfNOs+pDvYPYviwgsd/wq2y1?=
 =?iso-8859-1?Q?V6OxonVH7bab0HPG4VrXJeB4UUPy/Bfc/B1qZW6+3zmfbo3h3ptMQH1AeI?=
 =?iso-8859-1?Q?YJCXIhWAV4JDFQvfQI8LV6OAj7U6MpHXy/dmXH2YJNQ99J6l44ZcJXOeJY?=
 =?iso-8859-1?Q?XfZF56T0VKAtNchsaB3p6mK9nMEBwwnPPLAsQsD/3pDI/j8lny0g6kpaUl?=
 =?iso-8859-1?Q?eQ2UXbvtFuKgYMH8T6d9udCfVpWnrgz7hlhQ/2V/UXAYX2InTCf/UKLBbI?=
 =?iso-8859-1?Q?Nzxb9veyCwUz/I8NVsGkoOn9lBSvUTSKC38E5AcNJ3D3Szs5J4WKGmkJLc?=
 =?iso-8859-1?Q?gYT7j/vqhePrhh+KFsz2XlGFM1QvBHgdWNbHRXcuDjUZK3Xdj2XUtCYiQs?=
 =?iso-8859-1?Q?QvIL42lQtCWgRWERxHbawq0ys4+z8F4PgNTfI4DH528XqLPuoZpZ/cPo+N?=
 =?iso-8859-1?Q?GbmjRfhx5/bqVjIM0FOhV6Wl3Z58CColRSEcCoPn8DcN/DmOcRZ19SMm71?=
 =?iso-8859-1?Q?UKQLma1lhSquEDxl+2lI/h6bMemLKjBHHmdI4pAD1z4x9w4b2CFAaPxQ4i?=
 =?iso-8859-1?Q?pCcuBXm+QT2UOlJm2xlFqTzKiU5QU0prQIiLbjBLQjU423H32IH2IyKGZV?=
 =?iso-8859-1?Q?iYSupNSwoDSWUiTPzlk0WpKUXCQejo459XThhzviqGNQ5gDpjqB+AIcHem?=
 =?iso-8859-1?Q?XHhaLzBbHe5UT5SqtGp/5r?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hMD6/aby3vH4GXE36eywehfK2XS9uI4P1nw7FuHiB1ZMU6SwBuMm34rosL?=
 =?iso-8859-1?Q?ysamHclTW6Ot02r0lSJUjjF9N/Q0LMD+Zm07737cIdxktu4SYmkjY5X70a?=
 =?iso-8859-1?Q?XG+QU2ogB4DuBwTo6wh6T6zRIisJDpxJ+y9W238vqhOinPFYc1VfdyyB53?=
 =?iso-8859-1?Q?uqSRTAcqlqKyubFceZTkxOiJcMeeGhRObrmV2Bcuijxifp/nchzLD+KyPR?=
 =?iso-8859-1?Q?Ka7npV/LRj06GCXwaor2YBZOOD4BoCYz3ecItOOi3Ib6qtvImZczRduMQT?=
 =?iso-8859-1?Q?quEZ1z27B5JTwKj10RUxSRvvkRatJ6JmKxh4mJO9AZV2nvxUkReJOp9UAS?=
 =?iso-8859-1?Q?48Asx6y30ZPcF3lddyPw4UY4BcHr6+MEkDBbZ+BSCgS/G74DYs8uchQNUn?=
 =?iso-8859-1?Q?WtUqoEIHdfNW/1Zh+4NFqH9XTGBke6uMwlrN7rVGG2xA2bgfZX+duRvAcG?=
 =?iso-8859-1?Q?HoL+hPj9mVV1ei9+ScZIWe6hd6VDqKuQvrHtrAzjYqZqJfBsadz0+PjS4u?=
 =?iso-8859-1?Q?uNjOfPnR9D+KN4ZWJ0/dth2fuEhQ/faj/IenSmI5wqKnPtL3qDsz19ZIEn?=
 =?iso-8859-1?Q?cSEomY60XPnl6jPzWwKNpShskuDD/15wY7utiiVPPjiMDp/mKLqyfhx6xY?=
 =?iso-8859-1?Q?IxcA2HkSHNyLhRGTe4nO1lCqitRSl1ql3LcP60ZFdzg5S2V7wegWiIpSkn?=
 =?iso-8859-1?Q?zWrpCEFE6k9L+mQbTn9s9hapqvLfoJGOMWCdbE1/WUTN/bUzznbkEhUGlY?=
 =?iso-8859-1?Q?yRATe+5OVIFLZvPozcGxid4gFNAjwi+RIVgV6A7z7OV8yuWUSwtCaJ4hje?=
 =?iso-8859-1?Q?crvtYLVcl+sK6YJc1fJUdfthziqUSRphEHxCdxcfCZ8+TPdvz8RknrkUb7?=
 =?iso-8859-1?Q?1PSmpMgiMsV9cC3IuIxWg8l6S/NluJP0tiJVTT21/Q7pEq2spAHsDNW6cr?=
 =?iso-8859-1?Q?ay0P98jp5Ux3l0GNfGs0CRI5nv9/jarhZ5b0aHdKvPQJiLA9jhIxBOB6F3?=
 =?iso-8859-1?Q?VUrgcRZGCwC7GmIVIWqAe5EvMjTMXpjJ3/yBgLngSVCWZ/pSxTZ/29xej1?=
 =?iso-8859-1?Q?PYzg3fPvS1/DC4Xob8KLcZjj7TArTYf7thZt/b5G2jT4kYWHZCNYrD4Zj+?=
 =?iso-8859-1?Q?FSzVm66kqR6qMoMqe3NMX76BvcD60KnYmzuJcWV7XxN1CVPRIbQInAPEsR?=
 =?iso-8859-1?Q?zj4rZ0IeR3eXIh9zFfXgsX+Zq3g4YbeMqlPfzB2rJBaSYAXdg2oWICAVXk?=
 =?iso-8859-1?Q?U/I0ZInME7hm7xcvEDk/0Bu5PCR9MqHenDgFU/YCwZpxeKzJfw6YlrWISX?=
 =?iso-8859-1?Q?ujGdlfW0VgFIq+FKauS70IhG6odjVSN2Vo1EW1x5zrQJu87o42EiRl/6HN?=
 =?iso-8859-1?Q?FO7SYIIlJiX0GSfH4NInNPvrXdVsdGfRhScMSk8Rhs+4u3E1wNJswZ04Vy?=
 =?iso-8859-1?Q?odwavlBe9U6zwo8YWon3yAWvNrbsk2e16IeKt6oCy6/faMXJVSNBKwkoaE?=
 =?iso-8859-1?Q?tlOEEFmaGHrIGfkfzU0hhzBqD4cfRBeD5aJjFH1iVlxxB/iU/OUSfcZqU9?=
 =?iso-8859-1?Q?OIj2Z/+8W5/x/q9IsBPwEKXzhWOwfcRg8qvfZs7ImK47ArB72jFEXk1IhR?=
 =?iso-8859-1?Q?00aiA0srN1IH+rNpe1GUc+G2TFMtXb9SLsAU6qH+w/CrKJ/DvG607Pvw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399a3fc3-8d76-4b02-68f6-08dd70bb064b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 01:17:51.9544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7+UJ9blVH+nnhdI5iEPRDZCA9vRPblO5Gjod5i2A8fMYI+rg4NXqSNdfswlmS21fV/GDNtAmorupBKIBoq5eeymKCeRZ/g5kca8iKM4zFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6703

Condition coverage, also known as MC/DC (modified condition/decision
coverage) is a coverage metric that tracks separate outcomes in
boolean expressions.

This patch adds CONFIG_CONDITION_COVERAGE option to enable MC/DC for
GCC. Clang is not supported right now.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v3:
 - Introduced CC_HAS_MCDC that checks if compiler supports
   required feature
Changes in v2:
 - Move gcc version check from .c file to Rules.mk (I can't find
   an easy way to check GCC version at Kconfig level)
 - Check for gcc 14, not gcc 14.1
---
 xen/Kconfig       | 5 +++++
 xen/Kconfig.debug | 9 +++++++++
 xen/Rules.mk      | 3 +++
 3 files changed, 17 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index 2128f0ccfc..2bdebfc808 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -41,6 +41,11 @@ config CC_SPLIT_SECTIONS
 config CC_HAS_UBSAN
 	def_bool $(cc-option,-fsanitize=3Dundefined)
=20
+# Compiler supports -fcondition-coverage aka MC/DC
+config CC_HAS_MCDC
+	def_bool $(cc-option,-fcondition-coverage)
+
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
--=20
2.48.1

