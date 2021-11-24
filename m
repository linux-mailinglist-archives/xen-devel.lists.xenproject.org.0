Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E745C14A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 14:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230426.398314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mps4S-0004C3-OD; Wed, 24 Nov 2021 13:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230426.398314; Wed, 24 Nov 2021 13:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mps4S-0004A6-KS; Wed, 24 Nov 2021 13:12:20 +0000
Received: by outflank-mailman (input) for mailman id 230426;
 Wed, 24 Nov 2021 13:12:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lasZ=QL=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1mps4R-00049z-Oc
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 13:12:19 +0000
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25015e81-4d28-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 14:12:17 +0100 (CET)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 29DB318000B1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 08:12:15 -0500 (EST)
Received: from mail-yb1-f175.google.com (unknown [10.20.151.240])
 by mta-13.privateemail.com (Postfix) with ESMTPA id F040A18000A2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 08:12:14 -0500 (EST)
Received: by mail-yb1-f175.google.com with SMTP id j2so7102280ybg.9
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 05:12:14 -0800 (PST)
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
X-Inumbo-ID: 25015e81-4d28-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1637759535;
	bh=j9iqeZ1RcITXqsk/P/39M774nS7TsodgPIFyvWoc3YA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nTKVxcbDMqi6L34qnxSlEaZ82H06e01LESQXR0hDZr55sg1w2Xpr8jPECmCesK/L5
	 7su8TKMgIgiu/CdRyhlpuYEWuMmhCAAHLhdSZsY7gypzPdcRNVSgiBxOu+29NDKx0H
	 9Bhv0rcS8pWDy0sPgxCFZpbebbz8mEkvUuIw+VxIpYpi53sUvd83BdV8Yeb6CUsiZB
	 GTvaGMptvebB0+GH4aOM8hD4tdu/QqpRWQwOa9kwMd+7r3ub8TTQKzXeCd+McDjdIX
	 ORvMNY0z2gOftr0CiWqbuE4onPumCh+JBLG75Sf3Ih0QQq3iFGgP4M7QT1zuqIv6OI
	 km3jfJyLW+jBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1637759535;
	bh=j9iqeZ1RcITXqsk/P/39M774nS7TsodgPIFyvWoc3YA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nTKVxcbDMqi6L34qnxSlEaZ82H06e01LESQXR0hDZr55sg1w2Xpr8jPECmCesK/L5
	 7su8TKMgIgiu/CdRyhlpuYEWuMmhCAAHLhdSZsY7gypzPdcRNVSgiBxOu+29NDKx0H
	 9Bhv0rcS8pWDy0sPgxCFZpbebbz8mEkvUuIw+VxIpYpi53sUvd83BdV8Yeb6CUsiZB
	 GTvaGMptvebB0+GH4aOM8hD4tdu/QqpRWQwOa9kwMd+7r3ub8TTQKzXeCd+McDjdIX
	 ORvMNY0z2gOftr0CiWqbuE4onPumCh+JBLG75Sf3Ih0QQq3iFGgP4M7QT1zuqIv6OI
	 km3jfJyLW+jBQ==
X-Gm-Message-State: AOAM531sKTl+z2HJimBNW4KF+i2VjCfgrMXaO2vYLLFro15w4mZ19kpH
	oTKn0iYRTT4R41IzftuL5UvuJCdWRDIEXgHeZ08=
X-Google-Smtp-Source: ABdhPJz+2MhfcNTLMHgIeHy9k7JvbaolyyHy2tTggHtcItEQQBZdEvPHxha+w7q1ClmzwGp5ewjzsV84/2YcTjgpWfQ=
X-Received: by 2002:a25:d895:: with SMTP id p143mr15651203ybg.513.1637759534134;
 Wed, 24 Nov 2021 05:12:14 -0800 (PST)
MIME-Version: 1.0
References: <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <ad9abcb1-0a17-644b-5338-8c305e9ce4b4@suse.com> <OS3P286MB19953CFD3B3D4B2B71261DD9B3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <1b6ae1da-a9be-2e37-e993-05f1bb095f80@suse.com> <OS3P286MB1995A04EFEE65E1FBC735FDFB3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <OS3P286MB1995A04EFEE65E1FBC735FDFB3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 24 Nov 2021 08:12:02 -0500
X-Gmail-Original-Message-ID: <CABfawhmsNf3fEw6nheSR40UpHKuX39AqxU0EG+FEaQUVY+gVog@mail.gmail.com>
Message-ID: <CABfawhmsNf3fEw6nheSR40UpHKuX39AqxU0EG+FEaQUVY+gVog@mail.gmail.com>
Subject: Re: About support for memory event on AMD CPUs
To: Untitled YAN <yanluyi2010@hotmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000427a3f05d1889bd4"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000427a3f05d1889bd4
Content-Type: text/plain; charset="UTF-8"

Altp2m is only available on Intel, mem_access (restricting permissions) is
only available on Intel and ARM. No technical reason for it not working on
AMD, it just hasn't been implemented in Xen.

Tamas

On Wed, Nov 24, 2021, 4:44 AM Untitled YAN <yanluyi2010@hotmail.com> wrote:

> Original email:
>
> From: Jan Beulich <jbeulich@suse.com>
> Sent: Wednesday, November 24, 2021 17:27
> To: Untitled YAN <yanluyi2010@hotmail.com>
> Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.com <
> aisaila@bitdefender.com>; ppircalabu@bitdefender.com <
> ppircalabu@bitdefender.com>; xen-devel@lists.xenproject.org <
> xen-devel@lists.xenproject.org>
> Subject: Re: About support for memory event on AMD CPUs
>
> > On 24.11.2021 10:23, Untitled YAN wrote:
> > > Original email:
> > >
> > > From: Jan Beulich <jbeulich@suse.com>
> > > Sent: Wednesday, November 24, 2021 15:54
> > > To: YAN Untitled <yanluyi2010@hotmail.com>
> > > Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.com
> <aisaila@bitdefender.com>; ppircalabu@bitdefender.com <
> ppircalabu@bitdefender.com>; xen-devel@lists.xenproject.org
> <xen-devel@lists.x enproject.>org>
> > > Subject: Re: About support for memory event on AMD CPUs
> > >
> > >> On 23.11.2021 18:14, YAN Untitled wrote:
> > >>> Dear developers,
> > >>>
> > >>> Short version: is memory event supported on AMD CPUs or is it going
> to be
> > >>> supported?
> > >>>
> > >>> Long version:
> > >>>
> > >>> Environment: LibVMI 0.15.0 + Xen 4.14.3 on an **AMD CPU** (5950x),
> 64-bit
> > >>> Debian 11 Dom0.
> > >>>
> > >>> What I am trying to accomplish: register a **memory event** handler,
> so that
> > >>> I can capture all memory accesses within a specific range issued by
> any thread,
> > >>> or all memory accesses within any range issued by a specific thread.
> > >>>
> > >>> What I got instead: an error from LibVMI saying
> > >>> "xc_hvm_set_mem_access failed with code: -1".
> > >>>
> > >>> Some investigation: by inspecting the source code of LibVMI, I find
> the direct
> > >>> cause is one of the libxc functions, 1) xc_set_mem_access or
> > >>> 2) xc_altp2m_set_mem_access, returned error code -1.
> > >>>
> > >>> After some searching, I found someone else having a similar problem
> [1]. I also
> > >>> noted LibVMI says:
> > >>>
> > >>>> Currently only the Xen Hypervisor provides these features,
> > >>>> and some of these are specifically only available on Intel CPUs
> > >>>
> > >>> However, I can't find the exact confirmation for the availability of
> memory
> > >>> event on AMD CPUs from https://wiki.xenproject.org.
> > >>
> > >> Aiui underlying what you want is altp2m, which presently depends (in
> > >> the hypervisor) on EPT being available (and in use for the guest in
> > >> question).
> > >>
> > >> Jan
> > >
> > > Dear Jan,
> > >
> > > Thanks for your reply. I really appreciate the information. After some
> > > searching with the keyword "EPT" I found [1]. So I checked on dom0 with
> > > "xl dmesg | grep HAP", which says:
> > >
> > >> (XEN) HVM: Hardware Assisted Paging (HAP) detected
> > >> (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
> > >
> > > And the guest is an HVM guest running Debian 10 with kernel v4.16
> built from
> > > source. Most of the configuration of the guest is generated by
> virt-manager.
> > > The "xl list -l" shows that there is no explicit configuration for
> EPT, RVI or
> > > HAP, but it does say the "type" is "hvm".
> >
> > HAP is the term covering EPT on the Intel side and NPT for AMD.
> >
> > Jan
>
> Dear Jan,
>
> Yeah that's why I wanted to confirm if the HAP is enabled for the guest -
> it
> turns out it is enabled but for some reason, xc_altp2m_set_mem_access
> failed.
> I am trying to replicate my setup on an Intel machine to find out if it's a
> configuration problem. Still don't know if it's implemented for AMD but
> thanks
> for your help and information.
>
>
> Untitled YAN
>

--000000000000427a3f05d1889bd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Altp2m is only available on Intel, mem_access (restr=
icting permissions) is only available on Intel and ARM. No technical reason=
 for it not working on AMD, it just hasn&#39;t been implemented in Xen.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Tamas<br><br><div class=3D"=
gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov=
 24, 2021, 4:44 AM Untitled YAN &lt;<a href=3D"mailto:yanluyi2010@hotmail.c=
om">yanluyi2010@hotmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Original email:<br>
<br>
From: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank=
" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;<br>
Sent: Wednesday, November 24, 2021 17:27<br>
To: Untitled YAN &lt;<a href=3D"mailto:yanluyi2010@hotmail.com" target=3D"_=
blank" rel=3D"noreferrer">yanluyi2010@hotmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:tamas@tklengyel.com" target=3D"_blank" rel=3D"norefer=
rer">tamas@tklengyel.com</a> &lt;<a href=3D"mailto:tamas@tklengyel.com" tar=
get=3D"_blank" rel=3D"noreferrer">tamas@tklengyel.com</a>&gt;; <a href=3D"m=
ailto:aisaila@bitdefender.com" target=3D"_blank" rel=3D"noreferrer">aisaila=
@bitdefender.com</a> &lt;<a href=3D"mailto:aisaila@bitdefender.com" target=
=3D"_blank" rel=3D"noreferrer">aisaila@bitdefender.com</a>&gt;; <a href=3D"=
mailto:ppircalabu@bitdefender.com" target=3D"_blank" rel=3D"noreferrer">ppi=
rcalabu@bitdefender.com</a> &lt;<a href=3D"mailto:ppircalabu@bitdefender.co=
m" target=3D"_blank" rel=3D"noreferrer">ppircalabu@bitdefender.com</a>&gt;;=
 <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D=
"noreferrer">xen-devel@lists.xenproject.org</a> &lt;<a href=3D"mailto:xen-d=
evel@lists.xenproject.org" target=3D"_blank" rel=3D"noreferrer">xen-devel@l=
ists.xenproject.org</a>&gt;<br>
Subject: Re: About support for memory event on AMD CPUs <br>
=C2=A0<br>
&gt; On 24.11.2021 10:23, Untitled YAN wrote:<br>
&gt; &gt; Original email:<br>
&gt; &gt; <br>
&gt; &gt; From: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;<br>
&gt; &gt; Sent: Wednesday, November 24, 2021 15:54<br>
&gt; &gt; To: YAN Untitled &lt;<a href=3D"mailto:yanluyi2010@hotmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">yanluyi2010@hotmail.com</a>&gt;<br>
&gt; &gt; Cc: <a href=3D"mailto:tamas@tklengyel.com" target=3D"_blank" rel=
=3D"noreferrer">tamas@tklengyel.com</a> &lt;<a href=3D"mailto:tamas@tklengy=
el.com" target=3D"_blank" rel=3D"noreferrer">tamas@tklengyel.com</a>&gt;; <=
a href=3D"mailto:aisaila@bitdefender.com" target=3D"_blank" rel=3D"noreferr=
er">aisaila@bitdefender.com</a> &lt;<a href=3D"mailto:aisaila@bitdefender.c=
om" target=3D"_blank" rel=3D"noreferrer">aisaila@bitdefender.com</a>&gt;; <=
a href=3D"mailto:ppircalabu@bitdefender.com" target=3D"_blank" rel=3D"noref=
errer">ppircalabu@bitdefender.com</a> &lt;<a href=3D"mailto:ppircalabu@bitd=
efender.com" target=3D"_blank" rel=3D"noreferrer">ppircalabu@bitdefender.co=
m</a>&gt;; <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_bla=
nk" rel=3D"noreferrer">xen-devel@lists.xenproject.org</a> &lt;xen-devel@lis=
ts.x enproject.&gt;org&gt;<br>
&gt; &gt; Subject: Re: About support for memory event on AMD CPUs <br>
&gt; &gt; =C2=A0<br>
&gt; &gt;&gt; On 23.11.2021 18:14, YAN Untitled wrote:<br>
&gt; &gt;&gt;&gt; Dear developers,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Short version: is memory event supported on AMD CPUs or i=
s it going to be<br>
&gt; &gt;&gt;&gt; supported?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Long version:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Environment: LibVMI 0.15.0 + Xen 4.14.3 on an **AMD CPU**=
 (5950x), 64-bit<br>
&gt; &gt;&gt;&gt; Debian 11 Dom0.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; What I am trying to accomplish: register a **memory event=
** handler, so that<br>
&gt; &gt;&gt;&gt; I can capture all memory accesses within a specific range=
 issued by any thread,<br>
&gt; &gt;&gt;&gt; or all memory accesses within any range issued by a speci=
fic thread.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; What I got instead: an error from LibVMI saying<br>
&gt; &gt;&gt;&gt; &quot;xc_hvm_set_mem_access failed with code: -1&quot;.<b=
r>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Some investigation: by inspecting the source code of LibV=
MI, I find the direct<br>
&gt; &gt;&gt;&gt; cause is one of the libxc functions, 1) xc_set_mem_access=
 or<br>
&gt; &gt;&gt;&gt; 2) xc_altp2m_set_mem_access, returned error code -1.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; After some searching, I found someone else having a simil=
ar problem [1]. I also<br>
&gt; &gt;&gt;&gt; noted LibVMI says:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Currently only the Xen Hypervisor provides these feat=
ures,<br>
&gt; &gt;&gt;&gt;&gt; and some of these are specifically only available on =
Intel CPUs<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; However, I can&#39;t find the exact confirmation for the =
availability of memory<br>
&gt; &gt;&gt;&gt; event on AMD CPUs from <a href=3D"https://wiki.xenproject=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.xenproje=
ct.org</a>.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Aiui underlying what you want is altp2m, which presently depe=
nds (in<br>
&gt; &gt;&gt; the hypervisor) on EPT being available (and in use for the gu=
est in<br>
&gt; &gt;&gt; question).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Jan<br>
&gt; &gt; <br>
&gt; &gt; Dear Jan,<br>
&gt; &gt; <br>
&gt; &gt; Thanks for your reply. I really appreciate the information. After=
 some<br>
&gt; &gt; searching with the keyword &quot;EPT&quot; I found [1]. So I chec=
ked on dom0 with<br>
&gt; &gt; &quot;xl dmesg | grep HAP&quot;, which says:<br>
&gt; &gt; <br>
&gt; &gt;&gt; (XEN) HVM: Hardware Assisted Paging (HAP) detected<br>
&gt; &gt;&gt; (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB<br>
&gt; &gt; <br>
&gt; &gt; And the guest is an HVM guest running Debian 10 with kernel v4.16=
 built from<br>
&gt; &gt; source. Most of the configuration of the guest is generated by vi=
rt-manager.<br>
&gt; &gt; The &quot;xl list -l&quot; shows that there is no explicit config=
uration for EPT, RVI or<br>
&gt; &gt; HAP, but it does say the &quot;type&quot; is &quot;hvm&quot;.<br>
&gt; <br>
&gt; HAP is the term covering EPT on the Intel side and NPT for AMD.<br>
&gt; <br>
&gt; Jan<br>
<br>
Dear Jan,<br>
<br>
Yeah that&#39;s why I wanted to confirm if the HAP is enabled for the guest=
 - it<br>
turns out it is enabled but for some reason, xc_altp2m_set_mem_access faile=
d.<br>
I am trying to replicate my setup on an Intel machine to find out if it&#39=
;s a<br>
configuration problem. Still don&#39;t know if it&#39;s implemented for AMD=
 but thanks<br>
for your help and information.<br>
<br>
<br>
Untitled YAN<br>
</blockquote></div></div></div>

--000000000000427a3f05d1889bd4--

