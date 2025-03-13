Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B882A6016B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 20:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913424.1319466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoPT-0000BI-Hj; Thu, 13 Mar 2025 19:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913424.1319466; Thu, 13 Mar 2025 19:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsoPT-00007P-EU; Thu, 13 Mar 2025 19:40:03 +0000
Received: by outflank-mailman (input) for mailman id 913424;
 Thu, 13 Mar 2025 19:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsoPR-0008Ih-Ln
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 19:40:01 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f377bd16-0042-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 20:40:00 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so9352825e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 12:40:00 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a75b0f6sm63242685e9.22.2025.03.13.12.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 12:39:59 -0700 (PDT)
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
X-Inumbo-ID: f377bd16-0042-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741894800; x=1742499600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+jy2hVvbQxv27HbJ3TE53YSc8e9LvnKEUV9NkiAImag=;
        b=HquROpT3tB3JFL0Zldks02gdf4QKVfrF7aQbhlFgg1o1tdMNgZA7CNwVL9sB/aaNJk
         m2Hl8BTtNNLpoUm0Xs/bj9btE5TmBLe3Zrp34l4UFhGnalrUzyDpNfN1AW6Qssw/yc/V
         +3V5jG1TN99b0seaBZGsKbg+aaek/RGSPHGjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741894800; x=1742499600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jy2hVvbQxv27HbJ3TE53YSc8e9LvnKEUV9NkiAImag=;
        b=t2Pur3GOJYqDddQSBZzzc431756wnoqLfojQRXKSb0nL+WiEFYtnVBmzmJDtD6zjcG
         aKtJCfF9Tuwpo3mZqHQCkN6fFkVefxyymyvl2qe3Fa5IlV76Q1S1Xx1KCSTQ7bTv14E7
         +ariJ15y7/O7J4stbp4/nCnYzTOYnm/Naspc9c4nVjzWRARdfgh49KStV1yObghwMzpP
         2Ph9OOA7+W5wb/2vzACgIzBlDEzAMZZD3TlFcCacm5seu8+X7G3J7iEUFcRPjBD/y56w
         auaSDLlVD54lidioG3JG68nrtpgL0y7SCtYYk1gybtik9//jgjmDFyFCzuz8VcV+xhUj
         iopw==
X-Forwarded-Encrypted: i=1; AJvYcCU0B5i0z5iMfy3UUp+fjahGyodX7bMVKm2i7khTcqDyneMY1IVpb01htjHjtB4EtYZ8Wu/bgRsUyLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPtbdA60WxJo89FIVAJ5o7DCqSD6uqG3UqjHnZlMDx/sEy+hkf
	BFz6hnnvH9Dx37ILrVBaoBu4wTfIEpXjNU6ptxuD4IYWkAb93IZgQE2lJzZ0GUNnTHjKQfT9jAL
	6
X-Gm-Gg: ASbGncs+ajoyy2zDfwhmlJSFB++La58cs2lcvcIp+eElr08vzwnSfvognWVHLSFAIJJ
	MyRBALFVCWfZxK18BUrC4EHDWAgHStBlWlvzo4TV8+dvCk434Y1gJK9FgeFIUMxitPy9lP95ezB
	hWulFaJq3fpp/GQC+63GNnlBcmDsCb6X9gWUkaavNQUedwO946yi1f1KTLBgvtcmHTprgoTqrAl
	gnnf8RwCOMdaYfXjVCa2fwmVG067Quvg7JOw25CnIp/Dl0Pwc49FxKFlKLVseuKeSvaHmaQnYKF
	MWpBCMsba4BW6R91PVBdOFBrnrzad0s3ECgflg52jVhUWajtHD9xM+SI1cfRtRigj0Ze8sl4wFR
	qLnoK2cNQ
X-Google-Smtp-Source: AGHT+IEuvUZ/JbFduKZnjZsxtgYGYNuJIlLMWXs1F23CmJodTrv7F9eULo3ngFJyGsn4vj3mabRn2Q==
X-Received: by 2002:a05:600c:510f:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43d1d8a9d54mr8615015e9.8.1741894799616;
        Thu, 13 Mar 2025 12:39:59 -0700 (PDT)
Message-ID: <8ce7caae-8bf6-4ba2-8705-399129a411b6@citrix.com>
Date: Thu, 13 Mar 2025 19:39:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] x86/vga: fix mapping of the VGA text buffer
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-7-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250313153029.93347-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
> The call to ioremap_wc() in video_init() will always fail, because
> video_init() is called ahead of vm_init_type(), and so the underlying
> __vmap() call will fail to allocate the linear address space.
>
> Fix by reverting to the previous behavior and using the directmap entries
> in the low 1MB.  Note the VGA text buffer directmap entries are also
> adjusted to map the VGA text buffer as WC instead of UC-.
>
> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/boot/x86_64.S        | 10 +++++++---
>  xen/arch/x86/include/asm/config.h |  5 +++++
>  xen/drivers/video/vga.c           | 11 ++++++++---
>  3 files changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> index 26b9d1c2df9a..07f4bdf46e31 100644
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -84,15 +84,19 @@ ENTRY(__high_start)
>  /*
>   * Mapping of first 2 megabytes of memory. This is mapped with 4kB mappings
>   * to avoid type conflicts with fixed-range MTRRs covering the lowest megabyte
> - * of physical memory. In any case the VGA hole should be mapped with type UC.
> + * of physical memory. VGA hole should be mapped with type UC, with the
> + * exception of the text buffer that uses WC.
>   * Uses 1x 4k page.
>   */
>  l1_directmap:
>          pfn = 0
>          .rept L1_PAGETABLE_ENTRIES
> -        /* VGA hole (0xa0000-0xc0000) should be mapped UC-. */
> -        .if pfn >= 0xa0 && pfn < 0xc0
> +        /* VGA hole (0xa0000-0xb8000) should be mapped UC-. */
> +        .if pfn >= 0xa0 && pfn < 0xb8
>          .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_UCMINUS | _PAGE_GLOBAL | MAP_SMALL_PAGES
> +        /* VGA text buffer (0xb80000-0xc0000) should be mapped WC. */
> +        .elseif pfn >= 0xb8 && pfn < 0xc0
> +        .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_WC | _PAGE_GLOBAL | MAP_SMALL_PAGES
>          .else
>          .quad (pfn << PAGE_SHIFT) | PAGE_HYPERVISOR_RWX | MAP_SMALL_PAGES
>          .endif

We have to be careful doing this.

It probably is safe to use WC in the pagetables.  We don't start using
the pagetables until after we're sure we're on a 64bit CPU, which means
WC is available.

However, doing so now means that we need explicit SFENCE's when using
this, even in places like early_error.  The IN/OUT instructions do flush
WC buffers, but the UART is written to before the screen, so there's a
chance that you'll lose the final character of the message on the screen.

~Andrew

