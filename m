Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECEB243FF9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 22:40:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6K17-0005Qg-GJ; Thu, 13 Aug 2020 20:40:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rQHj=BX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k6K15-00056s-4f
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 20:40:03 +0000
X-Inumbo-ID: 67c588c9-d920-459a-811b-606737fa1435
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67c588c9-d920-459a-811b-606737fa1435;
 Thu, 13 Aug 2020 20:40:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k20so6165034wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2020 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FM//vXwd9avFudoIlwfTqdbLJT8mxVrKlGU/F9Jqvh8=;
 b=bFgorhNPA5uzW1OYC1zAUinW8j+K4nIs4UVoJ8k/FPXQH5HGHR04om1pf9+wjyKflM
 on0DKR1tLx+j5aM2e+1uZwC5gp1u/05Fw5Nbtda+RKcKlFej0fsUWPO2HvpR1tgi3L0j
 K9zRZHAKBaaVMq+xsRi2TpC5qbxnkDThGvPyjiYDyZLoNqBkp3MIqtRJO/lF20gtqCtp
 qNMQLj5iCI05D719giZOe/ePYfxkaqnbKNNMQVTXXnR5RFtBytJdqLojhcBSeIlGVoc7
 WT0Ln5WczO2kpStwxgxQHv8VQpsqCZJApj5cAt/DmVwu0y8+dzfdgDxzSwMD6lnjTBzI
 oWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FM//vXwd9avFudoIlwfTqdbLJT8mxVrKlGU/F9Jqvh8=;
 b=g3dmZ9e7xNoTYGSJ/2r6mnFy+UM448iqDJi6r5hOf6EN8Hsrr4lSshs/3xC0Mhyn6y
 AUadKua2Q/dQa+wf4FuPmq0MqpRkGzv98mrEt4iQ/ABZR7Yt97yxqSyndnfuMKePmKRP
 yAQW7dmK0uJx/VjBCjM0zmqG3dUErEeIxBYxdbwb2yEFu383NtjC/ZjHgXqV7FkDjw2Y
 Avkt0DNEVOSMoIFRZwuyr8X5cKjk9Pr3vkLcTKyReds6txW8VP+avLV55z4mvsm56LiX
 SaX13BvYaWn/LhmO+fQ2gK7a/uKOiVTRkNbTRfSbvZ4bdj5uBkMm8QFgShhcnPElZayy
 DFpA==
X-Gm-Message-State: AOAM530OoGTyrfIFshC2db2KJnsEpkJrOiyrxzMtCcYvHQpga6X8AMcp
 DWa2cStG01UMcGEAuGD/Wvujl209xu7UxygZL6s=
X-Google-Smtp-Source: ABdhPJwYLTVZyoatwYwiHEKn0cP61aPYcpQCMr3m0QN+aYBYgE7HrnfmKswJmt+RMhNYiu96UefLGnhXx4JL8zQCi38=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr5508081wmi.63.1597351199770; 
 Thu, 13 Aug 2020 13:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <02f6a5cf-46c3-c216-ad52-707e3409f156@gmail.com>
 <88b80010-2c56-c038-800a-3abd44f46ca5@xen.org>
 <b5497b00-2ee9-e6d8-ea4d-583a14b54522@gmail.com>
In-Reply-To: <b5497b00-2ee9-e6d8-ea4d-583a14b54522@gmail.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 13 Aug 2020 23:39:48 +0300
Message-ID: <CAPD2p-n3ErCo0uFrW57P22409baU0Uq3s-7z4y+Q3xjKzX3j4g@mail.gmail.com>
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, 
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
 Julien Grall <julien.grall@arm.com>
Content-Type: multipart/alternative; boundary="000000000000d80d6305acc84eb6"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000d80d6305acc84eb6
Content-Type: text/plain; charset="UTF-8"

Hi

Sorry for the possible format issue.

On Thu, Aug 13, 2020 at 9:42 PM Oleksandr <olekstysh@gmail.com> wrote:

>
> On 11.08.20 20:50, Julien Grall wrote:
>
> Hi Julien
>
> >
> >
> > On 11/08/2020 18:09, Oleksandr wrote:
> >>
> >> On 05.08.20 12:32, Julien Grall wrote:
> >>
> >> Hi Julien, Stefano
> >>
> >>>
> >>>>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> >>>>> index 5fdb6e8..5823f11 100644
> >>>>> --- a/xen/include/asm-arm/p2m.h
> >>>>> +++ b/xen/include/asm-arm/p2m.h
> >>>>> @@ -385,10 +385,11 @@ static inline int
> >>>>> set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
> >>>>>                                           mfn_t mfn)
> >>>>>   {
> >>>>>       /*
> >>>>> -     * NOTE: If this is implemented then proper reference
> >>>>> counting of
> >>>>> -     *       foreign entries will need to be implemented.
> >>>>> +     * XXX: handle properly reference. It looks like the page may
> >>>>> not always
> >>>>> +     * belong to d.
> >>>>
> >>>> Just as a reference, and without taking away anything from the
> >>>> comment,
> >>>> I think that QEMU is doing its own internal reference counting for
> >>>> these
> >>>> mappings.
> >>>
> >>> I am not sure how this matters here? We can't really trust the DM to
> >>> do the right thing if it is not running in dom0.
> >>>
> >>> But, IIRC, the problem is some of the pages doesn't belong to do a
> >>> domain, so it is not possible to treat them as foreign mapping (e.g.
> >>> you wouldn't be able to grab a reference). This investigation was
> >>> done a couple of years ago, so this may have changed in recent Xen.
> >>
> >> Well, emulator is going to be used in driver domain, so this TODO
> >> must be resolved. I suspect that the check for a hardware domain in
> >> acquire_resource() which I skipped in a hackish way [1] could be
> >> simply removed once proper reference counting is implemented in Xen,
> >> correct?
> >
> > It depends how you are going to solve it. If you manage to solve it in
> > a generic way, then yes you could resolve. If not (i.e. it is solved
> > in an arch-specific way), we would need to keep the check on arch that
> > are not able to deal with it. See more below.
> >
> >>
> >> Could you please provide some pointers on that problem? Maybe some
> >> questions need to be investigated again? Unfortunately, it is not
> >> completely clear to me the direction to follow...
> >>
> >> ***
> >> I am wondering whether the similar problem exists on x86 as well?
> >
> > It is somewhat different. On Arm, we are able to handle properly
> > foreign mapping (i.e. mapping page from a another domain) as we would
> > grab a reference on the page (see XENMAPSPACE_gmfn_foreign handling in
> > xenmem_add_to_physmap()). The reference will then be released when the
> > entry is removed from the P2M (see p2m_free_entry()).
> >
> > If all the pages given to set_foreign_p2m_entry() belong to a domain,
> > then you could use the same approach.
> >
> > However, I remember to run into some issues in some of the cases. I
> > had a quick looked at the caller and I wasn't able to find any use
> > cases that may be an issue.
> >
> > The refcounting in the IOREQ code has changed after XSA-276 (this was
> > found while working on the Arm port). Probably the best way to figure
> > out if it works would be to try it and see if it fails.
> >
> > Note that set_foreign_p2m_entry() doesn't have a parameter for the
> > foreign domain. You would need to add a extra parameter for this.
> >
> >> The FIXME tag (before checking for a hardware domain in
> >> acquire_resource()) in the common code makes me think it is a common
> >> issue. From other side x86's
> >> implementation of set_foreign_p2m_entry() is exists unlike Arm's one
> >> (which returned -EOPNOTSUPP so far). Or these are unrelated?
> >
> > At the moment, x86 doesn't support refcounting for foreign mapping.
> > Hence the reason to restrict them to the hardware domain.
>
>
> Thank you for the pointers!
>
>
> I checked that all pages given to set_foreign_p2m_entry() belonged to a
> domain (at least in my use-case). I noticed two calls for acquiring
> resource at the DomU creation time, the first call was for grant table
> (single gfn)
> and the second for ioreq server which carried 2 gfns (for shared and
> buffered rings I assume). For the test purpose, I passed these gfns to
> get_page_from_gfn() in order to grab references on the pages, after that
> I tried to destroy DomU without calling put_page() for these pages. The
> fact that I couldn't destroy DomU completely (a zombie domain was
> observed) made me think that references were still taken, so worked as
> expected.
>
>
> I implemented a test patch (which uses approach from
> xenmem_add_to_physmap_one() for XENMAPSPACE_gmfn_foreign case) to check
> whether it would work.
>
>
> ---
>   xen/arch/arm/p2m.c        | 30 ++++++++++++++++++++++++++++++
>   xen/common/memory.c       |  2 +-
>   xen/include/asm-arm/p2m.h | 12 ++----------
>   3 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index e9ccba8..7359715 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1385,6 +1385,36 @@ int guest_physmap_remove_page(struct domain *d,
> gfn_t gfn, mfn_t mfn,
>       return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
>   }
>
> +int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
> +                          unsigned long gfn, mfn_t mfn)
> +{
> +    struct page_info *page;
> +    p2m_type_t p2mt;
> +    int rc;
> +
> +    /*
> +     * Take reference to the foreign domain page. Reference will be
> released
> +     * in p2m_put_l3_page().
> +     */
> +    page = get_page_from_gfn(fd, gfn, &p2mt, P2M_ALLOC);
> +    if ( !page )
> +        return -EINVAL;
> +
> +    if ( p2m_is_ram(p2mt) )
> +        p2mt = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw :
> p2m_map_foreign_ro;
> +    else
> +    {
> +        put_page(page);
> +        return -EINVAL;
> +    }
> +
> +    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2mt);
> +    if ( rc )
> +        put_page(page);
> +
> +    return 0;
> +}
> +
>   static struct page_info *p2m_allocate_root(void)
>   {
>       struct page_info *page;
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 8d9f0a8..1de1d4f 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1171,7 +1171,7 @@ static int acquire_resource(
>
>           for ( i = 0; !rc && i < xmar.nr_frames; i++ )
>           {
> -            rc = set_foreign_p2m_entry(currd, gfn_list[i],
> +            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>                                          _mfn(mfn_list[i]));
>               /* rc should be -EIO for any iteration other than the first
> */
>               if ( rc && i )
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 5823f11..53ce373 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -381,16 +381,8 @@ static inline gfn_t gfn_next_boundary(gfn_t gfn,
> unsigned int order)
>       return gfn_add(gfn, 1UL << order);
>   }
>
> -static inline int set_foreign_p2m_entry(struct domain *d, unsigned long
> gfn,
> -                                        mfn_t mfn)
> -{
> -    /*
> -     * XXX: handle properly reference. It looks like the page may not
> always
> -     * belong to d.
> -     */
> -
> -    return guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_ram_rw);
> -}
> +int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
> +                          unsigned long gfn,  mfn_t mfn);
>
>   /*
>    * A vCPU has cache enabled only when the MMU is enabled and data cache
> --
> 2.7.4
>
>
> And with that patch applied I was facing a BUG when destroying/rebooting
> DomU. The call of put_page_alloc_ref() in hvm_free_ioreq_mfn() triggered
> that BUG:
>
>
> Rebooting domain 2
> root@generic-armv8-xt-dom0:~# (XEN) Xen BUG at
> ...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683
> (XEN) ----[ Xen-4.14.0  arm64  debug=y   Not tainted ]----
> (XEN) CPU:    3
> (XEN) PC:     0000000000246f28 ioreq.c#hvm_free_ioreq_mfn+0x68/0x6c
> (XEN) LR:     0000000000246ef0
> (XEN) SP:     0000800725eafd80
> (XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)      X0: 0000000000000001  X1: 403fffffffffffff  X2: 000000000000001f
> (XEN)      X3: 0000000080000000  X4: 0000000000000000  X5: 0000000000400000
> (XEN)      X6: 0000800725eafe24  X7: 0000ffffd1ef3e08  X8: 0000000000000020
> (XEN)      X9: 0000000000000000 X10: 00e800008ecebf53 X11: 0400000000000000
> (XEN)     X12: ffff7e00013b3ac0 X13: 0000000000000002 X14: 0000000000000001
> (XEN)     X15: 0000000000000001 X16: 0000000000000029 X17: 0000ffff9badb3d0
> (XEN)     X18: 000000000000010f X19: 0000000810e60e38 X20: 0000800725e68ec0
> (XEN)     X21: 0000000000000000 X22: 00008004dc0404a0 X23: 000000005a000ea1
> (XEN)     X24: ffff8000460ec280 X25: 0000000000000124 X26: 000000000000001d
> (XEN)     X27: ffff000008ad1000 X28: ffff800052e65100  FP: ffff0000223dbd20
> (XEN)
> (XEN)   VTCR_EL2: 80023558
> (XEN)  VTTBR_EL2: 0002000765f04000
> (XEN)
> (XEN)  SCTLR_EL2: 30cd183d
> (XEN)    HCR_EL2: 000000008078663f
> (XEN)  TTBR0_EL2: 00000000781c5000
> (XEN)
> (XEN)    ESR_EL2: f2000001
> (XEN)  HPFAR_EL2: 0000000000030010
> (XEN)    FAR_EL2: ffff000008005f00
> (XEN)
> (XEN) Xen stack trace from sp=0000800725eafd80:
> (XEN)    0000800725e68ec0 0000000000247078 00008004dc040000
> 00000000002477c8
> (XEN)    ffffffffffffffea 0000000000000001 ffff8000460ec500
> 0000000000000002
> (XEN)    000000000024645c 00000000002462dc 0000800725eafeb0
> 0000800725eafeb0
> (XEN)    0000800725eaff30 0000000060000145 000000000027882c
> 0000800725eafeb0
> (XEN)    0000800725eafeb0 01ff00000935de80 00008004dc040000
> 0000000000000006
> (XEN)    ffff800000000000 0000000000000002 000000005a000ea1
> 000000019bc60002
> (XEN)    0000ffffd1ef3e08 0000000000000020 0000000000000004
> 000000000027c7d8
> (XEN)    000000005a000ea1 0000800725eafeb0 000000005a000ea1
> 0000000000279f98
> (XEN)    0000000000000000 ffff8000460ec200 0000800725eaffb8
> 0000000000262c58
> (XEN)    0000000000262c4c 07e0000160000249 0000000000000002
> 0000000000000001
> (XEN)    ffff8000460ec500 ffff8000460ec508 ffff8000460ec208
> ffff800052e65100
> (XEN)    000000005060b478 0000ffffd20f3000 ffff7e00013c77e0
> 0000000000000000
> (XEN)    00e800008ecebf53 0400000000000000 ffff7e00013b3ac0
> 0000000000000002
> (XEN)    0000000000000001 0000000000000001 0000000000000029
> 0000ffff9badb3d0
> (XEN)    000000000000010f ffff8000460ec210 ffff8000460ec200
> ffff8000460ec210
> (XEN)    0000000000000001 ffff8000460ec500 ffff8000460ec280
> 0000000000000124
> (XEN)    000000000000001d ffff000008ad1000 ffff800052e65100
> ffff0000223dbd20
> (XEN)    ffff000008537004 ffffffffffffffff ffff0000080c17e4
> 5a000ea160000145
> (XEN)    0000000060000000 0000000000000000 0000000000000000
> ffff800052e65100
> (XEN)    ffff0000223dbd20 0000ffff9badb3dc 0000000000000000
> 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<0000000000246f28>] ioreq.c#hvm_free_ioreq_mfn+0x68/0x6c (PC)
> (XEN)    [<0000000000246ef0>] ioreq.c#hvm_free_ioreq_mfn+0x30/0x6c (LR)
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 3:
> (XEN) Xen BUG at ...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) PSCI cpu off failed for CPU0 err=-3
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
>
>
>
> Either I did something wrong (most likely) or there is an issue with
> page ref-counting in the IOREQ code. I am still trying to understand
> what is going on.
> Some notes on that:
> 1. I checked that put_page() was called for these pages in
> p2m_put_l3_page() when destroying domain. This happened before
> hvm_free_ioreq_mfn() execution.
> 2. There was no BUG detected if I passed "p2m_ram_rw" instead of
> "p2m_map_foreign_rw" in guest_physmap_add_entry(), but the DomU couldn't
> be fully destroyed because of the reference taken.
>

I think I understand why BUG is triggered.

I checked "page->count_info & PGC_count_mask" and noticed
that get_page_from_gfn() doesn't seem to increase ref counter (but it
should?)

1. hvm_alloc_ioreq_mfn() -> ref 2
2. set_foreign_p2m_entry() -> ref still 2
3. p2m_put_l3_page() -> ref 1
4. hvm_free_ioreq_mfn() calls put_page_alloc_ref() with ref 1 which
triggers BUG


-- 
Regards,

Oleksandr Tyshchenko

--000000000000d80d6305acc84eb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hi=C2=A0</div><div dir=3D"=
ltr"><br></div><div dir=3D"ltr">Sorry for the possible format issue.<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Aug 13, 2020 at 9:42 PM Oleksandr &lt;<a href=3D"mailto:olekstysh@gmai=
l.com" target=3D"_blank">olekstysh@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><br>
On 11.08.20 20:50, Julien Grall wrote:<br>
<br>
Hi Julien<br>
<br>
&gt;<br>
&gt;<br>
&gt; On 11/08/2020 18:09, Oleksandr wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 05.08.20 12:32, Julien Grall wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Julien, Stefano<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/xen/include/asm-arm/p2m.h b/xen/include/a=
sm-arm/p2m.h<br>
&gt;&gt;&gt;&gt;&gt; index 5fdb6e8..5823f11 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/xen/include/asm-arm/p2m.h<br>
&gt;&gt;&gt;&gt;&gt; +++ b/xen/include/asm-arm/p2m.h<br>
&gt;&gt;&gt;&gt;&gt; @@ -385,10 +385,11 @@ static inline int <br>
&gt;&gt;&gt;&gt;&gt; set_foreign_p2m_entry(struct domain *d, unsigned long =
gfn,<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn)<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0 {<br>
&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0 * NOTE: If this is implement=
ed then proper reference <br>
&gt;&gt;&gt;&gt;&gt; counting of<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 foreign entries will need to be implemented.<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * XXX: handle properly refer=
ence. It looks like the page may <br>
&gt;&gt;&gt;&gt;&gt; not always<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 * belong to d.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Just as a reference, and without taking away anything from=
 the <br>
&gt;&gt;&gt;&gt; comment,<br>
&gt;&gt;&gt;&gt; I think that QEMU is doing its own internal reference coun=
ting for <br>
&gt;&gt;&gt;&gt; these<br>
&gt;&gt;&gt;&gt; mappings.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am not sure how this matters here? We can&#39;t really trust=
 the DM to <br>
&gt;&gt;&gt; do the right thing if it is not running in dom0.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; But, IIRC, the problem is some of the pages doesn&#39;t belong=
 to do a <br>
&gt;&gt;&gt; domain, so it is not possible to treat them as foreign mapping=
 (e.g. <br>
&gt;&gt;&gt; you wouldn&#39;t be able to grab a reference). This investigat=
ion was <br>
&gt;&gt;&gt; done a couple of years ago, so this may have changed in recent=
 Xen.<br>
&gt;&gt;<br>
&gt;&gt; Well, emulator is going to be used in driver domain, so this TODO =
<br>
&gt;&gt; must be resolved. I suspect that the check for a hardware domain i=
n <br>
&gt;&gt; acquire_resource() which I skipped in a hackish way [1] could be <=
br>
&gt;&gt; simply removed once proper reference counting is implemented in Xe=
n, <br>
&gt;&gt; correct?<br>
&gt;<br>
&gt; It depends how you are going to solve it. If you manage to solve it in=
 <br>
&gt; a generic way, then yes you could resolve. If not (i.e. it is solved <=
br>
&gt; in an arch-specific way), we would need to keep the check on arch that=
 <br>
&gt; are not able to deal with it. See more below.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Could you please provide some pointers on that problem? Maybe some=
 <br>
&gt;&gt; questions need to be investigated again? Unfortunately, it is not =
<br>
&gt;&gt; completely clear to me the direction to follow...<br>
&gt;&gt;<br>
&gt;&gt; ***<br>
&gt;&gt; I am wondering whether the similar problem exists on x86 as well?<=
br>
&gt;<br>
&gt; It is somewhat different. On Arm, we are able to handle properly <br>
&gt; foreign mapping (i.e. mapping page from a another domain) as we would =
<br>
&gt; grab a reference on the page (see XENMAPSPACE_gmfn_foreign handling in=
 <br>
&gt; xenmem_add_to_physmap()). The reference will then be released when the=
 <br>
&gt; entry is removed from the P2M (see p2m_free_entry()).<br>
&gt;<br>
&gt; If all the pages given to set_foreign_p2m_entry() belong to a domain, =
<br>
&gt; then you could use the same approach.<br>
&gt;<br>
&gt; However, I remember to run into some issues in some of the cases. I <b=
r>
&gt; had a quick looked at the caller and I wasn&#39;t able to find any use=
 <br>
&gt; cases that may be an issue.<br>
&gt;<br>
&gt; The refcounting in the IOREQ code has changed after XSA-276 (this was =
<br>
&gt; found while working on the Arm port). Probably the best way to figure =
<br>
&gt; out if it works would be to try it and see if it fails.<br>
&gt;<br>
&gt; Note that set_foreign_p2m_entry() doesn&#39;t have a parameter for the=
 <br>
&gt; foreign domain. You would need to add a extra parameter for this.<br>
&gt;<br>
&gt;&gt; The FIXME tag (before checking for a hardware domain in <br>
&gt;&gt; acquire_resource()) in the common code makes me think it is a comm=
on <br>
&gt;&gt; issue. From other side x86&#39;s<br>
&gt;&gt; implementation of set_foreign_p2m_entry() is exists unlike Arm&#39=
;s one <br>
&gt;&gt; (which returned -EOPNOTSUPP so far). Or these are unrelated?<br>
&gt;<br>
&gt; At the moment, x86 doesn&#39;t support refcounting for foreign mapping=
. <br>
&gt; Hence the reason to restrict them to the hardware domain.<br>
<br>
<br>
Thank you for the pointers!<br>
<br>
<br>
I checked that all pages given to set_foreign_p2m_entry() belonged to a <br=
>
domain (at least in my use-case). I noticed two calls for acquiring <br>
resource at the DomU creation time, the first call was for grant table <br>
(single gfn)<br>
and the second for ioreq server which carried 2 gfns (for shared and <br>
buffered rings I assume). For the test purpose, I passed these gfns to <br>
get_page_from_gfn() in order to grab references on the pages, after that <b=
r>
I tried to destroy DomU without calling put_page() for these pages. The <br=
>
fact that I couldn&#39;t destroy DomU completely (a zombie domain was <br>
observed) made me think that references were still taken, so worked as <br>
expected.<br>
<br>
<br>
I implemented a test patch (which uses approach from <br>
xenmem_add_to_physmap_one() for XENMAPSPACE_gmfn_foreign case) to check <br=
>
whether it would work.<br>
<br>
<br>
---<br>
=C2=A0=C2=A0xen/arch/arm/p2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
30 ++++++++++++++++++++++++++++++<br>
=C2=A0=C2=A0xen/common/memory.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 +-<br>
=C2=A0=C2=A0xen/include/asm-arm/p2m.h | 12 ++----------<br>
=C2=A0=C2=A03 files changed, 33 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c<br>
index e9ccba8..7359715 100644<br>
--- a/xen/arch/arm/p2m.c<br>
+++ b/xen/arch/arm/p2m.c<br>
@@ -1385,6 +1385,36 @@ int guest_physmap_remove_page(struct domain *d, <br>
gfn_t gfn, mfn_t mfn,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return p2m_remove_mapping(d, gfn, (1 &lt;&lt=
; page_order), mfn);<br>
=C2=A0=C2=A0}<br>
<br>
+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned long gfn, mfn_t mfn)<br>
+{<br>
+=C2=A0=C2=A0=C2=A0 struct page_info *page;<br>
+=C2=A0=C2=A0=C2=A0 p2m_type_t p2mt;<br>
+=C2=A0=C2=A0=C2=A0 int rc;<br>
+<br>
+=C2=A0=C2=A0=C2=A0 /*<br>
+=C2=A0=C2=A0=C2=A0=C2=A0 * Take reference to the foreign domain page. Refe=
rence will be <br>
released<br>
+=C2=A0=C2=A0=C2=A0=C2=A0 * in p2m_put_l3_page().<br>
+=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
+=C2=A0=C2=A0=C2=A0 page =3D get_page_from_gfn(fd, gfn, &amp;p2mt, P2M_ALLO=
C);<br>
+=C2=A0=C2=A0=C2=A0 if ( !page )<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;<br>
+<br>
+=C2=A0=C2=A0=C2=A0 if ( p2m_is_ram(p2mt) )<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p2mt =3D (p2mt =3D=3D p2m_ram_r=
w) ? p2m_map_foreign_rw : <br>
p2m_map_foreign_ro;<br>
+=C2=A0=C2=A0=C2=A0 else<br>
+=C2=A0=C2=A0=C2=A0 {<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_page(page);<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;<br>
+=C2=A0=C2=A0=C2=A0 }<br>
+<br>
+=C2=A0=C2=A0=C2=A0 rc =3D guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2=
mt);<br>
+=C2=A0=C2=A0=C2=A0 if ( rc )<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_page(page);<br>
+<br>
+=C2=A0=C2=A0=C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0=C2=A0static struct page_info *p2m_allocate_root(void)<br>
=C2=A0=C2=A0{<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page_info *page;<br>
diff --git a/xen/common/memory.c b/xen/common/memory.c<br>
index 8d9f0a8..1de1d4f 100644<br>
--- a/xen/common/memory.c<br>
+++ b/xen/common/memory.c<br>
@@ -1171,7 +1171,7 @@ static int acquire_resource(<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ( i =3D 0; !rc &=
amp;&amp; i &lt; xmar.nr_frames; i++ )<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D =
set_foreign_p2m_entry(currd, gfn_list[i],<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D =
set_foreign_p2m_entry(currd, d, gfn_list[i],<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 _mfn(mfn_list[i]));<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* rc should be -EIO for any iteration other than the first */<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( rc &amp;&amp; i )<br>
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h<br>
index 5823f11..53ce373 100644<br>
--- a/xen/include/asm-arm/p2m.h<br>
+++ b/xen/include/asm-arm/p2m.h<br>
@@ -381,16 +381,8 @@ static inline gfn_t gfn_next_boundary(gfn_t gfn, <br>
unsigned int order)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gfn_add(gfn, 1UL &lt;&lt; order);<br>
=C2=A0=C2=A0}<br>
<br>
-static inline int set_foreign_p2m_entry(struct domain *d, unsigned long <b=
r>
gfn,<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mfn_t mfn)<br>
-{<br>
-=C2=A0=C2=A0=C2=A0 /*<br>
-=C2=A0=C2=A0=C2=A0=C2=A0 * XXX: handle properly reference. It looks like t=
he page may not <br>
always<br>
-=C2=A0=C2=A0=C2=A0=C2=A0 * belong to d.<br>
-=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
-<br>
-=C2=A0=C2=A0=C2=A0 return guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2=
m_ram_rw);<br>
-}<br>
+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned long gfn,=C2=A0 mfn_t mfn);<br>
<br>
=C2=A0=C2=A0/*<br>
=C2=A0=C2=A0 * A vCPU has cache enabled only when the MMU is enabled and da=
ta cache<br>
-- <br>
2.7.4<br>
<br>
<br>
And with that patch applied I was facing a BUG when destroying/rebooting <b=
r>
DomU. The call of put_page_alloc_ref() in hvm_free_ioreq_mfn() triggered <b=
r>
that BUG:<br>
<br>
<br>
Rebooting domain 2<br>
root@generic-armv8-xt-dom0:~# (XEN) Xen BUG at <br>
...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683<br>
(XEN) ----[ Xen-4.14.0=C2=A0 arm64=C2=A0 debug=3Dy=C2=A0=C2=A0 Not tainted =
]----<br>
(XEN) CPU:=C2=A0=C2=A0=C2=A0 3<br>
(XEN) PC:=C2=A0=C2=A0=C2=A0=C2=A0 0000000000246f28 ioreq.c#hvm_free_ioreq_m=
fn+0x68/0x6c<br>
(XEN) LR:=C2=A0=C2=A0=C2=A0=C2=A0 0000000000246ef0<br>
(XEN) SP:=C2=A0=C2=A0=C2=A0=C2=A0 0000800725eafd80<br>
(XEN) CPSR:=C2=A0=C2=A0 60000249 MODE:64-bit EL2h (Hypervisor, handler)<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X0: 0000000000000001=C2=A0 X1: 403fffff=
ffffffff=C2=A0 X2: 000000000000001f<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X3: 0000000080000000=C2=A0 X4: 00000000=
00000000=C2=A0 X5: 0000000000400000<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X6: 0000800725eafe24=C2=A0 X7: 0000ffff=
d1ef3e08=C2=A0 X8: 0000000000000020<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X9: 0000000000000000 X10: 00e800008eceb=
f53 X11: 0400000000000000<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X12: ffff7e00013b3ac0 X13: 0000000000000002 X=
14: 0000000000000001<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X15: 0000000000000001 X16: 0000000000000029 X=
17: 0000ffff9badb3d0<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X18: 000000000000010f X19: 0000000810e60e38 X=
20: 0000800725e68ec0<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X21: 0000000000000000 X22: 00008004dc0404a0 X=
23: 000000005a000ea1<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X24: ffff8000460ec280 X25: 0000000000000124 X=
26: 000000000000001d<br>
(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X27: ffff000008ad1000 X28: ffff800052e65100=
=C2=A0 FP: ffff0000223dbd20<br>
(XEN)<br>
(XEN)=C2=A0=C2=A0 VTCR_EL2: 80023558<br>
(XEN)=C2=A0 VTTBR_EL2: 0002000765f04000<br>
(XEN)<br>
(XEN)=C2=A0 SCTLR_EL2: 30cd183d<br>
(XEN)=C2=A0=C2=A0=C2=A0 HCR_EL2: 000000008078663f<br>
(XEN)=C2=A0 TTBR0_EL2: 00000000781c5000<br>
(XEN)<br>
(XEN)=C2=A0=C2=A0=C2=A0 ESR_EL2: f2000001<br>
(XEN)=C2=A0 HPFAR_EL2: 0000000000030010<br>
(XEN)=C2=A0=C2=A0=C2=A0 FAR_EL2: ffff000008005f00<br>
(XEN)<br>
(XEN) Xen stack trace from sp=3D0000800725eafd80:<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000800725e68ec0 0000000000247078 00008004dc040000 =
00000000002477c8<br>
(XEN)=C2=A0=C2=A0=C2=A0 ffffffffffffffea 0000000000000001 ffff8000460ec500 =
0000000000000002<br>
(XEN)=C2=A0=C2=A0=C2=A0 000000000024645c 00000000002462dc 0000800725eafeb0 =
0000800725eafeb0<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000800725eaff30 0000000060000145 000000000027882c =
0000800725eafeb0<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000800725eafeb0 01ff00000935de80 00008004dc040000 =
0000000000000006<br>
(XEN)=C2=A0=C2=A0=C2=A0 ffff800000000000 0000000000000002 000000005a000ea1 =
000000019bc60002<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000ffffd1ef3e08 0000000000000020 0000000000000004 =
000000000027c7d8<br>
(XEN)=C2=A0=C2=A0=C2=A0 000000005a000ea1 0000800725eafeb0 000000005a000ea1 =
0000000000279f98<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 ffff8000460ec200 0000800725eaffb8 =
0000000000262c58<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000000000262c4c 07e0000160000249 0000000000000002 =
0000000000000001<br>
(XEN)=C2=A0=C2=A0=C2=A0 ffff8000460ec500 ffff8000460ec508 ffff8000460ec208 =
ffff800052e65100<br>
(XEN)=C2=A0=C2=A0=C2=A0 000000005060b478 0000ffffd20f3000 ffff7e00013c77e0 =
0000000000000000<br>
(XEN)=C2=A0=C2=A0=C2=A0 00e800008ecebf53 0400000000000000 ffff7e00013b3ac0 =
0000000000000002<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000000000000001 0000000000000001 0000000000000029 =
0000ffff9badb3d0<br>
(XEN)=C2=A0=C2=A0=C2=A0 000000000000010f ffff8000460ec210 ffff8000460ec200 =
ffff8000460ec210<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000000000000001 ffff8000460ec500 ffff8000460ec280 =
0000000000000124<br>
(XEN)=C2=A0=C2=A0=C2=A0 000000000000001d ffff000008ad1000 ffff800052e65100 =
ffff0000223dbd20<br>
(XEN)=C2=A0=C2=A0=C2=A0 ffff000008537004 ffffffffffffffff ffff0000080c17e4 =
5a000ea160000145<br>
(XEN)=C2=A0=C2=A0=C2=A0 0000000060000000 0000000000000000 0000000000000000 =
ffff800052e65100<br>
(XEN)=C2=A0=C2=A0=C2=A0 ffff0000223dbd20 0000ffff9badb3dc 0000000000000000 =
0000000000000000<br>
(XEN) Xen call trace:<br>
(XEN)=C2=A0=C2=A0=C2=A0 [&lt;0000000000246f28&gt;] ioreq.c#hvm_free_ioreq_m=
fn+0x68/0x6c (PC)<br>
(XEN)=C2=A0=C2=A0=C2=A0 [&lt;0000000000246ef0&gt;] ioreq.c#hvm_free_ioreq_m=
fn+0x30/0x6c (LR)<br>
(XEN)<br>
(XEN)<br>
(XEN) ****************************************<br>
(XEN) Panic on CPU 3:<br>
(XEN) Xen BUG at ...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683<br>
(XEN) ****************************************<br>
(XEN)<br>
(XEN) Reboot in five seconds...<br>
(XEN)<br>
(XEN) ****************************************<br>
(XEN) Panic on CPU 0:<br>
(XEN) PSCI cpu off failed for CPU0 err=3D-3<br>
(XEN) ****************************************<br>
(XEN)<br>
(XEN) Reboot in five seconds...<br>
<br>
<br>
<br>
Either I did something wrong (most likely) or there is an issue with <br>
page ref-counting in the IOREQ code. I am still trying to understand <br>
what is going on.<br>
Some notes on that:<br>
1. I checked that put_page() was called for these pages in <br>
p2m_put_l3_page() when destroying domain. This happened before <br>
hvm_free_ioreq_mfn() execution.<br>
2. There was no BUG detected if I passed &quot;p2m_ram_rw&quot; instead of =
<br>
&quot;p2m_map_foreign_rw&quot; in guest_physmap_add_entry(), but the DomU c=
ouldn&#39;t <br>
be fully destroyed because of the reference taken.<br></blockquote><div><br=
></div><div>I think I understand why BUG is triggered.=C2=A0</div><div><br>=
</div><div>I checked &quot;page-&gt;count_info &amp; PGC_count_mask&quot; a=
nd noticed that=C2=A0get_page_from_gfn() doesn&#39;t seem to increase ref c=
ounter (but it should?)</div><div><br></div><div>1. hvm_alloc_ioreq_mfn() -=
&gt; ref 2<br></div><div>2.=C2=A0set_foreign_p2m_entry() -&gt;=C2=A0ref sti=
ll 2</div><div>3.=C2=A0p2m_put_l3_page() -&gt; ref 1</div><div>4.=C2=A0hvm_=
free_ioreq_mfn() calls put_page_alloc_ref() with ref 1 which triggers BUG</=
div><div><br></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"background=
-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"color:rgb(51,51,51=
);font-family:Arial,sans-serif">Regards,</span></font></span></div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"background-color:rg=
b(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font></span></div></=
div></div></div></div></div></div></div>

--000000000000d80d6305acc84eb6--

