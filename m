Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D94983C8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:58:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Vlu-0001YK-AO; Wed, 21 Aug 2019 18:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Vlt-0001YF-0u
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:55:49 +0000
X-Inumbo-ID: 495c5394-c445-11e9-adc9-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 495c5394-c445-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566413747; x=1597949747;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=rSFYU2PI9y7JUcADSFgJp+52SlGgddKfMYGfCuAEcU8=;
 b=nJczzqiYYou+qbYMu376v3Y+MYexfkl2g5h+8ALwxKTmFkCe5MC+Pj2R
 AQGl1/szB997USuegLyN2JP87XVDSCWlO+603aQwxrDmA+EFSiXBmsyLB
 LmNBlincvG27TvSor4pL4S6YzFpRVR6tAOj3pTQVKQREJ1C7FUZYAlqxd s=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; 
 d="scan'208,217";a="416733268"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Aug 2019 18:55:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8F836A21B1; Wed, 21 Aug 2019 18:55:45 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 18:55:44 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 18:55:44 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 21 Aug 2019 18:55:44 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [livepatch-hooks-2 PATCH 3/4] livepatch: Add support for
 apply|revert action replacement hooks
Thread-Index: AQHVUnu30pyCV+4nmkS/LxxhpVs3eacF8nGAgAAMqIA=
Date: Wed, 21 Aug 2019 18:55:44 +0000
Message-ID: <B4A793DB-DC59-4C94-A7D3-FC1E100D468E@amazon.com>
References: <20190814083846.89163-1-wipawel@amazon.de>
 <36a4622c-e00c-073c-8521-649cb8984148@oracle.com>
In-Reply-To: <36a4622c-e00c-073c-8521-649cb8984148@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-hooks-2 PATCH 3/4] livepatch: Add
 support for apply|revert action replacement hooks
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
Content-Type: multipart/mixed; boundary="===============4974411175342177065=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4974411175342177065==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B4A793DBDC594C94A7D3FC1E100D468Eamazoncom_"

--_000_B4A793DBDC594C94A7D3FC1E100D468Eamazoncom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 21. Aug 2019, at 20:10, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com<ma=
ilto:konrad.wilk@oracle.com>> wrote:

On 8/14/19 4:38 AM, Pawel Wieczorkiewicz wrote:
By default, in the quiescing zone, a hotpatch payload is applied with
apply_payload() and reverted with revert_payload() functions. Both of
the functions receive the payload struct pointer as a parameter. The
functions are also a place where standard 'load' and 'unload' module
hooks are executed.

To increase hotpatching system's agility and provide more flexiable
long-term hotpatch solution, allow to overwrite the default apply
and revert action functions with hook-like supplied alternatives.
The alternative functions are optional and the default functions are
used by default.

Since the alternative functions have direct access to the hotpatch
payload structure, they can better control context of the 'load' and
'unload' hooks execution as well as exact instructions replacement
workflows. They can be also easily extended to support extra features
in the future.

To simplify the alternative function generation move code responsible
for payload and hotpatch region registration outside of the function.
That way it is guaranteed that the registration step occurs even for
newly supplied functions.


You MUST also include the test-cases for this new functionality.

Yeah, I will add them. How comprehensive tests do you have in mind?
I would add 1 or 2 general cases for both of the new hooks. Is it good enou=
gh?

Please add them, you know where they are right?

I think, I do.

Best Regards,
Pawel Wieczorkiewicz



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--_000_B4A793DBDC594C94A7D3FC1E100D468Eamazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <348753F7BACABB4798434871768E623D@amazon.com>
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
<div class=3D"">On 21. Aug 2019, at 20:10, Konrad Rzeszutek Wilk &lt;<a hre=
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
By default, in the quiescing zone, a hotpatch payload is applied with<br cl=
ass=3D"">
apply_payload() and reverted with revert_payload() functions. Both of<br cl=
ass=3D"">
the functions receive the payload struct pointer as a parameter. The<br cla=
ss=3D"">
functions are also a place where standard 'load' and 'unload' module<br cla=
ss=3D"">
hooks are executed.<br class=3D"">
<br class=3D"">
To increase hotpatching system's agility and provide more flexiable<br clas=
s=3D"">
long-term hotpatch solution, allow to overwrite the default apply<br class=
=3D"">
and revert action functions with hook-like supplied alternatives.<br class=
=3D"">
The alternative functions are optional and the default functions are<br cla=
ss=3D"">
used by default.<br class=3D"">
<br class=3D"">
Since the alternative functions have direct access to the hotpatch<br class=
=3D"">
payload structure, they can better control context of the 'load' and<br cla=
ss=3D"">
'unload' hooks execution as well as exact instructions replacement<br class=
=3D"">
workflows. They can be also easily extended to support extra features<br cl=
ass=3D"">
in the future.<br class=3D"">
<br class=3D"">
To simplify the alternative function generation move code responsible<br cl=
ass=3D"">
for payload and hotpatch region registration outside of the function.<br cl=
ass=3D"">
That way it is guaranteed that the registration step occurs even for<br cla=
ss=3D"">
newly supplied functions.<br class=3D"">
<br class=3D"">
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
s=3D"">You
 MUST also include the test-cases for this new functionality.</span><br cla=
ss=3D"">
</div>
</blockquote>
<div><br class=3D"">
</div>
Yeah, I will add them. How comprehensive tests do you have in mind?</div>
<div>I would add 1 or 2 general cases for both of the new hooks. Is it good=
 enough?<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Please
 add them, you know where they are right?</span></div>
</blockquote>
</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">I think, I do.</div>
<br class=3D"">
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

--_000_B4A793DBDC594C94A7D3FC1E100D468Eamazoncom_--



--===============4974411175342177065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4974411175342177065==--


