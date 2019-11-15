Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF54FE12B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:26:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdT3-0004eL-Di; Fri, 15 Nov 2019 15:25:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKyS=ZH=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iVdT2-0004eE-6l
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:25:00 +0000
X-Inumbo-ID: 15934b70-07bc-11ea-9631-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15934b70-07bc-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 15:24:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 139so11127952ljf.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jec1oPh9FSDk+gKd4XmE+TMF9cGU1nU/mXGD2B73/2o=;
 b=LCkVD/bYUjK7y1pmD1UzdoJzTW/simpvjQ+1prEHcVYz1KMq8+YkP4PNImV80HNm5F
 EIT+AAI2RcYTXyu5SjgBvx/X+uUkh0M2Fv8g5uf6bI7PahinYRasK/oB8ZcDX2ILuLCD
 hVXNecgS/v3aFk4X6Wxu3DaJ46YYgTZW/8Sp7pcbmNsTsGMEz0Pe1JuSsmk27kfI2zP4
 LR2GstlK9IvUaScY2ntYX/WUfjdDUZcMiAf51k6ite9yEWXXhzBXUVHAKEhCldsxfmeV
 QmRSkoogIsqz+U+791WzrO+Ul05CBOkiRlme/e3t4xlWnd62FPmhrtGI56Q9R5O1/OXg
 h4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jec1oPh9FSDk+gKd4XmE+TMF9cGU1nU/mXGD2B73/2o=;
 b=QhDH4rfflhHuqPXIIyAP1puwHNgE7CT+l7pazuexGHMTXaheloyAcBE08g14Slmy/b
 v5C1CMP6A5rCxuiiUy//RDpjPzJjt1CS+51IQou5xe3/hA4PAiOMC8UsOjz87Dy5nW5D
 szFIKNAydi0YHvXOufVCpqwk8DTf3o1FwNm/+YQFShGw120WK9hXAxJ2nv/7JzqCRZ/f
 gmmLNyLrod6r0b0pBlj8v8eo4rVw29gOk2PZRK0YdH0wXHynl4b4fIKFKTSCr9FN+fVx
 AaxQlo1o9JMCjdkcWLopc/TN1jYhXNYMJgVzKwrbRf1foykTrTk/g4dyOO7ALs1mjG5S
 nReA==
X-Gm-Message-State: APjAAAWrxcZ5kSRgY5mqEW/Q4p8ks8WRkZCYsf0iGPsjQZANoW4ZkAOs
 fDI15wdSVeqJ3U82LmXrVxl6t+V5Em8/uRSdEOs=
X-Google-Smtp-Source: APXvYqy/EphaNIYXv3wJr3QFZ+p5gVucmTxvhGl0jD+cJvFwCs7rqoDoOxzH51btTWb2xbsul938/kcvKzm7Rl6DAXE=
X-Received: by 2002:a2e:81c1:: with SMTP id s1mr11581117ljg.83.1573831498179; 
 Fri, 15 Nov 2019 07:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20191031192804.19928-1-andrew.cooper3@citrix.com>
 <7bd1d625-d501-6ca7-f951-9f42066436bd@arm.com>
 <ebfea524-2ae1-8e83-3217-bc0d84ab902c@citrix.com>
In-Reply-To: <ebfea524-2ae1-8e83-3217-bc0d84ab902c@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 15 Nov 2019 18:24:45 +0300
Message-ID: <CAJ=z9a2p1Pjm5Oadq+eP6YjNpCh6WK-aWosuf-7Z0wqSw6KAag@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Sanitise VCPUOP_initialise call
 hierachy
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7157232857558338652=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7157232857558338652==
Content-Type: multipart/alternative; boundary="00000000000062a9850597643339"

--00000000000062a9850597643339
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Nov 2019, 18:13 Andrew Cooper, <andrew.cooper3@citrix.com> wrote:

> On 31/10/2019 21:25, Julien Grall wrote:
> > Hi,
> >
> > On 31/10/2019 19:28, Andrew Cooper wrote:
> >> This code is especially tangled.  VCPUOP_initialise calls into
> >> arch_initialise_vcpu() which calls back into default_initialise_vcpu()
> which
> >> is common code.
> >>
> >> This path is actually dead code on ARM, because VCPUOP_initialise is
> filtered
> >> out by do_arm_vcpu_op().
> >>
> >> The only valid way to start a secondary CPU on ARM is via the PSCI
> interface.
> >> The same could in principle be said about INIT-SIPI-SIPI for x86 HVM,
> if HVM
> >> guests hadn't already interited a paravirt way of starting CPUs.
> >>
> >> Either way, it is quite likely that no future architectures implemented
> in Xen
> >> are going to want to use a PV interface, as some standardised (v)CPU
> bringup
> >> mechanism will already exist.
> > I am not sure I agree here. Looking at Linux RISCv code (see [1] and
> > [2]), it looks like the kernel has to deal with selecting one "lucky"
> > CPU/hart to deal with the boot and park all the others.
> >
> > So it looks like to me there are nothing at the moment on RISCv to do
> > (v)CPU bring-up. We might be able to use PSCI (although this is an ARM
> > specific way), but would rather wait and see what RISCv folks come up
> > with before deciding PV is never going to be used.
>
> Nothing here prohibits other architectures from using a PV interface if
> they wish.
>

Well, your commit message and the code movement implies that nobody will
ever use it.


> However, your examples prove my point.  There is an already-agreed way
> to start RISCv CPUs which is not a PV interface, and therefore is very
> unlikely to adopted to run differently under Xen.


I would not call that a way to start CPUs because AFAICT all CPUs have to
be brought up together and you can't offline them. This is fairly
restrictive for a guest so I don't think reusing it would sustainable long
term.

FWIW, this is exactly what Arm used to have before PSCI.

Cheers,


~Andrew
>

--00000000000062a9850597643339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 15 Nov 2019, 18:13 Andrew Cooper, &lt;<a href=
=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On 31/10/2019 21:25, Julien Gra=
ll wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On 31/10/2019 19:28, Andrew Cooper wrote:<br>
&gt;&gt; This code is especially tangled.=C2=A0 VCPUOP_initialise calls int=
o<br>
&gt;&gt; arch_initialise_vcpu() which calls back into default_initialise_vc=
pu() which<br>
&gt;&gt; is common code.<br>
&gt;&gt;<br>
&gt;&gt; This path is actually dead code on ARM, because VCPUOP_initialise =
is filtered<br>
&gt;&gt; out by do_arm_vcpu_op().<br>
&gt;&gt;<br>
&gt;&gt; The only valid way to start a secondary CPU on ARM is via the PSCI=
 interface.<br>
&gt;&gt; The same could in principle be said about INIT-SIPI-SIPI for x86 H=
VM, if HVM<br>
&gt;&gt; guests hadn&#39;t already interited a paravirt way of starting CPU=
s.<br>
&gt;&gt;<br>
&gt;&gt; Either way, it is quite likely that no future architectures implem=
ented in Xen<br>
&gt;&gt; are going to want to use a PV interface, as some standardised (v)C=
PU bringup<br>
&gt;&gt; mechanism will already exist.<br>
&gt; I am not sure I agree here. Looking at Linux RISCv code (see [1] and <=
br>
&gt; [2]), it looks like the kernel has to deal with selecting one &quot;lu=
cky&quot; <br>
&gt; CPU/hart to deal with the boot and park all the others.<br>
&gt;<br>
&gt; So it looks like to me there are nothing at the moment on RISCv to do =
<br>
&gt; (v)CPU bring-up. We might be able to use PSCI (although this is an ARM=
 <br>
&gt; specific way), but would rather wait and see what RISCv folks come up =
<br>
&gt; with before deciding PV is never going to be used.<br>
<br>
Nothing here prohibits other architectures from using a PV interface if<br>
they wish.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Well, your commit message and the code movement implies that nobo=
dy will ever use it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
However, your examples prove my point.=C2=A0 There is an already-agreed way=
<br>
to start RISCv CPUs which is not a PV interface, and therefore is very<br>
unlikely to adopted to run differently under Xen.</blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I would not call that a way to=
 start CPUs because AFAICT all CPUs have to be brought up together and you =
can&#39;t offline them. This is fairly restrictive for a guest so I don&#39=
;t think reusing it would sustainable long term.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">FWIW, this is exactly what Arm used to have before=
 PSCI.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div=
 dir=3D"auto"></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
~Andrew<br>
</blockquote></div></div></div>

--00000000000062a9850597643339--


--===============7157232857558338652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7157232857558338652==--

