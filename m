Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B0376B80A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 16:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574363.899618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqkW-0006Vv-J6; Tue, 01 Aug 2023 14:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574363.899618; Tue, 01 Aug 2023 14:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqkW-0006Tj-Fw; Tue, 01 Aug 2023 14:53:24 +0000
Received: by outflank-mailman (input) for mailman id 574363;
 Tue, 01 Aug 2023 14:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4lv=DS=gmail.com=raj.khem@srs-se1.protection.inumbo.net>)
 id 1qQqkV-0006Td-2s
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 14:53:23 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27ecf86b-307b-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 16:53:21 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1be267b1c88so1875648fac.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 07:53:21 -0700 (PDT)
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
X-Inumbo-ID: 27ecf86b-307b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690901600; x=1691506400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71zAllxtILSJMl520qYLiyamgeSvcpZWU9eA3eCkpBg=;
        b=UhizypcMY2to4q0uTpe5WPzOLh2JqcV1Wzblu6URCNECWrSeukGfIVaxAy8O6zqiej
         vFnHxSSG5YAZK/tkqdl5bDLfW0TSB7sDBw3DR29dZ6i6v+tGR8GQAIqj6xtN4J1me/Yn
         A2YCJZq4tFtS4/d0iBj26htt30nVPEKV2zGh/vtRokU8Nii6l+u9pmOiFc/JuCay4+LC
         tpaByhzyibsuN0t8s+PVJecpQbtvWvoc3Rl5GutbVhXdovp5WtqXhQIP8sxuOOHWTIKf
         QZ80VUZQJ8uC5gnA4hkRfvwbhQ+oCxhDGZGC8cwjEfxVJGXUNyD6N092juO9/UKwG2eG
         g3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690901600; x=1691506400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71zAllxtILSJMl520qYLiyamgeSvcpZWU9eA3eCkpBg=;
        b=VbKOOT+bHp26/sRWuQ5T6hnmuRR09RBtzXukGDRauakZ96iVLyVZO6QTME3OTMUbGH
         OF/BOAAd8XopAFB2dfMstq179ppB9IrmetJdalLla1ftQPG+ivUQSp0FQxUcHd9CNRZb
         NGkqtCEKbd43uMWcUl5etux9/zPKLSYiN3wM0mr4B6NXj8GfHy7u0wx/u2BwAG4jeh5Y
         hvjpGzUDSulyRHMiEqN4mfoL0lwb2WHcO7HdinHdL6+4C45oazL8nYr8/O+k53OjPJhb
         q9pA7n+lfaGGN9lUJKpTlQKwW6gZSeqkUc+mxthPwbad4VCB8tef0xGWRE5Gy4nrL2lD
         mL4w==
X-Gm-Message-State: ABy/qLYgfFAU8afupM4JbNJRPj7rk98wKokJyHjw3NBEoam9RTcIS/nu
	j+czQbKRQMswggyhSlS0ZCs/xEsK6FF7XpQ8BHw=
X-Google-Smtp-Source: APBJJlGIPxTL+25/2g0PKkhyvr9HbdTpYHGjM6kcQz7zSEfsYN/de92yRQA2VVqmynM/kaHLFdK38x6flER1iZj2PJA=
X-Received: by 2002:a05:6870:ec8e:b0:1b0:d28:2a76 with SMTP id
 eo14-20020a056870ec8e00b001b00d282a76mr10379283oab.21.1690901599794; Tue, 01
 Aug 2023 07:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230801002853.556437-1-raj.khem@gmail.com> <99574b63-18e5-20fe-659a-432fdaf4b5af@amd.com>
In-Reply-To: <99574b63-18e5-20fe-659a-432fdaf4b5af@amd.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2023 07:52:53 -0700
Message-ID: <CAMKF1sq9x=UUGcROH3i9hHDJ0q867EgiEWDMyj8hpYoDm7zstw@mail.gmail.com>
Subject: Re: [PATCH] arm32: Avoid using solaris syntax for .section directive
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 12:39=E2=80=AFAM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> Hi,
>
> On 01/08/2023 02:28, Khem Raj wrote:
> >
> >
> > Assembler from binutils 2.41 rejects this syntax
> >
> > .section "name"[, flags...]
> >
> > where flags could be #alloc, #write, #execstr
> s/execstr/execinstr + there is also #exclude and #tls if you want to list=
 them all
>
> > Switch to using ELF syntax
> >
> > .section name[, "flags"[, @type]]
> >
> > [1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.htm=
l#SEC119
> I think it would be better to add a link to 2.41 docs instead or to refer=
 to the following commit
> of binutils:
> 4cb88cfae843 "PR11601, Solaris assembler compatibility doesn't work"
>
>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  xen/arch/arm/arm32/proc-v7.S | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.=
S
> > index c90a31d80f..6d3d19b873 100644
> > --- a/xen/arch/arm/arm32/proc-v7.S
> > +++ b/xen/arch/arm/arm32/proc-v7.S
> > @@ -29,7 +29,7 @@ brahma15mp_init:
> >          mcr   CP32(r0, ACTLR)
> >          mov   pc, lr
> >
> > -        .section ".proc.info", #alloc
> > +        .section .proc.info, "a"
> >          .type __v7_ca15mp_proc_info, #object
> >  __v7_ca15mp_proc_info:
> >          .long 0x410FC0F0             /* Cortex-A15 */
> > @@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
> >          .long caxx_processor
> >          .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
> >
> > -        .section ".proc.info", #alloc
> > +        .section .proc.info, "a"
> >          .type __v7_ca7mp_proc_info, #object
> >  __v7_ca7mp_proc_info:
> >          .long 0x410FC070             /* Cortex-A7 */
> > @@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
> >          .long caxx_processor
> >          .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
> >
> > -        .section ".proc.info", #alloc
> > +        .section .proc.info, "a"
> >          .type __v7_brahma15mp_proc_info, #object
> >  __v7_brahma15mp_proc_info:
> >          .long 0x420F00F0             /* Broadcom Brahma-B15 */
> > --
> > 2.41.0
> >
> >
>
> The patch looks good but a fast grep shows that ".section .dtb,#alloc" in=
 arch/arm/dtb.S would also want
> to be changed (I do not have gas 2.41, so you can check it by specifying =
dtb to be included in Xen image through
> "menuconfig->Common Features->Absolute path to device tree blob")

thanks will add it to v2 as well

>
> ~Michal

