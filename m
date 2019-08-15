Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEBC8EFC2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 17:49:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyHxW-0004UG-NN; Thu, 15 Aug 2019 15:46:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T442=WL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hyHxV-0004U4-9P
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 15:46:37 +0000
X-Inumbo-ID: dca41ac8-bf73-11e9-b90c-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dca41ac8-bf73-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 15:46:36 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so2586287wru.13
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2019 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=+byOD1vgJ7pXCEAuu1NrFcWiSnFT3v/RAMb2EqUj1U0=;
 b=XpvjAg0+l4a+ySxtVQSPeY+XxjXm/n+0oCFILf8uHEerUZwjdeMFxRxj3BDHgmpH+B
 1p4kNIIkg/4Kt2Ewoax9lcPWANe9NGGibXUBas1yNTMZ3iYuvu88rNzhYvtntilMd3Bo
 eEfSr9zvRQl1xpCELoim69Fp62+4rIDk86GcKDF04PCFCTT0aYropPEn/c/Ip2RPKpbV
 LavfEg+IgI+OQSliHoyeDMMl2GbKTOIeNLQbqpaxB2rvxYrfd9njf7FkGUfTsc9Ziffk
 vFDI30KxOk3NiaxzOgpQZKOut7eY2J/t6WQxYWHYRLmxFwGBsSKIb636JkwsZy6PSeQO
 VPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=+byOD1vgJ7pXCEAuu1NrFcWiSnFT3v/RAMb2EqUj1U0=;
 b=uSA3ChyY/+33H9U4EvWspYJVTiO6IX+dYQQjryU4F/xglrrhQlRy5xfiT0FImrS+sh
 mfP4Im5TQkahU+lUXT2syFqZ7HRRdPrWLnqpDcj6hxpmyuGuAeTj3v580ywkZxO25Hq7
 foSheJkwFd7dSB4YImJzTaa4vaoG8VNztxkkd5nOwPEo8grRqWA3rzMXLLFQXuIN2ntC
 ozJQJLNcfSWbzSRR5GIGWGFXga1QhVVkhzD6K4ISBi07vtNFOdx4h4QRoluGdtnhjMJn
 vxUTS3IwCZDVln7TWakSlXILT0BxpGxF/N6zLYD/UzInEwj94AJfZbezM577G5KMRX3w
 CmkA==
X-Gm-Message-State: APjAAAXhDnpe5Kjt6qKMApad7XpiHnhD44nNme27DG+hMwi36Zjk5n6B
 X2xFj658Om70La+O+fRZ4/g=
X-Google-Smtp-Source: APXvYqxQg4cVMF6O/Ta8i073WrVzBmmc/l5ejiAsXW4CF1fnv6cmra70nUcOV2E68alsOp/IeT7mVw==
X-Received: by 2002:a5d:6383:: with SMTP id p3mr6489592wru.34.1565883994560;
 Thu, 15 Aug 2019 08:46:34 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:401e:f277:3894:a225?
 ([2a02:c7f:ac18:da00:401e:f277:3894:a225])
 by smtp.gmail.com with ESMTPSA id f17sm1750254wmj.27.2019.08.15.08.46.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 08:46:33 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <C3D44CDE-E1C3-404D-852E-FDA691F09B82@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Thu, 15 Aug 2019 16:46:33 +0100
In-Reply-To: <18CBBC37-9027-41B7-8375-44FE3E56F79F@gmail.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <18CBBC37-9027-41B7-8375-44FE3E56F79F@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: "Tim \(Xen.org\)" <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8948490125445060510=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8948490125445060510==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_9BF047BD-BACC-42F3-AD7E-F980A05DF4C3"


--Apple-Mail=_9BF047BD-BACC-42F3-AD7E-F980A05DF4C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 15 Aug 2019, at 16:33, Lars Kurth <lars.kurth.xen@gmail.com> wrote:
>=20
>=20
>=20
>> On 15 Aug 2019, at 16:19, Wieczorkiewicz, Pawel <wipawel@amazon.de =
<mailto:wipawel@amazon.de>> wrote:
>>=20
>> Hi Lars, Julien,
>>=20
>> Thanks for the pointers, I will read them up and follow the =
recommendations with my future contributions.
>> Sorry for the mess=E2=80=A6
>=20
> It's not really a mess: it must have been quite a pain to put the =
mails together manually
> And it would become more painful for a second revision
> I have been through this myself
>=20
>> But, let me ask first before reading the wikis, how do you prefer =
submitting series that contain patches belonging to 2 distinct repos =
(e.g. xen and livepatch-build-tools)?
>=20
> That's a good question and a very rare use-case. We split them, as all =
the tools such as git format-patch only work on one repo
> Applying patches also only works on a per repo basis
>=20
> So, I would send two series. But mention the relationship in the cover =
letter (and/or patch if it is a single one)
>=20
> The tools in the docs currently may not work on =
livepatch-build-tools.git
> * First: there is no MAINTAINERS file in livepatch-build-tools.git, =
which really should be added
> * Second: using xen.git:/scripts/add_maintainers.pl may not work when =
called from within livepatch-build-tools.git
>=20
> I am going to play with this and update the docs and if needed the =
tools accordingly
> You may have to improvise in the meantime:
> * Step 1 & 3 will work: Step 2, option 1 will probably not (which =
means until I have done this, you may have to follow option 2 and make =
sure that the right people are CC'ed)

I can confirm that Step 2 does not work without some tools changes to =
scripts/add_maintainers.pl when called from within a non-xen.git repo

And=20

git send-email --to xen-devel@lists.xenproject.org =
--cc-cmd=3D"../xen.git/scripts/get_maintainer.pl" --dry-run -1

errors with=20

../xen.git/scripts/get_maintainer.pl: The current directory does not =
appear to be a Xen source tree.

I need to fix this. Hopefully get_maintainer.pl isn't too dependant on =
the actual Xen tree

Lars



--Apple-Mail=_9BF047BD-BACC-42F3-AD7E-F980A05DF4C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 15 Aug 2019, at 16:33, Lars Kurth &lt;<a =
href=3D"mailto:lars.kurth.xen@gmail.com" =
class=3D"">lars.kurth.xen@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><br class=3D""><div =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 15 Aug 2019, at 16:19, Wieczorkiewicz, Pawel &lt;<a =
href=3D"mailto:wipawel@amazon.de" class=3D"">wipawel@amazon.de</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D"">

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D"">

<div style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D"">
Hi Lars, Julien,
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Thanks for the pointers, I will read them up and follow =
the recommendations with my future contributions.</div>
<div class=3D"">Sorry for the mess=E2=80=A6</div></div></div></blockquote>=
<div class=3D""><br class=3D""></div><div class=3D"">It's not really a =
mess: it must have been quite a pain to put the mails together =
manually</div><div class=3D"">And it would become more painful for a =
second revision</div><div class=3D"">I have been through this =
myself</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D"">

<div class=3D"">But, let me ask first before reading the wikis, how do =
you prefer submitting series that contain patches belonging to 2 =
distinct repos (e.g. xen and =
livepatch-build-tools)?</div></div></div></blockquote><div class=3D""><br =
class=3D""></div>That's a good question and a very rare use-case. We =
split them, as all the tools such as&nbsp;git format-patch only work on =
one repo</div><div class=3D"">Applying patches also only works on a per =
repo basis</div><div class=3D""><br class=3D""></div><div class=3D"">So, =
I would send two series. But mention the relationship in the cover =
letter (and/or patch if it is a single one)</div><div class=3D""><br =
class=3D""></div><div class=3D"">The tools in the docs currently may not =
work on livepatch-build-tools.git</div><div class=3D"">* First: there is =
no MAINTAINERS file in livepatch-build-tools.git, which really should be =
added</div><div class=3D"">* Second: using =
xen.git:/scripts/add_maintainers.pl may not work when called from within =
livepatch-build-tools.git</div><div class=3D""><br class=3D""></div><div =
class=3D"">I am going to play with this and update the docs and if =
needed the tools accordingly</div><div class=3D"">You may have to =
improvise in the meantime:</div><div class=3D"">* Step 1 &amp; 3 will =
work: Step 2, option 1 will probably not (which means until I have done =
this, you may have to follow option 2 and make sure that the right =
people are CC'ed)</div></div></div></blockquote><br =
class=3D""></div><div>I can confirm that Step 2 does not work without =
some tools changes to scripts/add_maintainers.pl when called from within =
a non-xen.git repo</div><div><br =
class=3D""></div><div>And&nbsp;</div><div><span style=3D"font-family: =
Menlo; font-size: 11px;" class=3D""><br class=3D""></span></div><div><span=
 style=3D"font-family: Menlo; font-size: 11px;" class=3D"">git =
send-email --to <a href=3D"mailto:xen-devel@lists.xenproject.org" =
class=3D"">xen-devel@lists.xenproject.org</a> =
--cc-cmd=3D"../xen.git/scripts/get_maintainer.pl" --dry-run =
-1</span></div><div><span style=3D"font-family: Menlo; font-size: 11px;" =
class=3D""><br class=3D""></span></div><div>errors =
with&nbsp;</div><div><br class=3D""></div><div><div style=3D"margin: =
0px; font-stretch: normal; font-size: 11px; line-height: normal; =
font-family: Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">../xen.git/scripts/get_maintainer.pl: =
The current directory does not appear to be a Xen source =
tree.</span></div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 11px; line-height: normal; font-family: Menlo;" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""><br class=3D""></span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D""><div style=3D"font-family: Helvetica; =
font-size: 12px;">I need to fix this. Hopefully&nbsp;<span =
style=3D"font-family: Menlo; font-size: 11px;" =
class=3D"">get_maintainer.pl&nbsp;</span>isn't too dependant on the =
actual Xen tree</div><div style=3D"font-family: Helvetica; font-size: =
12px;"><br class=3D""></div><div style=3D"font-family: Helvetica; =
font-size: 12px;">Lars</div></span></div><div style=3D"margin: 0px; =
font-stretch: normal; font-size: 11px; line-height: normal; font-family: =
Menlo;" class=3D""><br class=3D""></div></div><br =
class=3D""></body></html>=

--Apple-Mail=_9BF047BD-BACC-42F3-AD7E-F980A05DF4C3--


--===============8948490125445060510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8948490125445060510==--

