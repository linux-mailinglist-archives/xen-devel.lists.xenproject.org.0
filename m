Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797EA0FFE4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 05:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870900.1281953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVF-0007VX-Hs; Tue, 14 Jan 2025 04:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870900.1281953; Tue, 14 Jan 2025 04:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVF-0007TI-Dw; Tue, 14 Jan 2025 04:26:09 +0000
Received: by outflank-mailman (input) for mailman id 870900;
 Tue, 14 Jan 2025 04:26:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZa5=UG=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tXYVD-0007T1-Qg
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 04:26:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8db482b-d22f-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 05:26:01 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB8PR03MB6300.eurprd03.prod.outlook.com
 (2603:10a6:10:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 04:25:58 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 04:25:58 +0000
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
X-Inumbo-ID: a8db482b-d22f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twLS1QJUg53q+bKBQGsnqe7IItYwsHmxgiwkTBLCrvglecOqxHDRxvzJTDtcCUTKzfsE6jYvCb24eCHWlXj0a7e87QSZR2S36Zzf24XoBUuoCkmAeEj5pvA3BEejXxIHnXkwKMnfkrNSBwrZhX7lSfg+xm+hm8vATCnPHQdn+pKitA+9tu1HvmJEcWWTaaWAnzDHi+6jqWD71iPgonj95Ov42ib2dnxIf/bnqMiHBuqoW5AkofuNEJBtvGyaIVlN9mDbUhW8A8F9wbSoVCV5GiHrgW7wFY6my6FW1r26jBHKFY2UrvjfJ+LTWG9TcFn1Sqfht3ktu3Xou00y//kx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOdNcIAOSgUxY9nIPcgrwfCpmXDyekAM1FEvRJo6MHM=;
 b=OZ5qxIAQY3sIPXf1sT0VPQhwQc84C5GyHdSMB7GX159pdJ08RAgkZC1U5n9tulYujHOO3QXVC6jnS8xsCT2RGIIALsk+Qj5eET3snS8XpfEI3Vyp4zN1qt/HlzJguuKmeyyDhuXNhfB44v/iJAgg5Y84bgdpawKDYLBOqsSZypqUZCTJXNW4dvjKDNzUBstrqsaS9bHNNPZSOUFjCNVhdrxfL9F6kj+UfR4wSE4uw8U5stVlhhtMZexOdggcFg1cKjeiLrSWnFuux26/bjHLhxriMgkD2axk0VT2CH+OnqTgPk5OevflMyO3oJIRSMY0OuZadT42j5zlQ/TL7Jvr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOdNcIAOSgUxY9nIPcgrwfCpmXDyekAM1FEvRJo6MHM=;
 b=DLsg94Ut0KSS77Z7PLwsfNKYBbo5rEkAGFDsjOPLU6OSkN7aAwdLAMHibx1mmWqVeKFTF39MLcKg/If9QHXA0mQW1mmh/oaCqlXHXxcToHF/o9CKSmWVkWYZWlovFqx9Xrzh6SenT0Fwh6nL/qkBfwzNgdjAbp34EEXoL1+tTnJEZ8sG/pWE2PuHKNTKyxFiloS41IjgprQYIxEui6H5wohQD7+DJ+CF97sLNrOPIFgfzJovZSlNZ6+sdClZv5WIoTSZ73y+cqYVXq+denwQLc5+ExaqzsLr7/HqV37+RxmsR65K3I/7dzxLg1lLi+TsWSVe2LLS/GHt6zQ271jOSg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/4] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v4 3/4] xen: arm: enable stack protector feature
Thread-Index: AQHbZjxnrBLNCau4fk6dLN+QtVmLtA==
Date: Tue, 14 Jan 2025 04:25:56 +0000
Message-ID: <20250114042553.1624831-4-volodymyr_babchuk@epam.com>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB8PR03MB6300:EE_
x-ms-office365-filtering-correlation-id: 94f90734-a613-48c2-47cc-08dd34538bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZD6Dg1neyJjs7BOLntiqSUddy+Viycyi58r0PQ/kvvxa9WLUCyN4kLZsei?=
 =?iso-8859-1?Q?P7WpSQfRoLZbq2k7QhtFo4F3ND5V7D41BjdhX9mPZoYf7ssNto0vGYsS5q?=
 =?iso-8859-1?Q?VDDkHTu5hmuACIS3x9UIjlQNiQNGP2TTIuFbODnJvZKU1mDZzJlzRjHCI3?=
 =?iso-8859-1?Q?+hUW/RF4l+2QItbU2DIkrCyBjSPOD5SH47DDuTr/kDyBw38eAwz3w+AYR0?=
 =?iso-8859-1?Q?QCGBEDFqIZH+E8Uy8XsGJ1E4NGUczKKURlKPO98eaNlpTviXvJZIwM9gBO?=
 =?iso-8859-1?Q?d+nMwQuoUVHVNvXxs+wkh5kGsOi53kC+fBIy4tEIlAWGMukQ8mgBQOONCb?=
 =?iso-8859-1?Q?3YGYe3qfSrYh1GmvIPhIxPAmINdaYgsWtSafoXdGOW9Xyhnb6QBrYVen+Q?=
 =?iso-8859-1?Q?6o5kMYHjWvmkeaFZcIFyIoE3wcj6lXbh8jHdRrc741ucZ/apayyP2t5T1x?=
 =?iso-8859-1?Q?jtVC+UuIXgOqoS6Mb9yr/jxrWvXj2xAoDJm1QnDIoIY9pCwB4ZJb6mMQKW?=
 =?iso-8859-1?Q?vzhGl4AB7BICQ4P+CQXx33dj35Gl/1J4hDtL0nqkV6F/tsnhgDVfw1eSNc?=
 =?iso-8859-1?Q?0a5+ccnqEf46tZdqhlGULUa3GMgDNyoiklv+uBgZuZFd7QKwR0gLxUt5LN?=
 =?iso-8859-1?Q?LsuurMyWA9cjFsQKNPt86i1DLDWuCQuiMX+tPxc9UMGJFIUZe2nqca9r1C?=
 =?iso-8859-1?Q?g927Z0cWBNQQjjLpRgvGDDAZM4AEme2+V3CE9XINeOdSRyj7NjdenK7dDL?=
 =?iso-8859-1?Q?m9DmBzpbJT78CU1pORSR1HSdf6pJ5wUFRCtzsPcITC+OhTabJKg5PG60r/?=
 =?iso-8859-1?Q?oW+9TywXwliTwMZ1s7YCsuNjJbeRVlF/AcpkjZuRCCH9GC4er+2/KnNhlP?=
 =?iso-8859-1?Q?jDTd32fjYFIKBvjTh7wE80/wrR4KAidAomVERQKf/18HbBQsuqwM5QwyDJ?=
 =?iso-8859-1?Q?4kU4VgtbeidXmSUdPbCZd6ppqLWU1nX2IJmYZSlg77iXV11RO8yXIrB3RK?=
 =?iso-8859-1?Q?N2b1a3ogLcqQfYV0JqT4rQfwan45G16Wk5vd1hdjr5ILhjmlzbiD8QpP1M?=
 =?iso-8859-1?Q?r/x8A+6bUi9phUyDNU3Gv+LUhVpM6+esIB0PxAwx+hu7aP81BmmmVTymi2?=
 =?iso-8859-1?Q?YCeQfeJIndQbjGjV+OtNNOBP86r/wV6rIAjDJ5Mh0uFfCxcMorAWgXkHnR?=
 =?iso-8859-1?Q?mnoC/0FBhmQQSTkIktcrwrdTOBBr2Y5CNDTXPQldcpvGCIRRlSqoDFkirQ?=
 =?iso-8859-1?Q?b9wZcKP7VXtBpoJAZKby4QJTXMe5kHYdoVI09T68bozTkFul34MYqNWpgT?=
 =?iso-8859-1?Q?rgf7ydOOlgK8npaVRQC2qaHLxmWNxAcWTgAmYTiys+0JMFi9FUnmmVd6Xi?=
 =?iso-8859-1?Q?AnUKqBrKalLILZL2V5b++ruciA4TKrf6Dxf/z9S21c5JEyL5ObMuSe1/4R?=
 =?iso-8859-1?Q?ESpkhFSMq5fqS8ZN1Zu+hgL+OEihXG/yPvb5t3KIZfRG9aPLR11voK/+r+?=
 =?iso-8859-1?Q?mEXYksY0VTWBGfGqXgfnB/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ibo6LQp/izy3ntUh8tLNS535CENi5aR1fdc/avEr4jxaxYH8o5yI3ux2Z/?=
 =?iso-8859-1?Q?VO8IzaS6drbmhLYu8C9qsfPa/9AfTw8NA6W6NFbnNwfLRjqq8poA7jXjaj?=
 =?iso-8859-1?Q?x27b5UbG3AXaTjSHcybnIaG162H93/6TLMKB3q1kPNFLkj96TguqY1o6/R?=
 =?iso-8859-1?Q?bGUczuGmYqBfc9Evry1qbeBqz2fMfwlk14tsoZHzatdhkalpsrcyiXzyQd?=
 =?iso-8859-1?Q?uveXPE5lwNOUNgp8BfsujTifbNina1qXJqpSWXlQ8097n4mTw5hCulPog8?=
 =?iso-8859-1?Q?AB7NbxNbAj3BQUKfQs5ALzn/zmR6VHLsyJQ//xzTkSUkM3MY0YXkSj6900?=
 =?iso-8859-1?Q?ILp0owsd7F3yHcH/xqYPvNf/4Ap8gXRdaYqMzC9zRMVLu15K686C/FzAcP?=
 =?iso-8859-1?Q?jRsn9QIt7lV6JKw2tXFiWIU8AaTm5lzEfJ9ARq0LHCX1yHqo83gtZpqkht?=
 =?iso-8859-1?Q?hyMmrxsUEL86QrhK27losWsF3AiEfPXAQ8uCW4aABgDp3e0nBuknn6Fxsv?=
 =?iso-8859-1?Q?bGIh5PoQkPK93z0mdmFa/+M3uI3/alISKT68vuZ2sAcwxQ+A7pH0tAyIKv?=
 =?iso-8859-1?Q?em+yfKIEadvxnTd7Up5IyOmYTOBZPv228zi94tn34ZJ9n5sWysuV5rsnx/?=
 =?iso-8859-1?Q?Ql95SEEI6MQMst81NbFpwN4khrVii2cHLd8FlQqs3kJ7oQQefB/ZJBFMDp?=
 =?iso-8859-1?Q?a1e99VIfYJ12yZol5mTVDL4Ex4xE+hAPkcuUlCFsRYtj5JavYl4D1N2k7F?=
 =?iso-8859-1?Q?60qO6pc1RfrBZnTWpPl+KLJfr3FYXz6YZteYEEx1lKMJpmSnkLKaQAdwA+?=
 =?iso-8859-1?Q?ugMyO5J1j3Z+N4PwZ7DDAbumS747Xmkolivs+HwGGY9GL7UHlQL66SjG5S?=
 =?iso-8859-1?Q?Us3lnNh5IxCf7iv6JY6XwUwtACYmB6Tkg6JeNArxzAYRecb6qvsOC4cd98?=
 =?iso-8859-1?Q?flW935k977e3k8gisYLeTgYhBhaJoMxi16nPukiIDju1lEvw5QdqZEbUYc?=
 =?iso-8859-1?Q?kelGKO8LczWllS60/AYHCMdzNuIziTwoMLa5fE8jZ+N4gt3Y/l6e3HD9TC?=
 =?iso-8859-1?Q?Wm0Wx0/zpr1qteLLDI+u5XxK8APr+YFvxvMiUGUw6hRMitZhpppTFym07P?=
 =?iso-8859-1?Q?7YPoaP7Dbfu9HFmUYLQdGuDucSnG73V7bpqKu6ezKxmheuxB/MGXwRNooY?=
 =?iso-8859-1?Q?yzxNrPFvAUrghkXpx1xH+xRwhDFkikEgkC7k50wHv9U9TiSpRw+rjf5TBC?=
 =?iso-8859-1?Q?DFf1UgvmszPrIKODCJYecTuITygTt2KmNcVZ3h1CsrkqhAejxiXNjPHQYc?=
 =?iso-8859-1?Q?CKeQlqRyaoTEjqgxNJCVOlYBHUtPGrbHE1tjrXoOX2OfUkUsHWzN4i7jb2?=
 =?iso-8859-1?Q?OE3OZe664CBsQB1bVYnJ1Fp3ohRD3P/Dy4ojWG/3rq+N5/QonFY8DBVx9/?=
 =?iso-8859-1?Q?73kOGvV83yjrShZWgu4U1vk2lV8aGsdEUYCxSWWxbZxMxP+AGrAF1nbiMD?=
 =?iso-8859-1?Q?oA2VnyidisPgUFegG7WWVKTrTPXz/cIDBBbvep95J9dpTAegpub+nCG2/l?=
 =?iso-8859-1?Q?nYPu3ZuSmMMveWaEz0fNHY3JHFQdzdGzMok7He91b8Ir8tXlKUQxV1y9th?=
 =?iso-8859-1?Q?6DlljqgLwDtRY6o7rEd/LBHcLOoLwghh/PwBTISxXGArtpR1vA9eblIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f90734-a613-48c2-47cc-08dd34538bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 04:25:56.6028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lGlImmpjcC2n94+sI9odtBaapSSisdurf1i8RQHmswF74d0JzvhoV5qYBqZ6vYdnTBP4Oc3/c0vzVzQOIh+ER3Sj7foiXWBqOf6AS2c6J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6300

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. We initialize stack protector very early, in head.S using
boot_stack_chk_guard_setup. This ensures that all C code from the very
beginning can use stack protector.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
In v4:
 - setup.c does not call boot_stack_chk_guard_setup() anymore, because
   the original implementation was removed and
   boot_stack_chk_guard_setup_early was renamed to boot_stack_chk_guard_set=
up
In v3:
 - Call boot_stack_chk_guard_setup_early from head.S to ensure
   that stack is protected from early boot stages
 - Call boot_stack_chk_guard_setup() later, when time subsystem is
   sufficiently initialized to provide values for the random number
   generator.
In v2:
 - Reordered Kconfig entry
---
 xen/arch/arm/Kconfig      | 1 +
 xen/arch/arm/arm64/head.S | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e1182..8f1a3c7d74 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,6 +16,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
=20
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..5cbd62af86 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -250,6 +250,9 @@ real_start_efi:
 #endif
         PRINT("- Boot CPU booting -\r\n")
=20
+#ifdef CONFIG_STACK_PROTECTOR
+        bl    boot_stack_chk_guard_setup
+#endif
         bl    check_cpu_mode
         bl    cpu_init
=20
--=20
2.47.1

