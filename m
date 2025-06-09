Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627AAD1BA3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 12:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010222.1388388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZrg-0003e2-3e; Mon, 09 Jun 2025 10:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010222.1388388; Mon, 09 Jun 2025 10:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOZrg-0003bt-0J; Mon, 09 Jun 2025 10:36:28 +0000
Received: by outflank-mailman (input) for mailman id 1010222;
 Mon, 09 Jun 2025 10:36:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bnjC=YY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uOZre-0003bn-Tg
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 10:36:26 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9826337c-451d-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 12:36:25 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45024721cbdso36018055e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 03:36:25 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-452730c7761sm103435165e9.32.2025.06.09.03.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 03:36:24 -0700 (PDT)
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
X-Inumbo-ID: 9826337c-451d-11f0-a304-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749465385; x=1750070185; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j2eSCMgOBkowmSy5gboI/K/V/rdKxTHVWcyzbMiQh4A=;
        b=oM7s+V4ZJlSOW4AmiN6JsvQTdD80gxz5Rz5uUuYTp3cPRtA7ZR1GoGbNcMzKuCw/CC
         mCWJQnpTXCg1vHhZWkGy5UT2tHCDv95MHIrzkipmvM9iMiEizFVK8E5WRYNn/108o5la
         aCBllwh4UAS6ODyZHp+wEXnCOmbwVAoCis/KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749465385; x=1750070185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2eSCMgOBkowmSy5gboI/K/V/rdKxTHVWcyzbMiQh4A=;
        b=jlJX4QaJ64o+gRfu0jP8W6JRs3g+ZTh8t15qIiesVn7ioWo0TfhUTO+oAYIviJPzEP
         zCjbDmSbC3UvgWF0bHdfQY0UqSVG4bma+mJSHTLLqhw/lWximm21xLVKffwURpHYRfal
         CvUzyAXU1UPTnD+dUKtMh54TSTOvR8tswUYrXCdnlPlssn2MfNvy2irVL8K54YnM0Ccr
         ZXaaO7slsgTdol5s2DmtHPraJlmVDmLlrH3EdobulJZ9Vkr74rfwjBL+O502l3D5w5CM
         xFMBLSIDKY4fDG10Y3TkhSsCTtFbgk6N1jmN66suRxRgRH3XmAmnmWuk/jB+JucvhyqI
         8unw==
X-Gm-Message-State: AOJu0YzXPSd+c+PsbQZ1AgBpnGjZLK/DniLgLMz5kqNCgTvmdkVrj4u0
	0juh1hS39JUl3QVH1MqKMWPTKQM2rb1QKFrk8lpYbx+bn7M6qo2iYtfw65MV3JyCb/Y=
X-Gm-Gg: ASbGnctsNac2Cupk7vxrIH9qfT4XG2JEdZ7B8ViApV2jp2hb6CbmGg7hZDxsh3KQNPm
	lGqEh5ur3Z4aOCN2iEB2Qytqns5lGcbxqZGdI3s9cQ0YwB/z/rJsNkPjOfwVqIN5QP0MEQ3YG20
	grVeFdSTncsULQo1xlqCQlH3EdkYO1EvXqflP6vFp7i1sqihj/D2TMcekmfRZhMf9ljF9N/F6SU
	8Cu9hmYlEIp9lgbg6lDRTJsOKiJDiyKKR+eOm3LTQYD7p7z4Sv31iyj/Q56y2PXNanZfNRU0fts
	EFZihfpBfW9A4PAS2auI15LlFl+rOK5uPyV42FAtjWbrXOIkyh5f+urxpsBaxulAU9BsPMLHrBY
	3jxbN7iPJp9QsH4o55RU=
X-Google-Smtp-Source: AGHT+IHvpfKTS/HWCq4Cz8Z0xH36vvgGE8cBtHcnKsYx7yrlcQkSfEWEZ3KYDu0g3vPvL9BPSebhFw==
X-Received: by 2002:a05:600c:1391:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-452012b351amr130545445e9.0.1749465385208;
        Mon, 09 Jun 2025 03:36:25 -0700 (PDT)
Date: Mon, 9 Jun 2025 12:36:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
Message-ID: <aEa5J_TlSAdS9-m_@macbook.local>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>

On Wed, Jun 04, 2025 at 11:48:00AM +0200, Jan Beulich wrote:
> We don't permit use of uncachable memory types elsewhere unless a domain
> meets certain criteria. Enforce this also during registration of pinned
> cache attribute ranges.
> 
> Furthermore restrict cache flushing to just uncachable range registration.
> While there, also (mainly be calling memory_type_changed())
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
> ---
> v2: Use memory_type_changed() and conditionalize call to
>     p2m_memory_type_changed().
> 
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -582,6 +582,7 @@ int hvm_set_mem_pinned_cacheattr(struct
>  {
>      struct hvm_mem_pinned_cacheattr_range *range, *newr;
>      unsigned int nr = 0;
> +    bool flush = false;
>      int rc = 1;
>  
>      if ( !is_hvm_domain(d) )
> @@ -605,31 +606,35 @@ int hvm_set_mem_pinned_cacheattr(struct
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

Is the check here required?  memory_type_changed() will already check
for is_iommu_enabled() and cache_flush_permitted(), and hence you
could just set flush to true unconditionally here IMO.

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
> @@ -682,9 +687,11 @@ int hvm_set_mem_pinned_cacheattr(struct
>  
>      xfree(newr);
>  
> -    p2m_memory_type_changed(d);
> -    if ( type != X86_MT_WB )
> -        flush_all(FLUSH_CACHE);
> + finish:
> +    if ( flush )
> +        memory_type_changed(d);
> +    else if ( d->vcpu && d->vcpu[0] )
> +        p2m_memory_type_changed(d);

FWIW, I would just call memory_type_changed() unconditionally
regardless of the change.  We suspect the hypercall is only used at
domain creation time (where memory_type_changed() won't do a cache
flush anyway).

Thanks, Roger.

