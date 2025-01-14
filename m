Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F46A0FFE8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 05:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870903.1281979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVI-00085Q-FZ; Tue, 14 Jan 2025 04:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870903.1281979; Tue, 14 Jan 2025 04:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVI-0007z2-CG; Tue, 14 Jan 2025 04:26:12 +0000
Received: by outflank-mailman (input) for mailman id 870903;
 Tue, 14 Jan 2025 04:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZa5=UG=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tXYVH-0007T1-O6
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 04:26:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae50ecf2-d22f-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 05:26:10 +0100 (CET)
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
X-Inumbo-ID: ae50ecf2-d22f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNXFYZv/i8RoY9DhK1A9DrY4pdXJC1Iapr7z3cc8RK2kZ2J3kPN50KDRnd3UW5VbxLVqDJF5DxIjxlgqrckFs61qOAbY3PFpCTIqyXZ6Jy0uy3pE7Vbs9VD3kIkjkqfgyDmNEM2AYXXalMQuuKtZaHCTSSePJhv0bSRrHFRKHCA2J3FXKZszxVrPvteXwFmi2dMT2aTESpaVENoHSGueuzM9bpobDWBy9jaegG3sMixrX+SdXq8I5r7gvVZAyFjeJWkVuZFLOA2FvIOUnFR5EQCFDACbE6nVTBKgj21mXi9xtrH9olZrkbTic9aZnVFD3YdjwWgxEDoieEY2uemWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7CrkfKLq5jOHyUUc5QDVCpbIzJ4tC6vRwCVPj0QO1U=;
 b=LDR0TqthiVKH52S6P3gPieScKBeTAJLuS+swq+eSzT7mJeLrCkxZVK4aXmEbUl7ldnGY3zdfFo6tEZASPtL+DDq+PhDmsJuuypZH9+qBmT+NW7LaYLT6Ub5fUsV0QBaz6CEUy2eFh/QwZnUi2LcRi8UwA0KivmtipxwatO7OdZTShyVw8WKGOu2zuIrxD1eAN8X8aWvAFcov+41+n6Po9Khx0aqA/UZC9kXzAXctfPyfDIg3tKlHKtA2zAkOTUe86Ql9YS+orp+tFJNRcN3vOkDR4ZS6Y/OJ733kn3tj66b0yF8DIRFtIldBkkObqXFEgUgR6+syLrM5NdFXtYL9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7CrkfKLq5jOHyUUc5QDVCpbIzJ4tC6vRwCVPj0QO1U=;
 b=Yn9+xYbbUUVHjoYYDr8g4znus83Mz4T5tf/U07jT5qWt4N5fk1665Ium68fQzpIoyNKvOTgxDaP28hPCcS3MDImyDlt4NvBM+ZBV7Z2Swtu8fmUlaaZA/qInRDfNVq+EyEBvc0VzudQpC+2xh7nuoniHwLzyMbxfK7c67MMooNzzqLRGiCqRy3nNOAsQkBJuQ1EZ7+xVjnkmuZ258/jmeoTf5E8zjzPCx5NJMawa1z2zC4qoGQi9tf2vdDmGElwgNyh5pQ278mjvZblMJuqoXmi/7b9/rM7kcqJSqf/NtbPnvpfqIXPrMukyctYt6RCmxZyCTpDVNdYU3IRMALb0ig==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Samuel
 Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v4 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH v4 1/4] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHbZjxnmljcDXAlQke3Qcb/enjdIw==
Date: Tue, 14 Jan 2025 04:25:56 +0000
Message-ID: <20250114042553.1624831-2-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: dc1d4bfe-8639-42de-07d5-08dd34538b89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+beGIrg/eSZhYUmXb9AHSpzeS0Sx9usP25oSeUHNwkRBHLBkJs9qCRscvK?=
 =?iso-8859-1?Q?4+6Ba6NcKan/W4mQjc6GnS/gX17ZIuHx/Do6QhAB+rHyaCtUPw6nI1DLQI?=
 =?iso-8859-1?Q?Xuaj10RP0+LngF6IkhmoCw4Nv1f3aJcpZMIpmNUxTO/AfGI70l66vc2Kou?=
 =?iso-8859-1?Q?8FHgghsAqVj3gfohzR8UvmQueQbxtlaL0dMWiEctHCz9DqDCuRkOUd6btU?=
 =?iso-8859-1?Q?50IfXICBI2lasIDtj8cbHF9G7s00WhcSjVsld2IL7nrtFvzULsiefnX2wU?=
 =?iso-8859-1?Q?vFVZM5nQmSrXZDoFFqOWJO9wT28sBgetWRRRJgTO44j8rzHuj+i3iIt+cz?=
 =?iso-8859-1?Q?8KjDVTCStyOqrU4qPXBTFqlHLp8TIenapkvOJxz6d5M9XnGx+ClY6AqmS9?=
 =?iso-8859-1?Q?jtgUQz6QIrA1eVb1X3Chv1Zbx6R8C4atjsnPt/0/TC+hwZpQPj6d8MG9PT?=
 =?iso-8859-1?Q?ZQJM0s0L+zPn5suO6u3Gaw05NOXpqbcYTMj7ci5flmgN+k6Cj5ws24HSb5?=
 =?iso-8859-1?Q?rfCYHcaC1xgqSpBQlhCylm5jKuAvCLIOSAdK5r+GWXFhlF86t3gTYPsJVA?=
 =?iso-8859-1?Q?TETeQiTAY8kreFyb91E1gh4GpY63ahWAvCJWYw5tHUMHVqECitSxs+q7bi?=
 =?iso-8859-1?Q?hU4LaPwSKnfPGQqZ/507Dl9zlBRYpPr+Ug57NfEMZ79eTjUpm/BSz667pA?=
 =?iso-8859-1?Q?JMbuQLZVTJS/1mJ5cnEZ79mQgDI6UIxe5lXza0ZrkZJaSuAc5xgQ7ZQmpW?=
 =?iso-8859-1?Q?qAwJ+/2465YKiLNZ6xWmzFiEclvCuPRi16UvMsziDdi0JLZh238Wzr7JCD?=
 =?iso-8859-1?Q?Xz4YLMulmNCDnSMNYxPPCeOFgq5fQ9HfAOfFpS+CQhagydRMFy8JmDijA2?=
 =?iso-8859-1?Q?ZnVvUHFw8j6btnb3x+tUALI8xSuVszBpw22zmMRfHMYvL2Kwe08bzWRt1T?=
 =?iso-8859-1?Q?2MNCs3TK+mZzxGiHF1+wE2hkifppWWHgLIwN6vVSUxY8pD/xer6AVrElOA?=
 =?iso-8859-1?Q?9P4oo4vKANGOFLUrSpbeoV35E3vjQh0IgMFxEqMKhYhrH6SeGvF6F1deg8?=
 =?iso-8859-1?Q?ABvBQFbF4P4so/1Zr8Cqe9OctyoU6Qp3VewaQ9dmrLGJC5cKisiXtVtH/J?=
 =?iso-8859-1?Q?t9fSeGtOaEMAmxtsVkzGqKNSf6pB/8W0HhjdUiztKFlmAVWSSwhNGAVpJP?=
 =?iso-8859-1?Q?nZudxmYCH7G5Iu87uV5d1TXNsgdD+G0rHddhmcj4JQ4xln0uPF2pXExYzC?=
 =?iso-8859-1?Q?kjWHe3qXylAPcPe3x930S/JRBKcTIGGds02ONw0bKwJS8hTk/qhxDdPs62?=
 =?iso-8859-1?Q?pYauwalBMMXyn7k5N4zagHJH506Bkd27cGEpkG3l/x7Wd/TeLPgsIcCHxY?=
 =?iso-8859-1?Q?b3L+kV/VFoKUoS9sRMXIYjyYRLZIGHT76WbwSAuKlA33immx/GrHEAtX+8?=
 =?iso-8859-1?Q?XgW9XG4afYassLJC6qGCisNg4zZWNnxMQ0FzVw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L5wvyISKyJDkP5EF9DgmylbMPPeCpLh5QSGlutY8iOkAFzxpp9FWMIG/KL?=
 =?iso-8859-1?Q?7p5f5egBQKlC3rWHoxaOqr4nihPVv8beG+oX5fQ8bcRkAT4Ge/IJVHWWNB?=
 =?iso-8859-1?Q?MwqqNN+JwFo/yqN+CVCp3hL+VsR5JVhZqe0DxkMfSbbXhnmDPQWN/2tiJQ?=
 =?iso-8859-1?Q?nYdhlknWUzQKWpQK/5m962wYBzkRnBXZsmhmt0/twcBlbspiI9Cs1/XZg4?=
 =?iso-8859-1?Q?08b/vBS3innEUKr2pyWdGg6H+uyKFstrBav2suUV3e+HfK2hQR1H7yuTVa?=
 =?iso-8859-1?Q?ntBjNJl0U1WzHvI0qSl1eAr7JYPm8rD7OwYAsf5dvDAsMe7L8ZNYJyKTYj?=
 =?iso-8859-1?Q?pvEvhP4/qItdBZlUhccxejAA2iTLvnUWVoSNP8wPvGj3sgsmscLbge+KvD?=
 =?iso-8859-1?Q?a/b6vEb/S6yXjTHxuxdYjdbd8VvpFbMMQO/bfiU3KRJfnhRhlJYe1mxH2T?=
 =?iso-8859-1?Q?kvMDzm9T7ys6f9bDU3b3LNl8A4v4nuDL+ie09kinsmHmMkRID+yuMR37wz?=
 =?iso-8859-1?Q?sk5Gt0oI/P/c0R/C+qqli4Wq7JR+751bXDTfuwn9NK1x6JezLYuh4joM2T?=
 =?iso-8859-1?Q?fmh07Erl9EXWkSW/tkx8hp3w4mAWIj5xptNBlnGPQwvhORqjN90pzn7KVP?=
 =?iso-8859-1?Q?WZ3wWKQWBUlFZm8RMC2ZoMO5VFeSj/wuVEMbBrgPx1l9cKxsjM9Ic3AL5V?=
 =?iso-8859-1?Q?yElYs8UifwmAcONicjjAGZC6qhcKXiogpmi6z2N+AJQ/Pp7r25KCPxrbyU?=
 =?iso-8859-1?Q?BBS60jMKgffYdmDjShq9VgKbwton805mn2ZyjD1ItAWPR/S/xF6/fgnpDE?=
 =?iso-8859-1?Q?PKRXpaN8Sj3psJQixuJGwFN0tmHGddLn2iyIDt1Bn6vOZ19+jPk0OgdADr?=
 =?iso-8859-1?Q?7Bb9rdvV/zcM7fRFBU5PFUDo6TstOO3VK3nRFYxP9bAsqL/NdRLSjHLF0s?=
 =?iso-8859-1?Q?gknzs9YZnz9rBhEPAneaz77SNsQEo/KsZiL6xX931Eoz16hJnUKLHcw8l1?=
 =?iso-8859-1?Q?gOol8qpObSg2iCvFFH+lTIXR2g3SZ7tfm4bNTwv9/5XuP0qKiWDbPAXdJU?=
 =?iso-8859-1?Q?t1s+LZusLchtJRJBuPtWiHY/Fz7HaTkdL17H5NjO0RfTmjeAvaAU/2AfzM?=
 =?iso-8859-1?Q?FlD6vimnSlKCNXwHc1FH+EOrcsBhL5e5Ex5Gg9e6nYXsxaqk8HtcjOL+z9?=
 =?iso-8859-1?Q?0XKWvmNCa3sJnZkFVI+oPR1y120gLniOdJXLwaRrvUZG/QkuUazSD/I3/V?=
 =?iso-8859-1?Q?TBrW94sjXVkH1qJAUn6f1+Dz9pBiYzjvoU5AQZ1hp7DxTysb06HCEakc86?=
 =?iso-8859-1?Q?83Ywyp+hdtM+PQL0RInF16Qwaj6fV6ozwjnvhT70RfEWEupr0xkGNjsrRi?=
 =?iso-8859-1?Q?WmlvHVGLwhlQZUodj27VauuOz1Q/JKoWLS4DQ9hmZhHdonJSfUo8+trICx?=
 =?iso-8859-1?Q?l4JqL8wcTx+OsESg9xsnleHRT+Er/tjw3hgLtrunNdF+9nEwSfWeVaN4F5?=
 =?iso-8859-1?Q?qvB8d8ILVH6stqYShRj+jfo+ZhB3t+pl1T+3YH93T5ufPD3nO+tYozFQE2?=
 =?iso-8859-1?Q?xKW/WM2VwBrlwEnu9TL6LJ0jNdW73GHo+H95eJ3/napLoKbmvf3v4VWCC9?=
 =?iso-8859-1?Q?8zBUsL8/q+O3SKi6/Kdk2SeCdQtcgQk1jNclFM0Loz6BBkLVmWab25YQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1d4bfe-8639-42de-07d5-08dd34538b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 04:25:56.0171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGhmTuRTaWRYryxHSbYKorYCgpSz2uR2NhfXEYeZLtfCB0vw9DL5a9JxUu89Qi2/dFm0fA0nFPc85AdX2QK6rldFn5uWrcPU1CDq0ZQguec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6300

This patch is preparation for making stack protector
configurable. First step is to remove -fno-stack-protector flag from
EMBEDDED_EXTRA_CFLAGS so separate components (Hypervisor in this case)
can enable/disable this feature by themselves.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---

Changes in v4:
 - Removed stray hunk
 - Added x86_32 CFLAG
 - Added Jan's R-b tag
Changes in v3:
 - Reword commit message
 - Use CFLAGS +=3D instead of cc-optios-add
Changes in v2:
 - New in v2
---
 Config.mk                            | 2 +-
 stubdom/Makefile                     | 2 ++
 tools/firmware/Rules.mk              | 2 ++
 tools/tests/x86_emulator/testcase.mk | 2 +-
 xen/Makefile                         | 2 ++
 xen/arch/x86/boot/Makefile           | 1 +
 6 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 1eb6ed04fe..4dd4b50fdf 100644
--- a/Config.mk
+++ b/Config.mk
@@ -198,7 +198,7 @@ endif
 APPEND_LDFLAGS +=3D $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES), -I$(i))
=20
-EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector
+EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie
 EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-tables
=20
 XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2a81af28a1..9edcef6e99 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -14,6 +14,8 @@ export debug=3Dy
 # Moved from config/StdGNU.mk
 CFLAGS +=3D -O1 -fno-omit-frame-pointer
=20
+CFLAGS +=3D -fno-stack-protector
+
 ifeq (,$(findstring clean,$(MAKECMDGOALS)))
   ifeq ($(wildcard $(MINI_OS)/Config.mk),)
     $(error Please run 'make mini-os-dir' in top-level directory)
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index d3482c9ec4..be2692695d 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -11,6 +11,8 @@ ifneq ($(debug),y)
 CFLAGS +=3D -DNDEBUG
 endif
=20
+CFLAGS +=3D -fno-stack-protector
+
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=3Dnone)
diff --git a/tools/tests/x86_emulator/testcase.mk b/tools/tests/x86_emulato=
r/testcase.mk
index fc95e24589..7875b95d7c 100644
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
-CFLAGS +=3D -fno-builtin -g0 $($(TESTCASE)-cflags)
+CFLAGS +=3D -fno-builtin -fno-stack-protector -g0 $($(TESTCASE)-cflags)
=20
 LDFLAGS_DIRECT +=3D $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2=
>&1 && echo --no-warn-rwx-segments)
=20
diff --git a/xen/Makefile b/xen/Makefile
index 65b460e2b4..a0c774ab7d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -435,6 +435,8 @@ else
 CFLAGS_UBSAN :=3D
 endif
=20
+CFLAGS +=3D -fno-stack-protector
+
 ifeq ($(CONFIG_LTO),y)
 CFLAGS +=3D -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) +=3D -plugin LLVMgold.so
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d457876659..ff0d61d7ac 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -17,6 +17,7 @@ obj32 :=3D $(addprefix $(obj)/,$(obj32))
 CFLAGS_x86_32 :=3D $(subst -m64,-m32 -march=3Di686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 +=3D -Werror -fno-builtin -g0 -msoft-float -mregparm=3D3
+CFLAGS_x86_32 +=3D -fno-stack-protector
 CFLAGS_x86_32 +=3D -nostdinc -include $(filter %/include/xen/config.h,$(XE=
N_CFLAGS))
 CFLAGS_x86_32 +=3D $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
=20
--=20
2.47.1

