Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17083A27EF4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 23:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881889.1292062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfRoh-0001By-4o; Tue, 04 Feb 2025 22:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881889.1292062; Tue, 04 Feb 2025 22:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfRoh-0001AR-1w; Tue, 04 Feb 2025 22:54:51 +0000
Received: by outflank-mailman (input) for mailman id 881889;
 Tue, 04 Feb 2025 22:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O11r=U3=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tfRoe-0001AL-Mv
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 22:54:48 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 079737da-e34b-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 23:54:46 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38daa53a296so584927f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 14:54:46 -0800 (PST)
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
X-Inumbo-ID: 079737da-e34b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738709686; x=1739314486; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jqGrRJdjdHnI8SO8uoo0jSZ2xUM8k7qfXadyfNXq/Y=;
        b=WI/3DLKs/sAkl0Cocy+b1s4R3tPHrnioCUsX6YGQ1YW4ZwOxMeFrcWjTgM6lO3BJJE
         aZtsO0dpcmLB55MIxPQGKKDT9/dDViBy8gin56CI/Lu4RIj4Eun3/r1HvFdIu45wB/tJ
         IIiIbTfklwdPEmOo4dZozvbrP6SEBMcvn/qtbFl0jiemy0ASJQJuA44DyqYb0OtoOM6u
         Ol294M1L62DH0/GlMWfvxQzF+aj8WmZ64D5pVqlTYIwnNG7hPRjk9IcIcgdzoXI32f80
         mw/l40J51fWFwOkEZGEQesOp0FDpGmWh0tXiXTG1dW+7yALTzfKxEH0k+RsMw4A92ULs
         PdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738709686; x=1739314486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jqGrRJdjdHnI8SO8uoo0jSZ2xUM8k7qfXadyfNXq/Y=;
        b=a3b/dmhJYGOGryHOGpwVgc9cjCqzuSYGjhFxqoIdTbkQgOvF8o+XOl3BFpK1mKxspw
         Q3tkWqZtRPTavHuNbpNZR39mde9pnFrd9empIrP6IyaS1Zq8/ubkLUqRrGg39MiqCmsv
         SvcAaPJXUOSPVW1aP+ChPqhBpEI5iwM32DLPbOscnu0ytb1HqZNCDLvgDBa5E9rg4m5o
         vi9Vb0W2YzIJromtZt1jPT2VsAhdBP/4D/jX5vKL+62h00y/PKEAc+XeKTBpjfVhTKm1
         Fyp+MXaMJ7/kbAKD95B7HPvsUFVBeI3KFCDyPFXnf+6UIt+SlG8j609a0Wd0TeYEI/+/
         h7fA==
X-Forwarded-Encrypted: i=1; AJvYcCU4IiWVEJh838GNwjCdd0+4YosWahEFShUl2ap42JBZ88qMXqMT1tAhHBN1bFEN3qJrLSNFlrL5EDk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmNzs6eIGDRbQu1emtIUFgarNbe7DgNuUvWnQS6vnkGX6xgqZj
	tkZAoZplBKkgjr3/OZ+xhuQ3W3Wd4wO8uk3Sbvg7fh2TGJNk5TRJa2P0NadSaWpAXFeucd9T94V
	fd5UBWHVauOtrLuA7AoIMbin7cdo=
X-Gm-Gg: ASbGnctpWzE75SfaforlAufNT6dXBWPMgggBzakAwsJo2+xMFiXiDGa1RW/9mvMFnR/
	7HWMEvvCKYu2+fnHtmYfn3ZVwMu9UWCpF93OAszxE4ytjCkcDCUL881mbHmI/ElFyZRCW/GJWwA
	==
X-Google-Smtp-Source: AGHT+IELu1Q30cZgIqCPW6ci2nrkoinQMz99C7M4kmisFJ/6FtEnC8uc89+FVWQAcEWUlspMebuQ95l+76SdR+juhjo=
X-Received: by 2002:a5d:5f49:0:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38db4920498mr315946f8f.46.1738709685333; Tue, 04 Feb 2025
 14:54:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737470269.git.teddy.astie@vates.tech> <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech>
 <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com> <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech>
 <alpine.DEB.2.22.394.2502030939470.11632@ubuntu-linux-20-04-desktop>
 <07423892-7f23-4e57-b1e9-4ef0fe45d6bc@vates.tech> <CAJ=z9a0DxkmeQU4U1sHnqCohrgVBjSOzs=u-x0E_QWAB36yV7w@mail.gmail.com>
 <alpine.DEB.2.22.394.2502041252550.9756@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2502041252550.9756@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 4 Feb 2025 19:54:33 -0300
X-Gm-Features: AWEUYZnS4SPGYZBA6U8bnBhv4119Zr1gR_buLmPQS9MStw3FWBEteEtFIa8FBVQ
Message-ID: <CAJ=z9a1JnqX4pBDiZomuHkU7pyWen9=EJoL+tSkbZkgYxm_Lxg@mail.gmail.com>
Subject: Re: [XEN RFC PATCH v5 3/5] xen/public: Introduce PV-IOMMU hypercall interface
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000002976c5062d58e568"

--0000000000002976c5062d58e568
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,


On Tue, 4 Feb 2025 at 17:57, Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Tue, 4 Feb 2025, Julien Grall wrote:
> > On Tue, 4 Feb 2025 at 11:46, Teddy Astie <teddy.astie@vates.tech> wrote=
:
> >       If the hardware supports it, there is a alternative (still being
> >       drafted) interface to allow the guest to directly provide native
> pagetables.
> >
> >       This is exposed through the "_nested" subcommands, there is no
> >       implementation of this feature in this patch series yet.
> >
> >
> > Out of interest, if the HW support two stage translations, then why do
> we need a PV interface? Wouldn=E2=80=99t it be better to exposed an emula=
ted
> > iommu? This would reduce the amount of enlightenment required in the
> guest OS. In the long run, this would provide some better performance
> >  because some IOMMU HW can now accelerate TLB flush commands (among
> other things). For instance, see the NVIDIA vIOMMU.
>
> Hi Julien, I am not Teddy, but I have been considering the same
> question, and here are the conclusions I reached.
>
> A virtual IOMMU of the same type as the underlying IOMMU provides better
> operating system compatibility, particularly for running non-Linux OSes
> such as Windows.
>
> On the other hand, a PV IOMMU should be faster to develop because there
> is no need to emulate a hardware interface.

Additionally, a single PV
> IOMMU implementation could support multiple underlying hardware IOMMUs.
> Specifically, it could be used for both Intel and AMD platforms.


I agree with both points. However what matters is the performance. In the
case of nested, my concern with the PV approach is you are never going to
reach the same performance as native. I am not talking about setting up the
page tables, but more the TLB flushes. Have we measure the overhead and
whether that=E2=80=99s acceptable?

With an emulated solution and HW support, virtual TLB flush could come for
free because they will be handled directly by the HW. AFAICT, with a PV
approach you are never going to be able to take advantage of this.

Cheers,




>
>
>
> >
> >       /**
> >         * IOMMU_alloc_nested
> >         * Create a nested IOMMU context (needs IOMMUCAP_nested).
> >         *
> >         * This context uses a platform-specific page table from domain
> address
> >       space
> >         * specified in pgtable_gfn and use it for nested translations.
> >         *
> >         * Explicit flushes needs to be submited with IOMMU_flush_nested
> on
> >         * modification of the nested pagetable to ensure coherency
> between
> >       IOTLB and
> >         * nested page table.
> >         *
> >         * This context can be destroyed using IOMMU_free_context.
> >         * This context cannot be modified using map_pages, unmap_pages.
> >         */
> >       struct pv_iommu_alloc_nested {
> >            /* OUT: allocated IOMMU context number */
> >            uint16_t ctx_no;
> >
> >            /* IN: guest frame number of the nested page table */
> >            uint64_aligned_t pgtable_gfn;
> >
> >            /* IN: nested mode flags */
> >            uint64_aligned_t nested_flags;
> >       };
> >       typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
> >       DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> >
> >       /**
> >         * IOMMU_flush_nested (needs IOMMUCAP_nested)
> >         * Flush the IOTLB for nested translation.
> >         */
> >       struct pv_iommu_flush_nested {
> >            /* TODO */
> >       };
> >       typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
> >       DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);
> >
> >
> >       >
> >       >
> >       >
> >       >> [1] Originally
> >       >>
> https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html but
> >       >> this patch got quite old and probably doesn't work anymore wit=
h
> this new
> >       >> Xen patch series.
> >       >> I have a updated patch in my xen-pviommu branch
> >       >>
> https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/125d67a09fa=
9f66a32f9175641cfccca22dbbdb6
> >       >>
> >       >> [2] You also need to set
> "vfio_iommu_type1.allow_unsafe_interrupts=3D1" to
> >       >> make VFIO work for now.
> >
> >       Thanks
> >       Teddy
> >
> >
> >
> >       Teddy Astie | Vates XCP-ng Developer
> >
> >       XCP-ng & Xen Orchestra - Vates solutions
> >
> >       web: https://vates.tech
> >
> >
> >

--0000000000002976c5062d58e568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Stefano,</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br><div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, 4 Feb 2025 at 17:57, Stefano Sta=
bellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">On Tu=
e, 4 Feb 2025, Julien Grall wrote:<br>
&gt; On Tue, 4 Feb 2025 at 11:46, Teddy Astie &lt;teddy.astie@vates.tech&gt=
; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If the hardware supports it, there is a alte=
rnative (still being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drafted) interface to allow the guest to dir=
ectly provide native pagetables.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This is exposed through the &quot;_nested&qu=
ot; subcommands, there is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0implementation of this feature in this patch=
 series yet.<br>
&gt; <br>
&gt; <br>
&gt; Out of interest, if the HW support two stage translations, then why do=
 we need a PV interface? Wouldn=E2=80=99t it be better to exposed an emulat=
ed<br>
&gt; iommu? This would reduce the amount of enlightenment required in the g=
uest OS. In the long run, this would provide some better performance<br>
&gt; =C2=A0because some IOMMU HW can now accelerate TLB flush commands (amo=
ng other things). For instance, see the NVIDIA vIOMMU.<br>
<br>
Hi Julien, I am not Teddy, but I have been considering the same<br>
question, and here are the conclusions I reached.=C2=A0 <br>
<br>
A virtual IOMMU of the same type as the underlying IOMMU provides better<br=
>
operating system compatibility, particularly for running non-Linux OSes<br>
such as Windows.=C2=A0 <br>
<br>
On the other hand, a PV IOMMU should be faster to develop because there<br>
is no need to emulate a hardware interface.</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto">Additionally, a single PV<br>
IOMMU implementation could support multiple underlying hardware IOMMUs.<br>
Specifically, it could be used for both Intel and AMD platforms.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">I agree with both points. H=
owever what matters is the performance. In the case of nested, my concern w=
ith the PV approach is you are never going to reach the same performance as=
 native. I am not talking about setting up the page tables, but more the TL=
B flushes. Have we measure the overhead and whether that=E2=80=99s acceptab=
le?</div><div dir=3D"auto"><br></div><div dir=3D"auto">With an emulated sol=
ution and HW support, virtual TLB flush could come for free because they wi=
ll be handled directly by the HW. AFAICT, with a PV approach you are never =
going to be able to take advantage of this.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" di=
r=3D"auto"><br>
<br>
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * IOMMU_alloc_nested<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * Create a nested IOMMU context (need=
s IOMMUCAP_nested).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * This context uses a platform-specif=
ic page table from domain address<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0space<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * specified in pgtable_gfn and use it=
 for nested translations.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * Explicit flushes needs to be submit=
ed with IOMMU_flush_nested on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * modification of the nested pagetabl=
e to ensure coherency between<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0IOTLB and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * nested page table.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * This context can be destroyed using=
 IOMMU_free_context.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * This context cannot be modified usi=
ng map_pages, unmap_pages.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pv_iommu_alloc_nested {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* OUT: allocated IOMMU =
context number */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0uint16_t ctx_no;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* IN: guest frame numbe=
r of the nested page table */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0uint64_aligned_t pgtable=
_gfn;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* IN: nested mode flags=
 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0uint64_aligned_t nested_=
flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0typedef struct pv_iommu_alloc_nested pv_iomm=
u_alloc_nested_t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_neste=
d_t);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * IOMMU_flush_nested (needs IOMMUCAP_=
nested)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 * Flush the IOTLB for nested translat=
ion.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pv_iommu_flush_nested {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* TODO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0typedef struct pv_iommu_flush_nested pv_iomm=
u_flush_nested_t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_neste=
d_t);<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; [1] Originally<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; <a href=3D"https://lists.xen.org/ar=
chives/html/xen-devel/2024-06/msg01145.html" rel=3D"noreferrer" target=3D"_=
blank">https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html<=
/a> but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; this patch got quite old and probab=
ly doesn&#39;t work anymore with this new<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Xen patch series.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; I have a updated patch in my xen-pv=
iommu branch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; <a href=3D"https://gitlab.com/xen-p=
roject/people/tsnake41/linux/-/commit/125d67a09fa9f66a32f9175641cfccca22dbb=
db6" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-project/pe=
ople/tsnake41/linux/-/commit/125d67a09fa9f66a32f9175641cfccca22dbbdb6</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; [2] You also need to set &quot;vfio=
_iommu_type1.allow_unsafe_interrupts=3D1&quot; to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; make VFIO work for now.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Teddy<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Teddy Astie | Vates XCP-ng Developer<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0XCP-ng &amp; Xen Orchestra - Vates solutions=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0web: <a href=3D"https://vates.tech" rel=3D"n=
oreferrer" target=3D"_blank">https://vates.tech</a><br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div></div>

--0000000000002976c5062d58e568--

