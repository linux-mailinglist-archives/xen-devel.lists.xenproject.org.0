Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B09B3CA2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:34:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9s2c-0000Dk-Sb; Mon, 16 Sep 2019 14:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QjEQ=XL=andrew.cmu.edu=jtuminar@srs-us1.protection.inumbo.net>)
 id 1i9s2c-0000DV-1u
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 14:31:46 +0000
X-Inumbo-ID: b50b69f6-d88e-11e9-a337-bc764e2007e4
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b50b69f6-d88e-11e9-a337-bc764e2007e4;
 Mon, 16 Sep 2019 14:31:44 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id r26so78992074ioh.8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 07:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andrew-cmu-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FobK5KGlVjc+BR1BXawG7XPeR5xCJIxZvr8cwpmpXgY=;
 b=zjuppSDPhp2h7Wqe1KfzLrVsTTdWMfukleEBReQ+ftcdhHfJD1l+LI9fHA31i63umS
 0Q1CRahktaMUf6ykJIndnGIQksZty4mLn6DACixNswNZ14deYOosHXFra3x4a/ZxzCON
 DXO0OGPRjsY4cxdnbqSX0RVQX6sWZAof2g1kPHjXlYtzVn2Go5Yq83e9RQy8QXLWhnUl
 SOitrK9kv9D9c+eajOxyySgq9UhvwiSEANeI9vYEML9n4NW6h1OTyyHWBquUOh9PgU9y
 zoPOHoRpBB8n3QPmzUtHssy89GBKCLRPWWsEMkt9gobrhwuCSzbOWkoW/j1eLTiJ6VTG
 Vx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FobK5KGlVjc+BR1BXawG7XPeR5xCJIxZvr8cwpmpXgY=;
 b=GS8Jp+opult9C15K7vaHdTIybXguL/QjSsn+RArQRbLDqLnqUYCHYrZmBpcGXkKyMw
 vhRu1G23aJRYG6/SL5C610otDUMHt1Fi43C+Z52NasxGhjBsr7geHa6DoIspdMH6wEGT
 wiNe9cdjZnjfwcA0kFEATQyzOK7U+oxFPWbIbQvGQ6/4sPJBOqF5IpJVUgeHw7IEND2a
 YhGDpZDb2wV2XNcUgKWlmFK1kPUL9mrb+GVuTIw5p9rM516Tne6eBkowPwfX3omZfjs5
 CTrTHwhIv8wraq4ctELHvGEpa1gTVo20axUzKAGtTQCI+RtLGahiU3AX588HnNPxXEzs
 AUOg==
X-Gm-Message-State: APjAAAUpfYTCEfz1H2qTkpP6I1w9QxHEKJe7bUr+PYAM0W4AeC9MKkY2
 0OfM8zxMBIcdIbMVrt5MvKvjPIX7a6TFx3G6OTD8/w==
X-Google-Smtp-Source: APXvYqy4sGHSoVagi1Hr48oSFbYJjdmiBCOqwONxIR4hdvNPZgDkVAfhmVOyLQuvBfmQMaIijKyJnrcXNv1ecXu6HQE=
X-Received: by 2002:a6b:c903:: with SMTP id z3mr232828iof.204.1568644304162;
 Mon, 16 Sep 2019 07:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAKan5DCdRvofdAWaL3js9wmWBsiKWt9DAyguOpy0qv=33tdUwQ@mail.gmail.com>
 <6b9d7429-7dc5-476d-afda-bb3f196c804f@arm.com>
 <20190916103858.kovwuktf7ce52vw7@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <CACCGGhCPUpqtf0CjmpJBBebymMFrjKhKyX3o5NZ3pP5C7qQ2Pg@mail.gmail.com>
In-Reply-To: <CACCGGhCPUpqtf0CjmpJBBebymMFrjKhKyX3o5NZ3pP5C7qQ2Pg@mail.gmail.com>
From: Julian Tuminaro <jtuminar@andrew.cmu.edu>
Date: Mon, 16 Sep 2019 08:31:33 -0600
Message-ID: <CAKan5DBFUbFGkPzmFMg4bqzMbrVEh2MzCMXCrL5p0TBmGXe3RQ@mail.gmail.com>
To: Paul Durrant <pdurrant@gmail.com>
Subject: Re: [Xen-devel] Looking for Semester long Project
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============6514427412084514375=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6514427412084514375==
Content-Type: multipart/alternative; boundary="00000000000087624b0592ac769d"

--00000000000087624b0592ac769d
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

Thanks for getting back to us in regards to the KDD project. I am trying to
understand the current status of the project. Could you provide a bit more
information on the current status and what would need to be done.

Julian

On Mon, Sep 16, 2019 at 5:53 AM Paul Durrant <pdurrant@gmail.com> wrote:

> I think KDD is still a worthy thing to do, particularly in light of
> https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg01723.html
> (which is about the most recent ref I could find, and I don't know
> what happened to the code after that). AFAIK, the biggest challenge is
> getting round Windows' KASLR; it may be necessary to have some sort of
> driver in the guest to get the necessary info. out but that shouldn't
> be too hard to implement.
>
>   Cheers,
>
>     Paul
>
> On Mon, 16 Sep 2019 at 11:39, Wei Liu <wl@xen.org> wrote:
> >
> > Hi Julian
> >
> > For the KDD related project I have CC'ed Paul.
> >
> > I have gathered some ideas for cleaning up hypervisor code but they are
> > of lower difficulty compared to other projects. They are definitively
> > not as fun as the others. ;-)
> >
> > Wei.
> >
> > On Mon, Sep 09, 2019 at 08:58:51AM +0100, Julien Grall wrote:
> > > +Andrew, Lars, Stefano and Wei
> > >
> > > On 9/5/19 11:23 PM, Julian Tuminaro wrote:
> > > > Hi,
> > >
> > > Hello,
> > >
> > > Thank you for you interest on Xen. I have CCed few more person that
> should
> > > be able to answer your questions below.
> > >
> > > >
> > > > We (a group of 2 students) are interested in doing a hypervisor
> related
> > > > project for the next 10-12 weeks as part of one of our courses this
> > > > semester. We have taken a look at this year's GSoC project list
> > > > (https://wiki.xenproject.org/wiki/Outreach_Program_Projects). We
> were
> > > > interested in learning more about the "KDD (Windows Debugger Stub)
> > > > enhancements" project and Xen on ARM based projects. Yet, on irc we
> were
> > > > told that this list is outdated. If there are any other project
> > > > suggestions or list, we would be interesting in learning more about
> > > > them.
> > > The list of projects for Xen on Arm is mostly update-to-date. The only
> > > project where some progress has been made so far is "Xen on ARM:
> dynamic
> > > virtual memory layout".
> > >
> > > I would be happy to go in more details for any those projects if you
> are
> > > interested.
> > >
> > > >
> > > > Andrew Cooper suggested on irc the following project: Context
> Switching
> > > > with CR0.TS in HVM Guest. We would like to possible know more about
> this
> > > > project in terms of difficulty, potential estimate on time required.
> > > > Andrew also mentioned a slighter bigger xen/linux project and we
> would
> > > > like to know more detail about this one as well.
> > >
> > > Cheers,
> > >
> > > --
> > > Julien Grall
>

--00000000000087624b0592ac769d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<br><br>Thanks for getting back to us in regards t=
o the KDD project. I am trying to understand the current status of the proj=
ect. Could you provide a bit more information on the current status and wha=
t would need to be done.<br><div><br></div><div>Julian</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 16,=
 2019 at 5:53 AM Paul Durrant &lt;<a href=3D"mailto:pdurrant@gmail.com">pdu=
rrant@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">I think KDD is still a worthy thing to do, particularly in l=
ight of<br>
<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg01723.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive/htm=
l/qemu-devel/2017-12/msg01723.html</a><br>
(which is about the most recent ref I could find, and I don&#39;t know<br>
what happened to the code after that). AFAIK, the biggest challenge is<br>
getting round Windows&#39; KASLR; it may be necessary to have some sort of<=
br>
driver in the guest to get the necessary info. out but that shouldn&#39;t<b=
r>
be too hard to implement.<br>
<br>
=C2=A0 Cheers,<br>
<br>
=C2=A0 =C2=A0 Paul<br>
<br>
On Mon, 16 Sep 2019 at 11:39, Wei Liu &lt;<a href=3D"mailto:wl@xen.org" tar=
get=3D"_blank">wl@xen.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Julian<br>
&gt;<br>
&gt; For the KDD related project I have CC&#39;ed Paul.<br>
&gt;<br>
&gt; I have gathered some ideas for cleaning up hypervisor code but they ar=
e<br>
&gt; of lower difficulty compared to other projects. They are definitively<=
br>
&gt; not as fun as the others. ;-)<br>
&gt;<br>
&gt; Wei.<br>
&gt;<br>
&gt; On Mon, Sep 09, 2019 at 08:58:51AM +0100, Julien Grall wrote:<br>
&gt; &gt; +Andrew, Lars, Stefano and Wei<br>
&gt; &gt;<br>
&gt; &gt; On 9/5/19 11:23 PM, Julian Tuminaro wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; Thank you for you interest on Xen. I have CCed few more person th=
at should<br>
&gt; &gt; be able to answer your questions below.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We (a group of 2 students) are interested in doing a hypervi=
sor related<br>
&gt; &gt; &gt; project for the next 10-12 weeks as part of one of our cours=
es this<br>
&gt; &gt; &gt; semester. We have taken a look at this year&#39;s GSoC proje=
ct list<br>
&gt; &gt; &gt; (<a href=3D"https://wiki.xenproject.org/wiki/Outreach_Progra=
m_Projects" rel=3D"noreferrer" target=3D"_blank">https://wiki.xenproject.or=
g/wiki/Outreach_Program_Projects</a>). We were<br>
&gt; &gt; &gt; interested in learning more about the &quot;KDD (Windows Deb=
ugger Stub)<br>
&gt; &gt; &gt; enhancements&quot; project and Xen on ARM based projects. Ye=
t, on irc we were<br>
&gt; &gt; &gt; told that this list is outdated. If there are any other proj=
ect<br>
&gt; &gt; &gt; suggestions or list, we would be interesting in learning mor=
e about<br>
&gt; &gt; &gt; them.<br>
&gt; &gt; The list of projects for Xen on Arm is mostly update-to-date. The=
 only<br>
&gt; &gt; project where some progress has been made so far is &quot;Xen on =
ARM: dynamic<br>
&gt; &gt; virtual memory layout&quot;.<br>
&gt; &gt;<br>
&gt; &gt; I would be happy to go in more details for any those projects if =
you are<br>
&gt; &gt; interested.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Andrew Cooper suggested on irc the following project: Contex=
t Switching<br>
&gt; &gt; &gt; with CR0.TS in HVM Guest. We would like to possible know mor=
e about this<br>
&gt; &gt; &gt; project in terms of difficulty, potential estimate on time r=
equired.<br>
&gt; &gt; &gt; Andrew also mentioned a slighter bigger xen/linux project an=
d we would<br>
&gt; &gt; &gt; like to know more detail about this one as well.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Julien Grall<br>
</blockquote></div>

--00000000000087624b0592ac769d--


--===============6514427412084514375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6514427412084514375==--

