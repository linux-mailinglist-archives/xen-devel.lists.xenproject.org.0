Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B825087BEF8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 15:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693303.1081221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkm9G-0006TT-QW; Thu, 14 Mar 2024 14:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693303.1081221; Thu, 14 Mar 2024 14:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkm9G-0006Rc-MR; Thu, 14 Mar 2024 14:33:34 +0000
Received: by outflank-mailman (input) for mailman id 693303;
 Thu, 14 Mar 2024 14:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P774=KU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rkm9F-0005pp-AE
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 14:33:33 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e5f14a-e20f-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 15:33:32 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-788303f317eso46697185a.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 07:33:32 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 bl32-20020a05620a1aa000b00789dfdfa12esm196775qkb.19.2024.03.14.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 07:33:30 -0700 (PDT)
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
X-Inumbo-ID: d4e5f14a-e20f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710426811; x=1711031611; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LfP4doKPQLrJtKtwWlZC1QrZ3hW6BNrPh5jy4k7/53k=;
        b=PT+kXBYfQX/sgnCb9WVO6ThYtGC3Mjhiumc0YVF9RGnDren4USq4Eil/cgLnYBPLuH
         42iQuguZ+JasFavWnNm/N+/dh9+lrkkyPXTrJWvwkysH9uZFbEg915cnafatLOQF29o0
         xlOhCub5eu1a0XeyyVkTauNZtFwtk27WMSRoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426811; x=1711031611;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfP4doKPQLrJtKtwWlZC1QrZ3hW6BNrPh5jy4k7/53k=;
        b=l1R4P/ZnVWWU0XXFB94//3ciFsl/Cx2cIVrivgz//HXCwQCMA/uR3E7bKPMo9KCKKR
         xvq59nmiOXaZGh8S5RInf0FoCqCSD+2Tnm8k8yKiRdIgGvfM/rEvaj3lIGDQeNLCt45T
         MTd48bJM/G1dk/aY+n+ud5HNjh0bnT/+7yl44lDbmosn3b2w+CkzKz7LhF7+l34n7kj3
         81jNbthWvwCDODivkrbLK5IauOlRR/566U7uTna7RdF4rHsv9jJegbKPy6vG0wLzOnZE
         n3p0m0fD/zzNGmoQ9NO4RBAwLH6PYcAIje1EiEUf67tEkcx3/crIAUIn2Vb/GpiC5b0+
         l69Q==
X-Gm-Message-State: AOJu0YxYlULm+qVXsnBjh2pBVXDwOqx32Y5ncoHQeyHnbJ0cyhspju0q
	yqg8VPIbxI9fB/V2MVs8hJULVIYlEnw1SQgqR+Ude1OtdAby9jTzdekthk98FmA=
X-Google-Smtp-Source: AGHT+IEVRBu34ffizHVWtACX8Y9ZLlw2RDlsw+3BR5Hv3IxkrMN1tEYum0iJUKC98yyC5bjGRkN/Gw==
X-Received: by 2002:a05:620a:3905:b0:789:d306:879a with SMTP id qr5-20020a05620a390500b00789d306879amr2439220qkn.7.1710426811307;
        Thu, 14 Mar 2024 07:33:31 -0700 (PDT)
Date: Thu, 14 Mar 2024 15:33:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Message-ID: <ZfMKuUqopaj-Gubu@macbook>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <ZfLIBHTbcbGqFAhY@macbook>
 <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com>

On Thu, Mar 14, 2024 at 09:51:22AM -0400, Jason Andryuk wrote:
> On 2024-03-14 05:48, Roger Pau Monné wrote:
> > On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
> > > Xen tries to load a PVH dom0 kernel at the fixed guest physical address
> > > from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
> > > it can be configured.
> > > 
> > > Unfortunately there exist firmwares that have reserved regions at this
> > > address, so Xen fails to load the dom0 kernel since it's not RAM.
> > > 
> > > The PVH entry code is not relocatable - it loads from absolute
> > > addresses, which fail when the kernel is loaded at a different address.
> > > With a suitably modified kernel, a reloctable entry point is possible.
> > > 
> > > Add XEN_ELFNOTE_PVH_RELOCATION which specifies the minimum, maximum and
> > > alignment needed for the kernel.  The presence of the NOTE indicates the
> > > kernel supports a relocatable entry path.
> > > 
> > > Change the loading to check for an acceptable load address.  If the
> > > kernel is relocatable, support finding an alternate load address.
> > > 
> > > Link: https://gitlab.com/xen-project/xen/-/issues/180
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > ---
> > > ELF Note printing looks like:
> > > (XEN) ELF: note: PVH_RELOCATION = min: 0x1000000 max: 0xffffffff align: 0x200000
> > > 
> > > v2:
> > > Use elfnote for min, max & align - use 64bit values.
> > > Print original and relocated memory addresses
> > > Use check_and_adjust_load_address() name
> > > Return relocated base instead of offset
> > > Use PAGE_ALIGN
> > > Don't load above max_phys (expected to be 4GB in kernel elf note)
> > > Use single line comments
> > > Exit check_load_address loop earlier
> > > Add __init to find_kernel_memory()
> > > ---
> > >   xen/arch/x86/hvm/dom0_build.c      | 108 +++++++++++++++++++++++++++++
> > >   xen/common/libelf/libelf-dominfo.c |  13 ++++
> > >   xen/include/public/elfnote.h       |  11 +++
> > >   xen/include/xen/libelf.h           |   3 +
> > >   4 files changed, 135 insertions(+)
> > > 
> > > diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> > > index 0ceda4140b..5c6c0d2db3 100644
> > > --- a/xen/arch/x86/hvm/dom0_build.c
> > > +++ b/xen/arch/x86/hvm/dom0_build.c
> > > @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
> > >       return INVALID_PADDR;
> > >   }
> > > +static bool __init check_load_address(
> > > +    const struct domain *d, const struct elf_binary *elf)
> > > +{
> > > +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> > 
> > Are you sure this is correct?  If a program header specifies a non-4K
> > aligned load address we should still try to honor it.  I think this is
> > very unlikely, but still we shouldn't apply non-requested alignments
> > to addresses coming from the ELF headers.
> 
> I think it's correct in terms of checking the e820 table.  Since the memory
> map is limited to 4k granularity, the bounds need to be rounded accordingly.

That's for populating the p2m, but I don't see why the kernel load
area should be limited by this?

There's AFAICt no issue from a kernel requesting that it's start load
address is not page aligned (granted that's very unlikely), but I
don't see why we would impose an unneeded restriction here.

The kernel load area doesn't affect how the p2m is populated, that's
mandated by the e820.

> > > +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
> > > +    unsigned int i;
> > > +
> > > +    /*
> > > +     * The memory map is sorted and all RAM regions starts and sizes are
> > > +     * aligned to page boundaries.
> > 
> > Relying on sizes to be page aligned seems fragile: it might work now
> > because of the order in which pvh_setup_vmx_realmode_helpers() first
> > reserves memory for the TSS and afterwards for the identity page
> > tables, but it's not a property this code should assume.
> 
> That can be removed.  It would just eliminate the early exit...
> 
> > > +     */
> > > +    for ( i = 0; i < d->arch.nr_e820; i++ )
> > > +    {
> > > +        paddr_t start = d->arch.e820[i].addr;
> > > +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> > > +
> > > +        if ( start >= kernel_end )
> > > +            return false;
> 
> ... here.

I think the sorted aspect is fine, the aligned part is the one I'm
complaining about, so the check above can stay.

> > > +    const struct elf_dom_parms *parms)
> > > +{
> > > +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> > > +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
> > > +    paddr_t kernel_size = kernel_end - kernel_start;
> > 
> > Hm, I'm again unsure about the alignments applied here.
> 
> Same as above regarding 4k granularity.
> 
> > I think if anything we want to assert that dest_base is aligned to phys_align.
> 
> That would indicate the kernel image is inconsistent.

Indeed.  I think doing that sanity check would be worth.

> > > diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
> > > index 7cc7b18a51..837a1b0f21 100644
> > > --- a/xen/common/libelf/libelf-dominfo.c
> > > +++ b/xen/common/libelf/libelf-dominfo.c
> > > @@ -125,6 +125,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
> > >           [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
> > >           [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
> > >           [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
> > > +        [XEN_ELFNOTE_PVH_RELOCATION] = { "PVH_RELOCATION", ELFNOTE_OTHER },
> > >       };
> > >   /* *INDENT-ON* */
> > > @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
> > >                   elf_note_numeric_array(elf, note, 8, 0),
> > >                   elf_note_numeric_array(elf, note, 8, 1));
> > >           break;
> > > +
> > > +    case XEN_ELFNOTE_PVH_RELOCATION:
> > > +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
> > > +            return -1;
> > > +
> > > +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
> > > +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
> > > +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
> > 
> > Size for those needs to be 4 (32bits) as the entry point is in 32bit
> > mode?  I don't see how we can start past the 4GB boundary.
> 
> I specified the note as 3x 64bit values.  It seemed simpler than trying to
> support both 32bit and 64bit depending on the kernel arch.  Also, just using
> 64bit provides room in case it is needed in the future.

Why do you say depending on the kernel arch?

PVH doesn't know the bitness of the kernel, as the kernel entry point
is always started in protected 32bit mode.  We should just support
32bit values, regardless of the kernel bitness, because that's the
only range that's suitable in order to jump into the entry point.

Note how XEN_ELFNOTE_PHYS32_ENTRY is also unconditionally a 32bit
integer.

> Do you want the note to be changed to 3x 32bit values?

Unless anyone objects, yes, that's would be my preference.

> > > +        elf_msg(elf, "min: %#"PRIx64" max: %#"PRIx64" align: %#"PRIx64"\n",
> > > +                parms->phys_min, parms->phys_max, parms->phys_align);
> > > +        break;
> > >       }
> > >       return 0;
> > >   }
> > > @@ -545,6 +557,7 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
> > >       parms->p2m_base = UNSET_ADDR;
> > >       parms->elf_paddr_offset = UNSET_ADDR;
> > >       parms->phys_entry = UNSET_ADDR32;
> > > +    parms->phys_align = UNSET_ADDR;
> > 
> > For correctness I would also init phys_{min,max}.
> 
> There is a memset() out of context above to zero the structure.  I thought
> leaving them both 0 would be fine.

0 would be a valid value, hence it's best to use UNSET_ADDR to clearly
notice when a value has been provided by the parsed binary or not.

Thanks, Roger.

