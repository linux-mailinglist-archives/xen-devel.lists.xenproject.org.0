Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123AF2F2AFE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 10:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65540.116143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzFnz-0001Hz-FL; Tue, 12 Jan 2021 09:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65540.116143; Tue, 12 Jan 2021 09:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzFnz-0001HY-BO; Tue, 12 Jan 2021 09:17:35 +0000
Received: by outflank-mailman (input) for mailman id 65540;
 Tue, 12 Jan 2021 09:17:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ydM=GP=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kzFny-0001HT-28
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 09:17:34 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05d19d56-f315-4a50-a554-4f4c8043af24;
 Tue, 12 Jan 2021 09:17:31 +0000 (UTC)
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
X-Inumbo-ID: 05d19d56-f315-4a50-a554-4f4c8043af24
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610443050;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TWiVvu9tYjt6t29IOS3BArLsxA0O5Qzv5omLttOHMW0=;
  b=YnTxez9hnysEm2pYEW+eS2Inrkiv2e9NM3b5u9SEM1Qs2T3bK2DA/jsD
   0L2dr6Y94v/H/QYHn15ujbAq1YpqBPKGQ/RaiCSJDMKB7ZBIHnfoIdiIz
   Smr0iSfEv9lmBW4gPL2gZ5znTHAQf4LUddCgRoBDbC3ohrR+MJdL2LJxP
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0szDs+QY9sfhkyoFWYk01YUHy3eFSUATouAqYkmgOD44G5DOQAk8FNSH/2qK9SWOzC+Y4fkKNN
 zU+qXXHf8LPHW8nEYJTXeeuQbWDHDCmAaqq/t/obFfL1FAjyR809kgWYHy7nvRhliLAi0xGM3m
 HJwQrzaSZuT+jhUgRHXP/n0yuSfaKZN77LbTlOrwRVK/oqlNmekG05rXu9yR1Y71rjbkiDj295
 3Rx9cHn9T/gjqfq4xCWlJKet9oR5uCRNYwllijKDaII/EV16TQDEjXiJR+kLl6ufZSBIRAniDz
 fsU=
X-SBRS: 5.2
X-MesageID: 35113250
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,341,1602561600"; 
   d="scan'208";a="35113250"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ7CXDMufYaXmwDJo65mryviYxUhIUmipbm+/8zdSl2jNKlz/35w4ym65u03XdQ3V20bcKQBuzUoEKyDa7d2QeX2oOj2S3pHWAwob4kqy1S85TTd0HODRJWJN/1n6aASQrEkD4J+v7vOCc0XU9BSvtUN+flTBLn5GpXLshH31iB1PkFJ95aqvaRbo3DniUhmFjWlxUmI5v6Fyfc654DThWgEaDhWA3tHTvAMzI91wx/RQx5yGgixaXT2PHqI+IWnwt3jRg9vUMVFHC6dXLJRFx/phhV4eb5d0sB8BrsdPajGtS5WnYwZncm3nWeGKqmhLbAMEVkFDs/8OkvMnqsblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ilOrODlSRn8qe2BJ4bDsOnWpXL19hvG+wiVa6NULLE=;
 b=LRMySDGgPEOy2YkztZK04pxh0EfpyZDUoKTPu4kfvt+dieKxoGOm3KBU2lXyU77UNbVs8f9sWOD8XVSf874K0y3ExAWxFrxEa9aV3HjGQmXW9PwsT26Jpx3I/haID+Uy8OtXgqNrwF5oY3PtMTJa0VcxLtwSUBiRzLiogTgeMs9Yq3OovFXTA0Epi8MgSx9fVbzMHL0E3TSijFzgJt0/GW0jInUv4lx04BRHpCNKe4yt1WD+Utt5Qvp2XPBDQt5kIJW2vGs2bkEAcYNYfxquDaDfEPnGRuwhulKE1EJ6DFNba3b/xZ/Px684M119XVfvhpvnVcD8mBFp73t64z0HCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ilOrODlSRn8qe2BJ4bDsOnWpXL19hvG+wiVa6NULLE=;
 b=wj8LWaePtxPjwru/j6xARvNIitJUbUpO2aQvvjmneIsNs92msjjTzzDBUt/XIkSnXm8l4IdGR854Hl/2qSsChFb5F2CuN1IJWROIlszT/EvC8XoHsIutrWEhC0Q1PVOz12j5tkAqqMAbzkzH8aGZxuqaR8sn5fbxdxh0jIdHoaQ=
From: Christian Lindig <christian.lindig@citrix.com>
To: Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [PATCH v20210111 34/39] tools: adjust libxl_domain_suspend to
 receive a struct props
Thread-Topic: [PATCH v20210111 34/39] tools: adjust libxl_domain_suspend to
 receive a struct props
Thread-Index: AQHW6EE9ZXoBywRVqUWT1eISSICrC6ojtq6M
Date: Tue, 12 Jan 2021 09:17:26 +0000
Message-ID: <MWHPR03MB24453D79A1C0F7B2C4D194E9F6AA0@MWHPR03MB2445.namprd03.prod.outlook.com>
References: <20210111174224.24714-1-olaf@aepfle.de>,<20210111174224.24714-35-olaf@aepfle.de>
In-Reply-To: <20210111174224.24714-35-olaf@aepfle.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d563627-7a82-46f9-7fb0-08d8b6dae0b3
x-ms-traffictypediagnostic: MWHPR03MB2782:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB27821EDCAFCA08FBD96A07DFF6AA0@MWHPR03MB2782.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uX18SoRvRMi/8momp7C4YMDMhStWowL2W17/MWBoRMxqc62co0hRswqFvSq2JFGXIt459LgAk8+NFujrUIHoaHXBkK/653Ib05y1UWCmnOdRdAnnI3H+dAJAVHBUiFLxWKnV78t28ln/z20xbNVepR3GInlS67e/6UUeSV9YD83tPGwmqotO9pIHWRSz8pJs38LAaXBt09PCPwuHEYuyIlXn5qbEW3E9/alF6fJ3cBW1DbILNVFXMa5hs20kCWoCpo7jVb97YeoupGTLoiMQxRmp7RFXbIhjbK3XxpOdqXnheEEBQ4+Rn80oDi/ibTKfLjKJ+dsbV/BJFkT4Y5WUrS7HpUXyNtBZcgvLQb8P3Crd1Jx4HO1W7FFw+dp9DNyd77G36CzPjFN5qOJHozhzpg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB2445.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(66946007)(33656002)(66556008)(55016002)(64756008)(66446008)(76116006)(52536014)(71200400001)(91956017)(8676002)(2906002)(83380400001)(66476007)(5660300002)(53546011)(9686003)(8936002)(44832011)(4326008)(26005)(316002)(6506007)(7696005)(86362001)(110136005)(186003)(478600001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?F1VK7QrzitxW8kmB5mRX7pwnijo4EzuLZjBoNz7sfRVSp0C4FVnyznwcl6Tb?=
 =?us-ascii?Q?m2Ve6GzJwZ0LmB6PbNgEtGFS2kIfbkXUAbGiGUJUqdddQRdGaFOVifb2JluA?=
 =?us-ascii?Q?+53m+Pir2mmqbvnneMU1PuADVbqtXVWDAWwgCjDbgTUvGam1V5njZura8qUb?=
 =?us-ascii?Q?lqOhlwM+rq9ZnLO8s4Jr1lS14Oplk9LJz5L6LD9GFVaTsFnjmAkny4kOOepb?=
 =?us-ascii?Q?Yenje827F1VomwoET4Dypk1PRdPKkZ/aILnnRN/6spY+vVjatPj8e8Zi9xGL?=
 =?us-ascii?Q?PnUOQ4dWX5p4LUesKxYJMZT68VB9+lfN2RduxDoWVoIfGgzrxozV1JWPPX8b?=
 =?us-ascii?Q?BnVhrQwOU/BOiAAbGqzJYCdIIjOFwVId1loRIuCciCeowdQ3GX4tOt8iS4Xu?=
 =?us-ascii?Q?s0ohsUb5EhuL38t5no1HQBPd7lGNFPEI9lvWkDLTi6+zB/3qvr7UAPHm15PQ?=
 =?us-ascii?Q?wWpyFt/VmAIgendOebPmMdhNiIy5sOe3Co9GIwdkvLW7wYNdfbaIC72fFm1r?=
 =?us-ascii?Q?SEFBLW+K/F7s76Kdd1PK3528Yh9igo/IFc4ysAWrLaCVphXY8l42p0RZC2oa?=
 =?us-ascii?Q?SUIrUIjaW7pWmG1ecePzHA1alHYiD6+CF36BNwRRtZcUR+HC4r9617P0EYMh?=
 =?us-ascii?Q?XMsGYUc9Z9bC6OdjqMU3WG502UIxAcbuXBufEi7M8DDL4i812KCjlXq0F14i?=
 =?us-ascii?Q?ifkuAzUAfSzUmDjJPte41dBzQqYcs1qzqC9veepfbjWdMI77BU5dj0GBYNbK?=
 =?us-ascii?Q?K3woxGExg80oQ+Is1MXGnXX7ucY428QSDR3Lr95IG6uuS5UySBX1k64lfTXz?=
 =?us-ascii?Q?aSPjsyZrPRBJSqy9pDOv5c0/EBNqc53SpYQCwdlnNjR/ugtWWywJYUQKkM0r?=
 =?us-ascii?Q?oMFlSG7i2Q77WLazUpKZRZiTQVLVunLlgJHtGDww8rHKNBvhZNevfg1hu7Gb?=
 =?us-ascii?Q?lI2lBtnLOm4DdTk3YpmwV6X0WThooTtpPz5sZqoz8nA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB2445.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d563627-7a82-46f9-7fb0-08d8b6dae0b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 09:17:26.0251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNfdxjQW82R4gxmayJdeYD4Xja2FxEtHG5iiH28LoDrp19Dm0q1Bu2NgmpADDUXXCSF6krMHyphkibc8TxmLzYvxls+NQrC81j4xkDbvzLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2782
X-OriginatorOrg: citrix.com

> Upcoming changes will pass more knobs down to xc_domain_save.
> Adjust the libxl_domain_suspend API to allow easy adding of additional kn=
obs.

Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Olaf Hering <olaf@aepfle.de>
Sent: 11 January 2021 17:42
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering; Ian Jackson; Wei Liu; Anthony Perard; Christian Lindig; Da=
vid Scott
Subject: [PATCH v20210111 34/39] tools: adjust libxl_domain_suspend to rece=
ive a struct props

Upcoming changes will pass more knobs down to xc_domain_save.
Adjust the libxl_domain_suspend API to allow easy adding of additional knob=
s.

No change in behavior intented.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/libxl.h                | 26 +++++++++++++++++++++++---
 tools/libs/light/libxl_domain.c      |  7 ++++---
 tools/ocaml/libs/xl/xenlight_stubs.c |  3 ++-
 tools/xl/xl_migrate.c                |  9 ++++++---
 tools/xl/xl_saverestore.c            |  3 ++-
 5 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 6546dcd819..94b8f1095f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1667,12 +1667,32 @@ static inline int libxl_retrieve_domain_configurati=
on_0x041200(
     libxl_retrieve_domain_configuration_0x041200
 #endif

+/*
+ * LIBXL_HAVE_DOMAIN_SUSPEND_PROPS indicates that the
+ * libxl_domain_suspend_props() function takes a props struct.
+ */
+#define LIBXL_HAVE_DOMAIN_SUSPEND_PROPS 1
+
+typedef struct {
+    uint32_t flags; /* LIBXL_SUSPEND_* */
+} libxl_domain_suspend_props;
+#define LIBXL_SUSPEND_DEBUG 1
+#define LIBXL_SUSPEND_LIVE 2
+
 int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
-                         int flags, /* LIBXL_SUSPEND_* */
+                         libxl_domain_suspend_props *props,
                          const libxl_asyncop_how *ao_how)
                          LIBXL_EXTERNAL_CALLERS_ONLY;
-#define LIBXL_SUSPEND_DEBUG 1
-#define LIBXL_SUSPEND_LIVE 2
+#if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x041500
+static inline int libxl_domain_suspend_0x041400(libxl_ctx *ctx, uint32_t d=
omid,
+                         int fd, int flags, /* LIBXL_SUSPEND_* */
+                         const libxl_asyncop_how *ao_how)
+{
+    libxl_domain_suspend_props props =3D { .flags =3D flags, };
+    return libxl_domain_suspend(ctx, domid, fd, &props, ao_how);
+}
+#define libxl_domain_suspend libxl_domain_suspend_0x041400
+#endif

 /*
  * Only suspend domain, do not save its state to file, do not destroy it.
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domai=
n.c
index 5d4ec90711..45e0c57c3a 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -505,7 +505,8 @@ static void domain_suspend_cb(libxl__egc *egc,

 }

-int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd, int flags=
,
+int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
+                         libxl_domain_suspend_props *props,
                          const libxl_asyncop_how *ao_how)
 {
     AO_CREATE(ctx, domid, ao_how);
@@ -526,8 +527,8 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid=
, int fd, int flags,
     dss->domid =3D domid;
     dss->fd =3D fd;
     dss->type =3D type;
-    dss->live =3D flags & LIBXL_SUSPEND_LIVE;
-    dss->debug =3D flags & LIBXL_SUSPEND_DEBUG;
+    dss->live =3D props->flags & LIBXL_SUSPEND_LIVE;
+    dss->debug =3D props->flags & LIBXL_SUSPEND_DEBUG;
     dss->checkpointed_stream =3D LIBXL_CHECKPOINTED_STREAM_NONE;

     rc =3D libxl__fd_flags_modify_save(gc, dss->fd,
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xen=
light_stubs.c
index 352a00134d..eaf7bce35a 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -614,10 +614,11 @@ value stub_libxl_domain_suspend(value ctx, value domi=
d, value fd, value async, v
        int ret;
        uint32_t c_domid =3D Int_val(domid);
        int c_fd =3D Int_val(fd);
+    libxl_domain_suspend_props props =3D {};
        libxl_asyncop_how *ao_how =3D aohow_val(async);

        caml_enter_blocking_section();
-       ret =3D libxl_domain_suspend(CTX, c_domid, c_fd, 0, ao_how);
+       ret =3D libxl_domain_suspend(CTX, c_domid, c_fd, &props, ao_how);
        caml_leave_blocking_section();

        free(ao_how);
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index 856a6e2be1..fc9f69bf06 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -188,7 +188,10 @@ static void migrate_domain(uint32_t domid, int preserv=
e_domid,
     char *away_domname;
     char rc_buf;
     uint8_t *config_data;
-    int config_len, flags =3D LIBXL_SUSPEND_LIVE;
+    int config_len;
+    libxl_domain_suspend_props props =3D {
+        .flags =3D LIBXL_SUSPEND_LIVE,
+        };
     unsigned xtl_flags =3D XTL_STDIOSTREAM_HIDE_PROGRESS;

     save_domain_core_begin(domid, preserve_domid, override_config_file,
@@ -210,8 +213,8 @@ static void migrate_domain(uint32_t domid, int preserve=
_domid,
     xtl_stdiostream_adjust_flags(logger, xtl_flags, 0);

     if (debug)
-        flags |=3D LIBXL_SUSPEND_DEBUG;
-    rc =3D libxl_domain_suspend(ctx, domid, send_fd, flags, NULL);
+        props.flags |=3D LIBXL_SUSPEND_DEBUG;
+    rc =3D libxl_domain_suspend(ctx, domid, send_fd, &props, NULL);
     if (rc) {
         fprintf(stderr, "migration sender: libxl_domain_suspend failed"
                 " (rc=3D%d)\n", rc);
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 953d791d1a..476d4d9a6a 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -130,6 +130,7 @@ static int save_domain(uint32_t domid, int preserve_dom=
id,
     int fd;
     uint8_t *config_data;
     int config_len;
+    libxl_domain_suspend_props props =3D {};

     save_domain_core_begin(domid, preserve_domid, override_config_file,
                            &config_data, &config_len);
@@ -146,7 +147,7 @@ static int save_domain(uint32_t domid, int preserve_dom=
id,

     save_domain_core_writeconfig(fd, filename, config_data, config_len);

-    int rc =3D libxl_domain_suspend(ctx, domid, fd, 0, NULL);
+    int rc =3D libxl_domain_suspend(ctx, domid, fd, &props, NULL);
     close(fd);

     if (rc < 0) {

