Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331F79344
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 20:41:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsAXB-0001xL-4q; Mon, 29 Jul 2019 18:38:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f31F=V2=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hsAX9-0001xG-Pm
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 18:38:07 +0000
X-Inumbo-ID: 0075f3b2-b230-11e9-8980-bc764e045a96
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0075f3b2-b230-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 18:38:05 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z1so62919942wru.13
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=6sQgyJIeBp7Uu2/kLtnmnrSRlOCg6F7UeZCktuQDs1U=;
 b=S2cXrUifXhTiZDkYQpSk82UP2uxEjXwZcHECxQHfJdmzp/CP9Ib/7Lkp687vLZTXon
 GLEmfZbr3IWP5CWaw6fOBsB24epp4FTIbwPtrtHkhz6Sk9zJrgeE7p96wlBRKGd72B12
 meB4JiLzAAAXXszS54gZT79oaXwrty0Dk5FZLnnNOsjNa1As8lScCbe0hIs8DzJTDLsi
 qD2HR0ZJhmlre6HNeoO7MV82GkfUGZ/a097oVcfCvpCNkv5h+dEl5k0XvuBjNb7jzZgy
 S7A6cFrA1iDeEXGUiTLz55+R/26iKWD7fpHdhd6A1H2nejvelTCwEHhat40EPFYWSuVB
 6a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=6sQgyJIeBp7Uu2/kLtnmnrSRlOCg6F7UeZCktuQDs1U=;
 b=sBhYit+O67H3amukN1hjH1JL+KyySSp+9s8hiXJayyTVlPleto02rZfR7fK5wAOrBu
 0bsnimdspo7Il1aXkgFv1+4I5fpG0ITfd60tT5uMvCyCS5h9WxcS/L09xrv93hkIxHU5
 RttbN5DLWMYVNbbf0+fJY/ZZiE6Un/dImz5UloqVLCMtP5C2wBFIBv2/Pgs86Qaidbc1
 EixMRbrye9COg0MZ7oIv04bRSbJIBzZO758dwAZwhlxGggi7E4SayzNOSGtdlBqMBNG7
 uqgfpXb6rJ6FtD5TXjl/LcHdzz8eHo7rg/1eXbrywYTSB1EWfkVIpDiSVROElm80BiEs
 iRSg==
X-Gm-Message-State: APjAAAV8GcINN/90EmQhhyShlhvvsesjgLuqvaxQ28aLe1gUqE3yNXk4
 CMxexC17jkbULF0O/a3Ykxc=
X-Google-Smtp-Source: APXvYqzN6YVlvRCGCS/pK3TmgWKM0AFrdnu6/E1r5O/30OH74TMtOgCOgvBJ5MNDG/t/QN+tLOfUZQ==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr25881056wrp.176.1564425483702; 
 Mon, 29 Jul 2019 11:38:03 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:383e:c45d:2023:5881?
 ([2a02:c7f:ac18:da00:383e:c45d:2023:5881])
 by smtp.gmail.com with ESMTPSA id s10sm47218235wrt.49.2019.07.29.11.38.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 11:38:02 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <DA30FA07-2D81-47C4-8A53-DAABF14B6749@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 29 Jul 2019 19:38:01 +0100
In-Reply-To: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
To: Olivier Lambert <lambert.olivier@gmail.com>
References: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [RFC] XCP-ng subproject proposal
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>
Content-Type: multipart/mixed; boundary="===============7876444526571312366=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7876444526571312366==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B3286564-8478-48A8-9E54-E2D319E3928B"


--Apple-Mail=_B3286564-8478-48A8-9E54-E2D319E3928B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi everyone,

adding committers, who would need to vote for or against the proposal. =
The title probably does not need an RFC, which is why no-one looked at =
it so far

I think this is a great idea and I would want to welcome XCP-ng into the =
project: with this in mind, I vote +1

Lars


> On 22 Jul 2019, at 17:25, Olivier Lambert <lambert.olivier@gmail.com> =
wrote:
>=20
> Hello everyone,
>=20
> Following up on discussions that we had at the last Xen summit, =
we=E2=80=99re submitting a Xen subproject proposal, regarding XCP-ng =
project (https://xcp-ng.org <https://xcp-ng.org/>). Feel free to give =
your feedback!
>=20
> Regards,
>=20
> Olivier Lambert and XCP-ng team
>=20
>=20
> # XCP-ng proposal
>=20
> ## The Project
>=20
> XCP-ng is a turn-key virtualization platform based on the Xen =
Hypervisor, using existing Xen Project tools (XAPI). It's built from =
Xenserver source, improved and maintained by both passionate individuals =
and companies. The result is a completely free and Open Source solution =
available for everyone.
>=20
> Thanks to a very successful Kickstarter campaign as well as backing =
from various companies, the project doesn't require any further funds =
and isn't seeking monetary contributions.
>=20
> We believe forming a Xen sub-project within the Linux Foundation has =
the potential to bring further companies and contributors into the Xen =
Project as a whole, as well as demonstrate our dedication to open =
source. XCP-ng has already displayed its ability to draw new users into =
the Xen virtualization ecosystem. For new users, utilizing Xen from =
scratch can be daunting. XCP-ng offers a way to solve this problem by =
drawing end-users more closely into the Xen Project and providing an =
easy route for prospective Xen users to get started with Xen. This is an =
area where Xen has been trailing KVM for a long time. Hosting XCP-ng =
within the Xen Project provides a route to level the playing field. It =
would also enable the Xen Project to leverage XCP-ng success stories for =
the benefit of the Xen Project as a whole.
>=20
> ## The Mission
>=20
> Our goal is to continue development of XCP-ng while building a large =
community of contributors to XCP-ng. We also expect an increase of =
contributions to XAPI as well as the Xen Project. Through large =
community involvement and contributions we have already turned XCP-ng =
into a stable hypervisor platform that is used in small and large =
enterprise deployments.
>=20
> ## Upstream first, fully Open Source
>=20
> Vates and XCP-ng have started to work with a number of academic =
organizations with the aim to fund and develop feature improvements and =
new features that benefit the whole Xen Project ecosystem (including the =
Hypervisor and XAPI). We follow an upstream first philosophy, which is =
possible because of the fast release cycle of XCP-ng and expect to =
become a long-term contributor to XAPI and the Hypervisor project.
>=20
> Besides contributions, we believe that an XCP-ng which is part of the =
Xen Project will deliver other benefits:
>=20
> * Bring passionate and verbal XCP-ng users closer to the Xen Project
> * Bring more publicity to the Xen Project: currently we have the =
XCP-ng blog, newsletter and success stories, which we are willing to =
share with the Xen Project
>=20
> With an incredibly active forum, IRC, and github, we are always =
looking for more contributors to the project. We also believe in giving =
back to the open source community via contributions to upstream =
projects, and we believe becoming a Xen Project member will help in our =
ability to do so. To further our dedication to open source, Vates SAS, =
the company with the most active contributions to XCP-ng currently, is =
in the process of becoming a Linux Foundation member.
>=20
> ## How we differ from existing platforms
>=20
> Our vision is to maintain XCP-ng as a complete easy-to-use hypervisor =
solution similar to existing full-stack solutions. Where we differ is =
our dedication to the open source mindset. We have no licensing system =
or license restrictions, all pieces of the platform are free to use. =
Simultaneously, we encourage community involvement and have merged many =
community contributions already.
>=20
> ## Infrastructure
>=20
> The infrastructure will be primarily managed by Vates, with multiple =
companies in partnership (mainly hosting companies owning DC real =
estate). Access and resources can be given for people interested in =
becoming maintainers.
>=20
> We would also like to expand the very active XCP-ng forum to also =
cover Xen and XAPI, providing a modern user friendly interface for users =
to discuss the hypervisor and related parts with dedicated sections. =
This will help to centralize much Xen & XAPI discussion in a place that =
is easier for casual users to find than a mailing list.
>=20
> ## Security
>=20
> XCP-ng has a dedicated email for security feedback =
(security@xcp-ng.org <mailto:security@xcp-ng.org>) and is already a =
member of the Xen pre-disclosure mailing list.
>=20
> ## License
>=20
> XCP-ng can be considered as a specialized Linux distribution, so there =
are multiple packages inside it. However, most of its packages are =
licensed in GPLv2.
>=20
> ## Contributors / Roles
>=20
> Project lead: Olivier Lambert (Vates SAS)
>=20
> * Github org: https://github.com/xcp-ng/ <https://github.com/xcp-ng/>
> * Main website: https://xcp-ng.org <https://xcp-ng.org/>
>=20
> Extra notes:
>=20
> * we already contributed to Xen hypervisor (see =
https://lists.xenproject.org/archives/html/xen-devel/2019-02/msg01602.html=
 =
<https://lists.xenproject.org/archives/html/xen-devel/2019-02/msg01602.htm=
l> ) and we plan to do more in the future
> * we already contributed to XAPI (see =
https://github.com/xapi-project/xen-api-libs-transitional/commit/3f881066a=
1bdd4b52275e49edb57fba0d47c2dc9 =
<https://github.com/xapi-project/xen-api-libs-transitional/commit/3f881066=
a1bdd4b52275e49edb57fba0d47c2dc9> )
> * we added new features (ZoL support, zstd compression=E2=80=A6)
> * we contributed to various other projects (eg: ZFS on Linux =
https://github.com/zfsonlinux/zfs/pull/8866 =
<https://github.com/zfsonlinux/zfs/pull/8866>)=20
> * we are committed to invest money and time in R&D for XCP-ng (see =
https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/ =
<https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/> )
> * our dev process is fully documented and open: =
https://github.com/xcp-ng/xcp/wiki/Development-process-tour =
<https://github.com/xcp-ng/xcp/wiki/Development-process-tour>
> * we have dev diaries explaining to everyone what we are working on, =
in details: =
https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storage-perf-s=
mapiv3 =
<https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storage-perf-=
smapiv3>_______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel


--Apple-Mail=_B3286564-8478-48A8-9E54-E2D319E3928B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
everyone,<div class=3D""><br class=3D""></div><div class=3D"">adding =
committers, who would need to vote for or against the proposal. The =
title probably does not need an RFC, which is why no-one looked at it so =
far</div><div class=3D""><br class=3D""></div><div class=3D"">I think =
this is a great idea and I would want to welcome XCP-ng into the =
project: with this in mind, I vote +1</div><div class=3D""><br =
class=3D""></div><div class=3D"">Lars</div><div class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 22 Jul 2019, at 17:25, Olivier Lambert &lt;<a =
href=3D"mailto:lambert.olivier@gmail.com" =
class=3D"">lambert.olivier@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"">Hello everyone,</div><div class=3D""></div><div=
 class=3D""><div class=3D"">
<br class=3D"webkit-block-placeholder"></div><p class=3D"">Following up =
on discussions that we had at the last Xen summit, we=E2=80=99re =
submitting a Xen subproject proposal, regarding XCP-ng project (<a =
href=3D"https://xcp-ng.org/" class=3D"">https://xcp-ng.org</a>). Feel =
free to give your feedback! </p><p class=3D"">Regards,

</p><p class=3D"">Olivier Lambert and XCP-ng team</p><div class=3D""><br =
class=3D"webkit-block-placeholder"></div><p class=3D""># XCP-ng =
proposal<br class=3D""><br class=3D"">## The Project<br class=3D""><br =
class=3D"">XCP-ng is a turn-key virtualization platform based on the Xen =
Hypervisor, using existing Xen Project tools (XAPI). It's built from =
Xenserver source, improved and maintained by both passionate individuals =
and companies. The result is a completely free and Open Source solution =
available for everyone.<br class=3D""><br class=3D"">Thanks to a very =
successful Kickstarter campaign as well as backing from various =
companies, the project doesn't require any further funds and isn't =
seeking monetary contributions.<br class=3D""><br class=3D"">We believe =
forming a Xen sub-project within the Linux Foundation has the potential =
to bring further companies and contributors into the Xen Project as a =
whole, as well as demonstrate our dedication to open source. XCP-ng has =
already displayed its ability to draw new users into the Xen =
virtualization ecosystem. For new users, utilizing Xen from scratch can =
be daunting. XCP-ng offers a way to solve this problem by drawing =
end-users more closely into the Xen Project and providing an easy route =
for prospective Xen users to get started with Xen. This is an area where =
Xen has been trailing KVM for a long time. Hosting XCP-ng within the Xen =
Project provides a route to level the playing field. It would also =
enable the Xen Project to leverage XCP-ng success stories for the =
benefit of the Xen Project as a whole.<br class=3D""><br class=3D"">## =
The Mission<br class=3D""><br class=3D"">Our goal is to continue =
development of XCP-ng while building a large community of contributors =
to XCP-ng. We also expect an increase of contributions to XAPI as well =
as the Xen Project. Through large community involvement and =
contributions we have already turned XCP-ng into a stable hypervisor =
platform that is used in small and large enterprise deployments.<br =
class=3D""><br class=3D"">## Upstream first, fully Open Source<br =
class=3D""><br class=3D"">Vates and XCP-ng have started to work with a =
number of academic organizations with the aim to fund and develop =
feature improvements and new features that benefit the whole Xen Project =
ecosystem (including the Hypervisor and XAPI). We follow an upstream =
first philosophy, which is possible because of the fast release cycle of =
XCP-ng and expect to become a long-term contributor to XAPI and the =
Hypervisor project.<br class=3D""><br class=3D"">Besides contributions, =
we believe that an XCP-ng which is part of the Xen Project will deliver =
other benefits:<br class=3D""><br class=3D"">* Bring passionate and =
verbal XCP-ng users closer to the Xen Project<br class=3D"">* Bring more =
publicity to the Xen Project: currently we have the XCP-ng blog, =
newsletter and success stories, which we are willing to share with the =
Xen Project<br class=3D""><br class=3D"">With an incredibly active =
forum, IRC, and github, we are always looking for more contributors to =
the project. We also believe in giving back to the open source community =
via contributions to upstream projects, and we believe becoming a Xen =
Project member will help in our ability to do so. To further our =
dedication to open source, Vates SAS, the company with the most active =
contributions to XCP-ng currently, is in the process of becoming a Linux =
Foundation member.<br class=3D""><br class=3D"">## How we differ from =
existing platforms<br class=3D""><br class=3D"">Our vision is to =
maintain XCP-ng as a complete easy-to-use hypervisor solution similar to =
existing full-stack solutions. Where we differ is our dedication to the =
open source mindset. We have no licensing system or license =
restrictions, all pieces of the platform are free to use. =
Simultaneously, we encourage community involvement and have merged many =
community contributions already.<br class=3D""><br class=3D"">## =
Infrastructure<br class=3D""><br class=3D"">The infrastructure will be =
primarily managed by Vates, with multiple companies in partnership =
(mainly hosting companies owning DC real estate). Access and resources =
can be given for people interested in becoming maintainers.<br =
class=3D""><br class=3D"">We would also like to expand the very active =
XCP-ng forum to also cover Xen and XAPI, providing a modern user =
friendly interface for users to discuss the hypervisor and related parts =
with dedicated sections. This will help to centralize much Xen &amp; =
XAPI discussion in a place that is easier for casual users to find than =
a mailing list.<br class=3D""><br class=3D"">## Security<br class=3D""><br=
 class=3D"">XCP-ng has a dedicated email for security feedback (<a =
href=3D"mailto:security@xcp-ng.org" class=3D"">security@xcp-ng.org</a>) =
and is already a member of the Xen pre-disclosure mailing list.<br =
class=3D""><br class=3D"">## License<br class=3D""><br class=3D"">XCP-ng =
can be considered as a specialized Linux distribution, so there are =
multiple packages inside it. However, most of its packages are licensed =
in GPLv2.</p><p class=3D"">## Contributors / Roles<br class=3D""><br =
class=3D"">Project lead: Olivier Lambert (Vates SAS)<br class=3D""><br =
class=3D"">* Github org: <a href=3D"https://github.com/xcp-ng/" =
class=3D"">https://github.com/xcp-ng/</a><br class=3D"">* Main website: =
<a href=3D"https://xcp-ng.org/" class=3D"">https://xcp-ng.org</a><br =
class=3D""><br class=3D"">Extra notes:<br class=3D""><br class=3D"">* we =
already contributed to Xen hypervisor (see <a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2019-02/msg01=
602.html" =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2019-02/ms=
g01602.html</a> ) and we plan to do more in the future<br class=3D"">* =
we already contributed to XAPI (see <a =
href=3D"https://github.com/xapi-project/xen-api-libs-transitional/commit/3=
f881066a1bdd4b52275e49edb57fba0d47c2dc9" =
class=3D"">https://github.com/xapi-project/xen-api-libs-transitional/commi=
t/3f881066a1bdd4b52275e49edb57fba0d47c2dc9</a> )<br class=3D"">* we =
added new features (ZoL support, zstd compression=E2=80=A6)<br =
class=3D"">* we contributed to various other projects (eg: ZFS on Linux =
<a href=3D"https://github.com/zfsonlinux/zfs/pull/8866" =
class=3D"">https://github.com/zfsonlinux/zfs/pull/8866</a>) <br =
class=3D"">* we are committed to invest money and time in R&amp;D for =
XCP-ng (see <a =
href=3D"https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/" =
class=3D"">https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/<=
/a> )<br class=3D"">* our dev process is fully documented and open: <a =
href=3D"https://github.com/xcp-ng/xcp/wiki/Development-process-tour" =
class=3D"">https://github.com/xcp-ng/xcp/wiki/Development-process-tour</a>=
<br class=3D"">* we have dev diaries explaining to everyone what we are =
working on, in details: <a =
href=3D"https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storag=
e-perf-smapiv3" =
class=3D"">https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-sto=
rage-perf-smapiv3</a></p></div></div>
_______________________________________________<br class=3D"">Xen-devel =
mailing list<br class=3D""><a =
href=3D"mailto:Xen-devel@lists.xenproject.org" =
class=3D"">Xen-devel@lists.xenproject.org</a><br =
class=3D"">https://lists.xenproject.org/mailman/listinfo/xen-devel</div></=
blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_B3286564-8478-48A8-9E54-E2D319E3928B--


--===============7876444526571312366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7876444526571312366==--

