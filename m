Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446B1C520
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 10:40:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQSwN-0002Vn-Pc; Tue, 14 May 2019 08:37:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p/Am=TO=amazon.com=prvs=030f3b528=elnikety@srs-us1.protection.inumbo.net>)
 id 1hQSwM-0002Vi-HQ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 08:37:38 +0000
X-Inumbo-ID: 84ab05e6-7623-11e9-b13c-8f1baf93afbc
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84ab05e6-7623-11e9-b13c-8f1baf93afbc;
 Tue, 14 May 2019 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557823053; x=1589359053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=41XfGTfAcK4DeNkwyUmNBw94Zi9PuTKAkIrVYfWvWS0=;
 b=RdembVglCO+EwpUcUuTHV8iCUBaW8Pp5bOv5BMUvnEMFg+oHEMTtwFKl
 lgKRmZ3PLpzsX/GmDOliQ5QdLpk1VIplIqaTsLd3Ci+RLbOT0bXWS2rYg
 p64DpCSdFYanlxMB6ljdW/nY090MUUbrSX1xxRKXY/2aT/JzR+GNpSOy6 8=;
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; 
 d="scan'208,217";a="402039485"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 May 2019 08:37:32 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4E8bVV9075780
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 14 May 2019 08:37:32 GMT
Received: from EX13D18EUA004.ant.amazon.com (10.43.165.164) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 May 2019 08:37:30 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D18EUA004.ant.amazon.com (10.43.165.164) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 May 2019 08:37:30 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Tue, 14 May 2019 08:37:30 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Wei Liu <wei.liu2@citrix.com>
Thread-Topic: [PATCH v2] libxl: make vkbd tunable for HVM guests
Thread-Index: AQHVBNxB6vYhHh/FmUuQ++duuEyoBaZo6TOAgAFtmYA=
Date: Tue, 14 May 2019 08:37:29 +0000
Message-ID: <708DA278-99DE-45C5-BB12-EA66AD3E4859@amazon.com>
References: <20190507135320.103953-1-elnikety@amazon.com>
 <20190513104855.GB2798@zion.uk.xensource.com>
In-Reply-To: <20190513104855.GB2798@zion.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.224]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] libxl: make vkbd tunable for HVM guests
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Shah,
 Amit" <aams@amazon.de>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============5898275173160760648=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5898275173160760648==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_708DA27899DE45C5BB12EA66AD3E4859amazoncom_"

--_000_708DA27899DE45C5BB12EA66AD3E4859amazoncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On 13. May 2019, at 12:48, Wei Liu <wei.liu2@citrix.com<mailto:wei.liu2@cit=
rix.com>> wrote:

On Tue, May 07, 2019 at 01:53:20PM +0000, Eslam Elnikety wrote:
Each HVM guest currently gets a vkbd frontend/backend pair (c/s ebbd2561b4c=
).
This consumes host resources unnecessarily for guests that have no use for
vkbd. Make this behaviour tunable to allow an administrator to choose. The
commit retains the current behaviour -- HVM guests still get vkdb unless
specified otherwise.

Signed-off-by: Eslam Elnikety <elnikety@amazon.com<mailto:elnikety@amazon.c=
om>>

---
   Changes in v2:
       - Added a missing hunk / setting vkb_device per config
---
tools/libxl/libxl_create.c  | 9 ++++++---
tools/libxl/libxl_types.idl | 1 +
tools/xl/xl_parse.c         | 1 +
tools/xl/xl_sxp.c           | 2 ++
4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 89fe80fc9c..03ce166f4f 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -310,6 +310,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
        libxl_defbool_setdefault(&b_info->u.hvm.vpt_align,          true);
        libxl_defbool_setdefault(&b_info->u.hvm.altp2m,             false);
        libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
+        libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
        libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);

        libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
@@ -1416,9 +1417,11 @@ static void domcreate_launch_dm(libxl__egc *egc, lib=
xl__multidev *multidev,
        libxl__device_console_add(gc, domid, &console, state, &device);
        libxl__device_console_dispose(&console);

-        libxl_device_vkb_init(&vkb);
-        libxl__device_add(gc, domid, &libxl__vkb_devtype, &vkb);
-        libxl_device_vkb_dispose(&vkb);
+        if (libxl_defbool_val(d_config->b_info.u.hvm.vkb_device)) {
+            libxl_device_vkb_init(&vkb);
+            libxl__device_add(gc, domid, &libxl__vkb_devtype, &vkb);
+            libxl_device_vkb_dispose(&vkb);
+        }

        dcs->sdss.dm.guest_domid =3D domid;
        if (libxl_defbool_val(d_config->b_info.device_model_stubdomain))
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index b685ac47ac..9a0b92f1d4 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -583,6 +583,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
                                       # - "tablet" for absolute mouse,
                                       # - "mouse" for PS/2 protocol relati=
ve mouse
                                       ("usbdevice",        string),
+                                       ("vkb_device",       libxl_defbool)=
,
                                       ("soundhw",          string),
                                       ("xen_platform_pci", libxl_defbool),
                                       ("usbdevice_list",   libxl_string_li=
st),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 352cd214dd..e105bda2bb 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2652,6 +2652,7 @@ skip_usbdev:
            fprintf(stderr,"xl: Unable to parse usbdevice.\n");
            exit(-ERROR_FAIL);
        }
+        xlu_cfg_get_defbool(config, "vkb_device", &b_info->u.hvm.vkb_devic=
e, 0);
        xlu_cfg_replace_string (config, "soundhw", &b_info->u.hvm.soundhw, =
0);
        xlu_cfg_get_defbool(config, "xen_platform_pci",
                            &b_info->u.hvm.xen_platform_pci, 0);

Oh here it is the code which uses the new field -- in that case, you
also need to document this in xl manpage.

The manpage is docs/man/xl.conf.pod.5.

Sorry for not having mentioned this earlier: we also ask for an
accompanying macro for the new field in the public interface. See
various LIBXL_HAVE macros in libxl.h.

Let me know if you have further questions.

Wei.

Thanks for the feedback. Sending v3 now.

Cheers,
Eslam


--_000_708DA27899DE45C5BB12EA66AD3E4859amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <50A27953564BC941A861F2EBA857B42E@amazon.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-lin=
e-break: after-white-space;" class=3D"">
<br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 13. May 2019, at 12:48, Wei Liu &lt;<a href=3D"mailto:we=
i.liu2@citrix.com" class=3D"">wei.liu2@citrix.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float=
: none; display: inline !important;" class=3D"">On
 Tue, May 07, 2019 at 01:53:20PM &#43;0000, Eslam Elnikety wrote:</span><br=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">
Each HVM guest currently gets a vkbd frontend/backend pair (c/s ebbd2561b4c=
).<br class=3D"">
This consumes host resources unnecessarily for guests that have no use for<=
br class=3D"">
vkbd. Make this behaviour tunable to allow an administrator to choose. The<=
br class=3D"">
commit retains the current behaviour -- HVM guests still get vkdb unless<br=
 class=3D"">
specified otherwise.<br class=3D"">
<br class=3D"">
Signed-off-by: Eslam Elnikety &lt;<a href=3D"mailto:elnikety@amazon.com" cl=
ass=3D"">elnikety@amazon.com</a>&gt;<br class=3D"">
<br class=3D"">
---<br class=3D"">
&nbsp;&nbsp;&nbsp;Changes in v2:<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Added a missing hunk / setting =
vkb_device per config<br class=3D"">
---<br class=3D"">
tools/libxl/libxl_create.c &nbsp;| 9 &#43;&#43;&#43;&#43;&#43;&#43;---<br c=
lass=3D"">
tools/libxl/libxl_types.idl | 1 &#43;<br class=3D"">
tools/xl/xl_parse.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 1 &#4=
3;<br class=3D"">
tools/xl/xl_sxp.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;| 2 &#43;&#43;<br class=3D"">
4 files changed, 10 insertions(&#43;), 3 deletions(-)<br class=3D"">
<br class=3D"">
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c<br cla=
ss=3D"">
index 89fe80fc9c..03ce166f4f 100644<br class=3D"">
--- a/tools/libxl/libxl_create.c<br class=3D"">
&#43;&#43;&#43; b/tools/libxl/libxl_create.c<br class=3D"">
@@ -310,6 &#43;310,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *=
gc,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_defbool_setdefault(&a=
mp;b_info-&gt;u.hvm.vpt_align, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;true);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_defbool_setdefault(&a=
mp;b_info-&gt;u.hvm.altp2m, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;false);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_defbool_setdefault(&a=
mp;b_info-&gt;u.hvm.usb, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;false);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_defbool_setdefault(&a=
mp;b_info-&gt;u.hvm.vkb_device, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;true);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_defbool_setdefault(&a=
mp;b_info-&gt;u.hvm.xen_platform_pci, &nbsp;&nbsp;true);<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_defbool_setdefault(&a=
mp;b_info-&gt;u.hvm.spice.enable, false);<br class=3D"">
@@ -1416,9 &#43;1417,11 @@ static void domcreate_launch_dm(libxl__egc *egc,=
 libxl__multidev *multidev,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl__device_console_add(g=
c, domid, &amp;console, state, &amp;device);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl__device_console_dispo=
se(&amp;console);<br class=3D"">
<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_device_vkb_init(&amp;vkb)=
;<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl__device_add(gc, domid, &a=
mp;libxl__vkb_devtype, &amp;vkb);<br class=3D"">
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl_device_vkb_dispose(&amp;v=
kb);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (libxl_defbool_val(d_con=
fig-&gt;b_info.u.hvm.vkb_device)) {<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lib=
xl_device_vkb_init(&amp;vkb);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lib=
xl__device_add(gc, domid, &amp;libxl__vkb_devtype, &amp;vkb);<br class=3D""=
>
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lib=
xl_device_vkb_dispose(&amp;vkb);<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dcs-&gt;sdss.dm.guest_domid=
 =3D domid;<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (libxl_defbool_val(d_con=
fig-&gt;b_info.device_model_stubdomain))<br class=3D"">
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl<br c=
lass=3D"">
index b685ac47ac..9a0b92f1d4 100644<br class=3D"">
--- a/tools/libxl/libxl_types.idl<br class=3D"">
&#43;&#43;&#43; b/tools/libxl/libxl_types.idl<br class=3D"">
@@ -583,6 &#43;583,7 @@ libxl_domain_build_info =3D Struct(&quot;domain_bui=
ld_info&quot;,[<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;# - &quot;tablet&quot; for absolute mouse,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;# - &quot;mouse&quot; for PS/2 protocol relative mouse<br class=3D=
"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;(&quot;usbdevice&quot;, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
string),<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;(&quot;vkb_device&quot;, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;libxl=
_defbool),<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;(&quot;soundhw&quot;, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;string),<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;(&quot;xen_platform_pci&quot;, libxl_defbool),<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;(&quot;usbdevice_list&quot;, &nbsp;&nbsp;libxl_string_list),<br cl=
ass=3D"">
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c<br class=3D"">
index 352cd214dd..e105bda2bb 100644<br class=3D"">
--- a/tools/xl/xl_parse.c<br class=3D"">
&#43;&#43;&#43; b/tools/xl/xl_parse.c<br class=3D"">
@@ -2652,6 &#43;2652,7 @@ skip_usbdev:<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fpr=
intf(stderr,&quot;xl: Unable to parse usbdevice.\n&quot;);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exi=
t(-ERROR_FAIL);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xlu_cfg_get_defbool(config,=
 &quot;vkb_device&quot;, &amp;b_info-&gt;u.hvm.vkb_device, 0);<br class=3D"=
">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xlu_cfg_replace_string (con=
fig, &quot;soundhw&quot;, &amp;b_info-&gt;u.hvm.soundhw, 0);<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xlu_cfg_get_defbool(config,=
 &quot;xen_platform_pci&quot;,<br class=3D"">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&amp;b_info-&gt;u.hvm.xen_platform_pci, 0);<br class=3D""=
>
</blockquote>
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">Oh
 here it is the code which uses the new field -- in that case, you</span><b=
r style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">also
 need to document this in xl manpage.</span><br style=3D"font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px;" class=3D"">
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">The
 manpage is docs/man/xl.conf.pod.5.</span><br style=3D"font-family: Helveti=
ca; font-size: 12px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px;" class=3D"">
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">Sorry
 for not having mentioned this earlier: we also ask for an</span><br style=
=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">accompanying
 macro for the new field in the public interface. See</span><br style=3D"fo=
nt-family: Helvetica; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">various
 LIBXL_HAVE macros in libxl.h.</span><br style=3D"font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px;" class=3D"">
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">Let
 me know if you have further questions.</span><br style=3D"font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px;" class=3D"">
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">Wei.</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">Thanks for the feedback. Sending v3 now.</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Cheers,</div>
<div class=3D"">Eslam</div>
<div class=3D""><br class=3D"">
</div>
</body>
</html>

--_000_708DA27899DE45C5BB12EA66AD3E4859amazoncom_--


--===============5898275173160760648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5898275173160760648==--

