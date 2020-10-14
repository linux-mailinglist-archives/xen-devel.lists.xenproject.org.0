Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77828E46F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 18:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6860.18017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSjd6-0005Ay-73; Wed, 14 Oct 2020 16:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6860.18017; Wed, 14 Oct 2020 16:27:56 +0000
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
	id 1kSjd6-0005AZ-3T; Wed, 14 Oct 2020 16:27:56 +0000
Received: by outflank-mailman (input) for mailman id 6860;
 Wed, 14 Oct 2020 16:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSjd5-0005AU-0n
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:27:55 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6765579f-1f39-483b-92da-b6e6a98d28be;
 Wed, 14 Oct 2020 16:27:54 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so58351ljg.10
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 09:27:54 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSjd5-0005AU-0n
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 16:27:55 +0000
X-Inumbo-ID: 6765579f-1f39-483b-92da-b6e6a98d28be
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6765579f-1f39-483b-92da-b6e6a98d28be;
	Wed, 14 Oct 2020 16:27:54 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so58351ljg.10
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WRe1XAt+nB86rUXoXv+uMmWylO352IQALVwPEQlFTU=;
        b=LVJuC5DxeSO5i+lwK+GtVemtgt1WUYJSXj7bQIngLKRJ75gDUAPTXtTik2tKXKThMj
         Ch8AlUEp3yuUSXxvyBQOIqs/lPwlBFqCSZL0RYXtGzMosh1KsjOYhCVLaCWc2qsqL0Fd
         znqwvaCa4njLy4l+WQ7CppjbmO1fMN5H+JkqKyt66JTvzkOpqf8KyGslFIFpai1swlYx
         tVEFVy+NmuLVTGES+9alg7d/5/QAcEiMcaZ7PfNmpQRzNJt6he6OXlPmR699rUoxBopR
         ix0qsqRw8DSUtGOROiNTtD/VThOLiMJsQ2ErF0C47VEZbRUG6UmS9elpLxHQt9p9m++k
         C+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WRe1XAt+nB86rUXoXv+uMmWylO352IQALVwPEQlFTU=;
        b=LZriZqKnaNonjXd4M4p4BmnbkxJJ2M/ZdWg+Hpy7gROmGe5clzVCegBIecS+rssOk7
         P0RGGlBF74hEH4VGDkaBS/ydBnKdLQyGdk5jpmcj/lngiYsSJyWurTYx243vU6DF4FUM
         zrCnvAB0+ETRTUgbdgPYZPE1SKjdz/0WFLVIbl4VDEPRLT6I/4eayRtmCwtiygudMCR1
         GBsCGA+pcuPAPyYEaPJpA+ZQg+uEy20Jo2hAGlLeJzOHeDTDBvSd4rliigIiE5lejzZG
         uZRW1MQ4WUTuPR38tht2jckj/XGu3dXDPMoIsFiNeXEAWqXT0APaN7+T+uCCBrgI8H/O
         nLBg==
X-Gm-Message-State: AOAM531jHZ5i9hqstB2M+5U0mo4OynDZFOQJngak2cAYT/M6sA0k7MAK
	f7n5oOHWqCE6R9iBLmFaWhBPMaAlq5cdRCd7/cQ=
X-Google-Smtp-Source: ABdhPJwy7DZ4YGbH1j/s6TMHWgFw9mRRWW8xYK3ks+AR9JtSocHTkaqyomYOLUhlZkBsYDxkr2jjzh38I2Imd2v4k+g=
X-Received: by 2002:a2e:924b:: with SMTP id v11mr19704ljg.262.1602692872999;
 Wed, 14 Oct 2020 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201014153150.83875-1-jandryuk@gmail.com> <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
In-Reply-To: <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 14 Oct 2020 12:27:40 -0400
Message-ID: <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 12:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.10.2020 17:31, Jason Andryuk wrote:
> > Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
> > kernel build CONFIG_PVH=y CONFIG_PV=n lacks the note.  In this case,
> > virt_entry will be UNSET_ADDR, overwritten by the ELF header e_entry,
> > and fail the check against the virt address range.

Oh, these should be CONFIG_XEN_PVH=y and CONFIG_XEN_PV=n

> > Change the code to only check virt_entry against the virtual address
> > range if it was set upon entry to the function.
>
> Not checking at all seems wrong to me. The ELF spec anyway says
> "virtual address", so an out of bounds value is at least suspicious.
>
> > Maybe the overwriting of virt_entry could be removed, but I don't know
> > if there would be unintended consequences where (old?) kernels don't
> > have an elfnote, but do have an in-range e_entry?  The failing kernel I
> > just looked at has an e_entry of 0x1000000.
>
> And if you dropped the overwriting, what entry point would we use
> in the absence of an ELF note?

elf_xen_note_check currently has:

    /* PVH only requires one ELF note to be set */
    if ( parms->phys_entry != UNSET_ADDR32 )
    {
        elf_msg(elf, "ELF: Found PVH image\n");
        return 0;
    }

> I'd rather put up the option of adjusting the entry (or the check),
> if it looks like a valid physical address.

The function doesn't know if the image will be booted PV or PVH, so I
guess we do all the checks, but use 'parms->phys_entry != UNSET_ADDR32
&& parms->virt_entry == UNSET_ADDR' to conditionally skip checking
virt?

Regards,
Jason

