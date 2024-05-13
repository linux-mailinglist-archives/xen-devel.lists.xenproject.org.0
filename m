Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577708C4551
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 18:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721047.1124174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6YrV-00048Q-1R; Mon, 13 May 2024 16:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721047.1124174; Mon, 13 May 2024 16:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6YrU-00045w-V3; Mon, 13 May 2024 16:49:16 +0000
Received: by outflank-mailman (input) for mailman id 721047;
 Mon, 13 May 2024 16:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6YrT-00045q-PN
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 16:49:15 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d19e32-1148-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 18:49:13 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-792b8efed93so457469685a.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 09:49:13 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f194c3asm44370126d6.69.2024.05.13.09.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 09:49:11 -0700 (PDT)
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
X-Inumbo-ID: b9d19e32-1148-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715618952; x=1716223752; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7hokb4SEQ/ArDzEoy7A4TmgTIwDsfbPYMk1ioH9o8Q=;
        b=JlTaP7o0HgL6jnNAIZgeXAthJubL2rdh/eYgPoqakfRUkHL7IyGrkhHNkPCtTFNOT7
         Ir7iB425prpZxyoSPAmYKZiE5fhqwFYPSS2gC8GqRsFhyp2n0HKWuxvzOLLM1NmmZcOT
         5rV5TKI8hj0m0XCJMAY77vCzlutMURPObCcBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715618952; x=1716223752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7hokb4SEQ/ArDzEoy7A4TmgTIwDsfbPYMk1ioH9o8Q=;
        b=AHEY5xRdWNYi3XUEklm8dIGUAvsNwOTs7Gifi5p5ugtj5u7s5kH3ft5T8ZcswR71xR
         GH1FZ1KCKl3kV6Kx+L1zZQSglDnPUp087Py4PknMjJ6Ea7ZQX2AhMFuvLkM37Sh90ERC
         er1Sex1KmECD7SFMjGr7ojDGmmGQd9PZB4drq3oWL1X4ZJnpc51ZZieqA9di2/8PHglE
         VyaK6ILQN4Jvys+H3qmQdSbgb3EaDnBhnJ4u2nwZTzArmhqBzZ4dkdoh6Ynh2WLUUAkn
         UqF4kikj2sqUdnyx70YcUIRSX0cI9742+Ole6FhNQBeufFoXfyMBljasqXwkvubejE+k
         mv3A==
X-Gm-Message-State: AOJu0YzVIpByRjRdr24ngIM0bd/BhMMdPwNZ4HESpPWOkJzdkg1U8SG3
	UNlYe7W7/7/5ssR9AnrARt45d14ucIiyF5d/VObgadkqb7SRRGvQz64rk5noZBM=
X-Google-Smtp-Source: AGHT+IG7EA/L9JDanw6dYkwgUlDsZEk4K4ZNrm1S2vRyJiw8sGWJyCWj928qEaU93W4jhK6NowDFWg==
X-Received: by 2002:a05:6214:4302:b0:6a0:b3cc:ee06 with SMTP id 6a1803df08f44-6a16821eb2fmr127764936d6.37.1715618951695;
        Mon, 13 May 2024 09:49:11 -0700 (PDT)
Date: Mon, 13 May 2024 18:49:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 03/19] x86/pv: Rewrite how building PV dom0
 handles domheap mappings
Message-ID: <ZkJEhZCRNnxGb_lc@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-4-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-4-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:30PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Building a PV dom0 is allocating from the domheap but uses it like the
> xenheap. Use the pages as they should be.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
>     Changes in V3:
>         * Fold following patch 'x86/pv: Map L4 page table for shim domain'
> 
>     Changes in V2:
>         * Clarify the commit message
>         * Break the patch in two parts
> 
>     Changes since Hongyan's version:
>         * Rebase
>         * Remove spurious newline
> 
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 807296c280..ac910b438a 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -382,6 +382,10 @@ int __init dom0_construct_pv(struct domain *d,
>      l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>      l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>      l1_pgentry_t *l1tab = NULL, *l1start = NULL;
> +    mfn_t l4start_mfn = INVALID_MFN;
> +    mfn_t l3start_mfn = INVALID_MFN;
> +    mfn_t l2start_mfn = INVALID_MFN;
> +    mfn_t l1start_mfn = INVALID_MFN;
>  
>      /*
>       * This fully describes the memory layout of the initial domain. All
> @@ -710,22 +714,32 @@ int __init dom0_construct_pv(struct domain *d,
>          v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
>      }
>  
> +#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
> +do {                                                    \
> +    unmap_domain_page(virt_var);                        \
> +    mfn_var = maddr_to_mfn(maddr);                      \
> +    maddr += PAGE_SIZE;                                 \
> +    virt_var = map_domain_page(mfn_var);                \

FWIW, I would do the advance after the map, so that the order matches
the name of the function.

> +} while ( false )
> +
>      if ( !compat )
>      {
>          maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
> -        l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
> +        UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);
> +        l4tab = l4start;

You could even make the macro return virt_var, and so use it like:

l4tab = l4start = UNMAP_MAP_AND_ADVANCE(l4start_mfn, mpt_alloc);

?

Anyway, no strong opinion.

Thanks, Roger.

