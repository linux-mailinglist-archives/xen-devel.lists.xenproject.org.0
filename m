Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84E9EC1ED
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 03:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853575.1266995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5e-0004qC-Be; Wed, 11 Dec 2024 02:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853575.1266995; Wed, 11 Dec 2024 02:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLC5e-0004oK-8s; Wed, 11 Dec 2024 02:04:38 +0000
Received: by outflank-mailman (input) for mailman id 853575;
 Wed, 11 Dec 2024 02:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZaY=TE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tLC5d-0004a4-8x
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 02:04:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2607::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4575a80b-b764-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 03:04:36 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9365.eurprd03.prod.outlook.com
 (2603:10a6:20b:57d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 02:04:31 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 02:04:31 +0000
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
X-Inumbo-ID: 4575a80b-b764-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqsXJqDz9igsmEp6Br/L++gm0CBerS4O09IZEZUzmZaGtkTlELYnajTMtHIHPfrvTjgF0Rt5miJwN8Oz7sUzUESdeqQPUyoT011L5VUIcvnJi2asQ90vSYZUrqXrn77yBTh4+0ammVNAQLNUfn0lYhdkVZfufV5C4+Iimufx+h3GBBBrEwhx+EfQ7xecRk9pp8Pg3oQyeC9Lcm3FcgcpVpXfYWO3ZTeyK7jZ4RdJxx4t+ixzmmFOk4DXhlV9opKY2wO8o80/25YL45N72L+/6jzOaput/MdAF/epkZL9MRrwP4SgxNfLLy7+b+5oAfX6vOFriocGLFux8NiUvx0fpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SBVbnyLD0YPGsHrZbGEmWYLQu4GIjmGITJeCVcu8vk=;
 b=fNnkVxVw61t8Oa3qbWWo0MTbeD1J+F9g8mZoiq1lSTPfGWpYWpyCX2DuvOE1VYL3lYWvdA6Ger8EYjl2GDdloG7w4QUGSck3vxOg0MHZDK5jH0mf+q01UykhqtUU0wxOfquD47S/vnf4Evb/j7yLi6Ik4onHqh7Ep4dXzNjmNR4b1Cecl8osIhfQk/sIkxAlIFD7kObW36haeHAWIm6eI9ozUY0M3z+WLVyGGXPcIQ5f753c5oP6NHk/Bpsm3RBso8dC+DToX1lyQ7PsulIgu2Jj6sDu9NZUL+uk4toPLbsGks2jaVO9Zo2xBJJw0NsJsX2gOj3EZpQSe91CbWYW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SBVbnyLD0YPGsHrZbGEmWYLQu4GIjmGITJeCVcu8vk=;
 b=UEGY2LCgSvh5EQ5iIwGEdFVE5kWvND8GihaXi7iBdGpNihebU/yBumi8K/qkaoPdbsmRfkWlfEBWzwrb+c942lB3AjabfJkrAwt7KYH5wdAoS37312zZpDHL8OzS/vKMe4ghXN53DtPXINjO12v/8ITm9chAA/H7F5E5V2vErCX4r21nULKWofbz0qe3mxiS22ld774XjeQyH010BguCwH7UHQJjObHhmQVbJCmVqPYQMqVY+CDPwlohEN/n4f1UhS8gBw0TJY2mB2vnQHc4FunkwWCJPLx4kfQIuCX4JZqu5jbDdYXuB//HbdVIo6H4eaZRteYnYxPgqiRhGHVwlw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/3] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH v3 1/3] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHbS3EDx5+OWqJotkip8Dq3lsA6Cw==
Date: Wed, 11 Dec 2024 02:04:30 +0000
Message-ID: <20241211020424.401614-2-volodymyr_babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9365:EE_
x-ms-office365-filtering-correlation-id: 85d67761-3a4e-4e58-b5df-08dd19882702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?L7L4DO48bdEtrdL4IhxWVjAp2nULU1eNfoeBmhimrjO6nwT0Ty4lCfIUHe?=
 =?iso-8859-1?Q?lzrxNAcfPgYzpaUA9O068zUKgLaepD92YUHkDvuFOBoJw81LgiDnKjjimd?=
 =?iso-8859-1?Q?zqCSfkokaCioqW4Pb0n5SXdTUMPxfmDv/egPB06H1SRQJUAHEqPEw6juLV?=
 =?iso-8859-1?Q?NwWsEYk8vZoprUwsiCssZuBEV0y2BfBfmiHgKVuOe8eLP36hcqJiUSMc6l?=
 =?iso-8859-1?Q?sOfaVvazwSAm90sGXJLesj7sjRya3JJIQmfnr5cObn1/S5Zvz3Tw2kNg2X?=
 =?iso-8859-1?Q?AE+NC0PNu4xyYEqGO4lKwvZ2/Q3thSAr77eFKXR6x1QKH38MskWKsIpBOX?=
 =?iso-8859-1?Q?b+g7L8AAwUtA8I0kw+nc2SXVx96uLQIA9QfpSRQ+aFVkrEJbmX3F0juR6C?=
 =?iso-8859-1?Q?kIsAWrQ588NOMF609kF8igvstOuE+XFVYUUqpfWzSlHZ2wHJVKopbx2H5H?=
 =?iso-8859-1?Q?Nm5r3XJ1n5K4ztfErdYVPbZC2humGuS/LS0bs6eRSdZhFsY7l/7rw2d4nA?=
 =?iso-8859-1?Q?c0wOhun5xMNnuBXZczlX9U73DDzcoOqpUaF1twIi/4iF9LXlEIRCjqKigu?=
 =?iso-8859-1?Q?53pFLUEomMkAb4oJ2x57uUNneqn/aDOHBxJdenGkAKltEv29eTwpDSIroE?=
 =?iso-8859-1?Q?wtED5u3Z8fgqZtA6ajoZlZQGoapivFiUEaOSjzR/F8uF1ok4bMdl3ntmFN?=
 =?iso-8859-1?Q?2hW5OP0btMiUdHuCx9Snw1FIHEyKEj9/dkcQ4aU/x2sDcbk0omenneTiBe?=
 =?iso-8859-1?Q?33Bmn6lkEbw5IP1zw881z+Lo5rxJrF6yvVe5uCZnJcGyevyDDPVIEZoswz?=
 =?iso-8859-1?Q?/Co5ygKpt1Pp37Wwm0fVXRH8WylxhdChmL3RQH1MAajuSJfTfWM7QjA5gL?=
 =?iso-8859-1?Q?xJvpUvD/Usg+h1aW82QV/HSJlj0NxNhj4USQEqj+AnKrgNtllITj2ntip+?=
 =?iso-8859-1?Q?IjA/B8r5fTYqPs+Q16AyeaLTaN5ZDCnb8Uq8/ZxxIu7U2dTo1ixPCnJJQh?=
 =?iso-8859-1?Q?H48HtBhVu0462O/dMgBpJEQhCtLv+IUsjuwY50DjJSo30toDIosKDBaTIy?=
 =?iso-8859-1?Q?dDwX0qYIwgUCN4cszWHQ+naqxzgwAMcou/CMWgoIvC1//P+Wpfq0hDZjNu?=
 =?iso-8859-1?Q?uhT4sfvBBvhgZs+SPQDh8OFF0XpnZux7s662YcgC92dEflP7HNYv+yrkis?=
 =?iso-8859-1?Q?Et7/+5J7adeXzOvO0eStXFnl5XKuVxvY0mfUzp0jQrwtSiKzAxnFBfXytZ?=
 =?iso-8859-1?Q?M+8ofZ4fgh0YJloqims3+74Bb5R2C4jetggANV4tuUn9zRFVGlobIRkwiZ?=
 =?iso-8859-1?Q?Il3vmx9sinKdXJ0NwLHwvqlS4+u7KrsfBSH+/s40ORGtrtbH6aJvV1i57e?=
 =?iso-8859-1?Q?DDjXjKeELZEodksvKcEmkFWEfD28wu3FEv7BVrFycBUPtjPrNswGi8AhSn?=
 =?iso-8859-1?Q?PKpYsTZIDSJBsVO/R32j2runrd3ERqvYDwfcWA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PBTosIs+MohPGckGf68nIKsdSyx47ohfCF9DAwZDWDcReFgw4aGrZMR6/3?=
 =?iso-8859-1?Q?l2tJjEO64ODzszXl4u6YmXsZZ8rscfLQOqCOMcIKpyXzPZgSu/EK9K7hlo?=
 =?iso-8859-1?Q?KKeQKgmkaBuUClN5h2epe1quwzJZXVCBBRg4vWQsJ+TxVOJKGW7zQemRsT?=
 =?iso-8859-1?Q?SfYuyzQOmeLXu6Q4wWUp40tvs32ojZOZlwKAizW/ZHJjAQGCdSlvTENvfL?=
 =?iso-8859-1?Q?QQ5qSvqa2bUc41XM9FmwG2XAYsUuJVMSlhbvciRmbGY3aXw8Pga+TLksI7?=
 =?iso-8859-1?Q?xZJur4Nc2CMIPyWHDTCVTNboLUYn/GtZpYQ+LKPefPIn1YhcsfMlulsiOg?=
 =?iso-8859-1?Q?umHqDQTiDt3/idP5Z+MjAYctAtWapvl0GoVq4WVLX4vZcIITUK24ZN2jEM?=
 =?iso-8859-1?Q?En3mEAZHaPzrJ+DlXl7lPKVvkfuUL0//XHCOhHHiSg4REKwdliSteMdWrU?=
 =?iso-8859-1?Q?HLaPK6SczRIMZfrLWwUWK7r1o1TUcW6ZOv1TBr9qohCqsNhqcMhHjDri+y?=
 =?iso-8859-1?Q?NBlODKO/3WZ4/qsr1LtvcSXasEjX0C1BxqRMCRr6uJLKYaUD92dUVbRzrJ?=
 =?iso-8859-1?Q?NU3BSgmegnoidJUF9ut/OubQVfII54r8otjwv5OtonObwALzH8Ca82IdI3?=
 =?iso-8859-1?Q?pp519gpe51wcMRMHzreDfC2UXQ/S2qcuj9oEdaZc0B2XqhtHZkEjvtETt+?=
 =?iso-8859-1?Q?PI6a4FU1oxbOxSRtXp39+v4L5MDAUjoHMTjfNIB4Yf/xFdeMV2cCrdltri?=
 =?iso-8859-1?Q?bxJ7lFCmZuJsHQehNRYkGrWLCUDZypj2xQ2+LzLYQMjP73tcrc6s9Okbq6?=
 =?iso-8859-1?Q?R/2Kp4+4Irc547ejsMDrE/hTN8ykaO3uumcIZFpqDKb8X6u6d1LEgMSUyG?=
 =?iso-8859-1?Q?U/5yajxCrazxdwz+KWBGHqamaE9xc4gUJ+FDzPRX6wnsBVfwfDP3dfEGV2?=
 =?iso-8859-1?Q?gpsCDqK0zpSQ4kVfKT5H52s57DpghFDwHt52/srUCBLdX+iamjuJ6XjDaX?=
 =?iso-8859-1?Q?LufoL8bVitj7lMZv5eUucHhoXdpctcQeYp6MruvXzdaTUWlegZtGGxpngC?=
 =?iso-8859-1?Q?fWRmo2vvZ7FxC11APNsXO8/x2kAWT1eW/jwDZb2tFOatmkonuLgYnwdbzo?=
 =?iso-8859-1?Q?jd86UDE/rQvfxXkW/TIzn2TDcVvk13QH0ZA0cdLeYOck2zz7IR6vVMz7DT?=
 =?iso-8859-1?Q?ccNxKfC2/omyuLTmuULK8neTeuLGTq5VMWfCvvjFA/KYTB3FRIVsdwFhyx?=
 =?iso-8859-1?Q?5kERgDtghIceb/7AOEgrI5qO5kgflrwPdkCmfwgpcSuxvaPZMG5bon7ICw?=
 =?iso-8859-1?Q?mMG8b4Ma29Zi3TStvlfgzR3EMPih2Z75uYb3kA/ikjZreirVhKxMx/AHGF?=
 =?iso-8859-1?Q?+EePH+Ksd+OHPKBmjaJ1PWi9Iq+bOCAjVeuU28AfsnrusihxvBZ+nyq/Pg?=
 =?iso-8859-1?Q?XxKWuOnEl71AfGekKOzcDrbvSYlcFlUNdC3yLGsrjTCRVz6EiVu0siZHo0?=
 =?iso-8859-1?Q?8jvCUH9/XsiwffVedHsluRvX6gMfm+BfbsyktTg5/TDP0yKQB6o34vXrdr?=
 =?iso-8859-1?Q?RMrBuclfQ/s3YJYKqUJ4LaVS1E9LCzs3qfaBBrcLJ9w2U6SJIZR6i5Mb3s?=
 =?iso-8859-1?Q?OSP048ojnuDdsGsin7YixpGjP8LR2ZFlxMZuT8+V127+I5/Z1P12HoHQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d67761-3a4e-4e58-b5df-08dd19882702
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 02:04:30.2690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igq6fdkktG3Hpo2lOAzuztof057LWBbvvv0PG0S6RVCspnQ8jEb6JE7NBfnlucAI3cv7bVYgk7MT6NrrXqXHp+LJ+KTLdL+Qx7ERui52vd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9365

This patch is preparation for making stack protector
configurable. First step is to remove -fno-stack-protector flag from
EMBEDDED_EXTRA_CFLAGS so separate components (Hypervisor in this case)
can enable/disable this feature by themselves.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v3:
 - Reword commit message
 - Use CFLAGS +=3D instead of cc-optios-add
Changes in v2:
 - New in v2
---
 Config.mk                            | 2 +-
 stubdom/Makefile                     | 3 +++
 tools/firmware/Rules.mk              | 2 ++
 tools/tests/x86_emulator/testcase.mk | 2 +-
 xen/Makefile                         | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index fa0414055b..c9fef4659f 100644
--- a/Config.mk
+++ b/Config.mk
@@ -190,7 +190,7 @@ endif
 APPEND_LDFLAGS +=3D $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES), -I$(i))
=20
-EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector
+EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie
 EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-tables
=20
 XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2a81af28a1..4c9186499d 100644
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
@@ -54,6 +56,7 @@ TARGET_CFLAGS +=3D $(CFLAGS)
 TARGET_CPPFLAGS +=3D $(CPPFLAGS)
 $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
+
 # Do not use host headers and libs
 GCC_INSTALL =3D $(shell LANG=3DC gcc -print-search-dirs | sed -n -e 's/ins=
tall: \(.*\)/\1/p')
 TARGET_CPPFLAGS +=3D -U __linux__ -U __FreeBSD__ -U __sun__
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
index 2e1a925c84..34ed8c0fc7 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -432,6 +432,8 @@ else
 CFLAGS_UBSAN :=3D
 endif
=20
+CFLAGS +=3D -fno-stack-protector
+
 ifeq ($(CONFIG_LTO),y)
 CFLAGS +=3D -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) +=3D -plugin LLVMgold.so
--=20
2.47.1

