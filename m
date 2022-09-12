Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC25B5BC2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 16:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405830.648267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXjyn-0005mF-8o; Mon, 12 Sep 2022 14:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405830.648267; Mon, 12 Sep 2022 14:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXjyn-0005gN-5H; Mon, 12 Sep 2022 14:00:05 +0000
Received: by outflank-mailman (input) for mailman id 405830;
 Mon, 12 Sep 2022 14:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nJqN=ZP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1oXjym-0005Sy-7v
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 14:00:04 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3262bb06-32a3-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 16:00:03 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id d1so6776354qvs.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Sep 2022 07:00:03 -0700 (PDT)
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
X-Inumbo-ID: 3262bb06-32a3-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oGjwpKdUm9W02bdQDqf4c8TH2tz3B8jnWHZnYzh17d0=;
        b=YIMU8doEhxv36d24kt3LEj91HmmWypRL8yu+2+qrZEqkynzDgkMXu7ds1nCrGaW0ja
         BJsjxjx06Zqv/dWBhlP8PfoD3aq/02tOa8mVL3exy24zU+rHmfN28HQYe1qVU4Gnb1UO
         qlFVFKa3I/oxMUpjehcZGjEoB+a/ad/huAoLCN5T6J981UP8NbXvmNcVhUWVe54wFVXy
         fZSy1zsIy2puHzT6sGQgdkxLpGLerWTGTLYvOez/Jm50YYX6cTJmeeqvzIMGfcQavgks
         jqR3WX+rk8FXDoJAUKnINTQpdxiUA0bJN6Sdw94+DDJRBDzoFG/0KqCzFDVj7yotZ9q+
         KF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oGjwpKdUm9W02bdQDqf4c8TH2tz3B8jnWHZnYzh17d0=;
        b=oChv9UGPfv6FvabFw44LhyDAaBhoxQqpfaghzy2pvtzfRgjNytxz2tOSEem7+qBnpy
         L/pUuy5raeVgY15VQwBrMAc2lTb0PbRsKACe50PzOETqUjkU1Tk9GMv9F9wl7VMbrd2u
         /r/ZjfSCRgH8SSGh3iCy4W0132BFoHp1itOBy2TH1jBlZwdK+8M8yYXHanDTqj4i58+t
         BLv434w9tSNDPMmCrMqSqIZgasuR6a3V7Tb+7KjHw8R4yjYGUn662PxQYvyJJ0xfRF9z
         u2vdlZ2njz+myUYgxMvFt3bO7AqjGseE1sNI/+RDWp0sifscbLvkurnozB03xBs7nW0F
         ZS1g==
X-Gm-Message-State: ACgBeo3z1ucmmL7mM3iaFDOQ1kexEEmQk5oL8v/g2myo44vK3jh+kQSX
	7tHAyHbwcCaCYk2kQUWu0Cp/86r6ezljQNgBn8TZ+w==
X-Google-Smtp-Source: AA6agR6zxinXFB3JWSAMOzo9H2jsPbK1TcEbkfNyw9scuC9y9x/WwQi2+d3h7AbrcOGu5hEKrGk327rQXj/k6yat0NQ=
X-Received: by 2002:a05:6214:27e4:b0:4ac:a631:f551 with SMTP id
 jt4-20020a05621427e400b004aca631f551mr7620045qvb.12.1662991202016; Mon, 12
 Sep 2022 07:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-10-carlo.nonato@minervasys.tech> <f2684d00-b23e-175d-8cef-7de361cba2ef@xen.org>
In-Reply-To: <f2684d00-b23e-175d-8cef-7de361cba2ef@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 12 Sep 2022 15:59:51 +0200
Message-ID: <CAG+AhRX2mRBj9BtLeu3fVVstN=4kCzCq+hmBSg+sBg32f5=Gkg@mail.gmail.com>
Subject: Re: [PATCH 09/12] Revert "xen/arm: mm: Initialize page-tables earlier"
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
	stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it, 
	andrea.bastoni@minervasys.tech, lucmiccio@gmail.com, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Sat, Sep 10, 2022 at 4:29 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 26/08/2022 13:51, Carlo Nonato wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> >
> > This reverts commit 3a5d341681af650825bbe3bee9be5d187da35080.
>
> Usually, this indicates that this was a clean revert. IOW, there was no
> clash or modification necessary. Looking at the diff below, this doesn't
> look to be the case because you are also reverting f8c818848fa6
> "xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()"
> and introduce a new version of create_boot_mappings().
>
> So I think the commit message/title should be reworded to explain this
> is not a clean revert and what extra changes were made.
>
> But see below about re-introducing create_boot_mapping().
>
> >
> > The cache coloring support will be configurable within the Xen command line,
> > but it will be initialized before the page-tables; this is necessary
> > for coloring the hypervisor itself beacuse we will create a specific
> > mapping for it that could be configured using some command line options.
> > In order to parse all the needed information from the device tree, we
> > need to revert the above commit and restore the previous order for
> > page-tables initialization.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> >   xen/arch/arm/mm.c    | 33 ++++++++++++++++++++-------------
> >   xen/arch/arm/setup.c |  4 ++--
> >   2 files changed, 22 insertions(+), 15 deletions(-)
> >
> > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > index b42cddb1b4..1afa02b4af 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -368,6 +368,17 @@ static inline lpae_t pte_of_xenaddr(vaddr_t va)
> >       return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
> >   }
> >
> > +static void __init create_boot_mappings(unsigned long virt_offset,
> > +                                        mfn_t base_mfn)
> > +{
> > +    lpae_t pte;
> > +
> > +    pte = mfn_to_xen_entry(base_mfn, MT_NORMAL);
> > +    write_pte(&boot_second[second_table_offset(virt_offset)], pte);
> > +    flush_xen_tlb_local();
> > +}
> Please don't introduce a new function that create mappings. All mappings
> should be done using map_pages_to_xen(). Looking at the implementation,
> it should be usable with the following diff:
>
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index c81c706c8b23..78afb8eb0ec1 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1104,7 +1104,7 @@ static int xen_pt_update(unsigned long virt,
>        *
>        * XXX: Add a check.
>        */
> -    const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
> +    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
>
>       /*
>        * The hardware was configured to forbid mapping both writeable and
>
> With that there is no change required in early_fdt_map() and ...
>
> >
> > +    /* ... DTB */
> > +    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START)];
> > +    xen_second[second_table_offset(BOOT_FDT_VIRT_START)] = pte;
> > +    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)];
> > +    xen_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)] = pte;
> > +
>
> ... rather than copying the 2 entries, you could call early_fdt_map()
> after the switch. The advantage is it will avoid to hardoded more
> page-table entries.

Thanks for the diff and the suggestions. I just tested it and it works
properly! Nice.

>
> As part of my switch_ttbr() rework, I am planning to re-introduce
> relocation (at least for testing). So I will include the changes I
> mention above in my series.
>
> Cheers,
>
> --
> Julien Grall

Thanks.

- Carlo Nonato

