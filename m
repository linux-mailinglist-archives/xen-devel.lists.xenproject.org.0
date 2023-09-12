Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD279C333
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 04:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599881.935482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qftLQ-0004LI-3w; Tue, 12 Sep 2023 02:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599881.935482; Tue, 12 Sep 2023 02:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qftLP-0004Hy-Ub; Tue, 12 Sep 2023 02:41:39 +0000
Received: by outflank-mailman (input) for mailman id 599881;
 Tue, 12 Sep 2023 02:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DQab=E4=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qftLO-0004Hs-ID
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 02:41:38 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4492f7c-5115-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 04:41:37 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso41909495ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 19:41:36 -0700 (PDT)
Received: from leoy-huanghe (n058152048165.netvigator.com. [58.152.48.165])
 by smtp.gmail.com with ESMTPSA id
 ix13-20020a170902f80d00b001bb97e51ab4sm7218245plb.98.2023.09.11.19.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 19:41:34 -0700 (PDT)
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
X-Inumbo-ID: e4492f7c-5115-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694486495; x=1695091295; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t71AL8sVzM156fkXKGFCtmQWNUCZh0sAusIxjHA5t2o=;
        b=vjR5RKkk7W77wVszRWhhdqM0TYleGZmgq0sQbB4PqH3BcbE82yn63/8n/mBnIPDiwG
         Ulvt5tGkyxlsTd9CPINMwShTLM2Wm7ESdbNTqQNxQRcWAgjb1eqiUENmZchwZ3Z+He3Z
         tw5glL15BCiZ/uSDyFX5JuUsPdlMvyCNzRdZ0Isg9G0J7jZusjDxviblWECJskR2FOdm
         zD0W9DjK45rBesFNvrTs9m6Fwm3N4dWUW62jVegN69SuSMQYnUfi4ivrzZshDA8egTGp
         h5+xa63ROAeOV+d1CcKMClfkLcDHlr1+qAbUghKp+1oO6ireaftf7f4Ava/F9bKkRXpx
         VFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694486495; x=1695091295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t71AL8sVzM156fkXKGFCtmQWNUCZh0sAusIxjHA5t2o=;
        b=uP20AcBSqgw2n5PKe6+SAFdNYb3i1X081n3OAwU18PQfcqFTCyL5oZyyx+umo3L0Ey
         WrlJw4qWuBIO/cjo/NsQBWUcZPwC+Tb93HqQO3smEpBveGzDgOI6dWXt40RjcfEbP0Rn
         8Gyf6NxF681XcO4qve21evvuRNCToZvazCx1MABlAyIRTlQuqPZrMkBR6yHq9n6eCCc1
         eNuUXloY/GTj9McAI2P6ebEOah1se4Jwti4AUmk7C+wAv1tOjXaZwDRVCEgizQFEfpjw
         6A6dpKHa7OGnGlfK+lemZXMkTVxpnOu86eymAwGpEfV+VqPsJ1IBLUtSp8Nty/lu1wjV
         14Wg==
X-Gm-Message-State: AOJu0YyZOBAYZKgCR3yAAWDM7Ui8l5g55KGl5DmKHU6Z2r4VKNHe/FMc
	cjWO5CwSYCGZPVlgts1lk9qmw8NUpU/9xcT2W16awn70djw=
X-Google-Smtp-Source: AGHT+IHcLwjeFSzUS37LvJ1e5XJzNH1L3Ar8FvIrdUuYm4GBbngGAEJ40g8eTSDAlvbUfSzRqhQ+lA==
X-Received: by 2002:a17:903:1106:b0:1b8:b3f9:58e5 with SMTP id n6-20020a170903110600b001b8b3f958e5mr12069338plh.38.1694486495373;
        Mon, 11 Sep 2023 19:41:35 -0700 (PDT)
Date: Tue, 12 Sep 2023 10:41:27 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH RESEND v2 2/2] xen/arm: Enlarge identity map space to
 127TiB
Message-ID: <20230912024127.GB122656@leoy-huanghe>
References: <20230909083410.870726-1-leo.yan@linaro.org>
 <20230909083410.870726-3-leo.yan@linaro.org>
 <d526b697-ca64-473d-8a82-72b9052487fa@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d526b697-ca64-473d-8a82-72b9052487fa@xen.org>

Hi Julien,

On Mon, Sep 11, 2023 at 04:13:27PM +0100, Julien Grall wrote:
> Hi Leo,
> 
> I know you said you will respin the series. I'd like to leave some comments
> to avoid having another round afterwards.

Thanks!

> On 09/09/2023 09:34, Leo Yan wrote:
> > On some platforms, the memory regions could be:
> 
> Can you add some details in the commit message on which platform you saw the
> issue?

Sure, I will add it.  The issue happens on the ADLink AVA platform.

> Also, in v1, the problem was also depending on the firmware version. Do you
> know if it fails booting on a new or old firmware?

My colleague Alexey (CCed) and I both tested Xen hypervisor on own AVA
machine, Alexey produced this issue on his machine with the old
firmware, I upgraded to the new firmware so I cannot see the issue
anymore.

> >    (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
> >    (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
> >    (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
> >    (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> > 
> > In this case, the Xen binary is loaded above 2TiB.  2TiB is the maximum
> > identity map space supported by Xen, thus it fails to boot up due to the
> > out of the range.
> > 
> > This patch introduces several macros to present the zeroth page table's
> 
> Typo: s/zeroth/zeroeth/

Will fix.

> > slot numbers for easier readable.  Based on the defined macros, it
> > enlarges identity map space to 127TiB, which can support the memory
> > space [0x0 .. 0x00007eff_ffff_ffff] so has flexibility for various
> > platforms.
> 
> Reserving 127 TiB for just the identity mapping is quite a lot. How did you
> decide the limit?

When I reviewed the existed code, I found it reserves 125TiB:

  0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
    Unused

Seems to me, we can map this area.  Ideally, if we only map for the
first level's page table, we can just fill the zeroeth page and don't
need to allocate extra page tables.

> What limit do you need on your platform?

On AVA platform, we can see the memory layout is:

    DRAM memory regions:
      Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
      Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
      Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff

So the phycial memory address is splitted into the low address and the
high address.  The high memory address is above 8TiB.

> > Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
> > Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >   xen/arch/arm/arm64/mm.c           | 12 ++++++++----
> >   xen/arch/arm/include/asm/config.h | 15 ++++++++-------
> >   xen/arch/arm/mm.c                 |  2 +-
> >   3 files changed, 17 insertions(+), 12 deletions(-)
> > 
> > diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
> > index 78b7c7eb00..802170cf29 100644
> > --- a/xen/arch/arm/arm64/mm.c
> > +++ b/xen/arch/arm/arm64/mm.c
> > @@ -40,8 +40,10 @@ static void __init prepare_boot_identity_mapping(void)
> >       clear_page(boot_second_id);
> >       clear_page(boot_third_id);
> > -    if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
> > -        panic("Cannot handle ID mapping above 2TB\n");
> > +    if ( id_offsets[0] >= XEN_IDENTITY_MAP_L0_END )
> 
> I don't see the value of renaming IDENTIY_MAPPING_AREA_NR_L0 to
> XEN_IDENTIY_MAP_L0_END. See more below.

Okay.  It's fine for me to keep the naming.

> > +        /* 1TiB occupies 2 slots in zeroeth table */
> 
> I don't understand how this comment is related to the message below.
> 
> > +        panic("Cannot handle ID mapping above %dTiB\n",
> 
> The value is unsigned, so this you should use "%u". Also we have been using
> "TB" in Xen rather than "TiB". I would rather prefer if we keep the same for
> consistency even if this is not totally accurate.

Sure, will fix it.

> > +              XEN_IDENTITY_MAP_L0_END>>1);
> 
> Coding style: please add a space before and after >>.

Will fix.

> >       /* Link first ID table */
> >       pte = mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
> > @@ -73,8 +75,10 @@ static void __init prepare_runtime_identity_mapping(void)
> >       lpae_t pte;
> >       DECLARE_OFFSETS(id_offsets, id_addr);
> > -    if ( id_offsets[0] >= IDENTITY_MAPPING_AREA_NR_L0 )
> > -        panic("Cannot handle ID mapping above 2TB\n");
> > +    if ( id_offsets[0] >= XEN_IDENTITY_MAP_L0_END )
> > +        /* 1TiB occupies 2 slots in zeroeth table */
> > +        panic("Cannot handle ID mapping above %dTiB\n",
> > +              XEN_IDENTITY_MAP_L0_END>>1);
> 
> Similar remarks here.

Will do.

> >       /* Link first ID table */
> >       pte = pte_of_xenaddr((vaddr_t)xen_first_id);
> > diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> > index 21f4e68a40..b772f1574d 100644
> > --- a/xen/arch/arm/include/asm/config.h
> > +++ b/xen/arch/arm/include/asm/config.h
> > @@ -87,11 +87,11 @@
> >    *   2G -   4G   Domheap: on-demand-mapped
> >    *
> >    * ARM64 layout:
> > - * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> > + * 0x0000000000000000 - 0x00007effffffffff (127TB, L0 slots [0..253])
> >    *
> >    *  Reserved to identity map Xen
> >    *
> > - * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
> > + * 0x000007f000000000 - 0x00007fffffffffff (1TB, L0 slot [254..255])
> 
> I don't understand why this is changed.

I will keep this region size as 512GB.

A side topic is about extending the frame table, I conclude we don't
need to extend the frame table from support 2TiB to 127TiB.  The reason
is the frame table is page management structure, it doesn't
need to cover the hole in the memory layout, pfn_pdx_hole_setup() is
used to calculate the biggest hole in the memory layout and in the end
the frame table doesn't manage the hole region.

> >    *  (Relative offsets)
> >    *   0  -   2M   Unmapped
> >    *   2M -  10M   Xen text, data, bss
> > @@ -103,9 +103,6 @@
> >    *
> >    *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
> >    *
> > - * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
> > - *  Unused
> > - *
> >    * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
> >    *  1:1 mapping of RAM
> >    *
> > @@ -117,8 +114,12 @@
> >   #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> >   #else
> > -#define IDENTITY_MAPPING_AREA_NR_L0	4
> > -#define XEN_VM_MAPPING			SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
> > +#define XEN_IDENTITY_MAP_L0_START       0
> 
> So what's the value of L0_START when you don't use it in the code? Overall,
> I think it will actually mislead the developper because none of the code in
> Xen can cope with the value been non-zero.

Just clarify, I think none of the code in Xen can cope with the value
been *zero*, right?

> And FAOD, I don't think we should handle it in Xen. So I would rather prefer
> if the renaming is avoided.

Okay, in the next spin I will keep IDENTITY_MAPPING_AREA_NR_L0.

You could see I tried to use the macro XEN_VM_MAPPING to replace the open
coded 'SLOT0(4)', do you mind for this change or not?

Thank you,
Leo

> > +#define XEN_IDENTITY_MAP_L0_NUM         254
> > +#define XEN_IDENTITY_MAP_L0_END         (XEN_IDENTITY_MAP_L0_START + \
> > +                                         XEN_IDENTITY_MAP_L0_NUM)
> > +#define XEN_VM_MAP_L0_START             (XEN_IDENTITY_MAP_L0_END)
> > +#define XEN_VM_MAPPING                  SLOT0(XEN_VM_MAP_L0_START)
> >   #define SLOT0_ENTRY_BITS  39
> >   #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > index c34cc94c90..218552783e 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -156,7 +156,7 @@ static void __init __maybe_unused build_assertions(void)
> >        * with it.
> >        */
> >   #define CHECK_OVERLAP_WITH_IDMAP(virt) \
> > -    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
> > +    BUILD_BUG_ON(zeroeth_table_offset(virt) < XEN_IDENTITY_MAP_L0_END)
> >       CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
> >       CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
> 
> Cheers,
> 
> -- 
> Julien Grall

