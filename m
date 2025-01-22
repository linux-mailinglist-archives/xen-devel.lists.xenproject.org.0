Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568FA1910F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 13:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875903.1286308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taZPA-0005Rk-Oo; Wed, 22 Jan 2025 12:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875903.1286308; Wed, 22 Jan 2025 12:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taZPA-0005Ot-LN; Wed, 22 Jan 2025 12:00:20 +0000
Received: by outflank-mailman (input) for mailman id 875903;
 Wed, 22 Jan 2025 12:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYzQ=UO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taZP9-0005Oh-2j
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 12:00:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e15ec9-d8b8-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 13:00:16 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab39f84cbf1so868767466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 04:00:16 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c56fc9sm910060966b.14.2025.01.22.04.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 04:00:15 -0800 (PST)
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
X-Inumbo-ID: 71e15ec9-d8b8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737547216; x=1738152016; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3myN014Aqnv4wVHqpthFcYH4tQfPzWvxstnSnEWD1Fo=;
        b=obpyYE5goX9Kl427AV4FTDPC9/42QU3TzhiUp2o3dYG2O33FwGipusIO9EpeGWrv6O
         7WIZ+cNgcJICBNL4nZIUPwFoPnUrEC6bi8kUidBsLPEVF6VLSxoskjecNqYyvDw5h/D7
         CVydFDzBtiieQvjWsJqBkD8Hb1kY6ds2KgeE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737547216; x=1738152016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3myN014Aqnv4wVHqpthFcYH4tQfPzWvxstnSnEWD1Fo=;
        b=q9D3PxuAZlLWKInlUZh61Ip7Bu4lWIM9erzebPrE36VH36oNHq59spsFzvzcpGT2co
         Sif8iI0tleJMI7z+ZRZ9Mp4zUKTVrDoDIoQXmy8OlECO2/AnTvV2oGTnaunRrl6nZ2uI
         QdtQXnHiJx9gMRCRzXxhwoGEBs0I910BdWZQyV4UBrTaH2itTPb6tOxvKVSzOlrZpLfz
         wnq2e/tUoJN0Tt+rFE7yQpTLWGRmi8SA5tDJirTKESG5GI42uTqqk8FxDuN6dsosfS4U
         Zx5amSBSm/L0rhAURcdlL8H5vmQMpvbhtaJEcTjoAsEv6dJ4rk2hxIqr7wWKFRoVbW7j
         gBig==
X-Gm-Message-State: AOJu0YzV9AUQyfkfxh/eF3IxJcAnegIa9UW4XlYBg2ir/FMGMBE1RztV
	AWOTQX0QZoOqEmx45XoXug+EGDA7SmFEVsCPc5jFCDoRuvEbpvENr6n1ZRPAtAKZw9K1ZCt0TiU
	3
X-Gm-Gg: ASbGncv85NRYK14lBtaFb/fWkpbagqNW4D/wuP7DhRWcqsMub6P0QQXpZzDVq/gdpco
	b9tii6OaT7zCbo0CkNVoWR0bViO3VKb5IbzZUBazE+Gu+vSXGx3IILNeLtFpo49vrzwWKu648hd
	bJcpLtYEe8sCjhdHRLH6xI53XDeEFVFDVawHBvaTC8AVRbJzZvj7gXg9habLwKmvcRRHmTuFl07
	a2VkiDuHYC8HkvXrTHmrkAuzTpFM+UHpWryri7hjTa0eqjSlqFmt1sZa8sKtgiLkjnVZ+g9MCGR
	SAM6
X-Google-Smtp-Source: AGHT+IGY+OWgIP7COSfUTRVofSe4SEhbeMlE7xr3ttJ9YDEGYYumHF8golmYLkERHWOJK3aj+BexCw==
X-Received: by 2002:a17:907:1b15:b0:ab6:53fb:9683 with SMTP id a640c23a62f3a-ab653fba885mr230447166b.54.1737547216328;
        Wed, 22 Jan 2025 04:00:16 -0800 (PST)
Date: Wed, 22 Jan 2025 13:00:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/5] x86/HVM: allocate emulation cache entries
 dynamically
Message-ID: <Z5Ddzh-Ygy5cGuPj@macbook.local>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <93967ab8-a472-475a-bdd6-41dfc3afa895@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93967ab8-a472-475a-bdd6-41dfc3afa895@suse.com>

On Tue, Oct 01, 2024 at 10:49:10AM +0200, Jan Beulich wrote:
> Both caches may need higher capacity, and the upper bound will need to
> be determined dynamically based on CPUID policy (for AMX'es TILELOAD /
> TILESTORE at least).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Just a couple of comments below.

> ---
> This is a patch taken from the AMX series, but wasn't part of the v3
> submission. All I did is strip out the actual AMX bits (from
> hvmemul_cache_init()), plus of course change the description. As a
> result some local variables there may look unnecessary, but this way
> it's going to be less churn when the AMX bits are added. The next patch
> pretty strongly depends on the changed approach (contextually, not so
> much functionally), and I'd really like to avoid rebasing that one ahead
> of this one, and then this one on top of that.

Oh, I was just going to ask about the weirdness of nents compared to
what was previously.

> 
> TBD: For AMX hvmemul_cache_init() will become CPUID policy dependent. We
>      could of course take the opportunity and also reduce overhead when
>      AVX-512 (and maybe even AVX) is unavailable (in the future: to the
>      guest).
> ---
> v2: Split off cache bounds check fix.
> 
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -26,6 +26,18 @@
>  #include <asm/iocap.h>
>  #include <asm/vm_event.h>
>  
> +/*
> + * We may read or write up to m512 or up to a tile row as a number of
> + * device-model transactions.
> + */
> +struct hvm_mmio_cache {
> +    unsigned long gla;
> +    unsigned int size;
> +    unsigned int space:31;

Having size and space is kind of confusing, would you mind adding a
comment that size is the runtime consumed buffer space, while space is
the total allocated buffer size (and hence not supposed to change
during usage)?

> +    unsigned int dir:1;
> +    uint8_t buffer[] __aligned(sizeof(long));
> +};
> +
>  struct hvmemul_cache
>  {
>      /* The cache is disabled as long as num_ents > max_ents. */
> @@ -935,7 +947,7 @@ static int hvmemul_phys_mmio_access(
>      }
>  
>      /* Accesses must not overflow the cache's buffer. */
> -    if ( offset + size > sizeof(cache->buffer) )
> +    if ( offset + size > cache->space )
>      {
>          ASSERT_UNREACHABLE();
>          return X86EMUL_UNHANDLEABLE;
> @@ -1011,7 +1023,7 @@ static struct hvm_mmio_cache *hvmemul_fi
>  
>      for ( i = 0; i < hvio->mmio_cache_count; i ++ )
>      {
> -        cache = &hvio->mmio_cache[i];
> +        cache = hvio->mmio_cache[i];
>  
>          if ( gla == cache->gla &&
>               dir == cache->dir )
> @@ -1027,10 +1039,11 @@ static struct hvm_mmio_cache *hvmemul_fi
>  
>      ++hvio->mmio_cache_count;
>  
> -    cache = &hvio->mmio_cache[i];
> -    memset(cache, 0, sizeof (*cache));
> +    cache = hvio->mmio_cache[i];
> +    memset(cache->buffer, 0, cache->space);
>  
>      cache->gla = gla;
> +    cache->size = 0;
>      cache->dir = dir;
>  
>      return cache;
> @@ -2978,16 +2991,21 @@ void hvm_dump_emulation_state(const char
>  int hvmemul_cache_init(struct vcpu *v)
>  {
>      /*
> -     * No insn can access more than 16 independent linear addresses (AVX512F
> -     * scatters/gathers being the worst). Each such linear range can span a
> -     * page boundary, i.e. may require two page walks. Account for each insn
> -     * byte individually, for simplicity.
> +     * AVX512F scatter/gather insns can access up to 16 independent linear
> +     * addresses, up to 8 bytes size. Each such linear range can span a page
> +     * boundary, i.e. may require two page walks.
> +     */
> +    unsigned int nents = 16 * 2 * (CONFIG_PAGING_LEVELS + 1);
> +    unsigned int i, max_bytes = 64;
> +    struct hvmemul_cache *cache;
> +
> +    /*
> +     * Account for each insn byte individually, both for simplicity and to
> +     * leave some slack space.
>       */
> -    const unsigned int nents = (CONFIG_PAGING_LEVELS + 1) *
> -                               (MAX_INST_LEN + 16 * 2);
> -    struct hvmemul_cache *cache = xmalloc_flex_struct(struct hvmemul_cache,
> -                                                      ents, nents);
> +    nents += MAX_INST_LEN * (CONFIG_PAGING_LEVELS + 1);
>  
> +    cache = xvmalloc_flex_struct(struct hvmemul_cache, ents, nents);

Change here seems completely unrelated, but I guess this is what you
refer to in the post-commit remark.  IOW: the split of the nents
variable setup, plus the change of xmalloc_flex_struct() ->
xvmalloc_flex_struct() don't seem to be related to the change at
hand.

>      if ( !cache )
>          return -ENOMEM;
>  
> @@ -2997,6 +3015,15 @@ int hvmemul_cache_init(struct vcpu *v)
>  
>      v->arch.hvm.hvm_io.cache = cache;
>  
> +    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
> +    {
> +        v->arch.hvm.hvm_io.mmio_cache[i] =
> +            xmalloc_flex_struct(struct hvm_mmio_cache, buffer, max_bytes);

TBH I would be tempted to just use xvmalloc here also, even if the
structure is never going to be > PAGE_SIZE, it's more consistent IMO.

Thanks, Roger.

