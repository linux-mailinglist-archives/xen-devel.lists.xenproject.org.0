Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B591AB8388
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985140.1371077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVSV-0006tI-Pv; Thu, 15 May 2025 10:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985140.1371077; Thu, 15 May 2025 10:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVSV-0006r8-N2; Thu, 15 May 2025 10:04:59 +0000
Received: by outflank-mailman (input) for mailman id 985140;
 Thu, 15 May 2025 10:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFVST-0006r2-Sd
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:04:57 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cbdc55b-3174-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 12:04:54 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad51ba0af48so62479066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:04:54 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad21f2145d6sm1049688166b.95.2025.05.15.03.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:04:53 -0700 (PDT)
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
X-Inumbo-ID: 0cbdc55b-3174-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747303494; x=1747908294; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1EiFZSk7YxyIKZ3rKPdt3+1uIek19CdmA9y/W1+PFk=;
        b=nZ5J4GnKBoTOfUeW8QG5Xve89qf8EmXkK10UYr13t4TWt0TXTgv7s1RFYNqxBKgHD2
         tMfv22kSWxrjnEty5n5QUhIJ4p7mxkhGzVIWsJo3rMeh8o31bJhoTvbSNowFTV3lnLl/
         iL3UM7g6e0UbOHLXEUzw+ahtJ7HtQFvuMnces=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747303494; x=1747908294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1EiFZSk7YxyIKZ3rKPdt3+1uIek19CdmA9y/W1+PFk=;
        b=fJYBaL8AnFsetXl32jAUHYR/rPYqE7AiVjQT0BIOcixi7PwAm4i5XrkJK0KT8/ZkRr
         +GqT/ewOHrbbPsCAye0MhEFq6c9hmLz7HtKcbfu4tCyx0xFNz4u8+5WcaPWECiVsU/oa
         bykc3kbE5+0+4m3AatIgGIn753sysHS1bdr8N/QvLOgat+DaFJQBByt1MRiO/NS3R29s
         bP71oOnifF5tMgFlybt7RxKxinazRjWfKVUdvxt+kRC/tC1+Ac3SwJAf77zibYCarcTT
         HdxmfMGW6W4ZsfcKL0g1JDctI9wsvqBX6WXPzT30k7SKIXMcJ1BkfUTFuy+jPwJJUmg7
         X4Gg==
X-Gm-Message-State: AOJu0Yw1XJ6ADmeEq/cTpdlIHUE8jwfOOGaR1hynHIF+jD+o17X4JANO
	pHxyYeE4yrEOOSNL8JSLYREoV1l19akmUkaJZziV1hagAkfwC3dzpqjVL0yUXmmOSkY=
X-Gm-Gg: ASbGncukk1W1r/kr6lPVge8AhV/v3/SpBhtrMfOPfsKy0aYFI1AHE6SUhc+55A6Hf7a
	YSAadgeKny9HKJzY/bBwQ8VWnz6RtBSj/5I9kLNoK/B6lSklQhfz6L1YDCqu3OJTWWfP3JuIxnk
	jRZMkvhoPadz0EIN3wof70WGyF2aYduQ1uiARftB8rUViYlnasy+NGO0A1pIsKI/2NcmvVRbbKN
	gDUvkhzDPRUNLKTj2/YPkc8E8KqVCiY5xjzjQ3CU/Mg7uQR3WslSnhSQpm0TldgN2zxx+JlNAGW
	dhKyknuomUMQOh8zgrMnCSAxkRHS5a3hiOxXOGwyFfW/9n43+/BHEzkQ
X-Google-Smtp-Source: AGHT+IHv2A0WoEXFWc1D7d8HzAu4V982lFbmTcduASSjtx8vH44LKy9axbVEfiOoH4II8F4LCuTTbA==
X-Received: by 2002:a17:907:9712:b0:ad1:ff5f:1460 with SMTP id a640c23a62f3a-ad50f611e40mr321007666b.6.1747303494345;
        Thu, 15 May 2025 03:04:54 -0700 (PDT)
Date: Thu, 15 May 2025 12:04:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/HVM: restrict use of pinned cache attributes as well
 as associated flushing
Message-ID: <aCW8RKZZCkvCuw5W@macbook.lan>
References: <42d40da1-bc38-82fb-154a-e1fc876b0c24@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42d40da1-bc38-82fb-154a-e1fc876b0c24@suse.com>

On Wed, Mar 22, 2023 at 07:50:09AM +0100, Jan Beulich wrote:
> We don't permit use of uncachable memory types elsewhere unless a domain
> meets certain criteria. Enforce this also during registration of pinned
> cache attribute ranges.
> 
> Furthermore restrict cache flushing to just uncachable range registration.
> While there, also
> - take CPU self-snoop as well as IOMMU snoop into account (albeit the
>   latter still is a global property rather than a per-domain one),
> - avoid flushes when the domain isn't running yet (which ought to be the
>   common case).
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> At the expense of yet larger a diff it would be possible to get away
> without any "goto", by moving the whole "new entry" handling into the
> switch(). Personally I'd prefer that, but the larger diff may be
> unwelcome.
> 
> I have to admit that I can't spot what part of epte_get_entry_emt() the
> comment refers to that is being deleted. The function does use
> hvm_get_mem_pinned_cacheattr(), yes, but there's nothing there that talks
> about cache flushes (and their avoiding) in any way.
> 
> Is it really sensible to add/remove ranges once the guest is already
> running? (If it is, limiting the scope of the flush would be nice, but
> would require knowing dirtyness for the domain wrt the caches, which
> currently we don't track.)
> 
> This is kind of amending XSA-428.
> 
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -589,6 +589,7 @@ int hvm_set_mem_pinned_cacheattr(struct
>  {
>      struct hvm_mem_pinned_cacheattr_range *range, *newr;
>      unsigned int nr = 0;
> +    bool flush = false;
>      int rc = 1;
>  
>      if ( !is_hvm_domain(d) )
> @@ -612,31 +613,35 @@ int hvm_set_mem_pinned_cacheattr(struct
>  
>                  type = range->type;
>                  call_rcu(&range->rcu, free_pinned_cacheattr_entry);
> -                p2m_memory_type_changed(d);
>                  switch ( type )
>                  {
> -                case X86_MT_UCM:
> +                case X86_MT_WB:
> +                case X86_MT_WP:
> +                case X86_MT_WT:
>                      /*
> -                     * For EPT we can also avoid the flush in this case;
> -                     * see epte_get_entry_emt().
> +                     * Flush since we don't know what the cachability is going
> +                     * to be.
>                       */
> -                    if ( hap_enabled(d) && cpu_has_vmx )
> -                case X86_MT_UC:
> -                        break;
> -                    /* fall through */
> -                default:
> -                    flush_all(FLUSH_CACHE);
> +                    if ( is_iommu_enabled(d) || cache_flush_permitted(d) )
> +                        flush = true;
>                      break;
>                  }
> -                return 0;
> +                rc = 0;
> +                goto finish;
>              }
>          domain_unlock(d);
>          return -ENOENT;
>  
>      case X86_MT_UCM:
>      case X86_MT_UC:
> -    case X86_MT_WB:
>      case X86_MT_WC:
> +        /* Flush since we don't know what the cachability was. */
> +        if ( !is_iommu_enabled(d) && !cache_flush_permitted(d) )
> +            return -EPERM;
> +        flush = true;
> +        break;
> +
> +    case X86_MT_WB:
>      case X86_MT_WP:
>      case X86_MT_WT:
>          break;
> @@ -689,8 +694,12 @@ int hvm_set_mem_pinned_cacheattr(struct
>  
>      xfree(newr);
>  
> + finish:
>      p2m_memory_type_changed(d);
> -    if ( type != X86_MT_WB )
> +
> +    if ( flush && d->creation_finished &&
> +         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
> +          (is_iommu_enabled(d) && !iommu_snoop)) )
>          flush_all(FLUSH_CACHE);

I think it would be better if we could add those checks to
memory_type_changed() rather than open-coding them here, and just call
memory_type_changed() then, which would also avoid the goto AFAICT.

Thanks, Roger.

