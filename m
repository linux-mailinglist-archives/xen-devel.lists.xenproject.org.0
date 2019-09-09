Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB23ADB73
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:48:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Kud-0003Kw-6R; Mon, 09 Sep 2019 14:45:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mKdS=XE=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1i7Kub-0003KP-9B
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:45:01 +0000
X-Inumbo-ID: 64971a2a-d310-11e9-978d-bc764e2007e4
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64971a2a-d310-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 14:44:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u16so14196465wrr.0;
 Mon, 09 Sep 2019 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:references:to:date;
 bh=RFtcU1EjrmpgZWWfoqNkMArXKpMiK3aA6DztpD166RY=;
 b=hESiRIqkXPP83kRqarABq+wU2k4I+Ao6Jo3vl/bkfYAZc12aWAQCx2LFvt3TFWJP3r
 StRIDFdK4VJ6YEcSIW+3GJ87czauYm2DrTypt1lcWCP3hG+XFuvbkbtAaFxj7fI8P9ED
 V80hib2fGmmfN8R1My9Bvjb9Wk/wb0L1vKsgSq02etplWfgoJbe0p+jS92SeiFowY+rZ
 oBscBFMlsCkAqqH3zF5uvFySxaNjFLbLh8nMdPoLYGDC/S10oLHc9pEMGJ/cma+Nob1b
 DpIqpfxf6WOQ5zd/TSSIO5iZATD6Vwyp2xexAfgLDePQcU3uy4Ia7DTbHRccvC/xSxrF
 0TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:references
 :to:date;
 bh=RFtcU1EjrmpgZWWfoqNkMArXKpMiK3aA6DztpD166RY=;
 b=aZqQiSuQ9ghYhjKRdgrqvg5TSJnZL8bm/Sv086bN+FgGq79RlqHf2tM2DfwAZNLtB/
 M6v9x7cEj25umGdAA4l2Jp7B/3tASYEuIEaxv1Y4FYEwFqa0a/tDUqqKVPDrKpWincVA
 Vye3MWInzfIwcyeKYMyfbhyqc1uclPyFPDUTsrFUNRfeq7zABcxf+800iJIPn7szwo82
 dlZqOmuymhwX0Ek2qmhncvtQbfqbNjQzP2mRLjB4uOHoy4PMGPAVBiZ+FOaTNZR28qlr
 TFJXK9xvV9JAqPnJLFxJSCpcrcF91oHH5/Lz2hOzizoDctdgHHwrX7m5dGIF5f+iBJJs
 gfWg==
X-Gm-Message-State: APjAAAV95yWIY5GRNiyArCM1DY0euitJEv/LgpLEYLsbZXfBT6cXJ5Kv
 HWiJ/rPFsSe8ZjMwJutXbgca3G1+
X-Google-Smtp-Source: APXvYqw1O+IlXehtEb1RcYQOLJf42Yzd4+QuRPqQ87/HUsZ7KE+eVZxrj8eyP5jyoxFzblGUmaeZJQ==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr18766926wro.127.1568040295969; 
 Mon, 09 Sep 2019 07:44:55 -0700 (PDT)
Received: from [192.168.0.8] ([176.254.40.75])
 by smtp.gmail.com with ESMTPSA id r20sm19886489wrg.61.2019.09.09.07.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 07:44:54 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <E8A267E0-2E8F-4C2A-A280-99E8C7684721@xenproject.org>
References: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-api@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Date: Mon, 9 Sep 2019 15:44:53 +0100
X-Mailer: Apple Mail (2.3445.104.11)
Subject: [Xen-devel] [Vote] XCP-ng subproject proposal
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
Content-Type: multipart/mixed; boundary="===============0750706740330512226=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0750706740330512226==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3633F1BD-CF87-4C90-8856-E9FA0648B597"


--Apple-Mail=_3633F1BD-CF87-4C90-8856-E9FA0648B597
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello everyone,

Olivier had posted an RFC for this proposal on xen-devel@- see =
https://xen.markmail.org/thread/ermnrb3ps3okvnjr =
<https://xen.markmail.org/thread/ermnrb3ps3okvnjr>=20

The proposal also has been discussed by the Advisory Board and was =
approved

However, for the proposal to fully pass the proposal must be run by past =
all mature subproject, which are Hypervisors, Windows PV Drivers and =
XAPI (see =
https://xenproject.org/developers/governance/#project-decisions =
<https://xenproject.org/developers/governance/#project-decisions>). =
People listed under Project team visible on the right columns of =
following pages can vote
* https://xenproject.org/developers/teams/xen-hypervisor/ =
<https://xenproject.org/developers/teams/xen-hypervisor/> - already =
voted: Jan, Ian, Wei, George
* https://xenproject.org/developers/teams/windows-pv-drivers/ =
<https://xenproject.org/developers/teams/windows-pv-drivers/>
* https://xenproject.org/developers/teams/xen-api/ =
<https://xenproject.org/developers/teams/xen-api/>

The RFC proposal has passed the Hypervisor team with 4/8 votes (see =
https://xen.markmail.org/thread/ermnrb3ps3okvnjr =
<https://xen.markmail.org/thread/ermnrb3ps3okvnjr>), but more support =
would be appreciated

The proposal is attached below. Please vote before next Tuesday

Best Regards
Lars

# XCP-ng proposal

## The Project

XCP-ng is a turn-key virtualization platform based on the Xen =
Hypervisor, using existing Xen Project tools (XAPI). It's built from =
Xenserver source, improved and maintained by both passionate individuals =
and companies. The result is a completely free and Open Source solution =
available for everyone.

Thanks to a very successful Kickstarter campaign as well as backing from =
various companies, the project doesn't require any further funds and =
isn't seeking monetary contributions.

We believe forming a Xen sub-project within the Linux Foundation has the =
potential to bring further companies and contributors into the Xen =
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

## The Mission

Our goal is to continue development of XCP-ng while building a large =
community of contributors to XCP-ng. We also expect an increase of =
contributions to XAPI as well as the Xen Project. Through large =
community involvement and contributions we have already turned XCP-ng =
into a stable hypervisor platform that is used in small and large =
enterprise deployments.

## Upstream first, fully Open Source

Vates and XCP-ng have started to work with a number of academic =
organizations with the aim to fund and develop feature improvements and =
new features that benefit the whole Xen Project ecosystem (including the =
Hypervisor and XAPI). We follow an upstream first philosophy, which is =
possible because of the fast release cycle of XCP-ng and expect to =
become a long-term contributor to XAPI and the Hypervisor project.

Besides contributions, we believe that an XCP-ng which is part of the =
Xen Project will deliver other benefits:

* Bring passionate and verbal XCP-ng users closer to the Xen Project
* Bring more publicity to the Xen Project: currently we have the XCP-ng =
blog, newsletter and success stories, which we are willing to share with =
the Xen Project

With an incredibly active forum, IRC, and github, we are always looking =
for more contributors to the project. We also believe in giving back to =
the open source community via contributions to upstream projects, and we =
believe becoming a Xen Project member will help in our ability to do so. =
To further our dedication to open source, Vates SAS, the company with =
the most active contributions to XCP-ng currently, is in the process of =
becoming a Linux Foundation member.

## How we differ from existing platforms

Our vision is to maintain XCP-ng as a complete easy-to-use hypervisor =
solution similar to existing full-stack solutions. Where we differ is =
our dedication to the open source mindset. We have no licensing system =
or license restrictions, all pieces of the platform are free to use. =
Simultaneously, we encourage community involvement and have merged many =
community contributions already.

## Infrastructure

The infrastructure will be primarily managed by Vates, with multiple =
companies in partnership (mainly hosting companies owning DC real =
estate). Access and resources can be given for people interested in =
becoming maintainers.

We would also like to expand the very active XCP-ng forum to also cover =
Xen and XAPI, providing a modern user friendly interface for users to =
discuss the hypervisor and related parts with dedicated sections. This =
will help to centralize much Xen & XAPI discussion in a place that is =
easier for casual users to find than a mailing list.

## Security

XCP-ng has a dedicated email for security feedback (security@xcp-ng.org =
<mailto:security@xcp-ng.org>) and is already a member of the Xen =
pre-disclosure mailing list.

## License

XCP-ng can be considered as a specialized Linux distribution, so there =
are multiple packages inside it. However, most of its packages are =
licensed in GPLv2.

## Contributors / Roles

Project lead: Olivier Lambert (Vates SAS)

* Github org: https://github.com/xcp-ng/ <https://github.com/xcp-ng/>
* Main website: https://xcp-ng.org <https://xcp-ng.org/>

Extra notes:

* we already contributed to Xen hypervisor (see =
https://lists.xenproject.org/archives/html/xen-devel/2019-02/msg01602.html=
 =
<https://lists.xenproject.org/archives/html/xen-devel/2019-02/msg01602.htm=
l> ) and we plan to do more in the future
* we already contributed to XAPI (see =
https://github.com/xapi-project/xen-api-libs-transitional/commit/3f881066a=
1bdd4b52275e49edb57fba0d47c2dc9 =
<https://github.com/xapi-project/xen-api-libs-transitional/commit/3f881066=
a1bdd4b52275e49edb57fba0d47c2dc9> )
* we added new features (ZoL support, zstd compression=E2=80=A6)
* we contributed to various other projects (eg: ZFS on Linux =
https://github.com/zfsonlinux/zfs/pull/8866 =
<https://github.com/zfsonlinux/zfs/pull/8866>)=20
* we are committed to invest money and time in R&D for XCP-ng (see =
https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/ =
<https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/> )
* our dev process is fully documented and open: =
https://github.com/xcp-ng/xcp/wiki/Development-process-tour =
<https://github.com/xcp-ng/xcp/wiki/Development-process-tour>
* we have dev diaries explaining to everyone what we are working on, in =
details: =
https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storage-perf-s=
mapiv3 =
<https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storage-perf-=
smapiv3>


--Apple-Mail=_3633F1BD-CF87-4C90-8856-E9FA0648B597
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"">Hello everyone,</div><div =
class=3D""></div><div class=3D""><div class=3D""><br =
class=3D"webkit-block-placeholder"></div><div class=3D"">Olivier had =
posted an RFC for this proposal on xen-devel@- see&nbsp;<a =
href=3D"https://xen.markmail.org/thread/ermnrb3ps3okvnjr" =
class=3D"">https://xen.markmail.org/thread/ermnrb3ps3okvnjr</a>&nbsp;</div=
><div class=3D""><br class=3D""></div><div class=3D"">The proposal also =
has been discussed by the Advisory Board and was approved</div><div =
class=3D""><br class=3D""></div><div class=3D"">However, for the =
proposal to fully pass the proposal must be run by past all mature =
subproject, which are Hypervisors, Windows PV Drivers and XAPI =
(see&nbsp;<a =
href=3D"https://xenproject.org/developers/governance/#project-decisions" =
class=3D"">https://xenproject.org/developers/governance/#project-decisions=
</a>). People listed under Project team visible on the right columns of =
following pages can vote</div><div class=3D"">*&nbsp;<a =
href=3D"https://xenproject.org/developers/teams/xen-hypervisor/" =
class=3D"">https://xenproject.org/developers/teams/xen-hypervisor/</a>&nbs=
p;- already voted: Jan, Ian, Wei, George</div><div class=3D"">*&nbsp;<a =
href=3D"https://xenproject.org/developers/teams/windows-pv-drivers/" =
class=3D"">https://xenproject.org/developers/teams/windows-pv-drivers/</a>=
</div><div class=3D"">*&nbsp;<a =
href=3D"https://xenproject.org/developers/teams/xen-api/" =
class=3D"">https://xenproject.org/developers/teams/xen-api/</a></div><div =
class=3D""><br class=3D""></div><div class=3D"">The RFC proposal has =
passed the Hypervisor team with&nbsp;4/8 votes (see&nbsp;<a =
href=3D"https://xen.markmail.org/thread/ermnrb3ps3okvnjr" =
class=3D"">https://xen.markmail.org/thread/ermnrb3ps3okvnjr</a>), but =
more support would be appreciated</div><div class=3D""><br =
class=3D""></div><div class=3D"">The proposal is attached below. Please =
vote before next Tuesday</div><div class=3D""><br class=3D""></div><div =
class=3D"">Best Regards</div><div class=3D"">Lars</div><div class=3D""><br=
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
class=3D"">* Github org:&nbsp;<a href=3D"https://github.com/xcp-ng/" =
class=3D"">https://github.com/xcp-ng/</a><br class=3D"">* Main =
website:&nbsp;<a href=3D"https://xcp-ng.org" =
class=3D"">https://xcp-ng.org</a><br class=3D""><br class=3D"">Extra =
notes:<br class=3D""><br class=3D"">* we already contributed to Xen =
hypervisor (see&nbsp;<a =
href=3D"https://lists.xenproject.org/archives/html/xen-devel/2019-02/msg01=
602.html" =
class=3D"">https://lists.xenproject.org/archives/html/xen-devel/2019-02/ms=
g01602.html</a>&nbsp;) and we plan to do more in the future<br =
class=3D"">* we already contributed to XAPI (see&nbsp;<a =
href=3D"https://github.com/xapi-project/xen-api-libs-transitional/commit/3=
f881066a1bdd4b52275e49edb57fba0d47c2dc9" =
class=3D"">https://github.com/xapi-project/xen-api-libs-transitional/commi=
t/3f881066a1bdd4b52275e49edb57fba0d47c2dc9</a>&nbsp;)<br class=3D"">* we =
added new features (ZoL support, zstd compression=E2=80=A6)<br =
class=3D"">* we contributed to various other projects (eg: ZFS on =
Linux&nbsp;<a href=3D"https://github.com/zfsonlinux/zfs/pull/8866" =
class=3D"">https://github.com/zfsonlinux/zfs/pull/8866</a>)&nbsp;<br =
class=3D"">* we are committed to invest money and time in R&amp;D for =
XCP-ng (see&nbsp;<a =
href=3D"https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/" =
class=3D"">https://xcp-ng.org/blog/2018/12/19/xcp-ng-research-initiative/<=
/a>&nbsp;)<br class=3D"">* our dev process is fully documented and =
open:&nbsp;<a =
href=3D"https://github.com/xcp-ng/xcp/wiki/Development-process-tour" =
class=3D"">https://github.com/xcp-ng/xcp/wiki/Development-process-tour</a>=
<br class=3D"">* we have dev diaries explaining to everyone what we are =
working on, in details:&nbsp;<a =
href=3D"https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-storag=
e-perf-smapiv3" =
class=3D"">https://xcp-ng.org/forum/topic/1036/dev-diaries-1-analyzing-sto=
rage-perf-smapiv3</a></p></div><div class=3D""><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_3633F1BD-CF87-4C90-8856-E9FA0648B597--


--===============0750706740330512226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0750706740330512226==--

