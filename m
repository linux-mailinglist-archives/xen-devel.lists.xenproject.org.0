Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE52979E1
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 02:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11361.30119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW7ED-0007lc-CW; Sat, 24 Oct 2020 00:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11361.30119; Sat, 24 Oct 2020 00:16:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW7ED-0007lD-9C; Sat, 24 Oct 2020 00:16:13 +0000
Received: by outflank-mailman (input) for mailman id 11361;
 Sat, 24 Oct 2020 00:16:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kW7EB-0007l8-Pw
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:16:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8af179f4-5ae2-411a-bb63-7a5fadf00df5;
 Sat, 24 Oct 2020 00:16:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB8B42225E;
 Sat, 24 Oct 2020 00:16:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kW7EB-0007l8-Pw
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:16:11 +0000
X-Inumbo-ID: 8af179f4-5ae2-411a-bb63-7a5fadf00df5
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8af179f4-5ae2-411a-bb63-7a5fadf00df5;
	Sat, 24 Oct 2020 00:16:11 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DB8B42225E;
	Sat, 24 Oct 2020 00:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603498570;
	bh=m4P5pbLIFRz1X41Hu460Num+nUlO0E7tg5/DYZmhy8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SO/Nn9u2Hy66aKZhNOT1wryxULvrEG3h6H7J36LKueQze74vDrWDuo1LK6vCGCh4a
	 gceZumpiuXri1MCSXyW3PNTp2eAP3Wy1mQe8CKcx91a6cxel9VFjGycq40C9PKV5EH
	 3RLb1NO50qxo4h+ksUzJIHxA59F6Bq9k7tj8aEuU=
Date: Fri, 23 Oct 2020 17:16:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org, 
    masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Rahul.Singh@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 2/7] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
In-Reply-To: <20201023154156.6593-3-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2010231714510.12247@sstabellini-ThinkPad-T480s>
References: <20201023154156.6593-1-julien@xen.org> <20201023154156.6593-3-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Oct 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 022387ee1ad3 "xen/arm: mm: Don't open-code Xen PT update in
> {set, clear}_fixmap()" enforced that each set_fixmap() should be
> paired with a clear_fixmap(). Any failure to follow the model would
> result to a platform crash.
> 
> Unfortunately, the use of fixmap in the ACPI code was overlooked as it
> is calling set_fixmap() but not clear_fixmap().
> 
> The function __acpi_os_map_table() is reworked so:
>     - We know before the mapping whether the fixmap region is big
>     enough for the mapping.
>     - It will fail if the fixmap is already in use. This is not a
>     change of behavior but clarifying the current expectation to avoid
>     hitting a BUG().
> 
> The function __acpi_os_unmap_table() will now call clear_fixmap().
> 
> Reported-by: Wei Xu <xuwei5@hisilicon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> The discussion on the original thread [1] suggested to also zap it on
> x86. This is technically not necessary today, so it is left alone for
> now.
> 
> I looked at making the fixmap code common but the index are inverted
> between Arm and x86.
> 
>     Changes in v2:
>         - Clarify the commit message
>         - Fix the size computation in __acpi_unmap_table()
> 
> [1] https://lore.kernel.org/xen-devel/5E26C935.9080107@hisilicon.com/
> ---
>  xen/arch/arm/acpi/lib.c | 73 +++++++++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/lib.c b/xen/arch/arm/acpi/lib.c
> index fcc186b03399..b755620e67b5 100644
> --- a/xen/arch/arm/acpi/lib.c
> +++ b/xen/arch/arm/acpi/lib.c
> @@ -25,40 +25,79 @@
>  #include <xen/init.h>
>  #include <xen/mm.h>
>  
> +static bool fixmap_inuse;
> +
>  char *__acpi_map_table(paddr_t phys, unsigned long size)
>  {
> -    unsigned long base, offset, mapped_size;
> -    int idx;
> +    unsigned long base, offset;
> +    mfn_t mfn;
> +    unsigned int idx;
>  
>      /* No arch specific implementation after early boot */
>      if ( system_state >= SYS_STATE_boot )
>          return NULL;
>  
>      offset = phys & (PAGE_SIZE - 1);
> -    mapped_size = PAGE_SIZE - offset;
> -    set_fixmap(FIXMAP_ACPI_BEGIN, maddr_to_mfn(phys), PAGE_HYPERVISOR);
> -    base = FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
> +    base = FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) + offset;
> +
> +    /* Check the fixmap is big enough to map the region */
> +    if ( (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - base) < size )
> +        return NULL;
> +
> +    /* With the fixmap, we can only map one region at the time */
> +    if ( fixmap_inuse )
> +        return NULL;
>  
> -    /* Most cases can be covered by the below. */
> +    fixmap_inuse = true;
> +
> +    size += offset;
> +    mfn = maddr_to_mfn(phys);
>      idx = FIXMAP_ACPI_BEGIN;
> -    while ( mapped_size < size )
> -    {
> -        if ( ++idx > FIXMAP_ACPI_END )
> -            return NULL;    /* cannot handle this */
> -        phys += PAGE_SIZE;
> -        set_fixmap(idx, maddr_to_mfn(phys), PAGE_HYPERVISOR);
> -        mapped_size += PAGE_SIZE;
> -    }
>  
> -    return ((char *) base + offset);
> +    do {
> +        set_fixmap(idx, mfn, PAGE_HYPERVISOR);
> +        size -= min(size, (unsigned long)PAGE_SIZE);
> +        mfn = mfn_add(mfn, 1);
> +        idx++;
> +    } while ( size > 0 );
> +
> +    return (char *)base;
>  }
>  
>  bool __acpi_unmap_table(const void *ptr, unsigned long size)
>  {
>      vaddr_t vaddr = (vaddr_t)ptr;
> +    unsigned int idx;
> +
> +    /* We are only handling fixmap address in the arch code */
> +    if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
> +         (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END)) )

Is it missing "+ PAGE_SIZE"?

   if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
        (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) )


> +        return false;
> +
> +    /*
> +     * __acpi_map_table() will always return a pointer in the first page
> +     * for the ACPI fixmap region. The caller is expected to free with
> +     * the same address.
> +     */
> +    ASSERT((vaddr & PAGE_MASK) == FIXMAP_ADDR(FIXMAP_ACPI_BEGIN));
> +
> +    /* The region allocated fit in the ACPI fixmap region. */
> +    ASSERT(size < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - vaddr));
> +    ASSERT(fixmap_inuse);
> +
> +    fixmap_inuse = false;
> +
> +    size += vaddr - FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
> +    idx = FIXMAP_ACPI_BEGIN;
> +
> +    do
> +    {
> +        clear_fixmap(idx);
> +        size -= min(size, (unsigned long)PAGE_SIZE);
> +        idx++;
> +    } while ( size > 0 );
>  
> -    return ((vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) &&
> -            (vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE)));
> +    return true;
>  }
>  
>  /* True to indicate PSCI 0.2+ is implemented */


