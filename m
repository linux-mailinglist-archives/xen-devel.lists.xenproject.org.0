Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B25263F91
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 10:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGHoS-0002kh-JL; Thu, 10 Sep 2020 08:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/mO=CT=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kGHoR-0002kc-6a
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 08:20:11 +0000
X-Inumbo-ID: 7009325e-f6b5-4265-9e4c-f6d2752244af
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7009325e-f6b5-4265-9e4c-f6d2752244af;
 Thu, 10 Sep 2020 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599726009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=q52UH5CZZ6VYtKeeb9KxgsgpMY3odJR8qQroeXd72iI=;
 b=gnQaRgXYQXRp94VpoqhLlaKLuWIYXCLftzx2lHSL0CgxjQZTOTCd4jdx
 4VD8d9eejasSqSpqAr4lzMdluHYGKJQzISfAs57AcJV1yNzKMDKFCWmn1
 4YruGPykW62e9/S+SxagfNQXFKAUdIWEnPYtSmGbtn3tLb2E6DEra3V7/ 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: fHCnMuXhNbzEaxJtLlsP6DSbEcH6LB1g3hLtUcBjXfPwvpq7sYXzpdRDsaWR+eh88G/3qGdb/w
 GQvoriUHsnue+/No3BwFgI5P8LbjKharw+XbjKJr2KWUYGTTPprRMXXiUhWVk0hfPBgzAjYzo9
 7UMBlAfXyt7Mim5CA9v60nHLACcmHlydsiV9s/54e16d+/7g18jZKrio7tsZuOe5Xsf6Cdd8lD
 B+X36U+uG0JzfWjm8EOGbtiitV2xnRc9J+3n84ISytB/U/SgR9jgwEVCC/3J8nc0XdpPhEq2hy
 egE=
X-SBRS: 2.7
X-MesageID: 26713575
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,412,1592884800"; d="scan'208,217";a="26713575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gndr7GM2wjqcpFnKOjvnFUN9tlohmEkpREhe2nNkPurSCWvCZX3Y1EloDvKjCVmwsg2UPsivwW7Vbh7t7I0nPK4L5nwyXNit4IdR7SGKX+/oYItcWShUClwG33+XjHVciDZ7cJUZoqA93n6ibCqBzn2KNDSyg+NOrdlFilkspj1+pFQetNms0ZR94Vyl5n0/APM5sRRRMz2X+qyAc/trh663HpEeUVr0AozM2dxxER2YWG6vZwzM21Jwj0p+e3xSnrNbVAMlXE9uk+kug/g4EbRcv3HLvl7BHkLGYimYcDPoFStSNzmo/jnzWRV0BTW/VDgRQL3ofRHjNZUUjg86pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCJHMKMNxVwltLkrR1sE4S7bK1M2sYwufcMm0gqetto=;
 b=V+2HFDPJEpgO7pNBcIWs+B/laigCP2nEuGTEknRaQK7AssaATR1pQV5ezrpNUx8Yzcm0V3WGqps1H+LfJRFvEeDnnnCjnm48tttvVCFkPHux0rtzs8Il8mE/RcD8ogyhcnbAn5ksDdH8KNq1WcDmY8IK/3PKfzcXKS/XEwoCSubt59bc2HmYWvMdfFC1qB3iNapB34cXJvTFa0elTwvag+sFAJnrT/UBZvNMkP/MaTQj1xo6HZlYOwQa+01r5GYGq34tPyLF8hI0HvlZQfZJcYHebLaEpAwGixXMBGqt335wc049eTaVoefLGeNNCddWi31+URYNneKNdMsWUMS5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCJHMKMNxVwltLkrR1sE4S7bK1M2sYwufcMm0gqetto=;
 b=LCaLXlD8TEmJ+5RXr6tqw56Wt1UCsi0ab/8fuw7qh+a78bVK1zlep3nbEoCMWSJ2KB8Pl/fZRJgpFH0KYPOq1QI/7VM+5IYqtt4yflFdv2sXq0vPxGF36AUADb9QyyqFrSR5zpjMkNKp47CxDOI5k67ylK6xQP9+Lg3sDKZwDNo=
From: Christian Lindig <christian.lindig@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
 <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, David Scott
 <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>
Subject: Re: [PATCH 05/11 RFC] gitignore: Create .gitignore file for
 tools/ocaml/
Thread-Topic: [PATCH 05/11 RFC] gitignore: Create .gitignore file for
 tools/ocaml/
Thread-Index: AQHWhvPtX4ARDtRBqkWG6CStpXG46qlhhtke
Date: Thu, 10 Sep 2020 08:20:05 +0000
Message-ID: <DS7PR03MB5655DF843FE11DFAADA1E88DF6270@DS7PR03MB5655.namprd03.prod.outlook.com>
References: <202009092153.089LrS8D039207@m5p.com>
In-Reply-To: <202009092153.089LrS8D039207@m5p.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03d80563-6bf1-49a7-d031-08d8556252c3
x-ms-traffictypediagnostic: DM5PR03MB3356:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR03MB3356EB5EEA054D19C8116670F6270@DM5PR03MB3356.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekowVtExaNKvXzdo/Mu77O9Jjl1KrnnlwTfgZ7YhzJtHC7ewRRIHZwvk59yJX4vbfnsYoIus4lA3ws98Y4JFXwdMaQjS9RpHNjezMtyES0EoGjdq96tY0b4ht3gGwrs0IzuKvJwacqpWhtqfRb4gQczHsWAgXgkmZc0oGX3gHED5J6ivcGjdTqlQok+5vCIgQNJbK36ZMqnlJXHXJZZz4VxmnXeIQt+ATDK+lR9jtWT9t14qSzLT855I8Io3dl1JyYqJlQbo31mETb56VuPa5CkGny5LGiaIFnOsGNt0obeXYIV07/pg1IHVKgcMJxY1TVOK95PWqahu82P41FcpeO+CJSoN/J0lEyTBdzh9/q5WwBXWSxdGjUNlCs7dBA45
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR03MB5655.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(44832011)(64756008)(66946007)(8936002)(5660300002)(7696005)(26005)(52536014)(55236004)(186003)(55016002)(9686003)(316002)(53546011)(110136005)(54906003)(33656002)(107886003)(76116006)(71200400001)(6506007)(83380400001)(66476007)(91956017)(86362001)(19627405001)(2906002)(66556008)(8676002)(478600001)(4326008)(66446008)(142923001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PJkmXH9T9eI8L39sAWoV8EhtgvcLB+eo/WtllO/XgU8XnszVp5Eg4hLYLFDeYWRy23tAgA03DUFcXh80kHq+crjzwwz5SW2uO/YEu8My/ApUKvr/2aVTiU5qyBTPAZAktvtfad0Uqk+w0S9M2qdY+4vhDrG4KwZ1Khcsqxfz9XXizOYgP7xKGgQbg/YOl5I2HFZ7oaAfFwAb9WMBFk/AliupN7+VqHxPb9qemkFOXe5gCPonF9Kh8xSa/y9rwB1BoPEYZCZZflgdHhpPPkJaclDcyXMBbPSuMUkFuutVugIGhUmPrZ/Kw2GhvJX2Fy3DGAI/hm60A/JTuLhhF91tax9Ug+bnTHkyCtNP6Ow/yNIO8r1RcAhUDuARaQe4I+jOsryNFGgEHGRljzUpYrNfaywkhO2MCQSe4o3gJpu8+xY2lUPLSHudkNu3bC3OXTbBAkPOMBWI2hmmnbA9pKAPoUaxHtpNT/yCSkjz29aH1Uvxq58UcfQ16fTJxVT7Vhch/9Exoah6FoaiOA4uhDBFftuVxz97HJXYdi09DcGLq09J26r9DXTB6k8hAcMOlUqL
Content-Type: multipart/alternative;
 boundary="_000_DS7PR03MB5655DF843FE11DFAADA1E88DF6270DS7PR03MB5655namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d80563-6bf1-49a7-d031-08d8556252c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 08:20:05.5351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b4fYqNfZF7WHbuIAHmCdM63bT0vvTj+dU484kY/fthUSMB3kSUgFIm3VV1FmwreNZu5+yzXmMmc6P/VgulXla9JMt63maT17vcPXpRKC5X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3356
X-OriginatorOrg: citrix.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_000_DS7PR03MB5655DF843FE11DFAADA1E88DF6270DS7PR03MB5655namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Fine with me. Edvin is using locally for the OCaml part a Dune-based build =
that does away with a lot of the cruft because it puts all files generated =
during a build into _build/ directory which then is enough to ignore. IMHO =
that is the direction of the future.

--
Acked-by: Christian Lindig <christian.lindig@citrix.com>


________________________________
From: Elliott Mitchell <ehem+xen@m5p.com>
Sent: 03 September 2020 05:10
To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; George Dunlap <George.Dunlap=
@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Jan Beulich <jbeulich@s=
use.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@ke=
rnel.org>; Wei Liu <wl@xen.org>; Christian Lindig <christian.lindig@citrix.=
com>; David Scott <dave@recoil.org>
Subject: [PATCH 05/11 RFC] gitignore: Create .gitignore file for tools/ocam=
l/

The portion of the global .gitignore attributeable to tools/ocaml/ is
significant.  As such, create a local .gitignore file.  Currently the
OCAML bits for Xen are also somewhat contained to this one area too.

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
I have a suspicion several of the patterns *should* be more general
and/or the OCAML area could use some local ignore patterns.

In particular "*.annot", "*.cm[ixao]", "*.cmxa", ".ocamldep.make" and
"META" might be appropriate as general patterns for tools/ocaml/ and not
be restricted to subdirectories.
---
 .gitignore             | 28 ----------------------------
 tools/ocaml/.gitignore | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 28 deletions(-)
 create mode 100644 tools/ocaml/.gitignore

diff --git a/.gitignore b/.gitignore
index 08800a11d5..297cd59c5c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -284,34 +284,6 @@ tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
 tools/libvchan/vchan-node[12]
 tools/libvchan/vchan-socket-proxy
-tools/ocaml/*/.ocamldep.make
-tools/ocaml/*/*.cm[ixao]
-tools/ocaml/*/*.cmxa
-tools/ocaml/*/*.annot
-tools/ocaml/*/*/.ocamldep.make
-tools/ocaml/*/*/*.cm[ixao]
-tools/ocaml/*/*/*.cmxa
-tools/ocaml/*/*/*.annot
-tools/ocaml/*/*/META
-tools/ocaml/libs/xl/_libxl_types.inc
-tools/ocaml/libs/xl/_libxl_types.ml.in
-tools/ocaml/libs/xl/_libxl_types.mli.in
-tools/ocaml/libs/xl/xenlight.ml
-tools/ocaml/libs/xl/xenlight.mli
-tools/ocaml/libs/xentoollog/_xtl_levels.*
-tools/ocaml/libs/xentoollog/xentoollog.ml
-tools/ocaml/libs/xentoollog/xentoollog.mli
-tools/ocaml/libs/xs/paths.ml
-tools/ocaml/libs/xc/xenctrl_abi_check.h
-tools/ocaml/xenstored/_paths.h
-tools/ocaml/xenstored/oxenstored
-tools/ocaml/xenstored/oxenstored.conf
-tools/ocaml/xenstored/paths.ml
-tools/ocaml/test/xtl
-tools/ocaml/test/send_debug_keys
-tools/ocaml/test/list_domains
-tools/ocaml/test/dmesg
-tools/ocaml/test/raise_exception
 tools/debugger/kdd/kdd
 tools/python/xen/lowlevel/xl/_pyxl_types.c
 tools/python/xen/lowlevel/xl/_pyxl_types.h
diff --git a/tools/ocaml/.gitignore b/tools/ocaml/.gitignore
new file mode 100644
index 0000000000..8b50454937
--- /dev/null
+++ b/tools/ocaml/.gitignore
@@ -0,0 +1,24 @@
+/*/**/*.annot
+/*/**/*.cm[ixao]
+/*/**/*.cmxa
+/*/**/.ocamldep.make
+/*/*/META
+/libs/xc/xenctrl_abi_check.h
+/libs/xentoollog/_xtl_levels.*
+/libs/xentoollog/xentoollog.ml
+/libs/xentoollog/xentoollog.mli
+/libs/xl/_libxl_types.inc
+/libs/xl/_libxl_types.ml.in
+/libs/xl/_libxl_types.mli.in
+/libs/xl/xenlight.ml
+/libs/xl/xenlight.mli
+/libs/xs/paths.ml
+/test/dmesg
+/test/list_domains
+/test/raise_exception
+/test/send_debug_keys
+/test/xtl
+/xenstored/_paths.h
+/xenstored/oxenstored
+/xenstored/oxenstored.conf
+/xenstored/paths.ml
--


--
(\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)___=
/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




--_000_DS7PR03MB5655DF843FE11DFAADA1E88DF6270DS7PR03MB5655namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Fine with me. Edvin is using locally for the OCaml part a Dune-based build =
that does away with a lot of the cruft because it puts all files generated =
during a build into _build/ directory which then is enough to ignore. IMHO =
that is the direction of the future.
 &nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px">--&nbsp;</div>
<div style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px">Acked-by: Christian Lindig &lt;christian.lindig@citrix.com&gt;</div>
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Elliott Mitchell &lt;=
ehem+xen@m5p.com&gt;<br>
<b>Sent:</b> 03 September 2020 05:10<br>
<b>To:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.or=
g&gt;<br>
<b>Cc:</b> Andrew Cooper &lt;Andrew.Cooper3@citrix.com&gt;; George Dunlap &=
lt;George.Dunlap@citrix.com&gt;; Ian Jackson &lt;Ian.Jackson@citrix.com&gt;=
; Jan Beulich &lt;jbeulich@suse.com&gt;; Julien Grall &lt;julien@xen.org&gt=
;; Stefano Stabellini &lt;sstabellini@kernel.org&gt;; Wei Liu &lt;wl@xen.or=
g&gt;;
 Christian Lindig &lt;christian.lindig@citrix.com&gt;; David Scott &lt;dave=
@recoil.org&gt;<br>
<b>Subject:</b> [PATCH 05/11 RFC] gitignore: Create .gitignore file for too=
ls/ocaml/</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">The portion of the global .gitignore attributeable=
 to tools/ocaml/ is<br>
significant.&nbsp; As such, create a local .gitignore file.&nbsp; Currently=
 the<br>
OCAML bits for Xen are also somewhat contained to this one area too.<br>
<br>
Slashes were left at the start of all filenames.&nbsp; Entries without slas=
hes<br>
match files in subdirectories, entries with a slash anywhere are a<br>
specific path.&nbsp; I feel it is more consistent to have leading slashes o=
n<br>
all full paths.<br>
<br>
Signed-off-by: Elliott Mitchell &lt;ehem+xen@m5p.com&gt;<br>
<br>
---<br>
I have a suspicion several of the patterns *should* be more general<br>
and/or the OCAML area could use some local ignore patterns.<br>
<br>
In particular &quot;*.annot&quot;, &quot;*.cm[ixao]&quot;, &quot;*.cmxa&quo=
t;, &quot;.ocamldep.make&quot; and<br>
&quot;META&quot; might be appropriate as general patterns for tools/ocaml/ =
and not<br>
be restricted to subdirectories.<br>
---<br>
&nbsp;.gitignore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 28 ----------------------------<br>
&nbsp;tools/ocaml/.gitignore | 24 ++++++++++++++++++++++++<br>
&nbsp;2 files changed, 24 insertions(+), 28 deletions(-)<br>
&nbsp;create mode 100644 tools/ocaml/.gitignore<br>
<br>
diff --git a/.gitignore b/.gitignore<br>
index 08800a11d5..297cd59c5c 100644<br>
--- a/.gitignore<br>
+++ b/.gitignore<br>
@@ -284,34 +284,6 @@ tools/libxl/test_timedereg<br>
&nbsp;tools/libxl/test_fdderegrace<br>
&nbsp;tools/libvchan/vchan-node[12]<br>
&nbsp;tools/libvchan/vchan-socket-proxy<br>
-tools/ocaml/*/.ocamldep.make<br>
-tools/ocaml/*/*.cm[ixao]<br>
-tools/ocaml/*/*.cmxa<br>
-tools/ocaml/*/*.annot<br>
-tools/ocaml/*/*/.ocamldep.make<br>
-tools/ocaml/*/*/*.cm[ixao]<br>
-tools/ocaml/*/*/*.cmxa<br>
-tools/ocaml/*/*/*.annot<br>
-tools/ocaml/*/*/META<br>
-tools/ocaml/libs/xl/_libxl_types.inc<br>
-tools/ocaml/libs/xl/_libxl_types.ml.in<br>
-tools/ocaml/libs/xl/_libxl_types.mli.in<br>
-tools/ocaml/libs/xl/xenlight.ml<br>
-tools/ocaml/libs/xl/xenlight.mli<br>
-tools/ocaml/libs/xentoollog/_xtl_levels.*<br>
-tools/ocaml/libs/xentoollog/xentoollog.ml<br>
-tools/ocaml/libs/xentoollog/xentoollog.mli<br>
-tools/ocaml/libs/xs/paths.ml<br>
-tools/ocaml/libs/xc/xenctrl_abi_check.h<br>
-tools/ocaml/xenstored/_paths.h<br>
-tools/ocaml/xenstored/oxenstored<br>
-tools/ocaml/xenstored/oxenstored.conf<br>
-tools/ocaml/xenstored/paths.ml<br>
-tools/ocaml/test/xtl<br>
-tools/ocaml/test/send_debug_keys<br>
-tools/ocaml/test/list_domains<br>
-tools/ocaml/test/dmesg<br>
-tools/ocaml/test/raise_exception<br>
&nbsp;tools/debugger/kdd/kdd<br>
&nbsp;tools/python/xen/lowlevel/xl/_pyxl_types.c<br>
&nbsp;tools/python/xen/lowlevel/xl/_pyxl_types.h<br>
diff --git a/tools/ocaml/.gitignore b/tools/ocaml/.gitignore<br>
new file mode 100644<br>
index 0000000000..8b50454937<br>
--- /dev/null<br>
+++ b/tools/ocaml/.gitignore<br>
@@ -0,0 +1,24 @@<br>
+/*/**/*.annot<br>
+/*/**/*.cm[ixao]<br>
+/*/**/*.cmxa<br>
+/*/**/.ocamldep.make<br>
+/*/*/META<br>
+/libs/xc/xenctrl_abi_check.h<br>
+/libs/xentoollog/_xtl_levels.*<br>
+/libs/xentoollog/xentoollog.ml<br>
+/libs/xentoollog/xentoollog.mli<br>
+/libs/xl/_libxl_types.inc<br>
+/libs/xl/_libxl_types.ml.in<br>
+/libs/xl/_libxl_types.mli.in<br>
+/libs/xl/xenlight.ml<br>
+/libs/xl/xenlight.mli<br>
+/libs/xs/paths.ml<br>
+/test/dmesg<br>
+/test/list_domains<br>
+/test/raise_exception<br>
+/test/send_debug_keys<br>
+/test/xtl<br>
+/xenstored/_paths.h<br>
+/xenstored/oxenstored<br>
+/xenstored/oxenstored.conf<br>
+/xenstored/paths.ml<br>
-- <br>
<br>
<br>
-- <br>
(\___(\___(\______&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --=
=3D&gt; 8-) EHM &lt;=3D--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ______/)___/)___/)<br>
&nbsp;\BS (&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ehem+sigmsg@m5p.com&nbsp; PGP 87145445&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; )&nbsp;&nbsp; /<br>
&nbsp; \_CS\&nbsp;&nbsp; |&nbsp; _____&nbsp; -O #include &lt;stddisclaimer.=
h&gt; O-&nbsp;&nbsp; _____&nbsp; |&nbsp;&nbsp; /&nbsp; _/<br>
8A19\___\_|_/58D2 7E3D DDF4 7BA6 &lt;-PGP-&gt; 41D1 B375 37D0 8714\_|_/___/=
5445<br>
<br>
<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS7PR03MB5655DF843FE11DFAADA1E88DF6270DS7PR03MB5655namp_--

