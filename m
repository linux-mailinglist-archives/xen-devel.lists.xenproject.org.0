Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF515983CA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:59:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VnS-0001ih-3z; Wed, 21 Aug 2019 18:57:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0VnP-0001iU-Sx
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:57:23 +0000
X-Inumbo-ID: 81ba9f52-c445-11e9-adc9-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81ba9f52-c445-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566413841; x=1597949841;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=bV2j8myY8U2DHcrAM5D8q5+h9aLkZtLFqcwznMYy2gc=;
 b=Uiud9eyxynXv+O50ionCLMkoeQLZ3uUYEPCmS6dA2gSqhUn2pmsL6nc3
 Eo1eqwYVDXaUZ2HMKglvga5SWsT8b2s1uEfiCTB/mGc6TQ5XNuftFTYQ7
 eaSjEfL6EKma39iWyTcuDQoEWwApgYiNUharjXVO+3c/Yrc2wi3HJ/l5i 8=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; 
 d="scan'208,217";a="410898499"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Aug 2019 18:57:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id BFC2DA2171; Wed, 21 Aug 2019 18:57:20 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 18:57:19 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 18:57:18 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 21 Aug 2019 18:57:18 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [livepatch-hooks-2 PATCH 2/4] create-diff-object: Add support
 for applied/reverted marker
Thread-Index: AQHVUnuiZr6yT9sjNkWiYEA2N/a0hacF8iCAgAANaAA=
Date: Wed, 21 Aug 2019 18:57:18 +0000
Message-ID: <DA779935-F339-494A-A6DD-B13CE82286B2@amazon.com>
References: <20190814083815.89086-1-wipawel@amazon.de>
 <7f49e8f7-4c93-cd8c-d92a-19aeb6d2e9a0@oracle.com>
In-Reply-To: <7f49e8f7-4c93-cd8c-d92a-19aeb6d2e9a0@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-hooks-2 PATCH 2/4] create-diff-object:
 Add support for applied/reverted marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/mixed; boundary="===============4911286771595951694=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4911286771595951694==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DA779935F339494AA6DDB13CE82286B2amazoncom_"

--_000_DA779935F339494AA6DDB13CE82286B2amazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 21. Aug 2019, at 20:09, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com<ma=
ilto:konrad.wilk@oracle.com>> wrote:

On 8/14/19 4:38 AM, Pawel Wieczorkiewicz wrote:
With version 2 of a payload structure additional field is supported
to track whether given function has been applied or reverted.
There also comes additional 8-byte alignment padding to reserve
place for future flags and options.

The new fields are zero-out upon .livepatch.funcs section creation.

Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de<mailto:wipawel@amazo=
n.de>>
---
 common.h             | 2 ++
 create-diff-object.c | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/common.h b/common.h
index 06e19e7..d8cde35 100644
--- a/common.h
+++ b/common.h
@@ -124,6 +124,8 @@ struct livepatch_patch_func {
  uint32_t old_size;
  uint8_t version;
  unsigned char pad[31];

So the 31 pad is for this purpose - that you can make it smaller. Why
not use that?

No, I must not use that. The 31 pad should be actually called opaque,
and corresponds to the location where hypervisor stores replaced bytes
of the replaced functions.


+ uint8_t applied;
+ uint8_t _pad[7];
 };

 struct special_section {
diff --git a/create-diff-object.c b/create-diff-object.c
index 263c7d2..534516b 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -2009,8 +2009,10 @@ static void livepatch_create_patches_sections(struct=
 kpatch_elf *kelf,
  funcs[index].old_size =3D result.size;
  funcs[index].new_addr =3D 0;
  funcs[index].new_size =3D sym->sym.st_size;
- funcs[index].version =3D 1;
+ funcs[index].version =3D 2;
  memset(funcs[index].pad, 0, sizeof funcs[index].pad);
+ funcs[index].applied =3D 0;
+ memset(funcs[index]._pad, 0, sizeof funcs[index]._pad);

  /*
   * Add a relocation that will populate

Best Regards,
Pawel Wieczorkiewicz



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_DA779935F339494AA6DDB13CE82286B2amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <4398FF67E27FE74C9BB30693410C656B@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 21. Aug 2019, at 20:09, Konrad Rzeszutek Wilk &lt;<a hre=
f=3D"mailto:konrad.wilk@oracle.com" class=3D"">konrad.wilk@oracle.com</a>&g=
t; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">On
 8/14/19 4:38 AM, Pawel Wieczorkiewicz wrote:</span><br style=3D"caret-colo=
r: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norma=
l; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: nor=
mal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: no=
ne;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
With version 2 of a payload structure additional field is supported<br clas=
s=3D"">
to track whether given function has been applied or reverted.<br class=3D"">
There also comes additional 8-byte alignment padding to reserve<br class=3D=
"">
place for future flags and options.<br class=3D"">
<br class=3D"">
The new fields are zero-out upon .livepatch.funcs section creation.<br clas=
s=3D"">
<br class=3D"">
Signed-off-by: Pawel Wieczorkiewicz &lt;<a href=3D"mailto:wipawel@amazon.de=
" class=3D"">wipawel@amazon.de</a>&gt;<br class=3D"">
---<br class=3D"">
&nbsp;common.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;| 2 &#43;&#43;<br class=3D"">
&nbsp;create-diff-object.c | 4 &#43;&#43;&#43;-<br class=3D"">
&nbsp;2 files changed, 5 insertions(&#43;), 1 deletion(-)<br class=3D"">
<br class=3D"">
diff --git a/common.h b/common.h<br class=3D"">
index 06e19e7..d8cde35 100644<br class=3D"">
--- a/common.h<br class=3D"">
&#43;&#43;&#43; b/common.h<br class=3D"">
@@ -124,6 &#43;124,8 @@ struct livepatch_patch_func {<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span>ui=
nt32_t old_size;<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span>ui=
nt8_t version;<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span>un=
signed char pad[31];<br class=3D"">
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">So
 the 31 pad is for this purpose - that you can make it smaller. Why<span cl=
ass=3D"Apple-converted-space">&nbsp;</span></span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none=
;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">not
 use that?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none;" class=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>No, I must not use that. The 31 pad should be actually called opaque,<=
/div>
<div>and corresponds to the location where hypervisor stores replaced bytes=
</div>
<div>of the replaced functions.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
&#43;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span>uin=
t8_t applied;<br class=3D"">
&#43;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span>uin=
t8_t _pad[7];<br class=3D"">
&nbsp;};<br class=3D"">
<br class=3D"">
&nbsp;struct special_section {<br class=3D"">
diff --git a/create-diff-object.c b/create-diff-object.c<br class=3D"">
index 263c7d2..534516b 100644<br class=3D"">
--- a/create-diff-object.c<br class=3D"">
&#43;&#43;&#43; b/create-diff-object.c<br class=3D"">
@@ -2009,8 &#43;2009,10 @@ static void livepatch_create_patches_sections(st=
ruct kpatch_elf *kelf,<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>funcs[index].old_siz=
e =3D result.size;<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>funcs[index].new_add=
r =3D 0;<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>funcs[index].new_siz=
e =3D sym-&gt;sym.st_size;<br class=3D"">
-<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><span c=
lass=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=3D"A=
pple-tab-span" style=3D"white-space: pre;"></span>funcs[index].version =3D =
1;<br class=3D"">
&#43;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><sp=
an class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>funcs[index].version=
 =3D 2;<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>memset(funcs[index].=
pad, 0, sizeof funcs[index].pad);<br class=3D"">
&#43;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><sp=
an class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>funcs[index].applied=
 =3D 0;<br class=3D"">
&#43;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><sp=
an class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>memset(funcs[index].=
_pad, 0, sizeof funcs[index]._pad);<br class=3D"">
<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span>/*<br class=3D"">
&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;"> </span><s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=3D"Apple=
-converted-space">&nbsp;</span>* Add a relocation that will
 populate</blockquote>
</div>
</blockquote>
</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">
<div class=3D"">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space;=
 line-break: after-white-space;" class=3D"">
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Best Regards=
,<br class=3D"">
Pawel Wieczorkiewicz</div>
</div>
</div>
</div>
<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>
</body>
</html>

--_000_DA779935F339494AA6DDB13CE82286B2amazoncom_--



--===============4911286771595951694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4911286771595951694==--


