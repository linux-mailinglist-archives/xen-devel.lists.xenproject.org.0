Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20BB28F7D
	for <lists+xen-devel@lfdr.de>; Sat, 16 Aug 2025 18:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084666.1443668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unJoq-0004PI-2v; Sat, 16 Aug 2025 16:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084666.1443668; Sat, 16 Aug 2025 16:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unJop-0004NA-UX; Sat, 16 Aug 2025 16:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1084666;
 Sat, 16 Aug 2025 16:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EH88=24=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1unJoo-0004N4-N2
 for xen-devel@lists.xenproject.org; Sat, 16 Aug 2025 16:31:46 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e10ab1d-7abe-11f0-a328-13f23c93f187;
 Sat, 16 Aug 2025 18:31:44 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by VI1PR03MB6382.eurprd03.prod.outlook.com (2603:10a6:800:195::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Sat, 16 Aug
 2025 16:31:40 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.019; Sat, 16 Aug 2025
 16:31:39 +0000
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
X-Inumbo-ID: 7e10ab1d-7abe-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8GQvwO8vET1IVEymfRIZGwhiZfCoPcmmmkr+K9pM1nq07LW4r6rpSdlVyk3xFYGH3BrLwGUYDJnG3nQFTgxE+8z3VppdsD6E4wleCjGlMf3dx4kuVxashTwhsfcxQ3Q540rT0qJap0IVgyD/81SQNho8w+cKsLHqGibh53+bU6Foq11ZLyDfzttRClfX0+lG1VioWQK5Yl0kfsrKEJIwlh46jyKtAplVPW75bn+6iT+QeNlm9JJhQE7tZcQcd6ibRPt7ADJkZSBXunugTBp+r5r1S6XeNCtyfy/tskiqRYMwtpgUZV1VoUhAmmyvohmmhyAgdpK8Ey2lGJSGNZWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0ZrfAgBW0bObJ4ykVGDTR7PpltnCDCau9ENjvHx484=;
 b=CAkMCJYZA6tkr32W2idKnh96lHV97EUnG6QPKSFSd2ylJYRuyWlZhjTRfyCqJRxveHrxoXDx24ob1gCRi86XoiSoZ+fggtsV3wIDg/z/P8AMpO+JpYjtfkefdcaoxfRZzW4J8HKEpHM0wPAwgyyO9o6yIF59AMhyroUw9TBDdHIgNaxzJdFv+OrnZ27Tb3D9SH+gjYnqJRlpT695TVj1j0A0lXxO2jutN6LUMhDJsHvYlOiMqR0dJUIzswer9KW78u5OOFpRu837Q8OOyiGrplFVRQlSux5EzMwTmIrcm5204HXmeH9FLPzqMOCTg9W8HJwkH8QRx0SWXtujYchywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0ZrfAgBW0bObJ4ykVGDTR7PpltnCDCau9ENjvHx484=;
 b=YnmRvu4308Od5RYAqcTVvJJ6Qr2NECVNb1IO3cPnNGAfMwSl8CGOiaR6crzgtp11tD6YeJDzR1ma8fi3rwnOdJ6kWzP6Lc6wBZBJpaVKJ2tQfCNZcvMmOCB6sxEx3Ce/uUUpkbT+Dx9eY3ugkjwNmI/Bvd2OaGz5dR4CYWdWb66Wm5h1hNXfUd6g/kyJX6BfZf8IcAfanewQ9fCUvqWcHuCu/Zq2rnZD3wDL7ycIAZhRsmXy18pLOW5vwqCdtTpITGxrDFPjS/+fCUbQMRCoqdGvzV7Z+fn0B/x4rK6aRJb/OlZuNkWYp/2q852n17Ykejjun1em8tqT/th2eGMoFw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Dmytro Prokopchuk1
	<dmytro_prokopchuk1@epam.com>
Subject: [PATCH v2] xen/irq: Delete the pirq_cleanup_check() macro
Thread-Topic: [PATCH v2] xen/irq: Delete the pirq_cleanup_check() macro
Thread-Index: AQHcDss9HzeZqtz/Tk6XtiCEDCCXBQ==
Date: Sat, 16 Aug 2025 16:31:38 +0000
Message-ID:
 <ce37bdf7b5189d314c0f41628dbfb3281358bcf4.1755361782.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|VI1PR03MB6382:EE_
x-ms-office365-filtering-correlation-id: 05453e3d-e296-435e-e55f-08dddce26018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1ojuMz78veiAXqG8hLV+nUgL1s7++qyG0I6pD0W3fzLUVcSNCHTHK4H3Gd?=
 =?iso-8859-1?Q?M1RnNXvqdwhsOWk6kwmcrfPIeM4YvDhHhwY6K160g/c4FjlW0L6ii+YSC+?=
 =?iso-8859-1?Q?4Xle7SB0b8c+4SftmV7mD2zLsswFK8+osKkXWIzGSBc1dsmcdPfj/66+cg?=
 =?iso-8859-1?Q?yf4trMNLUnB1lwi0SWiQ6uuZaiHSDu7ftE/B+Iu7Cv/EXb36lkOMXrcNTP?=
 =?iso-8859-1?Q?xXzYJ/AEt9MoKG3XKAy7WXdJAGkSeMMWw3+SF4/e2NneL6moZAAN/BIoKz?=
 =?iso-8859-1?Q?is3ilb5Lwxv65tWvT+6ibyfk55MSsXVCVI7FNdatIseNMA7du1hGfUoS9Y?=
 =?iso-8859-1?Q?ilcXjQ5b/jloLp9mQv3YLwNnMHE0SaxvBp7DpNuom0pqNNkX+b4/R+GYnm?=
 =?iso-8859-1?Q?Da65HfzFEIR1XnfGSY68QHlDi01H56GXdXbZFsgRnc4zyKFzwrXKPwkkXy?=
 =?iso-8859-1?Q?TxslJ7AQHSiLVY2oe6ocsuM/mtGh2HvCaB8YFBxyojWRYNbpDqZWh4OiV3?=
 =?iso-8859-1?Q?R5yUFpUE0Xfu5D9YcYsLEwGvIz+EhyUcGIzaugirC34HVd9Es0XsMfh2w/?=
 =?iso-8859-1?Q?Xke1nrX9udQZdzYTUw0FIj2LoxdSF1UQslKC87uSlFyXtOw2/6aky8yVk/?=
 =?iso-8859-1?Q?aDmuvy4WCASpx5sV7zWan9MfriHwXlFI8PsiC6O01+VsXbSxqDBZEGuS2n?=
 =?iso-8859-1?Q?b3Um41SigPYltqor7olAUBjo22Fg0SKz9e0FTVIEzTJ6HHXAuRi5llzKJZ?=
 =?iso-8859-1?Q?GzCADeUPAG2tJUrtwvfpu3sC3CPJC1OKr02VVeWKMWnMn/P8AkS0RoCOHX?=
 =?iso-8859-1?Q?TTHkmvmjoml2ak6ogvKIi5QI/VZwsS/kd7CZCnqsL7q7ZlrzuoROp8cYJ/?=
 =?iso-8859-1?Q?jwPsOjR3N6xieXxiJfOgRW7eVpFVZtfcwBH3nQaiA9KiZv9LxXtLLHKJwG?=
 =?iso-8859-1?Q?myMGm/BNPi1WJMVRzij+QX1P+0VU0Qr4POPRzOjevJqMNN/uxPh8XitCpg?=
 =?iso-8859-1?Q?06J7e9IQDEj+IcsxoUoYi4BihEHfgsafNaKo9FYNeOR3ll6p2DlJDtEhAZ?=
 =?iso-8859-1?Q?KdVTR8XVh7m6ClEWFxX5iasMMBv5n3Ft9hIZ0zm7a32DmsEa5q8V+zXFw2?=
 =?iso-8859-1?Q?3eBZey35v8Pt9L8HJqJyMJvnED8V+z2jR+j0uvDNrqYxs/R1aDvi4rTOV6?=
 =?iso-8859-1?Q?d2FWuYwuVfD1pPdE36xQhAV74xk2PZ7fhz23k0kN+16Uahg2BLjaL6XOkJ?=
 =?iso-8859-1?Q?6Tijlz9/3EphqC/155fEwWvH0BjBym++SvRTlYlBAoEYKI7TQlQWg9ibRj?=
 =?iso-8859-1?Q?m29rHjo3I8DQv81XRhMEBSCqMzuzNwxiKUWc81oVKuodf+1aYZGKpqx7dm?=
 =?iso-8859-1?Q?imtvQZ2d3JdcyvHOzIgAW2y9j4vHptrmtLSDP1kHwTBll+Z5DqiVU7SuDf?=
 =?iso-8859-1?Q?xv0wKOxb/cbrBE6C+JdjZQDL5MmpzKvh8562OQs2a3bDj2YkRE+A8CVYxE?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?x3PahXTsLC7QUpsla9QadG8PkYOuz7OpNhHYITqCSDnNW6RBL1PgvkOj6h?=
 =?iso-8859-1?Q?zgQtc3tikXZX8bE6F3ZVd1S9BJrP5q3FDgnyTEkymGhDCRhqP5vKCKryRt?=
 =?iso-8859-1?Q?ftoU4UGmDjluaS56xLFpr4u213v6rdBwE1MgU9fl7kwh4YTbkSBI3UmIvy?=
 =?iso-8859-1?Q?beoWvYMJxqAX6gsixcC404oMGjtZ+X1LQjH4vxfOQivrUFAnhAQ4dcx5ov?=
 =?iso-8859-1?Q?c5AGkMGCKIimkSIwdU1sixT1j1vRwOT/6Zck/yckZYTznebHpXKNjfNq6B?=
 =?iso-8859-1?Q?d7ZXgKNZSGkBZckTZwgWoihpe6fUhDtK1DYdWgGEoh04mqjpitzFEJOwyX?=
 =?iso-8859-1?Q?YotXMm/cyVoh5MD/uXJmsenSoLf+coyg+ts3v0BKZurJAGQyI4SrcDyMhF?=
 =?iso-8859-1?Q?KGCc0pFh4LQ07vfJsUV5LwFCVLrXdJ0/QUt2BpVqNDFaD5daAJc3KQ8ymo?=
 =?iso-8859-1?Q?3BPfz6hozKpRWwEiQuj3/wNBUU7qfz/6b55c1MpHqQMseNremHUXzgr3gC?=
 =?iso-8859-1?Q?hrwifurdzEzq3LL0NM+KbjdQeg5lKj0HMROI1sbGGNLquBIqMeey3OEg0s?=
 =?iso-8859-1?Q?Ri9PXkj9Sz5VBAshBHTLfipEjuCrYs9d39jKOKt0CyoZFGXLE4WK6ls4lv?=
 =?iso-8859-1?Q?FhDjY8okOhF10ed0j6d9vJAx2L9uTZ7E5y4BE39sTEr6KQugvJovdBJbau?=
 =?iso-8859-1?Q?9Meug+vOjq9wdp6Iz4Gcq5TdlT4TakOZLgVVWPyaY38grOSBuhOKz4KXkw?=
 =?iso-8859-1?Q?VNFy6opG3C+XELibQwv3PVuOnxMOT4O4oAPJjLO0KS4vSQ+lyXsSlzTzsg?=
 =?iso-8859-1?Q?At4/iQyQPnconH4+oTWBEP/Ytd4ToPYfccZcQR8OfPZ1Y+wBM5tYcY/Ks5?=
 =?iso-8859-1?Q?llNviHz3A55MgpmCoMv+wxhPWb+6VcUUZ9fgQWbPfMDEQrpbo7PtO9UhKe?=
 =?iso-8859-1?Q?agCtdFsbrSZSBiYmklm+rvZYzM897pjP76yFax3XFH2VNv7YQ3XtNKtvf+?=
 =?iso-8859-1?Q?4Uk0qrvHdYIuVY6zspdaIu1uW1mpZJpE/6ECoTzwaOY5Rpz4smiVm66kn6?=
 =?iso-8859-1?Q?lIJnTW6yDKWpSFIBLEshnaPuSscLwCHvlLY7Jbdlv74EAqc8oETRIiGPqG?=
 =?iso-8859-1?Q?NSxkpinq4daeQlUa/kWL9hPCCNU9wznqUOboW1IvEPJ1Cj3ymbR5c/Ubjk?=
 =?iso-8859-1?Q?YLAKegdHqPIcJ0p3ZAES8LQn7H9MX/As2pjok4ZgF53r7t50/qsoUuu9K6?=
 =?iso-8859-1?Q?r1y9fZZ75FFU/PHFV4UidfkyMzxM67RcIGPk9HrZT6CqGqevRqMuvgziet?=
 =?iso-8859-1?Q?6v+8SSwJZBRO78xWssNxcyjQN+qNvrOz5aw7BxNLw3enyat3b9qTYspekM?=
 =?iso-8859-1?Q?2yFmLE0g99Sc60KvSozvRc+tb1MCo+/FhXI2bTobA9NYrDBPy5rz9JWQms?=
 =?iso-8859-1?Q?oQpW+ZCc3oxLuCZpJY+6RUf6zr1x1OLq4auCFV+7PI3TbfDF1tbqo57MxU?=
 =?iso-8859-1?Q?OejR4asGPYy1+ZQlgIxQxTnLixAMc5JEFtIksWIKIWrcPiD0QT8T4YaZx1?=
 =?iso-8859-1?Q?Ckie4ixR3k1hlYhHhH3xMYavDymTG4CpfOqiKZu24OdbT8jTECaEkIILgF?=
 =?iso-8859-1?Q?U3qhdfeyU/PD8i+joXkrXR4UJMA3eQKCyxb4FwdEUUAQkV61/zP3AAGg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05453e3d-e296-435e-e55f-08dddce26018
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2025 16:31:38.8989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urwweigUNShy2t3Cx0MIeq8aHFWcQtWCG+n5JPXTqUgiE7VjYkHAzTqqSC/9687duELQi7axcgWbRddaS4YPTeBm+qygPEeBpArfuaczMp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6382

From: Andrew Cooper <andrew.cooper3@citrix.com>

MISRA Rule 5.5 objects to a macro aliasing a function, which is what
pirq_cleanup_check() does. The macro was originally intended to ensure
the condition 'if (!pirq->evtchn)' is always checked before invoking
the function, avoiding errors across call sites.

To achieve MISRA compliance, the condition is expanded inline at all
call sites, using plain C constructs. This ensures clarity while
retaining the original behavior. While this complies with MISRA, it
shifts the responsibility to developers to check 'if (!pirq->evtchn)'
at call sites.

No functional changes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Link to v1:
https://patchew.org/Xen/20250729223110.3404441-1-andrew.cooper3@citrix.com/

Changes in v2:
- updated commit message
---
 xen/arch/x86/irq.c                | 11 +++++++----
 xen/common/event_channel.c        |  5 ++++-
 xen/drivers/passthrough/x86/hvm.c |  9 ++++++---
 xen/include/xen/irq.h             |  3 ---
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85a..1ed85c0c11 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1325,7 +1325,8 @@ static void clear_domain_irq_pirq(struct domain *d, i=
nt irq, struct pirq *pirq)
 static void cleanup_domain_irq_pirq(struct domain *d, int irq,
                                     struct pirq *pirq)
 {
-    pirq_cleanup_check(pirq, d);
+    if ( !pirq->evtchn )
+        pirq_cleanup_check(pirq, d);
     radix_tree_delete(&d->arch.irq_pirq, irq);
 }
=20
@@ -1383,7 +1384,7 @@ struct pirq *alloc_pirq_struct(struct domain *d)
     return pirq;
 }
=20
-void (pirq_cleanup_check)(struct pirq *pirq, struct domain *d)
+void pirq_cleanup_check(struct pirq *pirq, struct domain *d)
 {
     /*
      * Check whether all fields have their default values, and delete
@@ -2823,7 +2824,8 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq=
, int emuirq)
                 radix_tree_int_to_ptr(pirq));
             break;
         default:
-            pirq_cleanup_check(info, d);
+            if ( !info->evtchn )
+                pirq_cleanup_check(info, d);
             return err;
         }
     }
@@ -2858,7 +2860,8 @@ int unmap_domain_pirq_emuirq(struct domain *d, int pi=
rq)
     if ( info )
     {
         info->arch.hvm.emuirq =3D IRQ_UNBOUND;
-        pirq_cleanup_check(info, d);
+        if ( !info->evtchn )
+            pirq_cleanup_check(info, d);
     }
     if ( emuirq !=3D IRQ_PT )
         radix_tree_delete(&d->arch.hvm.emuirq_pirq, emuirq);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 67700b050a..a3d18bc464 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -741,11 +741,14 @@ int evtchn_close(struct domain *d1, int port1, bool g=
uest)
             if ( !is_hvm_domain(d1) ||
                  domain_pirq_to_irq(d1, pirq->pirq) <=3D 0 ||
                  unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
+            {
                 /*
                  * The successful path of unmap_domain_pirq_emuirq() will =
have
                  * called pirq_cleanup_check() already.
                  */
-                pirq_cleanup_check(pirq, d1);
+                if ( !pirq->evtchn )
+                    pirq_cleanup_check(pirq, d1);
+            }
         }
         unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
         break;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x8=
6/hvm.c
index a2ca7e0e57..b73bb55055 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -329,7 +329,8 @@ int pt_irq_create_bind(
                 pirq_dpci->gmsi.gvec =3D 0;
                 pirq_dpci->dom =3D NULL;
                 pirq_dpci->flags =3D 0;
-                pirq_cleanup_check(info, d);
+                if ( !info->evtchn )
+                    pirq_cleanup_check(info, d);
                 write_unlock(&d->event_lock);
                 return rc;
             }
@@ -536,7 +537,8 @@ int pt_irq_create_bind(
                     hvm_irq_dpci->link_cnt[link]--;
                 }
                 pirq_dpci->flags =3D 0;
-                pirq_cleanup_check(info, d);
+                if ( !info->evtchn )
+                    pirq_cleanup_check(info, d);
                 write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
@@ -693,7 +695,8 @@ int pt_irq_destroy_bind(
          */
         pt_pirq_softirq_reset(pirq_dpci);
=20
-        pirq_cleanup_check(pirq, d);
+        if ( !pirq->evtchn )
+            pirq_cleanup_check(pirq, d);
     }
=20
     write_unlock(&d->event_lock);
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6b..6071b00f62 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -185,9 +185,6 @@ extern struct pirq *pirq_get_info(struct domain *d, int=
 pirq);
=20
 void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
=20
-#define pirq_cleanup_check(pirq, d) \
-    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
-
 extern void pirq_guest_eoi(struct pirq *pirq);
 extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
 extern int pirq_guest_unmask(struct domain *d);
--=20
2.43.0

