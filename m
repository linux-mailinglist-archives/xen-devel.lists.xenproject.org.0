Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDC12B583
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 16:14:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikrIO-00030L-82; Fri, 27 Dec 2019 15:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=77+U=2R=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ikrIM-00030F-98
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 15:12:54 +0000
X-Inumbo-ID: 5a2f36d4-28bb-11ea-a914-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a2f36d4-28bb-11ea-a914-bc764e2007e4;
 Fri, 27 Dec 2019 15:12:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id r19so27351514ljg.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2019 07:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=96GUQ0z9eSzNOp2iTTKgFU4wqRFPOndmf/ZOgdPxXr4=;
 b=i6amHVZspsuz7W3kw1jDJdL4xI3JJ12bAy2dP0EN1AreCHEXrpwqQoKve8gx/YyUea
 /agJuSQMoDMC/xqpDn9aYXbAM7zd7rvC2kjVK+Wi8c7wdQH6KVZvFXZ+kYfF3sTPFCNY
 LabaDOuMCxkmn+MGd4O1sRYCY5Fk/uSgduozO4DsHYjn5OF6O/uYHJcuPRQ+7EMlwcUV
 KCh71Xd9Vivs6nNUbyPT/HfmA1KflaPrTz1BsZxH3JlaTlWusypChnpdYxDn9BLvtUXB
 UTJahiwtGG+1qJ7qRrrcz4XYvA9bzBQscYL0rnwm0kFyX9U1u+2GMLsd0tvDi4Exxqtn
 0pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=96GUQ0z9eSzNOp2iTTKgFU4wqRFPOndmf/ZOgdPxXr4=;
 b=swsAcVTlTpCZ21p0DptTenZJcSiAz2xxAQ9B7FmZOSbY7hf77RnwvnXXa+lgnu8c3k
 1pUdt4c+L5MDJxwaDRM4ruecW1+cEAmbLZEqerVNm13mJyO4EpNmVJ6PtlPwnZAFJNh6
 Q9eu7WWpk6Acmh+BZuRtw/9sCapT6cLbKZWZZkc5eaXsv+WnGcL0gXQkE+E2Fi2n1Y10
 U/+Lp6HOUcWfeqCTzzoMzXeejfQ5lE1Ur6NOKVxLQ2RfkHquYAoSnL3zVqQgZFTz/CA1
 F6/uxdkjM9V4sfKZd81R2GEk+7fL+rNszv65D1kRU/026e8Rm92cuv0I5S6XZ3eNRIPA
 RJLA==
X-Gm-Message-State: APjAAAWeR5As4i4mLSM4j6Y9IG/UAyuTQPGS+o54CSf6qvQmn7rsev2Z
 PEWZGVEkvbgak1Jrbi6HCrqxvzIFVR1WXtqJvww=
X-Google-Smtp-Source: APXvYqx5Zoy3KtkGrM1uY2SN1zCPdfMPM3JEaEgQxC+nlsxSU5v6kmdXDnB4nHHmTvblLZq+Rgva3YjHDGxZm29ADzI=
X-Received: by 2002:a2e:a361:: with SMTP id i1mr27602752ljn.29.1577459572116; 
 Fri, 27 Dec 2019 07:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
 <20191223164329.3113378-3-george.dunlap@citrix.com>
In-Reply-To: <20191223164329.3113378-3-george.dunlap@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 27 Dec 2019 16:11:13 +0100
Message-ID: <CAJ=z9a2WU=Bdj=1-8N62UAqzCigOEq5gqFr-u_JFPLr8aF=0Pg@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/4] xen: Add 'synthetic' preemption check
 parameter
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============1214420964509808074=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1214420964509808074==
Content-Type: multipart/alternative; boundary="0000000000007191a7059ab0ed2f"

--0000000000007191a7059ab0ed2f
Content-Type: text/plain; charset="UTF-8"

Hi George,

I was expecting a bigger list of CC here. What did you use to compute it?

On Mon, 23 Dec 2019, 17:45 George Dunlap, <george.dunlap@citrix.com> wrote:

> In order to better test hypervisor preemption paths, add an option to
> artificially increase the number of preemptions.
>
> While modifying xen-command-line.pandoc, escape some underscores, and
> remove some trailing whitespace.
>
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
>  docs/misc/xen-command-line.pandoc | 20 ++++++++++++++++++--
>  xen/arch/x86/time.c               | 11 +++++++++++
>  xen/include/xen/sched.h           | 10 +++++++++-
>  3 files changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/docs/misc/xen-command-line.pandoc
> b/docs/misc/xen-command-line.pandoc
> index 981a5e2381..1a9fda8627 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -636,13 +636,29 @@ Available alternatives, with their meaning, are:
>  Specify the USB controller to use, either by instance number (when going
>  over the PCI busses sequentially) or by PCI device (must be on segment 0).
>
> -### debug_stack_lines
> +### debug\_stack\_lines
>  > `= <integer>`
>
>  > Default: `20`
>
>  Limits the number lines printed in Xen stack traces.
>
> +### debug-synthetic-preemption
> +> `= <integer>`
> +
> +> Default: `0`
> +
> +Artificially increases rate at which `hypercall_preempt_check()`
> +returns `true`, for debugging purposes, to a rate of one in `N`. (The
> +default, `0`, disables the feature.)
> +
> +When promoting pagetables, for instance, `hypercall_preempt_check()`
> +is called before processing each PTE.  Since there are 512 PTEs per
> +page, a value of `1024` should result in pagetable promotion being
> +interrupted every other page on average.
> +
> +Only available in DEBUG builds.
> +
>  ### debugtrace
>  > `= [cpu:]<size>`
>
> @@ -1690,7 +1706,7 @@ The following resources are available:
>      CDP, one COS will corespond two CBMs other than one with CAT, due to
> the
>      sum of CBMs is fixed, that means actual `cos_max` in use will
> automatically
>      reduce to half when CDP is enabled.
> -
> +
>  ### pv-linear-pt (x86)
>  > `= <boolean>`
>
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 64e471a39b..34302f81e7 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -43,6 +43,17 @@
>  static char __initdata opt_clocksource[10];
>  string_param("clocksource", opt_clocksource);
>
> +#ifndef NDEBUG
> +int debug_synthetic_preemption = 0;
> +integer_param("debug-synthetic-preemption", debug_synthetic_preemption);
> +
> +bool synthetic_preemption_check(void) {
> +    if ( debug_synthetic_preemption == 0 )
> +        return false;
> +    return !(rdtsc() % debug_synthetic_preemption);
> +}
> +#endif

+
>  unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */
>  DEFINE_SPINLOCK(rtc_lock);
>  unsigned long pit0_ticks;
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 9f7bc69293..c0071eee04 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -748,6 +748,13 @@ static inline void
> hypercall_cancel_continuation(struct vcpu *v)
>      v->hcall_preempted = false;
>  }
>
> +#ifndef NDEBUG
> +bool synthetic_preemption_check(void);
> +#define synthetic_preemption_check synthetic_preemption_check


Why do you need this define?

+#else
> +#define synthetic_preempiton_check() false
>

Typo in the name. Also, it seems like this wasn't tested on Arm and, AFAICT
break because the function would not be definr in debug build.

But, I am not sure why the implementation needs to be arch specific when
get_cycles() could do the job.

+#endif
> +
>  /*
>   * For long-running operations that must be in hypercall context, check
>   * if there is background work to be done that should interrupt this
> @@ -755,7 +762,8 @@ static inline void
> hypercall_cancel_continuation(struct vcpu *v)
>   */
>  #define hypercall_preempt_check() (unlikely(    \
>          softirq_pending(smp_processor_id()) |   \
> -        local_events_need_delivery()            \
> +        local_events_need_delivery() |          \
> +        synthetic_preemption_check()            \


The function you return bool, so shouldn't it be ||?

Cheers,

     ))
>
>  /*
> --
> 2.24.0
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000007191a7059ab0ed2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi George,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I was expecting a bigger list of CC here. What did you use to com=
pute it?<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, 23 Dec 2019, 17:45 George Dunlap, &lt;<a href=3D=
"mailto:george.dunlap@citrix.com" target=3D"_blank" rel=3D"noreferrer">geor=
ge.dunlap@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>In order to better test hypervisor preemption paths, add an option to<br>
artificially increase the number of preemptions.<br>
<br>
While modifying xen-command-line.pandoc, escape some underscores, and<br>
remove some trailing whitespace.<br>
<br>
Signed-off-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">george.dunlap@citrix.com<=
/a>&gt;<br>
---<br>
CC: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<b=
r>
CC: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" rel=3D"noreferrer =
noreferrer" target=3D"_blank">jbeulich@suse.com</a>&gt;<br>
---<br>
=C2=A0docs/misc/xen-command-line.pandoc | 20 ++++++++++++++++++--<br>
=C2=A0xen/arch/x86/time.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 11 +++++++++++<br>
=C2=A0xen/include/xen/sched.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 =
+++++++++-<br>
=C2=A03 files changed, 38 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc<br>
index 981a5e2381..1a9fda8627 100644<br>
--- a/docs/misc/xen-command-line.pandoc<br>
+++ b/docs/misc/xen-command-line.pandoc<br>
@@ -636,13 +636,29 @@ Available alternatives, with their meaning, are:<br>
=C2=A0Specify the USB controller to use, either by instance number (when go=
ing<br>
=C2=A0over the PCI busses sequentially) or by PCI device (must be on segmen=
t 0).<br>
<br>
-### debug_stack_lines<br>
+### debug\_stack\_lines<br>
=C2=A0&gt; `=3D &lt;integer&gt;`<br>
<br>
=C2=A0&gt; Default: `20`<br>
<br>
=C2=A0Limits the number lines printed in Xen stack traces.<br>
<br>
+### debug-synthetic-preemption<br>
+&gt; `=3D &lt;integer&gt;`<br>
+<br>
+&gt; Default: `0`<br>
+<br>
+Artificially increases rate at which `hypercall_preempt_check()`<br>
+returns `true`, for debugging purposes, to a rate of one in `N`. (The<br>
+default, `0`, disables the feature.)<br>
+<br>
+When promoting pagetables, for instance, `hypercall_preempt_check()`<br>
+is called before processing each PTE.=C2=A0 Since there are 512 PTEs per<b=
r>
+page, a value of `1024` should result in pagetable promotion being<br>
+interrupted every other page on average.<br>
+<br>
+Only available in DEBUG builds.<br>
+<br>
=C2=A0### debugtrace<br>
=C2=A0&gt; `=3D [cpu:]&lt;size&gt;`<br>
<br>
@@ -1690,7 +1706,7 @@ The following resources are available:<br>
=C2=A0 =C2=A0 =C2=A0CDP, one COS will corespond two CBMs other than one wit=
h CAT, due to the<br>
=C2=A0 =C2=A0 =C2=A0sum of CBMs is fixed, that means actual `cos_max` in us=
e will automatically<br>
=C2=A0 =C2=A0 =C2=A0reduce to half when CDP is enabled.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+<br>
=C2=A0### pv-linear-pt (x86)<br>
=C2=A0&gt; `=3D &lt;boolean&gt;`<br>
<br>
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c<br>
index 64e471a39b..34302f81e7 100644<br>
--- a/xen/arch/x86/time.c<br>
+++ b/xen/arch/x86/time.c<br>
@@ -43,6 +43,17 @@<br>
=C2=A0static char __initdata opt_clocksource[10];<br>
=C2=A0string_param(&quot;clocksource&quot;, opt_clocksource);<br>
<br>
+#ifndef NDEBUG<br>
+int debug_synthetic_preemption =3D 0;<br>
+integer_param(&quot;debug-synthetic-preemption&quot;, debug_synthetic_pree=
mption);<br>
+<br>
+bool synthetic_preemption_check(void) {<br>
+=C2=A0 =C2=A0 if ( debug_synthetic_preemption =3D=3D 0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 return !(rdtsc() % debug_synthetic_preemption);<br>
+}<br>
+#endif</blockquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote=
" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
+<br>
=C2=A0unsigned long __read_mostly cpu_khz;=C2=A0 /* CPU clock frequency in =
kHz. */<br>
=C2=A0DEFINE_SPINLOCK(rtc_lock);<br>
=C2=A0unsigned long pit0_ticks;<br>
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h<br>
index 9f7bc69293..c0071eee04 100644<br>
--- a/xen/include/xen/sched.h<br>
+++ b/xen/include/xen/sched.h<br>
@@ -748,6 +748,13 @@ static inline void hypercall_cancel_continuation(struc=
t vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0v-&gt;hcall_preempted =3D false;<br>
=C2=A0}<br>
<br>
+#ifndef NDEBUG<br>
+bool synthetic_preemption_check(void);<br>
+#define synthetic_preemption_check synthetic_preemption_check</blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Why do you need t=
his define?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+#else<br>
+#define synthetic_preempiton_check() false<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Typo in the name. Also, it seems=
 like this wasn&#39;t tested on Arm and, AFAICT break because the function =
would not be definr in debug build.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">But, I am not sure why the implementation needs to be arch spec=
ific when get_cycles() could do the job.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
+#endif<br>
+<br>
=C2=A0/*<br>
=C2=A0 * For long-running operations that must be in hypercall context, che=
ck<br>
=C2=A0 * if there is background work to be done that should interrupt this<=
br>
@@ -755,7 +762,8 @@ static inline void hypercall_cancel_continuation(struct=
 vcpu *v)<br>
=C2=A0 */<br>
=C2=A0#define hypercall_preempt_check() (unlikely(=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0softirq_pending(smp_processor_id()) |=C2=
=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_events_need_delivery()=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_events_need_delivery() |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 synthetic_preemption_check()=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \</blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">The function you return bool, so shouldn&#39;t it be =
||?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div di=
r=3D"auto"></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0))<br>
<br>
=C2=A0/*<br>
-- <br>
2.24.0<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://lists.xenprojec=
t.org/mailman/listinfo/xen-devel</a></blockquote></div></div></div>

--0000000000007191a7059ab0ed2f--


--===============1214420964509808074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1214420964509808074==--

