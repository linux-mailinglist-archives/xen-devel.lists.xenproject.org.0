Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7482210C3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvjEK-0004kj-FR; Wed, 15 Jul 2020 15:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uifZ=A2=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1jvjEJ-0004ke-HM
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:21:55 +0000
X-Inumbo-ID: ea332cf4-c6ae-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea332cf4-c6ae-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594826515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tIIOFUyNL3Wdct8tKDjv7nitVdE2HsIhnbVMuNFpn8o=;
 b=IwLYu36SChRIBBBTLcbK/GLBafa+Oj/izF+7E5/Y459zBbxy0CUKf/DR
 yJQnMDhlMEpKXReVdJ2SiaTwc75olwdGFRxZ3WdsDtpCXPJ9M5SMl7CwL
 nOplk8K8eGceRoLFaqbCmseeaZIh/uYA8KNuwf2jBQE3sv6R22KO+l3U4 U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: W1DqJkeJubrxKu7yPJiWNggEIR7mSRCcbs0MeMnq2nCNDXodK9+9W1jXkiyFf5tUSRnBhVhwTe
 ztUnWp7F2RqW/rFl0xj+z5jAq0XW5jpqOOJEbXtGub0MY0N6/nLa2Qm0N7yGgSJ/f3jQXW4uMW
 sChWFKxtVBqZDgOn9GpQmyM9z8d+EmpXL56aSdxzv3S/stBjExjXw8DuUzjLNwSjPnFFQEgKuz
 zQc9oazQ4wGhMr7y/9WQd3rZbSANlBx2EXMP5s9jTggeZFA1yiVU14Dcn7ibG3qIqKLdvjZPaO
 zUE=
X-SBRS: 2.7
X-MesageID: 22443251
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22443251"
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/1] oxenstored: fix ABI breakage introduced in Xen
 4.9.0
Thread-Topic: [PATCH v1 1/1] oxenstored: fix ABI breakage introduced in Xen
 4.9.0
Thread-Index: AQHWWro4sadfUNXtWUGmqr5ru6wdMKkIwcwd
Date: Wed, 15 Jul 2020 15:21:50 +0000
Message-ID: <1594826510774.33560@citrix.com>
References: <cover.1594825512.git.edvin.torok@citrix.com>,
 <6fcfdb706cc2f666069c1d0bbc59d22f660fc81d.1594825512.git.edvin.torok@citrix.com>
In-Reply-To: <6fcfdb706cc2f666069c1d0bbc59d22f660fc81d.1594825512.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, Wei
 Liu <wl@xen.org>, David Scott <dave@recoil.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

=0A=
________________________________________=0A=
From: Edwin T=F6r=F6k <edvin.torok@citrix.com>=0A=
Sent: 15 July 2020 16:10=0A=
To: xen-devel@lists.xenproject.org=0A=
Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu; Igor =
Druzhinin=0A=
Subject: [PATCH v1 1/1] oxenstored: fix ABI breakage introduced in Xen 4.9.=
0=0A=
=0A=
dbc84d2983969bb47d294131ed9e6bbbdc2aec49 (Xen >=3D 4.9.0) deleted XS_RESTRI=
CT=0A=
from oxenstored, which caused all the following opcodes to be shifted by 1:=
=0A=
reset_watches became off-by-one compared to the C version of xenstored.=0A=
=0A=
Looking at the C code the opcode for reset watches needs:=0A=
XS_RESET_WATCHES =3D XS_SET_TARGET + 2=0A=
=0A=
So add the placeholder `Invalid` in the OCaml<->C mapping list.=0A=
(Note that the code here doesn't simply convert the OCaml constructor to=0A=
 an integer, so we don't need to introduce a dummy constructor).=0A=
=0A=
Igor says that with a suitably patched xenopsd to enable watch reset,=0A=
we now see `reset watches` during kdump of a guest in xenstored-access.log.=
=0A=
=0A=
Signed-off-by: Edwin T=F6r=F6k <edvin.torok@citrix.com>=0A=
Tested-by: Igor Druzhinin <igor.druzhinin@citrix.com>=0A=
---=0A=
 tools/ocaml/libs/xb/op.ml | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/tools/ocaml/libs/xb/op.ml b/tools/ocaml/libs/xb/op.ml=0A=
index d4f1f08185..9bcab0f38c 100644=0A=
--- a/tools/ocaml/libs/xb/op.ml=0A=
+++ b/tools/ocaml/libs/xb/op.ml=0A=
@@ -28,7 +28,7 @@ let operation_c_mapping =3D=0A=
            Transaction_end; Introduce; Release;=0A=
            Getdomainpath; Write; Mkdir; Rm;=0A=
            Setperms; Watchevent; Error; Isintroduced;=0A=
-           Resume; Set_target; Reset_watches |]=0A=
+           Resume; Set_target; Invalid; Reset_watches |]=0A=
 let size =3D Array.length operation_c_mapping=0A=
=0A=
 let array_search el a =3D=0A=
--=0A=
2.25.1=0A=
=0A=
-- =0A=
Acked-by: Christian Lindig <christian.lindig@citrix.com>=

