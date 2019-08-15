Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D18F40C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 21:02:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyKyD-0006Hf-7o; Thu, 15 Aug 2019 18:59:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T442=WL=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hyKyC-0006Ha-IQ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 18:59:32 +0000
X-Inumbo-ID: d02894c0-bf8e-11e9-aee9-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d02894c0-bf8e-11e9-aee9-bc764e2007e4;
 Thu, 15 Aug 2019 18:59:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so2109973wmg.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2019 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=WEE/l3/Y3CXKtX6ZyPQJm/YAOLuox48TSHH0/aAlXco=;
 b=hp5QAd9NV7mllWpx/xKLeE9mOzfBkWhwcV39AJYMyeJ/LEh7t+rqUQ7asKG4dPqksO
 8HunuKjr1cd2rgbHh/1wug4MXIdSI03HmigLC0IOJquKqqfc1ShuhR35EYEYcW34VOMk
 nwEA9zKQGOsH63Y/zNMLXMY4j1cqAYhHFtjfPPTpB9os8FyVHBvYQnHZkKSvLiM+1LUd
 J53EDiLw5JWHEouHGPnLsBJlNzYM0YW/N5O7czFkDrtZmRFkdEmt1ewMyr06/F6rpLtA
 luzWwjTUMhdPwI7ugETi0BStmHsOtGesLgcSB8igyeFEQe2xeMIwpXlc/QI9qNnk4UO+
 zzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=WEE/l3/Y3CXKtX6ZyPQJm/YAOLuox48TSHH0/aAlXco=;
 b=XiTfJ+Gf8kN8V4hRTIdMrbf82jwuz5QdO9/U8NaBHJcJbgEJjZLNZwEX8TVJupR2zv
 frPluiYECAqOmBddqObSburEuNe6Y0CeVXBgDiiE3RfNA4d1UPbTDNfdHUUJzkA/y3DV
 lRt/F/BPyXy5z7Z8oNRudIQ+kdmEkpndXmjiEcnK24W5LwRR/lQCgDYWBMUon1oMnAWv
 v9Tv5A8Mlyv/1z4lAHddA9pZPCwtyy/kyi2SQRJpjQ4o4WHHJHX+FNk8PjuGnIvNmdsW
 o7nmFKn4TcWRS2tqjya3TeeW4zAMjH7cSnr73wM4yjXYbP6nRQNc2oVJ32C+5q/JbSAB
 wZUA==
X-Gm-Message-State: APjAAAUkQ9I8k2gn05imIaetPNxaMwp8z0vwzoMFZZGAl9GjizqNHHlz
 GfmV+EULUMlb+VFyyGO1+dI=
X-Google-Smtp-Source: APXvYqziqFmkMzvDGPwAk5G3zzc69MNqGMOoS5L98g5Rc0pWrhWcZTikKPpa/gz1Z16+iF7PQ4oeaQ==
X-Received: by 2002:a1c:c5c2:: with SMTP id v185mr4312212wmf.161.1565895570033; 
 Thu, 15 Aug 2019 11:59:30 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:2846:9773:abb7:590b?
 ([2a02:c7f:ac18:da00:2846:9773:abb7:590b])
 by smtp.gmail.com with ESMTPSA id t140sm2219438wmt.0.2019.08.15.11.59.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 11:59:29 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <7C16DC4F-18E5-4379-8A83-74DDA010F01C@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Thu, 15 Aug 2019 19:59:28 +0100
In-Reply-To: <bd7a904d-83dd-2499-28ea-0adb294587c8@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <664a5f94-bf16-42b1-ff99-e3cee5170563@arm.com>
 <CFEA0BB3-F344-4672-A731-19F0D80DAF46@amazon.com>
 <bd7a904d-83dd-2499-28ea-0adb294587c8@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============6797083520671501308=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6797083520671501308==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6AB87E40-AA24-4D1C-B141-D9017EBEA1E7"


--Apple-Mail=_6AB87E40-AA24-4D1C-B141-D9017EBEA1E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 15 Aug 2019, at 17:29, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 15/08/2019 16:42, Wieczorkiewicz, Pawel wrote:
>> Thanks Julien. I will do that next time (unless you guys want me to
>> re-send all this ;-)).
>>=20
>> BTW, I also pushed my changes onto the xenbits server:
>> =
http://xenbits.xenproject.org/gitweb/?p=3Dpeople/wipawel/livepatch-build-t=
ools;a=3Dsummary
>> http://xenbits.xenproject.org/gitweb/?p=3Dpeople/wipawel/xen;a=3Dsummar=
y
>>=20
>> I hope that makes navigation and dealing with the swarm of patches a
>> bit easier.
>=20
> Please (re)send two patch series, one for Xen and one for build tools.=20=

> Even for he subset you posted before, I can't figure out whether =
they're
> ok to push straight away, or need more review.  This will be far =
easier
> to do in one single go (per repo).
>=20
> My workflow for series is something like this:
>=20
> First, confirm your git settings (details as appropriate)
>=20
> $ git config -l | grep sendemail
> sendemail.smtpserver=3D $SERVER
> sendemail.chainreplyto=3Dfalse
> sendemail.to=3DXen-devel <xen-devel@lists.xenproject.org>
> sendemail.from=3D $ME <$ME@example.com>
>=20
> Second, render the patch series:
>=20
> $ mkdir foo-v1
> $ cd foo-v1
> $ git format-patch master --cover-letter
> 0000-cover-letter.patch
> 0001- ....
> ....
>=20
> $ $EDITOR 0000-cover-letter.patch
>=20
> Fill in as appropriate.  Provide a brief overview, note the subject of
> companion series, etc.  I also include the union of all CC'd people in
> each patch just below the Subject: header which avoids having to
> manually specify them later.  Be aware that it is strict about RFCs, =
so
> has to be Cc: and not CC:
>=20
> Third, double check everything:
>=20
> $ git send-email --dry-run *.patch
>=20
> Fourth, spam the list by dropping the --dry-run.
>=20
> Fifth, sit back and watch the reviews come in[1].
>=20
> ~Andrew

@Andrew: You just outlined what's in the wiki and what the =
add_maintainers tool does.

We should chat about the Cc: vs CC:=20
* I may need to fix the tool as it uses CC: when used with some options

@Pawel: I submitted=20
=
https://lists.xenproject.org/archives/html/xen-devel/2019-08/msg01575.html=
 =
<https://lists.xenproject.org/archives/html/xen-devel/2019-08/msg01575.htm=
l>
=
https://lists.xenproject.org/archives/html/xen-devel/2019-08/msg01581.html=
 =
<https://lists.xenproject.org/archives/html/xen-devel/2019-08/msg01581.htm=
l>
which once applied ensures that the tools can be used on the live patch =
build tools

I also added =
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Using_add_=
maintainers.pl_.28or_get_maintainer.pl.29_from_outside_of_xen.git =
<https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Using_add=
_maintainers.pl_.28or_get_maintainer.pl.29_from_outside_of_xen.git>

Lars


--Apple-Mail=_6AB87E40-AA24-4D1C-B141-D9017EBEA1E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 15 Aug 2019, at 17:29, Andrew Cooper &lt;<a =
href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
15/08/2019 16:42, Wieczorkiewicz, Pawel wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Thanks Julien. I will do that next time (unless =
you guys want me to<br class=3D"">re-send all this ;-)).<br class=3D""><br=
 class=3D"">BTW, I also pushed my changes onto the xenbits server:<br =
class=3D""><a =
href=3D"http://xenbits.xenproject.org/gitweb/?p=3Dpeople/wipawel/livepatch=
-build-tools;a=3Dsummary" =
class=3D"">http://xenbits.xenproject.org/gitweb/?p=3Dpeople/wipawel/livepa=
tch-build-tools;a=3Dsummary</a><br =
class=3D"">http://xenbits.xenproject.org/gitweb/?p=3Dpeople/wipawel/xen;a=3D=
summary<br class=3D""><br class=3D"">I hope that makes navigation and =
dealing with the swarm of patches a<br class=3D"">bit easier.<br =
class=3D""></blockquote><br class=3D"">Please (re)send two patch series, =
one for Xen and one for build tools.&nbsp;<br class=3D"">Even for he =
subset you posted before, I can't figure out whether they're<br =
class=3D"">ok to push straight away, or need more review.&nbsp; This =
will be far easier<br class=3D"">to do in one single go (per repo).<br =
class=3D""><br class=3D"">My workflow for series is something like =
this:<br class=3D""><br class=3D"">First, confirm your git settings =
(details as appropriate)<br class=3D""><br class=3D"">$ git config -l | =
grep sendemail<br class=3D"">sendemail.smtpserver=3D $SERVER<br =
class=3D"">sendemail.chainreplyto=3Dfalse<br =
class=3D"">sendemail.to=3DXen-devel &lt;<a =
href=3D"mailto:xen-devel@lists.xenproject.org" =
class=3D"">xen-devel@lists.xenproject.org</a>&gt;<br =
class=3D"">sendemail.from=3D $ME &lt;$<a href=3D"mailto:ME@example.com" =
class=3D"">ME@example.com</a>&gt;<br class=3D""><br class=3D"">Second, =
render the patch series:<br class=3D""><br class=3D"">$ mkdir foo-v1<br =
class=3D"">$ cd foo-v1<br class=3D"">$ git format-patch master =
--cover-letter<br class=3D"">0000-cover-letter.patch<br class=3D"">0001- =
....<br class=3D"">....<br class=3D""><br class=3D"">$ $EDITOR =
0000-cover-letter.patch<br class=3D""><br class=3D"">Fill in as =
appropriate.&nbsp; Provide a brief overview, note the subject of<br =
class=3D"">companion series, etc.&nbsp; I also include the union of all =
CC'd people in<br class=3D"">each patch just below the Subject: header =
which avoids having to<br class=3D"">manually specify them later.&nbsp; =
Be aware that it is strict about RFCs, so<br class=3D"">has to be Cc: =
and not CC:<br class=3D""><br class=3D"">Third, double check =
everything:<br class=3D""><br class=3D"">$ git send-email --dry-run =
*.patch<br class=3D""><br class=3D"">Fourth, spam the list by dropping =
the --dry-run.<br class=3D""><br class=3D"">Fifth, sit back and watch =
the reviews come in[1].<br class=3D""><br class=3D"">~Andrew<br =
class=3D""></div></div></blockquote></div><br class=3D""><div =
class=3D"">@Andrew: You just outlined what's in the wiki and what the =
add_maintainers tool does.</div><div class=3D""><br class=3D""></div><div =
class=3D"">We should chat about the Cc: vs CC:&nbsp;</div><div =
class=3D"">* I may need to fix the tool as it uses CC: when used with =
some options</div><div class=3D""><br class=3D""></div><div =
class=3D"">@Pawel: I submitted&nbsp;</div><div class=3D""><a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2019-08/msg01=
575.html" =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2019-08/ms=
g01575.html</a></div><div class=3D""><a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2019-08/msg01=
581.html" =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2019-08/ms=
g01581.html</a></div><div class=3D"">which once applied ensures that the =
tools can be used on the live patch build tools</div><div class=3D""><br =
class=3D""></div><div class=3D"">I also added&nbsp;<a =
href=3D"https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Us=
ing_add_maintainers.pl_.28or_get_maintainer.pl.29_from_outside_of_xen.git"=
 =
class=3D"">https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches=
#Using_add_maintainers.pl_.28or_get_maintainer.pl.29_from_outside_of_xen.g=
it</a></div><div class=3D""><br class=3D""></div><div =
class=3D"">Lars</div><div class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_6AB87E40-AA24-4D1C-B141-D9017EBEA1E7--


--===============6797083520671501308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6797083520671501308==--

