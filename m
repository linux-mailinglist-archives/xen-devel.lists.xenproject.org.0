Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84F84CF0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 15:29:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvLyI-00049l-BE; Wed, 07 Aug 2019 13:27:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dGpx=WD=amazon.com=prvs=115058da6=elnikety@srs-us1.protection.inumbo.net>)
 id 1hvLyG-00049g-Uc
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 13:27:17 +0000
X-Inumbo-ID: 1239fe9a-b917-11e9-8980-bc764e045a96
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1239fe9a-b917-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1565184435; x=1596720435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=6d8YA6REd0jL+TwFjAqpHxb7hIBkZStlsjr6w7ygnZY=;
 b=kwpGucQoOEXeNrkn1ZQAiWX//v4VJHTvCoFG4Le815NsQTylDY5XV8En
 c6tUqzIy3p9wR7X6GMY/JwWxGnkJhxaiaYwpQo7KE9uViIVDqUfwaSPKy
 I/VNNzapDpHLWD4POgTWid4EMsXgiSrBaXweuVjKpTIINp5czJt9CfFyD A=;
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; 
 d="scan'208,217";a="745606982"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 07 Aug 2019 13:27:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3196B141DA8; Wed,  7 Aug 2019 13:27:11 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 13:27:10 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 13:27:10 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Wed, 7 Aug 2019 13:27:09 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
Thread-Index: AQHVTRIxUNF+eOebUkSjRBUx8cK6Dqbvj84AgAAHUYCAAAPcAIAAEn8A
Date: Wed, 7 Aug 2019 13:27:09 +0000
Message-ID: <79556E3F-65AD-42F4-96A0-8EEB99D59398@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
 <9F89B8B5-D92E-4CA6-ABCF-5F8E9707AE94@amazon.com>
 <6a5f6fa6-d387-a665-47f1-e5a1b0534a6e@suse.com>
In-Reply-To: <6a5f6fa6-d387-a665-47f1-e5a1b0534a6e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: multipart/mixed; boundary="===============4884337438182974918=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4884337438182974918==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_79556E3F65AD42F496A08EEB99D59398amazoncom_"

--_000_79556E3F65AD42F496A08EEB99D59398amazoncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 7. Aug 2019, at 14:20, Jan Beulich <jbeulich@suse.com<mailto:jbeulich@su=
se.com>> wrote:

On 07.08.2019 14:07,  Elnikety, Eslam  wrote:
On 7. Aug 2019, at 13:40, Andrew Cooper <andrew.cooper3@citrix.com<mailto:a=
ndrew.cooper3@citrix.com>> wrote:
On 07/08/2019 12:20, Eslam Elnikety wrote:
Adding support for FIFO event channel ABI was first introduced in Xen 4.4
(see 88910061ec6). Make this support tunable, since the choice of which
event channel ABI has implications for hibernation. Consider resuming a
pre Xen 4.4 hibernated Linux guest. The guest boot kernel defaults to FIFO
ABI, whereas the resume kernel assumes 2L. This, in turn, results in Xen
and the resumed kernel talking past each other (due to different protocols
FIFO vs 2L).

I'm afraid I don't follow.

We have a Linux kernel which knows about FIFO, which was first booted on
Xen < 4.4, so configured 2L mode.

It is then suspended, and resumed on a newer Xen >=3D 4.4.  The guest now
has a choice between 2L mode, and FIFO mode.

What is the problem?

When resuming, the guest in question should continue to use 2L mode,
because that is what it was using previously.
After resuming (i.e., Linux's software_resume), the guest will indeed conti=
nue
to use 2L. However, Xen has already done evtchn_fifo_init_control as part o=
f
the boot kernel init (before the guest's software_resume). Then, we reach t=
he
point where guest assumes 2L and Xen assumes FIFO.

This involvement of two distinct kernels wasn't obvious at all from
the initial posting, despite the use of the terms "guest boot kernel"
and "resumed kernel". In any event - isn't this an issue to be solved
between the two kernels, without (as far as possible) Xen's
involvement, and without restricting guest capabilities?

Jan

I think a re-write for the commit message is in order, given that the disti=
nction between boot and resume kernels was not clear. I will do that, along=
 with other changes if needed, subject to the maintainers being happy with =
the patch at a high level.

In principle, we can instruct the boot kernel to not use FIFO. Yet, this wi=
ll be needed when resuming on Xen >=3D 4.4, but not needed when resuming on=
 Xen < 4.4. I think this is grounds to introduce the knob.

Thanks,
Eslam

--_000_79556E3F65AD42F496A08EEB99D59398amazoncom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <437AC5A12F351545B9D8D0C162658356@amazon.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 7. Aug 2019, at 14:20, Jan Beulich &lt;<a href=3D"mailto=
:jbeulich@suse.com" class=3D"">jbeulich@suse.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">On
 07.08.2019 14:07, &nbsp;Elnikety, Eslam &nbsp;wrote:</span><br style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; widows: auto; word-spacing: 0px; -web=
kit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<blockquote type=3D"cite" class=3D"">On 7. Aug 2019, at 13:40, Andrew Coope=
r &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" class=3D"">andrew.cooper=
3@citrix.com</a>&gt; wrote:<br class=3D"">
On 07/08/2019 12:20, Eslam Elnikety wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">Adding support for FIFO event channel =
ABI was first introduced in Xen 4.4<br class=3D"">
(see 88910061ec6). Make this support tunable, since the choice of which<br =
class=3D"">
event channel ABI has implications for hibernation. Consider resuming a<br =
class=3D"">
pre Xen 4.4 hibernated Linux guest. The guest boot kernel defaults to FIFO<=
br class=3D"">
ABI, whereas the resume kernel assumes 2L. This, in turn, results in Xen<br=
 class=3D"">
and the resumed kernel talking past each other (due to different protocols<=
br class=3D"">
FIFO vs 2L).<br class=3D"">
</blockquote>
<br class=3D"">
I'm afraid I don't follow.<br class=3D"">
<br class=3D"">
We have a Linux kernel which knows about FIFO, which was first booted on<br=
 class=3D"">
Xen &lt; 4.4, so configured 2L mode.<br class=3D"">
<br class=3D"">
It is then suspended, and resumed on a newer Xen &gt;=3D 4.4. &nbsp;The gue=
st now<br class=3D"">
has a choice between 2L mode, and FIFO mode.<br class=3D"">
<br class=3D"">
What is the problem?<br class=3D"">
<br class=3D"">
When resuming, the guest in question should continue to use 2L mode,<br cla=
ss=3D"">
because that is what it was using previously.<br class=3D"">
</blockquote>
After resuming (i.e., Linux's software_resume), the guest will indeed conti=
nue<br class=3D"">
to use 2L. However, Xen has already done evtchn_fifo_init_control as part o=
f<br class=3D"">
the boot kernel init (before the guest's software_resume). Then, we reach t=
he<br class=3D"">
point where guest assumes 2L and Xen assumes FIFO.<br class=3D"">
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
s=3D"">This
 involvement of two distinct kernels wasn't obvious at all from</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">the
 initial posting, despite the use of the terms &quot;guest boot kernel&quot=
;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">and
 &quot;resumed kernel&quot;. In any event - isn't this an issue to be solve=
d</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">between
 the two kernels, without (as far as possible) Xen's</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">involvement,
 and without restricting guest capabilities?</span><br style=3D"caret-color=
: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
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
s=3D"">Jan</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">
<div class=3D"">I think a re-write for the commit message is in order, give=
n that the distinction between boot and resume kernels was not clear. I wil=
l do that, along with other changes if needed, subject to the maintainers b=
eing happy with the patch at a high
 level.</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">In principle, we can instruct the boot kernel to not use FI=
FO. Yet, this will be needed when resuming on Xen &gt;=3D 4.4, but not need=
ed when resuming on Xen &lt; 4.4. I think this is grounds to introduce the =
knob.</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Thanks,</div>
<div class=3D"">Eslam</div>
</div>
</body>
</html>

--_000_79556E3F65AD42F496A08EEB99D59398amazoncom_--


--===============4884337438182974918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4884337438182974918==--

