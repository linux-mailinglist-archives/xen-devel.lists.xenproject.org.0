Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED98C4DD6
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721262.1124544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nkK-0007UN-9S; Tue, 14 May 2024 08:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721262.1124544; Tue, 14 May 2024 08:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6nkK-0007Ri-6x; Tue, 14 May 2024 08:42:52 +0000
Received: by outflank-mailman (input) for mailman id 721262;
 Tue, 14 May 2024 08:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6nkI-0007Rc-GY
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:42:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f11e5182-11cd-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 10:42:48 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-420104e5336so16158395e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:42:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4200e518984sm118855725e9.23.2024.05.14.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 01:42:47 -0700 (PDT)
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
X-Inumbo-ID: f11e5182-11cd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715676168; x=1716280968; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MhqhIL0gBwwdJARQnLt/zpiJ59NDlGpFbNldB6nMz6E=;
        b=aOIl+lKsmeh1l92Ti0yaTyKMc/ZD3fQp+hZQTPS4by30NCS9vyPYqqx7+3gshhPUYi
         yufmgz9jAC55FOal7+VG58JVuANqlKstmkHAM1ymLOdfzaa7vdElJN/riVzcCWSySei6
         RErpwyNSPgZPjB3fEBLbp0vv7d8A84G9TtSBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715676168; x=1716280968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhqhIL0gBwwdJARQnLt/zpiJ59NDlGpFbNldB6nMz6E=;
        b=A6jaF3RLJEgMiGZh1SDL0r/UK7oarT5jy1kEGUD0PoBLrTvBg3ZuqXdiIgPsZ+fIho
         sqHZNOxvsqBtuFZekTy7YYuYvSswE4vZ0kW2d1owIGf14S+xHHACCzDg5XWuggR8C8J5
         ouvbGyK8TW/b//x27/DmDqFbbSpy2Fzvu79XLI0J/ADlFUCnbqjRi9cufooIKDKFLRLc
         pQFsQcQrKe9EwAp8ROYFWTMpHtaTjQzaYu4ci6ep1i5vsv0a/slFyfDRBp+HhMZkAVad
         5hBbtepbZ144UkYLrbcLtDFSHwPML9oFA0Wn3yV81STtNNiStQxnBoMTZoVmmkxWZPti
         qBpA==
X-Gm-Message-State: AOJu0Yy4F3mscyByaeHWOowCv2o6urfnyZocOA16n8/M16fILmC7symv
	lNn2SwyrYVkjGQ18a6n+qouGAbVbwfNS1mKV0gln2QHTJW3xhjkjFaL4fxr6CZo=
X-Google-Smtp-Source: AGHT+IG0/SRvK8+UJM05wdjtjgfPTjZsG9KL+zPOb6MitkzsuqYaRk+1cx4yRturpjn/mkPAZhwKXg==
X-Received: by 2002:a05:600c:35cd:b0:420:1a72:69dd with SMTP id 5b1f17b1804b1-4201a726bfamr32640725e9.10.1715676167799;
        Tue, 14 May 2024 01:42:47 -0700 (PDT)
Date: Tue, 14 May 2024 10:42:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Wang <wawei@amazon.de>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 05/19] x86/mapcache: Initialise the mapcache
 for the idle domain
Message-ID: <ZkMkBrf2G5dQllHc@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-6-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-6-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:32PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> In order to use the mapcache in the idle domain, we also have to
> populate its page tables in the PERDOMAIN region, and we need to move
> mapcache_domain_init() earlier in arch_domain_create().

Oh, so this is the reason for the remark on the previous commit
message: idle domain init gets short-circuited earlier in
arch_domain_create() and never gets to the mapcache_domain_init()
call.

> Note, commit 'x86: lift mapcache variable to the arch level' has
> initialised the mapcache for HVM domains. With this patch, PV, HVM,
> idle domains now all initialise the mapcache.
> 
> Signed-off-by: Wei Wang <wawei@amazon.de>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
> 	Changes in V2:
>           * Free resources if mapcache initialisation fails
>           * Remove `is_idle_domain()` check from `create_perdomain_mappings()`

I'm not seeing any is_idle_domain() in create_perdomain_mapping(), and
neither anything removed by this patch.

> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 507d704f16..3303bdb53e 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -758,9 +758,16 @@ int arch_domain_create(struct domain *d,
>  
>      spin_lock_init(&d->arch.e820_lock);
>  
> +    if ( (rc = mapcache_domain_init(d)) != 0)
> +    {
> +        free_perdomain_mappings(d);
> +        return rc;


What about all the error paths below here that don't use the fail
label, don't you need to also call free_perdomain_mappings() on them?

Or alternatively arrange the fail label to be suitable to be used this
early if it's not already the case.

> +    }
> +
>      /* Minimal initialisation for the idle domain. */
>      if ( unlikely(is_idle_domain(d)) )
>      {
> +        struct page_info *pg = d->arch.perdomain_l3_pg;

const?

>          static const struct arch_csw idle_csw = {
>              .from = paravirt_ctxt_switch_from,
>              .to   = paravirt_ctxt_switch_to,
> @@ -771,6 +778,9 @@ int arch_domain_create(struct domain *d,
>  
>          d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
>  
> +        idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
> +            l4e_from_page(pg, __PAGE_HYPERVISOR_RW);

Albeit I think you could just use d->arch.perdomain_l3_pg directly
here and avoid the local pg variable?

Would you mind adding:

/* Slot 260: Per-domain mappings. */

I wonder if it won't be better to just use init_xen_l4_slots() and
special case the idle domain in there, instead of open-coding the L4
population for the idle domain like this.

Thanks, Roger.

