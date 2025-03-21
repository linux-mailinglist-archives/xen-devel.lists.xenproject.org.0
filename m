Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0911A6C645
	for <lists+xen-devel@lfdr.de>; Sat, 22 Mar 2025 00:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924653.1327766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlWH-0005xz-4N; Fri, 21 Mar 2025 23:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924653.1327766; Fri, 21 Mar 2025 23:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvlWH-0005wE-1T; Fri, 21 Mar 2025 23:11:17 +0000
Received: by outflank-mailman (input) for mailman id 924653;
 Fri, 21 Mar 2025 23:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvlWG-0005w8-J4
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 23:11:16 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c88606d3-06a9-11f0-9ea1-5ba50f476ded;
 Sat, 22 Mar 2025 00:11:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0907943714;
 Fri, 21 Mar 2025 23:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81336C4CEE3;
 Fri, 21 Mar 2025 23:11:11 +0000 (UTC)
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
X-Inumbo-ID: c88606d3-06a9-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742598672;
	bh=eRqlSF19rjPGtKr1//9xbqHuS6iz6gGS+OvkMo708sg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CP4T2tJEryLG8ECZzMzsNGFOlZQoliRrh9G/NYNsXfQLQ8TWLIk3rhg97lK5VtovB
	 u6wtWKH73g3eNrc3/u3yMnY2HIpLxgjDAY8MPvpxcuK2Lb1zj6aHsCksrWxGgNHCvK
	 EGG3jQlGFjQ78eNW5dQEz7glyOlDE8GSzaxpyHaY+1FYG0hWxuozErtjYrMN8Mu2JG
	 BaJF1I3+ITDX/Cl1nrFYaFqsODGT0Z/PsRIoxEio6rS2bk2PxA589Oev4hQqC3ZdeG
	 rEkmH7JYu6HQlIYAN+AnwzWRqJskcgUa3ZoaSfWP4NhfVXU0gxS3mKFHBE6KxUXkxn
	 tbWMRjDMOBu6A==
Date: Fri, 21 Mar 2025 16:11:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm/efi: merge neighboring banks
In-Reply-To: <85ac456a-ae11-4a04-8d73-dfafba04de98@xen.org>
Message-ID: <alpine.DEB.2.22.394.2503211534080.2325679@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2503211403040.2325679@ubuntu-linux-20-04-desktop> <85ac456a-ae11-4a04-8d73-dfafba04de98@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Julien Grall wrote:
> Hi Stefano,
> 
> On 21/03/2025 21:14, Stefano Stabellini wrote:
> > When booting from U-Boot bootefi, there can be a high number of
> > neighboring RAM banks. See for example:
> > 
> > (XEN) RAM: 0000000000000000 - 0000000000bfffff
> > (XEN) RAM: 0000000000c00000 - 0000000000c00fff
> > (XEN) RAM: 0000000000c01000 - 0000000000dfffff
> > (XEN) RAM: 0000000000e00000 - 000000000279dfff
> > (XEN) RAM: 000000000279e000 - 00000000029fffff
> > (XEN) RAM: 0000000002a00000 - 0000000008379fff
> > (XEN) RAM: 000000000837a000 - 00000000083fffff
> > (XEN) RAM: 0000000008400000 - 0000000008518fff
> > (XEN) RAM: 0000000008519000 - 00000000085fffff
> > (XEN) RAM: 0000000008600000 - 0000000008613fff
> > (XEN) RAM: 0000000008614000 - 00000000097fffff
> > (XEN) RAM: 0000000009800000 - 00000000098a7fff
> > (XEN) RAM: 00000000098a8000 - 0000000009dfffff
> > (XEN) RAM: 0000000009e00000 - 0000000009ea7fff
> > (XEN) RAM: 0000000009ea8000 - 000000001fffffff
> > (XEN) RAM: 0000000020000000 - 000000002007ffff
> > (XEN) RAM: 0000000020080000 - 0000000077b17fff
> > (XEN) RAM: 0000000077b19000 - 0000000077b2bfff
> > (XEN) RAM: 0000000077b2c000 - 0000000077c8dfff
> > (XEN) RAM: 0000000077c8e000 - 0000000077c91fff
> > (XEN) RAM: 0000000077ca7000 - 0000000077caafff
> > (XEN) RAM: 0000000077cac000 - 0000000077caefff
> > (XEN) RAM: 0000000077cd0000 - 0000000077cd2fff
> > (XEN) RAM: 0000000077cd4000 - 0000000077cd7fff
> > (XEN) RAM: 0000000077cd8000 - 000000007bd07fff
> > (XEN) RAM: 000000007bd09000 - 000000007fd5ffff
> > (XEN) RAM: 000000007fd70000 - 000000007fefffff
> > (XEN) RAM: 0000000800000000 - 000000087fffffff
> > 
> > It is undesirable to keep them separate, as this approach consumes more
> > resources.
> 
> What resources? This is pre-allocated static array in the binary. They are
> also dropped after init. The more interesting argument is...
> 
> > 
> > Additionally, Xen does not currently support boot modules that span
> > multiple banks: at least one of the regions get freed twice. The first
> > time from setup_mm->populate_boot_allocator, then again from
> > discard_initial_modules->fw_unreserved_regions. With a high number of
> > banks, it can be difficult to arrange the boot modules in a way that
> > avoids spanning across multiple banks.
> 
> ... this one. Although, I find weird that U-boot would create tons of banks.
> Have you considered to ask them what's going on?
> 
> Also, what about the cases where U-boot is not booting Xen without UEFI? Why
> is this not a problem? Asking just in case the merge should happen in code
> common rather than in UEFI.

I was also curious so I printed all the Types (desc->Type) for each EFI
region, see below the results.

DEBUG start=0x0 type=0x7 
DEBUG start=0xc00000 type=0x4 
DEBUG start=0xc01000 type=0x7 
DEBUG start=0xe00000 type=0x4 
DEBUG start=0x279e000 type=0x7 
DEBUG start=0x2a00000 type=0x4 
DEBUG start=0x837a000 type=0x7 
DEBUG start=0x8400000 type=0x4 
DEBUG start=0x8519000 type=0x7 
DEBUG start=0x8600000 type=0x4 
DEBUG start=0x8614000 type=0x7 
DEBUG start=0x9800000 type=0x4 
DEBUG start=0x98a8000 type=0x7 
DEBUG start=0x9e00000 type=0x4 
DEBUG start=0x9ea8000 type=0x7 
DEBUG start=0x20000000 type=0x4 
DEBUG start=0x20080000 type=0x7 
DEBUG start=0x77b19000 type=0x2 
DEBUG start=0x77b2c000 type=0x1 
DEBUG start=0x77c8e000 type=0x4 
DEBUG start=0x77ca7000 type=0x4 
DEBUG start=0x77cac000 type=0x4 
DEBUG start=0x77cd0000 type=0x4 
DEBUG start=0x77cd4000 type=0x4 
DEBUG start=0x77cd8000 type=0x3 
DEBUG start=0x7bd09000 type=0x3 
DEBUG start=0x7fd70000 type=0x3 
DEBUG start=0x800000000 type=0x4 

Looking at EFI_MEMORY_TYPE, 0x4 should be EfiBootServicesData and 0x7
should be EfiConventionalMemory. So the reason why there are so many
neighboring regions is that they are of different EFI types. There are
very many EfiBootServicesData regions, and by the time interesting Xen
code runs, BootServices are not available anymore, so they can be
reused. But they are still counted separately from the EFI point of
view. This cannot happen with the non-EFI boot as there are no
EfiBootServicesData regions.

 
> > This small patch merges neighboring regions, to make dealing with them
> > more efficient, and to make it easier to load boot modules.
> 
> While I understand the value for this, I ...
> 
> > The patch
> > also takes the opportunity to check and discard duplicates.
> 
> don't understand why we need to check for duplicates. This also doesn't
> properly work for a few reasons:
>   * This doesn't cover partial overlap
>   * This would not work if an entry was merged with another previously
> 
> So I think the code to check duplicates should be removed. If you are
> concerned about overlap, then it would be better to enable check_reserved
> just drop the code. If you are concerned about to detect and warn/panic.

Thanks Julien. No, I am not concerned about duplicates, I thought I
would add check since I was at it. I am totally fine removing it.

 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > index a80a5a7ab3..f6f23ed5b2 100644
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -163,6 +163,20 @@ static bool __init meminfo_add_bank(struct membanks
> > *mem,
> >       struct membank *bank;
> >       paddr_t start = desc->PhysicalStart;
> >       paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
> > +    int j;
> 
> nr_banks is an "unsigned int". So this should be the same type.

Thank you, good point

> > +
> > +    for ( j = 0; j < mem->nr_banks; j++ )
> > +    {
> > +        if ( mem->bank[j].start == start && mem->bank[j].size == size )
> > +        {
> > +            return true;
> > +        }
> > +        else if ( mem->bank[j].start + mem->bank[j].size == start )
> 
> Please add some parentheses to make it more obvious that you checking (a + b)
> == size.

Sure I can do that


> > +        {
> > +            mem->bank[j].size += size;
> > +            return true;
> > +        }
> > +    }
> >         if ( mem->nr_banks >= mem->max_banks )
> >           return false;
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

