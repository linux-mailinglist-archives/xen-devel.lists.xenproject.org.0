Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BEF3F6082
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171537.313022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXWC-00007N-71; Tue, 24 Aug 2021 14:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171537.313022; Tue, 24 Aug 2021 14:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXWC-0008W0-3g; Tue, 24 Aug 2021 14:35:12 +0000
Received: by outflank-mailman (input) for mailman id 171537;
 Tue, 24 Aug 2021 14:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krg7=NP=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1mIXU7-0008TC-OL
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:33:03 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c39ad1a9-3323-4529-b3f4-0db202653b57;
 Tue, 24 Aug 2021 14:33:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b4so1897594lfo.13
 for <xen-devel@lists.xenproject.org>; Tue, 24 Aug 2021 07:33:02 -0700 (PDT)
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
X-Inumbo-ID: c39ad1a9-3323-4529-b3f4-0db202653b57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6s55fzmxRoG5Clmd5sP0okZh0wgxrMXxmpCKeql5S9o=;
        b=XxNnF0fEyf2hXnc1/m9yq//W7SgxzZ+s/F/ov0gmeINOp5uvODTMHXoyVKADf+MrY8
         Bcs6XXZSyUeGGFNKJ/lLFH9MI6a1NwFbcQ9+KFICoH3Jg6x7pY73XMhcLvW9q63vnnUa
         JmHh79zaUTmO6E4dsy9/Zz2dJXUxgInu6ZaAgUqM85lbe7AKxVNeztOqOFCLe/29Kf3C
         a/JBYpb1fXaPlkyikpTUW6R35tqGEnAg3N9bjwxL10/2giaL7Px9MmR4J2lNk0Qs41dN
         f1FyM+z9mx4vqNAywblqFkvPmk8NtmCOYaoVwzPkQcaolsWylQoO75Jg+TjNesxaIKmU
         dmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6s55fzmxRoG5Clmd5sP0okZh0wgxrMXxmpCKeql5S9o=;
        b=Ie5yOnZTH+WDSulSCNBnhoQOooaa3caEMFt1BM70EEoQwSuz93AIGckpWNKFIP3R7j
         Pe5DR6+7m4edC7x46uY0IA97spvZ5aes7bVjZ5lZWOD/usQ9RrleXA8fw9R5WogPlFfq
         HZ7THmzyNXP4/b4POc8xwusDE+9BTa9V4A8tI1hLWqQwuVcA7j034oO8dJ0L2jV2Auqd
         HlElywhbNmPFpCFaGMr5KMxJuf0cLcwUb7OcPirlVoQajcPMKvf/BAynxQJNEuSk0l05
         ywTuAmaNmHa+Gtwiz9ssxLxbYX3FYAjLrPKyCT9u0/+3gNsRTSEsTlXUCTkuP6Tsu3wj
         PaMQ==
X-Gm-Message-State: AOAM533SOiifndJYR9EzR7L56ntpo2T3QLJ7AjRXNYY7CFPI7huQU4GW
	j3GPRaVhlwPpYa/YVnThJdCfewad99apulHKUII=
X-Google-Smtp-Source: ABdhPJzJyG2o3JXPvg/26ePsivHsWfahTlPsTYGfKHFppuGz7dxZ5Ksl+nIB6twn6TXk3GK59WdSE8hLoudq6/oOXAE=
X-Received: by 2002:ac2:4105:: with SMTP id b5mr29155980lfi.153.1629815581417;
 Tue, 24 Aug 2021 07:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <9ab53497cdd52e3aeaeff8079d934dcee94d6479.1629315873.git.bobby.eshleman@gmail.com>
 <aafc217e-e998-7610-04e5-9cf7fde904ec@suse.com>
In-Reply-To: <aafc217e-e998-7610-04e5-9cf7fde904ec@suse.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
Date: Tue, 24 Aug 2021 16:32:50 +0200
Message-ID: <CAKB00G1VhR-6L-zK4efE4AONoPm_oa8jK+AfVk5i_QBkHLsKNA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] arch/x86: rename debug.c to gdbsx.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c7ac8105ca4f0260"

--000000000000c7ac8105ca4f0260
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 24, 2021, 2:20 PM Jan Beulich <jbeulich@suse.com> wrote:

> On 18.08.2021 22:29, Bobby Eshleman wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-x86/gdbsx.h
> > @@ -0,0 +1,17 @@
> > +#ifndef __X86_GDBX_H
> > +#define __X86_GDBX_H__
> > +
> > +#ifdef CONFIG_GDBSX
> > +
> > +int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio
> *iop);
> > +
> > +#else
> > +
> > +static inline int gdbsx_guest_mem_io(domid_t domid, struct
> xen_domctl_gdbsx_memio *iop)
> > +{
> > +    return -EOPNOTSUPP;
> > +}
> > +
> > +#endif
>
> In addition to what Andrew has said, you also want to make sure
> - domid_t is actually declared (need to include public/xen.h, I think),
> - struct xen_domctl_gdbsx_memio has a forward declaration (ahead of the
>   #ifdef).
> This is so the header can actually be #include-d without needing to
> worry about prereq #include-s.
>
> Jan
>

Roger that.

I'll be away from work on vacation until mid September but I'll get to
these changes and the others when I get back, if there are some pending /
still uncommitted.

Writing this from my phone, so sorry for gmail's email strangeness.

>

--000000000000c7ac8105ca4f0260
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Aug 24, 2021, 2:20 PM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 18.08.2021 22:29, Bobby Eshleman wrote:<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/include/asm-x86/gdbsx.h<br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +#ifndef __X86_GDBX_H<br>
&gt; +#define __X86_GDBX_H__<br>
&gt; +<br>
&gt; +#ifdef CONFIG_GDBSX<br>
&gt; +<br>
&gt; +int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *=
iop);<br>
&gt; +<br>
&gt; +#else<br>
&gt; +<br>
&gt; +static inline int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl=
_gdbsx_memio *iop)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return -EOPNOTSUPP;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif<br>
<br>
In addition to what Andrew has said, you also want to make sure<br>
- domid_t is actually declared (need to include public/xen.h, I think),<br>
- struct xen_domctl_gdbsx_memio has a forward declaration (ahead of the<br>
=C2=A0 #ifdef).<br>
This is so the header can actually be #include-d without needing to<br>
worry about prereq #include-s.<br>
<br>
Jan<br></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto"><sp=
an style=3D"font-family:sans-serif">Roger that.</span><div dir=3D"auto" sty=
le=3D"font-family:sans-serif"><br></div><div dir=3D"auto" style=3D"font-fam=
ily:sans-serif">I&#39;ll be away from work on vacation until mid September =
but I&#39;ll get to these changes and the others when I get back, if there =
are some pending / still uncommitted.</div><div dir=3D"auto" style=3D"font-=
family:sans-serif"><br></div><div dir=3D"auto" style=3D"font-family:sans-se=
rif">Writing this from my phone, so sorry for gmail&#39;s email strangeness=
.</div></div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"></blockquote></div></div>

--000000000000c7ac8105ca4f0260--

