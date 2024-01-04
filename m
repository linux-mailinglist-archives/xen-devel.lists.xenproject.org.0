Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BC8247DE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661875.1031625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLRxd-0003ln-56; Thu, 04 Jan 2024 17:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661875.1031625; Thu, 04 Jan 2024 17:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLRxd-0003k9-1q; Thu, 04 Jan 2024 17:56:53 +0000
Received: by outflank-mailman (input) for mailman id 661875;
 Thu, 04 Jan 2024 17:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eCom=IO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLRxb-0003k1-Me
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 17:56:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fef49bc-ab2a-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 18:56:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F06A618E1;
 Thu,  4 Jan 2024 17:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E66C433C7;
 Thu,  4 Jan 2024 17:56:42 +0000 (UTC)
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
X-Inumbo-ID: 9fef49bc-ab2a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704391004;
	bh=vtF2BB2dGdve6HMG0pH4hzcVLZ9JrWvpHtdB2Uci+Lc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EF/hAgI3KzVja5R/6o/S3e2hYkK0z31FR0VeLDRfdMxkA9XCIV6r45Mw5kTJlwqyL
	 wPG1oeRb4U1UALfb00BT5q4pmXgjiN6HV3xl8EVOaXZFrzARPBDp/9rHJzPwlOugBz
	 MnesYuzLI54h4HoDucKobBZZeusjB5i/vv8DTz4O47Hl2isn3HYHIoro1kki3j/aqS
	 kyK/5otHD3MKqgZd8ZBJIg+KIj01H6NUt3w5iRviF2IgBMiZgpvzL7pDDSuJVHUDJP
	 X4ELFVw5jG+wEva8oaVRAvttgulfKWqOdpUasmpvpABi17OLjfFRt7sU05NVJC0jg6
	 yMIvfAjsomiNA==
Date: Thu, 4 Jan 2024 09:56:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 00/13] Arm cache coloring
In-Reply-To: <fbe44fb6-2be3-4720-8b8e-3a05c0307d25@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401040956170.1322202@ubuntu-linux-20-04-desktop>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech> <6d652309-50e1-4850-ac52-d086a3a32726@amd.com> <alpine.DEB.2.22.394.2401031601180.1322202@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2401031748040.1322202@ubuntu-linux-20-04-desktop>
 <CAG+AhRUAOcT9HTj+v4vfz6nqBG4FumYc1of9XcmyTYKtW-66yA@mail.gmail.com> <fbe44fb6-2be3-4720-8b8e-3a05c0307d25@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1773981272-1704391004=:1322202"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1773981272-1704391004=:1322202
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Jan 2024, Michal Orzel wrote:
> On 04/01/2024 10:37, Carlo Nonato wrote:
> > Hi Stefano,
> > 
> > On Thu, Jan 4, 2024 at 2:55 AM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> >>
> >> On Wed, 3 Jan 2024, Stefano Stabellini wrote:
> >>> Also I tried this patch series on the "staging" branch and Xen failed to
> >>> boot, no messages at all from Xen so it must be an early boot failure. I
> >>> am passing this command line options to Xen and running it on QEMU:
> >>>
> >>> dom0_mem=1024M dom0_max_vcpus=1 xen-llc-colors=0 dom0-llc-colors=1-5 llc-way-size=65535 llc-coloring=true
> >>
> >> I managed to make it to work successfully with the following command
> >> line:
> >>
> >> xen-llc-colors=0 dom0-llc-colors=1-5 llc-way-size=64K llc-coloring=on
> >>
> >> I think the problem was llc-way-size that needs to be rounded up (64K
> >> instead of 65535).
> >>
> >> Also I found a few build issues when building for other architectures or
> >> different kconfig options. This patch addresses those issues (however it
> >> is not to be taken as is as the build issues should not be introduced in
> >> the first place and there are probably better way to fix them, but I
> >> hope it can help).
> >>
> >> Cheers,
> >>
> >> Stefano
> >>
> >>
> >> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> >> index f434efc45b..efe5cf3c23 100644
> >> --- a/xen/arch/arm/llc-coloring.c
> >> +++ b/xen/arch/arm/llc-coloring.c
> >> @@ -39,7 +39,7 @@ static unsigned int __ro_after_init xen_num_colors;
> >>
> >>  #define mfn_color_mask              (nr_colors - 1)
> >>  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> >> -#define mfn_set_color(mfn, color)   ((mfn_x(mfn) & ~mfn_color_mask) | (color))
> >> +#define mfn_set_color(mfn, color)   (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
> > 
> > Thanks for spotting this.
> > 
> >>  /*
> >>   * Parse the coloring configuration given in the buf string, following the
> >> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> >> index 3bb0c9221f..bf16703e24 100644
> >> --- a/xen/arch/arm/mm.c
> >> +++ b/xen/arch/arm/mm.c
> >> @@ -610,10 +610,10 @@ void __init setup_pagetables(unsigned long boot_phys_offset, paddr_t xen_paddr)
> >>      pte.pt.table = 1;
> >>      xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
> >>
> >> +#ifdef CONFIG_ARM_64
> >>      if ( llc_coloring_enabled )
> >>          ttbr = virt_to_maddr(virt_to_reloc_virt(xen_pgtable));
> >>      else
> >> -#ifdef CONFIG_ARM_64
> >>          ttbr = (uintptr_t) xen_pgtable + phys_offset;
> >>  #else
> >>          ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
> >> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> >> index 7cd481e955..516139c4ff 100644
> >> --- a/xen/include/xen/llc-coloring.h
> >> +++ b/xen/include/xen/llc-coloring.h
> >> @@ -21,7 +21,27 @@
> >>  extern bool llc_coloring_enabled;
> >>  #define llc_coloring_enabled (llc_coloring_enabled)
> >>  #endif
> >> -
> >> +#else
> >> +static inline void *xen_remap_colored(mfn_t xen_fn, paddr_t xen_size)
> >> +{
> >> +    return NULL;
> >> +}
> >> +static inline int domain_set_llc_colors_from_str(struct domain *d, const char *str)
> >> +{
> >> +    return -ENOSYS;
> >> +}
> >> +static inline int dom0_set_llc_colors(struct domain *d)
> >> +{
> >> +    return 0;
> >> +}
> >> +static inline bool llc_coloring_init(void)
> >> +{
> >> +    return false;
> >> +}
> >> +static inline paddr_t xen_colored_map_size(paddr_t size)
> >> +{
> >> +    return 0;
> >> +}
> >>  #endif
> >>
> >>  #ifndef llc_coloring_enabled
> > 
> > Sorry for the compilation mess.
> > 
> > This is definitely a solution, but I wonder if the best thing to do would be
> > to move all signatures in the common header, without the stubs, relying again
> > on DCE. This seems a little strange to me because users of some of those
> > functions are only in arm code, and they always have to be protected with
> > llc_coloring_enabled global variable/macro if, but it works (now I'm
> > compiling also for arm32 and x86).
> There are a lot of places in Xen relying on DCE, so I'd be ok with that (you can wait
> for Stefano's opinion). Furthermore, you already rely on that in case of e.g. domain_set_llc_colors_domctl,
> domain_llc_coloring_free.
 
Yeah I think that would be fine
--8323329-1773981272-1704391004=:1322202--

