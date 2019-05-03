Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E97E13421
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 21:46:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMe4U-0007s0-BL; Fri, 03 May 2019 19:42:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4jea=TD=amazon.com=prvs=0198f17c6=elnikety@srs-us1.protection.inumbo.net>)
 id 1hMe4T-0007rv-4A
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 19:42:13 +0000
X-Inumbo-ID: 8180ddaa-6ddb-11e9-8587-1f59e443c58d
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8180ddaa-6ddb-11e9-8587-1f59e443c58d;
 Fri, 03 May 2019 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1556912517; x=1588448517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=5cFNqdHCNcPPtNuySe475bpB3QyNvnXGTuw+L8ITFZg=;
 b=VYG3syHVgXVpPKx8s5HjV5fQteOIbHle9KYYyP66k+ouM4TMSXh+gPqJ
 hnFGzTh4jYIQKPlUBq850+VYtZmqVgu/nAH8d0KTkflODYXEDxnCpEDp9
 ruwWdk9zVwK2RNP4KCA3B7Furt5nkdYQENecdfCpYs+WpoBHRj/O07hAH c=;
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; 
 d="scan'208,217";a="400738402"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 03 May 2019 19:41:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x43JfqVo073998
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 3 May 2019 19:41:52 GMT
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 May 2019 19:41:52 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 May 2019 19:41:51 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Fri, 3 May 2019 19:41:45 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Thread-Topic: [PATCH] sched/credit: avoid priority boost for capped domains
 when unpark
Thread-Index: AQHVAcaEV2VJourGQkGZZj+SwLb5jKZZnJeAgAAjsgCAAAyhAA==
Date: Fri, 3 May 2019 19:41:45 +0000
Message-ID: <562F9814-30CE-467C-8027-8F21FC6C2845@amazon.com>
References: <20190503153839.19932-1-elnikety@amazon.com>
 <9434ed49fc68a05999e130abfde973663ed41d2d.camel@suse.com>
 <CB078283-0837-4477-A831-564745FD0C76@xenproject.org>
In-Reply-To: <CB078283-0837-4477-A831-564745FD0C76@xenproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.137]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] sched/credit: avoid priority boost for
 capped domains when unpark
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: multipart/mixed; boundary="===============6978331471066717546=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6978331471066717546==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_562F981430CE467C80278F21FC6C2845amazoncom_"

--_000_562F981430CE467C80278F21FC6C2845amazoncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On 3. May 2019, at 20:56, Lars Kurth <lars.kurth.xen@gmail.com<mailto:lars.=
kurth.xen@gmail.com>> wrote:



On 3 May 2019, at 10:48, Dario Faggioli <dfaggioli@suse.com<mailto:dfaggiol=
i@suse.com>> wrote:

On Fri, 2019-05-03 at 15:38 +0000, Eslam Elnikety wrote:
When unpausing a capped domain, the scheduler currently clears the
CSCHED_FLAG_VCPU_PARKED flag before vcpu_wake(). This, in turn,
causes the
vcpu_wake to set CSCHED_PRI_TS_BOOST, resulting in an unfair credit
boost. The
comment around the changed lines already states that clearing the
flag should
happen AFTER the unpause. This bug was introduced in commit
be650750945
"credit1: Use atomic bit operations for the flags structure".

Original patch author credit: Xi Xiong.

Mmm... I'm not an expert of these things, but doesn't this means we
need a "Signed-off-by: Xi Xiong <xxx@yyy.zzz<mailto:xxx@yyy.zzz>>" then? Cc=
-ing Lars...

As far as I can tell from a quick search on xen-devel@ Xi Xiong is or
was an Amazon employee so a signed-off-by is not strictly necessary
but you may want to say something like.

Original patch author credit: Xi Xiong of Amazon

Lars

Thanks for the prompt responses, Lars and Dario.

Indeed. Xi was with Amazon. I will adjust the commit message accordingly. (=
I will also omit the additional comment as pointed out by Dario).

--_000_562F981430CE467C80278F21FC6C2845amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <6FD7E4F90A5A8D47AE36FE7DB660885E@amazon.com>
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
<div class=3D"">On 3. May 2019, at 20:56, Lars Kurth &lt;<a href=3D"mailto:=
lars.kurth.xen@gmail.com" class=3D"">lars.kurth.xen@gmail.com</a>&gt; wrote=
:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; font-=
style: normal; font-variant-caps: normal; font-weight: normal; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=
=3D"">
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" class=3D"">
On 3 May 2019, at 10:48, Dario Faggioli &lt;<a href=3D"mailto:dfaggioli@sus=
e.com" class=3D"">dfaggioli@suse.com</a>&gt; wrote:<br class=3D"">
<br class=3D"">
On Fri, 2019-05-03 at 15:38 &#43;0000, Eslam Elnikety wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">When unpausing a capped domain, the sc=
heduler currently clears the<br class=3D"">
CSCHED_FLAG_VCPU_PARKED flag before vcpu_wake(). This, in turn,<br class=3D=
"">
causes the<br class=3D"">
vcpu_wake to set CSCHED_PRI_TS_BOOST, resulting in an unfair credit<br clas=
s=3D"">
boost. The<br class=3D"">
comment around the changed lines already states that clearing the<br class=
=3D"">
flag should<br class=3D"">
happen AFTER the unpause. This bug was introduced in commit<br class=3D"">
be650750945<br class=3D"">
&quot;credit1: Use atomic bit operations for the flags structure&quot;.<br =
class=3D"">
<br class=3D"">
Original patch author credit: Xi Xiong.<br class=3D"">
<br class=3D"">
</blockquote>
Mmm... I'm not an expert of these things, but doesn't this means we<br clas=
s=3D"">
need a &quot;Signed-off-by: Xi Xiong &lt;<a href=3D"mailto:xxx@yyy.zzz" cla=
ss=3D"">xxx@yyy.zzz</a>&gt;&quot; then? Cc-ing Lars...<br class=3D"">
</blockquote>
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">As
 far as I can tell from a quick search on xen-devel@ Xi Xiong is or<span cl=
ass=3D"Apple-converted-space">&nbsp;</span></span><br style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">was
 an Amazon employee so a signed-off-by is not strictly necessary</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">but
 you may want to say something like.</span><br style=3D"font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px;" class=3D"">
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">Original
 patch author credit: Xi Xiong of Amazon</span><br style=3D"font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px;" class=3D"">
<br style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Helvetica; font-size: 12px; font-style: normal;=
 font-variant-caps: normal; font-weight: normal; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display:=
 inline !important;" class=3D"">Lars</span></div>
</blockquote>
</div>
<div class=3D""><br class=3D"">
</div>
Thanks for the prompt responses, Lars and Dario.
<div class=3D""><br class=3D"">
<div class=3D"">Indeed. Xi was with Amazon. I will adjust the commit messag=
e accordingly. (I will also omit the additional comment as pointed out by D=
ario).</div>
</div>
</body>
</html>

--_000_562F981430CE467C80278F21FC6C2845amazoncom_--


--===============6978331471066717546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6978331471066717546==--

