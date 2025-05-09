Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F482AB1A0F
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 18:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980215.1366684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQMz-0005jD-RA; Fri, 09 May 2025 16:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980215.1366684; Fri, 09 May 2025 16:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQMz-0005hY-OK; Fri, 09 May 2025 16:14:41 +0000
Received: by outflank-mailman (input) for mailman id 980215;
 Fri, 09 May 2025 16:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDQMy-0005hM-NX
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 16:14:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4cf4280-2cf0-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 18:14:38 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so23936625e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 09:14:38 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ec98dsm3658098f8f.25.2025.05.09.09.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 09:14:37 -0700 (PDT)
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
X-Inumbo-ID: b4cf4280-2cf0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746807278; x=1747412078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w9KhlxihKBcpctm46Qfx1HSfYTtqhDb8K/RQu8cFu3I=;
        b=TBfkDZSFKCAnGNtHWpoVbB+joBYxn9eKYXqRTyLtgER0YBoHR9TVuRjSHxNeLNEnaH
         5N53792CMYccPCMqUvAcrK93KDm2zff2UHQ1qD2XOwS3w0M4l87iLAqYwx0DlEmx/v3Z
         8iVVHD9Dlpe6v4tgeOIO+H2EGJYC9drREvEnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807278; x=1747412078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9KhlxihKBcpctm46Qfx1HSfYTtqhDb8K/RQu8cFu3I=;
        b=bXS8WjdQpsGwmOAT/H/qB5SsFOk2lG42+Nt16CtvteCyT8nGc2JDKlNGCmDNKJn+5p
         9i4wlb7MXo7eGA8KxxXwBxJQuW8HEIq8MRsYvscAdzRDKCe4gekugMossaeLhK5jemMd
         rKefdJrSO0ugyHfbcbdAwqQCZnk7HPxB3ToIjay/KpAW5slr3YC/ULw4SsitH2vBGGU2
         ngY72D92oolvpN1Icbm4YkuYPbjdHJT9hJ0MPynp1rZZRLIDcMJC00P3v8ir5bHyfL1H
         ElcXyh8Dk1CR1/jiQ2yNL/jdbxuZk+KPklCo2A5Zp45wdFneoT9kG3rslJ5npU73T3U3
         98jA==
X-Forwarded-Encrypted: i=1; AJvYcCVOx1LzNbxZ866/FyK+2SFzJProdyHMS8xgAL6g3bPDcBQpti8QrwEuW+Hi4KiXfmfkqiuR7RAPGWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqqYN78Tuvvd8HZ2FR6u+4r9DCN07vZPimM7aRNmKj26YsQlUP
	ztXvI2NplMXjmg+3lCx4EvZRZoPOwNHby/5rudhYyKhPMYKfsnuaETpP/SaG6ZQ=
X-Gm-Gg: ASbGncuHaqEcd9uxrYhlbLGSjLZM++unTptyEPyY4ngRDNwTfE81OvB+DYNW2P/3TpL
	Z+nYlFUafKiVntLxoCCR/kKDcTUiNBeAKzxUcZaIyLWgRf4jqyJubfwprn6oJXDtDc6KdFK67Nz
	T6rQ3AxxivaY6dUOfVZoyL6FDTJCbtZ4X05Y+iXZJGubT3yZ8k0YWHgk9QyGiqNXQjUjMsXLHRE
	QBM+KyQk4+JNGFFWsCEvwmdDMNHCGs8jmwmAkz81wEQJJOzoG5fQdApIpyoGDqonZUXzJNUuv9a
	bOhmLHJSQ9t7vs4GtVSeptDRKSuG3pCs6VDesEcggSC9pUkFJTu8hwKcQqZ1O3lmBB10bxzhy7R
	GuTbmwQ==
X-Google-Smtp-Source: AGHT+IEsNj96Iroq0w9Ijl33CXf57djYDniySN+2kycTcj4Prjhezv9/VsJB03qzvuIsIdjbo1td7g==
X-Received: by 2002:a05:6000:1882:b0:3a1:f563:a057 with SMTP id ffacd0b85a97d-3a1f563a104mr4490246f8f.18.1746807278035;
        Fri, 09 May 2025 09:14:38 -0700 (PDT)
Message-ID: <70186bd9-20b6-48a2-9dd0-25cdc30e81f0@citrix.com>
Date: Fri, 9 May 2025 17:14:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 4:57 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
> index 28f57a74f2..8b46210768 100644
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -3,11 +3,73 @@
>  #define ASM__RISCV__P2M_H
>  
>  #include <xen/errno.h>
> +#include <xen/mem_access.h>
> +#include <xen/mm.h>
> +#include <xen/radix-tree.h>
> +#include <xen/rwlock.h>
> +#include <xen/types.h>

We're phasing out the inclusion of xen/types.h for complex headers like
this, as it's pulled in by almost all dependencies.

> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
> new file mode 100644
> index 0000000000..ad4beef8f9
> --- /dev/null
> +++ b/xen/arch/riscv/p2m.c
> @@ -0,0 +1,168 @@
> +#include <xen/domain_page.h>
> +#include <xen/iommu.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/pfn.h>
> +#include <xen/rwlock.h>
> +#include <xen/sched.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/page.h>
> +#include <asm/p2m.h>
> +
> +/*
> + * Force a synchronous P2M TLB flush.
> + *
> + * Must be called with the p2m lock held.
> + *
> + * TODO: add support of flushing TLB connected to VMID.
> + */
> +static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
> +{
> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    /*
> +     * TODO: shouldn't be this flush done for each physical CPU?
> +     *       If yes, then SBI call sbi_remote_hfence_gvma() could
> +     *       be used for that.
> +     */
> +#if defined(__riscv_hh) || defined(__riscv_h)
> +    asm volatile ( "hfence.gvma" ::: "memory" );
> +#else
> +    asm volatile ( ".insn r 0x73, 0x0, 0x31, x0, x0, x0" ::: "memory" );
> +#endif

TLB flushing needs to happen for each pCPU which potentially has cached
a mapping.

In other arches, this is tracked by d->dirty_cpumask which is the bitmap
of pCPUs where this domain is scheduled.

CPUs need to flush their TLBs before removing themselves from
d->dirty_cpumask, which is typically done during context switch, but it
means that to flush the P2M, you only need to IPI a subset of CPUs.


> +
> +    p2m->need_flush = false;
> +}
> +
> +static void p2m_tlb_flush_sync(struct p2m_domain *p2m)
> +{
> +    if ( p2m->need_flush )
> +        p2m_force_tlb_flush_sync(p2m);
> +}
> +
> +/* Unlock the flush and do a P2M TLB flush if necessary */
> +void p2m_write_unlock(struct p2m_domain *p2m)
> +{
> +    /*
> +     * The final flush is done with the P2M write lock taken to avoid
> +     * someone else modifying the P2M wbefore the TLB invalidation has
> +     * completed.
> +     */
> +    p2m_tlb_flush_sync(p2m);
> +
> +    write_unlock(&p2m->lock);
> +}
> +
> +static void clear_and_clean_page(struct page_info *page)
> +{
> +    void *p = __map_domain_page(page);
> +
> +    clear_page(p);
> +    unmap_domain_page(p);
> +}
> +
> +static struct page_info *p2m_get_clean_page(struct domain *d)
> +{
> +    struct page_info *page;
> +
> +    /*
> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
> +     * As explained in Section 18.5.1, for the paged virtual-memory schemes
> +     * (Sv32x4, Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB
> +     * and must be aligned to a 16-KiB boundary.
> +     */
> +    page = alloc_domheap_pages(NULL, 2, 0);
> +    if ( page == NULL )
> +        return NULL;
> +
> +    clear_and_clean_page(page);

You appear to have allocated 4 pages, but only zeroed one.

~Andrew

