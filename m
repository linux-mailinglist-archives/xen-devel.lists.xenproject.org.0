Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E6A7521C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 22:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931235.1333642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyHJx-00034J-EO; Fri, 28 Mar 2025 21:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931235.1333642; Fri, 28 Mar 2025 21:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyHJx-00031m-Bh; Fri, 28 Mar 2025 21:32:57 +0000
Received: by outflank-mailman (input) for mailman id 931235;
 Fri, 28 Mar 2025 21:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyHJw-00031e-A4
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 21:32:56 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 330b1a5d-0c1c-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 22:32:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 04342A42FF8;
 Fri, 28 Mar 2025 21:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D097C4CEE4;
 Fri, 28 Mar 2025 21:32:48 +0000 (UTC)
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
X-Inumbo-ID: 330b1a5d-0c1c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743197569;
	bh=uuPqaEZwovtVzWlKovHIgRA0qElIa53q0wZHMhZEi94=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g81R58W4N36Z3X7NjlGp1t/zc8t9aVNOi2jME9HndxLRc1Pe9BkxR4m1t7fqzimVo
	 vdpdx85fcTkYGt3j+zyqO4QVDj2EGjwtUuzV9FmzqP6a7UM/oZG4MvKmUPRIXSbTUJ
	 Q+D2tfv8fnIDs67glgmgUmh7UPGmlLK8fLrmOHAz6fDUl5oySxhw5ce1IrH+Bvr9X2
	 lI5qdlYIevREkVGad2aHAjBi5Ts6Au8QfVSLcOIThbbCdQJxde48vIcVA28b+6xZ1W
	 kAlOKW7OoO9FMBOrPKeWFrXLJvztxqdfkH9G/bpF5lN9aazuM2AEvUATEoZXgWiYsE
	 XJek8HxJZOWdA==
Date: Fri, 28 Mar 2025 14:32:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>
Subject: Re: [PATCH v2] xen/arm/efi: merge neighboring banks
In-Reply-To: <87cye2giho.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2503281431090.563920@ubuntu-linux-20-04-desktop>
References: <20250327231627.1111684-1-stefano.stabellini@amd.com> <87cye2giho.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> Stefano Stabellini <stefano.stabellini@amd.com> writes:
> 
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
> > Xen does not currently support boot modules that span multiple banks: at
> > least one of the regions get freed twice. The first time from
> > setup_mm->populate_boot_allocator, then again from
> > discard_initial_modules->fw_unreserved_regions. With a high number of
> > banks, it can be difficult to arrange the boot modules in a way that
> > avoids spanning across multiple banks.
> >
> > This small patch merges neighboring regions, to make dealing with them
> > more efficient, and to make it easier to load boot modules.
> >
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v2:
> > - remove unneeded check for duplicates
> > - unsigned int instead of int
> > - add parenthesis
> > ---
> >  xen/arch/arm/efi/efi-boot.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > index a80a5a7ab3..8b8ef5dcfb 100644
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -163,6 +163,16 @@ static bool __init meminfo_add_bank(struct membanks *mem,
> >      struct membank *bank;
> >      paddr_t start = desc->PhysicalStart;
> >      paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
> > +    unsigned int j;
> > +
> > +    for ( j = 0; j < mem->nr_banks; j++ )
> > +    {
> > +        if ( (mem->bank[j].start + mem->bank[j].size) == start )
> > +        {
> > +            mem->bank[j].size += size;
> > +            return true;
> > +        }
> > +    }
> >  
> >      if ( mem->nr_banks >= mem->max_banks )
> >          return false;
> 
> It didn't got into diff context, but there is this check below:
> 
> #ifdef CONFIG_ACPI
>     if ( check_reserved_regions_overlap(start, size, false) )
>         return false;
> #endif
> 
> Your patch will skip it.

You are right, this new hunk should be added after that check. I'l
resend.

