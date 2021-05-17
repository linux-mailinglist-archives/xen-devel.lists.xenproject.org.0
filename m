Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1291382AB3
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 13:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128174.240677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libEB-0002fe-OT; Mon, 17 May 2021 11:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128174.240677; Mon, 17 May 2021 11:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libEB-0002co-KB; Mon, 17 May 2021 11:16:03 +0000
Received: by outflank-mailman (input) for mailman id 128174;
 Mon, 17 May 2021 11:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1libEA-0002ci-CK
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 11:16:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16287dd3-1efe-4ab1-8762-93cc88d733f5;
 Mon, 17 May 2021 11:16:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CB07B080;
 Mon, 17 May 2021 11:16:00 +0000 (UTC)
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
X-Inumbo-ID: 16287dd3-1efe-4ab1-8762-93cc88d733f5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621250160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRnmnJ6cgYdDT0uurga8Jr2PBHHTqFSap47T56nENTg=;
	b=cXV0F0KBqPK7B49CKPPegCNzgNNgGi6WlH/6VCF0+mExvGA5o7Wh/jBturiVZjKrczpCST
	cJg2Bk2gY+VuTZpy83LMKpbz6ncsyBzjXkRGnqhnox4LqEO0PgPwE26/Khc3QF6GAE6iws
	2QeLylBkRNbvvnipsX/oMV9Jg07mSEE=
Subject: Re: [PATCH v3 2/5] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <1156cb116da19ef64323e472bb6b6e87c6c73d77.1621017334.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <556d1933-3b11-0780-edec-b6dc1729bc56@suse.com>
Date: Mon, 17 May 2021 13:16:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1156cb116da19ef64323e472bb6b6e87c6c73d77.1621017334.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.05.2021 20:53, Connor Davis wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -294,7 +294,9 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
>      p2m_type_t p2mt;
>  #endif
>      mfn_t mfn;
> +#ifdef CONFIG_HAS_PASSTHROUGH
>      bool *dont_flush_p, dont_flush;
> +#endif
>      int rc;
>  
>  #ifdef CONFIG_X86
> @@ -385,13 +387,17 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
>       * Since we're likely to free the page below, we need to suspend
>       * xenmem_add_to_physmap()'s suppressing of IOMMU TLB flushes.
>       */
> +#ifdef CONFIG_HAS_PASSTHROUGH
>      dont_flush_p = &this_cpu(iommu_dont_flush_iotlb);
>      dont_flush = *dont_flush_p;
>      *dont_flush_p = false;
> +#endif
>  
>      rc = guest_physmap_remove_page(d, _gfn(gmfn), mfn, 0);
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
>      *dont_flush_p = dont_flush;
> +#endif
>  
>      /*
>       * With the lack of an IOMMU on some platforms, domains with DMA-capable
> @@ -839,11 +845,13 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>      xatp->gpfn += start;
>      xatp->size -= start;
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
>      if ( is_iommu_enabled(d) )
>      {
>         this_cpu(iommu_dont_flush_iotlb) = 1;
>         extra.ppage = &pages[0];
>      }
> +#endif
>  
>      while ( xatp->size > done )
>      {
> @@ -868,6 +876,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>          }
>      }
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
>      if ( is_iommu_enabled(d) )
>      {
>          int ret;
> @@ -894,6 +903,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>          if ( unlikely(ret) && rc >= 0 )
>              rc = ret;
>      }
> +#endif
>  
>      return rc;
>  }

I wonder whether all of these wouldn't better become CONFIG_X86:
ISTR Julien indicating that he doesn't see the override getting used
on Arm. (Julien, please correct me if I'm misremembering.)

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -51,9 +51,15 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
>      return dfn_x(x) == dfn_x(y);
>  }
>  
> -extern bool_t iommu_enable, iommu_enabled;
> +extern bool_t iommu_enable;
>  extern bool force_iommu, iommu_quarantine, iommu_verbose;
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +extern bool_t iommu_enabled;

Just bool please, like is already the case for the line in context
above. We're in the process of phasing out bool_t.

Jan

