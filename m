Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE7BA872D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 10:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132648.1470922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZC-0006ew-BH; Mon, 29 Sep 2025 08:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132648.1470922; Mon, 29 Sep 2025 08:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZC-0006ZF-6y; Mon, 29 Sep 2025 08:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1132648;
 Mon, 29 Sep 2025 08:49:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbRY=4I=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v39ZB-0006Tl-A8
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 08:49:05 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26940530-9d11-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 10:49:03 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PR3PR03MB6668.eurprd03.prod.outlook.com
 (2603:10a6:102:5f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:49:00 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:49:00 +0000
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
X-Inumbo-ID: 26940530-9d11-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8Oc+Ixp0NMk3OqvJZJfPdlMbhPAM8CXVmWMfVkug3OfMr/eQhBTeI3UZFyLF8JeTJRtaZzA/cqSYPHV8o83S5ecfZ+qxNcqgafZ6HQtMB8YTAkPUGpfDuzpz8SAYZ37ynqi3Lj3iUSqVzDsqeCPsOrpE1Zu51q7DG2NX0lFGAMkN2Iav+hKNbljnFmwMIvX8I63khM8XgkfioDvPrXU9vk8TTJFaI8gbvVA+j6mPFOL6pJpJFVxFPP2qjIe0/17nBtvlcia4Lc3YcPHluzp8LkMegyNF7Himfi0ZTuscc9EZHTIugAtlJ/Rc9BJc0eBuZEaTft8dCd5nKhhyzaTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efud+6/iP4lT50/wRtbn/W7+E9nJbLdZ7Frmkpck1hc=;
 b=Xlzp6jq8cvn8IqlYX3oQhWbarcmdyjXA+3OK0xNXMhWC/iba1qZ3+Exizdxg/tienbPwykZoje5/m9zgZHwaFkiQBmBkVLqCEZCE28OXErY8x5Jj6/apuwXjYbnemOc/DTzhblF1b/Gh+HJIKX/K2T+DS1kQkPlYFi17d2ZbybNS3pFLmInhjFVjYuupaEvo1a6kVT+s0rddQ9zGQobOCp6KEDSxdvbu7VnAI2djY8Gc77I2N6qjd/DCdkp7dc7LFUyz2jUPwfeEnKcIExgrRM8y/VNnT5jvvEtupuHOp6ZUD/hhWiNJZGvkh+baJFos+mVA4KoKPSeFceMxVBXOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efud+6/iP4lT50/wRtbn/W7+E9nJbLdZ7Frmkpck1hc=;
 b=sGtRmm3+A1PdzFeN2JoPyZE0qWD0knRtxCpLE5LCTPTTON8hfqJdBd4f3nQVOFDnn8235QA+0nIObgS3tBmMN9M/3mh5gc5av6aK4NwiwnyTin0eY2FPae7xgxjWvuqW4daMZVQYvRZA8R4GIGKjcqUvNQk5EIqNoK1RC2yqvFzqbSSVSGy5Aken5Mf5gAFRdliRevelRuUIbSrmm1xm5RSr4dYbPdSEcrkTBELZqhAxrGOq1OhdiAn+KxSuCu1WLSKG5vE2jAkcsELktUtScCMTbyeQyrshPRPnpSCEF0yPchzLzdxxHlW5ML9HlRVH55fsgSQ3l3DFQUdBhWXvWA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v2 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcMR3m6aPxOGsuTkamM2L1894cNA==
Date: Mon, 29 Sep 2025 08:49:00 +0000
Message-ID:
 <e4f4107e54f737932904c76aa65d41d4453780df.1759135193.git.mykyta_poturai@epam.com>
References: <cover.1759135193.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1759135193.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PR3PR03MB6668:EE_
x-ms-office365-filtering-correlation-id: 5d4ac18e-0618-4d41-93c0-08ddff3508d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?irkHwfFGjNotZByDglfCeb6Yp/UIHL6Vv1f8orCkmYolX6dWEtFEi1sH0J?=
 =?iso-8859-1?Q?rofJuWUG/c/tuhAN7cHq1UzVT0pn7UZ1sE4ix2jm6/0IcdzJVPFtqjJjVX?=
 =?iso-8859-1?Q?lxnNdREZjorXBFfnU/3pJGYDVwHYHBi80Lt9S7NViaJ0GnLZDfDri/nrMJ?=
 =?iso-8859-1?Q?Kv8LqFrzhaZCszA7OFr8npx7SVhznV24ySi2R6oQEN+jUhcvDGgQvKk4T4?=
 =?iso-8859-1?Q?yPOCBVa+Zj0rBy2MaMEfer39rt3Jo1WhHAYF1RwCnRKagdDHSoReXrkjhN?=
 =?iso-8859-1?Q?r6O/5pUOR7dCh3INVIL6oxsRK716ljHVa/UO54j5s5qMkWYkWE3L5SYsC0?=
 =?iso-8859-1?Q?49IPqIFxSgsm/1be4wFhU5tBjGqfFX39LVaYnyDK14f1+oV7mLA7AQLkyG?=
 =?iso-8859-1?Q?y3QlvVhknPUp5J2giooVZs+jPzMnatyNXw96ZxpQYZfKdbicKl+OKxNVjN?=
 =?iso-8859-1?Q?H+hvnUdBvzRkblpGkrIr9Aeq6zBOUee0Wtf8zjQXxcgKROAmpEGbhN6cZV?=
 =?iso-8859-1?Q?a/iNiGBXx8t0HfftQdsZVtteyadAaRxQvbjr3C0KjfwKhS4BNdxek5oLDp?=
 =?iso-8859-1?Q?nVMEZyB20wK715kv3P2Nnge9uJnTtfdGVjb7GB2XX1WhUprCyOMF3+L9Os?=
 =?iso-8859-1?Q?yC0kGeDFxXMzlPHRCt89Q45xajPLG5GvwsHfESaLggnwdDjgI2VmNrJi9w?=
 =?iso-8859-1?Q?Fw0MCiDvhrsUoX2ysC5KgYGv6kCYwk9ojKgt8/8SgsZM/4By/saB+l3cSH?=
 =?iso-8859-1?Q?rh47+J9SSa1Z3qV4e/iU+L7QVir5Mp91dVIiceap5I6AvPK67yal6eXdg8?=
 =?iso-8859-1?Q?AEe7tvFmJKEAA8ExNDL3nAIw1oE0QtYelyLNXtm/XAEw1Qde4edFyw6sOo?=
 =?iso-8859-1?Q?I11QplWuyWpE2R0gVNKhUk6PsfW8+KjpwbB1Tq9Ngk2UpaPOmkxZ0ZphOd?=
 =?iso-8859-1?Q?S9F52nqtdvszInUveNKoqelRDupZm8dgHogV5sIrE1XIUtV7NMwaqVW53j?=
 =?iso-8859-1?Q?BCluUrMQBvoPYSqE0pnXqQ4HKXS6uSri8ly0xuHjd1wCbWX8l9Zl4KB04F?=
 =?iso-8859-1?Q?L7AHbqbO2iow0qUIqr4eE9rfagYboHscyuMAA0Zu0lwaTeR5Lmz8zLo9Yx?=
 =?iso-8859-1?Q?tbZyGlKKpwiMRI9W1d9Nz5KMQGfkx0hrTeRHXBoZk4Sm2WEPnJU8YjKT/w?=
 =?iso-8859-1?Q?gVSIjTpXHmSqFD8bDvEbFEFy4M3LcA5agCq7eN8R1RRX2/nhq5zfaXy5j3?=
 =?iso-8859-1?Q?+F8MtAMBrDo7fmi+tFOpyfkPD4us+H4SMsNeLmYYCfHQwE+AU+Jan37UaW?=
 =?iso-8859-1?Q?R76C5vWHrasL6aqdrnHkwrLsAT764XDNif7xK0tTGl1EO3r7D6s94G+p0r?=
 =?iso-8859-1?Q?NrCTFdTnspclw9dqtyLaUL9kGvX40jfN6+VztPdwAuBgRqgaauZwU9CDkT?=
 =?iso-8859-1?Q?DPNmIFHXZ8yYIiiMms4whqlA4Esqrf3uL+8uJEDfVsFITNxi8LSoV64iK4?=
 =?iso-8859-1?Q?cqURoFzHtjthlTSuILHswJ4G2KA8G6hZ5yDE93zryIusazhOqobjI+e4sf?=
 =?iso-8859-1?Q?PC3gJyU3mJFHlJHKdr5Myqxjt0Ti?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1jA5qmybqX1YTK2jSJ+VoDmboObk31Hocy4kXzhleYLtiHYiVugLZndwd4?=
 =?iso-8859-1?Q?9xHPLGE0WFh0gKzlnf5rp31QqJDEgZUh08OLeS01v86PqysNUvNYK4C2jz?=
 =?iso-8859-1?Q?k1EhLqKpkemYD8XjoNOT9PlxC7lcSWu3Raeyy5gLM9HFnGkNzAd14417zc?=
 =?iso-8859-1?Q?iKCdN/8QEO/ez5QjTN4JYVox+b1kBORvPSvdvlqMsjM1qRzDMQm6++iRDn?=
 =?iso-8859-1?Q?8EWA+eQmL0MAkAd49tuDRE2MEEGn9AthhaNOGXLML//Yc48yphV79Na5hv?=
 =?iso-8859-1?Q?aK6PUM36GhGAXsYw+vt14dX+IDK/9RnQvt6Y1C/QbLziYsnDbpfKMhGbcK?=
 =?iso-8859-1?Q?+r6bBth/XSquPZFl7PdR7grnSrNb35AJzdjVLnS3L7eyao41JtpBT5lo/2?=
 =?iso-8859-1?Q?x2tyZkTfKbyfqfZ9DpOTrG0dTj2jRaaY0AhY29vFPRAuOYb6P0XpSqHsX8?=
 =?iso-8859-1?Q?gTteHu8XTmavt3ygQTD7dGJH6LTAPOwwl3tVltCxMncJovtx61vbbAnTXx?=
 =?iso-8859-1?Q?AfnBwyfhtIPkxMHLUwJvHhFKQGMXLUwNol28Huajn25j22d04FC48zwW30?=
 =?iso-8859-1?Q?NtApJrbLoXRBWR4c+TrGn7LxLXzWtomk3HiO1+tnFzs7HJwtRXJi16SXXO?=
 =?iso-8859-1?Q?pRS6rL59CgSxD6VD6zqY1SgNVGkK3DuuAhvQOh8jGTsAEiH8ybdPoGB4LL?=
 =?iso-8859-1?Q?pfbPCVoXNirXiYijJt8rTh+4bBidZMGMk9n7bX8rRfjDJiQtpvIo+pqeKG?=
 =?iso-8859-1?Q?GiuaC4Njwmrvio08jTv1nTeKjyUfMqvmHY9pnYZZfAH+oPRIEJrRmyFP/A?=
 =?iso-8859-1?Q?JPdxGYHLET9Z+MpqiMpW1USSjF99xODq2hOh18V9yjhWWOgXOakNFk4euC?=
 =?iso-8859-1?Q?sScf54iPTZ4ySwOVAsV9DfX+8L9bMpv5OobsFxHY2X3XSV8sBGB0aUN2IW?=
 =?iso-8859-1?Q?sRKFx5mu4GMQe3i+MNMaHPMmo97kwF0xYmwFl0GTasGr6WmmHsAqSSLv4k?=
 =?iso-8859-1?Q?xIPfBYK1H79yvqiHBt2j8HGvWYNveJUC96bqmRpBcHWb47TaIsZB0AlElU?=
 =?iso-8859-1?Q?Uco74Y5Uf9FFzJT977mK6axXxkdcW1nnPAVim5b/+QcLTDi8UiXB2pNM/B?=
 =?iso-8859-1?Q?lKSoDoJC4haVsjwM1L2rprt1qsq8ZUCoYEpuboul6EW2gV4v4W/WqjmsM9?=
 =?iso-8859-1?Q?1DS9Saaj1PQltDG9JDj4tRYSWKL9dL8rs0EtxbE2fywDzBUEoJ0n7BmZNv?=
 =?iso-8859-1?Q?H928tXSvZ43uyMYstCtcnuzXu1/XgHqGq88kmW1LQ26ZPqQ+zJ3XkqPEj2?=
 =?iso-8859-1?Q?zA2jHsSe6L2m6idBbcL4hn00TAaD4Zzw0qfKv7VmF7+TU2u2lPp7bqBQgP?=
 =?iso-8859-1?Q?kNMefXY7kFZcwBmAz1UBojwmLlk4dXyihkM5q+AtiQMMh29eW0YX3MESbZ?=
 =?iso-8859-1?Q?8vLNtHpD5AePXK89/xIfelW0+klsIxwUMsscEYN/qzJoXDZXUW/UaL/9PD?=
 =?iso-8859-1?Q?meXcXNndnanQcCO2XWG6hPD76Blunaql95IIrqus9TicukSz0jumt6W6y8?=
 =?iso-8859-1?Q?DArdU/SpKgn8anFTnZwRmwFZUAo/HoP2tIH70OmJpyNlEFWdHfW/f6cEaS?=
 =?iso-8859-1?Q?n233ymcYeFjjIrG+jF6F9NqdZwPEL8274Wibr5nPgeROtIEuDfwlhSOQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4ac18e-0618-4d41-93c0-08ddff3508d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 08:49:00.2742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rF4a3FCGVAmB9SPb3LCgBEItzcGhooOUPtCQpMnFvyEZ3Knl1XzyLjXdBPu9RJ0ceJD+mIW3gaNy4U/Wpy3JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6668

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them. Introduce a new congifure option "hptool" to
allow building hptool separately from other migration tools, and enable
it by default.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

v1->v2:
* switch to configure from legacy config
---
 config/Tools.mk.in               |  1 +
 tools/configure                  | 30 ++++++++++++++++++++++++++++++
 tools/configure.ac               |  1 +
 tools/libs/guest/Makefile.common |  4 ++++
 tools/misc/Makefile              |  2 +-
 5 files changed, 37 insertions(+), 1 deletion(-)
 mode change 100755 =3D> 100644 tools/configure

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index e47ac23d11..eb4855d93d 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -49,6 +49,7 @@ CONFIG_LIBNL        :=3D @libnl@
 CONFIG_GOLANG       :=3D @golang@
 CONFIG_PYGRUB       :=3D @pygrub@
 CONFIG_LIBFSIMAGE   :=3D @libfsimage@
+CONFIG_HPTOOL       :=3D @hptool@
=20
 CONFIG_SYSTEMD      :=3D @systemd@
 XEN_SYSTEMD_DIR     :=3D @SYSTEMD_DIR@
diff --git a/tools/configure b/tools/configure
old mode 100755
new mode 100644
index 5abd44e21e..5cf5381c0a
--- a/tools/configure
+++ b/tools/configure
@@ -728,6 +728,7 @@ LD86
 AS86
 ipxe
 LINUX_BACKEND_MODULES
+hptool
 pygrub
 golang
 seabios
@@ -834,6 +835,7 @@ enable_ovmf
 enable_seabios
 enable_golang
 enable_pygrub
+enable_hptool
 with_linux_backend_modules
 enable_ipxe
 with_system_ipxe
@@ -1519,6 +1521,7 @@ Optional Features:
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
   --disable-golang        Disable Go tools (default is ENABLED)
   --disable-pygrub        Disable pygrub (default is ENABLED)
+  --disable-hptool        Disable hptool (default is ENABLED)
   --enable-ipxe           Enable in-tree IPXE, (DEFAULT is off, see also
                           --with-system-ipxe)
   --enable-rombios        Enable ROMBIOS, (DEFAULT is on if ipxe is enable=
d,
@@ -4807,6 +4810,33 @@ pygrub=3D$ax_cv_pygrub
=20
=20
=20
+# Check whether --enable-hptool was given.
+if test ${enable_hptool+y}
+then :
+  enableval=3D$enable_hptool;
+fi
+
+
+if test "x$enable_hptool" =3D "xno"
+then :
+
+    ax_cv_hptool=3D"n"
+
+elif test "x$enable_hptool" =3D "xyes"
+then :
+
+    ax_cv_hptool=3D"y"
+
+elif test -z $ax_cv_hptool
+then :
+
+    ax_cv_hptool=3D"y"
+
+fi
+hptool=3D$ax_cv_hptool
+
+
+
=20
 # Check whether --with-linux-backend-modules was given.
 if test ${with_linux_backend_modules+y}
diff --git a/tools/configure.ac b/tools/configure.ac
index dada1c3b15..3a0644ef89 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -90,6 +90,7 @@ AX_ARG_DEFAULT_DISABLE([ovmf], [Enable OVMF])
 AX_ARG_DEFAULT_ENABLE([seabios], [Disable SeaBIOS])
 AX_ARG_DEFAULT_ENABLE([golang], [Disable Go tools])
 AX_ARG_DEFAULT_ENABLE([pygrub], [Disable pygrub])
+AX_ARG_DEFAULT_ENABLE([hptool], [Disable hptool])
=20
 AC_ARG_WITH([linux-backend-modules],
     AS_HELP_STRING([--with-linux-backend-modules=3D"mod1 mod2"],
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.c=
ommon
index a026a2f662..774b1d5392 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -25,6 +25,10 @@ OBJS-y       +=3D xg_core.o
 OBJS-$(CONFIG_X86) +=3D xg_core_x86.o
 OBJS-$(CONFIG_ARM) +=3D xg_core_arm.o
=20
+ifneq (,$(filter y,$(CONFIG_MIGRATE)$(CONFIG_HPTOOL)))
+OBJS-y +=3D xg_offline_page.o
+endif
+
 vpath %.c ../../../xen/common/libelf
=20
 LIBELF_OBJS +=3D libelf-tools.o libelf-loader.o
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index c26e544e83..f783f16ae6 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN-$(CONFIG_HPTOOL)  +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
--=20
2.34.1

