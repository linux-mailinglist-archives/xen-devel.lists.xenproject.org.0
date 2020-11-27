Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3462C68BD
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 16:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39594.72538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kifjM-0006Zh-0m; Fri, 27 Nov 2020 15:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39594.72538; Fri, 27 Nov 2020 15:32:15 +0000
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
	id 1kifjL-0006ZI-TB; Fri, 27 Nov 2020 15:32:15 +0000
Received: by outflank-mailman (input) for mailman id 39594;
 Fri, 27 Nov 2020 15:32:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kifjK-0006ZD-M5
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 15:32:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2b5f24b-4ad1-4926-97a9-0077bf2c25db;
 Fri, 27 Nov 2020 15:32:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 420DFAC2D;
 Fri, 27 Nov 2020 15:32:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kifjK-0006ZD-M5
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 15:32:14 +0000
X-Inumbo-ID: e2b5f24b-4ad1-4926-97a9-0077bf2c25db
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e2b5f24b-4ad1-4926-97a9-0077bf2c25db;
	Fri, 27 Nov 2020 15:32:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606491132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHRaQqw4nqU2MYT8jElsl7KcUyxKLYy5JKqi1BajHxc=;
	b=TnvJUE/E8oK/0PeSyEtdgKxM9tmon2n89cPHmANfMXQMA9eVsNjHySuLAwKxMNscHxgT2k
	3Zd+kmFrzEB53US7MNoZA0O0fAWCNwU07H17PbQ1i2w5QUM/Yl+cI4xPj0B3ILBY7enRvT
	DDTjHWf3s/UTlFYaaa216v1McdQ6MXY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 420DFAC2D;
	Fri, 27 Nov 2020 15:32:12 +0000 (UTC)
Subject: Re: [PATCH v10 6/7] vtd: use a bit field for context_entry
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5aab9cb2-b5f2-97a3-2433-6301b3ae7c54@suse.com>
Date: Fri, 27 Nov 2020 16:32:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120132440.1141-7-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 14:24, Paul Durrant wrote:
> @@ -121,21 +119,22 @@ static int context_set_domain_id(struct context_entry *context,
>      }
>  
>      set_bit(i, iommu->domid_bitmap);
> -    context->hi |= (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
> +    context->did = i;
> +
>      return 0;
>  }
>  
>  static int context_get_domain_id(struct context_entry *context,
>                                   struct vtd_iommu *iommu)
>  {
> -    unsigned long dom_index, nr_dom;
>      int domid = -1;
>  
>      if (iommu && context)
>      {
> -        nr_dom = cap_ndoms(iommu->cap);
> +        unsigned long dom_index, nr_dom;

unsigned int will do here.

> -        dom_index = context_domain_id(*context);
> +        nr_dom = cap_ndoms(iommu->cap);
> +        dom_index = context->did;

These could also become the initializers of the variables now.

> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -198,37 +198,34 @@ struct root_entry {
>          };
>      };
>  };
> +#define ROOT_ENTRY_NR (PAGE_SIZE_4K / sizeof(struct root_entry))
>  
>  struct context_entry {
> -    u64 lo;
> -    u64 hi;
> -};
> -#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
> -#define context_present(c) ((c).lo & 1)
> -#define context_fault_disable(c) (((c).lo >> 1) & 1)
> -#define context_translation_type(c) (((c).lo >> 2) & 3)
> -#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
> -#define context_address_width(c) ((c).hi &  7)
> -#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
> +    union {
> +        __uint128_t val;
> +        struct { uint64_t lo, hi; };
> +        struct {
> +            /* 0 - 63 */
> +            bool p:1;
> +            bool fpd:1;
> +            uint64_t tt:2;

unsigned int

With these taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

