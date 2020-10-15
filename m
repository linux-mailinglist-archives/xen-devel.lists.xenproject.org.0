Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1C28F539
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7447.19452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4an-0007qj-NL; Thu, 15 Oct 2020 14:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7447.19452; Thu, 15 Oct 2020 14:50:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4an-0007qK-Jo; Thu, 15 Oct 2020 14:50:57 +0000
Received: by outflank-mailman (input) for mailman id 7447;
 Thu, 15 Oct 2020 14:50:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kT4al-0007qD-FY
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:50:55 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1eb4feb-be63-4c44-a600-fdaa095fbcdf;
 Thu, 15 Oct 2020 14:50:54 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l28so3901469lfp.10
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:50:54 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Un/f=DW=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kT4al-0007qD-FY
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:50:55 +0000
X-Inumbo-ID: c1eb4feb-be63-4c44-a600-fdaa095fbcdf
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1eb4feb-be63-4c44-a600-fdaa095fbcdf;
	Thu, 15 Oct 2020 14:50:54 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l28so3901469lfp.10
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4Re/d8K/MlHcKuvoYcGduQCYOKA27KL2gs+AeLiBNn4=;
        b=GF/XEwHVl/wE8f4Kaw0QjDHPll2czIK2djLa+awk1owVI/zVer9dc6MLQZZGd5QR5p
         +bhm73n3RriW/QXvGb7x6Z8MTK/sSdeLsOy8mdSHEzy0RzWn/5sGXr9uMcFJ/14I/mxF
         izJbJgTztDyywvUeoSZ47gDrIwoLJxqZnOAIg7v8YSTMGnUj3MhEzS9vCtF0U//Yed/2
         fQL70bNC9RNS5asYaoPp0zAyZUMYN/zExx2nB+TOWOQ2F3kTG8eXe78hQsnlJPzxrUkQ
         tpC8JWxR3x9wf3KHO5e9MsPS/rcdrh3dlC/kWGP9L5VT3gSpMaEgRfw/WHj66MJFJvXe
         BNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Re/d8K/MlHcKuvoYcGduQCYOKA27KL2gs+AeLiBNn4=;
        b=LitAvODobU97PQkHIC2QeoBpXxkfOt1wp1O8h+Cy4X2bFPF0wCabhGpBWhGd2PMl19
         mwLgv5aKMhiHPMJ92yEtknI4CXqa/6rgjukbgvIuvfROlfGU1iBYJOoncL229YCUwRox
         iyO5EZUxx1rpRe2hluNuiUClGEw9UJ8pa8JbIm9VO4D3aGgV1+rrlws8AZ2zDNzi+YUf
         pP/CKOGyQw+BLs/EoqdP8//9kkGmFsJq4Zli7rz88I+qGim5/oqxIJgY4peQzuF6Cy1k
         Mi+EyLwv8NrBLBzc1ywfTXPfQqv4/blWtiqwnENEa2r3aXCC0YN9PGeTQh+8+8Ag1391
         IeXQ==
X-Gm-Message-State: AOAM530NzLa/yfLoSE32loDxfwBTrpHq3i6hy4ikWqMrciwT7iewb6hJ
	sp0jBp+n6ipdEe0GAIf2rfM1Tpusq0ng1KL2vGw=
X-Google-Smtp-Source: ABdhPJzaRjlqWJEFcYwUJHG+A+w6vwICH8dz3Q6I1CRDsH5bnyLoKBOGMUzUuIGy5SAEwvM1X56/sBjVEjMA/Xq4p1k=
X-Received: by 2002:ac2:4ed0:: with SMTP id p16mr684154lfr.554.1602773453293;
 Thu, 15 Oct 2020 07:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201014153150.83875-1-jandryuk@gmail.com> <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com> <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
In-Reply-To: <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 15 Oct 2020 10:50:41 -0400
Message-ID: <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 3:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.10.2020 18:27, Jason Andryuk wrote:
> > On Wed, Oct 14, 2020 at 12:02 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 14.10.2020 17:31, Jason Andryuk wrote:
> >>> Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  =
A
> >>> kernel build CONFIG_PVH=3Dy CONFIG_PV=3Dn lacks the note.  In this ca=
se,
> >>> virt_entry will be UNSET_ADDR, overwritten by the ELF header e_entry,
> >>> and fail the check against the virt address range.
> >
> > Oh, these should be CONFIG_XEN_PVH=3Dy and CONFIG_XEN_PV=3Dn
> >
> >>> Change the code to only check virt_entry against the virtual address
> >>> range if it was set upon entry to the function.
> >>
> >> Not checking at all seems wrong to me. The ELF spec anyway says
> >> "virtual address", so an out of bounds value is at least suspicious.
> >>
> >>> Maybe the overwriting of virt_entry could be removed, but I don't kno=
w
> >>> if there would be unintended consequences where (old?) kernels don't
> >>> have an elfnote, but do have an in-range e_entry?  The failing kernel=
 I
> >>> just looked at has an e_entry of 0x1000000.
> >>
> >> And if you dropped the overwriting, what entry point would we use
> >> in the absence of an ELF note?
> >
> > elf_xen_note_check currently has:
> >
> >     /* PVH only requires one ELF note to be set */
> >     if ( parms->phys_entry !=3D UNSET_ADDR32 )
> >     {
> >         elf_msg(elf, "ELF: Found PVH image\n");
> >         return 0;
> >     }
> >
> >> I'd rather put up the option of adjusting the entry (or the check),
> >> if it looks like a valid physical address.
> >
> > The function doesn't know if the image will be booted PV or PVH, so I
> > guess we do all the checks, but use 'parms->phys_entry !=3D UNSET_ADDR3=
2
> > && parms->virt_entry =3D=3D UNSET_ADDR' to conditionally skip checking
> > virt?
>
> Like J=C3=BCrgen, the purpose of the patch hadn't become clear to me
> from reading the description. As I understand it now, we're currently
> refusing to boot such a kernel for no reason. If that's correct,
> perhaps you could say so in the description in a more direct way?

Yes, sorry I didn't state it clearly.  You are correct, libxc fails
with "xc_dom_find_loader: no loader found" for a linux kernel with
PHYS32_ENTRY but without ENTRY.

> As far as actual code adjustments go - how much of
> elf_xen_addr_calc_check() is actually applicable when booting PVH?

I don't know...

> And why is there no bounds check of ->phys_entry paralleling the
> ->virt_entry one?

What is the purpose of this checking?  It's sanity checking which is
generally good, but what is the harm from failing the checks?  A
corrupt kernel can crash itself?  Maybe you could start executing
something (the initramfs?) instead of the actual kernel?

> On the whole, as long as we don't know what mode we're planning to
> boot in, we can't skip any checks, as the mere presence of
> XEN_ELFNOTE_PHYS32_ENTRY doesn't mean that's also what gets used.
> Therefore simply bypassing any of the checks is not an option.

elf_xen_note_check() early exits when it finds phys_entry set, so
there is already some bypassing.

> In
> particular what you suggest would lead to failure to check
> e_entry-derived ->virt_entry when the PVH-specific note is
> present but we're booting in PV mode. For now I don't see how to
> address this without making the function aware of the intended
> booting mode.

Yes, the relevant checks depend on the desired booting mode.

The e_entry use seems a little problematic.  You said the ELF
Specification states it should be a virtual address, but Linux seems
to fill it with a physical address.  You could use a heuristic e_entry
< 0 (0xffff...) to compare with the virtual addresses otherwise check
against physical?

Regards,
Jason

