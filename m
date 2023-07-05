Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F52748C18
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 20:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559483.874498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH7SX-0005CN-AT; Wed, 05 Jul 2023 18:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559483.874498; Wed, 05 Jul 2023 18:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH7SX-000591-6a; Wed, 05 Jul 2023 18:42:37 +0000
Received: by outflank-mailman (input) for mailman id 559483;
 Wed, 05 Jul 2023 18:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH7SV-00058v-PM
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 18:42:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3ad1622-1b63-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 20:42:33 +0200 (CEST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by support.bugseng.com (Postfix) with ESMTPSA id 81F6C4EE0C88
 for <xen-devel@lists.xenproject.org>; Wed,  5 Jul 2023 20:42:32 +0200 (CEST)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-783f17f0a00so2295755241.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 11:42:32 -0700 (PDT)
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
X-Inumbo-ID: b3ad1622-1b63-11ee-b237-6b7b168915f2
X-Gm-Message-State: ABy/qLYf8RRgvOLPlTqQInI3aDU+iJbzLf2kVLBBmMW2QqrZNE1rNHfO
	KaGyrMSaiQ1+4p1rqeAZEkmznBRs0ERjuGu/h4o=
X-Google-Smtp-Source: APBJJlHy8XOXH0o6ndqvqU1gTE0sKaHFjr3+GiU7oeQgumsNnlLCA6YBLQ5ldhndIz+h92gZ/fGAh0FWBB8+02YiLG4=
X-Received: by 2002:a67:d097:0:b0:443:4e53:97c7 with SMTP id
 s23-20020a67d097000000b004434e5397c7mr9074vsi.3.1688582551214; Wed, 05 Jul
 2023 11:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <76cf70cb43492966fbcf77d7a2d67d90fe0a32d4.1688559115.git.gianluca.luparini@bugseng.com>
 <00B5545B-7564-4AA6-9654-48FB30A074A4@arm.com>
In-Reply-To: <00B5545B-7564-4AA6-9654-48FB30A074A4@arm.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 5 Jul 2023 20:42:19 +0200
X-Gmail-Original-Message-ID: <CAFHJcJtgGQXVTJc9ibpmXHA7oZR1wd-GMVCKAJKZhJm+BTCk2Q@mail.gmail.com>
Message-ID: <CAFHJcJtgGQXVTJc9ibpmXHA7oZR1wd-GMVCKAJKZhJm+BTCk2Q@mail.gmail.com>
Subject: Re: [XEN PATCH v2 13/13] xen: fix violations of MISRA C:2012 Rule 7.2
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	"consulting@bugseng.com" <consulting@bugseng.com>, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Content-Type: multipart/alternative; boundary="00000000000023a16405ffc1c315"

--00000000000023a16405ffc1c315
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno mer 5 lug 2023 alle ore 18:43 Luca Fancellu <Luca.Fancellu@arm.co=
m>
ha scritto:

>
>
> > On 5 Jul 2023, at 16:26, Simone Ballarin <simone.ballarin@bugseng.com>
> wrote:
> >
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> >
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> > headline states:
> > "A 'u' or 'U' suffix shall be applied to all integer constants
> > that are represented in an unsigned type".
> >
> > Add the 'U' suffix to integers literals with unsigned type and also to
> other
> > literals used in the same contexts or near violations, when their
> positive
> > nature is immediately clear. The latter changes are done for the sake o=
f
> > uniformity.
> >
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > ---
> > Changes in v2:
> > - minor change to commit title
> > - change commit message
> > - add '(uint32_t)' in 'muldiv64.c' for consistency
> > - add fix in 'vesa.c'
> > ---
> > xen/common/gunzip.c          |  2 +-
> > xen/common/xmalloc_tlsf.c    |  2 +-
> > xen/drivers/char/ehci-dbgp.c |  4 ++--
> > xen/drivers/video/vesa.c     |  2 +-
> > xen/include/public/memory.h  |  2 +-
> > xen/include/public/sysctl.h  |  4 ++--
> > xen/include/xen/bitops.h     | 10 +++++-----
> > xen/include/xen/cper.h       | 34 +++++++++++++++++-----------------
> > xen/lib/muldiv64.c           |  2 +-
> > 9 files changed, 31 insertions(+), 31 deletions(-)
> >
> > diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
> > index 71ec5f26be..b810499be2 100644
> > --- a/xen/common/gunzip.c
> > +++ b/xen/common/gunzip.c
> > @@ -11,7 +11,7 @@ static unsigned char *__initdata window;
> > static memptr __initdata free_mem_ptr;
> > static memptr __initdata free_mem_end_ptr;
> >
> > -#define WSIZE           0x80000000
> > +#define WSIZE           0x80000000U
> >
> > static unsigned char *__initdata inbuf;
> > static unsigned int __initdata insize;
> > diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
> > index 75bdf18c4e..c21bf71e88 100644
> > --- a/xen/common/xmalloc_tlsf.c
> > +++ b/xen/common/xmalloc_tlsf.c
> > @@ -46,7 +46,7 @@
> > #define BHDR_OVERHEAD   (sizeof(struct bhdr) - MIN_BLOCK_SIZE)
> >
> > #define PTR_MASK        (sizeof(void *) - 1)
> > -#define BLOCK_SIZE_MASK (0xFFFFFFFF - PTR_MASK)
> > +#define BLOCK_SIZE_MASK (0xFFFFFFFFU - PTR_MASK)
> >
> > #define GET_NEXT_BLOCK(addr, r) ((struct bhdr *) \
> >                                 ((char *)(addr) + (r)))
> > diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.=
c
> > index bb9d3198d9..4d8d765122 100644
> > --- a/xen/drivers/char/ehci-dbgp.c
> > +++ b/xen/drivers/char/ehci-dbgp.c
> > @@ -375,12 +375,12 @@ static inline u32 dbgp_pid_write_update(u32 x, u3=
2
> tok)
> >     static u8 data0 =3D USB_PID_DATA1;
> >
> >     data0 ^=3D USB_PID_DATA0 ^ USB_PID_DATA1;
> > -    return (x & 0xffff0000) | (data0 << 8) | (tok & 0xff);
> > +    return (x & 0xffff0000U) | (data0 << 8) | (tok & 0xffU);
> > }
> >
> > static inline u32 dbgp_pid_read_update(u32 x, u32 tok)
> > {
> > -    return (x & 0xffffff00) | (tok & 0xff);
> > +    return (x & 0xffffff00U) | (tok & 0xffU);
> > }
> >
> > static inline void dbgp_set_data(struct ehci_dbg_port __iomem
> *ehci_debug,
> > diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c
> > index c41f6b8d40..b007ff5678 100644
> > --- a/xen/drivers/video/vesa.c
> > +++ b/xen/drivers/video/vesa.c
> > @@ -123,7 +123,7 @@ void __init vesa_init(void)
> >     if ( vlfb_info.bits_per_pixel > 8 )
> >     {
> >         /* Light grey in truecolor. */
> > -        unsigned int grey =3D 0xaaaaaaaa;
> > +        unsigned int grey =3D 0xaaaaaaaaU;
> >         lfbp.pixel_on =3D
> >             ((grey >> (32 - vlfb_info.  red_size)) << vlfb_info.
> red_pos) |
> >             ((grey >> (32 - vlfb_info.green_size)) <<
> vlfb_info.green_pos) |
> > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > index c5f0d31e23..5e545ae9a4 100644
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -234,7 +234,7 @@ struct xen_add_to_physmap {
> >
> >     unsigned int space; /* =3D> enum phys_map_space */
> >
> > -#define XENMAPIDX_grant_table_status 0x80000000
> > +#define XENMAPIDX_grant_table_status 0x80000000U
> >
> >     /* Index into space being mapped. */
> >     xen_ulong_t idx;
> > diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> > index 33e86ace51..fa7147de47 100644
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -384,7 +384,7 @@ struct xen_sysctl_pm_op {
> >         struct xen_set_cpufreq_para set_para;
> >         uint64_aligned_t get_avgfreq;
> >         uint32_t                    set_sched_opt_smt;
> > -#define XEN_SYSCTL_CX_UNLIMITED 0xffffffff
> > +#define XEN_SYSCTL_CX_UNLIMITED 0xffffffffU
> >         uint32_t                    get_max_cstate;
> >         uint32_t                    set_max_cstate;
> >     } u;
> > @@ -547,7 +547,7 @@ struct xen_sysctl_numainfo {
> > #define XEN_SYSCTL_CPUPOOL_OP_RMCPU                 5  /* R */
> > #define XEN_SYSCTL_CPUPOOL_OP_MOVEDOMAIN            6  /* M */
> > #define XEN_SYSCTL_CPUPOOL_OP_FREEINFO              7  /* F */
> > -#define XEN_SYSCTL_CPUPOOL_PAR_ANY     0xFFFFFFFF
> > +#define XEN_SYSCTL_CPUPOOL_PAR_ANY     0xFFFFFFFFU
> > struct xen_sysctl_cpupool_op {
> >     uint32_t op;          /* IN */
> >     uint32_t cpupool_id;  /* IN: CDIARM OUT: CI */
> > diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> > index 33619a0873..3b7e09a26e 100644
> > --- a/xen/include/xen/bitops.h
> > +++ b/xen/include/xen/bitops.h
> > @@ -227,11 +227,11 @@ static inline __u32 ror32(__u32 word, unsigned in=
t
> shift)
> > }
> >
> > /* base-2 logarithm */
> > -#define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
> > -#define __L4(_x)  (((_x) & 0x0000000c) ? ( 2 + __L2( (_x)>> 2)) : __L2=
(
> _x))
> > -#define __L8(_x)  (((_x) & 0x000000f0) ? ( 4 + __L4( (_x)>> 4)) : __L4=
(
> _x))
> > -#define __L16(_x) (((_x) & 0x0000ff00) ? ( 8 + __L8( (_x)>> 8)) : __L8=
(
> _x))
> > -#define ilog2(_x) (((_x) & 0xffff0000) ? (16 + __L16((_x)>>16)) :
> __L16(_x))
> > +#define __L2(_x)  (((_x) & 0x00000002U) ?   1 : 0)
> > +#define __L4(_x)  (((_x) & 0x0000000cU) ? ( 2 + __L2( (_x)>> 2)) :
> __L2( _x))
> > +#define __L8(_x)  (((_x) & 0x000000f0U) ? ( 4 + __L4( (_x)>> 4)) :
> __L4( _x))
> > +#define __L16(_x) (((_x) & 0x0000ff00U) ? ( 8 + __L8( (_x)>> 8)) :
> __L8( _x))
> > +#define ilog2(_x) (((_x) & 0xffff0000U) ? (16 + __L16((_x)>>16)) :
> __L16(_x))
> >
> > /**
> >  * for_each_set_bit - iterate over every set bit in a memory region
> > diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h
> > index f8e5272bc1..71d14faa02 100644
> > --- a/xen/include/xen/cper.h
> > +++ b/xen/include/xen/cper.h
> > @@ -56,7 +56,7 @@ static inline uint64_t cper_next_record_id(void)
> > #define CPER_SIG_RECORD "CPER"
> > #define CPER_SIG_SIZE 4
> > /* Used in signature_end field in struct cper_record_header */
> > -#define CPER_SIG_END 0xffffffff
> > +#define CPER_SIG_END 0xffffffffU
> >
> > /*
> >  * CPER record header revision, used in revision field in struct
> > @@ -80,36 +80,36 @@ static inline uint64_t cper_next_record_id(void)
> >  * Corrected Machine Check
> >  */
> > #define CPER_NOTIFY_CMC \
> > - UUID_LE(0x2DCE8BB1, 0xBDD7, 0x450e, 0xB9, 0xAD, 0x9C, 0xF4, \
> > - 0xEB, 0xD4, 0xF8, 0x90)
> > + UUID_LE(0x2DCE8BB1U, 0xBDD7U, 0x450eU, 0xB9U, 0xADU, 0x9CU, 0xF4U, \
> > + 0xEBU, 0xD4U, 0xF8U, 0x90U)
> > /* Corrected Platform Error */
> > #define CPER_NOTIFY_CPE \
> > - UUID_LE(0x4E292F96, 0xD843, 0x4a55, 0xA8, 0xC2, 0xD4, 0x81, \
> > - 0xF2, 0x7E, 0xBE, 0xEE)
> > + UUID_LE(0x4E292F96U, 0xD843U, 0x4a55U, 0xA8U, 0xC2U, 0xD4U, 0x81U, \
> > + 0xF2U, 0x7EU, 0xBEU, 0xEEU)
> > /* Machine Check Exception */
> > #define CPER_NOTIFY_MCE \
> > - UUID_LE(0xE8F56FFE, 0x919C, 0x4cc5, 0xBA, 0x88, 0x65, 0xAB, \
> > - 0xE1, 0x49, 0x13, 0xBB)
> > + UUID_LE(0xE8F56FFEU, 0x919CU, 0x4cc5U, 0xBAU, 0x88U, 0x65U, 0xABU, \
> > + 0xE1U, 0x49U, 0x13U, 0xBBU)
> > /* PCI Express Error */
> > #define CPER_NOTIFY_PCIE \
> > - UUID_LE(0xCF93C01F, 0x1A16, 0x4dfc, 0xB8, 0xBC, 0x9C, 0x4D, \
> > - 0xAF, 0x67, 0xC1, 0x04)
> > + UUID_LE(0xCF93C01FU, 0x1A16U, 0x4dfcU, 0xB8U, 0xBCU, 0x9CU, 0x4DU, \
> > + 0xAFU, 0x67U, 0xC1U, 0x04U)
> > /* INIT Record (for IPF) */
> > #define CPER_NOTIFY_INIT \
> > - UUID_LE(0xCC5263E8, 0x9308, 0x454a, 0x89, 0xD0, 0x34, 0x0B, \
> > - 0xD3, 0x9B, 0xC9, 0x8E)
> > + UUID_LE(0xCC5263E8U, 0x9308U, 0x454aU, 0x89U, 0xD0U, 0x34U, 0x0BU, \
> > + 0xD3U, 0x9BU, 0xC9U, 0x8EU)
> > /* Non-Maskable Interrupt */
> > #define CPER_NOTIFY_NMI \
> > - UUID_LE(0x5BAD89FF, 0xB7E6, 0x42c9, 0x81, 0x4A, 0xCF, 0x24, \
> > - 0x85, 0xD6, 0xE9, 0x8A)
> > + UUID_LE(0x5BAD89FFU, 0xB7E6U, 0x42c9U, 0x81U, 0x4AU, 0xCFU, 0x24U, \
> > + 0x85U, 0xD6U, 0xE9U, 0x8AU)
> > /* BOOT Error Record */
> > #define CPER_NOTIFY_BOOT \
> > - UUID_LE(0x3D61A466, 0xAB40, 0x409a, 0xA6, 0x98, 0xF3, 0x62, \
> > - 0xD4, 0x64, 0xB3, 0x8F)
> > + UUID_LE(0x3D61A466U, 0xAB40U, 0x409aU, 0xA6U, 0x98U, 0xF3U, 0x62U, \
> > + 0xD4U, 0x64U, 0xB3U, 0x8FU)
> > /* DMA Remapping Error */
> > #define CPER_NOTIFY_DMAR \
> > - UUID_LE(0x667DD791, 0xC6B3, 0x4c27, 0x8A, 0x6B, 0x0F, 0x8E, \
> > - 0x72, 0x2D, 0xEB, 0x41)
> > + UUID_LE(0x667DD791U, 0xC6B3U, 0x4c27U, 0x8AU, 0x6BU, 0x0FU, 0x8EU, \
> > + 0x72U, 0x2DU, 0xEBU, 0x41U)
> >
> > /*
> >  * Flags bits definitions for flags in struct cper_record_header
> > diff --git a/xen/lib/muldiv64.c b/xen/lib/muldiv64.c
> > index 78177ce616..e9bacc4c59 100644
> > --- a/xen/lib/muldiv64.c
> > +++ b/xen/lib/muldiv64.c
> > @@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
> >     rh =3D (uint64_t)u.l.high * (uint64_t)b;
> >     rh +=3D (rl >> 32);
> >     res.l.high =3D rh / c;
> > -    res.l.low =3D (((rh % c) << 32) + (rl & 0xffffffff)) / c;
> > +    res.l.low =3D (((rh % c) << 32) + ((uint32_t)rl & 0xffffffffU)) / =
c;
>
> Why the explicit cast on rl? Shouldn=E2=80=99t it work without it?
>
> Yes, the cast is not related to the MISRA rule.
It was requested by Jan in "[XEN PATCH 00/13] xen: fixed violations of
MISRA C:2012 Rule 7.2"
to be more consistent with the surrounding code.


> >
> >     return res.ll;
>


--=20
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--00000000000023a16405ffc1c315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 5 lug 2023 alle ore 18:=
43 Luca Fancellu &lt;<a href=3D"mailto:Luca.Fancellu@arm.com">Luca.Fancellu=
@arm.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
<br>
&gt; On 5 Jul 2023, at 16:26, Simone Ballarin &lt;<a href=3D"mailto:simone.=
ballarin@bugseng.com" target=3D"_blank">simone.ballarin@bugseng.com</a>&gt;=
 wrote:<br>
&gt; <br>
&gt; From: Gianluca Luparini &lt;<a href=3D"mailto:gianluca.luparini@bugsen=
g.com" target=3D"_blank">gianluca.luparini@bugseng.com</a>&gt;<br>
&gt; <br>
&gt; The xen sources contains violations of MISRA C:2012 Rule 7.2 whose<br>
&gt; headline states:<br>
&gt; &quot;A &#39;u&#39; or &#39;U&#39; suffix shall be applied to all inte=
ger constants<br>
&gt; that are represented in an unsigned type&quot;.<br>
&gt; <br>
&gt; Add the &#39;U&#39; suffix to integers literals with unsigned type and=
 also to other<br>
&gt; literals used in the same contexts or near violations, when their posi=
tive<br>
&gt; nature is immediately clear. The latter changes are done for the sake =
of<br>
&gt; uniformity.<br>
&gt; <br>
&gt; Signed-off-by: Simone Ballarin &lt;<a href=3D"mailto:simone.ballarin@b=
ugseng.com" target=3D"_blank">simone.ballarin@bugseng.com</a>&gt;<br>
&gt; Signed-off-by: Gianluca Luparini &lt;<a href=3D"mailto:gianluca.lupari=
ni@bugseng.com" target=3D"_blank">gianluca.luparini@bugseng.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt; - minor change to commit title<br>
&gt; - change commit message<br>
&gt; - add &#39;(uint32_t)&#39; in &#39;muldiv64.c&#39; for consistency<br>
&gt; - add fix in &#39;vesa.c&#39;<br>
&gt; ---<br>
&gt; xen/common/gunzip.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; xen/common/xmalloc_tlsf.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; xen/drivers/char/ehci-dbgp.c |=C2=A0 4 ++--<br>
&gt; xen/drivers/video/vesa.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; xen/include/public/memory.h=C2=A0 |=C2=A0 2 +-<br>
&gt; xen/include/public/sysctl.h=C2=A0 |=C2=A0 4 ++--<br>
&gt; xen/include/xen/bitops.h=C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt; xen/include/xen/cper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 34 ++++++++++++++++=
+-----------------<br>
&gt; xen/lib/muldiv64.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
&gt; 9 files changed, 31 insertions(+), 31 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c<br>
&gt; index 71ec5f26be..b810499be2 100644<br>
&gt; --- a/xen/common/gunzip.c<br>
&gt; +++ b/xen/common/gunzip.c<br>
&gt; @@ -11,7 +11,7 @@ static unsigned char *__initdata window;<br>
&gt; static memptr __initdata free_mem_ptr;<br>
&gt; static memptr __initdata free_mem_end_ptr;<br>
&gt; <br>
&gt; -#define WSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80000000<br>
&gt; +#define WSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80000000U<br>
&gt; <br>
&gt; static unsigned char *__initdata inbuf;<br>
&gt; static unsigned int __initdata insize;<br>
&gt; diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c<br>
&gt; index 75bdf18c4e..c21bf71e88 100644<br>
&gt; --- a/xen/common/xmalloc_tlsf.c<br>
&gt; +++ b/xen/common/xmalloc_tlsf.c<br>
&gt; @@ -46,7 +46,7 @@<br>
&gt; #define BHDR_OVERHEAD=C2=A0 =C2=A0(sizeof(struct bhdr) - MIN_BLOCK_SIZ=
E)<br>
&gt; <br>
&gt; #define PTR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 (sizeof(void *) - 1)<br>
&gt; -#define BLOCK_SIZE_MASK (0xFFFFFFFF - PTR_MASK)<br>
&gt; +#define BLOCK_SIZE_MASK (0xFFFFFFFFU - PTR_MASK)<br>
&gt; <br>
&gt; #define GET_NEXT_BLOCK(addr, r) ((struct bhdr *) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((char *)(addr) + (r)))<br>
&gt; diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp=
.c<br>
&gt; index bb9d3198d9..4d8d765122 100644<br>
&gt; --- a/xen/drivers/char/ehci-dbgp.c<br>
&gt; +++ b/xen/drivers/char/ehci-dbgp.c<br>
&gt; @@ -375,12 +375,12 @@ static inline u32 dbgp_pid_write_update(u32 x, u=
32 tok)<br>
&gt;=C2=A0 =C2=A0 =C2=A0static u8 data0 =3D USB_PID_DATA1;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0data0 ^=3D USB_PID_DATA0 ^ USB_PID_DATA1;<br>
&gt; -=C2=A0 =C2=A0 return (x &amp; 0xffff0000) | (data0 &lt;&lt; 8) | (tok=
 &amp; 0xff);<br>
&gt; +=C2=A0 =C2=A0 return (x &amp; 0xffff0000U) | (data0 &lt;&lt; 8) | (to=
k &amp; 0xffU);<br>
&gt; }<br>
&gt; <br>
&gt; static inline u32 dbgp_pid_read_update(u32 x, u32 tok)<br>
&gt; {<br>
&gt; -=C2=A0 =C2=A0 return (x &amp; 0xffffff00) | (tok &amp; 0xff);<br>
&gt; +=C2=A0 =C2=A0 return (x &amp; 0xffffff00U) | (tok &amp; 0xffU);<br>
&gt; }<br>
&gt; <br>
&gt; static inline void dbgp_set_data(struct ehci_dbg_port __iomem *ehci_de=
bug,<br>
&gt; diff --git a/xen/drivers/video/vesa.c b/xen/drivers/video/vesa.c<br>
&gt; index c41f6b8d40..b007ff5678 100644<br>
&gt; --- a/xen/drivers/video/vesa.c<br>
&gt; +++ b/xen/drivers/video/vesa.c<br>
&gt; @@ -123,7 +123,7 @@ void __init vesa_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if ( vlfb_info.bits_per_pixel &gt; 8 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Light grey in truecolor. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int grey =3D 0xaaaaaaaa;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int grey =3D 0xaaaaaaaaU;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lfbp.pixel_on =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((grey &gt;&gt; (32 - v=
lfb_info.=C2=A0 red_size)) &lt;&lt; vlfb_info.=C2=A0 red_pos) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((grey &gt;&gt; (32 - v=
lfb_info.green_size)) &lt;&lt; vlfb_info.green_pos) |<br>
&gt; diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h=
<br>
&gt; index c5f0d31e23..5e545ae9a4 100644<br>
&gt; --- a/xen/include/public/memory.h<br>
&gt; +++ b/xen/include/public/memory.h<br>
&gt; @@ -234,7 +234,7 @@ struct xen_add_to_physmap {<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0unsigned int space; /* =3D&gt; enum phys_map_space =
*/<br>
&gt; <br>
&gt; -#define XENMAPIDX_grant_table_status 0x80000000<br>
&gt; +#define XENMAPIDX_grant_table_status 0x80000000U<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Index into space being mapped. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0xen_ulong_t idx;<br>
&gt; diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h=
<br>
&gt; index 33e86ace51..fa7147de47 100644<br>
&gt; --- a/xen/include/public/sysctl.h<br>
&gt; +++ b/xen/include/public/sysctl.h<br>
&gt; @@ -384,7 +384,7 @@ struct xen_sysctl_pm_op {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct xen_set_cpufreq_para set_para;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_aligned_t get_avgfreq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_sched_opt_smt;<br>
&gt; -#define XEN_SYSCTL_CX_UNLIMITED 0xffffffff<br>
&gt; +#define XEN_SYSCTL_CX_UNLIMITED 0xffffffffU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_max_cstate;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_max_cstate;<br>
&gt;=C2=A0 =C2=A0 =C2=A0} u;<br>
&gt; @@ -547,7 +547,7 @@ struct xen_sysctl_numainfo {<br>
&gt; #define XEN_SYSCTL_CPUPOOL_OP_RMCPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A05=C2=A0 /* R */<br>
&gt; #define XEN_SYSCTL_CPUPOOL_OP_MOVEDOMAIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 6=C2=A0 /* M */<br>
&gt; #define XEN_SYSCTL_CPUPOOL_OP_FREEINFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 7=C2=A0 /* F */<br>
&gt; -#define XEN_SYSCTL_CPUPOOL_PAR_ANY=C2=A0 =C2=A0 =C2=A00xFFFFFFFF<br>
&gt; +#define XEN_SYSCTL_CPUPOOL_PAR_ANY=C2=A0 =C2=A0 =C2=A00xFFFFFFFFU<br>
&gt; struct xen_sysctl_cpupool_op {<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint32_t op;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* I=
N */<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint32_t cpupool_id;=C2=A0 /* IN: CDIARM OUT: CI */=
<br>
&gt; diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h<br>
&gt; index 33619a0873..3b7e09a26e 100644<br>
&gt; --- a/xen/include/xen/bitops.h<br>
&gt; +++ b/xen/include/xen/bitops.h<br>
&gt; @@ -227,11 +227,11 @@ static inline __u32 ror32(__u32 word, unsigned i=
nt shift)<br>
&gt; }<br>
&gt; <br>
&gt; /* base-2 logarithm */<br>
&gt; -#define __L2(_x)=C2=A0 (((_x) &amp; 0x00000002) ?=C2=A0 =C2=A01 : 0)<=
br>
&gt; -#define __L4(_x)=C2=A0 (((_x) &amp; 0x0000000c) ? ( 2 + __L2( (_x)&gt=
;&gt; 2)) : __L2( _x))<br>
&gt; -#define __L8(_x)=C2=A0 (((_x) &amp; 0x000000f0) ? ( 4 + __L4( (_x)&gt=
;&gt; 4)) : __L4( _x))<br>
&gt; -#define __L16(_x) (((_x) &amp; 0x0000ff00) ? ( 8 + __L8( (_x)&gt;&gt;=
 8)) : __L8( _x))<br>
&gt; -#define ilog2(_x) (((_x) &amp; 0xffff0000) ? (16 + __L16((_x)&gt;&gt;=
16)) : __L16(_x))<br>
&gt; +#define __L2(_x)=C2=A0 (((_x) &amp; 0x00000002U) ?=C2=A0 =C2=A01 : 0)=
<br>
&gt; +#define __L4(_x)=C2=A0 (((_x) &amp; 0x0000000cU) ? ( 2 + __L2( (_x)&g=
t;&gt; 2)) : __L2( _x))<br>
&gt; +#define __L8(_x)=C2=A0 (((_x) &amp; 0x000000f0U) ? ( 4 + __L4( (_x)&g=
t;&gt; 4)) : __L4( _x))<br>
&gt; +#define __L16(_x) (((_x) &amp; 0x0000ff00U) ? ( 8 + __L8( (_x)&gt;&gt=
; 8)) : __L8( _x))<br>
&gt; +#define ilog2(_x) (((_x) &amp; 0xffff0000U) ? (16 + __L16((_x)&gt;&gt=
;16)) : __L16(_x))<br>
&gt; <br>
&gt; /**<br>
&gt;=C2=A0 * for_each_set_bit - iterate over every set bit in a memory regi=
on<br>
&gt; diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h<br>
&gt; index f8e5272bc1..71d14faa02 100644<br>
&gt; --- a/xen/include/xen/cper.h<br>
&gt; +++ b/xen/include/xen/cper.h<br>
&gt; @@ -56,7 +56,7 @@ static inline uint64_t cper_next_record_id(void)<br>
&gt; #define CPER_SIG_RECORD &quot;CPER&quot;<br>
&gt; #define CPER_SIG_SIZE 4<br>
&gt; /* Used in signature_end field in struct cper_record_header */<br>
&gt; -#define CPER_SIG_END 0xffffffff<br>
&gt; +#define CPER_SIG_END 0xffffffffU<br>
&gt; <br>
&gt; /*<br>
&gt;=C2=A0 * CPER record header revision, used in revision field in struct<=
br>
&gt; @@ -80,36 +80,36 @@ static inline uint64_t cper_next_record_id(void)<b=
r>
&gt;=C2=A0 * Corrected Machine Check<br>
&gt;=C2=A0 */<br>
&gt; #define CPER_NOTIFY_CMC \<br>
&gt; - UUID_LE(0x2DCE8BB1, 0xBDD7, 0x450e, 0xB9, 0xAD, 0x9C, 0xF4, \<br>
&gt; - 0xEB, 0xD4, 0xF8, 0x90)<br>
&gt; + UUID_LE(0x2DCE8BB1U, 0xBDD7U, 0x450eU, 0xB9U, 0xADU, 0x9CU, 0xF4U, \=
<br>
&gt; + 0xEBU, 0xD4U, 0xF8U, 0x90U)<br>
&gt; /* Corrected Platform Error */<br>
&gt; #define CPER_NOTIFY_CPE \<br>
&gt; - UUID_LE(0x4E292F96, 0xD843, 0x4a55, 0xA8, 0xC2, 0xD4, 0x81, \<br>
&gt; - 0xF2, 0x7E, 0xBE, 0xEE)<br>
&gt; + UUID_LE(0x4E292F96U, 0xD843U, 0x4a55U, 0xA8U, 0xC2U, 0xD4U, 0x81U, \=
<br>
&gt; + 0xF2U, 0x7EU, 0xBEU, 0xEEU)<br>
&gt; /* Machine Check Exception */<br>
&gt; #define CPER_NOTIFY_MCE \<br>
&gt; - UUID_LE(0xE8F56FFE, 0x919C, 0x4cc5, 0xBA, 0x88, 0x65, 0xAB, \<br>
&gt; - 0xE1, 0x49, 0x13, 0xBB)<br>
&gt; + UUID_LE(0xE8F56FFEU, 0x919CU, 0x4cc5U, 0xBAU, 0x88U, 0x65U, 0xABU, \=
<br>
&gt; + 0xE1U, 0x49U, 0x13U, 0xBBU)<br>
&gt; /* PCI Express Error */<br>
&gt; #define CPER_NOTIFY_PCIE \<br>
&gt; - UUID_LE(0xCF93C01F, 0x1A16, 0x4dfc, 0xB8, 0xBC, 0x9C, 0x4D, \<br>
&gt; - 0xAF, 0x67, 0xC1, 0x04)<br>
&gt; + UUID_LE(0xCF93C01FU, 0x1A16U, 0x4dfcU, 0xB8U, 0xBCU, 0x9CU, 0x4DU, \=
<br>
&gt; + 0xAFU, 0x67U, 0xC1U, 0x04U)<br>
&gt; /* INIT Record (for IPF) */<br>
&gt; #define CPER_NOTIFY_INIT \<br>
&gt; - UUID_LE(0xCC5263E8, 0x9308, 0x454a, 0x89, 0xD0, 0x34, 0x0B, \<br>
&gt; - 0xD3, 0x9B, 0xC9, 0x8E)<br>
&gt; + UUID_LE(0xCC5263E8U, 0x9308U, 0x454aU, 0x89U, 0xD0U, 0x34U, 0x0BU, \=
<br>
&gt; + 0xD3U, 0x9BU, 0xC9U, 0x8EU)<br>
&gt; /* Non-Maskable Interrupt */<br>
&gt; #define CPER_NOTIFY_NMI \<br>
&gt; - UUID_LE(0x5BAD89FF, 0xB7E6, 0x42c9, 0x81, 0x4A, 0xCF, 0x24, \<br>
&gt; - 0x85, 0xD6, 0xE9, 0x8A)<br>
&gt; + UUID_LE(0x5BAD89FFU, 0xB7E6U, 0x42c9U, 0x81U, 0x4AU, 0xCFU, 0x24U, \=
<br>
&gt; + 0x85U, 0xD6U, 0xE9U, 0x8AU)<br>
&gt; /* BOOT Error Record */<br>
&gt; #define CPER_NOTIFY_BOOT \<br>
&gt; - UUID_LE(0x3D61A466, 0xAB40, 0x409a, 0xA6, 0x98, 0xF3, 0x62, \<br>
&gt; - 0xD4, 0x64, 0xB3, 0x8F)<br>
&gt; + UUID_LE(0x3D61A466U, 0xAB40U, 0x409aU, 0xA6U, 0x98U, 0xF3U, 0x62U, \=
<br>
&gt; + 0xD4U, 0x64U, 0xB3U, 0x8FU)<br>
&gt; /* DMA Remapping Error */<br>
&gt; #define CPER_NOTIFY_DMAR \<br>
&gt; - UUID_LE(0x667DD791, 0xC6B3, 0x4c27, 0x8A, 0x6B, 0x0F, 0x8E, \<br>
&gt; - 0x72, 0x2D, 0xEB, 0x41)<br>
&gt; + UUID_LE(0x667DD791U, 0xC6B3U, 0x4c27U, 0x8AU, 0x6BU, 0x0FU, 0x8EU, \=
<br>
&gt; + 0x72U, 0x2DU, 0xEBU, 0x41U)<br>
&gt; <br>
&gt; /*<br>
&gt;=C2=A0 * Flags bits definitions for flags in struct cper_record_header<=
br>
&gt; diff --git a/xen/lib/muldiv64.c b/xen/lib/muldiv64.c<br>
&gt; index 78177ce616..e9bacc4c59 100644<br>
&gt; --- a/xen/lib/muldiv64.c<br>
&gt; +++ b/xen/lib/muldiv64.c<br>
&gt; @@ -27,7 +27,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0rh =3D (uint64_t)u.l.high * (uint64_t)b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0rh +=3D (rl &gt;&gt; 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0res.l.high =3D rh / c;<br>
&gt; -=C2=A0 =C2=A0 res.l.low =3D (((rh % c) &lt;&lt; 32) + (rl &amp; 0xfff=
fffff)) / c;<br>
&gt; +=C2=A0 =C2=A0=C2=A0res.l.low =3D (((rh % c) &lt;&lt; 32) + ((uint32_t=
)rl &amp; 0xffffffffU)) / c;<br>
<br>
Why the explicit cast on rl? Shouldn=E2=80=99t it work without it?<br>
<br></blockquote><div>Yes, the cast is not related to the MISRA rule. <br><=
/div><div>It was requested by Jan in &quot;[XEN PATCH 00/13] xen: fixed vio=
lations of MISRA C:2012 Rule 7.2&quot;<br></div><div>to be more consistent =
with the surrounding code.</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0return res.ll; <br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--00000000000023a16405ffc1c315--

