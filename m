Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD728971B4C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794518.1203481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snedx-0001sx-Q0; Mon, 09 Sep 2024 13:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794518.1203481; Mon, 09 Sep 2024 13:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snedx-0001qu-Mf; Mon, 09 Sep 2024 13:41:25 +0000
Received: by outflank-mailman (input) for mailman id 794518;
 Mon, 09 Sep 2024 13:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snedw-0001qO-4R
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:41:24 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 332bd3ba-6eb1-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 15:41:23 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-278279a3a39so2733856fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:41:22 -0700 (PDT)
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
X-Inumbo-ID: 332bd3ba-6eb1-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725889281; x=1726494081; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjojD6BknVzkienTNoSLngXOgIUhK7tGYDUgKHLWy5c=;
        b=Nl603WESH0jX8YYc9F7vgjC7Ue8rYPvlB6ynGB61whIonSoDPXch4cjr1Jq8TgMzY1
         PtUuwSL6IA2neHKsLe3XU25F+8GN1hmNnDTxfvgeZLGv3wk12hgMeee8Id2T/be3aIOr
         GI9pd1/IlCGWCV6pZsxeBybTaco/MOd6h3rcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889281; x=1726494081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjojD6BknVzkienTNoSLngXOgIUhK7tGYDUgKHLWy5c=;
        b=M0YOdPVb8rqp3XMxyVoO84vKdjO5nd9/IwryNGQs/NFOhJ867TCELcYJUPiU0sJgtO
         6wDeK9X6tyiEzd1e92fJxtuzcCOPuIK1orTGFutSHK4yZdgLrXuvt7DmYWHdS8fk24mi
         YdP/9Qh4fOtwupcTh5QPwW9bzVQ7Miyi+PnXS4VEI+if6tjVL9UlHtF2mBzWzvJskNkK
         lN3NEj9ocmlb+z/trGdKK1p/HocZffU/qjOoVmXgBlKMf1s9RiuoynzPk2e8Uscc75wm
         akyx0gGZo/bB+na2H5vqgNNk3ilfY8UHOlanI0BIButrx9NsCwx76OIWfcamqwvlUynN
         Xg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRrjXwsmMw+mbufh1keGpLv1W3YCzw01Zw6aR5Kbppe0HQIpTRy3Uh6KXke6PvhJYxOxrGGTzvnFA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxx4163+kqEAK6Y0BqwciBlvfaxHHv4EzKYeFAy1D/ZzSMHy8y1
	7z2ng1n7zmf3Bc8vVJSXCltQZSpwjENGLUkiHjUvLU9PBEquxFC5aR61WoJuBwxP1Q50+0Qwurv
	XNfAS8P621YBO6yvf77NFTYziF/2ywzJ4wEoNfQ==
X-Google-Smtp-Source: AGHT+IHy1gVpHZHAm5FGWBaF+wrhsPDENlovtQ9G91tXGY0TcKFNXCWkH2xLZKRdL/ueIhIezmtDT9p+hHum+I8Y6QA=
X-Received: by 2002:a05:6870:3290:b0:277:c084:5f75 with SMTP id
 586e51a60fabf-27b82e1710fmr12587185fac.18.1725889281324; Mon, 09 Sep 2024
 06:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240909100806.47280-1-frediano.ziglio@cloud.com> <abe1c3a2-2838-4756-a06f-f347e4fcd78e@suse.com>
In-Reply-To: <abe1c3a2-2838-4756-a06f-f347e4fcd78e@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 14:41:09 +0100
Message-ID: <CACHz=ZjsoJRM0Y1cVFK186NzJu=_sNxFhHyMyfaR_3p4h4e-nQ@mail.gmail.com>
Subject: Re: [PATCH] Define and use UINT64_C and INT64_C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000008911240621afe902"

--0000000000008911240621afe902
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:38=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 09.09.2024 12:08, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/include/asm/config.h
> > +++ b/xen/arch/x86/include/asm/config.h
> > @@ -86,10 +86,10 @@
> >  #include <xen/const.h>
> >
> >  #define PML4_ENTRY_BITS  39
> > -#define PML4_ENTRY_BYTES (_AC(1,UL) << PML4_ENTRY_BITS)
> > +#define PML4_ENTRY_BYTES (UINT64_C(1) << PML4_ENTRY_BITS)
> >  #define PML4_ADDR(_slot)                              \
> > -    (((_AC(_slot, UL) >> 8) * _AC(0xffff000000000000,UL)) | \
> > -     (_AC(_slot, UL) << PML4_ENTRY_BITS))
> > +    (((UINT64_C(_slot) >> 8) * UINT64_C(0xffff000000000000)) | \
> > +     (UINT64_C(_slot) << PML4_ENTRY_BITS))
> >
> >  /*
> >   * Memory layout:
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -20,7 +20,7 @@
> >  #define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
> >
> >  #define PG_shift(idx)   (BITS_PER_LONG - (idx))
> > -#define PG_mask(x, idx) (x ## UL << PG_shift(idx))
> > +#define PG_mask(x, idx) (UINT64_C(x) << PG_shift(idx))
> >
> >   /* The following page types are MUTUALLY EXCLUSIVE. */
> >  #define PGT_none          PG_mask(0, 3)  /* no special uses of this
> page   */
> > @@ -59,7 +59,7 @@
> >
> >   /* Count of uses of this frame as its current type. */
> >  #define PGT_count_width   PG_shift(9)
> > -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
> > +#define PGT_count_mask    ((UINT64_C(1)<<PGT_count_width)-1)
> >
> >  /* Are the 'type mask' bits identical? */
> >  #define PGT_type_equal(x, y) (!(((x) ^ (y)) & PGT_type_mask))
> > @@ -97,7 +97,7 @@
> >  #else
> >  #define PGC_count_width   PG_shift(6)
> >  #endif
> > -#define PGC_count_mask    ((1UL<<PGC_count_width)-1)
> > +#define PGC_count_mask    ((UINT64_C(1)<<PGC_count_width)-1)
> >
> >  /*
> >   * Page needs to be scrubbed. Since this bit can only be set on a page
> that is
> > @@ -499,9 +499,9 @@ static inline int get_page_and_type(struct page_inf=
o
> *page,
> >   */
> >  #undef  machine_to_phys_mapping
> >  #define machine_to_phys_mapping  ((unsigned long *)RDWR_MPT_VIRT_START=
)
> > -#define INVALID_M2P_ENTRY        (~0UL)
> > -#define VALID_M2P(_e)            (!((_e) & (1UL<<(BITS_PER_LONG-1))))
> > -#define SHARED_M2P_ENTRY         (~0UL - 1UL)
> > +#define INVALID_M2P_ENTRY        (~UINT64_C(0))
> > +#define VALID_M2P(_e)            (!((_e) &
> (UINT64_C(1)<<(BITS_PER_LONG-1))))
> > +#define SHARED_M2P_ENTRY         (~UINT64_C(0) - UINT64_C(1))
> >  #define SHARED_M2P(_e)           ((_e) =3D=3D SHARED_M2P_ENTRY)
> >
> >  /*
> > --- a/xen/arch/x86/include/asm/x86_64/page.h
> > +++ b/xen/arch/x86/include/asm/x86_64/page.h
> > @@ -4,8 +4,8 @@
> >
> >  #define __XEN_VIRT_START        XEN_VIRT_START
> >
> > -#define VADDR_TOP_BIT           (1UL << (VADDR_BITS - 1))
> > -#define CANONICAL_MASK          (~0UL & ~VADDR_MASK)
> > +#define VADDR_TOP_BIT           (UINT64_C(1) << (VADDR_BITS - 1))
> > +#define CANONICAL_MASK          (~UINT64_C(0) & ~VADDR_MASK)
> >
> >  #define is_canonical_address(x) (((long)(x) >> 47) =3D=3D ((long)(x) >=
> 63))
> >
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1384,9 +1384,9 @@ void asmlinkage __init noreturn
> __start_xen(unsigned long mbi_p)
> >          }
> >
> >          if ( e > min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
> > -                     1UL << (PAGE_SHIFT + 32)) )
> > +                     UINT64_C(1) << (PAGE_SHIFT + 32)) )
> >              e =3D min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
> > -                    1UL << (PAGE_SHIFT + 32));
> > +                    UINT64_C(1) << (PAGE_SHIFT + 32));
>
> I disagree - we're dealing with virtual addresses here, which better
> wouldn't use fixed-width quantities.
>
>
I suppose you are suggesting type-based macros instead of fixed-type
macros, so something like PADDR_C  and VADDR_C.
That makes sense.


> While not always virtual addresses, I similarly disagree for most or all
> I've left in context further up: If the underlying type to deal with is
> unsigned long, constants should match.
>
>
Sure, in this case the underlying type if used as 32 bit cannot be unsigned
long but they should be unsigned long long (or any 64 bit type).

> --- a/xen/crypto/vmac.c
> > +++ b/xen/crypto/vmac.c
> > @@ -11,7 +11,9 @@
> >  #include <xen/types.h>
> >  #include <xen/lib.h>
> >  #include <crypto/vmac.h>
> > +#ifndef UINT64_C
> >  #define UINT64_C(x)  x##ULL
> > +#endif
> >  /* end for Xen */
>
> Here the #define should probably just be dropped?
>
>
If we go for newer type-base macros, we won't need to change here.


> > --- a/xen/include/crypto/vmac.h
> > +++ b/xen/include/crypto/vmac.h
> > @@ -51,12 +51,16 @@
> >  #elif (_MSC_VER)                  /* Microsoft C does not have
> stdint.h    */
> >  typedef unsigned __int32 uint32_t;
> >  typedef unsigned __int64 uint64_t;
> > +#ifndef UINT64_C
> >  #define UINT64_C(v) v ## UI64
> > +#endif
>
> This part surely isn't needed?
>
>
Indeed :-)


> > --- a/xen/include/xen/const.h
> > +++ b/xen/include/xen/const.h
> > @@ -15,10 +15,19 @@
> >  #ifdef __ASSEMBLY__
> >  #define _AC(X,Y)     X
> >  #define _AT(T,X)     X
> > +#define UINT64_C(X)     X
> > +#define INT64_C(X)      X
> >  #else
> >  #define __AC(X,Y)    (X##Y)
> >  #define _AC(X,Y)     __AC(X,Y)
> >  #define _AT(T,X)     ((T)(X))
> > +#if __SIZEOF_LONG__ >=3D 8
>
> This is available with gcc 4.3 and newer, yet for now our docs still
> specify 4.1.2 as the baseline.
>
>
Do we have some sort of configure generated macro for this?


> I'm also unconvinced of the >=3D - we're talking of fixed-width types her=
e,
> so imo it needs to be =3D=3D and then also ...
>
> > +#define UINT64_C(X)     X ## UL
> > +#define INT64_C(X)      X ## L
> > +#else
>
> #elif __SIZEOF_LONG_LONG__ =3D=3D 8
>
> here.
>
> > +#define UINT64_C(X)     X ## ULL
> > +#define INT64_C(X)      X ## LL
> > +#endif
> >  #endif
>
> Finally if we introduce these, imo we should introduce the other
> UINT<n>_C()
> as well, and in a header named after the one mandated by the C library
> spec.
>
> > --- a/xen/include/xen/stdint.h
> > +++ b/xen/include/xen/stdint.h
> > @@ -30,4 +30,6 @@ typedef __UINT64_TYPE__    uint64_t;
> >
> >  #endif
> >
> > +#include <xen/const.h>
>
> Why's this needed?
>
>
Not strictly needed, but in the standard headers they are usually defined
including stdint.h.


> Jan
>

Frediano

--0000000000008911240621afe902
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 11:38=E2=80=AFAM Jan Beulich &lt;<a href=3D"m=
ailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 09.09.2024 12:08, Frediano Zig=
lio wrote:<br>
&gt; --- a/xen/arch/x86/include/asm/config.h<br>
&gt; +++ b/xen/arch/x86/include/asm/config.h<br>
&gt; @@ -86,10 +86,10 @@<br>
&gt;=C2=A0 #include &lt;xen/const.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define PML4_ENTRY_BITS=C2=A0 39<br>
&gt; -#define PML4_ENTRY_BYTES (_AC(1,UL) &lt;&lt; PML4_ENTRY_BITS)<br>
&gt; +#define PML4_ENTRY_BYTES (UINT64_C(1) &lt;&lt; PML4_ENTRY_BITS)<br>
&gt;=C2=A0 #define PML4_ADDR(_slot)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; -=C2=A0 =C2=A0 (((_AC(_slot, UL) &gt;&gt; 8) * _AC(0xffff000000000000,=
UL)) | \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0(_AC(_slot, UL) &lt;&lt; PML4_ENTRY_BITS))<br>
&gt; +=C2=A0 =C2=A0 (((UINT64_C(_slot) &gt;&gt; 8) * UINT64_C(0xffff0000000=
00000)) | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(UINT64_C(_slot) &lt;&lt; PML4_ENTRY_BITS))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Memory layout:<br>
&gt; --- a/xen/arch/x86/include/asm/mm.h<br>
&gt; +++ b/xen/arch/x86/include/asm/mm.h<br>
&gt; @@ -20,7 +20,7 @@<br>
&gt;=C2=A0 #define PFN_ORDER(_pfn) ((_pfn)-&gt;v.free.order)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define PG_shift(idx)=C2=A0 =C2=A0(BITS_PER_LONG - (idx))<br>
&gt; -#define PG_mask(x, idx) (x ## UL &lt;&lt; PG_shift(idx))<br>
&gt; +#define PG_mask(x, idx) (UINT64_C(x) &lt;&lt; PG_shift(idx))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0/* The following page types are MUTUALLY EXCLUSIVE. */<br>
&gt;=C2=A0 #define PGT_none=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PG_mask(0, 3)=
=C2=A0 /* no special uses of this page=C2=A0 =C2=A0*/<br>
&gt; @@ -59,7 +59,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0/* Count of uses of this frame as its current type. */<br>
&gt;=C2=A0 #define PGT_count_width=C2=A0 =C2=A0PG_shift(9)<br>
&gt; -#define PGT_count_mask=C2=A0 =C2=A0 ((1UL&lt;&lt;PGT_count_width)-1)<=
br>
&gt; +#define PGT_count_mask=C2=A0 =C2=A0 ((UINT64_C(1)&lt;&lt;PGT_count_wi=
dth)-1)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* Are the &#39;type mask&#39; bits identical? */<br>
&gt;=C2=A0 #define PGT_type_equal(x, y) (!(((x) ^ (y)) &amp; PGT_type_mask)=
)<br>
&gt; @@ -97,7 +97,7 @@<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 #define PGC_count_width=C2=A0 =C2=A0PG_shift(6)<br>
&gt;=C2=A0 #endif<br>
&gt; -#define PGC_count_mask=C2=A0 =C2=A0 ((1UL&lt;&lt;PGC_count_width)-1)<=
br>
&gt; +#define PGC_count_mask=C2=A0 =C2=A0 ((UINT64_C(1)&lt;&lt;PGC_count_wi=
dth)-1)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Page needs to be scrubbed. Since this bit can only be se=
t on a page that is<br>
&gt; @@ -499,9 +499,9 @@ static inline int get_page_and_type(struct page_in=
fo *page,<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #undef=C2=A0 machine_to_phys_mapping<br>
&gt;=C2=A0 #define machine_to_phys_mapping=C2=A0 ((unsigned long *)RDWR_MPT=
_VIRT_START)<br>
&gt; -#define INVALID_M2P_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 (~0UL)<br>
&gt; -#define VALID_M2P(_e)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!((_e=
) &amp; (1UL&lt;&lt;(BITS_PER_LONG-1))))<br>
&gt; -#define SHARED_M2P_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(~0UL - 1UL=
)<br>
&gt; +#define INVALID_M2P_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 (~UINT64_C(0))<b=
r>
&gt; +#define VALID_M2P(_e)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!((_e=
) &amp; (UINT64_C(1)&lt;&lt;(BITS_PER_LONG-1))))<br>
&gt; +#define SHARED_M2P_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(~UINT64_C(=
0) - UINT64_C(1))<br>
&gt;=C2=A0 #define SHARED_M2P(_e)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
(_e) =3D=3D SHARED_M2P_ENTRY)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; --- a/xen/arch/x86/include/asm/x86_64/page.h<br>
&gt; +++ b/xen/arch/x86/include/asm/x86_64/page.h<br>
&gt; @@ -4,8 +4,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define __XEN_VIRT_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 XEN_VIRT_STA=
RT<br>
&gt;=C2=A0 <br>
&gt; -#define VADDR_TOP_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1UL &l=
t;&lt; (VADDR_BITS - 1))<br>
&gt; -#define CANONICAL_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (~0UL &amp; =
~VADDR_MASK)<br>
&gt; +#define VADDR_TOP_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(UINT64=
_C(1) &lt;&lt; (VADDR_BITS - 1))<br>
&gt; +#define CANONICAL_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (~UINT64_C(0=
) &amp; ~VADDR_MASK)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define is_canonical_address(x) (((long)(x) &gt;&gt; 47) =3D=3D =
((long)(x) &gt;&gt; 63))<br>
&gt;=C2=A0 <br>
&gt; --- a/xen/arch/x86/setup.c<br>
&gt; +++ b/xen/arch/x86/setup.c<br>
&gt; @@ -1384,9 +1384,9 @@ void asmlinkage __init noreturn __start_xen(unsi=
gned long mbi_p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( e &gt; min(HYPERVISOR_VIRT_END =
- DIRECTMAP_VIRT_START,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A01UL &lt;&lt; (PAGE_SHIFT + 32)) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0UINT64_C(1) &lt;&lt; (PAGE_SHIFT + 32)) )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D min(HYPERVISOR_V=
IRT_END - DIRECTMAP_VIRT_START,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 1UL &lt;&lt; (PAGE_SHIFT + 32));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 UINT64_C(1) &lt;&lt; (PAGE_SHIFT + 32));<br>
<br>
I disagree - we&#39;re dealing with virtual addresses here, which better<br=
>
wouldn&#39;t use fixed-width quantities.<br>
<br></blockquote><div><br></div><div>I suppose you are suggesting type-base=
d macros instead of fixed-type macros, so something like PADDR_C=C2=A0 and =
VADDR_C.</div><div>That makes sense.<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
While not always virtual addresses, I similarly disagree for most or all<br=
>
I&#39;ve left in context further up: If the underlying type to deal with is=
<br>
unsigned long, constants should match.<br>
<br></blockquote><div><br></div><div>Sure, in this case the underlying type=
 if used as 32 bit cannot be unsigned long but they should be unsigned long=
 long (or any 64 bit type).<br></div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; --- a/xen/crypto/vmac.c<br>
&gt; +++ b/xen/crypto/vmac.c<br>
&gt; @@ -11,7 +11,9 @@<br>
&gt;=C2=A0 #include &lt;xen/types.h&gt;<br>
&gt;=C2=A0 #include &lt;xen/lib.h&gt;<br>
&gt;=C2=A0 #include &lt;crypto/vmac.h&gt;<br>
&gt; +#ifndef UINT64_C<br>
&gt;=C2=A0 #define UINT64_C(x)=C2=A0 x##ULL<br>
&gt; +#endif<br>
&gt;=C2=A0 /* end for Xen */<br>
<br>
Here the #define should probably just be dropped?<br>
<br></blockquote><div><br></div><div>If we go for newer type-base macros, w=
e won&#39;t need to change here.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; --- a/xen/include/crypto/vmac.h<br>
&gt; +++ b/xen/include/crypto/vmac.h<br>
&gt; @@ -51,12 +51,16 @@<br>
&gt;=C2=A0 #elif (_MSC_VER)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Microsoft C does not have stdint.h=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 typedef unsigned __int32 uint32_t;<br>
&gt;=C2=A0 typedef unsigned __int64 uint64_t;<br>
&gt; +#ifndef UINT64_C<br>
&gt;=C2=A0 #define UINT64_C(v) v ## UI64<br>
&gt; +#endif<br>
<br>
This part surely isn&#39;t needed?<br>
<br></blockquote><div><br></div><div>Indeed :-)</div><div>=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; --- a/xen/include/xen/const.h<br>
&gt; +++ b/xen/include/xen/const.h<br>
&gt; @@ -15,10 +15,19 @@<br>
&gt;=C2=A0 #ifdef __ASSEMBLY__<br>
&gt;=C2=A0 #define _AC(X,Y)=C2=A0 =C2=A0 =C2=A0X<br>
&gt;=C2=A0 #define _AT(T,X)=C2=A0 =C2=A0 =C2=A0X<br>
&gt; +#define UINT64_C(X)=C2=A0 =C2=A0 =C2=A0X<br>
&gt; +#define INT64_C(X)=C2=A0 =C2=A0 =C2=A0 X<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 #define __AC(X,Y)=C2=A0 =C2=A0 (X##Y)<br>
&gt;=C2=A0 #define _AC(X,Y)=C2=A0 =C2=A0 =C2=A0__AC(X,Y)<br>
&gt;=C2=A0 #define _AT(T,X)=C2=A0 =C2=A0 =C2=A0((T)(X))<br>
&gt; +#if __SIZEOF_LONG__ &gt;=3D 8<br>
<br>
This is available with gcc 4.3 and newer, yet for now our docs still<br>
specify 4.1.2 as the baseline.<br>
<br></blockquote><div><br></div><div>Do we have some sort of configure gene=
rated macro for this?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
I&#39;m also unconvinced of the &gt;=3D - we&#39;re talking of fixed-width =
types here,<br>
so imo it needs to be =3D=3D and then also ...<br>
<br>
&gt; +#define UINT64_C(X)=C2=A0 =C2=A0 =C2=A0X ## UL<br>
&gt; +#define INT64_C(X)=C2=A0 =C2=A0 =C2=A0 X ## L<br>
&gt; +#else<br>
<br>
#elif __SIZEOF_LONG_LONG__ =3D=3D 8<br>
<br>
here.<br>
<br>
&gt; +#define UINT64_C(X)=C2=A0 =C2=A0 =C2=A0X ## ULL<br>
&gt; +#define INT64_C(X)=C2=A0 =C2=A0 =C2=A0 X ## LL<br>
&gt; +#endif<br>
&gt;=C2=A0 #endif<br>
<br>
Finally if we introduce these, imo we should introduce the other UINT&lt;n&=
gt;_C()<br>
as well, and in a header named after the one mandated by the C library spec=
.<br>
<br>
&gt; --- a/xen/include/xen/stdint.h<br>
&gt; +++ b/xen/include/xen/stdint.h<br>
&gt; @@ -30,4 +30,6 @@ typedef __UINT64_TYPE__=C2=A0 =C2=A0 uint64_t;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; +#include &lt;xen/const.h&gt;<br>
<br>
Why&#39;s this needed?<br>
<br></blockquote><div><br></div><div>Not strictly needed, but in the standa=
rd headers they are usually defined including stdint.h.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Jan<br></blockquote><div><br></div><div>Frediano</div><div>=C2=A0<br></div>=
</div></div>

--0000000000008911240621afe902--

