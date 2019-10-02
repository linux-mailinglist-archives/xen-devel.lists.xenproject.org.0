Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC4C8E2C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 18:21:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFhM8-0002BL-E3; Wed, 02 Oct 2019 16:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2c0b=X3=gmail.com=katereenart@srs-us1.protection.inumbo.net>)
 id 1iFhM6-0002BC-6M
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 16:19:58 +0000
X-Inumbo-ID: 791dbbac-e530-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by localhost (Halon) with ESMTPS
 id 791dbbac-e530-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 16:19:57 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id f5so17774983ljg.8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=poK9KrlOYiiRMHpMlP0EBSka2uC4YgqfSeOPehxNZlQ=;
 b=VOBQhx7ozhhriWaKFsOtjCLpZg65YLb6S0VV6jOeBJ7IzQALnZ6xALlXDf1emuVXYS
 cJ9h23EcMrGNR/FF2fPnuWi6R2K0//2eVz3/8K9yTTVoTyT6+QJBJ2sT+ww54vxllOWL
 I5e3f/CVjkRJrrSJvytsMLtzwA31v571MDnpJW7rOt3kEcZubEVTplzt2CoFYIhe884v
 X8xed1Tfre5l7CbjRJlzq+KGpMw/2FbLPe63G3V/g3nXFxhgfsYpzqnMWQu2RkJMS9Dx
 rcpAiA79a6FsjaWN2ZbgQbhSAkF6j+P9R7f2qG43TukWlQwX4gnL4eHzyAca10FKp0bp
 ccxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=poK9KrlOYiiRMHpMlP0EBSka2uC4YgqfSeOPehxNZlQ=;
 b=bW06R8yLzzzI5g6gBj+kIn6G8WXmgBWpRQvJDx0Q8oaQdyKWo0PQoXt6GjZLG+yPIL
 ehauLtYv11dV9muo67EvG2IwStIrzNhIt5wHChPE5U6gFn65/XAYNz06Xl09Uf304YIh
 ThII2pIe7jZcp9ogL2Ikpv6EpR7VxSAYVxqBCuIgWCKekXDvEKSkkDC6IFxycuquy+jv
 lsBYOqJq7IYh/Zj8Oek4q5Vb1fLr3Stp/9b7Hb4HBgF3+buA029bGgLEqwLf9WGbsnGu
 dw9duBSawIJR9bm8w/kl9xufX1/cQ6HsQWYNtolhLiP4ZmGVFAbEXo0jVuY4SakvLwFx
 MMPQ==
X-Gm-Message-State: APjAAAW+TIeW8DdlrY/5Gxqkb7dsWo33mjhhfF5suNUN13mxHHJ+vwqe
 9wyYL7TYeuQzS2I5U4/1Wz2q8bNZZ70KHxCVJwWAwA==
X-Google-Smtp-Source: APXvYqxBR9Mec6qg+KLlHPqpLxQ3H4TvTICuuj2WXMp2y2Ap4NrEIB7iPwiUlAMHCBxfQmpgE2yr+x+Dx8KMNw0Iu6M=
X-Received: by 2002:a2e:9d16:: with SMTP id t22mr2660571lji.207.1570033196049; 
 Wed, 02 Oct 2019 09:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAFjkr2qCb7ZoOAx2A_oFE1znjpia=2Auk+XePybfWbk8jB-9Nw@mail.gmail.com>
 <CAFjkr2qskyxgtoZzToNXWAZPnN=5fbEiWpZO3P+Lq=1PiiEZPg@mail.gmail.com>
 <20191002103340.vxqzkwcptpw7lhol@debian>
In-Reply-To: <20191002103340.vxqzkwcptpw7lhol@debian>
From: Kateryna Razumova <katereenart@gmail.com>
Date: Wed, 2 Oct 2019 18:19:44 +0200
Message-ID: <CAFjkr2rK6vi4CmqyT+2ce3LFRz0FNngproCeOGROnO5rSWp8uA@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] I want to participate in Outreachy with CONFIG_PDX
 related project
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============6587576172504351697=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6587576172504351697==
Content-Type: multipart/alternative; boundary="000000000000efaa430593efd6e7"

--000000000000efaa430593efd6e7
Content-Type: text/plain; charset="UTF-8"

Dear Liu,

oh, I thought that xen participates in Outreachy in order to get new
contributors via easing the entrance process.
But it seems that a potential contributor to xen should already have some
knowledge of xen (for example, how to find a bug, since there are no issues
on github and no visible link to bugzilla). I didn't know that!
I am really sorry for this inconvenience!!!

On Wed, 2 Oct 2019 at 12:33, Wei Liu <wl@xen.org> wrote:

> Hi Kateryna
>
> Thanks for your interest in this project.
>
> On Wed, Oct 02, 2019 at 12:37:30AM +0200, Kateryna Razumova wrote:
> > Hello,
> > I want to make the first contribution for xen. I want to participate
> with:
> > Introduce CONFIG_PDX and use it in Xen hypervisor
> >
> > Where can I start?
>
> Please read all reference materials for that project.
>
> You will need to make sure you have the hardware that's capable of
> running Xen. If you have read the project description and have more
> specific questions, please ask.
>
> > I have few years of C programming experience but never had contributed to
> > open-source projects before.
> >
> > On Wed, 25 Sep 2019 at 11:27, Kateryna Razumova <katereenart@gmail.com>
> > wrote:
> > >
> > > Hello xen,
> > > I would like to participate in Outreachy. I was registered on the site
> > few days ago, filled some quite a big form but still can't see tasks'
> > descriptions.
> > > Since, I like C programming I would like to know more about "Introduce
> > CONFIG_PDX and use it in Xen hypervisor". What hardware do I need? I
> think
> > I can find an old laptop with virtualization support. Also, how can I
> start
>
> Yes. Find a laptop with virtualisation support. Install your choice of
> virtualisation software, and then install a Xen system from source in it.
>
> For contributing, I suggest you clone xen.git from
>
>    https://xenbits.xen.org/git-http/xen.git
>
> and have a look at xen/ directory, which contains the hypervisor source
> code you will work on. Submit a patch or patches. They can be as easy as
> fixing typos or as complex as fixing a real bug that you find.
>
> Wei.
>
> > contributing?
> > > I have few years of C programming experience but never had contributed
> to
> > open-source projects before.
>

--000000000000efaa430593efd6e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Liu,</div><div><br></div><div>oh, I thought that=
 xen participates in Outreachy in order to get new contributors via easing =
the entrance process.</div><div>But it seems that a potential contributor t=
o xen should already have some knowledge of xen (for example, how to find a=
 bug, since there are no issues on github and no visible link to bugzilla).=
 I didn&#39;t know that!<br></div><div>I am really sorry for this inconveni=
ence!!!<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, 2 Oct 2019 at 12:33, Wei Liu &lt;<a href=3D"mailto=
:wl@xen.org">wl@xen.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Kateryna<br>
<br>
Thanks for your interest in this project.<br>
<br>
On Wed, Oct 02, 2019 at 12:37:30AM +0200, Kateryna Razumova wrote:<br>
&gt; Hello,<br>
&gt; I want to make the first contribution for xen. I want to participate w=
ith:<br>
&gt; Introduce CONFIG_PDX and use it in Xen hypervisor<br>
&gt; <br>
&gt; Where can I start?<br>
<br>
Please read all reference materials for that project.<br>
<br>
You will need to make sure you have the hardware that&#39;s capable of<br>
running Xen. If you have read the project description and have more<br>
specific questions, please ask.<br>
<br>
&gt; I have few years of C programming experience but never had contributed=
 to<br>
&gt; open-source projects before.<br>
&gt; <br>
&gt; On Wed, 25 Sep 2019 at 11:27, Kateryna Razumova &lt;<a href=3D"mailto:=
katereenart@gmail.com" target=3D"_blank">katereenart@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello xen,<br>
&gt; &gt; I would like to participate in Outreachy. I was registered on the=
 site<br>
&gt; few days ago, filled some quite a big form but still can&#39;t see tas=
ks&#39;<br>
&gt; descriptions.<br>
&gt; &gt; Since, I like C programming I would like to know more about &quot=
;Introduce<br>
&gt; CONFIG_PDX and use it in Xen hypervisor&quot;. What hardware do I need=
? I think<br>
&gt; I can find an old laptop with virtualization support. Also, how can I =
start<br>
<br>
Yes. Find a laptop with virtualisation support. Install your choice of<br>
virtualisation software, and then install a Xen system from source in it.<b=
r>
<br>
For contributing, I suggest you clone xen.git from<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://xenbits.xen.org/git-http/xen.git" rel=3D"no=
referrer" target=3D"_blank">https://xenbits.xen.org/git-http/xen.git</a><br=
>
<br>
and have a look at xen/ directory, which contains the hypervisor source<br>
code you will work on. Submit a patch or patches. They can be as easy as<br=
>
fixing typos or as complex as fixing a real bug that you find.<br>
<br>
Wei.<br>
<br>
&gt; contributing?<br>
&gt; &gt; I have few years of C programming experience but never had contri=
buted to<br>
&gt; open-source projects before.<br>
</blockquote></div>

--000000000000efaa430593efd6e7--


--===============6587576172504351697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6587576172504351697==--

