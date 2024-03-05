Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B15872322
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 16:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688855.1073541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhX3v-000349-Vq; Tue, 05 Mar 2024 15:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688855.1073541; Tue, 05 Mar 2024 15:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhX3v-00030z-SY; Tue, 05 Mar 2024 15:50:39 +0000
Received: by outflank-mailman (input) for mailman id 688855;
 Tue, 05 Mar 2024 15:50:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXiD=KL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhX3t-00030t-MO
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 15:50:37 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aec3b98-db08-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 16:50:36 +0100 (CET)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5a16e549113so68593eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 07:50:36 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 pf10-20020a056214498a00b0068f914ac80bsm6380202qvb.50.2024.03.05.07.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 07:50:34 -0800 (PST)
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
X-Inumbo-ID: 1aec3b98-db08-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709653835; x=1710258635; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSwqEeyJX27O1JLT5yCpxeLX8dCP1IAM2t3/nC3O9uc=;
        b=sbkYPhC1K0whr5cN1kjC9iQQYp0aIOJ4M9qXu2Y+bnEPqL2/nWWbKCHVfArHMLUIgj
         fl8jk6JpQEDyjMlTZV0Skj+q7xfTLKQpYBaasSLojOSIsRRVrKd/MbEQ5vP7MmXYEIP3
         bZn97Cgf5UZ06Rx252vxu2bk407rF2qq29o+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709653835; x=1710258635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSwqEeyJX27O1JLT5yCpxeLX8dCP1IAM2t3/nC3O9uc=;
        b=lVy1HsQn7HX+vdRHmfA6VfH6N/yxEnik5TrYT0JckBtxVT+0P4+QOIhZ8xRFIj9GTv
         6jkHy8nTCo/oXdua2cma8max7Ler40gF8t21bsIxK/C1fRS80pxiKEWF+1raXGYmzT7H
         7WoYDFHM1LNekY9fbA0SHgxVBWOW79PUZldwMuob209kqbpOj1sM3TpF6fY312S848uT
         nZRRO6S3Wq6R56KMPNljWxJlpmaODE95XRvLKIC9eKpcB7BT1rHTGzGLPIRxmksiYrtb
         fqH3Dx/ZB1oZW1Wo3EANxLhoyeCIH++aVPC8tthRAog/1mXa/IDYLKRs0P5kJNYeD+lr
         MVXg==
X-Gm-Message-State: AOJu0YxDSQNNaQ5ZnGoRP8F1wtX/JEfRdzaSKFjhd6O1QQ+Amw+C5eG9
	7ktc5UEfNR9oIInNFdkeSkvWSmH7M3jfzWtO0yj7ImbyRFnhLhkAa0UVRWOPcnA=
X-Google-Smtp-Source: AGHT+IE/IMcuOiiWALJVnleoLZ9uK203bZmDz0H+yNwVrrrVSNk44jf3q+brmAGBQFsabIchMvDbPw==
X-Received: by 2002:a05:6358:7587:b0:17b:f880:a3c1 with SMTP id x7-20020a056358758700b0017bf880a3c1mr2489415rwf.17.1709653834543;
        Tue, 05 Mar 2024 07:50:34 -0800 (PST)
Date: Tue, 5 Mar 2024 16:50:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	linux-kernel@vger.kernel.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC] x86/xen: attempt to inflate the memory balloon on PVH
Message-ID: <Zec_SGeM5bF3DPgj@macbook>
References: <20240220174341.56131-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2402221701190.754277@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2402221701190.754277@ubuntu-linux-20-04-desktop>

On Thu, Feb 22, 2024 at 05:16:09PM -0800, Stefano Stabellini wrote:
> On Tue, 20 Feb 2024, Roger Pau Monne wrote:
> > When running as PVH or HVM Linux will use holes in the memory map as scratch
> > space to map grants, foreign domain pages and possibly miscellaneous other
> > stuff.  However the usage of such memory map holes for Xen purposes can be
> > problematic.  The request of holesby Xen happen quite early in the kernel boot
> > process (grant table setup already uses scratch map space), and it's possible
> > that by then not all devices have reclaimed their MMIO space.  It's not
> > unlikely for chunks of Xen scratch map space to end up using PCI bridge MMIO
> > window memory, which (as expected) causes quite a lot of issues in the system.
> 
> Am I understanding correctly that XEN_BALLOON_MEMORY_HOTPLUG doesn't
> help because it becomes available too late in the PVH boot sequence? 

No, not really, the hoptplug mechanism is available as early as the
balloon driver requires, the issue is that when Linux starts making
use of such unpopulated ranges (for example in order to map the shared
info page) many drivers have not yet reserved their MMIO regions, and so it's
not uncommon for the balloon driver to end up using address ranges that
would otherwise be used by device BARs for example.

This causes havoc, Linux starts to reposition device BARs, sometimes
it can manage to re-position them, otherwise some devices are not
usable.

> > At least for PVH dom0 we have the possibility of using regions marked as
> > UNUSABLE in the e820 memory map.  Either if the region is UNUSABLE in the
> > native memory map, or it has been converted into UNUSABLE in order to hide RAM
> > regions from dom0, the second stage translation page-tables can populate those
> > areas without issues.
> > 
> > PV already has this kind of logic, where the balloon driver is inflated at
> > boot.  Re-use the current logic in order to also inflate it when running as
> > PVH.  onvert UNUSABLE regions up to the ratio specified in EXTRA_MEM_RATIO to
> > RAM, while reserving them using xen_add_extra_mem() (which is also moved so
> > it's no longer tied to CONFIG_PV).
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > RFC reasons:
> > 
> >  * Note that it would be preferred for the hypervisor to provide an explicit
> >    range to be used as scratch mapping space, but that requires changes to Xen,
> >    and it's not fully clear whether Xen can figure out the position of all MMIO
> >    regions at boot in order to suggest a scratch mapping region for dom0.
> > 
> >  * Should the whole set of xen_{add,del,chk,inv}_extra_mem() functions be moved
> >    to a different file?  For the purposes of PVH only xen_add_extra_mem() is
> >    moved and the chk and inv ones are PV specific and might not want moving to
> >    a separate file just to guard them with CONFIG_PV.
> > ---
> >  arch/x86/include/asm/xen/hypervisor.h |  1 +
> >  arch/x86/platform/pvh/enlighten.c     |  3 ++
> >  arch/x86/xen/enlighten.c              | 32 +++++++++++++
> >  arch/x86/xen/enlighten_pvh.c          | 68 +++++++++++++++++++++++++++
> >  arch/x86/xen/setup.c                  | 44 -----------------
> >  arch/x86/xen/xen-ops.h                | 14 ++++++
> >  drivers/xen/balloon.c                 |  2 -
> >  7 files changed, 118 insertions(+), 46 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
> > index a9088250770f..31e2bf8d5db7 100644
> > --- a/arch/x86/include/asm/xen/hypervisor.h
> > +++ b/arch/x86/include/asm/xen/hypervisor.h
> > @@ -62,6 +62,7 @@ void xen_arch_unregister_cpu(int num);
> >  #ifdef CONFIG_PVH
> >  void __init xen_pvh_init(struct boot_params *boot_params);
> >  void __init mem_map_via_hcall(struct boot_params *boot_params_p);
> > +void __init xen_reserve_extra_memory(struct boot_params *bootp);
> >  #endif
> >  
> >  /* Lazy mode for batching updates / context switch */
> > diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
> > index 00a92cb2c814..a12117f3d4de 100644
> > --- a/arch/x86/platform/pvh/enlighten.c
> > +++ b/arch/x86/platform/pvh/enlighten.c
> > @@ -74,6 +74,9 @@ static void __init init_pvh_bootparams(bool xen_guest)
> >  	} else
> >  		xen_raw_printk("Warning: Can fit ISA range into e820\n");
> >  
> > +	if (xen_guest)
> > +		xen_reserve_extra_memory(&pvh_bootparams);
> > +
> >  	pvh_bootparams.hdr.cmd_line_ptr =
> >  		pvh_start_info.cmdline_paddr;
> >  
> > diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
> > index 3c61bb98c10e..a01ca255b0c6 100644
> > --- a/arch/x86/xen/enlighten.c
> > +++ b/arch/x86/xen/enlighten.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/console.h>
> >  #include <linux/cpu.h>
> >  #include <linux/kexec.h>
> > +#include <linux/memblock.h>
> >  #include <linux/slab.h>
> >  #include <linux/panic_notifier.h>
> >  
> > @@ -350,3 +351,34 @@ void xen_arch_unregister_cpu(int num)
> >  }
> >  EXPORT_SYMBOL(xen_arch_unregister_cpu);
> >  #endif
> > +
> > +/* Amount of extra memory space we add to the e820 ranges */
> > +struct xen_memory_region xen_extra_mem[XEN_EXTRA_MEM_MAX_REGIONS] __initdata;
> > +
> > +void __init xen_add_extra_mem(unsigned long start_pfn, unsigned long n_pfns)
> > +{
> > +	unsigned int i;
> > +
> > +	/*
> > +	 * No need to check for zero size, should happen rarely and will only
> > +	 * write a new entry regarded to be unused due to zero size.
> > +	 */
> > +	for (i = 0; i < XEN_EXTRA_MEM_MAX_REGIONS; i++) {
> > +		/* Add new region. */
> > +		if (xen_extra_mem[i].n_pfns == 0) {
> > +			xen_extra_mem[i].start_pfn = start_pfn;
> > +			xen_extra_mem[i].n_pfns = n_pfns;
> > +			break;
> > +		}
> > +		/* Append to existing region. */
> > +		if (xen_extra_mem[i].start_pfn + xen_extra_mem[i].n_pfns ==
> > +		    start_pfn) {
> > +			xen_extra_mem[i].n_pfns += n_pfns;
> > +			break;
> > +		}
> > +	}
> > +	if (i == XEN_EXTRA_MEM_MAX_REGIONS)
> > +		printk(KERN_WARNING "Warning: not enough extra memory regions\n");
> > +
> > +	memblock_reserve(PFN_PHYS(start_pfn), PFN_PHYS(n_pfns));
> > +}
> > diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
> > index ada3868c02c2..c28f073c1df5 100644
> > --- a/arch/x86/xen/enlighten_pvh.c
> > +++ b/arch/x86/xen/enlighten_pvh.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <linux/acpi.h>
> >  #include <linux/export.h>
> > +#include <linux/mm.h>
> >  
> >  #include <xen/hvc-console.h>
> >  
> > @@ -72,3 +73,70 @@ void __init mem_map_via_hcall(struct boot_params *boot_params_p)
> >  	}
> >  	boot_params_p->e820_entries = memmap.nr_entries;
> >  }
> > +
> > +/*
> > + * Reserve e820 UNUSABLE regions to inflate the memory balloon.
> > + *
> > + * On PVH dom0 the host memory map is used, RAM regions available to dom0 are
> > + * located as the same place as in the native memory map, but since dom0 gets
> > + * less memory than the total amount of host RAM the ranges that can't be
> > + * populated are converted from RAM -> UNUSABLE.  Use such regions (up to the
> > + * ratio signaled in EXTRA_MEM_RATIO) in order to inflate the balloon driver at
> > + * boot.  Doing so prevents the guest (even if just temporary) from using holes
> > + * in the memory map in order to map grants or foreign addresses, and
> > + * hopefully limits the risk of a clash with a device MMIO region.  Ideally the
> > + * hypervisor should notify us which memory ranges are suitable for creating
> > + * foreign mappings, but that's not yet implemented.
> > + */
> > +void __init xen_reserve_extra_memory(struct boot_params *bootp)
> > +{
> > +	unsigned int i, ram_pages = 0, extra_pages;
> > +
> > +	for (i = 0; i < bootp->e820_entries; i++) {
> > +		struct boot_e820_entry *e = &bootp->e820_table[i];
> > +
> > +		if (e->type != E820_TYPE_RAM)
> > +			continue;
> > +		ram_pages += PFN_DOWN(e->addr + e->size) - PFN_UP(e->addr);
> > +	}
> > +
> > +	/* Max amount of extra memory. */
> > +	extra_pages = EXTRA_MEM_RATIO * ram_pages;
> > +
> > +	/*
> > +	 * Convert UNUSABLE ranges to RAM and reserve them for foreign mapping
> > +	 * purposes.
> > +	 */
> > +	for (i = 0; i < bootp->e820_entries && extra_pages; i++) {
> > +		struct boot_e820_entry *e = &bootp->e820_table[i];
> > +		unsigned long pages;
> > +
> > +		if (e->type != E820_TYPE_UNUSABLE)
> > +			continue;
> > +
> > +		pages = min(extra_pages,
> > +			PFN_DOWN(e->addr + e->size) - PFN_UP(e->addr));
> > +
> > +		if (pages != (PFN_DOWN(e->addr + e->size) - PFN_UP(e->addr))) {
> > +			struct boot_e820_entry *next;
> > +
> > +			if (bootp->e820_entries ==
> > +			    ARRAY_SIZE(bootp->e820_table))
> > +				/* No space left to split - skip region. */
> > +				continue;
> > +
> > +			/* Split entry. */
> > +			next = e + 1;
> > +			memmove(next, e,
> > +				(bootp->e820_entries - i) * sizeof(*e));
> > +			bootp->e820_entries++;
> > +			next->addr = PAGE_ALIGN(e->addr) + PFN_PHYS(pages);
> > +			e->size = next->addr - e->addr;
> > +			next->size -= e->size;
> 
> Is this really worth doing? Can we just skip this range and continue or
> simply break out and call it a day? Or even add the whole range instead?
> 
> The reason I am asking is that I am expecting E820_TYPE_UNUSABLE regions
> not to be huge. Splitting one just to cover the few remaining pages out
> of extra_pages doesn't seem worth it?

No, they are usually quite huge on PVH dom0, because when building a
PVH dom0 the E820_TYPE_RAM ranges that are not made available to dom0
because of a dom0_mem option end up being reported as
E820_TYPE_UNUSABLE in the e820 provided to dom0.

That's mostly the motivation of the change, to be able to reuse those
ranges as scratch space for foreign mappings.

Ideally the hypervisor should somehow report suitable ranges in the
address space for domains to create foreign mappings, but this does
require an amount of extra work I don't have time to do ATM, hence
this stopgap proposal.

> Everything else looks OK to me.

Thanks, Roger.

