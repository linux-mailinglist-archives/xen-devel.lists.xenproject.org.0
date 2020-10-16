Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B42909B0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8178.21780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSbN-000850-3D; Fri, 16 Oct 2020 16:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8178.21780; Fri, 16 Oct 2020 16:29:09 +0000
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
	id 1kTSbM-00084a-Vw; Fri, 16 Oct 2020 16:29:08 +0000
Received: by outflank-mailman (input) for mailman id 8178;
 Fri, 16 Oct 2020 16:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kTSbL-00084V-5l
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:29:07 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62f3dd61-7f15-4d5f-8041-80ca799917fe;
 Fri, 16 Oct 2020 16:29:06 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l28so3661846lfp.10
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 09:29:06 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kTSbL-00084V-5l
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:29:07 +0000
X-Inumbo-ID: 62f3dd61-7f15-4d5f-8041-80ca799917fe
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 62f3dd61-7f15-4d5f-8041-80ca799917fe;
	Fri, 16 Oct 2020 16:29:06 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l28so3661846lfp.10
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dbM3Xm6LdvQINTqo9Uv0kvAi8ufQMlJhoQYSnKrkBVQ=;
        b=kodGX5vFb+G+pyj64zWNPA4CwaQkPqyIkAmXXKpJhAxsN/g4yEBMlvAks5V/Tmezzl
         x7B1UA417KOQwkt/lcHw+e9n50cEOZyvutDUKXcdtMcnUlSRQ+YLxUD8x5gr9rY7rry2
         HRKYDqsMdl2CGfCVbj/Kv+5Yn5vq/H6QJ14URQtLiWkzO8oC9P7k+aFPRQEMmtrs2DDp
         bpCwu3kMPySTDKOB3aaLdpEb7WMSil+a6qe7aq0y7HdQj1MFT/nyzA1v9kRc95z27Tw2
         NIE2OnUvMnycNx9LmLTdg89bLrRmQJcg30ZVSy0K1NnarScy1xoQAH+ydisSIBhGwKFx
         bu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dbM3Xm6LdvQINTqo9Uv0kvAi8ufQMlJhoQYSnKrkBVQ=;
        b=a0HH2gSgS4EUqKV0LRDbvH0TCdyMYgMadCBDTcqsu/UiyhbCwSWVSzqxRTkLBWFxTz
         NkeGzvJ0rRWz1bl7hZymgPLHm3xHgUgFzU99i4+H15509+ffUtkjuxlyfGFCzDAQdd8X
         /dvQe+VJaVEnyQdc/ZEi3Kl5TybyuFwxWjhocJSw1w0iXbeHxP5Rg+OQj+HZ7Z9ESMs/
         ErG3aqZ5k7kb4K5Ua2XoVTy56bKHWLZOH1molzegci/AS/mWaKDHHPZ4N3KY+HSBAfWq
         KCGAkJAUJbf9q4MJ09f9qPWR6loKtfpbxUscyECC2cMbCj0Zt/qx+aitEaM7Moeo8DP6
         Vzqw==
X-Gm-Message-State: AOAM532gbV1igu53bFd8uu9wLLQt8HSqSj5GL5/A+UKFlPv7B9D7kdXr
	Pu3QGrdg6URauVcDEYXHeUszzJNg/PfGwy1KZEY=
X-Google-Smtp-Source: ABdhPJz5Or8WR6LG+odLAIJUgiZi4iR96130L9L/4i55Dh7GKl59oBljq24iDZmdhr0XPy/tMO1cI3o6uIvf2vkhJH8=
X-Received: by 2002:ac2:4ed0:: with SMTP id p16mr1632510lfr.554.1602865744947;
 Fri, 16 Oct 2020 09:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201014153150.83875-1-jandryuk@gmail.com> <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
 <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com> <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
 <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com>
In-Reply-To: <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 16 Oct 2020 12:28:53 -0400
Message-ID: <CAKf6xpv9qHJydjQ_TyZEKZAK14T4m2GLLqEwyMTraUxqvg+1Xw@mail.gmail.com>
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 11:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.10.2020 16:50, Jason Andryuk wrote:
> > On Thu, Oct 15, 2020 at 3:00 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> And why is there no bounds check of ->phys_entry paralleling the
> >> ->virt_entry one?
> >
> > What is the purpose of this checking?  It's sanity checking which is
> > generally good, but what is the harm from failing the checks?  A
> > corrupt kernel can crash itself?  Maybe you could start executing
> > something (the initramfs?) instead of the actual kernel?
>
> This is at least getting close to a possible security issue.
> Booting a hacked up binary can be a problem afaik.

If you are already letting the user provide a kernel, they can give a
well formed kernel that does whatever they want.  Like Andrew wrote,
the concern would be if the binary can subvert the hypervisor/tools.

> >> On the whole, as long as we don't know what mode we're planning to
> >> boot in, we can't skip any checks, as the mere presence of
> >> XEN_ELFNOTE_PHYS32_ENTRY doesn't mean that's also what gets used.
> >> Therefore simply bypassing any of the checks is not an option.
> >
> > elf_xen_note_check() early exits when it finds phys_entry set, so
> > there is already some bypassing.
> >
> >> In
> >> particular what you suggest would lead to failure to check
> >> e_entry-derived ->virt_entry when the PVH-specific note is
> >> present but we're booting in PV mode. For now I don't see how to
> >> address this without making the function aware of the intended
> >> booting mode.
> >
> > Yes, the relevant checks depend on the desired booting mode.
> >
> > The e_entry use seems a little problematic.  You said the ELF
> > Specification states it should be a virtual address, but Linux seems
> > to fill it with a physical address.  You could use a heuristic e_entry
> > < 0 (0xffff...) to compare with the virtual addresses otherwise check
> > against physical?
>
> Don't we have a physical range as well? And don't we adjust the
> entry point already in certain cases anyway? Checking and adjustment
> can (and should) be brought in sync, and else checking the entry
> point fits at least one of the two ranges may be better than no
> checking at all, I think.

Looks like we can pass XC_DOM_PV_CONTAINER/XC_DOM_HVM_CONTAINER down
into elf_xen_parse().  Then we would just validate phys_entry for HVM
and virt_entry for PV.  Does that sound reasonable?

(The use in xc_dom_probe_hvm_kernel() is interesting to disallow
Xen-enabled kernel.)

Regards,
Jason

