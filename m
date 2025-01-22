Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A5A197F1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 18:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876013.1286403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taepJ-0003Ai-O5; Wed, 22 Jan 2025 17:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876013.1286403; Wed, 22 Jan 2025 17:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taepJ-00038B-KP; Wed, 22 Jan 2025 17:47:41 +0000
Received: by outflank-mailman (input) for mailman id 876013;
 Wed, 22 Jan 2025 17:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYzQ=UO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taepI-000381-1p
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 17:47:40 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8ce53b0-d8e8-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 18:47:39 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so69407a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 09:47:39 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db7364258csm8707206a12.1.2025.01.22.09.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 09:47:38 -0800 (PST)
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
X-Inumbo-ID: f8ce53b0-d8e8-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737568058; x=1738172858; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DeQjUUicbBqviSksbyHebDo61aD1lEGSAwrEn+EfYoM=;
        b=LwNOGp8ykLPyrP223DZ+F/K0lFP4t31ts+q2849UcTUE8qR4yUJX4ebjh/FlbhvZDc
         chsQyp6HG7nuMi2HkeMHd2Fga0I8D/yhfzWopy8bMVD3+np5tF1/FlQPnR3VC8pHvFNu
         3PKuqL/XdfHupzY/rRI/qxfl+F898AyrnreX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737568058; x=1738172858;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeQjUUicbBqviSksbyHebDo61aD1lEGSAwrEn+EfYoM=;
        b=D7BqRnIrp+y3iQnMy4pVkKEpRfSa5KZifFi6/cu4z/udVtOF+9udxJ0sdfe7XcANdI
         vdrq8yR1fHF5O/veQvn6Ee+Kg8uxREfXJkf/kVq0fYjp8CMy5KJZXZX835MFPYdYo23j
         lD5WjeZjVxlHEhH/86SioEDYuKIB5HE0cYTk0dognHSn8pLVucf/clZ6ZfPB//IN78/+
         miUK6/XO2UH8RhwSX/E/kdo07wuyf5Z7AakBRu2qZ8iJCSIrkD6GMmZOAb2jpR5qUdcr
         B4GzgyC3rtWwSXLwlYbsUlRBo+e61zjVB4D1f5h3OChlU9XpaHX5dibQcPwpepM8Q61g
         l92A==
X-Gm-Message-State: AOJu0Yw/CZzEwBQWe/n6ch9gkBKu5e1XWe213VlYbBVJmW3byfPcogIG
	wFKPp1+tH11UX7Y/QhcPIWGHyVn/5y6E4EfxKZruXopbE4MuKU15wM7fczl0bR/ehFWuX1Yl0MI
	3
X-Gm-Gg: ASbGnctiAMOo8/mdWxxSc2GJiyyX9iJmSBYpzy2I7HqB2AEJ2vDI1q3zvRV3MxJRmi9
	teHhmJnZ6nGEsaQDtSoW4Yp+XcBjyJ7LJIkipAO4DPrmOaku4xrs/HHZg1egx9bHBYryqrQR6OR
	EFiETTI07DI2jDGYxSFVQtYehJccdoZVfSsSeozIzX0cDsm1BYmujY89+EMLwIvu1A/riEarpN+
	ZN4m56SLZCddUp8hb0y2B6248MHKQq7CZ3ceZJTSVMr0RIZTmd/XzJmpOZlYo2YsscEA4X/tA0z
	VAod
X-Google-Smtp-Source: AGHT+IEkl0kZbwttoDcsTvCH+GxAWXI21jaEj+/T6LVutFnp3HkHtK0mJzsNwJ8izVFepEs8nSEeyA==
X-Received: by 2002:a05:6402:5106:b0:5d4:4143:c06c with SMTP id 4fb4d7f45d1cf-5db7db086c2mr20781614a12.23.1737568058545;
        Wed, 22 Jan 2025 09:47:38 -0800 (PST)
Date: Wed, 22 Jan 2025 18:47:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/5] x86/HVM: allocate emulation cache entries
 dynamically
Message-ID: <Z5EvOTbZC_UxUGo-@macbook.local>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <93967ab8-a472-475a-bdd6-41dfc3afa895@suse.com>
 <Z5Ddzh-Ygy5cGuPj@macbook.local>
 <de1934b8-b7c9-472f-9b9e-5183a5a34b65@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de1934b8-b7c9-472f-9b9e-5183a5a34b65@suse.com>

On Wed, Jan 22, 2025 at 02:39:43PM +0100, Jan Beulich wrote:
> On 22.01.2025 13:00, Roger Pau Monné wrote:
> > On Tue, Oct 01, 2024 at 10:49:10AM +0200, Jan Beulich wrote:
> >> Both caches may need higher capacity, and the upper bound will need to
> >> be determined dynamically based on CPUID policy (for AMX'es TILELOAD /
> >> TILESTORE at least).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Just a couple of comments below.
> > 
> >> ---
> >> This is a patch taken from the AMX series, but wasn't part of the v3
> >> submission. All I did is strip out the actual AMX bits (from
> >> hvmemul_cache_init()), plus of course change the description. As a
> >> result some local variables there may look unnecessary, but this way
> >> it's going to be less churn when the AMX bits are added. The next patch
> >> pretty strongly depends on the changed approach (contextually, not so
> >> much functionally), and I'd really like to avoid rebasing that one ahead
> >> of this one, and then this one on top of that.
> > 
> > Oh, I was just going to ask about the weirdness of nents compared to
> > what was previously.
> 
> And then you did ask; I'll comment on that below.
> 
> >> --- a/xen/arch/x86/hvm/emulate.c
> >> +++ b/xen/arch/x86/hvm/emulate.c
> >> @@ -26,6 +26,18 @@
> >>  #include <asm/iocap.h>
> >>  #include <asm/vm_event.h>
> >>  
> >> +/*
> >> + * We may read or write up to m512 or up to a tile row as a number of
> >> + * device-model transactions.
> >> + */
> >> +struct hvm_mmio_cache {
> >> +    unsigned long gla;
> >> +    unsigned int size;
> >> +    unsigned int space:31;
> > 
> > Having size and space is kind of confusing, would you mind adding a
> > comment that size is the runtime consumed buffer space, while space is
> > the total allocated buffer size (and hence not supposed to change
> > during usage)?
> 
> Sure; I thought the two names would be clear enough when sitting side by
> side, but here you go:
> 
>     unsigned int size;     /* Amount of buffer[] actually used. */
>     unsigned int space:31; /* Allocated size of buffer[]. */
> 
> 
> >> @@ -2978,16 +2991,21 @@ void hvm_dump_emulation_state(const char
> >>  int hvmemul_cache_init(struct vcpu *v)
> >>  {
> >>      /*
> >> -     * No insn can access more than 16 independent linear addresses (AVX512F
> >> -     * scatters/gathers being the worst). Each such linear range can span a
> >> -     * page boundary, i.e. may require two page walks. Account for each insn
> >> -     * byte individually, for simplicity.
> >> +     * AVX512F scatter/gather insns can access up to 16 independent linear
> >> +     * addresses, up to 8 bytes size. Each such linear range can span a page
> >> +     * boundary, i.e. may require two page walks.
> >> +     */
> >> +    unsigned int nents = 16 * 2 * (CONFIG_PAGING_LEVELS + 1);
> >> +    unsigned int i, max_bytes = 64;
> >> +    struct hvmemul_cache *cache;
> >> +
> >> +    /*
> >> +     * Account for each insn byte individually, both for simplicity and to
> >> +     * leave some slack space.
> >>       */
> >> -    const unsigned int nents = (CONFIG_PAGING_LEVELS + 1) *
> >> -                               (MAX_INST_LEN + 16 * 2);
> >> -    struct hvmemul_cache *cache = xmalloc_flex_struct(struct hvmemul_cache,
> >> -                                                      ents, nents);
> >> +    nents += MAX_INST_LEN * (CONFIG_PAGING_LEVELS + 1);
> >>  
> >> +    cache = xvmalloc_flex_struct(struct hvmemul_cache, ents, nents);
> > 
> > Change here seems completely unrelated, but I guess this is what you
> > refer to in the post-commit remark.  IOW: the split of the nents
> > variable setup, plus the change of xmalloc_flex_struct() ->
> > xvmalloc_flex_struct() don't seem to be related to the change at
> > hand.
> 
> See the post-commit-message remark that you commented on. To repeat:
> It'll be quite a bit easier for me if the seemingly unrelated adjustments
> could be kept like that. Unless of course there's something wrong with
> them.
> 
> >> @@ -2997,6 +3015,15 @@ int hvmemul_cache_init(struct vcpu *v)
> >>  
> >>      v->arch.hvm.hvm_io.cache = cache;
> >>  
> >> +    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
> >> +    {
> >> +        v->arch.hvm.hvm_io.mmio_cache[i] =
> >> +            xmalloc_flex_struct(struct hvm_mmio_cache, buffer, max_bytes);
> > 
> > TBH I would be tempted to just use xvmalloc here also, even if the
> > structure is never going to be > PAGE_SIZE, it's more consistent IMO.
> 
> Oh, absolutely under the current rules (which weren't in effect yet back
> when all of this was written).

With the two items above fixed (not the nents related change, that's
fine as-is):

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

