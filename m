Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2BB070C7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 10:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044965.1415011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxgX-0005wa-Ls; Wed, 16 Jul 2025 08:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044965.1415011; Wed, 16 Jul 2025 08:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxgX-0005uY-JB; Wed, 16 Jul 2025 08:40:17 +0000
Received: by outflank-mailman (input) for mailman id 1044965;
 Wed, 16 Jul 2025 08:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xldf=Z5=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ubxgV-0005uK-Fy
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 08:40:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d2b44c6-6220-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 10:40:13 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-tAwtWOV6OcaPZr5r1ifDNQ-1; Wed, 16 Jul 2025 04:40:09 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f65a705dso4133492f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 01:40:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:ed00:1769:dd7c:7208:eb33?
 (p200300d82f1ded001769dd7c7208eb33.dip0.t-ipconnect.de.
 [2003:d8:2f1d:ed00:1769:dd7c:7208:eb33])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e83c9edsm13968115e9.34.2025.07.16.01.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 01:40:06 -0700 (PDT)
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
X-Inumbo-ID: 7d2b44c6-6220-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752655212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSzSTiWWx3Mgn+kOlT8G5aG3zaow2wrPSmv/FVAPdmQ=;
	b=gLcfMHTzScgneghVj9ZDJ2FLiS7L0oyJ1Y5GfZ3d2TUGU77UQbsiPv7SvB2m31IcvaiVzF
	AT7SI/gEtdYoaxnoJXE4BJie4/VRyZvbMJdaBwXc6LnpWV55Hkt4Hz8fD05pk8Jvi7X2bV
	Hzq2a5uAolAnYEezHCoV363U3mX2/FA=
X-MC-Unique: tAwtWOV6OcaPZr5r1ifDNQ-1
X-Mimecast-MFC-AGG-ID: tAwtWOV6OcaPZr5r1ifDNQ_1752655208
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752655208; x=1753260008;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSzSTiWWx3Mgn+kOlT8G5aG3zaow2wrPSmv/FVAPdmQ=;
        b=xIMymgOUFSur4DlZ4ppz/qNHGZwfyP1xUuLy4hiWz0mNPbEBkzr2/5yGSckpT2HShS
         7nmsZIzU0DSJCGrizEy/bsKdDG/FhpDXGO/9Czi4qUaoJ81NzFqO+z0wpRRwm90xj0F9
         pa9YF/itWYkcZYJ2L8eta2V+cmKdP2nOgXOHoYd9X16hdNm2KTjm/hcQX5GFAZB3MAzh
         TDrJ6AcxbrdvsErKLG0jAOaXrlBkR3BCn0VAEVHG9ZUisl4Ra96q6jkzo6CW/efTATio
         vi4FFUPNvEHlzj3QKuNXzeHVSxmOAuEPwqqW04BrBDAlb1OXMKHaocrU5tq0N+ui6Hpa
         VlAw==
X-Forwarded-Encrypted: i=1; AJvYcCXbG7ebu3lFqsABEfDRvXqTORd4gGLrIthY0fdPJ4e3fJjkC/7iOX9T/hLqu3WLaqZeQ9C8PYDUII4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXwi/f2PSM324QlrgBFNTlsaKSGWWIULXuLgdoTTkjZv1wZ0I7
	BJTsiJQsmQuCLTvyX4w1t26M6hHVsYVwu9bCwk8k4BVyZbJqNNhZs4Wm7ooYYHbKW0jIH0ufh6e
	XGiX7+JIDbPTYeX81kLZphhaFb6GxCXMMSMd/gVODHvcmtVUiCdpcZla0VB3O75fd7E+d
X-Gm-Gg: ASbGnctOmSw7tBNd/eOf59IlH1QgfFvY5RNDxVnWuVJ07CK8o7Wsb2ymDfH26Upg4eD
	CWZ4iJ47OV6pzCHsPLcI8bYy5dJcigSMfWUFvM7PKNrh7axkn9+s5wiJmCuH58Z/5mlDBlcY1tc
	36B+wXlBY3Y+PazvN73jIzririg4S01K+kY2wpc3eJIgZIm1uvu8Soh8C8K2W++sQ7I9zhjpdNB
	YT9lX+DS5fU/AidKl7m2cdMulFILzi3zGUZ/m+kijHdqu/loIzS3lEI6zj39p1EhhmRBPnSsCnL
	+7meovvuz9dTLZSCTdnUqtN4Z4X4K3qNhttDCXe95uV4UYdkZF3Z8j1rHRxaHonycYCQonIJnRu
	c7sVKnTuWb/QNo36SPFnKcuE0266NWtQLtwXO7f2kYs7UlyZsyKN7fx7Pz3vFTyNcNlk=
X-Received: by 2002:a05:6000:22c6:b0:3a3:652d:1640 with SMTP id ffacd0b85a97d-3b60e4c9551mr1177306f8f.2.1752655207725;
        Wed, 16 Jul 2025 01:40:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrz7aA1Q5DJ0qrWg414nemqw3+E5uTkk/vafPidGzJJcoZYuxj+80SlJoZCzlNz1Q/6bN5bQ==
X-Received: by 2002:a05:6000:22c6:b0:3a3:652d:1640 with SMTP id ffacd0b85a97d-3b60e4c9551mr1177269f8f.2.1752655207170;
        Wed, 16 Jul 2025 01:40:07 -0700 (PDT)
Message-ID: <e92b75d4-999b-4b0f-b62f-9edca09834c4@redhat.com>
Date: Wed, 16 Jul 2025 10:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] mm/memory: convert print_bad_pte() to
 print_bad_page_map()
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>, Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250715132350.2448901-1-david@redhat.com>
 <20250715132350.2448901-7-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20250715132350.2448901-7-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6KBH73RmV5kpIrCCtl_fB-9uSICB7-NsapEhCbzH40w_1752655208
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.07.25 15:23, David Hildenbrand wrote:
> print_bad_pte() looks like something that should actually be a WARN
> or similar, but historically it apparently has proven to be useful to
> detect corruption of page tables even on production systems -- report
> the issue and keep the system running to make it easier to actually detect
> what is going wrong (e.g., multiple such messages might shed a light).
> 
> As we want to unify vm_normal_page_*() handling for PTE/PMD/PUD, we'll have
> to take care of print_bad_pte() as well.
> 
> Let's prepare for using print_bad_pte() also for non-PTEs by adjusting the
> implementation and renaming the function -- we'll rename it to what
> we actually print: bad (page) mappings. Maybe it should be called
> "print_bad_table_entry()"? We'll just call it "print_bad_page_map()"
> because the assumption is that we are dealing with some (previously)
> present page table entry that got corrupted in weird ways.
> 
> Whether it is a PTE or something else will usually become obvious from the
> page table dump or from the dumped stack. If ever required in the future,
> we could pass the entry level type similar to "enum rmap_level". For now,
> let's keep it simple.
> 
> To make the function a bit more readable, factor out the ratelimit check
> into is_bad_page_map_ratelimited() and place the dumping of page
> table content into __dump_bad_page_map_pgtable(). We'll now dump
> information from each level in a single line, and just stop the table
> walk once we hit something that is not a present page table.
> 
> Use print_bad_page_map() in vm_normal_page_pmd() similar to how we do it
> for vm_normal_page(), now that we have a function that can handle it.
> 
> The report will now look something like (dumping pgd to pmd values):
> 
> [   77.943408] BUG: Bad page map in process XXX  entry:80000001233f5867
> [   77.944077] addr:00007fd84bb1c000 vm_flags:08100071 anon_vma: ...
> [   77.945186] pgd:10a89f067 p4d:10a89f067 pud:10e5a2067 pmd:105327067
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/memory.c | 120 ++++++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 94 insertions(+), 26 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index a4f62923b961c..00ee0df020503 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -479,22 +479,8 @@ static inline void add_mm_rss_vec(struct mm_struct *mm, int *rss)
>   			add_mm_counter(mm, i, rss[i]);
>   }
>   
> -/*
> - * This function is called to print an error when a bad pte
> - * is found. For example, we might have a PFN-mapped pte in
> - * a region that doesn't allow it.
> - *
> - * The calling function must still handle the error.
> - */
> -static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
> -			  pte_t pte, struct page *page)
> +static bool is_bad_page_map_ratelimited(void)
>   {
> -	pgd_t *pgd = pgd_offset(vma->vm_mm, addr);
> -	p4d_t *p4d = p4d_offset(pgd, addr);
> -	pud_t *pud = pud_offset(p4d, addr);
> -	pmd_t *pmd = pmd_offset(pud, addr);
> -	struct address_space *mapping;
> -	pgoff_t index;
>   	static unsigned long resume;
>   	static unsigned long nr_shown;
>   	static unsigned long nr_unshown;
> @@ -506,7 +492,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>   	if (nr_shown == 60) {
>   		if (time_before(jiffies, resume)) {
>   			nr_unshown++;
> -			return;
> +			return true;
>   		}
>   		if (nr_unshown) {
>   			pr_alert("BUG: Bad page map: %lu messages suppressed\n",
> @@ -517,15 +503,87 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>   	}
>   	if (nr_shown++ == 0)
>   		resume = jiffies + 60 * HZ;
> +	return false;
> +}
> +
> +static void __dump_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
> +{
> +	unsigned long long pgdv, p4dv, pudv, pmdv;
> +	pgd_t pgd, *pgdp;
> +	p4d_t p4d, *p4dp;
> +	pud_t pud, *pudp;
> +	pmd_t *pmdp;
> +
> +	/*
> +	 * This looks like a fully lockless walk, however, the caller is
> +	 * expected to hold the leaf page table lock in addition to other
> +	 * rmap/mm/vma locks. So this is just a re-walk to dump page table
> +	 * content while any concurrent modifications should be completely
> +	 * prevented.
> +	 */
> +	pgdp = pgd_offset(mm, addr);
> +	pgd = pgdp_get(pgdp);
> +	pgdv = pgd_val(pgd);

Apparently there is something weird here on arm-bcm2835_defconfig:

All errors (new ones prefixed by >>):

 >> mm/memory.c:525:6: error: array type 'pgd_t' (aka 'unsigned int[2]') 
is not assignable
      525 |         pgd = pgdp_get(pgdp);
          |         ~~~ ^
    1 error generated.

... apparently because we have this questionable ...

arch/arm/include/asm/pgtable-2level-types.h:typedef pmdval_t pgd_t[2];

I mean, the whole concept of pgdp_get() doesn't make too much sense if 
it wants to return an array.

I don't quite understand the "#undef STRICT_MM_TYPECHECKS #ifdef 
STRICT_MM_TYPECHECKS" stuff.

Why do we want to make it easier on the compiler while doing something 
fairly weird?

CCing arm maintainers: what's going on here? :)

An easy fix would be to not dump the pgd value, but having a 
non-functional pgdp_get() really is weird.

-- 
Cheers,

David / dhildenb


