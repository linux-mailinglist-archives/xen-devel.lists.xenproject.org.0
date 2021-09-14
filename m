Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37640A67B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 08:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186133.334858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ1d1-0003xt-W2; Tue, 14 Sep 2021 06:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186133.334858; Tue, 14 Sep 2021 06:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ1d1-0003vx-Rk; Tue, 14 Sep 2021 06:09:11 +0000
Received: by outflank-mailman (input) for mailman id 186133;
 Tue, 14 Sep 2021 06:09:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvn+=OE=linaro.org=francois.ozog@srs-us1.protection.inumbo.net>)
 id 1mQ1d0-0003vr-Pz
 for xen-devel@lists.xen.org; Tue, 14 Sep 2021 06:09:10 +0000
Received: from mail-ej1-x629.google.com (unknown [2a00:1450:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42ca1a73-2553-4368-8875-c80cc8b593bf;
 Tue, 14 Sep 2021 06:09:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kt8so26287558ejb.13
 for <xen-devel@lists.xen.org>; Mon, 13 Sep 2021 23:09:08 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 42ca1a73-2553-4368-8875-c80cc8b593bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x5x/V1DMBpywPx69cHTaTCF0A6jodnWq7plIsPoJoZk=;
        b=Z8u45XjMILFKL6nckgNBk1879wdxaTAqWCYIJBe+BOBzAzi8McV0zqm+CMG5JpN8XA
         gx6DSYrD1tXNYthKeuToJ//pa192J1PRfArkmnZR3MzwqNAqXmVNskFosVq+MbztsenH
         a0QVMmbmnRbSyGQzGTut94BiUiscpVm+5sljTvIK2eueg5qMAkIOrjTuIepwdfZ5MmNe
         2kWHAUG05Ztekfl+dzGHTbxik9VD1ClIckycGpjtVXWcUjRD+jlIxIGb2nOhn3OySec0
         J/K+60GmqMevwrPkQrDT0a+S5BwFepBU2auwPrerMnwXtFlp+f/sT6LXBsbbAdy/omrz
         f9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x5x/V1DMBpywPx69cHTaTCF0A6jodnWq7plIsPoJoZk=;
        b=3CjSyAeApxsrtqWiBMyhCFK6QOzOHjNqzucv5ZuHeF3fiHJMQ2FUNAcBWkv759LPn7
         jRDA3zgBb0BzJvEPQ8VFyEIAcwevwDtMR0EfySTeoRumiH09P3onF5uxMf7+lQcHPZNx
         jv5uriQnXBI5pU5gd3b4wl8e+qoSdeXFbNpuqMEP5So3lQbCGn9Rz1jCdCixw+syJwUc
         Ue4ZtLQX8VmLSLf/PJH8Irl0hDjk5K1w403Mi10yyjdeTzBiyLe3TH5S/mjqq6eIJtYQ
         BCtGZNaChozW/Ums/MQK7MqDlPBqRF8AhGlpIpu7WXUcnKxOCVN+mUdTh/f/LSkOE6rB
         BJ4A==
X-Gm-Message-State: AOAM533iPOkBhfl7MFBHieE7NfhTuUkOJ1G3lmHe2Two8DXLlbGigM5u
	cXhZXLc9yboIJYMjLqb+9OmnrDHB51trGuB/P6Lcfw==
X-Google-Smtp-Source: ABdhPJwHefPyM/dt/KdBSgsrxLB2rVvE3l71w2Kr+TINTLh4FPMK7X9eRXOFh7owrwLasT/fiWrzFP7dbnrFty3nuBA=
X-Received: by 2002:a17:906:2c0b:: with SMTP id e11mr17193602ejh.284.1631599747573;
 Mon, 13 Sep 2021 23:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <87v94ldrqq.fsf@linaro.org> <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org>
 <20210906022356.GD40187@laputa> <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109131615570.10523@sstabellini-ThinkPad-T480s>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Tue, 14 Sep 2021 08:08:56 +0200
Message-ID: <CAHFG_=WNfq7etkA1CG_xuPzaTJ7wtmBuWN5ES-uwwErLVCpEcw@mail.gmail.com>
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO backends
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Artem_Mygaiev@epam.com, Bertrand.Marquis@arm.com, 
	Carl van Schaik <cvanscha@qti.qualcomm.com>, Elena Afanasova <eafanasova@gmail.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Oleksandr_Tyshchenko@epam.com, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, jgross@suse.com, julien@xen.org, 
	olekstysh@gmail.com, paul@xen.org, virtio-dev@lists.oasis-open.org, 
	xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000005ec22105cbee6b8c"

--0000000000005ec22105cbee6b8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Le mar. 14 sept. 2021 =C3=A0 01:51, Stefano Stabellini via Stratos-dev <
stratos-dev@op-lists.linaro.org> a =C3=A9crit :

> On Mon, 6 Sep 2021, AKASHI Takahiro wrote:
> > > the second is how many context switches are involved in a transaction=
.
> > > Of course with all things there is a trade off. Things involving the
> > > very tightest latency would probably opt for a bare metal backend whi=
ch
> > > I think would imply hypervisor knowledge in the backend binary.
> >
> > In configuration phase of virtio device, the latency won't be a big
> matter.
> > In device operations (i.e. read/write to block devices), if we can
> > resolve 'mmap' issue, as Oleksandr is proposing right now, the only
> issue is
> > how efficiently we can deliver notification to the opposite side. Right=
?
> > And this is a very common problem whatever approach we would take.
> >
> > Anyhow, if we do care the latency in my approach, most of virtio-proxy-
> > related code can be re-implemented just as a stub (or shim?) library
> > since the protocols are defined as RPCs.
> > In this case, however, we would lose the benefit of providing "single
> binary"
> > BE.
> > (I know this is is an arguable requirement, though.)
>
> In my experience, latency, performance, and security are far more
> important than providing a single binary.
>
> In my opinion, we should optimize for the best performance and security,
> then be practical on the topic of hypervisor agnosticism. For instance,
> a shared source with a small hypervisor-specific component, with one
> implementation of the small component for each hypervisor, would provide
> a good enough hypervisor abstraction. It is good to be hypervisor
> agnostic, but I wouldn't go extra lengths to have a single binary. I
> cannot picture a case where a BE binary needs to be moved between
> different hypervisors and a recompilation is impossible (BE, not FE).
> Instead, I can definitely imagine detailed requirements on IRQ latency
> having to be lower than 10us or bandwidth higher than 500 MB/sec.
>
> Instead of virtio-proxy, my suggestion is to work together on a common
> project and common source with others interested in the same problem.
>
> I would pick something like kvmtool as a basis. It doesn't have to be
> kvmtools, and kvmtools specifically is GPL-licensed, which is
> unfortunate because it would help if the license was BSD-style for ease
> of integration with Zephyr and other RTOSes.
>
> As long as the project is open to working together on multiple
> hypervisors and deployment models then it is fine. For instance, the
> shared source could be based on OpenAMP kvmtool [1] (the original
> kvmtool likely prefers to stay small and narrow-focused on KVM). OpenAMP
> kvmtool was created to add support for hypervisor-less virtio but they
> are very open to hypervisors too. It could be a good place to add a Xen
> implementation, a KVM fatqueue implementation, a Jailhouse
> implementation, etc. -- work together toward the common goal of a single
> BE source (not binary) supporting multiple different deployment models.
>
i like the hypervisor-less approach described in the link below. it can
also be used to drfine abstract HAL between normal world and TrustZone to
implement confidential workloads in the TZ. Virtio-sock is of particular
interest.
In addition, this can define a HAL that can be re-used in many contexts :
could we use this to implement something similar to Android Generic Kernel
Image stuff ?

>
>
> [1] https://github.com/OpenAMP/kvmtool
> --
> Stratos-dev mailing list
> Stratos-dev@op-lists.linaro.org
> https://op-lists.linaro.org/mailman/listinfo/stratos-dev
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000005ec22105cbee6b8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Le=C2=A0mar. 14 sept. 2021 =C3=A0 01:51, Stefano S=
tabellini via Stratos-dev &lt;<a href=3D"mailto:stratos-dev@op-lists.linaro=
.org">stratos-dev@op-lists.linaro.org</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Mon, 6 Sep 2021, AKASHI Takahiro wrote:<b=
r>
&gt; &gt; the second is how many context switches are involved in a transac=
tion.<br>
&gt; &gt; Of course with all things there is a trade off. Things involving =
the<br>
&gt; &gt; very tightest latency would probably opt for a bare metal backend=
 which<br>
&gt; &gt; I think would imply hypervisor knowledge in the backend binary.<b=
r>
&gt; <br>
&gt; In configuration phase of virtio device, the latency won&#39;t be a bi=
g matter.<br>
&gt; In device operations (i.e. read/write to block devices), if we can<br>
&gt; resolve &#39;mmap&#39; issue, as Oleksandr is proposing right now, the=
 only issue is<br>
&gt; how efficiently we can deliver notification to the opposite side. Righ=
t?<br>
&gt; And this is a very common problem whatever approach we would take.<br>
&gt; <br>
&gt; Anyhow, if we do care the latency in my approach, most of virtio-proxy=
-<br>
&gt; related code can be re-implemented just as a stub (or shim?) library<b=
r>
&gt; since the protocols are defined as RPCs.<br>
&gt; In this case, however, we would lose the benefit of providing &quot;si=
ngle binary&quot;<br>
&gt; BE.<br>
&gt; (I know this is is an arguable requirement, though.)<br>
<br>
In my experience, latency, performance, and security are far more<br>
important than providing a single binary.<br>
<br>
In my opinion, we should optimize for the best performance and security,<br=
>
then be practical on the topic of hypervisor agnosticism. For instance,<br>
a shared source with a small hypervisor-specific component, with one<br>
implementation of the small component for each hypervisor, would provide<br=
>
a good enough hypervisor abstraction. It is good to be hypervisor<br>
agnostic, but I wouldn&#39;t go extra lengths to have a single binary. I<br=
>
cannot picture a case where a BE binary needs to be moved between<br>
different hypervisors and a recompilation is impossible (BE, not FE).<br>
Instead, I can definitely imagine detailed requirements on IRQ latency<br>
having to be lower than 10us or bandwidth higher than 500 MB/sec.<br>
<br>
Instead of virtio-proxy, my suggestion is to work together on a common<br>
project and common source with others interested in the same problem.<br>
<br>
I would pick something like kvmtool as a basis. It doesn&#39;t have to be<b=
r>
kvmtools, and kvmtools specifically is GPL-licensed, which is<br>
unfortunate because it would help if the license was BSD-style for ease<br>
of integration with Zephyr and other RTOSes.<br>
<br>
As long as the project is open to working together on multiple<br>
hypervisors and deployment models then it is fine. For instance, the<br>
shared source could be based on OpenAMP kvmtool [1] (the original<br>
kvmtool likely prefers to stay small and narrow-focused on KVM). OpenAMP<br=
>
kvmtool was created to add support for hypervisor-less virtio but they<br>
are very open to hypervisors too. It could be a good place to add a Xen<br>
implementation, a KVM fatqueue implementation, a Jailhouse<br>
implementation, etc. -- work together toward the common goal of a single<br=
>
BE source (not binary) supporting multiple different deployment models.<br>
</blockquote><div dir=3D"auto">i like the hypervisor-less approach describe=
d in the link below. it can also be used to drfine abstract HAL between nor=
mal world and TrustZone to implement confidential workloads in the TZ. Virt=
io-sock is of particular interest.=C2=A0</div><div dir=3D"auto">In addition=
, this can define a HAL that can be re-used in many contexts : could we use=
 this to implement something similar to Android Generic Kernel Image stuff =
?</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br>
<br>
[1] <a href=3D"https://github.com/OpenAMP/kvmtool" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/OpenAMP/kvmtool</a><br>
-- <br>
Stratos-dev mailing list<br>
<a href=3D"mailto:Stratos-dev@op-lists.linaro.org" target=3D"_blank">Strato=
s-dev@op-lists.linaro.org</a><br>
<a href=3D"https://op-lists.linaro.org/mailman/listinfo/stratos-dev" rel=3D=
"noreferrer" target=3D"_blank">https://op-lists.linaro.org/mailman/listinfo=
/stratos-dev</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://drive.google.com/a/linaro.org/uc?id=3D=
0BxTAygkus3RgQVhuNHMwUi1mYWc&amp;export=3Ddownload" width=3D"96" height=3D"=
53"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans Ser=
if&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,87,8=
7)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=
=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</span>=
=C2=A0<i>Director Business Development</i></td></tr><tr><td style=3D"font-f=
amily:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;font-size:9=
pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=3D"=
+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><br><a href=
=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87);text-deco=
ration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0<span styl=
e=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr></tb=
ody></table></td></tr></tbody></table></div></div></div></div></div><div><d=
iv><br style=3D"font-size:small"></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div>

--0000000000005ec22105cbee6b8c--

