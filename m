Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F667579F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 21:12:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqj64-0007l2-N9; Thu, 25 Jul 2019 19:08:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M7Yg=VW=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hqj62-0007kx-VB
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 19:08:11 +0000
X-Inumbo-ID: 8a321380-af0f-11e9-8980-bc764e045a96
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a321380-af0f-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 19:08:09 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k10so50240733qtq.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2019 12:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=13Nu5THlpeQ9be32pBci+6df/d3DWPM2EfELvF3CEl0=;
 b=itcZjMvtZiaVnOh7qVtSWZMdkmFsIY0ds/Is2E5gQwpbv1JO1JShlWF4Oe3OL9WCUU
 AAdxooHjFbNN5evrcvqOF/oPqtgxSLs+onQKE6RYeFmQXr/NSW3xO9qK6QdlihCAXJdf
 O1Yoway0jFMuwSBijfGKWFOGk5geMdDCDFGO6B9Q6BJQ85JgTK1SvbwpSRaDzZWkyaDj
 cdqWlk6nxIuDbfBZOhNyJ7fvf/sEwREnKp4ymhVcBhB6q7n3+TLXAkVI+oYZXOdhNaxV
 R7hpdgaj9kr1X1olvY6PKpx+0Wd5vbS9938f8AX7lkkUHI5280EmlUgOG5hoXBijd/Xs
 piSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=13Nu5THlpeQ9be32pBci+6df/d3DWPM2EfELvF3CEl0=;
 b=egQ+xWKMEmfR0WuWXCHYbYBBOZGtWSajON7+Y0V6GtSKoqUKcRPz5zso4VrOtkM8xE
 uZFUwEtdXeHoGNoL8Kt1U6z8wvhlXjhFi+aLNxnSGq0zxnQAZnOWuP9+5/uRmSf1Z8m+
 dFOQPddcvUWHYNtwBRY+Yf0J/HLBh7xmpw45sG0F5iK/aSLTCSSMxkuBhN4klJhJSyWP
 /YC0JzngOyyiFftU6Y2Tnqq3MNs2OPlSCc38cvpO97xo9Az/KnvWBUFoS87gSwgfLoCI
 GHPzeHh/OdpXlM7trwWdlCvIHvJde8DEpb1CMPnaUWZTtCQTcO/exfaxmFw02KJxVuil
 O6Fg==
X-Gm-Message-State: APjAAAVPmVPltdft7ICRyR7TWULFDNqKZHxmEyWpDyni5+oZtznvzOXN
 6FT64xOGyjKOPLLeCDpYgb8=
X-Google-Smtp-Source: APXvYqwwVk+NVPrrZG8nk9bBR1oyAajjykF7kvLRypqc1o0kacBJeCAUqz2U4I3arC+vfqfncdX4Hw==
X-Received: by 2002:ac8:275a:: with SMTP id h26mr62596532qth.345.1564081688538; 
 Thu, 25 Jul 2019 12:08:08 -0700 (PDT)
Received: from ?IPv6:2607:fb90:24a1:a61b:35c8:207e:1332:8c4e?
 ([2607:fb90:24a1:a61b:35c8:207e:1332:8c4e])
 by smtp.gmail.com with ESMTPSA id 23sm22512841qkk.121.2019.07.25.12.08.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 12:08:08 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPhone Mail (16G77)
In-Reply-To: <20190725135112.83569-1-roger.pau@citrix.com>
Date: Thu, 25 Jul 2019 15:08:07 -0400
Message-Id: <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
References: <20190725135112.83569-1-roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, jun.nakajima@intel.com,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, tboot-devel@lists.sourceforge.net,
 Tim Deegan <tim@xen.org>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Shane Wang <shane.wang@intel.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============9171636174846756447=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9171636174846756447==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-6084C510-8677-43BB-AF00-3F03F993C5F6
Content-Transfer-Encoding: 7bit


--Apple-Mail-6084C510-8677-43BB-AF00-3F03F993C5F6
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

(cc Intel and tboot-devel)

Hi Roger,

Thanks for your interest in documenting the status of maintenance for Intel T=
XT support in Xen.  Intel TXT and Xen are deployed in production today by Op=
enXT and QubesOS for boot integrity.  Xen was a pioneering adopter of DRTM, a=
lmost a decade ago, but mainstream enterprise computing is now catching up w=
ith the May 2019 release of Windows 10 SystemGuard.  It would be nice to avo=
id "orphaning" one of Xen's competitive advantages in 2019.

> On Jul 25, 2019, at 09:51, Roger Pau Monne <roger.pau@citrix.com> wrote:
>=20
> Gang Wei Intel email address has been bouncing for some time now,

Gang Wei's replacement is Lukasz Hawrylko, who posted on March 6, 2019:
https://lists.gt.net/xen/devel/546401

Could you include Lukasz patch, along with Julien's requested formatting cha=
nges, in your update to the MAINTAINERS file?  As a new Xen maintainer and c=
ontributor, Lukasz may not yet be familiar with the procedures and practices=
 of the Xen community.  We can welcome his new maintainership role without d=
ropping support for a feature, that (a) he is maintaining, (b) is used by Xe=
n.

> and
> the other maintainer is non-responsive to patches [0], so remove
> maintainers and declare INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
> orphaned.
>=20
> [0] https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg00563.=
html

Since we have at least one Intel maintainer, Lukasz, the feature need not be=
 orphaned.  If Shawn is not responding to the request to confirm Lukasz as m=
aintainer, the Xen community has multiple communication channels with Intel.=
  Pragmatically, a review of the tboot-devel archives shows that Lukasz is w=
orking on tboot development. =20

Rich=

--Apple-Mail-6084C510-8677-43BB-AF00-3F03F993C5F6
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=
=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><s=
pan></span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D=
"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div dir=3D=
"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-=
8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=3D"=
content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span>=
</span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D"t=
ext/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"l=
tr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"=
><div dir=3D"ltr"></div><div><span style=3D"background-color: rgba(255, 255,=
 255, 0);"><i>(cc Intel and tboot-devel)</i></span></div><div><span style=3D=
"background-color: rgba(255, 255, 255, 0);"><br></span></div><div><span styl=
e=3D"background-color: rgba(255, 255, 255, 0);">Hi Roger,</span></div><div><=
span style=3D"background-color: rgba(255, 255, 255, 0);"><br></span></div><d=
iv><span style=3D"background-color: rgba(255, 255, 255, 0);">Thanks for your=
 interest in documenting the status of maintenance for Intel TXT support in X=
en. &nbsp;Intel TXT and Xen are deployed in production today by OpenXT and Q=
ubesOS for boot integrity. &nbsp;Xen was a pioneering adopter of DRTM, almos=
t a decade ago, but mainstream enterprise computing is now catching up with t=
he May 2019 release of Windows 10 SystemGuard. &nbsp;It would be nice to avo=
id "orphaning" one of Xen's competitive advantages in 2019.</span></div><div=
><br></div><div dir=3D"ltr">On Jul 25, 2019, at 09:51, Roger Pau Monne &lt;<=
a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wrote:</=
div><div dir=3D"ltr"><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><s=
pan>Gang Wei Intel email address has been bouncing for some time now, </span=
></div></blockquote><div><br></div><div>Gang Wei's replacement is Lukasz Haw=
rylko, who posted on March 6, 2019:</div><div><a href=3D"https://lists.gt.ne=
t/xen/devel/546401">https://lists.gt.net/xen/devel/546401</a></div><div><br>=
</div><div>Could you include Lukasz patch, along with Julien's requested for=
matting changes, in your update to the MAINTAINERS file? &nbsp;As a new Xen m=
aintainer and contributor, Lukasz may not yet be familiar with the procedure=
s and practices of the Xen community. &nbsp;We can welcome his new maintaine=
rship role without dropping support for a feature, that (a) he is maintainin=
g, (b) is used by Xen.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><=
span>and</span><br><span>the other maintainer is non-responsive to patches [=
0], so remove</span><br><span>maintainers and declare INTEL(R) TRUSTED EXECU=
TION TECHNOLOGY (TXT)</span><br><span>orphaned.</span><br><span></span><br><=
span>[0] <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/201=
9-05/msg00563.html">https://lists.xenproject.org/archives/html/xen-devel/201=
9-05/msg00563.html</a></span><br><br></div></blockquote><div dir=3D"ltr"><br=
></div><div dir=3D"ltr">Since we have at least one Intel maintainer, Lukasz,=
 the feature need not be orphaned. &nbsp;If Shawn is not responding to the r=
equest to confirm Lukasz as maintainer, the Xen community has multiple commu=
nication channels with Intel. &nbsp;Pragmatically, a review of the tboot-dev=
el archives shows that Lukasz is working on tboot development. &nbsp;</div><=
div dir=3D"ltr"><br></div><div dir=3D"ltr">Rich</div></div></div></div></div=
></div></div></div></body></html>=

--Apple-Mail-6084C510-8677-43BB-AF00-3F03F993C5F6--


--===============9171636174846756447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9171636174846756447==--

