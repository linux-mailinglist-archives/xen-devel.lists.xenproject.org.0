Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CB74A1D1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 18:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559927.875378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRXM-0008HJ-79; Thu, 06 Jul 2023 16:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559927.875378; Thu, 06 Jul 2023 16:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRXM-0008ET-2u; Thu, 06 Jul 2023 16:08:56 +0000
Received: by outflank-mailman (input) for mailman id 559927;
 Thu, 06 Jul 2023 16:08:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xukH=CY=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qHRXK-0008EJ-8X
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 16:08:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65fee781-1c17-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 18:08:52 +0200 (CEST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by support.bugseng.com (Postfix) with ESMTPSA id 2E2A54EE074E
 for <xen-devel@lists.xenproject.org>; Thu,  6 Jul 2023 18:08:51 +0200 (CEST)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6b8b6f7399aso741234a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 09:08:51 -0700 (PDT)
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
X-Inumbo-ID: 65fee781-1c17-11ee-b237-6b7b168915f2
X-Gm-Message-State: ABy/qLaHTBazpsjULBlBW6qw3DiNCWZLzGUXwukEYA4/+C2Y1bLD/lOm
	UUnr62pLFAkik2x9HlWoc5Lx525Dhg3f84/rbSE=
X-Google-Smtp-Source: APBJJlGtV9+mfXOJSAeWCDAjamKiqBWUpBcLoyIq2tRFRjXe4cXSDFalY24wOEfrvQOIeHrlvLQojFfDTH2Zj9q1/PE=
X-Received: by 2002:a05:6358:9910:b0:134:ddad:2b4f with SMTP id
 w16-20020a056358991000b00134ddad2b4fmr2826690rwa.18.1688659729733; Thu, 06
 Jul 2023 09:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com>
In-Reply-To: <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Thu, 6 Jul 2023 18:08:38 +0200
X-Gmail-Original-Message-ID: <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
Message-ID: <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000565cbb05ffd3bb98"

--000000000000565cbb05ffd3bb98
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 05.07.2023 17:26, Simone Ballarin wrote:
> > --- a/xen/arch/x86/apic.c
> > +++ b/xen/arch/x86/apic.c
> > @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
> >       * Setup the APIC counter to maximum. There is no way the lapic
> >       * can underflow in the 100ms detection time frame.
> >       */
> > -    __setup_APIC_LVTT(0xffffffff);
> > +    __setup_APIC_LVTT(0xffffffffU);
>
> While making the change less mechanical, we want to consider to switch
> to ~0 in this and similar cases.
>

Changing ~0U is more than not mechanical: it is possibly dangerous.
The resulting value could be different depending on the architecture,
I prefer to not make such kind of changes in a MISRA-related patch.


>
> > @@ -378,9 +378,9 @@ static void __init calculate_host_policy(void)
> >       * this information.
> >       */
> >      if ( cpu_has_lfence_dispatch )
> > -        max_extd_leaf = max(max_extd_leaf, 0x80000021);
> > +        max_extd_leaf = max(max_extd_leaf, 0x80000021U);
> >
> > -    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf &
> 0xffff,
> > +    p->extd.max_leaf = 0x80000000U | min_t(uint32_t, max_extd_leaf &
> 0xffffU,
> >                                            ARRAY_SIZE(p->extd.raw) - 1);
>
> Adjustments like this or ...
>
> > @@ -768,7 +768,7 @@ void recalculate_cpuid_policy(struct domain *d)
> >
> >      p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
> >      p->feat.max_subleaf = min(p->feat.max_subleaf,
> max->feat.max_subleaf);
> > -    p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
> > +    p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
> >                                             ((p->x86_vendor &
> (X86_VENDOR_AMD |
> >
> X86_VENDOR_HYGON))
> >                                              ? CPUID_GUEST_NR_EXTD_AMD
>
> ... this also need to adjust indentation of the following lines.
>
Ok.

>
> > --- a/xen/arch/x86/cpu/mcheck/mce-apei.c
> > +++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
> > @@ -37,11 +37,11 @@
> >  #include "mce.h"
> >
> >  #define CPER_CREATOR_MCE                                             \
> > -     UUID_LE(0x75a574e3, 0x5052, 0x4b29, 0x8a, 0x8e, 0xbe, 0x2c,     \
> > -             0x64, 0x90, 0xb8, 0x9d)
> > +     UUID_LE(0x75a574e3U, 0x5052U, 0x4b29U, 0x8aU, 0x8eU, 0xbeU,
> 0x2cU,      \
> > +             0x64U, 0x90U, 0xb8U, 0x9dU)
> >  #define CPER_SECTION_TYPE_MCE
>       \
> > -     UUID_LE(0xfe08ffbe, 0x95e4, 0x4be7, 0xbc, 0x73, 0x40, 0x96,     \
> > -             0x04, 0x4a, 0x38, 0xfc)
> > +     UUID_LE(0xfe08ffbeU, 0x95e4U, 0x4be7U, 0xbcU, 0x73U, 0x40U,
> 0x96U,      \
> > +             0x04U, 0x4aU, 0x38U, 0xfcU)
>
> See the earlier (EFI) comment regarding excessive use of suffixes here.
>
Ok.

>
> > --- a/xen/arch/x86/hvm/stdvga.c
> > +++ b/xen/arch/x86/hvm/stdvga.c
> > @@ -39,46 +39,46 @@
> >
> >  #define PAT(x) (x)
> >  static const uint32_t mask16[16] = {
> > -    PAT(0x00000000),
> > -    PAT(0x000000ff),
> > -    PAT(0x0000ff00),
> > -    PAT(0x0000ffff),
> > -    PAT(0x00ff0000),
> > -    PAT(0x00ff00ff),
> > -    PAT(0x00ffff00),
> > -    PAT(0x00ffffff),
> > -    PAT(0xff000000),
> > -    PAT(0xff0000ff),
> > -    PAT(0xff00ff00),
> > -    PAT(0xff00ffff),
> > -    PAT(0xffff0000),
> > -    PAT(0xffff00ff),
> > -    PAT(0xffffff00),
> > -    PAT(0xffffffff),
> > +    PAT(0x00000000U),
> > +    PAT(0x000000ffU),
> > +    PAT(0x0000ff00U),
> > +    PAT(0x0000ffffU),
> > +    PAT(0x00ff0000U),
> > +    PAT(0x00ff00ffU),
> > +    PAT(0x00ffff00U),
> > +    PAT(0x00ffffffU),
> > +    PAT(0xff000000U),
> > +    PAT(0xff0000ffU),
> > +    PAT(0xff00ff00U),
> > +    PAT(0xff00ffffU),
> > +    PAT(0xffff0000U),
> > +    PAT(0xffff00ffU),
> > +    PAT(0xffffff00U),
> > +    PAT(0xffffffffU),
> >  };
>
> While I agree here, ...
>
> >  /* force some bits to zero */
> >  static const uint8_t sr_mask[8] = {
> > -    (uint8_t)~0xfc,
> > -    (uint8_t)~0xc2,
> > -    (uint8_t)~0xf0,
> > -    (uint8_t)~0xc0,
> > -    (uint8_t)~0xf1,
> > -    (uint8_t)~0xff,
> > -    (uint8_t)~0xff,
> > -    (uint8_t)~0x00,
> > +    (uint8_t)~0xfcU,
> > +    (uint8_t)~0xc2U,
> > +    (uint8_t)~0xf0U,
> > +    (uint8_t)~0xc0U,
> > +    (uint8_t)~0xf1U,
> > +    (uint8_t)~0xffU,
> > +    (uint8_t)~0xffU,
> > +    (uint8_t)~0x00U,
> >  };
> >
> >  static const uint8_t gr_mask[9] = {
> > -    (uint8_t)~0xf0, /* 0x00 */
> > -    (uint8_t)~0xf0, /* 0x01 */
> > -    (uint8_t)~0xf0, /* 0x02 */
> > -    (uint8_t)~0xe0, /* 0x03 */
> > -    (uint8_t)~0xfc, /* 0x04 */
> > -    (uint8_t)~0x84, /* 0x05 */
> > -    (uint8_t)~0xf0, /* 0x06 */
> > -    (uint8_t)~0xf0, /* 0x07 */
> > -    (uint8_t)~0x00, /* 0x08 */
> > +    (uint8_t)~0xf0U,
> > +    (uint8_t)~0xf0U,
> > +    (uint8_t)~0xf0U,
> > +    (uint8_t)~0xe0U,
> > +    (uint8_t)~0xfcU,
> > +    (uint8_t)~0x84U,
> > +    (uint8_t)~0xf0U,
> > +    (uint8_t)~0xf0U,
> > +    (uint8_t)~0x00U,
> >  };
>
> I continue to question these changes. They don't fix anything, do they?
>

No, they do not. They were done just for uniformity here.
I will remove the changes in sr_mask and gr_mask.

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -291,7 +291,7 @@ static void enable_hypercall_page(struct domain *d)
> >       * calling convention) to differentiate Xen and Viridian hypercalls.
> >       */
> >      *(u8  *)(p + 0) = 0x0d; /* orl $0x80000000, %eax */
> > -    *(u32 *)(p + 1) = 0x80000000;
> > +    *(u32 *)(p + 1) = 0x80000000U;
> >      *(u8  *)(p + 5) = 0x0f; /* vmcall/vmmcall */
> >      *(u8  *)(p + 6) = 0x01;
> >      *(u8  *)(p + 7) = (cpu_has_vmx ? 0xc1 : 0xd9);
>
> Please can this and ...
>
> > --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> > +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> > @@ -471,30 +471,30 @@ typedef struct _HV_REFERENCE_TSC_PAGE {
> >
> >  /* Define hypervisor message types. */
> >  enum hv_message_type {
> > -     HVMSG_NONE                      = 0x00000000,
> > +     HVMSG_NONE                      = 0x00000000U,
> >
> >       /* Memory access messages. */
> > -     HVMSG_UNMAPPED_GPA              = 0x80000000,
> > -     HVMSG_GPA_INTERCEPT             = 0x80000001,
> > +     HVMSG_UNMAPPED_GPA              = 0x80000000U,
> > +     HVMSG_GPA_INTERCEPT             = 0x80000001U,
> >
> >       /* Timer notification messages. */
> > -     HVMSG_TIMER_EXPIRED                     = 0x80000010,
> > +     HVMSG_TIMER_EXPIRED                     = 0x80000010U,
> >
> >       /* Error messages. */
> > -     HVMSG_INVALID_VP_REGISTER_VALUE = 0x80000020,
> > -     HVMSG_UNRECOVERABLE_EXCEPTION   = 0x80000021,
> > -     HVMSG_UNSUPPORTED_FEATURE               = 0x80000022,
> > +     HVMSG_INVALID_VP_REGISTER_VALUE = 0x80000020U,
> > +     HVMSG_UNRECOVERABLE_EXCEPTION   = 0x80000021U,
> > +     HVMSG_UNSUPPORTED_FEATURE               = 0x80000022U,
> >
> >       /* Trace buffer complete messages. */
> > -     HVMSG_EVENTLOG_BUFFERCOMPLETE   = 0x80000040,
> > +     HVMSG_EVENTLOG_BUFFERCOMPLETE   = 0x80000040U,
> >
> >       /* Platform-specific processor intercept messages. */
> > -     HVMSG_X64_IOPORT_INTERCEPT              = 0x80010000,
> > -     HVMSG_X64_MSR_INTERCEPT         = 0x80010001,
> > -     HVMSG_X64_CPUID_INTERCEPT               = 0x80010002,
> > -     HVMSG_X64_EXCEPTION_INTERCEPT   = 0x80010003,
> > -     HVMSG_X64_APIC_EOI                      = 0x80010004,
> > -     HVMSG_X64_LEGACY_FP_ERROR               = 0x80010005
> > +     HVMSG_X64_IOPORT_INTERCEPT              = 0x80010000U,
> > +     HVMSG_X64_MSR_INTERCEPT         = 0x80010001U,
> > +     HVMSG_X64_CPUID_INTERCEPT               = 0x80010002U,
> > +     HVMSG_X64_EXCEPTION_INTERCEPT   = 0x80010003U,
> > +     HVMSG_X64_APIC_EOI                      = 0x80010004U,
> > +     HVMSG_X64_LEGACY_FP_ERROR               = 0x80010005U
> >  };
>
> ... this together be made a separate Viridian-specific change? (I
> continue to be uncertain about touching the header file; the
> Viridian maintainers will need to judge.)
>

Ok, I will split the patch.


> > --- a/xen/arch/x86/include/asm/x86-defns.h
> > +++ b/xen/arch/x86/include/asm/x86-defns.h
> > @@ -103,7 +103,7 @@
> >  /*
> >   * Debug status flags in DR6.
> >   */
> > -#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
> > +#define X86_DR6_DEFAULT         0xffff0ff0U  /* Default %dr6 value. */
>
> Considering the respective register is pointer-/long-size, wouldn't
> this better use UL? But of course we'd want to check that this then
> doesn't affect code in do_debug() in an undesirable way.
>
> Jan
>


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000565cbb05ffd3bb98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno gio 6 lug 2023 alle ore 10:=
26 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</=
a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 05.07.2023 17:26, Simone Ballarin wrote:<br>
&gt; --- a/xen/arch/x86/apic.c<br>
&gt; +++ b/xen/arch/x86/apic.c<br>
&gt; @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Setup the APIC counter to maximum. There i=
s no way the lapic<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* can underflow in the 100ms detection time =
frame.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffffff);<br>
&gt; +=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffffffU);<br>
<br>
While making the change less mechanical, we want to consider to switch<br>
to ~0 in this and similar cases.<br></blockquote><div><br></div><div>Changi=
ng ~0U is more than not mechanical: it is possibly dangerous.</div><div>The=
 resulting value could be different depending on the architecture,</div><di=
v>I prefer to not make such kind of changes in a MISRA-related patch.<br></=
div><div>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; @@ -378,9 +378,9 @@ static void __init calculate_host_policy(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* this information.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( cpu_has_lfence_dispatch )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_extd_leaf =3D max(max_extd_leaf, 0x80=
000021);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_extd_leaf =3D max(max_extd_leaf, 0x80=
000021U);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 p-&gt;extd.max_leaf =3D 0x80000000 | min_t(uint32_t, ma=
x_extd_leaf &amp; 0xffff,<br>
&gt; +=C2=A0 =C2=A0 p-&gt;extd.max_leaf =3D 0x80000000U | min_t(uint32_t, m=
ax_extd_leaf &amp; 0xffffU,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARRAY_SIZE(p-&gt;extd.raw) - 1);<br>
<br>
Adjustments like this or ...<br>
<br>
&gt; @@ -768,7 +768,7 @@ void recalculate_cpuid_policy(struct domain *d)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 p-&gt;basic.max_leaf=C2=A0 =C2=A0=3D min(p-&gt;bas=
ic.max_leaf,=C2=A0 =C2=A0max-&gt;basic.max_leaf);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 p-&gt;feat.max_subleaf =3D min(p-&gt;feat.max_subl=
eaf, max-&gt;feat.max_subleaf);<br>
&gt; -=C2=A0 =C2=A0 p-&gt;extd.max_leaf=C2=A0 =C2=A0 =3D 0x80000000 | min(p=
-&gt;extd.max_leaf &amp; 0xffff,<br>
&gt; +=C2=A0 =C2=A0 p-&gt;extd.max_leaf=C2=A0 =C2=A0 =3D 0x80000000U | min(=
p-&gt;extd.max_leaf &amp; 0xffff,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0((p-&gt;x86_vendor &amp; (X86_VENDOR_AMD |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 X86_VENDOR_HYGON))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ? CPUID_GUEST_NR_EXTD_AMD<br>
<br>
... this also need to adjust indentation of the following lines.<br></block=
quote><div>Ok. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; --- a/xen/arch/x86/cpu/mcheck/mce-apei.c<br>
&gt; +++ b/xen/arch/x86/cpu/mcheck/mce-apei.c<br>
&gt; @@ -37,11 +37,11 @@<br>
&gt;=C2=A0 #include &quot;mce.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define CPER_CREATOR_MCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0UUID_LE(0x75a574e3, 0x5052, 0x4b29, 0x8a, 0x8e, 0=
xbe, 0x2c,=C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x64, 0x90, 0xb8, 0x9=
d)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0UUID_LE(0x75a574e3U, 0x5052U, 0x4b29U, 0x8aU, 0x8=
eU, 0xbeU, 0x2cU,=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x64U, 0x90U, 0xb8U, =
0x9dU)<br>
&gt;=C2=A0 #define CPER_SECTION_TYPE_MCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0UUID_LE(0xfe08ffbe, 0x95e4, 0x4be7, 0xbc, 0x73, 0=
x40, 0x96,=C2=A0 =C2=A0 =C2=A0\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04, 0x4a, 0x38, 0xf=
c)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0UUID_LE(0xfe08ffbeU, 0x95e4U, 0x4be7U, 0xbcU, 0x7=
3U, 0x40U, 0x96U,=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04U, 0x4aU, 0x38U, =
0xfcU)<br>
<br>
See the earlier (EFI) comment regarding excessive use of suffixes here.<br>=
</blockquote><div>Ok. <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; --- a/xen/arch/x86/hvm/stdvga.c<br>
&gt; +++ b/xen/arch/x86/hvm/stdvga.c<br>
&gt; @@ -39,46 +39,46 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define PAT(x) (x)<br>
&gt;=C2=A0 static const uint32_t mask16[16] =3D {<br>
&gt; -=C2=A0 =C2=A0 PAT(0x00000000),<br>
&gt; -=C2=A0 =C2=A0 PAT(0x000000ff),<br>
&gt; -=C2=A0 =C2=A0 PAT(0x0000ff00),<br>
&gt; -=C2=A0 =C2=A0 PAT(0x0000ffff),<br>
&gt; -=C2=A0 =C2=A0 PAT(0x00ff0000),<br>
&gt; -=C2=A0 =C2=A0 PAT(0x00ff00ff),<br>
&gt; -=C2=A0 =C2=A0 PAT(0x00ffff00),<br>
&gt; -=C2=A0 =C2=A0 PAT(0x00ffffff),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xff000000),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xff0000ff),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xff00ff00),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xff00ffff),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xffff0000),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xffff00ff),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xffffff00),<br>
&gt; -=C2=A0 =C2=A0 PAT(0xffffffff),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x00000000U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x000000ffU),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x0000ff00U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x0000ffffU),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x00ff0000U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x00ff00ffU),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x00ffff00U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0x00ffffffU),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xff000000U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xff0000ffU),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xff00ff00U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xff00ffffU),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xffff0000U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xffff00ffU),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xffffff00U),<br>
&gt; +=C2=A0 =C2=A0 PAT(0xffffffffU),<br>
&gt;=C2=A0 };<br>
<br>
While I agree here, ...<br>
<br>
&gt;=C2=A0 /* force some bits to zero */<br>
&gt;=C2=A0 static const uint8_t sr_mask[8] =3D {<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xfc,<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xc2,<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xf0,<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xc0,<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xf1,<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xff,<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xff,<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0x00,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xfcU,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xc2U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xf0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xc0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xf1U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xffU,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xffU,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0x00U,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const uint8_t gr_mask[9] =3D {<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xf0, /* 0x00 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xf0, /* 0x01 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xf0, /* 0x02 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xe0, /* 0x03 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xfc, /* 0x04 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0x84, /* 0x05 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xf0, /* 0x06 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0xf0, /* 0x07 */<br>
&gt; -=C2=A0 =C2=A0 (uint8_t)~0x00, /* 0x08 */<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xf0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xf0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xf0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xe0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xfcU,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0x84U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xf0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0xf0U,<br>
&gt; +=C2=A0 =C2=A0 (uint8_t)~0x00U,<br>
&gt;=C2=A0 };<br>
<br>
I continue to question these changes. They don&#39;t fix anything, do they?=
<br>=C2=A0</blockquote><div>No, they do not. They were done just for unifor=
mity here.</div><div>I will remove the changes in sr_mask and gr_mask.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; --- a/xen/arch/x86/hvm/viridian/viridian.c<br>
&gt; +++ b/xen/arch/x86/hvm/viridian/viridian.c<br>
&gt; @@ -291,7 +291,7 @@ static void enable_hypercall_page(struct domain *d=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* calling convention) to differentiate Xen a=
nd Viridian hypercalls.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *(u8=C2=A0 *)(p + 0) =3D 0x0d; /* orl $0x80000000,=
 %eax */<br>
&gt; -=C2=A0 =C2=A0 *(u32 *)(p + 1) =3D 0x80000000;<br>
&gt; +=C2=A0 =C2=A0 *(u32 *)(p + 1) =3D 0x80000000U;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *(u8=C2=A0 *)(p + 5) =3D 0x0f; /* vmcall/vmmcall *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *(u8=C2=A0 *)(p + 6) =3D 0x01;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *(u8=C2=A0 *)(p + 7) =3D (cpu_has_vmx ? 0xc1 : 0xd=
9);<br>
<br>
Please can this and ...<br>
<br>
&gt; --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h<br>
&gt; +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h<br>
&gt; @@ -471,30 +471,30 @@ typedef struct _HV_REFERENCE_TSC_PAGE {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* Define hypervisor message types. */<br>
&gt;=C2=A0 enum hv_message_type {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_NONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00000000,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_NONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00000000U,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Memory access messages. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_UNMAPPED_GPA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x80000000,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_GPA_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D 0x80000001,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_UNMAPPED_GPA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x80000000U,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_GPA_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D 0x80000001U,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Timer notification messages. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_TIMER_EXPIRED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80000010,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_TIMER_EXPIRED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80000010U,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Error messages. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_INVALID_VP_REGISTER_VALUE =3D 0x80000020,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_UNRECOVERABLE_EXCEPTION=C2=A0 =C2=A0=3D 0x8=
0000021,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_UNSUPPORTED_FEATURE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80000022,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_INVALID_VP_REGISTER_VALUE =3D 0x80000020U,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_UNRECOVERABLE_EXCEPTION=C2=A0 =C2=A0=3D 0x8=
0000021U,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_UNSUPPORTED_FEATURE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80000022U,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Trace buffer complete messages. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_EVENTLOG_BUFFERCOMPLETE=C2=A0 =C2=A0=3D 0x8=
0000040,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_EVENTLOG_BUFFERCOMPLETE=C2=A0 =C2=A0=3D 0x8=
0000040U,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Platform-specific processor intercept mes=
sages. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_X64_IOPORT_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x80010000,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_X64_MSR_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 0x80010001,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_X64_CPUID_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80010002,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_X64_EXCEPTION_INTERCEPT=C2=A0 =C2=A0=3D 0x8=
0010003,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_X64_APIC_EOI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x80010004,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0HVMSG_X64_LEGACY_FP_ERROR=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80010005<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_X64_IOPORT_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x80010000U,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_X64_MSR_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D 0x80010001U,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_X64_CPUID_INTERCEPT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80010002U,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_X64_EXCEPTION_INTERCEPT=C2=A0 =C2=A0=3D 0x8=
0010003U,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_X64_APIC_EOI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x80010004U,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0HVMSG_X64_LEGACY_FP_ERROR=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x80010005U<br>
&gt;=C2=A0 };<br>
<br>
... this together be made a separate Viridian-specific change? (I<br>
continue to be uncertain about touching the header file; the<br>
Viridian maintainers will need to judge.)<br>=C2=A0</blockquote><div>Ok, I =
will split the patch.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; --- a/xen/arch/x86/include/asm/x86-defns.h<br>
&gt; +++ b/xen/arch/x86/include/asm/x86-defns.h<br>
&gt; @@ -103,7 +103,7 @@<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Debug status flags in DR6.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define X86_DR6_DEFAULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xffff0ff0=
=C2=A0 /* Default %dr6 value. */<br>
&gt; +#define X86_DR6_DEFAULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xffff0ff0U=
=C2=A0 /* Default %dr6 value. */<br>
<br>
Considering the respective register is pointer-/long-size, wouldn&#39;t<br>
this better use UL? But of course we&#39;d want to check that this then<br>
doesn&#39;t affect code in do_debug() in an undesirable way.<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--000000000000565cbb05ffd3bb98--

