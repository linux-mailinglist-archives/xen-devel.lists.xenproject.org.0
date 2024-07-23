Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01379939C36
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762655.1172863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAUd-0005by-24; Tue, 23 Jul 2024 08:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762655.1172863; Tue, 23 Jul 2024 08:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAUc-0005Yw-V2; Tue, 23 Jul 2024 08:03:30 +0000
Received: by outflank-mailman (input) for mailman id 762655;
 Tue, 23 Jul 2024 08:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWAUb-0005Yq-5K
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:03:29 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a91826f-48ca-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:03:27 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ef2cb7d562so26450541fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 01:03:27 -0700 (PDT)
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
X-Inumbo-ID: 0a91826f-48ca-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721721806; x=1722326606; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BEOdj/phYWdWdsKjX0e/gVICoNaoHrf8S+TSLd5O2Kw=;
        b=DaIEtt2uWuUZe0MPDeMu5O64UkjCAaMZqE1/lTJtDTAdViQb/msFAcDh5WmML80wnN
         ZgYAPZgDqgo8zmODPIFAVdjrc0wYsHp7j71OIR4orvGRSbi55ICWqzmTeTvKkQl2ZM5r
         QuFzv9pcN9UxHQBSJDBEDJ/0avA3RD5503Mu5S/gtIYNH9eFrNBGCjEHL3FZ+lAju+w5
         8oMBvxPqyVqSAhW745uWJy5S6lw0NUiTwxgxHy82PtNmVOH2kXu5oLs93G20Mvlr47LR
         82qK0kGZc1QcYZoZbyZ9WyLP/G2ivYbuLhcmFtYN7YbdtgUWfEmYSDauOH73TKaXY3dA
         JctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721721806; x=1722326606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEOdj/phYWdWdsKjX0e/gVICoNaoHrf8S+TSLd5O2Kw=;
        b=etDFn6pJwtmfUdFDcm0giJFyFZD8LVa+r0VLvR5zg6+guYqPBN+BoOl6Kpp6eEafQ+
         FDmnYCjCgkxAMbCaasxAbzx7s9ecUt9kstGvbXPYH9J137LENJ/rMIAiQ56W8P6PO7jU
         BgJJnwpKzkIHJIM5YPKFP/s+xyfQwxZf3EkQreLvbXusBw0rOzGPFBPIWAVPu5PQ9Oe/
         b9xXZRdXSOLiNbBjck7C2iWoMtopXEvZDAjnjgYBAGUjvcgsWfHe6m25IuoriQIs388i
         EvawTweh91ByquJKjDt6duGbIzS97Xqi03FR27qf2aeN2yIdUl7aHqyNKzOJ/Q6yoYnb
         1zWw==
X-Forwarded-Encrypted: i=1; AJvYcCXIGPaE4M1nv5DRN4dFTMMh4yi/AaWD8/RWqWE3tU9kg28pyqIZ9kP0oepEsLL/OufK3KAU4oboRih4IrMc+7pSOvQRmpdE4JDtg2Lnbes=
X-Gm-Message-State: AOJu0YxW2kXrJAbFi3p8z8RPoNxwzDq3AFFphOAN53yjCg7b+14h6rN9
	WuUqcUelaStTfE8PljKnPpaH4UatztYk4nxR3Y0MGOjJK9YPaHuLp5QdweURVk3DWA+TfmaEorE
	BQkJtYQWP8ir+D5Tcw/QOv+TtQRs=
X-Google-Smtp-Source: AGHT+IHxTO08JSAdq2IiMOYm+XVcE88HlXJMPZ6RAxCGT0yxd5dKsQghqIH9BniMogtniivRgQSuCMD+ymKrWTaeVJo=
X-Received: by 2002:a05:6512:6c4:b0:52e:9481:eaa1 with SMTP id
 2adb3069b0e04-52efb74ea1dmr7195633e87.23.1721721806072; Tue, 23 Jul 2024
 01:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com> <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org> <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
 <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
In-Reply-To: <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Date: Tue, 23 Jul 2024 10:02:48 +0200
Message-ID: <CAMacjJwWLjGcFbYEhCPyNEW_+sfb51+XtKqyBcc2JGm=D5bf0w@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
To: Julien Grall <julien@xen.org>
Cc: Oleksii Kurochko <inisider@gmail.com>, Jan Beulich <jbeulich@suse.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a734c3061de598fd"

--000000000000a734c3061de598fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Jul 22, 2024 at 7:27=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:

> Hi,
>
> >> On 22/07/2024 15:44, Oleksii Kurochko wrote:
> >>> On Mon, 2024-07-22 at 14:54 +0200, Jan Beulich wrote:
> >>>> On 12.07.2024 18:22, Oleksii Kurochko wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/xen/arch/riscv/include/asm/pmap.h
> >>>>> @@ -0,0 +1,28 @@
> >>>>> +#ifndef __ASM_PMAP_H__
> >>>>> +#define __ASM_PMAP_H__
> >>>>> +
> >>>>> +#include <xen/bug.h>
> >>>>> +#include <xen/mm.h>
> >>>>> +
> >>>>> +#include <asm/fixmap.h>
> >>>>> +
> >>>>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> >>>>> +{
> >>>>> +    pte_t *entry =3D &xen_fixmap[slot];
> >>>>> +    pte_t pte;
> >>>>> +
> >>>>> +    ASSERT(!pte_is_valid(*entry));
> >>>>> +
> >>>>> +    pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> >>>>> +    pte.pte |=3D PTE_LEAF_DEFAULT;
> >>>>> +    write_pte(entry, pte);
> >>>>> +}
> >>>>> +
> >>>>> +static inline void arch_pmap_unmap(unsigned int slot)
> >>>>> +{
> >>>>> +    pte_t pte =3D {};
> >>>>> +
> >>>>> +    write_pte(&xen_fixmap[slot], pte);
> >>>>> +}
> >>>>
> >>>> Why are these not using set_fixmap() / clear_fixmap()
> >>>> respectively?
> >>> They haven't been introduced yet. And I thought that these fucntion
> >>> are
> >>> used only in pmap_{un}map() and that is the reason why I decided to
> >>> not
> >>> introduce them. But while writing the answer on another comment, I
> >>> found other places where set_fixmap() / clear_fixmap() are used, so
> >>> I
> >>> will introduce them and reuse here.
> >>
> >> I am guessing you are going to implement set_fixmap()/clear_fixmap()
> >> using map_pages_to_xen(). If so, for early boot you are going to end
> >> up
> >> in a circular loop because map_pages_to_xen() will likely use pmap()
> >> which will call set_fixmap().
> > I am going to implement that in the following way as I faced the
> > described by you issue when I first time tried to implement it using
> > map_pages_to_xen():
> What's wrong with keeping the arch_pmap_*() as-is and call
> map_pages_to_xen() in the fixmap?
>
> At least this would be consistent with what other architectures does and
> less risky (see below).
>
Then I misunderstood you, if not to use {set/clear}_fixmap() in arch_pmap()
then everything should be fine.
Then I think it is needed to add the comment also above arch_pmap_*()
function why it isn't used {set/clear}_fixmap()
inside. ( or update the commit message )


>
> >     /* Map a 4k page in a fixmap entry */
> >     void set_fixmap(unsigned map, mfn_t mfn, unsigned int flags)
> >     {
> >         pte_t pte;
> >
> >         pte =3D mfn_to_xen_entry(mfn, flags);
> >         pte.pte |=3D PTE_LEAF_DEFAULT;
> >         write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))], pte);
>
> It would be saner to check if you are not overwriting any existing
> mapping as otherwise you will probably need a TLB flush.
>
> >     }
> >
> >     /* Remove a mapping from a fixmap entry */
> >     void clear_fixmap(unsigned map)
> >     {
> >         pte_t pte =3D {0};
> >         write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))], pte);
>
> Don't you need a TLB flush?
>
Inside write_pte() there is "sfence.vma".

But probably it would be better to add flush_xen_tlb_range_va_local() or
something similar here in case if someone will decide to update write_pte()=
.

~ Oleksii

--000000000000a734c3061de598fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 7:27=E2=80=AFPM Jul=
ien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br><br>
&gt;&gt; On 22/07/2024 15:44, Oleksii Kurochko wrote:<br>
&gt;&gt;&gt; On Mon, 2024-07-22 at 14:54 +0200, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt; On 12.07.2024 18:22, Oleksii Kurochko wrote:<br>
&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt; +++ b/xen/arch/riscv/include/asm/pmap.h<br>
&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,28 @@<br>
&gt;&gt;&gt;&gt;&gt; +#ifndef __ASM_PMAP_H__<br>
&gt;&gt;&gt;&gt;&gt; +#define __ASM_PMAP_H__<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +#include &lt;xen/bug.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +#include &lt;xen/mm.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +#include &lt;asm/fixmap.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +static inline void arch_pmap_map(unsigned int slot, m=
fn_t mfn)<br>
&gt;&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &amp;xen_fixmap[s=
lot];<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 pte_t pte;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE=
_HYPERVISOR_RW);<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEAF_DEFAULT;<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);<br>
&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +static inline void arch_pmap_unmap(unsigned int slot)=
<br>
&gt;&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0 write_pte(&amp;xen_fixmap[slot], p=
te);<br>
&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Why are these not using set_fixmap() / clear_fixmap()<br>
&gt;&gt;&gt;&gt; respectively?<br>
&gt;&gt;&gt; They haven&#39;t been introduced yet. And I thought that these=
 fucntion<br>
&gt;&gt;&gt; are<br>
&gt;&gt;&gt; used only in pmap_{un}map() and that is the reason why I decid=
ed to<br>
&gt;&gt;&gt; not<br>
&gt;&gt;&gt; introduce them. But while writing the answer on another commen=
t, I<br>
&gt;&gt;&gt; found other places where set_fixmap() / clear_fixmap() are use=
d, so<br>
&gt;&gt;&gt; I<br>
&gt;&gt;&gt; will introduce them and reuse here.<br>
&gt;&gt;<br>
&gt;&gt; I am guessing you are going to implement set_fixmap()/clear_fixmap=
()<br>
&gt;&gt; using map_pages_to_xen(). If so, for early boot you are going to e=
nd<br>
&gt;&gt; up<br>
&gt;&gt; in a circular loop because map_pages_to_xen() will likely use pmap=
()<br>
&gt;&gt; which will call set_fixmap().<br>
&gt; I am going to implement that in the following way as I faced the<br>
&gt; described by you issue when I first time tried to implement it using<b=
r>
&gt; map_pages_to_xen():<br>
What&#39;s wrong with keeping the arch_pmap_*() as-is and call <br>
map_pages_to_xen() in the fixmap?<br>
<br>
At least this would be consistent with what other architectures does and <b=
r>
less risky (see below).<br></blockquote><div>Then I misunderstood=C2=A0you,=
 if not to use {set/clear}_fixmap() in arch_pmap() then everything should b=
e fine.</div><div>Then I think it is needed to add the comment also above a=
rch_pmap_*() function why it isn&#39;t used {set/clear}_fixmap()</div><div>=
inside. ( or update the commit message )</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Map a 4k page in a fixmap entry */<br>
&gt;=C2=A0 =C2=A0 =C2=A0void set_fixmap(unsigned map, mfn_t mfn, unsigned i=
nt flags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte_t pte;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte =3D mfn_to_xen_entry(mfn, flags);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte.pte |=3D PTE_LEAF_DEFAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_pte(&amp;xen_fixmap[pt_index(0,=
 FIXMAP_ADDR(map))], pte);<br>
<br>
It would be saner to check if you are not overwriting any existing <br>
mapping as otherwise you will probably need a TLB flush.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Remove a mapping from a fixmap entry */<br>
&gt;=C2=A0 =C2=A0 =C2=A0void clear_fixmap(unsigned map)<br>
&gt;=C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pte_t pte =3D {0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_pte(&amp;xen_fixmap[pt_index(0,=
 FIXMAP_ADDR(map))], pte);<br>
<br>
Don&#39;t you need a TLB flush?<br></blockquote><div>Inside write_pte() the=
re is &quot;sfence.vma&quot;.</div><div><br></div><div>But probably it woul=
d be better to add flush_xen_tlb_range_va_local() or</div><div>something si=
milar here in case if someone will=C2=A0decide to update write_pte().</div>=
<div><br></div><div>~ Oleksii=C2=A0</div></div></div>

--000000000000a734c3061de598fd--

