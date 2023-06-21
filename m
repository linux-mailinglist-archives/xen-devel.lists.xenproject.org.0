Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8898737DC4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552547.862689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtU0-0003O0-8R; Wed, 21 Jun 2023 08:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552547.862689; Wed, 21 Jun 2023 08:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtU0-0003LQ-5b; Wed, 21 Jun 2023 08:46:32 +0000
Received: by outflank-mailman (input) for mailman id 552547;
 Wed, 21 Jun 2023 08:46:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2n=CJ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBtTy-0003LK-On
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 08:46:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d4d31ef-1010-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 10:46:29 +0200 (CEST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by support.bugseng.com (Postfix) with ESMTPSA id 00D594EE0740
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 10:46:29 +0200 (CEST)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-78a3e1ed1deso1827466241.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 01:46:28 -0700 (PDT)
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
X-Inumbo-ID: 1d4d31ef-1010-11ee-b236-6b7b168915f2
X-Gm-Message-State: AC+VfDzc1gjjiqvPX9x3xe6cL6q4S/vkm1wwaAZyhTUzYnUykVvrA/UQ
	ghwPkDhKLNY7OdjXpxCXDVioOAwgKpv//yWvFB4=
X-Google-Smtp-Source: ACHHUZ7fOw11r9v1q3bMKiVmTJd7NDrEBAssnOLi3Wyu7JKAD5Eumg74uvlwpMRp4FJMn0gndW4B/Q9HNIptEIC+K9U=
X-Received: by 2002:a67:efc6:0:b0:440:ccd4:bd7e with SMTP id
 s6-20020a67efc6000000b00440ccd4bd7emr2627868vsp.0.1687337187817; Wed, 21 Jun
 2023 01:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <6c440188b0bdb58dc3e925788956b3d301d5a18b.1687250177.git.gianluca.luparini@bugseng.com>
 <19bdb894-fdaa-088e-4139-c5fc09189cce@suse.com>
In-Reply-To: <19bdb894-fdaa-088e-4139-c5fc09189cce@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 21 Jun 2023 10:46:16 +0200
X-Gmail-Original-Message-ID: <CAFHJcJuL3nkFdcHkp5z4r0xcCq6-TNXyvAHBqPby6ywDtL=3Tg@mail.gmail.com>
Message-ID: <CAFHJcJuL3nkFdcHkp5z4r0xcCq6-TNXyvAHBqPby6ywDtL=3Tg@mail.gmail.com>
Subject: Re: [XEN PATCH 07/13] xen/x86: fixed violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan Kumar <ayan.kumar.halder@amd.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b2400105fe9fcd1d"

--000000000000b2400105fe9fcd1d
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 20 giu 2023 alle ore 14:51 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 20.06.2023 12:34, Simone Ballarin wrote:
> > --- a/xen/arch/x86/cpu/vpmu_intel.c
> > +++ b/xen/arch/x86/cpu/vpmu_intel.c
> > @@ -950,10 +950,10 @@ const struct arch_vpmu_ops *__init
> core2_vpmu_init(void)
> >         fixed_ctrl_mask |=
> >             (FIXED_CTR_CTRL_ANYTHREAD_MASK << (FIXED_CTR_CTRL_BITS * i));
> >
> > -    fixed_counters_mask = ~((1ull << core2_get_bitwidth_fix_count()) -
> 1);
> > +    fixed_counters_mask = ~((1Ull << core2_get_bitwidth_fix_count()) -
> 1);
>
> What's the point of this adjustment? And if at all, why keep the l-s
> lowercase?
>

In the patch for Rule 7.3 I will propose to change all 'l' with 'L'.
I will move this type of change to the new patch for 7.3.


> >      global_ctrl_mask = ~((((1ULL << fixed_pmc_cnt) - 1) << 32) |
> >                           ((1ULL << arch_pmc_cnt) - 1));
> > -    global_ovf_ctrl_mask = ~(0xC000000000000000 |
> > +    global_ovf_ctrl_mask = ~(0xC000000000000000U |
>
> If such constants gain a suffix, I think that ought to be UL or ULL.
>

Yes, I agree with using 'ULL'.


> > -#define INTR_INFO_VECTOR_MASK           0xff            /* 7:0 */
> > -#define INTR_INFO_INTR_TYPE_MASK        0x700           /* 10:8 */
> > -#define INTR_INFO_DELIVER_CODE_MASK     0x800           /* 11 */
> > -#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000          /* 12 */
> > -#define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
> > -#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
> > +#define INTR_INFO_VECTOR_MASK           0xffU            /* 7:0 */
> > +#define INTR_INFO_INTR_TYPE_MASK        0x700U           /* 10:8 */
> > +#define INTR_INFO_DELIVER_CODE_MASK     0x800U           /* 11 */
> > +#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000           /* 12 */
> > +#define INTR_INFO_VALID_MASK            0x80000000U      /* 31 */
> > +#define INTR_INFO_RESVD_BITS_MASK       0x7ffff000U
>
> I think it would be nice if you took the opportunity and added
> zero-padding to these constants.
>

Ok, I can do that.


> >  #define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
> > -#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
> > +#define X86_SEG_AR_DESC_TYPE    (1U << 4)  /* 4, descriptor type */
> >  #define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege
> level */
> > -#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
> > -#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system
> software */
> > -#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS
> only) */
> > -#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation
> size */
> > -#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
> > -#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
> > +#define X86_SEG_AR_SEG_PRESENT  (1U << 7)  /* 7, segment present */
> > +#define X86_SEG_AR_AVL          (1U << 12) /* 12, available for system
> software */
> > +#define X86_SEG_AR_CS_LM_ACTIVE (1U << 13) /* 13, long mode active (CS
> only) */
> > +#define X86_SEG_AR_DEF_OP_SIZE  (1U << 14) /* 14, default operation
> size */
> > +#define X86_SEG_AR_GRANULARITY  (1U << 15) /* 15, granularity */
> > +#define X86_SEG_AR_SEG_UNUSABLE (1U << 16) /* 16, segment unusable */
>
> And all of these, when it's exactly the two numbers you don't touch
> which might want to gain a U (or u) suffix?
>

Ok.


> Jan
>


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000b2400105fe9fcd1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Il giorno mar 20 giu 2023 alle ore 14:51 Jan Beulich &lt;<a=
 href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 20.06.2023 12:34, Simone Ballarin wrote:<br>
&gt; --- a/xen/arch/x86/cpu/vpmu_intel.c<br>
&gt; +++ b/xen/arch/x86/cpu/vpmu_intel.c<br>
&gt; @@ -950,10 +950,10 @@ const struct arch_vpmu_ops *__init core2_vpmu_in=
it(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fixed_ctrl_mask |=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(FIXED_CTR_CTRL_ANYTHRE=
AD_MASK &lt;&lt; (FIXED_CTR_CTRL_BITS * i));<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 fixed_counters_mask =3D ~((1ull &lt;&lt; core2_get_bitw=
idth_fix_count()) - 1);<br>
&gt; +=C2=A0 =C2=A0 fixed_counters_mask =3D ~((1Ull &lt;&lt; core2_get_bitw=
idth_fix_count()) - 1);<br>
<br>
What&#39;s the point of this adjustment? And if at all, why keep the l-s<br=
>
lowercase?<br></blockquote><div><br></div><div>In the patch for Rule 7.3 I =
will propose to change all &#39;l&#39; with &#39;L&#39;.</div><div>I will m=
ove this type of change to the new patch for 7.3.<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 global_ctrl_mask =3D ~((((1ULL &lt;&lt; fixed_pmc_=
cnt) - 1) &lt;&lt; 32) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0((1ULL &lt;&lt; arch_pmc_cnt) - 1));<br>
&gt; -=C2=A0 =C2=A0 global_ovf_ctrl_mask =3D ~(0xC000000000000000 |<br>
&gt; +=C2=A0 =C2=A0 global_ovf_ctrl_mask =3D ~(0xC000000000000000U |<br>
<br>
If such constants gain a suffix, I think that ought to be UL or ULL.<br></b=
lockquote><div><br></div><div>Yes, I agree with using &#39;ULL&#39;.<br></d=
iv><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; -#define INTR_INFO_VECTOR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00xff=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 7:0 */<br>
&gt; -#define INTR_INFO_INTR_TYPE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x700=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 10:8 */<br>
&gt; -#define INTR_INFO_DELIVER_CODE_MASK=C2=A0 =C2=A0 =C2=A00x800=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 11 */<br>
&gt; -#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* 12 */<br>
&gt; -#define INTR_INFO_VALID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x80000000=C2=A0 =C2=A0 =C2=A0 /* 31 */<br>
&gt; -#define INTR_INFO_RESVD_BITS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A00x7ffff00=
0<br>
&gt; +#define INTR_INFO_VECTOR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00xffU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 7:0 */<br>
&gt; +#define INTR_INFO_INTR_TYPE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x700U=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 10:8 */<br>
&gt; +#define INTR_INFO_DELIVER_CODE_MASK=C2=A0 =C2=A0 =C2=A00x800U=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 11 */<br>
&gt; +#define INTR_INFO_NMI_UNBLOCKED_BY_IRET 0x1000=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* 12 */<br>
&gt; +#define INTR_INFO_VALID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x80000000U=C2=A0 =C2=A0 =C2=A0 /* 31 */<br>
&gt; +#define INTR_INFO_RESVD_BITS_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A00x7ffff00=
0U<br>
<br>
I think it would be nice if you took the opportunity and added<br>
zero-padding to these constants.<br></blockquote><div><br></div><div>Ok, I =
can do that.<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
&gt;=C2=A0 #define X86_SEG_AR_SEG_TYPE=C2=A0 =C2=A0 =C2=A00xf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* 3:0, segment type */<br>
&gt; -#define X86_SEG_AR_DESC_TYPE=C2=A0 =C2=A0 (1u &lt;&lt; 4)=C2=A0 /* 4,=
 descriptor type */<br>
&gt; +#define X86_SEG_AR_DESC_TYPE=C2=A0 =C2=A0 (1U &lt;&lt; 4)=C2=A0 /* 4,=
 descriptor type */<br>
&gt;=C2=A0 #define X86_SEG_AR_DPL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x60=C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* 6:5, descriptor privilege level */<br>
&gt; -#define X86_SEG_AR_SEG_PRESENT=C2=A0 (1u &lt;&lt; 7)=C2=A0 /* 7, segm=
ent present */<br>
&gt; -#define X86_SEG_AR_AVL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1u &lt;&lt;=
 12) /* 12, available for system software */<br>
&gt; -#define X86_SEG_AR_CS_LM_ACTIVE (1u &lt;&lt; 13) /* 13, long mode act=
ive (CS only) */<br>
&gt; -#define X86_SEG_AR_DEF_OP_SIZE=C2=A0 (1u &lt;&lt; 14) /* 14, default =
operation size */<br>
&gt; -#define X86_SEG_AR_GRANULARITY=C2=A0 (1u &lt;&lt; 15) /* 15, granular=
ity */<br>
&gt; -#define X86_SEG_AR_SEG_UNUSABLE (1u &lt;&lt; 16) /* 16, segment unusa=
ble */<br>
&gt; +#define X86_SEG_AR_SEG_PRESENT=C2=A0 (1U &lt;&lt; 7)=C2=A0 /* 7, segm=
ent present */<br>
&gt; +#define X86_SEG_AR_AVL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&lt;=
 12) /* 12, available for system software */<br>
&gt; +#define X86_SEG_AR_CS_LM_ACTIVE (1U &lt;&lt; 13) /* 13, long mode act=
ive (CS only) */<br>
&gt; +#define X86_SEG_AR_DEF_OP_SIZE=C2=A0 (1U &lt;&lt; 14) /* 14, default =
operation size */<br>
&gt; +#define X86_SEG_AR_GRANULARITY=C2=A0 (1U &lt;&lt; 15) /* 15, granular=
ity */<br>
&gt; +#define X86_SEG_AR_SEG_UNUSABLE (1U &lt;&lt; 16) /* 16, segment unusa=
ble */<br>
<br>
And all of these, when it&#39;s exactly the two numbers you don&#39;t touch=
<br>
which might want to gain a U (or u) suffix?<br></blockquote><div><br></div>=
<div>Ok.<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--000000000000b2400105fe9fcd1d--

