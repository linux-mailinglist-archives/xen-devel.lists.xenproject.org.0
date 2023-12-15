Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAB814B04
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655188.1022902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE9ab-0001Me-Uj; Fri, 15 Dec 2023 14:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655188.1022902; Fri, 15 Dec 2023 14:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE9ab-0001Ky-Rr; Fri, 15 Dec 2023 14:54:57 +0000
Received: by outflank-mailman (input) for mailman id 655188;
 Fri, 15 Dec 2023 14:54:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE9aa-0001Ks-4r
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:54:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e794a2e6-9b59-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:54:53 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso8674695e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:54:53 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 fa5-20020a05600c518500b0040c6d559490sm1720837wmb.3.2023.12.15.06.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:54:52 -0800 (PST)
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
X-Inumbo-ID: e794a2e6-9b59-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702652093; x=1703256893; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pb+esVZ95ff8GURkfDxZ5O1g1nKPENVklToWc7Xd3cA=;
        b=B1PyVCV+/ygrH+9Bn2FXzpJ8CUH0cPQlCNoiMPZF6V/u53IjuvXW6EuYxZVQL+igcJ
         azuUqf6HJLwr8AMD+pswT8/dflcoMBTAEx4BQce+bHkDAiSnxBRTq6xyJ0OLzlo/QkNc
         iVt229Folw7CHbtYDyZyCS7LoL0J+AJXGqvJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702652093; x=1703256893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb+esVZ95ff8GURkfDxZ5O1g1nKPENVklToWc7Xd3cA=;
        b=f+BxSO8idLEkAtpwuqqCbjCR3K2XsvvIwjceyc2JSDBn3vtEZ1tRnkIDixlVHl0zUB
         nntLP7Y5oPjV8ddSCIHZHLVp2qPED6LSjDChWTkCZvO5CRNvxaBs9htawjxznCoKjcCL
         z/dAJ07jlLnwktJ62VTtowcR3KAoOdSvUS9VUGnL9gAw0K3x6JNMAW0RJi0PEUz7saG0
         8NzsG86Bf6a/gjLqffgeSIWqMaK+IOcwu9dkkcfh1n8ziO/+27KBjqNmC1GSzsS+vS++
         BkM5DR3UZXyNq0iN+2irIVI2km+8bmCYdXY5nKYZU9dmeS16g8RvWciqM3VxzEi6Tjdu
         k55g==
X-Gm-Message-State: AOJu0Yxe7vlb7uyVX3dSeFsvVqKCokwh2PR0fNcswPRbi/LjK8wqxlsU
	P+STakvhnQDbCo30NyhMdpD4bw==
X-Google-Smtp-Source: AGHT+IHHXZAtub6WmdhpsanpDsB4lEKRPMS5lET1dND/fbmyV17vruz6MYh1jSFpU8bINPUUM3If8w==
X-Received: by 2002:a05:600c:16c4:b0:40c:69dc:18c7 with SMTP id l4-20020a05600c16c400b0040c69dc18c7mr785377wmn.170.1702652093242;
        Fri, 15 Dec 2023 06:54:53 -0800 (PST)
Date: Fri, 15 Dec 2023 15:54:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: allow non-BIGMEM configs to boot on >= 16Tb systems
Message-ID: <ZXxovHNdNK_OfHUs@macbook>
References: <4b282f2f-bce8-4c98-897c-2866ec1b6dd0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b282f2f-bce8-4c98-897c-2866ec1b6dd0@suse.com>

On Wed, Jun 07, 2023 at 08:17:30AM +0200, Jan Beulich wrote:
> While frame table setup, directmap init, and boot allocator population
> respect all intended bounds, the logic passing memory to the heap
> allocator which wasn't passed to the boot allocator fails to respect
> max_{pdx,pfn}. This then typically triggers the BUG() in
> free_heap_pages() after checking page state, because of hitting a struct
> page_info instance which was set to all ~0.
> 
> Of course all the memory above the 16Tb boundary is still going to
> remain unused; using it requires BIGMEM=y. And of course this fix
> similarly ought to help BIGMEM=y configurations on >= 123Tb systems
> (where all the memory beyond that boundary continues to be unused).
> 
> Fixes: bac2000063ba ("x86-64: reduce range spanned by 1:1 mapping and frame table indexes")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Sadly the people reporting the issue have decided to go with the 16Tb
> limit, and hence the patch wasn't tested by them. I thought that I'd
> still post it, though.

We should see about finding a way to test BIGMEM, maybe with PoD.

> The "must not be passed to the boot allocator" for the range in question
> may already not be applicable anymore, with all page tables now being
> mapped via map_domain_page() (iirc this work has been completed). But of
> course there would be a risk that something else is/was overlooked, and
> hence the offending code is being fixed rather than purged (and the
> purging should occur once the directmap is properly gone). (This also
> seems preferable for potential backports of this change.)
> 
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1722,15 +1722,16 @@ void __init noreturn __start_xen(unsigne
>  
>      if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
>      {
> -        unsigned long limit = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
> +        unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
> +        unsigned long hi = pdx_to_pfn(max_pdx - 1) + 1;

Maybe use max_page to avoid the pdx_to_pfn() call?  (And is also more
in context with the condition on the outside if).

Thanks, Roger.

