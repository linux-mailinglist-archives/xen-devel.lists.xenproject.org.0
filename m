Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF274B36B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 16:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560541.876532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHmtI-0001l3-P6; Fri, 07 Jul 2023 14:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560541.876532; Fri, 07 Jul 2023 14:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHmtI-0001jB-Ls; Fri, 07 Jul 2023 14:57:00 +0000
Received: by outflank-mailman (input) for mailman id 560541;
 Fri, 07 Jul 2023 14:56:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jVP=CZ=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qHmtH-0001j5-Jt
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 14:56:59 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85745510-1cd6-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 16:56:58 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso3079375e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 07:56:58 -0700 (PDT)
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
X-Inumbo-ID: 85745510-1cd6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688741818; x=1691333818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ENT77DCi7Bc/endKOwtZAmoKVPICn79foL+YGOOThFo=;
        b=NR0wOoBW2yXFtSt4YmIrJn7MWVGK///qysUvtTkiiMKvuR8NCZetjtPKJpnQ55J24u
         YJrIWIU9ShzfKCL/iUdHUEtzqw6QZJ4WN4yv0vN0SVTGo/s+ZO/M4tICIv9987Jh/IT6
         wMnCEZ7V51ObClZJW73zh+WjNjYyWZVpDZ7eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688741818; x=1691333818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENT77DCi7Bc/endKOwtZAmoKVPICn79foL+YGOOThFo=;
        b=YccmM6Z7EwEz46afJGKuziNIuFjXyMUPMNkxsEKK5uCaNFnpcU0JmeUrlGlwwSMGPD
         2eRGva/kJ7OzfAHuIV9EHZrbVeLTBlOHDET+cL5kwh3JP9rf08ao4LRA9V3XSsttCFRY
         PR1n6sKtGEdpRBF0nHYZbWOmUe3+Z57zWggKsn8w+k/VUJgdV4DK0Co9Fyqqel4auBpp
         3//6l2v4bhoKKZUpCxESrxUUUlV2tUyBRadUQdmx1xLDyuCvHoYbqHuDvKEUuXvPcwo9
         Zqczno9QeYPMIb+LK6e1LlMzaYXyt7Y8AnGKzc56PgG9BHzh5hsD/MOnWpEuwnI2tgc/
         xc0g==
X-Gm-Message-State: ABy/qLYS91/kwzJfNxir801cQo3OJmuzDfI7/gxcwQZtsXV28tO+niO2
	l837HmT5HG0zn5EbD8fdOvk9x1cuMXvN7c+Bnu1Rgr6yD8kI4wy6
X-Google-Smtp-Source: APBJJlHmHaVqTji7KmGtx+yH7cE5FpqtxBSu/U6uKKogS0970IQdwZ2n/d7w7b6YAbqS+6v5gOHhde/dhIYVqIF3MQ4=
X-Received: by 2002:ac2:4f0d:0:b0:4f8:5717:e421 with SMTP id
 k13-20020ac24f0d000000b004f85717e421mr4840953lfr.40.1688741817737; Fri, 07
 Jul 2023 07:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu> <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu> <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
 <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com> <28e2fc47-aada-e394-35b3-252bd1c6d720@suse.com>
In-Reply-To: <28e2fc47-aada-e394-35b3-252bd1c6d720@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 7 Jul 2023 15:56:46 +0100
Message-ID: <CA+zSX=bCC8A06t_gSpYCjxG1BZoC2EWnHhYAQtTM6b0WyzyZNA@mail.gmail.com>
Subject: Re: Detecting whether dom0 is in a VM
To: Jan Beulich <jbeulich@suse.com>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000029f6f505ffe6d8da"

--00000000000029f6f505ffe6d8da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 7, 2023 at 12:45=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 07.07.2023 12:16, Jan Beulich wrote:
> > On 07.07.2023 11:52, George Dunlap wrote:
> >> On Fri, Jul 7, 2023 at 9:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >>> On 06.07.2023 17:35, zithro wrote:
> >>>> On 06 Jul 2023 09:02, Jan Beulich wrote:
> >>>>> On 05.07.2023 18:20, zithro wrote:
> >>>>>> So I'm wondering, isn't that path enough for correct detection ?
> >>>>>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or
> any
> >>>>>> other known hypervisor), it's nested, otherwise it's on hardware ?
> >>>>>>
> >>>>>> Is that really mandatory to use CPUID leaves ?
> >>>>>
> >>>>> Let me ask the other way around: In user mode code under a non-nest=
ed
> >>>>> vs nested Xen, what would you be able to derive from CPUID? The
> >>>>> "hypervisor" bit is going to be set in both cases. (All assuming yo=
u
> >>>>> run on new enough hardware+Xen such that CPUID would be intercepted
> >>>>> even for PV.)
> >>>>
> >>>> I'm a bit clueless about CPUID stuff, but if I understand correctly,
> >>>> you're essentially saying that using CPUID may not be the perfect wa=
y
> ?
> >>>> Also, I don't get why the cpuid command returns two different values=
,
> >>>> depending on the -k switch :
> >>>> # cpuid -l 0x40000000
> >>>> hypervisor_id (0x40000000) =3D "\0\0\0\0\0\0\0\0\0\0\0\0"
> >>>> # cpuid -k -l 0x40000000
> >>>> hypervisor_id (0x40000000) =3D "XenVMMXenVMM"
> >>>
> >>> I'm afraid I can't comment on this without knowing what tool you're
> >>> taking about. Neither of the two systems I checked have one of this
> >>> name.
> >>>
> >>>>> Yet relying on DMI is fragile, too: Along the lines of
> >>>>> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
> >>>>> basically any value in there could be "inherited" from the host (i.=
e.
> >>>>> from the layer below, to be precise).
> >>>>
> >>>> So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | gr=
ep
> >>>> DMI:" is also not perfect, as values can be inherited/spoofed by
> >>>> underneath hypervisor ?
> >>>
> >>> That's my understanding, yes.
> >>>
> >>>>> The only way to be reasonably
> >>>>> certain is to ask Xen about its view. The raw or host featuresets
> >>>>> should give you this information, in the "mirror" of said respectiv=
e
> >>>>> CPUID leave's "hypervisor" bit.
> >>>>
> >>>> As said above, I'm clueless, can you expand please ?
> >>>
> >>> Xen's public interface offers access to the featuresets known / found=
 /
> >>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
> >>> via xc_get_cpu_featureset().
> >>>
> >>
> >> Are any of these exposed in dom0 via sysctl, or hypfs?
> >
> > sysctl - yes (as the quoted name also says). hypfs no, afaict.
> >
> >>  SYSCTLs are
> >> unfortunately not stable interfaces, correct?  So it wouldn't be
> practical
> >> for systemd to use them.
> >
> > Indeed, neither sysctl-s nor the libxc interfaces are stable.
>
> Thinking of it, xen-cpuid is a wrapper tool around those. They may want
> to look at its output (and, if they want to use it, advise distros to
> also package it), which I think we try to keep reasonably stable,
> albeit without providing any guarantees.
>

We haven't had any clear guidance yet on what the systemd team want in the
<xen in a VM, systemd in a dom0> question; I just sort of assumed they
wanted the L-1 virtualization *if possible*.  It sounds like `vm-other`
would be acceptable, particularly as a fall-back output if there's no way
to get Xen's picture of the cpuid.

It looks like xen-cpuid is available on Fedora, Debian, Ubuntu, and the old
Virt SIG CentOS packages; so I'd expect most packages to follow suit.
That's a place to start.

Just to take the discussion all the way to its conclusion:

- Supposing xen-cpuid isn't available, is there any other way to tell if
Xen is running in a VM from dom0?

- Would it make sense to expose that information somewhere, either in sysfs
or in hypfs (or both?), so that eventually even systems which may not get
the memo about packaging xen-cpuid will get support (or if the systemd guys
would rather avoid executing another process if possible)?

 -George

--00000000000029f6f505ffe6d8da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 7, 2023 at 12:45=E2=80=AF=
PM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 07.07.2023 12:16, Jan Beulich wrote:<br>
&gt; On 07.07.2023 11:52, George Dunlap wrote:<br>
&gt;&gt; On Fri, Jul 7, 2023 at 9:00=E2=80=AFAM Jan Beulich &lt;<a href=3D"=
mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On 06.07.2023 17:35, zithro wrote:<br>
&gt;&gt;&gt;&gt; On 06 Jul 2023 09:02, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 05.07.2023 18:20, zithro wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; So I&#39;m wondering, isn&#39;t that path enough f=
or correct detection ?<br>
&gt;&gt;&gt;&gt;&gt;&gt; I mean, if &quot;/sys/class/dmi/id/sys_vendor&quot=
; reports Xen (or KVM, or any<br>
&gt;&gt;&gt;&gt;&gt;&gt; other known hypervisor), it&#39;s nested, otherwis=
e it&#39;s on hardware ?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Is that really mandatory to use CPUID leaves ?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Let me ask the other way around: In user mode code und=
er a non-nested<br>
&gt;&gt;&gt;&gt;&gt; vs nested Xen, what would you be able to derive from C=
PUID? The<br>
&gt;&gt;&gt;&gt;&gt; &quot;hypervisor&quot; bit is going to be set in both =
cases. (All assuming you<br>
&gt;&gt;&gt;&gt;&gt; run on new enough hardware+Xen such that CPUID would b=
e intercepted<br>
&gt;&gt;&gt;&gt;&gt; even for PV.)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m a bit clueless about CPUID stuff, but if I underst=
and correctly,<br>
&gt;&gt;&gt;&gt; you&#39;re essentially saying that using CPUID may not be =
the perfect way ?<br>
&gt;&gt;&gt;&gt; Also, I don&#39;t get why the cpuid command returns two di=
fferent values,<br>
&gt;&gt;&gt;&gt; depending on the -k switch :<br>
&gt;&gt;&gt;&gt; # cpuid -l 0x40000000<br>
&gt;&gt;&gt;&gt; hypervisor_id (0x40000000) =3D &quot;\0\0\0\0\0\0\0\0\0\0\=
0\0&quot;<br>
&gt;&gt;&gt;&gt; # cpuid -k -l 0x40000000<br>
&gt;&gt;&gt;&gt; hypervisor_id (0x40000000) =3D &quot;XenVMMXenVMM&quot;<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m afraid I can&#39;t comment on this without knowing wha=
t tool you&#39;re<br>
&gt;&gt;&gt; taking about. Neither of the two systems I checked have one of=
 this<br>
&gt;&gt;&gt; name.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Yet relying on DMI is fragile, too: Along the lines of=
<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"https://lists.xen.org/archives/html/xen-dev=
el/2022-01/msg00604.html" rel=3D"noreferrer" target=3D"_blank">https://list=
s.xen.org/archives/html/xen-devel/2022-01/msg00604.html</a><br>
&gt;&gt;&gt;&gt;&gt; basically any value in there could be &quot;inherited&=
quot; from the host (i.e.<br>
&gt;&gt;&gt;&gt;&gt; from the layer below, to be precise).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; So using &quot;/sys/class/dmi/id/sys_vendor&quot;, or simp=
ly doing &quot;dmesg | grep<br>
&gt;&gt;&gt;&gt; DMI:&quot; is also not perfect, as values can be inherited=
/spoofed by<br>
&gt;&gt;&gt;&gt; underneath hypervisor ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; That&#39;s my understanding, yes.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; The only way to be reasonably<br>
&gt;&gt;&gt;&gt;&gt; certain is to ask Xen about its view. The raw or host =
featuresets<br>
&gt;&gt;&gt;&gt;&gt; should give you this information, in the &quot;mirror&=
quot; of said respective<br>
&gt;&gt;&gt;&gt;&gt; CPUID leave&#39;s &quot;hypervisor&quot; bit.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; As said above, I&#39;m clueless, can you expand please ?<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Xen&#39;s public interface offers access to the featuresets kn=
own / found /<br>
&gt;&gt;&gt; used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, acc=
essible<br>
&gt;&gt;&gt; via xc_get_cpu_featureset().<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Are any of these exposed in dom0 via sysctl, or hypfs?<br>
&gt; <br>
&gt; sysctl - yes (as the quoted name also says). hypfs no, afaict.<br>
&gt; <br>
&gt;&gt;=C2=A0 SYSCTLs are<br>
&gt;&gt; unfortunately not stable interfaces, correct?=C2=A0 So it wouldn&#=
39;t be practical<br>
&gt;&gt; for systemd to use them.<br>
&gt; <br>
&gt; Indeed, neither sysctl-s nor the libxc interfaces are stable.<br>
<br>
Thinking of it, xen-cpuid is a wrapper tool around those. They may want<br>
to look at its output (and, if they want to use it, advise distros to<br>
also package it), which I think we try to keep reasonably stable,<br>
albeit without providing any guarantees.<br></blockquote><div><br></div><di=
v>We haven&#39;t had any clear guidance yet on what the systemd team want i=
n the &lt;xen in a VM, systemd in a dom0&gt; question; I just sort of assum=
ed they wanted the L-1 virtualization *if possible*.=C2=A0 It sounds like `=
vm-other` would be acceptable, particularly as a fall-back output if there&=
#39;s no way to get Xen&#39;s picture of the cpuid.<br></div><div><br></div=
><div>It looks like xen-cpuid is available on Fedora, Debian, Ubuntu, and t=
he old Virt SIG CentOS packages; so I&#39;d expect most packages to follow =
suit.=C2=A0 That&#39;s a place to start.</div><div><br></div><div>Just to t=
ake the discussion all the way to its conclusion:</div><div><br></div><div>=
- Supposing xen-cpuid isn&#39;t available, is there any other way to tell i=
f Xen is running in a VM from dom0?</div><div><br></div><div>- Would it mak=
e sense to expose that information somewhere, either in sysfs or in hypfs (=
or both?), so that eventually even systems which may not get the memo about=
 packaging xen-cpuid will get support (or if the systemd guys would rather =
avoid executing another process if possible)?<br></div><div><br></div><div>=
=C2=A0-George</div><div><br></div><div><br></div></div></div>

--00000000000029f6f505ffe6d8da--

