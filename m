Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B1EAB5579
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982808.1369162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpGl-0004g3-Vg; Tue, 13 May 2025 13:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982808.1369162; Tue, 13 May 2025 13:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpGl-0004dL-SN; Tue, 13 May 2025 13:02:03 +0000
Received: by outflank-mailman (input) for mailman id 982808;
 Tue, 13 May 2025 13:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dY5U=X5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEpGk-0004dD-MU
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:02:02 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7579791e-2ffa-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 15:02:01 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2301ac32320so22155955ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 06:02:01 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22fc82a16basm80004475ad.230.2025.05.13.06.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 06:01:59 -0700 (PDT)
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
X-Inumbo-ID: 7579791e-2ffa-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747141320; x=1747746120; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lc3BOQgtPalWPQo2SYdws3VVJyyUIiwl4Eaj0tViT5k=;
        b=NEGL4X5QuqN8cPvUZImTa4K75/WYkXKQlstTnO0s5y4OZQ4jCbRfVjW5FMSTfPONZX
         HYttMI5bSW50Hblr+QS41jfsxf0JduD/KWNqZW+j/U3geX0feNXfXV8kRgsTjwHRjURR
         mcOYde72e8Vjgp9GW85P6dVprQz1gOSC1wzJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141320; x=1747746120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lc3BOQgtPalWPQo2SYdws3VVJyyUIiwl4Eaj0tViT5k=;
        b=YnVcc1ljT7b3GVfm16jdsGoRaPHQwfhQbgtPqWKSmvz4lYcFkxnP8E7Othiewtb+H5
         fhbslq46q67XYDWblvTVbu2QpEcDK4aKgmI0bPdGdwU0m2oELhRbmO3kkYIZaNulYZAJ
         WuowbhJLWxp3c9QOvplStZYq3+7+xrPAnzYYQLqVaiX5A3Mxxdmx+cpZ1dG6qnXS+I/l
         B1jFNJsR4ER2TvcexX0wkSopGQ3E441Qqa1Z1VSfiWFin4zQgIEknVvcv9yr25M4ulkg
         2ZhNOgdMcMWkwrO57jrHgS6amuHz4kEwNPR8ptxcerqnY4rPGB2ViRsv9VY1SYLKOI6Z
         TVzg==
X-Gm-Message-State: AOJu0YwAPHxE0MqFhLLUgJ6rjFRmMUJ5KURh3OY/UyY4JG+wu8GJYcgg
	J0cxyBqZAUAiboTFv2JwSQciUws207DEg+1AhvBDM2CpI/ehNGp02Q9T3m/Q9ZU=
X-Gm-Gg: ASbGncuBMYoLZyQW/GrLhHiDxkG8vgeBUSBeFRx1U+0qYfxmMP0zvOJbg74FmZraIhp
	fZEog69szTuA5AqbL060Sodx11O+OWVB3MvrA1PBYzwEqbg0cRoYpFDS2EPazthOJfjgLGKQHCM
	ZZWWCwvQoU0MsMkWrEhMLJ0mqK5STYQ2AcNSQ6jzA1LNGDVEy/KqBQpaccgQgPaMNwrb0ZRFoBi
	qL2XaUTS+OVouPK1jZi1N1/Rlbyw1dbjpu0NqBw90RSERX5YGeh5/yhro7Nt4tOIAH5hMymRsCI
	FgxTG5Qt2TYzmdeD1+RZUlAC81LXblj6ju6oPNOqoQ9lji+IyL5C8/1fqpyBrA==
X-Google-Smtp-Source: AGHT+IHgAhPx5do4QHswfjkdmFRUXRGa5Si/o37pZLP+q8VQckuelOUeZwBMJn2v5Hr8IQu/tHvMQg==
X-Received: by 2002:a17:902:ce12:b0:223:3396:15e8 with SMTP id d9443c01a7336-22fc8b6cbd0mr303518315ad.22.1747141320055;
        Tue, 13 May 2025 06:02:00 -0700 (PDT)
Date: Tue, 13 May 2025 15:01:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/6] x86: support cache-writeback in
 flush_area_local() et al
Message-ID: <aCNCwkGbhj-uy-vD@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <e27ff909-93d1-b51b-ac88-20b17f5cf642@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e27ff909-93d1-b51b-ac88-20b17f5cf642@suse.com>

On Wed, May 03, 2023 at 11:44:39AM +0200, Jan Beulich wrote:
> The majority of the present callers really aren't after invalidating
> cache contents, but only after writeback. Make this available by simply
> extending the FLUSH_CACHE handling accordingly. No feature checks are
> required here: cache_writeback() falls back to cache_flush() as
> necessary, while WBNOINVD degenerates to WBINVD on older hardware.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: FLUSH_WRITEBACK -> FLUSH_CACHE_WRITEBACK.
> 
> --- a/xen/arch/x86/flushtlb.c
> +++ b/xen/arch/x86/flushtlb.c
> @@ -232,7 +232,7 @@ unsigned int flush_area_local(const void
>      if ( flags & FLUSH_HVM_ASID_CORE )
>          hvm_flush_guest_tlbs();
>  
> -    if ( flags & FLUSH_CACHE )
> +    if ( flags & (FLUSH_CACHE | FLUSH_CACHE_WRITEBACK) )
>      {
>          const struct cpuinfo_x86 *c = &current_cpu_data;
>          unsigned long sz = 0;
> @@ -245,13 +245,16 @@ unsigned int flush_area_local(const void
>               c->x86_clflush_size && c->x86_cache_size && sz &&
>               ((sz >> 10) < c->x86_cache_size) )
>          {
> -            cache_flush(va, sz);
> -            flags &= ~FLUSH_CACHE;
> +            if ( flags & FLUSH_CACHE )
> +                cache_flush(va, sz);
> +            else
> +                cache_writeback(va, sz);
> +            flags &= ~(FLUSH_CACHE | FLUSH_CACHE_WRITEBACK);
>          }
> -        else
> -        {
> +        else if ( flags & FLUSH_CACHE )
>              wbinvd();
> -        }
> +        else
> +            wbnoinvd();
>      }
>  
>      if ( flags & FLUSH_ROOT_PGTBL )
> --- a/xen/arch/x86/include/asm/flushtlb.h
> +++ b/xen/arch/x86/include/asm/flushtlb.h
> @@ -135,6 +135,8 @@ void switch_cr3_cr4(unsigned long cr3, u
>  #else
>  # define FLUSH_NO_ASSIST 0
>  #endif
> + /* Write back data cache contents */
> +#define FLUSH_CACHE_WRITEBACK  0x10000
>  
>  /* Flush local TLBs/caches. */
>  unsigned int flush_area_local(const void *va, unsigned int flags);
> @@ -194,7 +196,11 @@ static inline int clean_and_invalidate_d
>  }
>  static inline int clean_dcache_va_range(const void *p, unsigned long size)
>  {
> -    return clean_and_invalidate_dcache_va_range(p, size);
> +    unsigned int order = get_order_from_bytes(size);
> +
> +    /* sub-page granularity support needs to be added if necessary */
> +    flush_area_local(p, FLUSH_CACHE_WRITEBACK | FLUSH_ORDER(order));
> +    return 0;
>  }

I'm planning to get rid of the clean_dcache_va_range() helper on x86,
but I don't want to force you to rebase on top of that.

Thanks, Roger.

