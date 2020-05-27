Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CE1E3B20
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 10:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdqz0-0001Vm-GA; Wed, 27 May 2020 08:00:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YYzi=7J=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdqyy-0001Sl-J1
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 08:00:12 +0000
X-Inumbo-ID: 1573d188-9ff0-11ea-a70a-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1573d188-9ff0-11ea-a70a-12813bfff9fa;
 Wed, 27 May 2020 08:00:09 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 95158122804;
 Wed, 27 May 2020 10:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590566408;
 bh=6rQ6u7P+sESM3XhmLHwdlYYRer/3126WoGV8Y9T1yC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPvdAznh47EwVX3q6zIkaFezmhg2LF7L49VQRqpfaZRFhVd62/GF0m49g7ijEso9W
 BFo1ITbwLFx/53S/kuT9n+art4id2s4u7SdwfbySqQx4zOfdypQH5d+ExbNvCyyZxS
 Ti2mNZk7DVSAbPqwBGSgv6onmBKpsY1E5J8sfbPVjwq9bpcS2B7WTU4FQLEkG8fS5K
 aGew6Ork10UXDzI5jC8JL3MXVYN+0//rHT6h+lEnZ/HMcljjhrkBCSBc0eouOoKSIb
 /fyuEpLSMKYl3YcM1NMS/nr2gqlmZXrRN69EP1kn8nx+fJKl4vHZmfWHnLMRMPQbrJ
 ey7USF7Sy+buQ==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 6F852265E722; Wed, 27 May 2020 10:00:08 +0200 (CEST)
Date: Wed, 27 May 2020 10:00:08 +0200
From: Martin Lucina <martin@lucina.net>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200527080008.GC4788@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, dave@recoil.org,
 xen-devel@lists.xenproject.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
 <20200526100337.GB38408@Air-de-Roger>
 <20200526101203.GE5942@nodbug.lucina.net>
 <20200526154224.GC25283@nodbug.lucina.net>
 <20200526163021.GE38408@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526163021.GE38408@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, mirageos-devel@lists.xenproject.org,
 dave@recoil.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, 26.05.2020 at 18:30, Roger Pau Monné wrote:
> > Turns out that the .note.solo5.xen section as defined in boot.S was not
> > marked allocatable, and that was doing <something> that was confusing our
> > linker script[1] (?).
> 
> Hm, I would have said there was no need to load notes into memory, and
> hence using a MemSize of 0 would be fine.
> 
> Maybe libelf loader was somehow getting confused and not loading the
> image properly?
> 
> Can you paste the output of `xl -vvv create ...` when using the broken
> image?

Here you go:

Parsing config from ./test_hello.xl
libxl: debug: libxl_create.c:1671:do_domain_create: Domain 0:ao 0x5593c42e7e30: create: how=(nil) callback=(nil) poller=0x5593c42e7670
libxl: debug: libxl_create.c:1007:initiate_domain_create: Domain 2:running bootloader
libxl: debug: libxl_bootloader.c:335:libxl__bootloader_run: Domain 2:no bootloader configured, using user supplied kernel
libxl: debug: libxl_event.c:686:libxl__ev_xswatch_deregister: watch w=0x5593c42e9590: deregister unregistered
libxl: debug: libxl_sched.c:82:libxl__set_vcpuaffinity: Domain 2:New soft affinity for vcpu 0 has unreachable cpus
domainbuilder: detail: xc_dom_allocate: cmdline="", features=""
domainbuilder: detail: xc_dom_kernel_file: filename="test_hello.xen"
domainbuilder: detail: xc_dom_malloc_filemap    : 191 kB
domainbuilder: detail: xc_dom_boot_xen_init: ver 4.11, caps xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
domainbuilder: detail: xc_dom_parse_image: called
domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ...
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ...
domainbuilder: detail: xc_dom_probe_bzimage_kernel: kernel is not a bzImage
domainbuilder: detail: loader probe failed
domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loader ...
domainbuilder: detail: loader probe OK
xc: detail: ELF: phdr: paddr=0x100000 memsz=0x6264
xc: detail: ELF: phdr: paddr=0x107000 memsz=0xed48
xc: detail: ELF: memory: 0x100000 -> 0x115d48
xc: detail: ELF: note: PHYS32_ENTRY = 0x100020
xc: detail: ELF: Found PVH image
xc: detail: ELF: VIRT_BASE unset, using 0
xc: detail: ELF_PADDR_OFFSET unset, using 0
xc: detail: ELF: addresses:
xc: detail:     virt_base        = 0x0
xc: detail:     elf_paddr_offset = 0x0
xc: detail:     virt_offset      = 0x0
xc: detail:     virt_kstart      = 0x100000
xc: detail:     virt_kend        = 0x115d48
xc: detail:     virt_entry       = 0x1001e0
xc: detail:     p2m_base         = 0xffffffffffffffff
domainbuilder: detail: xc_dom_parse_elf_kernel: hvm-3.0-x86_32: 0x100000 -> 0x115d48
domainbuilder: detail: xc_dom_mem_init: mem 256 MB, pages 0x10000 pages, 4k each
domainbuilder: detail: xc_dom_mem_init: 0x10000 pages
domainbuilder: detail: xc_dom_boot_mem_init: called
domainbuilder: detail: range: start=0x0 end=0x10000400
domainbuilder: detail: xc_dom_malloc            : 512 kB
xc: detail: PHYSICAL MEMORY ALLOCATION:
xc: detail:   4KB PAGES: 0x0000000000000c00
xc: detail:   2MB PAGES: 0x000000000000007a
xc: detail:   1GB PAGES: 0x0000000000000000
domainbuilder: detail: xc_dom_build_image: called
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x100+0x16 at 0x7f5609445000
domainbuilder: detail: xc_dom_alloc_segment:   kernel       : 0x100000 -> 0x116000  (pfn 0x100 + 0x16 pages)
xc: detail: ELF: phdr 1 at 0x7f5609445000 -> 0x7f560944b264
xc: detail: ELF: phdr 2 at 0x7f560944c000 -> 0x7f5609453120
domainbuilder: detail: xc_dom_load_acpi: 64 bytes at address fc008000
domainbuilder: detail: xc_dom_load_acpi: 4096 bytes at address fc000000
domainbuilder: detail: xc_dom_load_acpi: 28672 bytes at address fc001000
domainbuilder: detail: xc_dom_pfn_to_ptr_retcount: domU mapping: pfn 0x116+0x1 at 0x7f5609ace000
domainbuilder: detail: xc_dom_alloc_segment:   HVM start info : 0x116000 -> 0x117000  (pfn 0x116 + 0x1 pages)
domainbuilder: detail: alloc_pgtables_hvm: doing nothing
domainbuilder: detail: xc_dom_build_image  : virt_alloc_end : 0x117000
domainbuilder: detail: xc_dom_build_image  : virt_pgtab_end : 0x0
domainbuilder: detail: xc_dom_boot_image: called
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_64
domainbuilder: detail: xc_dom_compat_check: supported guest type: xen-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32 <= matches
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_32p
domainbuilder: detail: xc_dom_compat_check: supported guest type: hvm-3.0-x86_64
domainbuilder: detail: domain builder memory footprint
domainbuilder: detail:    allocated
domainbuilder: detail:       malloc             : 515 kB
domainbuilder: detail:       anon mmap          : 0 bytes
domainbuilder: detail:    mapped
domainbuilder: detail:       file mmap          : 191 kB
domainbuilder: detail:       domU mmap          : 92 kB
domainbuilder: detail: vcpu_hvm: called
domainbuilder: detail: xc_dom_gnttab_hvm_seed: called, pfn=0xff000
domainbuilder: detail: xc_dom_gnttab_hvm_seed: called, pfn=0xff001
domainbuilder: detail: xc_dom_release: called
libxl: debug: libxl_event.c:2194:libxl__ao_progress_report: ao 0x5593c42e7e30: progress report: callback queued aop=0x5593c42fea10
libxl: debug: libxl_event.c:1869:libxl__ao_complete: ao 0x5593c42e7e30: complete, rc=0
libxl: debug: libxl_event.c:1404:egc_run_callbacks: ao 0x5593c42e7e30: progress report: callback aop=0x5593c42fea10
libxl: debug: libxl_create.c:1708:do_domain_create: Domain 0:ao 0x5593c42e7e30: inprogress: poller=0x5593c42e7670, flags=ic
libxl: debug: libxl_event.c:1838:libxl__ao__destroy: ao 0x5593c42e7e30: destroy
xencall:buffer: debug: total allocations:233 total releases:233
xencall:buffer: debug: current allocations:0 maximum allocations:3
xencall:buffer: debug: cache current size:3
xencall:buffer: debug: cache hits:215 misses:3 toobig:15
xencall:buffer: debug: total allocations:0 total releases:0
xencall:buffer: debug: current allocations:0 maximum allocations:0
xencall:buffer: debug: cache current size:0
xencall:buffer: debug: cache hits:0 misses:0 toobig:0

> 
> > 
> > If I make this simple change:
> > 
> > --- a/bindings/xen/boot.S
> > +++ b/bindings/xen/boot.S
> > @@ -32,7 +32,7 @@
> >  #define ENTRY(x) .text; .globl x; .type x,%function; x:
> >  #define END(x)   .size x, . - x
> > 
> > -.section .note.solo5.xen
> > +.section .note.solo5.xen, "a", @note
> > 
> >         .align  4
> >         .long   4
> > 
> > then I get the expected output from readelf -lW, and I can get as far as
> > the C _start() with no issues!
> > 
> > FWIW, here's the diff of readelf -lW before/after:
> > 
> > --- before	2020-05-26 17:36:46.117885855 +0200
> > +++ after	2020-05-26 17:38:07.090508322 +0200
> > @@ -8,9 +8,9 @@
> >    INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
> >        [Requesting program interpreter: /nonexistent/solo5/]
> >    LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00615c 0x00615c R E 0x1000
> > -  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed28 RW  0x1000
> > +  LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x006120 0x00dd28 RW  0x1000
> 
> This seems suspicious, there's a change of the size of the LOAD
> section, but your change to the note type should not affect the LOAD
> section?

Indeed.

> 
> Hm, maybe it does because the .note.solo5.xen was considered writable
> by default?

I don't think so. From the broken image:

  [ 8] .note.solo5.xen   NOTE             00000000001070c4  0000f120
       0000000000000014  0000000000000000           0     0     4

From the good image:

  [ 8] .note.solo5.xen   NOTE             00000000001070c4  000080c4
       0000000000000014  0000000000000000   A       0     0     4

-mato

