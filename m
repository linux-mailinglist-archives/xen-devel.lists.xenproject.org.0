Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0652250894
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 20:55:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAHcH-0007ZR-B6; Mon, 24 Aug 2020 18:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o7W=CC=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1kAHcG-0007ZM-1M
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 18:54:48 +0000
X-Inumbo-ID: 2a3f25c3-c0ba-4e7b-b5c8-9820eea9b754
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a3f25c3-c0ba-4e7b-b5c8-9820eea9b754;
 Mon, 24 Aug 2020 18:54:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b17so9216336wru.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mTIvcfIES3uRNTYiDu9V3D8rL/sOuBtG+Di60G1Gfqw=;
 b=B9okNl527GDnWLU+CBuCL2vmbWUDJESVu/AcVJ3txdZSrwNkNnwh+p8phebCJHobcF
 R3oMYNrpUJPCqFioPo/R1jSlvCWLa5zoUwrVHftWt3+HLY/jcN9ngJSv5PB7g4tKIFSK
 tARHVc4KLKVwjwomulDkQpfLZ4GVnpZUTHih0NDIOhbanRBEvNWz888yZ57Ub3g5FGFN
 SSncxlw/v1VdfKg6u9++2jhSeDqDRucdXKdy8IRkaBxhpWNvScRhNeSBB3t5C8fWh8JA
 mcjhZ04y3tk36FmD30ZpEMu+K0CCco5gg3g1guJQbPpx+9P3CqHm/b0wDoXtFBtFAXpe
 EmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mTIvcfIES3uRNTYiDu9V3D8rL/sOuBtG+Di60G1Gfqw=;
 b=Oop496d7FpNRwsuKKz0GNt/8cnQ5m2YhcMyE1M4LygHjcxAVboM4DuLX7M885kwewb
 pnC3YIScbgs/0JLnLhnETR0k9Hkut2AuYCpkombpojYo73135hH299hoJb3Gh5mDmJtS
 WIebQ1Q9A/CnotGh6hLbuKeZKbpxnkFXdWYfffh3wrKVrrFFyLFLR0S5ZDtd6ypL5ioN
 NeoFhAyT4yRkLXTLIKnKdrCU3qce7pfZlGEnye4Pndv9popmU/ZGKnHAoMV9oddwTGrv
 MDAUK22aO8bdtQfD/Gfu1lNhBiJ7cSF2zBWVlImutwDlK1AfrnKOHL5b/z4nrFDxqo/A
 6nQw==
X-Gm-Message-State: AOAM532X7Pz3TbFijdHdB1ElUo1zIZxVJI3vFjD+db0kYtXANHPNUijC
 nGdvelqDBwp7VpRxwi+1apl7ipIgmR1E+AK+2fI=
X-Google-Smtp-Source: ABdhPJwYmEnUHtT1SFyBbTa0TQY3EJMEaOku5d1mVPQimjHhdmkQaAwqda8rAe7VxgdNHbbrfPfxFjypeE/xNByY0Uc=
X-Received: by 2002:adf:f312:: with SMTP id i18mr2216756wro.399.1598295286065; 
 Mon, 24 Aug 2020 11:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200824181524.1111-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200824181524.1111-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 24 Aug 2020 19:54:30 +0100
Message-ID: <CAJ=z9a3+BRf38T3B4Rti31KXRrNWa9TnbExRKXT2b7g1msPxMg@mail.gmail.com>
Subject: Re: [PATCH] xen/mm: Introduce CONFIG_M2P and provide common fallback
 logic
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="000000000000c5af3205ada41ec1"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000c5af3205ada41ec1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, 24 Aug 2020, 19:15 Andrew Cooper, <andrew.cooper3@citrix.com> wrote=
:

> Architectures which don't implement an M2P shouldn't be forced to impleme=
nt
> stubs.  Implement them in common code.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>
> I'm pretty sure the mfn_to_gmfn() stub is bogus before and after this
> change.
> The two uses in common code are getdomaininfo and in memory_exchange(),
> which
> result in junk.
>
> I presume ARM toolstacks don't ever try to map info->shared_info_frame,
> because I can't see how it would work.
>

It is broken. I had a series that tried to remove the M2P (see [1]) but
there was some disagreement on how to implement it.

---
>  xen/arch/x86/Kconfig     |  1 +
>  xen/common/Kconfig       |  3 +++
>  xen/include/asm-arm/mm.h |  5 -----
>  xen/include/xen/mm.h     | 10 ++++++++++
>  4 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index a636a4bb1e..9bc97a1cf5 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -24,6 +24,7 @@ config X86
>         select HAS_SCHED_GRANULARITY
>         select HAS_UBSAN
>         select HAS_VPCI if !PV_SHIM_EXCLUSIVE && HVM
> +       select M2P
>         select NEEDS_LIBELF
>         select NUMA
>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 15e3b79ff5..0bc186d67b 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -63,6 +63,9 @@ config HAS_IOPORTS
>  config HAS_SCHED_GRANULARITY
>         bool
>
> +config M2P
> +       bool
> +
>  config NEEDS_LIBELF
>         bool
>
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index f8ba49b118..f4e1864703 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -326,11 +326,6 @@ struct page_info *get_page_from_gva(struct vcpu *v,
> vaddr_t va,
>  #define SHARED_M2P_ENTRY         (~0UL - 1UL)
>  #define SHARED_M2P(_e)           ((_e) =3D=3D SHARED_M2P_ENTRY)
>
> -/* Xen always owns P2M on ARM */
> -#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); }
> while (0)
> -#define mfn_to_gmfn(_d, mfn)  (mfn)
> -
> -
>  /* Arch-specific portion of memory_op hypercall. */
>  long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
>
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 1061765bcd..8f6858f954 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -685,4 +685,14 @@ static inline void put_page_alloc_ref(struct
> page_info *page)
>      }
>  }
>
> +/*
> + * For architectures which don't maintain their own M2P, provide a stub
> + * implementation for common code to use.
> + */
> +#ifndef CONFIG_M2P
> +static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long
> pfn) {}
> +static inline unsigned long mfn_to_gmfn(
> +    const struct domain *d, unsigned long mfn) { return mfn; }
> +#endif
>

Please don't add this hack in common code. This is a broken implementation
and we are lucky it didn't result to a disaster yet.

The correct way to implement it is to remove mfn_to_gmfn from common code.

I would be happy to try to revive my series.

Cheers,

[1] https://patches.linaro.org/cover/165661/


+
>  #endif /* __XEN_MM_H__ */
> --
> 2.11.0
>
>

--000000000000c5af3205ada41ec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Andrew,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 24 Aug 2020, 19:15 Andrew Cooper, &l=
t;<a href=3D"mailto:andrew.cooper3@citrix.com" rel=3D"noreferrer noreferrer=
" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Architectures which don&#39;t implement an M2P sh=
ouldn&#39;t be forced to implement<br>
stubs.=C2=A0 Implement them in common code.<br>
<br>
No functional change.<br>
<br>
Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">andrew.cooper=
3@citrix.com</a>&gt;<br>
---<br>
CC: Jan Beulich &lt;<a href=3D"mailto:JBeulich@suse.com" rel=3D"noreferrer =
noreferrer noreferrer" target=3D"_blank">JBeulich@suse.com</a>&gt;<br>
CC: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">roger.pau@citrix.com</=
a>&gt;<br>
CC: Wei Liu &lt;<a href=3D"mailto:wl@xen.org" rel=3D"noreferrer noreferrer =
noreferrer" target=3D"_blank">wl@xen.org</a>&gt;<br>
CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">sstabellini@kernel.org=
</a>&gt;<br>
CC: Julien Grall &lt;<a href=3D"mailto:julien@xen.org" rel=3D"noreferrer no=
referrer noreferrer" target=3D"_blank">julien@xen.org</a>&gt;<br>
CC: Volodymyr Babchuk &lt;<a href=3D"mailto:Volodymyr_Babchuk@epam.com" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">Volodymyr_Babchuk@e=
pam.com</a>&gt;<br>
<br>
I&#39;m pretty sure the mfn_to_gmfn() stub is bogus before and after this c=
hange.<br>
The two uses in common code are getdomaininfo and in memory_exchange(), whi=
ch<br>
result in junk.<br>
<br>
I presume ARM toolstacks don&#39;t ever try to map info-&gt;shared_info_fra=
me,<br>
because I can&#39;t see how it would work.<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">It is broken. I had a series that=
 tried to remove the M2P (see [1]) but there was some disagreement on how t=
o implement it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0xen/arch/x86/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0xen/common/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0xen/include/asm-arm/mm.h |=C2=A0 5 -----<br>
=C2=A0xen/include/xen/mm.h=C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
=C2=A04 files changed, 14 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig<br>
index a636a4bb1e..9bc97a1cf5 100644<br>
--- a/xen/arch/x86/Kconfig<br>
+++ b/xen/arch/x86/Kconfig<br>
@@ -24,6 +24,7 @@ config X86<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select HAS_SCHED_GRANULARITY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select HAS_UBSAN<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select HAS_VPCI if !PV_SHIM_EXCLUSIVE &amp;&amp=
; HVM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select M2P<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select NEEDS_LIBELF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select NUMA<br>
<br>
diff --git a/xen/common/Kconfig b/xen/common/Kconfig<br>
index 15e3b79ff5..0bc186d67b 100644<br>
--- a/xen/common/Kconfig<br>
+++ b/xen/common/Kconfig<br>
@@ -63,6 +63,9 @@ config HAS_IOPORTS<br>
=C2=A0config HAS_SCHED_GRANULARITY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
<br>
+config M2P<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
+<br>
=C2=A0config NEEDS_LIBELF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
<br>
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h<br>
index f8ba49b118..f4e1864703 100644<br>
--- a/xen/include/asm-arm/mm.h<br>
+++ b/xen/include/asm-arm/mm.h<br>
@@ -326,11 +326,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, va=
ddr_t va,<br>
=C2=A0#define SHARED_M2P_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(~0UL - 1UL=
)<br>
=C2=A0#define SHARED_M2P(_e)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((_e) =
=3D=3D SHARED_M2P_ENTRY)<br>
<br>
-/* Xen always owns P2M on ARM */<br>
-#define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } whil=
e (0)<br>
-#define mfn_to_gmfn(_d, mfn)=C2=A0 (mfn)<br>
-<br>
-<br>
=C2=A0/* Arch-specific portion of memory_op hypercall. */<br>
=C2=A0long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);<br>
<br>
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h<br>
index 1061765bcd..8f6858f954 100644<br>
--- a/xen/include/xen/mm.h<br>
+++ b/xen/include/xen/mm.h<br>
@@ -685,4 +685,14 @@ static inline void put_page_alloc_ref(struct page_info=
 *page)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/*<br>
+ * For architectures which don&#39;t maintain their own M2P, provide a stu=
b<br>
+ * implementation for common code to use.<br>
+ */<br>
+#ifndef CONFIG_M2P<br>
+static inline void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)=
 {}<br>
+static inline unsigned long mfn_to_gmfn(<br>
+=C2=A0 =C2=A0 const struct domain *d, unsigned long mfn) { return mfn; }<b=
r>
+#endif<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Please don&#39;t add this hack in common code. This is a broken impl=
ementation and we are lucky it didn&#39;t result to a disaster yet.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">The correct way to implement it=
 is to remove mfn_to_gmfn from common code.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">I would be happy to try to revive my series.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">[1]=C2=A0<a href=3D"https://patches.linaro.org/cov=
er/165661/" target=3D"_blank" rel=3D"noreferrer">https://patches.linaro.org=
/cover/165661/</a></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
+<br>
=C2=A0#endif /* __XEN_MM_H__ */<br>
-- <br>
2.11.0<br>
<br>
</blockquote></div></div></div>

--000000000000c5af3205ada41ec1--

