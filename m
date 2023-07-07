Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA974ACAB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 10:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560274.876058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHggI-0004Dm-Ty; Fri, 07 Jul 2023 08:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560274.876058; Fri, 07 Jul 2023 08:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHggI-0004BH-Q7; Fri, 07 Jul 2023 08:19:10 +0000
Received: by outflank-mailman (input) for mailman id 560274;
 Fri, 07 Jul 2023 08:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjyJ=CZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qHggH-0004BB-GH
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 08:19:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a8289b-1c9e-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 10:19:08 +0200 (CEST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by support.bugseng.com (Postfix) with ESMTPSA id B90674EE0C87
 for <xen-devel@lists.xenproject.org>; Fri,  7 Jul 2023 10:19:07 +0200 (CEST)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-47e25709402so638590e0c.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 01:19:07 -0700 (PDT)
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
X-Inumbo-ID: f1a8289b-1c9e-11ee-b237-6b7b168915f2
X-Gm-Message-State: ABy/qLYMrwMRUtC4IDYyQ9PHbXPhK2P5CIM4cXhXkiE+t/KiXlBm/iUn
	Q/B3kpGMPFZ1VKyJ6+gV2fRg4aBt3ZEW31frPhY=
X-Google-Smtp-Source: APBJJlERXkLn4rnLZROi+wS0Kk5grHYNuCk9w2E3B1GGUIiH8XHCixQHB7c4QSlTaKg09pTO/orxpb3caKrhoNoCsks=
X-Received: by 2002:a05:6102:3a72:b0:443:695d:b91a with SMTP id
 bf18-20020a0561023a7200b00443695db91amr2889414vsb.28.1688717946615; Fri, 07
 Jul 2023 01:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <f30ef7c2cda2516d9ef07bb79e5da5513cd90c6c.1688559115.git.gianluca.luparini@bugseng.com>
 <f3b6170a-db0d-ef00-b3f8-7deba17b9fe2@suse.com>
In-Reply-To: <f3b6170a-db0d-ef00-b3f8-7deba17b9fe2@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Fri, 7 Jul 2023 10:18:55 +0200
X-Gmail-Original-Message-ID: <CAFHJcJuSPHDUqVOw_VSu+vEQGEvgtz30ef78vU-Ona1EQnJaLQ@mail.gmail.com>
Message-ID: <CAFHJcJuSPHDUqVOw_VSu+vEQGEvgtz30ef78vU-Ona1EQnJaLQ@mail.gmail.com>
Subject: Re: [XEN PATCH v2 07/13] x86/vmx: fix violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, 
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000055832605ffe14911"

--00000000000055832605ffe14911
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 6 lug 2023 alle ore 10:04 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 05.07.2023 17:26, Simone Ballarin wrote:
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -257,14 +257,14 @@ uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t
> vmcs_encoding)
> >
> >      switch ( enc.width ) {
> >      case VVMCS_WIDTH_16:
> > -        res &= 0xffff;
> > +        res &= 0xffffU;
>
> I don't think the suffix is needed in cases like this one, and ...
>

> >          break;
> >     case VVMCS_WIDTH_64:
> >          if ( enc.access_type )
> >              res >>= 32;
> >          break;
> >      case VVMCS_WIDTH_32:
> > -        res &= 0xffffffff;
> > +        res &= 0xffffffffU;
>
> ... while generally I'm suggesting to avoid casts I wonder whether
> casting to uint32_t here wouldn't make things more obviously match
> the purpose. (Same again further down then.)
>

Using the cast is fine. I will change the patch.

>
> > --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> > @@ -207,7 +207,7 @@ void vmx_vmcs_reload(struct vcpu *v);
> >  #define CPU_BASED_ACTIVATE_MSR_BITMAP         0x10000000
> >  #define CPU_BASED_MONITOR_EXITING             0x20000000
> >  #define CPU_BASED_PAUSE_EXITING               0x40000000
> > -#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
> > +#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
>
> Interesting - you don't change adjacent #define-s here, nor ...
>
> > @@ -257,7 +257,7 @@ extern u32 vmx_vmentry_control;
> >  #define SECONDARY_EXEC_XSAVES                   0x00100000
> >  #define SECONDARY_EXEC_TSC_SCALING              0x02000000
> >  #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
> > -#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
> > +#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
>
> ... here. May I ask why that is? (I'm not opposed, but the
> description suggests otherwise.)
>
> > --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > @@ -136,7 +136,7 @@ static inline void pi_clear_sn(struct pi_desc
> *pi_desc)
> >  /*
> >   * Exit Reasons
> >   */
> > -#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
> > +#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000U
> >  #define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
>
> Along the lines of the latter, perhaps switch to 1u << 31?
>
> > @@ -246,15 +246,15 @@ typedef union cr_access_qual {
> >  /*
> >   * Access Rights
> >   */
> > -#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
> > -#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
> > -#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege
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
> > +#define X86_SEG_AR_SEG_TYPE     0xfU       /* 3:0, segment type */
> > +#define X86_SEG_AR_DESC_TYPE    (1U << 4)  /* 4, descriptor type */
> > +#define X86_SEG_AR_DPL          0x60U      /* 6:5, descriptor privilege
> level */
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
> How is this change related to rule 7.2? There are u suffixes already where
> needed (and 0xf and 0x60 don't strictly need one), so there's no violation
> here afaict. A mere style change to switch from u to U imo doesn't belong
> here (and, as mentioned while discussing the rule, is imo hampering
> readability in cases like these ones).
>
> Jan
>

In general, I will remove all non-strictly required U's you have pointed
out.
I will also amend the commit messages in these cases.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--00000000000055832605ffe14911
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno gio 6 lug 2023 alle ore 10:=
04 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">j=
beulich@suse.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 05.07.2023 17:26, Simone Ballarin wrote:<br>
&gt; --- a/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; +++ b/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; @@ -257,14 +257,14 @@ uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t=
 vmcs_encoding)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch ( enc.width ) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VVMCS_WIDTH_16:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 res &amp;=3D 0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res &amp;=3D 0xffffU;<br>
<br>
I don&#39;t think the suffix is needed in cases like this one, and ...<br><=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0case VVMCS_WIDTH_64:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( enc.access_type )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res &gt;&gt;=3D 32;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VVMCS_WIDTH_32:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 res &amp;=3D 0xffffffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res &amp;=3D 0xffffffffU;<br>
<br>
... while generally I&#39;m suggesting to avoid casts I wonder whether<br>
casting to uint32_t here wouldn&#39;t make things more obviously match<br>
the purpose. (Same again further down then.)<br></blockquote><div><br></div=
><div>Using the cast is fine. I will change the patch.<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h<br>
&gt; +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h<br>
&gt; @@ -207,7 +207,7 @@ void vmx_vmcs_reload(struct vcpu *v);<br>
&gt;=C2=A0 #define CPU_BASED_ACTIVATE_MSR_BITMAP=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00x10000000<br>
&gt;=C2=A0 #define CPU_BASED_MONITOR_EXITING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x20000000<br>
&gt;=C2=A0 #define CPU_BASED_PAUSE_EXITING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x40000000<br>
&gt; -#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000<br>
&gt; +#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U<br>
<br>
Interesting - you don&#39;t change adjacent #define-s here, nor ...<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; @@ -257,7 +257,7 @@ extern u32 vmx_vmentry_control;<br>
&gt;=C2=A0 #define SECONDARY_EXEC_XSAVES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00100000<br>
&gt;=C2=A0 #define SECONDARY_EXEC_TSC_SCALING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x02000000<br>
&gt;=C2=A0 #define SECONDARY_EXEC_BUS_LOCK_DETECTION=C2=A0 =C2=A0 =C2=A0 =
=C2=A00x40000000<br>
&gt; -#define SECONDARY_EXEC_NOTIFY_VM_EXITING=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x80000000<br>
&gt; +#define SECONDARY_EXEC_NOTIFY_VM_EXITING=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x80000000U<br>
<br>
... here. May I ask why that is? (I&#39;m not opposed, but the<br>
description suggests otherwise.)<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h<br>
&gt; +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h<br>
&gt; @@ -136,7 +136,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_=
desc)<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Exit Reasons<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000<br>
&gt; +#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000U<br>
&gt;=C2=A0 #define VMX_EXIT_REASONS_BUS_LOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0(1u =
&lt;&lt; 26)<br>
<br>
Along the lines of the latter, perhaps switch to 1u &lt;&lt; 31?<br>
<br>
&gt; @@ -246,15 +246,15 @@ typedef union cr_access_qual {<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Access Rights<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define X86_SEG_AR_SEG_TYPE=C2=A0 =C2=A0 =C2=A00xf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* 3:0, segment type */<br>
&gt; -#define X86_SEG_AR_DESC_TYPE=C2=A0 =C2=A0 (1u &lt;&lt; 4)=C2=A0 /* 4,=
 descriptor type */<br>
&gt; -#define X86_SEG_AR_DPL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x60=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* 6:5, descriptor privilege level */<br>
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
&gt; +#define X86_SEG_AR_SEG_TYPE=C2=A0 =C2=A0 =C2=A00xfU=C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 3:0, segment type */<br>
&gt; +#define X86_SEG_AR_DESC_TYPE=C2=A0 =C2=A0 (1U &lt;&lt; 4)=C2=A0 /* 4,=
 descriptor type */<br>
&gt; +#define X86_SEG_AR_DPL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x60U=C2=A0 =
=C2=A0 =C2=A0 /* 6:5, descriptor privilege level */<br>
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
How is this change related to rule 7.2? There are u suffixes already where<=
br>
needed (and 0xf and 0x60 don&#39;t strictly need one), so there&#39;s no vi=
olation<br>
here afaict. A mere style change to switch from u to U imo doesn&#39;t belo=
ng<br>
here (and, as mentioned while discussing the rule, is imo hampering<br>
readability in cases like these ones).<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><div>In general, I will remove all non=
-strictly required U&#39;s you have pointed out.</div><div>I will also amen=
d the commit messages in these cases.</div><br><span class=3D"gmail_signatu=
re_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BU=
GSENG (<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com=
</a>)</div></div></div></div>

--00000000000055832605ffe14911--

