Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E15EF789
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 16:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413820.657727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oduX9-0004ji-BS; Thu, 29 Sep 2022 14:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413820.657727; Thu, 29 Sep 2022 14:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oduX9-0004hb-86; Thu, 29 Sep 2022 14:29:03 +0000
Received: by outflank-mailman (input) for mailman id 413820;
 Thu, 29 Sep 2022 14:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6gS=2A=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1oduX7-0004hU-0Q
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 14:29:01 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d8cbe33-4003-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 16:28:58 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id e145so1734228yba.11
 for <xen-devel@lists.xenproject.org>; Thu, 29 Sep 2022 07:28:58 -0700 (PDT)
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
X-Inumbo-ID: 0d8cbe33-4003-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2XJDa8DBA7HGi039FsBbQeQ2BhJjxhBLQe2Bio1+Kqc=;
        b=GWwRNwX/Z6et92Ckt7fyGExyf0V+SQ2iyhdgEGUEZ7X3yFUMx04bydYTgl8xyVPaOs
         KE91zVfK/LKrVPmA1JTTv0oH/lJ1lEdjr+nuML4hzjUIL9F2UfaXWqTKOhSAkrP3ETYN
         nsnbgKYjqaIu3EknSkNqiZOBTfTIbCkx/re8FpBcRUoiEJcQVslmkEyRaIF0qySpOUOS
         IS5Vcmc59BSXMzJjbwVqOb/Z5Ll1w3e90hD/oqAmxucp9Xyts4hOHOpkC/kNFL8/9aqD
         ChJAZOULj5SxdrkafgPgRRChtPpelYgS+E2b1IHglFSBkq16EGWCqGb152pHqkJxtOfP
         cWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2XJDa8DBA7HGi039FsBbQeQ2BhJjxhBLQe2Bio1+Kqc=;
        b=6XGO9t3fx13OTew4i+arfEQUmn08yBRE2khSPpCcvngGYxellHm5JdgJBoW+zyVNWz
         WW4d9LLR92JS+R2BEy1hwrUEdcSsTo5cECrJsuR6QZcUH1cK+eau5pjr+ANPK4d3kV/e
         Gl5HhT1ZTtV2MV5IeLZzy++qojthecrFUo4gkTMEZJsy4+4EpacJALtDebfQr63k3/FQ
         vLNlt5mxSmkeez9cKcUZ39XO91pVm4d5vfqX44RYs2djegPB1bN8H8sbJMGpL2GpUNDU
         97LtT+k1pQOoFvHAJj0B6M6e8t7xuia2hv5jdAlSzEaKrRjKV5dffnLaL/PGUzSB4Blx
         7e7w==
X-Gm-Message-State: ACrzQf3OlNxEG6R9rDQ0ydgCOXaE0uqXWA3fbvYvrpB6NwwhhjnivUAm
	t4QzhZB/6FXPYEywjl1GnUJeTiKNhDci8lxBjbQ=
X-Google-Smtp-Source: AMsMyM7CQ0lLy3HueYb2zHtqVG1+8vLYuqtefellxhA1KylXQJiOD+w43PJfsMhqOpZ0vNDmrixuLJKuGdtT5quEqxE=
X-Received: by 2002:a25:2597:0:b0:6bc:c8a4:77bf with SMTP id
 l145-20020a252597000000b006bcc8a477bfmr1962740ybl.213.1664461736975; Thu, 29
 Sep 2022 07:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <86f8a095ff18e4dc41ecb9cef5153438158b91ce.1663878942.git.tamas.lengyel@intel.com>
 <7a469ef7-5ad7-5abf-2c1f-fa29496fa2a5@suse.com> <CABfawhkJ1KSxmV=usLh9mKSyT+-_=PgQrhkGe8G0J_ZjqZ9siw@mail.gmail.com>
 <1e9f75e3-c59c-e3a4-f26d-59a440d366aa@suse.com>
In-Reply-To: <1e9f75e3-c59c-e3a4-f26d-59a440d366aa@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 29 Sep 2022 10:28:20 -0400
Message-ID: <CABfawhkT8PHOkNS_9+uXjN=6UANkayMf4UC0OuCr6Na-BOFdQw@mail.gmail.com>
Subject: Re: [PATCH v2] x86/vpmu: Fix race-condition in vpmu_load
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000009322e705e9d1b299"

--0000000000009322e705e9d1b299
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 9:07 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 26.09.2022 16:22, Tamas K Lengyel wrote:
> > On Mon, Sep 26, 2022 at 10:12 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 22.09.2022 22:48, Tamas K Lengyel wrote:
> >>> --- a/xen/arch/x86/cpu/vpmu.c
> >>> +++ b/xen/arch/x86/cpu/vpmu.c
> >>> @@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)
> >>>      vpmu->last_pcpu = pcpu;
> >>>      per_cpu(last_vcpu, pcpu) = v;
> >>>
> >>> +    vpmu_set(vpmu, VPMU_CONTEXT_SAVE);
> >>> +
> >>>      if ( alternative_call(vpmu_ops.arch_vpmu_save, v, 0) )
> >>>          vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> >>>
> >>> +    vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);
> >>> +
> >>>      apic_write(APIC_LVTPC, PMU_APIC_VECTOR | APIC_LVT_MASKED);
> >>>  }
> >>>
> >>>  int vpmu_load(struct vcpu *v, bool_t from_guest)
> >>>  {
> >>>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
> >>> -    int pcpu = smp_processor_id(), ret;
> >>> -    struct vcpu *prev = NULL;
> >>> +    int ret;
> >>>
> >>>      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
> >>>          return 0;
> >>>
> >>> -    /* First time this VCPU is running here */
> >>> -    if ( vpmu->last_pcpu != pcpu )
> >>> -    {
> >>> -        /*
> >>> -         * Get the context from last pcpu that we ran on. Note that if
> >> another
> >>> -         * VCPU is running there it must have saved this VPCU's
> context
> >> before
> >>> -         * startig to run (see below).
> >>> -         * There should be no race since remote pcpu will disable
> >> interrupts
> >>> -         * before saving the context.
> >>> -         */
> >>> -        if ( vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
> >>> -        {
> >>> -            on_selected_cpus(cpumask_of(vpmu->last_pcpu),
> >>> -                             vpmu_save_force, (void *)v, 1);
> >>> -            vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> >>> -        }
> >>> -    }
> >>> -
> >>> -    /* Prevent forced context save from remote CPU */
> >>> -    local_irq_disable();
> >>> -
> >>> -    prev = per_cpu(last_vcpu, pcpu);
> >>> -
> >>> -    if ( prev != v && prev )
> >>> -    {
> >>> -        vpmu = vcpu_vpmu(prev);
> >>> -
> >>> -        /* Someone ran here before us */
> >>> -        vpmu_save_force(prev);
> >>> -        vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> >>> -
> >>> -        vpmu = vcpu_vpmu(v);
> >>> -    }
> >>> -
> >>> -    local_irq_enable();
> >>> -
> >>>      /* Only when PMU is counting, we load PMU context immediately. */
> >>>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||
> >>>           (!has_vlapic(vpmu_vcpu(vpmu)->domain) &&
> >>
> >> What about the other two uses of vpmu_save_force() in this file? I looks
> >> to me as if only the use in mem_sharing.c needs to be retained.
> >
> > I don't know, maybe. I rather focus this patch only on the issue and its
> > fix as I don't want to introduce unintended side effects by doing a
> > cleanup/consolidation at other code-paths when not strictly necessary.
>
> While I see your point, I'm afraid I don't think I can ack this
> change without knowing whether the other uses don't expose a similar
> issue. It would feel wrong to fix only one half of a problem. I may,
> somewhat hesitantly, give an ack if e.g. Boris offered his R-b.
> Else the only other option I see is that some other maintainer give
> their ack.
>

I may have misunderstood what you are asking. I thought you were asking if
the other two remaining users of vpmu_save_force could be switched over to
vpmu_save as a generic cleanup, to which my answer is still maybe. From the
perspective of this particular bug those use-cases are safe. On is acting
on the current vcpu and doesn't try to run vpmu_save_force on a remote
vcpu, the other one is being called when the domain is being shut down so
the vcpu cannot be in a runnable state.

Tamas

--0000000000009322e705e9d1b299
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 9:07 AM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 26.09.2=
022 16:22, Tamas K Lengyel wrote:<br>
&gt; On Mon, Sep 26, 2022 at 10:12 AM Jan Beulich &lt;<a href=3D"mailto:jbe=
ulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt;&gt; On 22.09.2022 22:48, Tamas K Lengyel wrote:<br>
&gt;&gt;&gt; --- a/xen/arch/x86/cpu/vpmu.c<br>
&gt;&gt;&gt; +++ b/xen/arch/x86/cpu/vpmu.c<br>
&gt;&gt;&gt; @@ -376,57 +376,24 @@ void vpmu_save(struct vcpu *v)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 vpmu-&gt;last_pcpu =3D pcpu;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 per_cpu(last_vcpu, pcpu) =3D v;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 vpmu_set(vpmu, VPMU_CONTEXT_SAVE);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if ( alternative_call(vpmu_ops.arch_vpmu_s=
ave, v, 0) )<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_reset(vpmu, VPMU_CONTEX=
T_LOADED);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 vpmu_reset(vpmu, VPMU_CONTEXT_SAVE);<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 apic_write(APIC_LVTPC, PMU_APIC_VECTOR | A=
PIC_LVT_MASKED);<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 int vpmu_load(struct vcpu *v, bool_t from_guest)<br>
&gt;&gt;&gt;=C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 struct vpmu_struct *vpmu =3D vcpu_vpmu(v);=
<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 int pcpu =3D smp_processor_id(), ret;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 struct vcpu *prev =3D NULL;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOC=
ATED) )<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 /* First time this VCPU is running here */<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 if ( vpmu-&gt;last_pcpu !=3D pcpu )<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Get the context from last=
 pcpu that we ran on. Note that if<br>
&gt;&gt; another<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* VCPU is running there it =
must have saved this VPCU&#39;s context<br>
&gt;&gt; before<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* startig to run (see below=
).<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* There should be no race s=
ince remote pcpu will disable<br>
&gt;&gt; interrupts<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* before saving the context=
.<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( vpmu_is_set(vpmu, VPMU_CONTE=
XT_LOADED) )<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on_selected_cpus(cp=
umask_of(vpmu-&gt;last_pcpu),<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vpmu_save_force, (void *)v, 1)=
;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_reset(vpmu, VP=
MU_CONTEXT_LOADED);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 /* Prevent forced context save from remote CPU =
*/<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 local_irq_disable();<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 prev =3D per_cpu(last_vcpu, pcpu);<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 if ( prev !=3D v &amp;&amp; prev )<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu =3D vcpu_vpmu(prev);<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Someone ran here before us */<=
br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_save_force(prev);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu_reset(vpmu, VPMU_CONTEXT_LOA=
DED);<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vpmu =3D vcpu_vpmu(v);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 local_irq_enable();<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /* Only when PMU is counting, we load PMU =
context immediately. */<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if ( !vpmu_is_set(vpmu, VPMU_RUNNING) ||<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(!has_vlapic(vpmu_vcpu=
(vpmu)-&gt;domain) &amp;&amp;<br>
&gt;&gt;<br>
&gt;&gt; What about the other two uses of vpmu_save_force() in this file? I=
 looks<br>
&gt;&gt; to me as if only the use in mem_sharing.c needs to be retained.<br=
>
&gt; <br>
&gt; I don&#39;t know, maybe. I rather focus this patch only on the issue a=
nd its<br>
&gt; fix as I don&#39;t want to introduce unintended side effects by doing =
a<br>
&gt; cleanup/consolidation at other code-paths when not strictly necessary.=
<br>
<br>
While I see your point, I&#39;m afraid I don&#39;t think I can ack this<br>
change without knowing whether the other uses don&#39;t expose a similar<br=
>
issue. It would feel wrong to fix only one half of a problem. I may,<br>
somewhat hesitantly, give an ack if e.g. Boris offered his R-b.<br>
Else the only other option I see is that some other maintainer give<br>
their ack.<br></blockquote><div><br></div><div>I may have misunderstood wha=
t you are asking. I thought you were asking if the other two remaining user=
s of vpmu_save_force could be switched over to vpmu_save as a generic clean=
up, to which my answer is still maybe. From the perspective of this particu=
lar bug those use-cases are safe. On is acting on the current vcpu and does=
n&#39;t try to run vpmu_save_force on a remote vcpu, the other one is being=
 called when the domain is being shut down so the vcpu cannot be in a runna=
ble state.</div><div><br></div><div>Tamas</div></div></div>

--0000000000009322e705e9d1b299--

