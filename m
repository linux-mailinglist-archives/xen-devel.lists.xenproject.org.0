Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33090AF668F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 02:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031638.1405450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX7iN-0003P7-Md; Thu, 03 Jul 2025 00:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031638.1405450; Thu, 03 Jul 2025 00:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX7iN-0003N4-J4; Thu, 03 Jul 2025 00:22:11 +0000
Received: by outflank-mailman (input) for mailman id 1031638;
 Thu, 03 Jul 2025 00:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uX7iM-0003Mw-6a
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 00:22:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1127f7e-57a3-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 02:22:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 081DB61142;
 Thu,  3 Jul 2025 00:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DD0C4CEE7;
 Thu,  3 Jul 2025 00:22:04 +0000 (UTC)
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
X-Inumbo-ID: c1127f7e-57a3-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751502126;
	bh=lSNCuuAq5V7prRzwR9cdq8YhiDOLUmML35xKW4kUE0s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k7eUM5SoR/RSxQsYc+fr+YH3oZvHMXzhtoLBj6JF/LebMsf2l9DS/EyY667xOduBQ
	 ga2TC3J48czSai2QxllnNqqeUSxoASrlW+EPAjwaKXXjIyK6IHCPoT0mdvBuUjGdKj
	 X1ykqC0MYEteU42fqyMc/doJQXHeDF6B+lmsL6b6Oxpx78rgj+QELEN6oTAJ1zgwOD
	 k3wA2/eNaed/lljH6M1BPorHt8k4/FcHG94tNR0jEx1tZL3GL2ywtd6qu8YfitgpdZ
	 Grb2wmBTr8wfsZDVRE5Vbg8QdpjcZAMR3IAQr3dd1olcn48a00omDZLbqqpNQ2zhYN
	 Qrtf88ND1XAfg==
Date: Wed, 2 Jul 2025 17:22:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: "Orzel, Michal" <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
In-Reply-To: <aGT_nusKKFEhhXJk@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2507021721070.862517@ubuntu-linux-20-04-desktop>
References: <20250620111130.29057-1-roger.pau@citrix.com> <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop> <aGKnDHtRD5OLGaYj@macbook.local> <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop> <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop> <aGTZK0YmBTvGmNQr@macbook.local> <0807cdba-b0bb-42a7-a18d-407ab818709a@amd.com> <aGTtJTTbEkYvnMq6@macbook.local> <adc8f96c-6aad-4d67-9e78-118a29a58bce@amd.com>
 <aGT_nusKKFEhhXJk@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-753493639-1751502093=:862517"
Content-ID: <alpine.DEB.2.22.394.2507021721510.862517@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-753493639-1751502093=:862517
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2507021721511.862517@ubuntu-linux-20-04-desktop>

On Wed, 2 Jul 2025, Roger Pau Monné wrote:
> On Wed, Jul 02, 2025 at 10:54:24AM +0200, Orzel, Michal wrote:
> > 
> > 
> > On 02/07/2025 10:26, Roger Pau Monné wrote:
> > > On Wed, Jul 02, 2025 at 09:52:45AM +0200, Orzel, Michal wrote:
> > >>
> > >>
> > >> On 02/07/2025 09:00, Roger Pau Monné wrote:
> > >>> On Tue, Jul 01, 2025 at 01:46:19PM -0700, Stefano Stabellini wrote:
> > >>>> On Tue, 1 Jul 2025, Jan Beulich wrote:
> > >>>>> Sadly from this you omitted the output from the setup of the offsets
> > >>>>> arrays. Considering also your later reply, I'd be curious to know what
> > >>>>> mfn_to_pdx(0x50000000) is.
> > >>>>  
> > >>>> Full logs here, and debug patch in attachment.
> > >>>>
> > >>>> (XEN) Checking for initrd in /chosen
> > >>>> (XEN) RAM: 0000000000000000 - 000000007fffffff
> > >>>> (XEN) RAM: 0000000800000000 - 000000087fffffff
> > >>>> (XEN) RAM: 0000050000000000 - 000005007fffffff
> > >>>> (XEN) RAM: 0000060000000000 - 000006007fffffff
> > >>>> (XEN) RAM: 0000070000000000 - 000007007fffffff
> > >>>> (XEN) 
> > >>>> (XEN) MODULE[0]: 0000000022000000 - 0000000022172fff Xen         
> > >>>> (XEN) MODULE[1]: 0000000022200000 - 000000002220efff Device Tree 
> > >>>> (XEN) MODULE[2]: 0000000020400000 - 0000000021e2ffff Kernel      
> > >>>> (XEN)  RESVD[0]: 0000000000000000 - 0000000000ffffff
> > >>>> (XEN)  RESVD[1]: 0000000001000000 - 00000000015fffff
> > >>>> (XEN)  RESVD[2]: 0000000001600000 - 00000000017fffff
> > >>>> (XEN)  RESVD[3]: 0000000001800000 - 00000000097fffff
> > >>>> (XEN)  RESVD[4]: 0000000009800000 - 000000000bffffff
> > >>>> (XEN)  RESVD[5]: 0000000011126000 - 000000001114dfff
> > >>>> (XEN)  RESVD[6]: 000000001114e000 - 000000001214efff
> > >>>> (XEN)  RESVD[7]: 0000000017275000 - 000000001729cfff
> > >>>> (XEN)  RESVD[8]: 000000001729d000 - 000000001829dfff
> > >>>> (XEN)  RESVD[9]: 000000001a7df000 - 000000001a806fff
> > >>>> (XEN)  RESVD[10]: 000000001a807000 - 000000001b807fff
> > >>>> (XEN)  RESVD[11]: 000000001d908000 - 000000001d92ffff
> > >>>> (XEN)  RESVD[12]: 000000001d930000 - 000000001e930fff
> > >>>> (XEN)  RESVD[13]: 000000001829e000 - 000000001869dfff
> > >>>> (XEN)  RESVD[14]: 000000001869e000 - 00000000186ddfff
> > >>>> (XEN)  RESVD[15]: 0000000800000000 - 000000083fffffff
> > >>>> (XEN) 
> > >>>> (XEN) 
> > >>>> (XEN) Command line: console=dtuart dom0_mem=2048M console_timestamps=boot debug bootscrub=0 vwfi=native sched=null
> > >>>> (XEN) [00000006bfc302ec] parameter "debug" unknown!
> > >>>> (XEN) [00000006bfcc0476] DEBUG init_pdx 294 start=0 end=80000000
> > >>>> (XEN) [00000006bfcd2400] DEBUG init_pdx 294 start=800000000 end=880000000
> > >>>> (XEN) [00000006bfce29ec] DEBUG init_pdx 294 start=50000000000 end=50080000000
> > >>>> (XEN) [00000006bfcf1768] DEBUG init_pdx 294 start=60000000000 end=60080000000
> > >>>> (XEN) [00000006bfd015a4] DEBUG init_pdx 294 start=70000000000 end=70080000000
> > >>>> (XEN) [00000006bfd1444f] DEBUG setup_mm 252
> > >>>> (XEN) [00000006bfd3dc6f] DEBUG setup_mm 273 start=0 size=80000000 ram_end=80000000 directmap_base_pdx=0
> > >>>> (XEN) [00000006bfd5616e] DEBUG setup_directmap_mappings 229 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=0
> > >>>> (XEN) [00000006bfd7d38a] DEBUG setup_directmap_mappings 237 base_mfn=0 nr_mfns=80000 directmap_base_pdx=0
> > >>>> (XEN) [00000006bfd92728] DEBUG setup_mm 273 start=800000000 size=80000000 ram_end=880000000 directmap_base_pdx=0
> > >>>> (XEN) [00000006bfdaba3b] DEBUG setup_directmap_mappings 229 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=800000
> > >>>> (XEN) [00000006bfdcd79c] DEBUG setup_directmap_mappings 237 base_mfn=800000 nr_mfns=80000 directmap_base_pdx=0
> > >>>> (XEN) [00000006bfde4d82] DEBUG setup_mm 273 start=50000000000 size=80000000 ram_end=50080000000 directmap_base_pdx=0
> > >>>> (XEN) [00000006bfdfaef0] DEBUG setup_directmap_mappings 229 base_mfn=50000000 nr_mfns=80000 directmap_base_pdx=0 mfn_to_pdx=50000000
> > >>>> (XEN) [00000006bfe35249] Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
> > >>>
> > >>> As said on the other reply, the issue here is that with the v2 PDX
> > >>> offset compression logic your memory map is not compressible, and this
> > >>> leads to an overflow, as anything above 5TiB won't fit in the
> > >>> directmap AFAICT.  We already discussed with Jan that ARM seems to be
> > >>> missing any logic to account for the max addressable page:
> > >>>
> > >>> https://lore.kernel.org/xen-devel/9074f1a6-a605-43f4-97f3-d0a626252d3f@suse.com/
> > >>>
> > >>> x86 has setup_max_pdx() that truncates the maximum addressable MFN
> > >>> based on the active PDX compression and the virtual memory map
> > >>> restrictions.  ARM needs similar logic to account for this
> > >>> restrictions.
> > >>
> > >> We have a few issues on Arm. First, we don't check whether direct map is big
> > >> enough provided max_pdx that we don't set at all. Second, we don't really use
> > >> PDX grouping (can be also used without compression). My patch (that Stefano
> > >> attached previously) fixes the second issue (Allejandro will take it over to
> > >> come up with common solution).
> > > 
> > > You probably can handle those as different issues, as PDX grouping is
> > > completely disjoint from PDX compression.  It might be helpful if
> > > we could split the PDX grouping into a separate file from the PDX
> > > compression.
> > > 
> > > One weirdness I've noticed with ARM is the addition of start offsets
> > > to the existing PDX compression, by using directmap_base_pdx,
> > > directmap_mfn_start, directmap_base_pdx &c.  I'm not sure whether this will
> > > interfere with the PDX compression, but it looks like a bodge.  This
> > > should be part of the generic PDX compression implementation, not an
> > > extra added on a per-arch basis.
> > > 
> > > FWIW, PDX offset translation should already compress any gaps from 0
> > > to the first RAM range, and hence this won't be needed (in fact it
> > > would just make ARM translations slower by doing an extra unneeded
> > > operation).  My recommendation would be to move this initial offset
> > > compression inside the PDX mask translation.
> > > 
> > >> For the first issue, we need to know max_page (at
> > >> the moment we calculate it in setup_mm() at the very end but we could do it in
> > >> init_pdx() to know it ahead of setting direct map) and PDX offset (on x86 there
> > >> is no offset). I also think that on Arm we should just panic if direct map is
> > >> too small.
> > > 
> > > Hm, that's up to the ARM folks, but my opinion is that you should
> > > simply ignore memory above the threshold.  Panicking should IMO be a
> > > last resort option when there's no way to workaround the issue.
> > On Arm we handle user errors and suspicious behavior usually as panics as oppose
> > to x86 which is more liberal in that regard. We want to fail as soon as possible.
> > 
> > > 
> > >> The issue can be reproduced by disabling PDX compression, so not only with
> > >> Roger's patch.
> > >>
> > >> @Julien, I'm thinking of something like this:
> > >>
> > >> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> > >> index 4d22f35618aa..e6d9b49acd3c 100644
> > >> --- a/xen/arch/arm/arm32/mmu/mm.c
> > >> +++ b/xen/arch/arm/arm32/mmu/mm.c
> > >> @@ -190,7 +190,6 @@ void __init setup_mm(void)
> > >>
> > >>      /* Frame table covers all of RAM region, including holes */
> > >>      setup_frametable_mappings(ram_start, ram_end);
> > >> -    max_page = PFN_DOWN(ram_end);
> > >>
> > >>      /*
> > >>       * The allocators may need to use map_domain_page() (such as for
> > >> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> > >> index a0a2dd8cc762..3e64be6ae664 100644
> > >> --- a/xen/arch/arm/arm64/mmu/mm.c
> > >> +++ b/xen/arch/arm/arm64/mmu/mm.c
> > >> @@ -224,6 +224,9 @@ static void __init setup_directmap_mappings(unsigned long
> > >> base_mfn,
> > >>           */
> > >>          directmap_virt_start = DIRECTMAP_VIRT_START +
> > >>              (base_mfn - mfn_gb) * PAGE_SIZE;
> > >> +
> > >> +        if ( (max_pdx - directmap_base_pdx) > (DIRECTMAP_SIZE >> PAGE_SHIFT) )
> > >> +            panic("Direct map is too small\n");
> > > 
> > > As said above - I would avoid propagating the usage of those offsets
> > > into generic memory management code, it's usage should be confined
> > > inside the translation functions.
> > directmap_base_pdx is set a few lines above, so I would not call it propagation.
> > 
> > > 
> > > Here you probably want to use maddr_to_virt() or similar.
> > I can't because maddr_to_virt() has the ASSERT with similar check.
> > > 
> > > You can maybe pickup:
> > > 
> > > https://lore.kernel.org/xen-devel/20250611171636.5674-3-roger.pau@citrix.com/
> > > 
> > > And attempt to hook it into ARM?
> > As said above, we have different ways to approach setting max_pdx. On Arm we
> > want to panic, on x86 you want to limit the max_pdx.
> > 
> > > 
> > > I don't think it would that difficult to reduce the consumption of
> > > memory map ranges to what Xen can handle.
> > > 
> > > Thanks, Roger.
> > 
> > The diff I sent fixes the issue for direct map now. We can take it now if we
> > want to solve the issue. If we instead want to wait for frametable fixes (\wrt
> > grouping) and possible PDX changes (making offsets common) to be done first, I
> > can simply park this patch.
> 
> No please, don't park it just because of my opinions.  I think Julien
> is OK with it, so don't hold back because of my x86 based opinion on
> how to handle errors.

I would also rather have the small improvement now rather than later
--8323329-753493639-1751502093=:862517--

