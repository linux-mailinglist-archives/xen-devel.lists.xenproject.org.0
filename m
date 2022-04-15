Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF1D5031ED
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 01:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305977.521137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfVdI-0008VA-Km; Fri, 15 Apr 2022 23:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305977.521137; Fri, 15 Apr 2022 23:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfVdI-0008Sc-Hn; Fri, 15 Apr 2022 23:45:44 +0000
Received: by outflank-mailman (input) for mailman id 305977;
 Fri, 15 Apr 2022 23:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WtN=UZ=gmail.com=julien.grall@srs-se1.protection.inumbo.net>)
 id 1nfVdH-0008SU-Gk
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 23:45:43 +0000
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [2607:f8b0:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28c8ccb0-bd16-11ec-8fbe-03012f2f19d4;
 Sat, 16 Apr 2022 01:45:42 +0200 (CEST)
Received: by mail-il1-x12b.google.com with SMTP id r11so5587085ila.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 16:45:42 -0700 (PDT)
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
X-Inumbo-ID: 28c8ccb0-bd16-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Whatm5yIxNGgA/0xJCvQkgGDKdJIiTfGm5E24y+lywE=;
        b=qjhN6EmDK8JYzzB0h95JndTPrKZWIZ34kSvOJ3ZYAwS+AE+Jkr8kTkGlnBrrXm9Adg
         Xoa+BS40pMly5WaWhJB3gI4+VZdqo2Vqm+WgE0ztl7pNdRaY0XyQXNpW1DwY7zaGFSn7
         lBe+TjGYXFkBKo4UHF/xBx4N+lMgjpR++/Hnwd2i5nCnE9GofIdq9IoaIJ+OpBuSRaAV
         D0aDt30cTxlhYWWUPYI4GFwYPRZa/qIr6dWsC8GOT33DrZzjGw97aTd78ezuxud54Xo6
         URGWpXtbdaf+PXaKDdxSicUFMO5qEl9o7FTVfg+1z20mILOWTzFizs+z+XV76vuMzOmj
         IQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Whatm5yIxNGgA/0xJCvQkgGDKdJIiTfGm5E24y+lywE=;
        b=ZD6ACaUB1EifN0C/85ODIaAeg8KrchVQRrpiQLvg4witM/4KEIvPqurPmBL94C5lYg
         Mo+Umsv9fqvepU/+1d+CQV+mV8Hv/FcLebwAo6oVDSe3MHXAiMJwVAqGPDJAgAgPv6vt
         oOD8afJH8E8r3iysHS7XOEv9iaTxhHAwli9tdW0cZ6kdUwcUTu4uKaXkwBSDdJIfV7Q/
         JEfHSrP18UPlOBs45sKgYXE0aSE0oiwtXSm+0IC3lSl0BNDmT1OjuK+hIq4boxL/ZFMm
         OYY7Ti2POko8ekFQnkK+Qs254hEiB9Kfp6oHCK85yt0HHR7vuRxK1XSmHJXcT3fvQtrz
         SWYw==
X-Gm-Message-State: AOAM530sAQMBFA9xVEDSrnDKXCUOghzKMs86J1SA98Tlw3T2shp2hOyv
	LSZ9MNDHr48rVZNT8+s4dX2ySRxZ4oCqoiwVXI4=
X-Google-Smtp-Source: ABdhPJy8GAnfvKOABU1JAIHlWVNQOx834WVOABoUoFjyHkXBLQb8+J2Wx28YfV0e0Tqi+2f8Sh/BX7IDAWRMQJXIhtI=
X-Received: by 2002:a05:6e02:12ce:b0:2ca:3c80:3abc with SMTP id
 i14-20020a056e0212ce00b002ca3c803abcmr461394ilm.47.1650066340766; Fri, 15 Apr
 2022 16:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com> <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop>
 <30a6ef6f-d37c-b66c-d5af-be2208766057@suse.com> <alpine.DEB.2.22.394.2203211256370.2910984@ubuntu-linux-20-04-desktop>
 <f8627956-8b01-6a5d-d69a-d2da16d74726@xen.org> <DU2PR08MB7325F469140EFE83F2F8F91DF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204151506520.915916@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2204151506520.915916@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien.grall@gmail.com>
Date: Fri, 15 Apr 2022 23:45:29 +0000
Message-ID: <CAF3u54AC1QRrGgPWDYjeb5xyuXhpF5GsHh5WFPxr=9XCKe1fCg@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
	Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Wei Chen <Wei.Chen@arm.com>, Wei Liu <wl@xen.org>, nd <nd@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000018e86605dcba0279"

--00000000000018e86605dcba0279
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 15 Apr 2022 at 22:19, Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Fri, 15 Apr 2022, Penny Zheng wrote:
> > > Hi Stefano,
> > >
> > > On 21/03/2022 20:03, Stefano Stabellini wrote:
> > > > On Mon, 21 Mar 2022, Jan Beulich wrote:
> > > >> On 18.03.2022 22:50, Stefano Stabellini wrote:
> > > >>> On Fri, 18 Mar 2022, Jan Beulich wrote:
> > > >>>> On 11.03.2022 07:11, Penny Zheng wrote:
> > > >>>>> In case to own statically shared pages when owner domain is not
> > > >>>>> explicitly defined, this commits propose a special domain
> > > >>>>> DOMID_SHARED, and we assign it 0x7FF5, as one of the system
> domains.
> > > >>>>>
> > > >>>>> Statically shared memory reuses the same way of initialization
> > > >>>>> with static memory, hence this commits proposes a new Kconfig
> > > >>>>> CONFIG_STATIC_SHM to wrap related codes, and this option depend=
s
> > > on static memory(CONFIG_STATIC_MEMORY).
> > > >>>>>
> > > >>>>> We intends to do shared domain creation after setup_virt_paging
> so
> > > >>>>> shared domain could successfully do p2m initialization.
> > > >>>>
> > > >>>> There's nothing said here, in the earlier patch, or in the cover
> > > >>>> letter about the security aspects of this. There is a reason we
> > > >>>> haven't been allowing arbitrary, un-supervised sharing of memory
> > > >>>> between domains. It wants clarifying why e.g. grants aren't an
> > > >>>> option to achieve what you need, and how you mean to establish
> > > >>>> which domains are / aren't permitted to access any individual pa=
ge
> > > owned by this domain.
> > > >>>
> > > >>>
> > > >>> I'll let Penny write a full reply but I'll chime in to try to hel=
p
> > > >>> with the explanation.
> > > >>>
> > > >>> This is not arbitrary un-supervised sharing of memory between
> > > >>> domains, which indeed is concerning.
> > > >>>
> > > >>> This is statically-configured, supervised by the system
> > > >>> configurator, sharing of memory between domains.
> > > >>>
> > > >>> And in fact safety (which is just a different aspect of security)
> is
> > > >>> one of the primary goals for this work.
> > > >>>
> > > >>> In safety-critical environments, it is not considered safe to
> > > >>> dynamically change important configurations at runtime. Everythin=
g
> > > >>> should be statically defined and statically verified.
> > > >>>
> > > >>> In this case, if the system configuration knows a priori that the=
re
> > > >>> are only 2 VM and they need to communication over shared memory, =
it
> > > >>> is safer to pre-configure the shared memory at build time rather
> > > >>> than let the VMs attempt to share memory at runtime. It is faster
> too.
> > > >>>
> > > >>> The only way to trigger this static shared memory configuration
> > > >>> should be via device tree, which is at the same level as the XSM
> > > >>> rules themselves.
> > > >>>
> > > >>> Hopefully I made things clearer and not murkier :-)
> > > >>
> > > >> It adds some helpful background, yes, but at the same time it
> doesn't
> > > >> address the security concern at all: How are access permissions
> > > >> managed when the owning domain is a special one? I haven't spotted
> > > >> any recording of the domains which are actually permitted to map /
> > > >> access the pages in questions. (But of course I also only looked a=
t
> > > >> non-Arm-specific code. I'd expect such code not to live in arch-
> > > >> specific files.)
> > > >
> > > > All this static memory sharing is statically done at __init time
> only.
> > > > It should not be possible to trigger any further memory sharing at
> > > > runtime (if there is, that would be a bug).
> > >
> > > Looking at the code, get_pg_owner() will be able to handle
> DOMID_SHARED.
> > > So anyone that is permitted to access DOMID_SHARED will be able to ma=
p
> any
> > > memory region at runtime.
> > >
> > > > There are no new interfaces for the guest to map this memory becaus=
e
> > > > it is already "pre-mapped".
> > >
> > > It can via XENMAPSPACE_gmfn_foreign (assuming proper permission).
> > >
> >
> > Correct me if I'm wrong:
> > The existing XENMAPSPACE_gmfn_foreign only allows privileged Dom0 to ma=
p
> > memory pages from one foreign DomU to itself. So It can happen that Dom=
0
> is
> > using XENMAPSPACE_gmfn_foreign to (maliciously?) access shared memory
> owned
> > by DOMID_SHARED, and for now only Dom0 could.
>
> No, currently there is no protection against dom0 doing malicious
> operations. Dom0 can poweroff the entire system.


This is the classic argument=E2=80=A6 Yes, on a default setup, dom0 is full=
y
trusted today. However there are way to reduce the trust via XSM.

For new interfaces we should also try to avoid  considering dom0 as fully
trusted whenever it is possible. This is one of the example where I think
this should be done. The more if we use DOMID_IO as we may add more than
shared pages there=E2=80=A6


>
> If we are certain that only dom0 (and not other domains) can use
> XENMAPSPACE_gmfn_foreign to access shared memory owned by DOMID_SHARED
> then we are good. Looking at the code, and also considering that we have
> agreed to move to DOMID_IO, get_pg_owner can already handle DOMID_IO.


AFAIK, dom0 cannot map DOMID_IO page for now because get_page_from_gfn
would not work. This would change with this approach.


>
> Next is the xsm_map_gmfn_foreign(XSM_TARGET, d, od) check, which would
> fail unless the asking domain is privileged over the target domain.
> xsm_map_gmfn_foreign would fail for all domains except dom0.


This depends your XSM policy. In this case, think we need to prevent
runtime mapping via the hypercall interface. We can relax it afterwards if
we have use cases for it.


>
> So I think we are OK. I don't think we need to do anything else.



Cheers,
--=20
Julien Grall

--00000000000018e86605dcba0279
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,</div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, 15 Apr 2022 at 22:19, Stefano Stabellini =
&lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;b=
order-left-color:rgb(204,204,204)">On Fri, 15 Apr 2022, Penny Zheng wrote:<=
br>
&gt; &gt; Hi Stefano,<br>
&gt; &gt; <br>
&gt; &gt; On 21/03/2022 20:03, Stefano Stabellini wrote:<br>
&gt; &gt; &gt; On Mon, 21 Mar 2022, Jan Beulich wrote:<br>
&gt; &gt; &gt;&gt; On 18.03.2022 22:50, Stefano Stabellini wrote:<br>
&gt; &gt; &gt;&gt;&gt; On Fri, 18 Mar 2022, Jan Beulich wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt; On 11.03.2022 07:11, Penny Zheng wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; In case to own statically shared pages when =
owner domain is not<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; explicitly defined, this commits propose a s=
pecial domain<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; DOMID_SHARED, and we assign it 0x7FF5, as on=
e of the system domains.<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; Statically shared memory reuses the same way=
 of initialization<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; with static memory, hence this commits propo=
ses a new Kconfig<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; CONFIG_STATIC_SHM to wrap related codes, and=
 this option depends<br>
&gt; &gt; on static memory(CONFIG_STATIC_MEMORY).<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; We intends to do shared domain creation afte=
r setup_virt_paging so<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; shared domain could successfully do p2m init=
ialization.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; There&#39;s nothing said here, in the earlier pa=
tch, or in the cover<br>
&gt; &gt; &gt;&gt;&gt;&gt; letter about the security aspects of this. There=
 is a reason we<br>
&gt; &gt; &gt;&gt;&gt;&gt; haven&#39;t been allowing arbitrary, un-supervis=
ed sharing of memory<br>
&gt; &gt; &gt;&gt;&gt;&gt; between domains. It wants clarifying why e.g. gr=
ants aren&#39;t an<br>
&gt; &gt; &gt;&gt;&gt;&gt; option to achieve what you need, and how you mea=
n to establish<br>
&gt; &gt; &gt;&gt;&gt;&gt; which domains are / aren&#39;t permitted to acce=
ss any individual page<br>
&gt; &gt; owned by this domain.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; I&#39;ll let Penny write a full reply but I&#39;ll c=
hime in to try to help<br>
&gt; &gt; &gt;&gt;&gt; with the explanation.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; This is not arbitrary un-supervised sharing of memor=
y between<br>
&gt; &gt; &gt;&gt;&gt; domains, which indeed is concerning.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; This is statically-configured, supervised by the sys=
tem<br>
&gt; &gt; &gt;&gt;&gt; configurator, sharing of memory between domains.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; And in fact safety (which is just a different aspect=
 of security) is<br>
&gt; &gt; &gt;&gt;&gt; one of the primary goals for this work.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; In safety-critical environments, it is not considere=
d safe to<br>
&gt; &gt; &gt;&gt;&gt; dynamically change important configurations at runti=
me. Everything<br>
&gt; &gt; &gt;&gt;&gt; should be statically defined and statically verified=
.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; In this case, if the system configuration knows a pr=
iori that there<br>
&gt; &gt; &gt;&gt;&gt; are only 2 VM and they need to communication over sh=
ared memory, it<br>
&gt; &gt; &gt;&gt;&gt; is safer to pre-configure the shared memory at build=
 time rather<br>
&gt; &gt; &gt;&gt;&gt; than let the VMs attempt to share memory at runtime.=
 It is faster too.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; The only way to trigger this static shared memory co=
nfiguration<br>
&gt; &gt; &gt;&gt;&gt; should be via device tree, which is at the same leve=
l as the XSM<br>
&gt; &gt; &gt;&gt;&gt; rules themselves.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Hopefully I made things clearer and not murkier :-)<=
br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; It adds some helpful background, yes, but at the same ti=
me it doesn&#39;t<br>
&gt; &gt; &gt;&gt; address the security concern at all: How are access perm=
issions<br>
&gt; &gt; &gt;&gt; managed when the owning domain is a special one? I haven=
&#39;t spotted<br>
&gt; &gt; &gt;&gt; any recording of the domains which are actually permitte=
d to map /<br>
&gt; &gt; &gt;&gt; access the pages in questions. (But of course I also onl=
y looked at<br>
&gt; &gt; &gt;&gt; non-Arm-specific code. I&#39;d expect such code not to l=
ive in arch-<br>
&gt; &gt; &gt;&gt; specific files.)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; All this static memory sharing is statically done at __init =
time only.<br>
&gt; &gt; &gt; It should not be possible to trigger any further memory shar=
ing at<br>
&gt; &gt; &gt; runtime (if there is, that would be a bug).<br>
&gt; &gt; <br>
&gt; &gt; Looking at the code, get_pg_owner() will be able to handle DOMID_=
SHARED.<br>
&gt; &gt; So anyone that is permitted to access DOMID_SHARED will be able t=
o map any<br>
&gt; &gt; memory region at runtime.<br>
&gt; &gt; <br>
&gt; &gt; &gt; There are no new interfaces for the guest to map this memory=
 because<br>
&gt; &gt; &gt; it is already &quot;pre-mapped&quot;.<br>
&gt; &gt; <br>
&gt; &gt; It can via XENMAPSPACE_gmfn_foreign (assuming proper permission).=
<br>
&gt; &gt; <br>
&gt; <br>
&gt; Correct me if I&#39;m wrong:<br>
&gt; The existing XENMAPSPACE_gmfn_foreign only allows privileged Dom0 to m=
ap<br>
&gt; memory pages from one foreign DomU to itself. So It can happen that Do=
m0 is<br>
&gt; using XENMAPSPACE_gmfn_foreign to (maliciously?) access shared memory =
owned<br>
&gt; by DOMID_SHARED, and for now only Dom0 could.<br>
<br>
No, currently there is no protection against dom0 doing malicious<br>
operations. Dom0 can poweroff the entire system.</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">This is the classic argument=E2=80=A6 Yes, =
on a default setup, dom0 is fully trusted today. However there are way to r=
educe the trust via XSM.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>For new interfaces we should also try to avoid =C2=A0considering dom0 as f=
ully trusted whenever it is possible. This is one of the example where I th=
ink this should be done. The more if we use DOMID_IO as we may add more tha=
n shared pages there=E2=80=A6</div><div dir=3D"auto"><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,2=
04)" dir=3D"auto"><br>
<br>
If we are certain that only dom0 (and not other domains) can use<br>
XENMAPSPACE_gmfn_foreign to access shared memory owned by DOMID_SHARED<br>
then we are good. Looking at the code, and also considering that we have<br=
>
agreed to move to DOMID_IO, get_pg_owner can already handle DOMID_IO.</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto"><span style=3D"border-=
color:rgb(0,0,0);color:rgb(0,0,0)">AFAIK, dom0 cannot map DOMID_IO page for=
 now because get_page_from_gfn would not work. This would change with this =
approach.</span><br></div><div dir=3D"auto"><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:=
1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Next is the xsm_map_gmfn_foreign(XSM_TARGET, d, od) check, which would<br>
fail unless the asking domain is privileged over the target domain.<br>
xsm_map_gmfn_foreign would fail for all domains except dom0.</blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">This depends your XSM policy. I=
n this case, think we need to prevent runtime mapping via the hypercall int=
erface. We can relax it afterwards if we have use cases for it.<br></div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
So I think we are OK. I don&#39;t think we need to do anything else.</block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Cheers,</div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature">Julien Grall</div>

--00000000000018e86605dcba0279--

