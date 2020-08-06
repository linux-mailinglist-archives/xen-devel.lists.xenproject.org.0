Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129223DA6D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 14:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3fIN-000533-2I; Thu, 06 Aug 2020 12:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3fIM-00052y-Aw
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 12:46:54 +0000
X-Inumbo-ID: 1020df48-aa5e-415b-bd5c-8f286dc0b102
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1020df48-aa5e-415b-bd5c-8f286dc0b102;
 Thu, 06 Aug 2020 12:46:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B9B6AE09;
 Thu,  6 Aug 2020 12:47:07 +0000 (UTC)
Subject: Re: [PATCH v4 13/14] vtd: use a bit field for context_entry
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-14-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6de24196-019c-f91c-5cca-0971676a9b38@suse.com>
Date: Thu, 6 Aug 2020 14:46:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-14-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> @@ -208,35 +209,53 @@ struct root_entry {
>      do { (r).ctp = ((val) >> PAGE_SHIFT_4K); } while (0)
>  
>  struct context_entry {
> -    u64 lo;
> -    u64 hi;
> +    union {
> +        __uint128_t val;
> +        struct { uint64_t lo, hi; };
> +        struct {
> +            /* 0 - 63 */
> +            uint64_t p:1;
> +            uint64_t fpd:1;
> +            uint64_t tt:2;
> +            uint64_t reserved0:8;
> +            uint64_t slptp:52;
> +
> +            /* 64 - 127 */
> +            uint64_t aw:3;
> +            uint64_t ignored:4;
> +            uint64_t reserved1:1;
> +            uint64_t did:16;
> +            uint64_t reserved2:40;
> +        };
> +    };
>  };
> -#define ROOT_ENTRY_NR (PAGE_SIZE_4K/sizeof(struct root_entry))
> -#define context_present(c) ((c).lo & 1)
> -#define context_fault_disable(c) (((c).lo >> 1) & 1)
> -#define context_translation_type(c) (((c).lo >> 2) & 3)
> -#define context_address_root(c) ((c).lo & PAGE_MASK_4K)
> -#define context_address_width(c) ((c).hi &  7)
> -#define context_domain_id(c) (((c).hi >> 8) & ((1 << 16) - 1))
> -
> -#define context_set_present(c) do {(c).lo |= 1;} while(0)
> -#define context_clear_present(c) do {(c).lo &= ~1;} while(0)
> -#define context_set_fault_enable(c) \
> -    do {(c).lo &= (((u64)-1) << 2) | 1;} while(0)
> -
> -#define context_set_translation_type(c, val) do { \
> -        (c).lo &= (((u64)-1) << 4) | 3; \
> -        (c).lo |= (val & 3) << 2; \
> -    } while(0)
> +
> +#define context_present(c) (c).p
> +#define context_set_present(c) do { (c).p = 1; } while (0)
> +#define context_clear_present(c) do { (c).p = 0; } while (0)
> +
> +#define context_fault_disable(c) (c).fpd
> +#define context_set_fault_enable(c) do { (c).fpd = 1; } while (0)
> +
> +#define context_translation_type(c) (c).tt
> +#define context_set_translation_type(c, val) do { (c).tt = val; } while (0)
>  #define CONTEXT_TT_MULTI_LEVEL 0
>  #define CONTEXT_TT_DEV_IOTLB   1
>  #define CONTEXT_TT_PASS_THRU   2
>  
> -#define context_set_address_root(c, val) \
> -    do {(c).lo &= 0xfff; (c).lo |= (val) & PAGE_MASK_4K ;} while(0)
> +#define context_slptp(c) ((c).slptp << PAGE_SHIFT_4K)
> +#define context_set_slptp(c, val) \
> +    do { (c).slptp = (val) >> PAGE_SHIFT_4K; } while (0)

Presumably "slptp" is in line with the doc, but "address_root" is
quite a bit more readable. I wonder if I could talk you into
restoring the old (or some similar) names.

More generally, and more so here than perhaps already on the previous
patch - are these helper macros useful to have anymore?

> +#define context_address_width(c) (c).aw
>  #define context_set_address_width(c, val) \
> -    do {(c).hi &= 0xfffffff8; (c).hi |= (val) & 7;} while(0)
> -#define context_clear_entry(c) do {(c).lo = 0; (c).hi = 0;} while(0)
> +    do { (c).aw = (val); } while (0)
> +
> +#define context_did(c) (c).did
> +#define context_set_did(c, val) \
> +    do { (c).did = (val); } while (0)
> +
> +#define context_clear_entry(c) do { (c).val = 0; } while (0)

While this is in line with previous code, I'm concerned:
domain_context_unmap_one() has

    context_clear_present(*context);
    context_clear_entry(*context);

No barrier means no guarantee of ordering. I'd drop clear_present()
here and make clear_entry() properly ordered. This, I think, will at
the same time render the __uint128_t field unused and hence
unnecessary again.

Also comments given on the previous patch apply respectively here.

Jan

