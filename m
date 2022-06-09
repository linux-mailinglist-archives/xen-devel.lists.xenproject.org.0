Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F36D54408C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 02:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344429.569957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz5zP-00065i-FM; Thu, 09 Jun 2022 00:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344429.569957; Thu, 09 Jun 2022 00:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz5zP-00062f-CJ; Thu, 09 Jun 2022 00:25:31 +0000
Received: by outflank-mailman (input) for mailman id 344429;
 Thu, 09 Jun 2022 00:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nz5zN-00062Z-Jp
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 00:25:29 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9a0e0f0-e78a-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 02:25:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60CE2B82B8E;
 Thu,  9 Jun 2022 00:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAE9C34116;
 Thu,  9 Jun 2022 00:25:25 +0000 (UTC)
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
X-Inumbo-ID: a9a0e0f0-e78a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654734326;
	bh=24cm83TNnP6wGdoCnhsnsWwlJfgpn3O4hCfwVVooURg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cksXGyTUAwv6aWK8GHioS4kfhYIwlIGb5rBSNmUv5m/ww3cSq36Eg5em0s2bKNqbf
	 QNnIP0sEf04aHvA3A/Gt9Ca6nRyy9nAFvvxoq+vateEl+l/cRnARFscCHQOyTffeSp
	 qpiSZM0AwuVZeXDbVHjaHfxT5UQrF4b2XeIEYMLqVyUqeWvm/Jj6TZEfQJSxzbVoDv
	 fzPTr9SJ6pNY9Ruz4V0jAfizCwhWZHuHRqmLu8maygroNWwoKyc6KCZklzvSVY1CIh
	 O+1u+d8QDWjfCm4a6L26WURKANVqcO/0mwWSMnZ4IRVTZEMeIET4WAGGbgf6azWnv3
	 hQ/CnEsLrXvhg==
Date: Wed, 8 Jun 2022 17:25:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Hongyan Xia <hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 10/16] xen/arm: add Persistent Map (PMAP)
 infrastructure
In-Reply-To: <dec50384-5172-67b6-f4ac-a9c40d80a641@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206081725040.21215@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-11-julien@xen.org> <alpine.DEB.2.22.394.2206071806390.21215@ubuntu-linux-20-04-desktop> <dec50384-5172-67b6-f4ac-a9c40d80a641@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jun 2022, Julien Grall wrote:
> On 08/06/2022 02:08, Stefano Stabellini wrote:
> > > diff --git a/xen/arch/arm/include/asm/pmap.h
> > > b/xen/arch/arm/include/asm/pmap.h
> > > new file mode 100644
> > > index 000000000000..74398b4c4fe6
> > > --- /dev/null
> > > +++ b/xen/arch/arm/include/asm/pmap.h
> > > @@ -0,0 +1,32 @@
> > > +#ifndef __ASM_PMAP_H__
> > > +#define __ASM_PMAP_H__
> > > +
> > > +#include <xen/mm.h>
> > > +
> > > +#include <asm/fixmap.h>
> > > +
> > > +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> > > +{
> > > +    lpae_t *entry = &xen_fixmap[slot];
> > > +    lpae_t pte;
> > > +
> > > +    ASSERT(!lpae_is_valid(*entry));
> > > +
> > > +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> > > +    pte.pt.table = 1;
> > > +    write_pte(entry, pte);
> > 
> > Here we don't need a tlb flush because we never go from a valid mapping
> > to another valid mapping.
> 
> A TLB flush would not be sufficient here. You would need to follow the
> break-before-make sequence in order to replace a valid mapping with another
> valid mapping.
> 
> > We also go through arch_pmap_unmap which
> > clears the mapping and also flushes the tlb. Is that right?
> 
> The PMAP code is using a bitmap to know which entry is used. So when
> arch_pmap_map() is called, we also guarantees the entry will be invalid (hence
> the ASSERT(!lpae_is_valid()).
> 
> The bit in the bitmap will only be cleared by pmap_unmap() which will result
> to a TLB flush.
> 
> > > +}
> > > +
> > > +static inline void arch_pmap_unmap(unsigned int slot)
> > > +{
> > > +    lpae_t pte = {};
> > > +
> > > +    write_pte(&xen_fixmap[slot], pte);
> > > +
> > > +    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
> > > +}
> > > +
> > > +void arch_pmap_map_slot(unsigned int slot, mfn_t mfn);
> > > +void arch_pmap_clear_slot(void *ptr);
> > 
> > What are these two? They are not defined anywhere?
> 
> It is left-over. I will drop them.

With those two functions removed, you can add my 

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

