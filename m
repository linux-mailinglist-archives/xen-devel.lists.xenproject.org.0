Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1267F803B83
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 18:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647251.1010184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACio-0002zs-3O; Mon, 04 Dec 2023 17:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647251.1010184; Mon, 04 Dec 2023 17:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACio-0002wY-0R; Mon, 04 Dec 2023 17:27:06 +0000
Received: by outflank-mailman (input) for mailman id 647251;
 Mon, 04 Dec 2023 17:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rACin-0002wR-57
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 17:27:05 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 568d8398-92ca-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 18:27:03 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09fcfa9fso15682495e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 09:27:03 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 a13-20020a05600c348d00b0040b5377cf03sm19538133wmq.1.2023.12.04.09.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 09:27:02 -0800 (PST)
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
X-Inumbo-ID: 568d8398-92ca-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701710822; x=1702315622; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/z2cCkWrr6RQfDK8s7AltEM2rUC1pyxG+qGmIePOvY=;
        b=SrPKrLfQzftS6yttlFHM+CTPRYGbomCU1bQVFzyq+hSoTyXj94wACy5wUudKVFWOcH
         E/H5mJx3WqcNaW2TXPTvNylZwEHK9Tx/mFhhi6loHxXQcpa1JOhuPL4W91TRC6DsYyYV
         ZDB0utzbYQ8valUvU2BkZ0qaLQcBhfmYp8XTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701710822; x=1702315622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/z2cCkWrr6RQfDK8s7AltEM2rUC1pyxG+qGmIePOvY=;
        b=UX0r40ySu/JRZTExvVE2uBRsA/w4bWFcYa4WhHcoynr/Q9zARc/yTlJ78BLNMZ1sUo
         Sd/S4ZLWlJxtmz0N4ps+31UZMOvUDwRYuz5OJxSK4w31A4MZHlMWqaYLcD2690Ea60Dc
         oLWVg00Mr2LoG0SJKzgEsDMaWMdgguV1hxg9pwASbShuf1KuTRA7ZTffFFP0hYODSatT
         BzdJgkS0P9ZsK007V6lbl2LNWRUI4zHCcg1ATdFDTPVm7KY8/if49tH9H7V4XxA00H2Y
         /wTHlw/xnweCBqjIQFemtsC07JaQ/N+bNHotrigVS7t59mWMQZyTpy4Y5KOoJ6uzflJB
         InQA==
X-Gm-Message-State: AOJu0Ywd0sPgh0LwHKjTez6FDQM/TH8t3rGeAPJ8lqfWohuDveLYYlVq
	RARW50+MBfxwnf84tTtSquxRiw==
X-Google-Smtp-Source: AGHT+IEzWJh6UZ5LSIEFlPOQZM7tuKMinzVNyJWQo7RafJj8Y1PJVW8KKC96H4zZpfx3a3t6Qh/t0A==
X-Received: by 2002:a05:600c:3d96:b0:40b:5f03:b3ec with SMTP id bi22-20020a05600c3d9600b0040b5f03b3ecmr1156449wmb.270.1701710822423;
        Mon, 04 Dec 2023 09:27:02 -0800 (PST)
Date: Mon, 4 Dec 2023 18:27:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Message-ID: <ZW4L5Q4SMprtmbK-@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com>

On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
> ..., at least as reasonably feasible without making a check hook
> mandatory (in particular strict vs relaxed/zero-extend length checking
> can't be done early this way).
> 
> Note that only one of the two uses of hvm_load() is accompanied with
> hvm_check(). The other directly consumes hvm_save() output, which ought
> to be well-formed. This means that while input data related checks don't
> need repeating in the "load" function when already done by the "check"
> one (albeit assertions to this effect may be desirable), domain state
> related checks (e.g. has_xyz(d)) will be required in both places.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Do we really need all the copying involved in use of _hvm_read_entry()
> (backing hvm_load_entry()? Zero-extending loads are likely easier to
> handle that way, but for strict loads all we gain is a reduced risk of
> unaligned accesses (compared to simply pointing into h->data[]).

See below, but I wonder whether the checks could be performed as part
of hvm_load() without having to introduce a separate handler and loop
over the context entries.

> Would the hvm_sr_handlers[] better use array_access_nospec()?

Maybe?  Given this is a domctl I do wonder whether a domain already
having access to such interface won't have easier ways to leak data
from Xen.  Maybe for a disaggregated setup.

> ---
> v2: New.
> 
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -379,6 +379,10 @@ long arch_do_domctl(
>          if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
>              goto sethvmcontext_out;
>  
> +        ret = hvm_check(d, &c);
> +        if ( ret )
> +            goto sethvmcontext_out;
> +
>          domain_pause(d);
>          ret = hvm_load(d, &c);
>          domain_unpause(d);
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
> @@ -275,6 +281,78 @@ int hvm_save(struct domain *d, hvm_domai
>      return 0;
>  }
>  
> +int hvm_check(const struct domain *d, hvm_domain_context_t *h)
> +{
> +    const struct hvm_save_header *hdr;
> +    int rc;
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    /* Get at the save header, which must be first. */
> +    hdr = hvm_get_entry(HEADER, h);
> +    if ( !hdr )
> +        return -ENODATA;
> +
> +    rc = arch_hvm_check(d, hdr);
> +    if ( rc )
> +        return rc;
> +
> +    for ( ; ; )
> +    {
> +        const struct hvm_save_descriptor *desc;
> +        hvm_check_handler handler;
> +
> +        if ( h->size - h->cur < sizeof(*desc) )
> +        {
> +            /* Run out of data */
> +            printk(XENLOG_G_ERR
> +                   "HVM restore %pd: save did not end with a null entry\n",
> +                   d);
> +            return -ENODATA;
> +        }
> +
> +        /* Read the typecode of the next entry and check for the end-marker. */
> +        desc = (const void *)&h->data[h->cur];
> +        if ( desc->typecode == HVM_SAVE_CODE(END) )
> +        {
> +            /* Reset cursor for hvm_load(). */
> +            h->cur = 0;
> +            return 0;
> +        }
> +
> +        /* Find the handler for this entry. */
> +        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
> +             !hvm_sr_handlers[desc->typecode].name ||
> +             !hvm_sr_handlers[desc->typecode].load )
> +        {
> +            printk(XENLOG_G_ERR "HVM restore %pd: unknown entry typecode %u\n",
> +                   d, desc->typecode);
> +            return -EINVAL;
> +        }
> +
> +        /* Check the entry. */
> +        handler = hvm_sr_handlers[desc->typecode].check;
> +        if ( !handler )
> +        {
> +            if ( desc->length > h->size - h->cur - sizeof(*desc) )
> +                return -ENODATA;
> +            h->cur += sizeof(*desc) + desc->length;
> +        }
> +        else if ( (rc = handler(d, h)) )
> +        {
> +            printk(XENLOG_G_ERR
> +                   "HVM restore %pd: failed to check %s:%u rc %d\n",
> +                   d, hvm_sr_handlers[desc->typecode].name, desc->instance, rc);
> +            return rc;
> +        }
> +
> +        process_pending_softirqs();

Looking at this, won't it be better to call the check() hooks inside
the hvm_load() function instead of duplicating the loop?

I realize that you only perform the checks when the state is loaded
from a domctl, but still seems quite a lot of code duplication for
little benefit.

hvm_load() could gain an extra parameter to select whether the input
must be checked or not, and that would avoid having to iterate twice
over the context.

> +    }
> +
> +    /* Not reached */

ASSERT_UNREACHABLE() maybe?

Thanks, Roger.

