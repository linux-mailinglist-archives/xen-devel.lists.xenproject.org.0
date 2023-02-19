Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A969C15C
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 17:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497823.768611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTmoI-0005bB-NP; Sun, 19 Feb 2023 16:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497823.768611; Sun, 19 Feb 2023 16:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTmoI-0005Yn-K2; Sun, 19 Feb 2023 16:45:10 +0000
Received: by outflank-mailman (input) for mailman id 497823;
 Sun, 19 Feb 2023 16:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wxQ=6P=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1pTmoH-0005Yh-7x
 for xen-devel@lists.xen.org; Sun, 19 Feb 2023 16:45:09 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3937095-b074-11ed-933d-83870f6b2ba8;
 Sun, 19 Feb 2023 17:45:07 +0100 (CET)
Received: by mail-pf1-x433.google.com with SMTP id 7so363632pfo.13
 for <xen-devel@lists.xen.org>; Sun, 19 Feb 2023 08:45:07 -0800 (PST)
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
X-Inumbo-ID: c3937095-b074-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qa3hU/3iylBoeEP41sC20sjI+3hQfarin5DO/1FfQyw=;
        b=PPzSeB1Yt1kdP2xe2OpLBp6ITs43VvIhGyrbgJ7T2sudxd8SETEqx7WfSLQtp1Vrn9
         CwBLi6uM5S/UzzmCmKtRFjx/mxOFLrsa5qsH83SBh15mAavNVJDWCmwTdKIufORL//Qe
         xrT0ucQkG33HhL7Xhom6S7tcOOH0KqLBrXVv54AolJTFVgaO1NIqzYQJMKt+Xw5nsgoB
         26Hq7F75axdzGlukDTlKQM5fMCFEnDLDwTpUh6OTyX5nXtY+7/L13hUpXYiHAtoGCeNf
         Qu/XAdOo5MJZYgsfylT9J9bhdAX/EIyeLKnH8PkTLPdS1JTZcyTGSXHZNakq7OY7qsl+
         ULrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qa3hU/3iylBoeEP41sC20sjI+3hQfarin5DO/1FfQyw=;
        b=rj+i5I98uNEphzULtRY9gn8u9L8rk1hhvF1QgtgEJObr9g++/KPKBGC/0uTqgcK8jZ
         0HEgsNJIZZMJ8oqwrUq8B6OQ9KvTAu8q3S5xuO/tV0hmdc9hfKILalddOdtxzI2lN9RH
         DmCW4TKsiYpszboh+mYibiP6lAqgeNjY0H+4u5+pgLEIfsQinTsciIORfme+oW0uni12
         DJTjBfkfu4ja2GSEt8uoZC6cXGcUeG855fUwdTEUN8Vau8Ehh3f8vCw2ZvJxRzsayoyN
         PRpxjxi1Hsuovzr3A24GBcg+MuX4HE+1Dz2OKaxcYTeyaTNVLwBiMrGL2A9n8o0PpK9w
         91mw==
X-Gm-Message-State: AO0yUKWKUr25uaTFcNjPvnoYvmuDR7c24609WbpC40Am/2ds8NEMpKQy
	XlqQ0YmF+q3I+oTUAlMrQqsi5Dus7RQYjXjOkHA=
X-Google-Smtp-Source: AK7set/0XzGrwYs4lhic2U5pNKJQuKg+zuohvY2a9qJBjGD9mzDZkUyx9YQpdNczrgyMrXtnTq3TbB/K8i5GMMnaGGw=
X-Received: by 2002:aa7:9284:0:b0:5a9:b96f:d039 with SMTP id
 j4-20020aa79284000000b005a9b96fd039mr47451pfa.41.1676825105481; Sun, 19 Feb
 2023 08:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20230216111325.tprjr7rdr52iqvmm@vireshk-i7> <5d945b2d-048a-fc66-023c-377f494b477b@citrix.com>
In-Reply-To: <5d945b2d-048a-fc66-023c-377f494b477b@citrix.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Sun, 19 Feb 2023 18:44:54 +0200
Message-ID: <CAPD2p-mAOtfSRUgTOwu88umLfhjFugL4_WEBNJ7EJG90gPng4A@mail.gmail.com>
Subject: Re: [Discussion] Xen grants and access permissions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="000000000000c3442005f51044d2"

--000000000000c3442005f51044d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Viresh.

[CCed J=C3=BCrgen who might have some thoughts]
[Sorry for the possible format issues]

On Thu, Feb 16, 2023 at 1:36 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 16/02/2023 11:13 am, Viresh Kumar wrote:
> > Hi Oleksandr,
> >
> > As you already know, I am looking at how we can integrate the Xen
> > grants work in our implementation of Rust based Xen vhost frontend [1].
> >
> > The hypervisor independent vhost-user backends [2] talk to
> > xen-vhost-frontend using the standard vhost-user protocol [3]. Every
> > memory region that the backends get access to are sent to it by the
> > frontend as memory region descriptors, which contain only address and
> > size information and lack any permission flags.
> >
> > I noticed that with Xen grants, there are strict memory access
> > restrictions, where a memory region may be marked READ only and we
> > can't map it as RW anymore, trying that just fails. Because the
> > standard vhost-user protocol doesn't have any permission flags, the
> > vhost libraries (in Rust) can't do anything else but try to map
> > everything as RW.
> >
> > I am wondering how do I proceed on this as I am very much stuck here.
> >
>
> (unhelpful comment) This is what happens when people try to reinvent the
> wheel a little more square than it was before.
>
> If the guest grants the page read-only, then you can only map it read
> only.  Anything else is a violation of the security model.
>
> So either you need to adjust the guest to always grant read/write, or
> you need to teach virtio that read only is actually a real concept.
>
> ~Andrew
>


Below are my thoughts which might be wrong.

I see the problem, but cannot add anything else to what Andrew has already
said. If the frontend maps a page as RO then a backend (device) should
map it with the same attribute and perform only read access to it.
Restricted memory access using Xen grants is a kind of SW IOMMU,
no more no less, so I assume the very same problem would take place if we
would implement a virtio-iommu for Xen...

Let's assume that we cannot modify a guest to map *everything* as RW. But
although the permission flags are not communicated explicitly in classic
case,
the backend usually knows how a particular frontend page is supposed to be
mapped
(at least I didn't face any permission related issues when using Xen grants
either with standalone virtio-disk backend or Qemu based backends using
J=C3=BCrgen's PoC):

1. The virtqueues are mapped as RW (because it is supposed to be written by
both ends)
2. The payload I/O buffer's (virtio ring descriptors) fortunately have a
flag field, so it is always known whether they are WO or RO
3. The indirect descriptor is mapped as RO (because it contains a list of
other descriptors, so nothing to be written there)

So I am wondering can this standard vhost-user protocol be extended to pass
some additional information for a memory region?

If and only if that standard vhost-user protocol cannot be extended to
communicate required information for a memory region *and*
there is a need to use Xen grants for virtio (so it is completely unclear
what that memory region actually represents and how it should be mapped)
one (crazy?) idea could be to try to map everything as RW and fallback to
RO if the mapping attempt fails. Or, perhaps, as an alternative,
to map as RW only those pages which are going to be modified, anything else
map as RO. Although I am not quite sure whether it would be a good idea.



--=20
Regards,

Oleksandr Tyshchenko

--000000000000c3442005f51044d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Viresh.<br><br>[CCed J=C3=BCrgen wh=
o might have some thoughts]<br></div><div>[Sorry for the possible format is=
sues]</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Feb 16, 2023 at 1:36 PM Andrew Cooper &lt;<a href=3D"mailto:an=
drew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 16/02/2023 11:13 am, V=
iresh Kumar wrote:<br>
&gt; Hi Oleksandr,<br>
&gt;<br>
&gt; As you already know, I am looking at how we can integrate the Xen<br>
&gt; grants work in our implementation of Rust based Xen vhost frontend [1]=
.<br>
&gt;<br>
&gt; The hypervisor independent vhost-user backends [2] talk to<br>
&gt; xen-vhost-frontend using the standard vhost-user protocol [3]. Every<b=
r>
&gt; memory region that the backends get access to are sent to it by the<br=
>
&gt; frontend as memory region descriptors, which contain only address and<=
br>
&gt; size information and lack any permission flags.<br>
&gt;<br>
&gt; I noticed that with Xen grants, there are strict memory access<br>
&gt; restrictions, where a memory region may be marked READ only and we<br>
&gt; can&#39;t map it as RW anymore, trying that just fails. Because the<br=
>
&gt; standard vhost-user protocol doesn&#39;t have any permission flags, th=
e<br>
&gt; vhost libraries (in Rust) can&#39;t do anything else but try to map<br=
>
&gt; everything as RW.<br>
&gt;<br>
&gt; I am wondering how do I proceed on this as I am very much stuck here.<=
br>
&gt;<br>
<br>
(unhelpful comment) This is what happens when people try to reinvent the<br=
>
wheel a little more square than it was before.<br>
<br>
If the guest grants the page read-only, then you can only map it read<br>
only.=C2=A0 Anything else is a violation of the security model.<br>
<br>
So either you need to adjust the guest to always grant read/write, or<br>
you need to teach virtio that read only is actually a real concept.<br>
<br>
~Andrew<br></blockquote><div>=C2=A0</div><div><br></div><div>Below are my t=
houghts which might be wrong.<br><br>I see the problem, but cannot add anyt=
hing else to what Andrew has already said. If the frontend maps a page as R=
O then a backend (device) should <br>map it with the same attribute and per=
form only read access to it. Restricted memory access using Xen grants is a=
 kind of SW IOMMU,=C2=A0</div><div>no more no less,=C2=A0so I assume the ve=
ry same problem would take place if we would implement a virtio-iommu for X=
en...<br><br>Let&#39;s assume that we cannot modify a guest to map *everyth=
ing* as RW. But although the permission flags are not communicated explicit=
ly in classic case,</div><div>the backend usually knows how a particular fr=
ontend page is supposed to be mapped</div><div>(at least I didn&#39;t face =
any permission related issues when using Xen grants either with standalone =
virtio-disk backend or Qemu based backends using J=C3=BCrgen&#39;s PoC):<br=
><br>1. The virtqueues are mapped as RW (because it is supposed to be writt=
en by both ends)<br>2. The payload I/O buffer&#39;s (virtio ring descriptor=
s) fortunately have a flag field, so it is always known whether they are WO=
 or RO<br>3. The indirect descriptor is mapped as RO (because it contains a=
 list of other descriptors, so nothing to be written there)<br><br>So I am =
wondering can this standard vhost-user protocol be extended to pass some ad=
ditional information for a memory region? <br><br>If and only if that stand=
ard vhost-user protocol cannot be extended to communicate required informat=
ion for a memory region *and*=C2=A0</div><div>there is a need to use Xen gr=
ants for virtio (so it is completely unclear what that memory region actual=
ly represents and how it should be mapped)</div><div>one (crazy?) idea coul=
d be to try to map everything as RW and fallback to RO if the mapping attem=
pt fails. Or, perhaps, as an alternative,</div><div>to map as RW only those=
 pages which are going to be modified, anything else map as RO. Although I =
am not quite sure whether it would be a good idea.<br></div></div><div clas=
s=3D"gmail_quote"><br></div><br clear=3D"all"><div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><fo=
nt size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-ser=
if">Regards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr"><div><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2">Oleksandr Tyshchenko</font></span></div></div></div></div></div></di=
v></div></div>

--000000000000c3442005f51044d2--

