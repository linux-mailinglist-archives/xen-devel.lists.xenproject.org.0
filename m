Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC386B6BD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 19:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686761.1069202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfOJI-0004Un-Hh; Wed, 28 Feb 2024 18:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686761.1069202; Wed, 28 Feb 2024 18:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfOJI-0004TH-D0; Wed, 28 Feb 2024 18:05:40 +0000
Received: by outflank-mailman (input) for mailman id 686761;
 Wed, 28 Feb 2024 18:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGB+=KF=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rfOJG-0004TB-Pt
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 18:05:38 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f92f2db3-d663-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 19:05:36 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d153254b7so53298f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 10:05:36 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e12-20020a5d530c000000b0033e0019b814sm2381870wrv.34.2024.02.28.10.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 10:05:35 -0800 (PST)
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
X-Inumbo-ID: f92f2db3-d663-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709143536; x=1709748336; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2FqYtTnxWdlln7CeeFml8oacs7aq896YTM/LaVKHR0=;
        b=fWafAnCZKHEc3J1J7fmhW21eJGySagWYHPLRB0iCD3Ulsfm9x9WhwTfTvHx1NBz0kE
         HRN/KJCbepy65Zx36xszK6GFYMCaV1HRuIHvsu/+kUFazvQVJMkU7fmUowQ0IbJ7uV+x
         YzGBptaYhWrtX6REd7NOP3WSm+1unpuVkxWdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709143536; x=1709748336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2FqYtTnxWdlln7CeeFml8oacs7aq896YTM/LaVKHR0=;
        b=XL7R8z/KZAFS6nU5aE1qDf2ID+sDsojAYVEqybNgUVgpvay9qsCcxunbQw3h6Q53oX
         Ki1TNJBpwoYFfUYhnA2TrqYYv1TeS0rMJxvvKHWy2RUgBXdrw6eT85jnBwCdNrG0S+Gg
         Ov4bK+enLydmmlNv8n1REPrP9uC3VRDNuZNPS3mQXd9Nt/EWVUvRdVrU1m7ojCOPpB1Y
         I86M12w9VGaL4V41/R9rm8DO5zafDYmUc37AYmEcpKmUEioeUlYiRmTdpov1XBebVUlr
         6jeJhrLKglUoEoQZCSPKnQDN0Aq6wWHh1sTt2Y/YMOBrXfFi06u1omAyphWN7PG13Ppr
         +27w==
X-Gm-Message-State: AOJu0Yz+w6hZw5vZcXOV4BZ46HzAYY9cl/WzYKvQENbsNCAN2k5c0QTW
	K/7UN0erNly4fmF5fn+idHk8tIKxjzl9ebLvZTaWbLKyNIcBTaYbG/1aKuGgsTXHOitg1DU0Dpt
	H
X-Google-Smtp-Source: AGHT+IG6qbC4qJxHw4sNh9WE0/0tdvk+Yd4xV8KXQ7a/KZC0WYT3XV7xrpbPpjbC3sqhxiDcIaPAgg==
X-Received: by 2002:a5d:58e6:0:b0:33d:efbd:517d with SMTP id f6-20020a5d58e6000000b0033defbd517dmr231577wrd.20.1709143536164;
        Wed, 28 Feb 2024 10:05:36 -0800 (PST)
Date: Wed, 28 Feb 2024 18:05:34 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: Re: [PATCH v6 06/15] tools: add support for cache coloring
 configuration
Message-ID: <c8e1da62-eea0-4103-b9f7-f5bd05b90e30@perard>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-7-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129171811.21382-7-carlo.nonato@minervasys.tech>

On Mon, Jan 29, 2024 at 06:18:02PM +0100, Carlo Nonato wrote:
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 2ef8b4e054..4b541fffd2 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2653,6 +2653,15 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
>  int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
>                           xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
>  
> +/*
> + * Set LLC colors for a domain.
> + * This is an internal hypercall. It can only be used directly after domain

What is an "internal hypercall"? Can those even exist?

> + * creation. An attempt to use it afterwards will result in an error.
> + */
> +int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
> +                             const unsigned int *llc_colors,
> +                             unsigned int num_llc_colors);
> +
>  #if defined(__arm__) || defined(__aarch64__)
>  int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
>                    uint32_t overlay_fdt_size, uint8_t overlay_op);
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index f2d9d14b4d..ad02288659 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -2180,6 +2180,40 @@ int xc_domain_soft_reset(xc_interface *xch,
>      domctl.domain = domid;
>      return do_domctl(xch, &domctl);
>  }
> +
> +int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
> +                             const unsigned int *llc_colors,
> +                             unsigned int num_llc_colors)
> +{
> +    struct xen_domctl domctl = {};
> +    DECLARE_HYPERCALL_BUFFER(uint32_t, local);
> +    int ret = -1;
> +
> +    if ( num_llc_colors )
> +    {
> +        size_t bytes = sizeof(uint32_t) * num_llc_colors;

Isn't there a risk of overflow, maybe only on 32bit platform? Or maybe
that doesn't matter because the hypervisor should be able to find out if
the buffer is too short, right?

> +        local = xc_hypercall_buffer_alloc(xch, local, bytes);
> +        if ( local == NULL )
> +        {
> +            PERROR("Could not allocate LLC colors for set_llc_colors");
> +            return -ENOMEM;
> +        }
> +        memcpy(local, llc_colors, bytes);
> +        set_xen_guest_handle(domctl.u.set_llc_colors.llc_colors, local);
> +    }
> +
> +    domctl.cmd = XEN_DOMCTL_set_llc_colors;
> +    domctl.domain = domid;
> +    domctl.u.set_llc_colors.num_llc_colors = num_llc_colors;
> +
> +    ret = do_domctl(xch, &domctl);
> +
> +    if ( local )
> +        xc_hypercall_buffer_free(xch, local);

It doesn't looks like you need to check if "local != NULL" before
calling xc_hypercall_buffer_free(), it should work even with
local==NULL. This is even used multiple time in xc_kexec.

> +
> +    return ret;
> +}

Thanks,

-- 
Anthony PERARD

