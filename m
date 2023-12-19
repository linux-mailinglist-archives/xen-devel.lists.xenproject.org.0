Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6490818A1D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656939.1025460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbD0-0000vJ-OQ; Tue, 19 Dec 2023 14:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656939.1025460; Tue, 19 Dec 2023 14:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbD0-0000sA-KG; Tue, 19 Dec 2023 14:36:34 +0000
Received: by outflank-mailman (input) for mailman id 656939;
 Tue, 19 Dec 2023 14:36:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rom3=H6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFbCz-0000s4-4P
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:36:33 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00568f2d-9e7c-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 15:36:31 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c69403b3eso46053605e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:36:31 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 l10-20020a05600c1d0a00b0040b2c195523sm3190224wms.31.2023.12.19.06.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 06:36:30 -0800 (PST)
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
X-Inumbo-ID: 00568f2d-9e7c-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702996591; x=1703601391; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=anXg9CkCt6HhsjP2ZpH/+wE3wlYgtRTKnc+IhcVU5k4=;
        b=OXYGNRy5dU3y4jBW7Lgow8iPNNvaY3rXAN1hk4GVXOYsDfIQ3DCH4XTfwQfp9Y7VDw
         G0tXUxz7rUlmUAJPjifMm1aJZ3V10nDyZBcwleBDeLHF7oAfhMzdSN4bkYFTwIW8zgbZ
         HOallCpMmOwKnKmwX3bhgLiorxu9LYvIBt94U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996591; x=1703601391;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=anXg9CkCt6HhsjP2ZpH/+wE3wlYgtRTKnc+IhcVU5k4=;
        b=MENtLU8a1VzooDjIBTwsUXq6LZFoAmlPDLkSPQdVJ41ig5dmvrcXcB8mjaDNYWXpsd
         OAJb3lfXhDQ03aMSoPqMZsPQngAxVn3PC0BRhOLdddlIZb/HPkbyuxD3jOtyfuwLVsk7
         OWJHarax51Azj9GdWlasyhXV+Q82Mf8MgPp0HIgLOz+VKBuJE2XNq/ZlkEZztPE3M1E4
         QfSY+izu+y3DzdlI4pZFzZGqXKWn4Qoa5L8PY1j27Hz1c4CY7vinROrEOionGACTNcVx
         LvI835/78o5vkMA2nmijtZyFFlFG/biRDhS5W4aP/qbnEVkRcAD+n25lvac5LdDHAV32
         p3nw==
X-Gm-Message-State: AOJu0YyZ6mYPCf4StZAXmDkCIYZg5rFHZtIFldWKtnFtjOZ1OO4ILqlO
	YEmOi1Q2yV96Dn6cBoQQjnNB0g==
X-Google-Smtp-Source: AGHT+IEBwrY/5wFFgMueTIfFvFUL4+skp0wIGAEY2UfiSnoasF5cjB5BIkoQ0JfbdFxDtAplTAtR/g==
X-Received: by 2002:a05:600c:3ba6:b0:40b:5e1c:5c1d with SMTP id n38-20020a05600c3ba600b0040b5e1c5c1dmr9068982wms.50.1702996590957;
        Tue, 19 Dec 2023 06:36:30 -0800 (PST)
Date: Tue, 19 Dec 2023 15:36:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/5] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZYGqbboWvjVOGZkb@macbook>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
 <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com>

On Mon, Dec 18, 2023 at 03:39:55PM +0100, Jan Beulich wrote:
> ..., at least as reasonably feasible without making a check hook
> mandatory (in particular strict vs relaxed/zero-extend length checking
> can't be done early this way).
> 
> Note that only one of the two uses of "real" hvm_load() is accompanied
> with a "checking" one. The other directly consumes hvm_save() output,
> which ought to be well-formed. This means that while input data related
> checks don't need repeating in the "load" function when already done by
> the "check" one (albeit assertions to this effect may be desirable),
> domain state related checks (e.g. has_xyz(d)) will be required in both
> places.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Now that this re-arranges hvm_load() anyway, wouldn't it be better to
> down the vCPU-s ahead of calling arch_hvm_load() (which is now easy to
> arrange for)?

Seems OK to me.

> Do we really need all the copying involved in use of _hvm_read_entry()
> (backing hvm_load_entry()? Zero-extending loads are likely easier to
> handle that way, but for strict loads all we gain is a reduced risk of
> unaligned accesses (compared to simply pointing into h->data[]).

I do feel it's safer to copy the data so the checks are done against
what's loaded.  Albeit hvm_load() is already using hvm_get_entry().

> ---
> v4: Fold hvm_check() into hvm_load().
> v2: New.
> 
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -379,8 +379,12 @@ long arch_do_domctl(
>          if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
>              goto sethvmcontext_out;
>  
> +        ret = hvm_load(d, false, &c);
> +        if ( ret )
> +            goto sethvmcontext_out;
> +
>          domain_pause(d);
> -        ret = hvm_load(d, &c);
> +        ret = hvm_load(d, true, &c);

Now that the check has been done ahead, do we want to somehow assert
that this cannot fail?  AIUI that's the expectation.

>          domain_unpause(d);
>  
>      sethvmcontext_out:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5397,7 +5397,7 @@ int hvm_copy_context_and_params(struct d
>      }
>  
>      c.cur = 0;
> -    rc = hvm_load(dst, &c);
> +    rc = hvm_load(dst, true, &c);
>  
>   out:
>      vfree(c.data);
> --- a/xen/arch/x86/hvm/save.c
> +++ b/xen/arch/x86/hvm/save.c
> @@ -30,7 +30,8 @@ static void arch_hvm_save(struct domain
>      d->arch.hvm.sync_tsc = rdtsc();
>  }
>  
> -static int arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
> +static int arch_hvm_check(const struct domain *d,
> +                          const struct hvm_save_header *hdr)
>  {
>      uint32_t eax, ebx, ecx, edx;
>  
> @@ -55,6 +56,11 @@ static int arch_hvm_load(struct domain *
>                 "(%#"PRIx32") and restored on another (%#"PRIx32").\n",
>                 d->domain_id, hdr->cpuid, eax);
>  
> +    return 0;
> +}
> +
> +static void arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
> +{
>      /* Restore guest's preferred TSC frequency. */
>      if ( hdr->gtsc_khz )
>          d->arch.tsc_khz = hdr->gtsc_khz;
> @@ -66,13 +72,12 @@ static int arch_hvm_load(struct domain *
>  
>      /* VGA state is not saved/restored, so we nobble the cache. */
>      d->arch.hvm.stdvga.cache = STDVGA_CACHE_DISABLED;
> -
> -    return 0;
>  }
>  
>  /* List of handlers for various HVM save and restore types */
>  static struct {
>      hvm_save_handler save;
> +    hvm_check_handler check;
>      hvm_load_handler load;
>      const char *name;
>      size_t size;
> @@ -88,6 +93,7 @@ void __init hvm_register_savevm(uint16_t
>  {
>      ASSERT(typecode <= HVM_SAVE_CODE_MAX);
>      ASSERT(hvm_sr_handlers[typecode].save == NULL);
> +    ASSERT(hvm_sr_handlers[typecode].check == NULL);
>      ASSERT(hvm_sr_handlers[typecode].load == NULL);
>      hvm_sr_handlers[typecode].save = save_state;
>      hvm_sr_handlers[typecode].load = load_state;
> @@ -275,12 +281,10 @@ int hvm_save(struct domain *d, hvm_domai
>      return 0;
>  }
>  
> -int hvm_load(struct domain *d, hvm_domain_context_t *h)
> +int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)

Maybe the 'real' parameter should instead be an enum:

enum hvm_load_action {
    CHECK,
    LOAD,
};
int hvm_load(struct domain *d, enum hvm_load_action action,
             hvm_domain_context_t *h);

Otherwise a comment might be warranted about how 'real' affects the
logic in the function.

>  {
>      const struct hvm_save_header *hdr;
>      struct hvm_save_descriptor *desc;
> -    hvm_load_handler handler;
> -    struct vcpu *v;
>      int rc;
>  
>      if ( d->is_dying )
> @@ -291,50 +295,91 @@ int hvm_load(struct domain *d, hvm_domai
>      if ( !hdr )
>          return -ENODATA;
>  
> -    rc = arch_hvm_load(d, hdr);
> -    if ( rc )
> -        return rc;
> +    rc = arch_hvm_check(d, hdr);

Shouldn't this _check function only be called when real == false?

> +    if ( real )
> +    {
> +        struct vcpu *v;
> +
> +        ASSERT(!rc);
> +        arch_hvm_load(d, hdr);
>  
> -    /* Down all the vcpus: we only re-enable the ones that had state saved. */
> -    for_each_vcpu(d, v)
> -        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
> -            vcpu_sleep_nosync(v);
> +        /*
> +         * Down all the vcpus: we only re-enable the ones that had state
> +         * saved.
> +         */
> +        for_each_vcpu(d, v)
> +            if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
> +                vcpu_sleep_nosync(v);
> +    }
> +    else if ( rc )
> +        return rc;
>  
>      for ( ; ; )
>      {
> +        const char *name;
> +        hvm_load_handler load;
> +
>          if ( h->size - h->cur < sizeof(struct hvm_save_descriptor) )
>          {
>              /* Run out of data */
>              printk(XENLOG_G_ERR
>                     "HVM%d restore: save did not end with a null entry\n",
>                     d->domain_id);
> +            ASSERT(!real);
>              return -ENODATA;
>          }
>  
>          /* Read the typecode of the next entry  and check for the end-marker */
>          desc = (struct hvm_save_descriptor *)(&h->data[h->cur]);
> -        if ( desc->typecode == 0 )
> +        if ( desc->typecode == HVM_SAVE_CODE(END) )
> +        {
> +            /* Reset cursor for hvm_load(, true, ). */
> +            if ( !real )
> +                h->cur = 0;
>              return 0;
> +        }
>  
>          /* Find the handler for this entry */
> -        if ( (desc->typecode > HVM_SAVE_CODE_MAX) ||
> -             ((handler = hvm_sr_handlers[desc->typecode].load) == NULL) )
> +        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
> +             !(name = hvm_sr_handlers[desc->typecode].name) ||
> +             !(load = hvm_sr_handlers[desc->typecode].load) )
>          {
>              printk(XENLOG_G_ERR "HVM%d restore: unknown entry typecode %u\n",
>                     d->domain_id, desc->typecode);

The message is not very accurate here, it does fail when the typecode
is unknown, but also fails when such typecode has no name or load
function setup.

Thanks, Roger.

