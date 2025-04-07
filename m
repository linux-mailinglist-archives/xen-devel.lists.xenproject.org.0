Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58257A7E718
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 18:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940614.1340328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pcK-0001C8-5U; Mon, 07 Apr 2025 16:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940614.1340328; Mon, 07 Apr 2025 16:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pcK-000191-24; Mon, 07 Apr 2025 16:46:36 +0000
Received: by outflank-mailman (input) for mailman id 940614;
 Mon, 07 Apr 2025 16:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=taXB=WZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1u1pcI-000129-R7
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 16:46:34 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc85e0a8-13cf-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 18:46:33 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DU0PR03MB9590.eurprd03.prod.outlook.com
 (2603:10a6:10:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 16:46:20 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 16:46:20 +0000
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
X-Inumbo-ID: dc85e0a8-13cf-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od9W51kk5joAIGQh0E7bJeWzbfCcllFm2s3ndjiWQoAJNPwJDhfXD36WPKKLLjIkqOj5jtUj/HUcZ6sXzJAoeI/A0Y5j+8eOd7xAQaNey4F9kvro+LlOzhnbGZaqSv4iJUTbFweC4lv5QGEalLuZg6Gc1nFakWpsrtrSZ+6m21jzXtIvMnLwWphKo5QlPDYqAQQgK2+eUhJKDJugmMKImeAia1B+t7uFYaMCfUJrmWmWehKw5/QtXNX5FGdmMvAP0vlKaCzHaPcUa/7Dx1Y5GZpiJR049byTmkC375+WblYgWSNwiwggQ1kTD9bAkPw1bxy1977793wdHQupD0jogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ4uLEX5JnhvBk61CPh0YO1Wh8KhNw7TarTuxdN50Gw=;
 b=bYUIITxBlJPqjSojgTH+rSFG62rmPeSEWAfcmJMlAaHwjCoDHVQcgIFAJWJ+9atCViD0KKu95ihzoRbq47Jy2AIDkSspjPrTXvsCVEVbN0U2yqD4eHsA3H5GVTZ6NjYRibhRdh16vn+uoILDqFjZ3F4jiACMhlbaixb6ddYwkDv9HMaVglofitFY1KXJbvhJUILU7PvzcKv+ZAMecEl9jjetB0uwoEyoNkQQuru6OR70OekfPRyUTLht1BpD7KGO9FVRnImcfI2BAp8B+Ixf+HCPPY2iQtAuQ/3dD4LHmqKLAiulEmpOlLOW35+Jh+At0GDIfDeb1hsTi8pI8bBO4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ4uLEX5JnhvBk61CPh0YO1Wh8KhNw7TarTuxdN50Gw=;
 b=BiPznjsViRgdQ519DLUE/9f6DmnAw94kpqGMgqFeGzYgd2gDCqaLZRDbg5K/OQTdIognuO6jO/d3/TxMyCfSEAWcZLh6AluPz5NdCOF8Z9JlNPIy8RyANR2LyKu9gemTKW6jJ7GUnxerzMimRW7RiSguO+hBZvKhRBY6bShdHpXrYF57hMChlaRm8ChpcyMah5ktAQx2QJbz3xoDMyMZStr4xsnyVnBU6KhJlnmFc+cqvSXLGW4fIZ+XrAeb1/KS5arh3hthKQzhM3AbQxZCKud+bOipjNRxawh9vrE2Jwki75Gd3DjRwE6ikPt03EG5EzRWxl+HY1EWPWcUzAuatw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/2] xen: debug: gcov: add condition coverage support
Thread-Topic: [PATCH v4 2/2] xen: debug: gcov: add condition coverage support
Thread-Index: AQHbp9yW2b5GBLlgDka417bnQFIpfQ==
Date: Mon, 7 Apr 2025 16:46:19 +0000
Message-ID: <20250407164608.2558071-3-volodymyr_babchuk@epam.com>
References: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250407164608.2558071-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DU0PR03MB9590:EE_
x-ms-office365-filtering-correlation-id: 44908335-511b-4171-8522-08dd75f3b971
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kFjOdsQwwquyIARtH6rCH31FBLUMC8CYiaS+lZ7rJf6YThgiNmVDGJHGN4?=
 =?iso-8859-1?Q?ILh/HsGlqXLjX/9nUDz6ojFcFYvgtQVTSqW9ylP5b+2w3Vbqsms3euA5Pl?=
 =?iso-8859-1?Q?RWi/Os/5zAK3KueFn3ZgXj+mAr8dJ4iX8GZ7sKbt3gspUj+ui47i8QRDjk?=
 =?iso-8859-1?Q?/2brSncJiW6RJFXULsKf03tAkdzTjwo9paY9u1JQkwkD2nrGvdBq5SsXVR?=
 =?iso-8859-1?Q?mMzTF5W3wmknCZoYnVTdi+YlYH+kqu1pABVmY2jU2BPd5Z30I194+f8bsj?=
 =?iso-8859-1?Q?tqbTazVYVhFCAs83jX6CN3x0K87XvWzU6JBn2fWuN/UEsaHljctRY0Y6S+?=
 =?iso-8859-1?Q?a1s/vbhfIkqOAHBMFAy9/KWN7s/oiLGm0YHJk8dxc6n7Kh3TOWlUyF2d8u?=
 =?iso-8859-1?Q?Zrl84R411NGre1tkIosmwNkPdp6oPBAjlhosJWCdnzderiCFG6u+SjIDNh?=
 =?iso-8859-1?Q?6SshYiyxYc7EPvzZ51vAzG7wnFKmUuyxPAOTa27lqvQvsbzQqVjknWjUPz?=
 =?iso-8859-1?Q?AfaTmC4GpvpGh1FwSzFyiik8FKpRhhSuY3l7FUpe2WSyvR0ftKy12nDCOr?=
 =?iso-8859-1?Q?w4WsJV5yx274JinL0BkFUsffFBp8VIWlxO/81xh4QlK3JJCj0wb1Tl6BNe?=
 =?iso-8859-1?Q?Y3eo3k4UNPyGorTlGi+WdlqtJe2m//aaZMsiR8Sl/1RtvXk0R11QJtDXMh?=
 =?iso-8859-1?Q?SDXxwuERu+3Ip0huBJRSL9RONeREYf/Ip5rutp7c61ayIUCRQuDMxiJP1l?=
 =?iso-8859-1?Q?WRR8tFnPMrW6AlAksBkO5Mh06wHr1YXAMVOXFdEBqhiDEhM1YaPwmafNRT?=
 =?iso-8859-1?Q?O99zI0i43+fsOAunm89azaZiuK7wALvLnkMYI32zulO6/xoyCiKVPHScCh?=
 =?iso-8859-1?Q?1I992g6/NdgKz3yjkvmcgCj1d0PaYFUNkuYmr4w604Z/lp1VEfLwaOBKa2?=
 =?iso-8859-1?Q?Yuy0CjswywkrOi6/HGr2AsaJZ32MLtVyNfF+dkcRWf6kQukPwZlqt2ejHY?=
 =?iso-8859-1?Q?3jEP1foVC/jqY0CTo9n+rTPpLBViXc3lH1fCj9aq5xOhT4t3J7DTR70+2L?=
 =?iso-8859-1?Q?sy2T+lwXQO+qdXA48tOXzkKYMqfo+LiCtWNlyEHYHtzBPtmgTZIL8gq12n?=
 =?iso-8859-1?Q?vD37Yi3uW5s0B7uyq0Uk/XtEE1PXK32kuEn5YpDnxpooFBlWn+ha9yPDtv?=
 =?iso-8859-1?Q?+qakHkdhWWVTVdzsYDuhm72s1g7UpwOzvEhnExp/GIuNO+jG8P/5NvM0ed?=
 =?iso-8859-1?Q?Atsrqb+oKCb1fEjb5cPCj8p2dtMnilfbmX8yaJDbcmun1wjOP2T1PVa4bJ?=
 =?iso-8859-1?Q?J1cUs+LDoXafKXYJ8L6UgI+D1z1RSuQ8Ycgc955QgTwqYK2jmcNl2oD8j9?=
 =?iso-8859-1?Q?VH3PgrTMhxTb8SkYWdQi4hhYcDFaqOVuzDWhXuMyWSanxoCWGtGlHP/gTy?=
 =?iso-8859-1?Q?cA48SCSYo7u3XNEbIZVT/GPq7yel+7U0PnaWlm1z1Ako2ItXPDihOE0uqi?=
 =?iso-8859-1?Q?BfH89kKOfox4fnb2WZgJlf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FGvxpfUITQjAIQsPotJlQJDe7ixwuryJX/1PQkoBsWFuyvL3uZdRRvHYh7?=
 =?iso-8859-1?Q?ldhf4xamd0DhjnirBDqV0Wzz5JuyA9pVSnficzQUhH4ULrZZby6MnheI7A?=
 =?iso-8859-1?Q?IwdzIUfM4VNmpyTyND0spgC+S8bj0yFb6Gtrfs+LRl3uGKjyq7NG8Xek8G?=
 =?iso-8859-1?Q?4KUGG6BxTXK+xw+Jtp/9YPUQQOs7CRGI27Ik+bgCYV+B4K2UcWpcqdrTwF?=
 =?iso-8859-1?Q?/iAWfJbUSKbpWfC3mDHOtpRv8VsuJg72FnzTHRqiSqIrpNUW8Hd6i7phqr?=
 =?iso-8859-1?Q?Ax2it+LJdmmlejfPXu4bb9VWb5v1GG3f4fpIaudvRFsy519LuNjB+nZU+X?=
 =?iso-8859-1?Q?MIbd29b1TSTqUS1rAjIrcW60S302G900r2tUtlRryRVX+3DnSN2I6uG3tj?=
 =?iso-8859-1?Q?0R7+KIRar0voz1FmphtayovcIM2BUZaKHWlS4nQNFXEm8tys+zJNWlP3I4?=
 =?iso-8859-1?Q?1aY1YVf4Bg7LPtlUKneWuCL0ErTwnNaRbRA0bVRR0jmS0+mPRwyNOKDllT?=
 =?iso-8859-1?Q?Pktw/Vq7G+LJgJszRHraErt3/HgDoZzRy6O4H57y9Wc9zE5thlgE1vYg+i?=
 =?iso-8859-1?Q?kYKg68lGpRExHNt7N1C4ZLs0b0iXhOhi6cMN7Hlds6ACLNNBkoL68wERva?=
 =?iso-8859-1?Q?lTr7zrnoqiIQHFQRylwhbJJXN5b/bdNQ9pVEZBNkcpw1rlqkNgeR9UNwyK?=
 =?iso-8859-1?Q?F2NQm/rF5WMDPL0FJblnXMXC30EtQn2UiguVBm8TNzHWSbYW3yhdcHQvJc?=
 =?iso-8859-1?Q?uQk1pFQYrXjcshQrecDQcxIBA1S52AW5kRRtq13VNbAp6nFNly/p8LbQw5?=
 =?iso-8859-1?Q?SPoYIcYGdabxgDk38r6Vl80gYrxo74k3J17zbLT1htTOWFMd3GRRRDblpt?=
 =?iso-8859-1?Q?JVxVQPQUn4MypHqt8Mt1XKkgdk5Ni3vySkJ8f+GwaVp0vs4EEgHc9m55n+?=
 =?iso-8859-1?Q?AsBbv/OQ7ElH504OAQuOlM+UFYmNRMI3BBcxj2oWjseS3kWRNh30NqEc6E?=
 =?iso-8859-1?Q?4lfqfNMeR5hiQH6W1512lZCHn5kABlipZ2H2eb900C2jQOHc/7N/XcmOba?=
 =?iso-8859-1?Q?5+XqiLlbyQz6jE9fIrF7PAU3xJvPT0K8OScZG2iEvecB7kwbAHdwtwagTb?=
 =?iso-8859-1?Q?5t4PSikcQSWesOwbYLgNf8AWufFel1RNTmccOwQIr1o7N9xBEyZ8XowD+d?=
 =?iso-8859-1?Q?CnM153gEgnEtvMR7GyDGOL1G6jCyeSud9mR3BWw7vT48slEclZTSwK75zC?=
 =?iso-8859-1?Q?M4j31WB9ZeBjYMzfDyuy5mQiHq4LExAtCAKMUrpuSXlQBjx1Jivn6XqLNd?=
 =?iso-8859-1?Q?uP/hVvMIhYlGANqm/oEZC9NhWlzl82uZ8wcYs8UMP/mOEo3/zamoNABxiF?=
 =?iso-8859-1?Q?WUFUODpy2ebK8uT0vFWDOKN+P2bPnOpPEf34GaXGscFyT+BrpevBqkYTP8?=
 =?iso-8859-1?Q?hxXSVdps2kqnNjxt5oml4QIo7NVsupnpCAl6lnrl3/w9TZzyZwU6g+taLB?=
 =?iso-8859-1?Q?W8SOeV3YBKEXJubQPtF6FFYj5bDLKjLWXa/ZFh70LDQk2eVe9i2VGQGAvT?=
 =?iso-8859-1?Q?oTsfBEpSC4LT8iEhwNcg7L26KAu0pviLvNvpdtYrZZA6kUEkWDXdIiEaUF?=
 =?iso-8859-1?Q?bP72YX92PqzOZAgocBSB9caCa/alDr1JsU14BUDUb2AHI635qeMCE/Uw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44908335-511b-4171-8522-08dd75f3b971
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 16:46:19.9741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLYjZPGS3isIz6umvGz6jBwXObgKjRJTDboND/9YJJBsWK1DJcp/74/Mcb07MLhsN0SmUVBvONEhV5Pl66FkisGi2+OhQzYPuFWIsXpBRWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9590

Condition coverage, also known as MC/DC (modified condition/decision
coverage) is a coverage metric that tracks separate outcomes in
boolean expressions.

This patch adds CONFIG_CONDITION_COVERAGE option to enable MC/DC for
GCC. Clang is not supported right now.

Also, use the opportunity to convert COV_FLAGS to cov_flags-y, which
reduces amount of ifeqs in Rules.mk. Otherwise this patch had to add
another nesting level with "ifeq ($(CONFIG_CONDITION_COVERAGE),y)".

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v4:
 - Slight formatting fixes
 - COV_FLAGS  -> cov_flags-y

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
index d759cccee3..e9e049368f 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -31,6 +31,7 @@ CFLAGS-y :=3D
 AFLAGS-y :=3D
 nocov-y :=3D
 noubsan-y :=3D
+cov-flags-y :=3D
=20
 SPECIAL_DATA_SECTIONS :=3D rodata $(foreach a,1 2 4 8 16, \
                                             $(foreach w,1 2 4, \
@@ -133,19 +134,18 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): =
CFLAGS-y +=3D -DINIT_SECTIONS
=20
 non-init-objects =3D $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-=
y))
=20
-ifeq ($(CONFIG_COVERAGE),y)
 ifeq ($(CONFIG_CC_IS_CLANG),y)
-    COV_FLAGS :=3D -fprofile-instr-generate -fcoverage-mapping
+    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-instr-generate -fcoverage-=
mapping
 else
-    COV_FLAGS :=3D -fprofile-arcs -ftest-coverage
+    cov-flags-$(CONFIG_COVERAGE) :=3D -fprofile-arcs -ftest-coverage
+    cov-flags-$(CONFIG_CONDITION_COVERAGE) +=3D -fcondition-coverage
 endif
=20
-# Reset COV_FLAGS in cases where an objects has another one as prerequisit=
e
+# Reset cov-flags-y in cases where an objects has another one as prerequis=
ite
 $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
-    COV_FLAGS :=3D
+    cov-flags-y :=3D
=20
-$(non-init-objects): _c_flags +=3D $(COV_FLAGS)
-endif
+$(non-init-objects): _c_flags +=3D $(cov-flags-y)
=20
 ifeq ($(CONFIG_UBSAN),y)
 # Any -fno-sanitize=3D options need to come after any -fsanitize=3D option=
s
--=20
2.48.1

