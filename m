Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E33A197EB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 18:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876004.1286393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taenx-0002eC-EX; Wed, 22 Jan 2025 17:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876004.1286393; Wed, 22 Jan 2025 17:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taenx-0002dN-BW; Wed, 22 Jan 2025 17:46:17 +0000
Received: by outflank-mailman (input) for mailman id 876004;
 Wed, 22 Jan 2025 17:46:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYzQ=UO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taenw-0002dF-Ck
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 17:46:16 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b643a662-d8e8-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 18:45:47 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5db689a87cbso77039a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 09:45:47 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f223dcsm926998566b.123.2025.01.22.09.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 09:45:46 -0800 (PST)
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
X-Inumbo-ID: b643a662-d8e8-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737567947; x=1738172747; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=35X/Lm1Sw8kEIzs1tpQwWbVyenVhfCjmTR+f/Pr3sRE=;
        b=wJADaysaPtZAasHansq5ByveySZWMUzxSeMer4nWWs/C8p9WMVfOv+0SRvRK5AhiYV
         T7ZvlivxhoYFfwz/ikelfWDxQO4XjJa2o1ml27mhJ4mNWSkMpW+L5DQ4eaAFT3up+R3s
         S6vO6Giv81mX8Y8hz+9WgDSaDQ5FlP0erTqjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567947; x=1738172747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35X/Lm1Sw8kEIzs1tpQwWbVyenVhfCjmTR+f/Pr3sRE=;
        b=q/EORdX4uCqw/zm/GPPyPPFZZyID+6cbzcXwytMYYwyBFzEVTwRRGJ3rUUPCKR7O0/
         2Y3WFKqT9oeNWTOiy7RqHgSVJTzwV71kHe0b3XkkRx8EpnqtrIGj8bBv9jd6wyhhMey4
         VELIAt6FxA8ORPGKrZTBxdSI18eiPx6OuwbcjEgQadol08i4W3ErnGiWS95wbisKZeNf
         S0kTPx9nYNh7y5ZVjpTy1J99MIKrIm7wTsb+01Ct+jSgwqOtK2+pH4QeLqq6UTc9RS6+
         i5lI32Bw0owTKJtbINudUOg+QAIU9f7U2ugPJ67NZeG4dUBZ5gUO5WvV3yK90dMsbh54
         TmJw==
X-Gm-Message-State: AOJu0YzFubgPfYwsHDp7+GFVq7qXCUAvPIqDq7llO86RhyPSJS0AwD3Z
	lEK2RGh1oZhYcLtWSrdP29s4qA2MkD8KGM2BDEH+rIy36Qmv2uK1iddCl8+8BdU=
X-Gm-Gg: ASbGnctW3CgcAw4s4iKujTLOfPQOoOQeeWZ3QCqC+/4no+zgSlTVRs8AU2YN709Uf+7
	jS8tTb/Nm+IhWlbzaEuRBCWUUNNv8Q8FLDRPnWZob/2EaeTNqAZRA/Yprs5Y4OYW6hQt+zv2YTr
	oqcNpx+HV1nEihWsUb3u9QFAqvVndqKfG0K6SjVYkSpjI9NPf67tZYSRuO1ju2n8zjzxQxD+b76
	cjtquvgtJYVrSuwjfc2bplMCwDE4eG+Wjnn5KoTBYMGBvt4UHCbKm3bdXORyUYgfBjLcAKInkTE
	Qq/3
X-Google-Smtp-Source: AGHT+IH/D45BGwMiZmkbGM3czLY3pmdJQtJyHdVu9uf1cegfUURe/UlntRacHZVcTrdMSuDTZQZjiQ==
X-Received: by 2002:a17:907:3da4:b0:aa6:7933:8b31 with SMTP id a640c23a62f3a-ab38b3707bdmr2297719566b.46.1737567946758;
        Wed, 22 Jan 2025 09:45:46 -0800 (PST)
Date: Wed, 22 Jan 2025 18:45:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Manuel Andreas <manuel.andreas@tum.de>
Subject: Re: [PATCH v2 3/5] x86/HVM: correct read/write split at page
 boundaries
Message-ID: <Z5Euyc91PZsyMP6f@macbook.local>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <fde70079-4084-4aa6-b76e-becd62a71ddb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fde70079-4084-4aa6-b76e-becd62a71ddb@suse.com>

On Tue, Oct 01, 2024 at 10:49:40AM +0200, Jan Beulich wrote:
> The MMIO cache is intended to have one entry used per independent memory
> access that an insn does. This, in particular, is supposed to be
> ignoring any page boundary crossing. Therefore when looking up a cache
> entry, the access'es starting (linear) address is relevant, not the one
> possibly advanced past a page boundary.
> 
> In order for the same offset-into-buffer variable to be usable in
> hvmemul_phys_mmio_access() for both the caller's buffer and the cache
> entry's it is further necessary to have the un-adjusted caller buffer
> passed into there.
> 
> Fixes: 2d527ba310dc ("x86/hvm: split all linear reads and writes at page boundary")
> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This way problematic overlaps are only reduced (to ones starting at the
> same address), not eliminated: Assumptions in hvmemul_phys_mmio_access()
> go further - if a subsequent access is larger than an earlier one, but
> the splitting results in a chunk to cross the end "boundary" of the
> earlier access, an assertion will still trigger. Explicit memory
> accesses (ones encoded in an insn by explicit or implicit memory
> operands) match the assumption afaict (i.e. all those accesses are of
> uniform size, and hence they either fully overlap or are mapped to
> distinct cache entries).
> 
> Insns accessing descriptor tables, otoh, don't fulfill these
> expectations: The selector read (if coming from memory) will always be
> smaller than the descriptor being read, and if both (insanely) start at
> the same linear address (in turn mapping MMIO), said assertion will kick
> in. (The same would be true for an insn trying to access itself as data,
> as long as certain size "restrictions" between insn and memory operand
> are met. Except that linear_read() disallows insn fetches from MMIO.) To
> deal with such, I expect we will need to further qualify (tag) cache
> entries, such that reads/writes won't use insn fetch entries, and
> implicit-supervisor-mode accesses won't use entries of ordinary
> accesses. (Page table accesses don't need considering here for now, as
> our page walking code demands page tables to be mappable, implying
> they're in guest RAM; such accesses also don't take the path here.)
> Thoughts anyone, before I get to making another patch?
> 
> Considering the insn fetch aspect mentioned above I'm having trouble
> following why the cache has 3 entries. With insn fetches permitted,
> descriptor table accesses where the accessed bit needs setting may also
> fail because of that limited capacity of the cache, due to the way the
> accesses are done. The read and write (cmpxchg) are independent accesses
> from the cache's perspective, and hence we'd need another entry there.
> If, otoh, the 3 entries are there to account for precisely this (which
> seems unlikely with commit e101123463d2 ["x86/hvm: track large memory
> mapped accesses by buffer offset"] not saying anything at all), then we
> should be fine in this regard. If we were to permit insn fetches, which
> way to overcome this (possibly by allowing the write to re-use the
> earlier read's entry in this special situation) would remain to be
> determined.

I'm not that familiar with the emulator logic for memory accesses, but
it seems like we are adding more and more complexity and special
casing.  Maybe it's the only way to go forward, but I wonder if there
could be some other way to solve this.  However, I don't think I
will have time to look into it, and hence I'm not going to oppose to
your proposal.

Are there however some tests, possibly XTF, that we could use to
ensure the behavior of accesses is as we expect?

> 
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -31,8 +31,9 @@
>   * device-model transactions.
>   */
>  struct hvm_mmio_cache {
> -    unsigned long gla;
> -    unsigned int size;
> +    unsigned long gla;     /* Start of original access (e.g. insn operand) */
> +    unsigned int skip;     /* Offset to start of MMIO */
> +    unsigned int size;     /* Populated space, including @skip */
>      unsigned int space:31;
>      unsigned int dir:1;
>      uint8_t buffer[] __aligned(sizeof(long));
> @@ -953,6 +954,13 @@ static int hvmemul_phys_mmio_access(
>          return X86EMUL_UNHANDLEABLE;
>      }
>  
> +    /* Accesses must not be to the unused leading space. */
> +    if ( offset < cache->skip )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return X86EMUL_UNHANDLEABLE;
> +    }
> +
>      /*
>       * hvmemul_do_io() cannot handle non-power-of-2 accesses or
>       * accesses larger than sizeof(long), so choose the highest power
> @@ -1010,13 +1018,15 @@ static int hvmemul_phys_mmio_access(
>  
>  /*
>   * Multi-cycle MMIO handling is based upon the assumption that emulation
> - * of the same instruction will not access the same MMIO region more
> - * than once. Hence we can deal with re-emulation (for secondary or
> - * subsequent cycles) by looking up the result or previous I/O in a
> - * cache indexed by linear MMIO address.
> + * of the same instruction will not access the exact same MMIO region
> + * more than once in exactly the same way (if it does, the accesses will
> + * be "folded"). Hence we can deal with re-emulation (for secondary or
> + * subsequent cycles) by looking up the result of previous I/O in a cache
> + * indexed by linear address and access type.
>   */
>  static struct hvm_mmio_cache *hvmemul_find_mmio_cache(
> -    struct hvm_vcpu_io *hvio, unsigned long gla, uint8_t dir, bool create)
> +    struct hvm_vcpu_io *hvio, unsigned long gla, uint8_t dir,
> +    unsigned int skip)
>  {
>      unsigned int i;
>      struct hvm_mmio_cache *cache;
> @@ -1030,7 +1040,11 @@ static struct hvm_mmio_cache *hvmemul_fi
>              return cache;
>      }
>  
> -    if ( !create )
> +    /*
> +     * Bail if a new entry shouldn't be allocated, utilizing that ->space has
                                                      ^rely on ->space having ...
Would be easier to read IMO.

> +     * the same value for all entries.
> +     */
> +    if ( skip >= hvio->mmio_cache[0]->space )
>          return NULL;
>  
>      i = hvio->mmio_cache_count;
> @@ -1043,7 +1057,8 @@ static struct hvm_mmio_cache *hvmemul_fi
>      memset(cache->buffer, 0, cache->space);
>  
>      cache->gla = gla;
> -    cache->size = 0;
> +    cache->skip = skip;
> +    cache->size = skip;
>      cache->dir = dir;
>  
>      return cache;
> @@ -1064,12 +1079,14 @@ static void latch_linear_to_phys(struct
>  
>  static int hvmemul_linear_mmio_access(
>      unsigned long gla, unsigned int size, uint8_t dir, void *buffer,
> -    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt, bool known_gpfn)
> +    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
> +    unsigned long start, bool known_gpfn)

I think start is a bit ambiguous, start_gla might be clearer (same
below for the start parameter).

>  {
>      struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
>      unsigned long offset = gla & ~PAGE_MASK;
> -    struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, gla, dir, true);
> -    unsigned int chunk, buffer_offset = 0;
> +    unsigned int chunk, buffer_offset = gla - start;
> +    struct hvm_mmio_cache *cache = hvmemul_find_mmio_cache(hvio, start, dir,
> +                                                           buffer_offset);
>      paddr_t gpa;
>      unsigned long one_rep = 1;
>      int rc;
> @@ -1117,19 +1134,19 @@ static int hvmemul_linear_mmio_access(
>  static inline int hvmemul_linear_mmio_read(
>      unsigned long gla, unsigned int size, void *buffer,
>      uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
> -    bool translate)
> +    unsigned long start, bool translate)
>  {
>      return hvmemul_linear_mmio_access(gla, size, IOREQ_READ, buffer,
> -                                      pfec, hvmemul_ctxt, translate);
> +                                      pfec, hvmemul_ctxt, start, translate);
>  }
>  
>  static inline int hvmemul_linear_mmio_write(
>      unsigned long gla, unsigned int size, void *buffer,
>      uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
> -    bool translate)
> +    unsigned long start, bool translate)
>  {
>      return hvmemul_linear_mmio_access(gla, size, IOREQ_WRITE, buffer,
> -                                      pfec, hvmemul_ctxt, translate);
> +                                      pfec, hvmemul_ctxt, start, translate);
>  }
>  
>  static bool known_gla(unsigned long addr, unsigned int bytes, uint32_t pfec)
> @@ -1158,7 +1175,10 @@ static int linear_read(unsigned long add
>  {
>      pagefault_info_t pfinfo;
>      struct hvm_vcpu_io *hvio = &current->arch.hvm.hvm_io;
> +    void *buffer = p_data;
> +    unsigned long start = addr;
>      unsigned int offset = addr & ~PAGE_MASK;
> +    const struct hvm_mmio_cache *cache;
>      int rc;
>  
>      if ( offset + bytes > PAGE_SIZE )
> @@ -1182,8 +1202,17 @@ static int linear_read(unsigned long add
>       * an access that was previously handled as MMIO. Thus it is imperative that
>       * we handle this access in the same way to guarantee completion and hence
>       * clean up any interim state.
> +     *
> +     * Care must be taken, however, to correctly deal with crossing RAM/MMIO or
> +     * MMIO/RAM boundaries. While we want to use a single cache entry (tagged
> +     * by the starting linear address), we need to continue issuing (i.e. also
> +     * upon replay) the RAM access for anything that's ahead of or past MMIO,
> +     * i.e. in RAM.
>       */
> -    if ( !hvmemul_find_mmio_cache(hvio, addr, IOREQ_READ, false) )
> +    cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_READ, ~0);
> +    if ( !cache ||
> +         addr + bytes <= start + cache->skip ||
> +         addr >= start + cache->size )

Seeing as this bound checks is also used below, could it be a macro or
inline function?

is_cached() or similar?

Thanks, Roger.

