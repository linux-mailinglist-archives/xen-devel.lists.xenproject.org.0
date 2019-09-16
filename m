Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E8AB3F60
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 19:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9uI5-0002iA-Mt; Mon, 16 Sep 2019 16:55:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QjEQ=XL=andrew.cmu.edu=jtuminar@srs-us1.protection.inumbo.net>)
 id 1i9uI4-0002i1-2J
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 16:55:52 +0000
X-Inumbo-ID: d65dd166-d8a2-11e9-a337-bc764e2007e4
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d65dd166-d8a2-11e9-a337-bc764e2007e4;
 Mon, 16 Sep 2019 16:55:50 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h144so658959iof.7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andrew-cmu-edu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5A7q3R8JLEvOSDo6cXxsVC1FUaj88HzZPvquFVRNhX0=;
 b=orv5Jaxba1JD10zMZ5eHx+9Xw+/1I0ntW/uSkAdAU//W8GRgkOB37+B37uK7si+GC6
 OmsZL3Q6uJ0d2Row3oHB/YlyBQcebTOb+9kkEsECubWFJMDEfnUhGhrs9z2+pIwOxJFw
 G6lslXLXom97jK+lOkVH77KSfJJY5RpbidsnZ7XTZ1hkMql3Dspcum8TOpUTRIJKl9WR
 4kTXZE8bE7XDDb/k0CuBk3sYNRlWm+AaD6c3Sm8GExeKjGoGrHe0miXeU2SAqMiHI9oo
 aGwQkfz27eo4ahCyPd+2c8xMFJSVf8JA/AkN3aiL7geT81cLGcaAO8ttjBaK8H9eaqJZ
 5QUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5A7q3R8JLEvOSDo6cXxsVC1FUaj88HzZPvquFVRNhX0=;
 b=NOTRR0VzYlBicW95EHhGSel3EyfoVQpdk7tKRB7C+TcOjog/l3g5mLaNwhLuIP8DyN
 BrQYg3s2bXihk/wCVo7y1U8cUkf/P9dZRzN60L93sQ7tnfcBGF6A3s0GcX+IVYWXHdh7
 yI1tRv25DuQihvkZk7PNAnRUHlfbzkVHdIkN5kNnU7im1gFJX8M7OMXYOVa9/x3x/Xak
 dJFImkVM3hdHjck0aLjhLfSM+5ZJcEGS83Krgx4UglW6ttnLyv6uLpq+HXKl5UZ3LMwT
 1lsIoZd/ds7s8NvmjvVnGtPkVowy3r1QnHRNUDPM0eexO3yAEN7KLCmSJ0pJJvZeRDhW
 MzEA==
X-Gm-Message-State: APjAAAUqSNypgt4xqfWpMxd3UM3WkqlNkT4/S1RBrJlZPxXVQocF0hTC
 CYODZl5Uye3owXulYRUv74ulXaSYzxO2niBNAwL8xw==
X-Google-Smtp-Source: APXvYqzcFZOwdmx+Q6cGEP0U0GUuvIOZSiqqW/cV959gR+cS76Tc9Hh1n7SPdvs7ErZQQskoSeeulbbyNurjdg1IS6o=
X-Received: by 2002:a6b:c903:: with SMTP id z3mr1012915iof.204.1568652950030; 
 Mon, 16 Sep 2019 09:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAKan5DCdRvofdAWaL3js9wmWBsiKWt9DAyguOpy0qv=33tdUwQ@mail.gmail.com>
 <6b9d7429-7dc5-476d-afda-bb3f196c804f@arm.com>
 <20190916103858.kovwuktf7ce52vw7@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <CACCGGhCPUpqtf0CjmpJBBebymMFrjKhKyX3o5NZ3pP5C7qQ2Pg@mail.gmail.com>
 <CAKan5DBFUbFGkPzmFMg4bqzMbrVEh2MzCMXCrL5p0TBmGXe3RQ@mail.gmail.com>
 <CACCGGhCxHEpBXdUYLRWv_x+H=2+yTNXUShPTML1RQGKEVFhWrA@mail.gmail.com>
In-Reply-To: <CACCGGhCxHEpBXdUYLRWv_x+H=2+yTNXUShPTML1RQGKEVFhWrA@mail.gmail.com>
From: Julian Tuminaro <jtuminar@andrew.cmu.edu>
Date: Mon, 16 Sep 2019 10:55:38 -0600
Message-ID: <CAKan5DBz8ZS4czWa8k10nfMvNqu-4_7FKqH6j3Gs82U6ng1Z0A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1181197550615565074=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1181197550615565074==
Content-Type: multipart/alternative; boundary="000000000000dcdb9a0592ae790c"

--000000000000dcdb9a0592ae790c
Content-Type: text/plain; charset="UTF-8"

Paul,

I am still trying to understand the current status. You mentioned "without
having to enable debugging within the guest". Does that mean we will need
to monitor all the debug exceptions, and see if one of these was because of
us or them? Also, wouldn't setting breakpoints require us to modify kernel
text section memory? Or is there an alternative?

Is this the current kdd code that works for window 7:
http://xenbits.xen.org/gitweb/?p=xen.git;a=tree;f=tools/debugger/kdd;h=fd82789a678fb8060cc74ebbe0a04dc58309d6d7;hb=refs/heads/master?
Or is there another branch with some more updated code? I will start going
through the patch for qemu.

Lastly, can you give us some brief idea on what new issues come up for
windows 10 vs windows 7. You mentioned KASLR, any other potential
challenges?

Wei,

Could you also let us know some of the projects you have in mind for us?

Julian

On Mon, Sep 16, 2019 at 9:15 AM Paul Durrant <pdurrant@gmail.com> wrote:

> Hi Julian,
>
>   The KDD code has been untouched for many years; the last OS that it
> appears to have been tried with is Win7 SP1. However, debugging a
> Windows guest with emulated serial is very slow and clunky so a
> solution like KDD is very desirable.
>   The goal of a project would be to get the code functional against a
> recent version of Windows (i.e. 10) such that we could run windbg
> against it and walk kernel data structures, set breakpoints etc.
> without having to enable debugging within the guest.
>
>   Cheers,
>
>     Paul
>
> On Mon, 16 Sep 2019 at 15:31, Julian Tuminaro <jtuminar@andrew.cmu.edu>
> wrote:
> >
> > Hi Paul,
> >
> > Thanks for getting back to us in regards to the KDD project. I am trying
> to understand the current status of the project. Could you provide a bit
> more information on the current status and what would need to be done.
> >
> > Julian
> >
> > On Mon, Sep 16, 2019 at 5:53 AM Paul Durrant <pdurrant@gmail.com> wrote:
> >>
> >> I think KDD is still a worthy thing to do, particularly in light of
> >> https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg01723.html
> >> (which is about the most recent ref I could find, and I don't know
> >> what happened to the code after that). AFAIK, the biggest challenge is
> >> getting round Windows' KASLR; it may be necessary to have some sort of
> >> driver in the guest to get the necessary info. out but that shouldn't
> >> be too hard to implement.
> >>
> >>   Cheers,
> >>
> >>     Paul
> >>
> >> On Mon, 16 Sep 2019 at 11:39, Wei Liu <wl@xen.org> wrote:
> >> >
> >> > Hi Julian
> >> >
> >> > For the KDD related project I have CC'ed Paul.
> >> >
> >> > I have gathered some ideas for cleaning up hypervisor code but they
> are
> >> > of lower difficulty compared to other projects. They are definitively
> >> > not as fun as the others. ;-)
> >> >
> >> > Wei.
> >> >
> >> > On Mon, Sep 09, 2019 at 08:58:51AM +0100, Julien Grall wrote:
> >> > > +Andrew, Lars, Stefano and Wei
> >> > >
> >> > > On 9/5/19 11:23 PM, Julian Tuminaro wrote:
> >> > > > Hi,
> >> > >
> >> > > Hello,
> >> > >
> >> > > Thank you for you interest on Xen. I have CCed few more person that
> should
> >> > > be able to answer your questions below.
> >> > >
> >> > > >
> >> > > > We (a group of 2 students) are interested in doing a hypervisor
> related
> >> > > > project for the next 10-12 weeks as part of one of our courses
> this
> >> > > > semester. We have taken a look at this year's GSoC project list
> >> > > > (https://wiki.xenproject.org/wiki/Outreach_Program_Projects). We
> were
> >> > > > interested in learning more about the "KDD (Windows Debugger Stub)
> >> > > > enhancements" project and Xen on ARM based projects. Yet, on irc
> we were
> >> > > > told that this list is outdated. If there are any other project
> >> > > > suggestions or list, we would be interesting in learning more
> about
> >> > > > them.
> >> > > The list of projects for Xen on Arm is mostly update-to-date. The
> only
> >> > > project where some progress has been made so far is "Xen on ARM:
> dynamic
> >> > > virtual memory layout".
> >> > >
> >> > > I would be happy to go in more details for any those projects if
> you are
> >> > > interested.
> >> > >
> >> > > >
> >> > > > Andrew Cooper suggested on irc the following project: Context
> Switching
> >> > > > with CR0.TS in HVM Guest. We would like to possible know more
> about this
> >> > > > project in terms of difficulty, potential estimate on time
> required.
> >> > > > Andrew also mentioned a slighter bigger xen/linux project and we
> would
> >> > > > like to know more detail about this one as well.
> >> > >
> >> > > Cheers,
> >> > >
> >> > > --
> >> > > Julien Grall
>

--000000000000dcdb9a0592ae790c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Paul,<br><br>I am still trying to understand the current s=
tatus. You mentioned &quot;without having to enable debugging within the gu=
est&quot;. Does that mean we will need to monitor all the debug exceptions,=
 and see if one of these was because of us or them? Also, wouldn&#39;t sett=
ing breakpoints require us to modify kernel text section memory? Or is ther=
e an alternative?<br><br>Is this the current kdd code that works for window=
 7: <a href=3D"http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dtree;f=3Dtool=
s/debugger/kdd;h=3Dfd82789a678fb8060cc74ebbe0a04dc58309d6d7;hb=3Drefs/heads=
/master">http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dtree;f=3Dtools/debu=
gger/kdd;h=3Dfd82789a678fb8060cc74ebbe0a04dc58309d6d7;hb=3Drefs/heads/maste=
r</a>? Or is there another branch with some more updated code? I will start=
 going through the patch for qemu. <br><br>Lastly, can you give us some bri=
ef idea on what new issues come up for windows 10 vs windows 7. You mention=
ed KASLR, any other potential challenges?<br><br>Wei,<br><br>Could you also=
 let us know some of the projects you have in mind for us?<br><br>Julian<br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Sep 16, 2019 at 9:15 AM Paul Durrant &lt;<a href=3D"mailto:pdurran=
t@gmail.com" target=3D"_blank">pdurrant@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Julian,<br>
<br>
=C2=A0 The KDD code has been untouched for many years; the last OS that it<=
br>
appears to have been tried with is Win7 SP1. However, debugging a<br>
Windows guest with emulated serial is very slow and clunky so a<br>
solution like KDD is very desirable.<br>
=C2=A0 The goal of a project would be to get the code functional against a<=
br>
recent version of Windows (i.e. 10) such that we could run windbg<br>
against it and walk kernel data structures, set breakpoints etc.<br>
without having to enable debugging within the guest.<br>
<br>
=C2=A0 Cheers,<br>
<br>
=C2=A0 =C2=A0 Paul<br>
<br>
On Mon, 16 Sep 2019 at 15:31, Julian Tuminaro &lt;<a href=3D"mailto:jtumina=
r@andrew.cmu.edu" target=3D"_blank">jtuminar@andrew.cmu.edu</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Hi Paul,<br>
&gt;<br>
&gt; Thanks for getting back to us in regards to the KDD project. I am tryi=
ng to understand the current status of the project. Could you provide a bit=
 more information on the current status and what would need to be done.<br>
&gt;<br>
&gt; Julian<br>
&gt;<br>
&gt; On Mon, Sep 16, 2019 at 5:53 AM Paul Durrant &lt;<a href=3D"mailto:pdu=
rrant@gmail.com" target=3D"_blank">pdurrant@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I think KDD is still a worthy thing to do, particularly in light o=
f<br>
&gt;&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2017-12/m=
sg01723.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/ar=
chive/html/qemu-devel/2017-12/msg01723.html</a><br>
&gt;&gt; (which is about the most recent ref I could find, and I don&#39;t =
know<br>
&gt;&gt; what happened to the code after that). AFAIK, the biggest challeng=
e is<br>
&gt;&gt; getting round Windows&#39; KASLR; it may be necessary to have some=
 sort of<br>
&gt;&gt; driver in the guest to get the necessary info. out but that should=
n&#39;t<br>
&gt;&gt; be too hard to implement.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Cheers,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Paul<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 16 Sep 2019 at 11:39, Wei Liu &lt;<a href=3D"mailto:wl@xen=
.org" target=3D"_blank">wl@xen.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Julian<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; For the KDD related project I have CC&#39;ed Paul.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have gathered some ideas for cleaning up hypervisor code bu=
t they are<br>
&gt;&gt; &gt; of lower difficulty compared to other projects. They are defi=
nitively<br>
&gt;&gt; &gt; not as fun as the others. ;-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Wei.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Sep 09, 2019 at 08:58:51AM +0100, Julien Grall wrote:=
<br>
&gt;&gt; &gt; &gt; +Andrew, Lars, Stefano and Wei<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On 9/5/19 11:23 PM, Julian Tuminaro wrote:<br>
&gt;&gt; &gt; &gt; &gt; Hi,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hello,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Thank you for you interest on Xen. I have CCed few more =
person that should<br>
&gt;&gt; &gt; &gt; be able to answer your questions below.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; We (a group of 2 students) are interested in doing =
a hypervisor related<br>
&gt;&gt; &gt; &gt; &gt; project for the next 10-12 weeks as part of one of =
our courses this<br>
&gt;&gt; &gt; &gt; &gt; semester. We have taken a look at this year&#39;s G=
SoC project list<br>
&gt;&gt; &gt; &gt; &gt; (<a href=3D"https://wiki.xenproject.org/wiki/Outrea=
ch_Program_Projects" rel=3D"noreferrer" target=3D"_blank">https://wiki.xenp=
roject.org/wiki/Outreach_Program_Projects</a>). We were<br>
&gt;&gt; &gt; &gt; &gt; interested in learning more about the &quot;KDD (Wi=
ndows Debugger Stub)<br>
&gt;&gt; &gt; &gt; &gt; enhancements&quot; project and Xen on ARM based pro=
jects. Yet, on irc we were<br>
&gt;&gt; &gt; &gt; &gt; told that this list is outdated. If there are any o=
ther project<br>
&gt;&gt; &gt; &gt; &gt; suggestions or list, we would be interesting in lea=
rning more about<br>
&gt;&gt; &gt; &gt; &gt; them.<br>
&gt;&gt; &gt; &gt; The list of projects for Xen on Arm is mostly update-to-=
date. The only<br>
&gt;&gt; &gt; &gt; project where some progress has been made so far is &quo=
t;Xen on ARM: dynamic<br>
&gt;&gt; &gt; &gt; virtual memory layout&quot;.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I would be happy to go in more details for any those pro=
jects if you are<br>
&gt;&gt; &gt; &gt; interested.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Andrew Cooper suggested on irc the following projec=
t: Context Switching<br>
&gt;&gt; &gt; &gt; &gt; with CR0.TS in HVM Guest. We would like to possible=
 know more about this<br>
&gt;&gt; &gt; &gt; &gt; project in terms of difficulty, potential estimate =
on time required.<br>
&gt;&gt; &gt; &gt; &gt; Andrew also mentioned a slighter bigger xen/linux p=
roject and we would<br>
&gt;&gt; &gt; &gt; &gt; like to know more detail about this one as well.<br=
>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Cheers,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; --<br>
&gt;&gt; &gt; &gt; Julien Grall<br>
</blockquote></div>

--000000000000dcdb9a0592ae790c--


--===============1181197550615565074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1181197550615565074==--

