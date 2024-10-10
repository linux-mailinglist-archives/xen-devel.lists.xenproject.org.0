Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE88199947B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 23:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816481.1230685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz0lC-0005bC-2S; Thu, 10 Oct 2024 21:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816481.1230685; Thu, 10 Oct 2024 21:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz0lB-0005YY-VY; Thu, 10 Oct 2024 21:31:49 +0000
Received: by outflank-mailman (input) for mailman id 816481;
 Thu, 10 Oct 2024 21:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sz0lA-0005YS-FB
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 21:31:48 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be03bbb-874f-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 23:31:45 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5eb17036f27so249130eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 14:31:45 -0700 (PDT)
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
X-Inumbo-ID: 0be03bbb-874f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728595904; x=1729200704; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2YGAemPX8C66CBvu+0UJCQGcrgSjaZ4rfHql3OvE5o=;
        b=CERWJ/aKjHWX39WEF+OudF3CyTA5PGc7NsCGswzZr3tqz2j1mHmY8d/ghS13UEmyc3
         vFNoWdtBoWAbvhyagSdJjeXo1RYYgmFy4Tyr9XqRknhhSseQTdwSvGBhBVM9SONamIn8
         aRtvZAInUGzjXuqVQZ/1z6YCzgEX0axXe0EZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595904; x=1729200704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2YGAemPX8C66CBvu+0UJCQGcrgSjaZ4rfHql3OvE5o=;
        b=hW3s/VLnnraoe4gYAbztwq5MMws5fCRX+WjBZSr1ZAnPC6DnQn/AYNGmv1mG1X2lim
         pdFf2aTxSNn7lgVPJN/LBoJyrriNvsHludjZKSLQle4CoygLReA0sFdVt4bmgT6qYLnu
         Fxzf4q261PSZotVKthpmgXJ7GLymJpLjhW65PeJ180V1xJXuGJPWdx1gGVX1MQz2b56G
         DHKM2q7cEIry9fDP4ErShe6RhPbm9VZU4l+vdgmbsR5NpT8XhuZRti5yvyfajhpJKvfW
         QH2pCJIJ4OwlzAQIGc+JHiTLGo+qNVAHYuUUXCwbmHSdXwcOwizLZPTdg86zOAri6vNp
         enbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfQ3q/ebhwfgEUhxh5QeuWhvKzQQ9reOxQOkFW7v5N23XTJhZdAh6A9Bgtx+KBObOGqQhchq3v06c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqkwWCTpAr2/liTwcXxlnT+PFG98/sTfBfNgvAPeFu8bvnmCf1
	0oYoKTKCF1vjpqr863MdySZFkmQnoSFCzxiVC6mi85UFoyAYlsMxxq72JM0VQbl+rFyh4/BB27z
	x/xQu5V9cdeCWP+pOUQdptmpI64eoOWz/+/pZQw==
X-Google-Smtp-Source: AGHT+IE0n1Eehlrh0UmQhPwjkVVWfDV6Xo0kR7eXgZdgaWqcPqCLeW30S2kINMH1w+Uu9jzGXokDl+ieqA/TA+y48Uo=
X-Received: by 2002:a05:6870:d08:b0:288:61c6:8df7 with SMTP id
 586e51a60fabf-2886de50cfemr346648fac.21.1728595903741; Thu, 10 Oct 2024
 14:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-2-ayan.kumar.halder@amd.com> <CACHz=Zh402HGV-=5Lbm5auZS0qX6KXH7ZPHvT3WUZ=EjJ4JE2A@mail.gmail.com>
 <829c8ae2-dbe7-4ae7-9f4d-1ab996e27df0@amd.com>
In-Reply-To: <829c8ae2-dbe7-4ae7-9f4d-1ab996e27df0@amd.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 10 Oct 2024 22:31:32 +0100
Message-ID: <CACHz=ZhGsFKkDSZuSa2VSEOR64twERxq0e-UL9mw3OXa97BVgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 6:29=E2=80=AFPM Ayan Kumar Halder <ayankuma@amd.com=
> wrote:
>
> Hi Frediano,
>
> Appreciate your feedback.
>
> On 10/10/2024 15:43, Frediano Ziglio wrote:
> > On Thu, Oct 10, 2024 at 3:05=E2=80=AFPM Ayan Kumar Halder
> > <ayan.kumar.halder@amd.com> wrote:
> >> If the BSS section is empty, then the function can just return.
> >>
> >> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> >> ---
> >> Changes from :-
> >>
> >> v1..v2 - New patch introduced in v3.
> >>
> >>   xen/arch/arm/arm64/head.S | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> >> index 14c3720d80..72c7b24498 100644
> >> --- a/xen/arch/arm/arm64/head.S
> >> +++ b/xen/arch/arm/arm64/head.S
> >> @@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
> >>           PRINT("- Zero BSS -\r\n")
> >>           ldr   x0, =3D__bss_start       /* x0 :=3D vaddr(__bss_start)=
 */
> >>           ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_end)  =
 */
> >> +        cmp   x1, x0
> >> +        beq   skip_bss
> >>
> >>   1:      str   xzr, [x0], #8
> >>           cmp   x0, x1
> > Why not just transforming the "do while" loop into a "while" one and
> > just jump to cmp?
> >
> > Something like (not tested)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 14c3720d80..987f243578 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -346,9 +346,10 @@ FUNC_LOCAL(zero_bss)
> >          PRINT("- Zero BSS -\r\n")
> >          ldr   x0, =3D__bss_start       /* x0 :=3D vaddr(__bss_start) *=
/
> >          ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_end)   *=
/
> > +        b     2f
> >
> > 1:      str   xzr, [x0], #8
> > -        cmp   x0, x1
> > +2:      cmp   x0, x1
> >          b.lo  1b
>
> I am not really sure if this implementation is better than the previous
> one. The drawback of my implementation is that we have an extra 'cmp'
> instruction. The drawback of this implementation is that we need an
> extra label and there is an un-conditional branch after ldr (readability
> is difficult). May be I am biased. :)
>
> How does this look ?
>
> FUNC_LOCAL(zero_bss)
>          /* Zero BSS only when requested */
>          cbnz  x26, skip_bss
>
>          PRINT("- Zero BSS -\r\n")
>          ldr   x0, =3D__bss_start       /* x0 :=3D vaddr(__bss_start) */
>          ldr   x1, =3D__bss_end         /* x1 :=3D vaddr(__bss_end) */
> 1:     cmp   x1, x0
>          beq   skip_bss
>
>          str   xzr, [x0], #8
>          b     1b
>
> skip_bss:
>          ret
> END(zero_bss)
>
> - Ayan
>

Not strong about. Your first version was fine too. I suppose just
personal preferences, being not a hard path if you think first version
was more readable fine with it. Between your 2 versions, I prefer the
first. It has fewer instructions in the loop. Probably I've seen too
much compiler generated code (jumping to the condition at the end is
common there) that for me, it got more readable.

Frediano

