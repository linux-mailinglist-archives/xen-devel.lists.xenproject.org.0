Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C018A9343
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 08:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707949.1106408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLRF-0002fg-F1; Thu, 18 Apr 2024 06:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707949.1106408; Thu, 18 Apr 2024 06:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLRF-0002dv-Br; Thu, 18 Apr 2024 06:40:05 +0000
Received: by outflank-mailman (input) for mailman id 707949;
 Thu, 18 Apr 2024 06:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxLRE-0002Fe-03
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 06:40:04 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b9e9147-fd4e-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 08:40:02 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-418e06c0ef4so3665075e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 23:40:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n17-20020adfe791000000b00349be95b5cesm971163wrm.101.2024.04.17.23.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 23:40:01 -0700 (PDT)
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
X-Inumbo-ID: 7b9e9147-fd4e-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713422401; x=1714027201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gT1oCZ2mtgDWYp2MEQWyzq5b2kxM4xV7EDO7GfB6Hz0=;
        b=RU0DjZAfBJ8SBU62RVrCGU9wYunkXRCbZttElaOU0QngIAdLq0lQ4jSi4dACoCpUeB
         poFQwiLrhM91t+F8JQn9Tlkq0ugRYbnu5GSjSE1DuDqjWxAnCFlNkk8tW4c4dLceOjkb
         q8D+pI8Wa1AJycUEAgU2iK4lAznK/WMPkM6kSxSuO0jV31c0bmO0UG/6WVvxRYgYT5sL
         8QnDWgNcphw0FrM1oVkJDOt2qqrMB8Hb1oaaqAzqQdp4Rl3AVxCuYKCWCGr8Wvn71t+P
         bvH9jsF/4xGs1jV5LtobsFJeASmu4REc0L7AwIf8cGCWdXzK3IxT7EXGy6vFYQf8DNOM
         Wqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422401; x=1714027201;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gT1oCZ2mtgDWYp2MEQWyzq5b2kxM4xV7EDO7GfB6Hz0=;
        b=Fpw6mo4qfaTLG9xuxUqNh/xdmW2r/PsPxy5ibaO4y1ioizixgmlBUgNZfGZegIw9+d
         GQIXOPJX79qumpOIOpvp85xb4j4thaukcU7hd+vQpkDYLSn1WGXOwaa8+BdfH6P2YdOy
         WMzDysyFxabLovAs603OwBk9bnZ0Jt+IG0Muq357RrMoa1dIfwO3OLY4Dx++qQ+4gq3n
         QyL59AtU+DuXPzLz8ZF1qfKhwV6EwAOj3M36RWxtUWgh3dnmllD9BqfNVvQUiKOCl77Q
         DlfzIHkdG+kRR4kLuqy7WabhZdagnyZ/QOsCwesf9i9TV6IslG+3LI60QvVhCaKZZYwG
         uy8g==
X-Forwarded-Encrypted: i=1; AJvYcCUqZRqjqncpiF/arpyI4N3ZyjBApWD/H1hBke2sM9aA/ZHxHrf63ODrTk+qVRNcmm1OXXNK5HniT+a8VLpogJAesxdUM6D13gquysB4ub8=
X-Gm-Message-State: AOJu0YxewILwX7SqnX5LiRsQX65yExIBcMpYBS2GbsL0gep6Jc87kqg1
	ajubdt/yaVDL20o+VgM7gOaFio5GlTwof2lnt7MkxaJLfNwvHxIGODfQU/Z7bQ==
X-Google-Smtp-Source: AGHT+IErLHIczrkwXGePH4Q6QSAjjve8BKBdWcorG3Vz/ew9THHeQCewD+nO9huOIrIYXoOA8LHnSA==
X-Received: by 2002:a5d:640c:0:b0:345:663f:cd79 with SMTP id z12-20020a5d640c000000b00345663fcd79mr1217679wru.14.1713422401382;
        Wed, 17 Apr 2024 23:40:01 -0700 (PDT)
Message-ID: <16491a32-a539-4b30-b742-e03174121a92@suse.com>
Date: Thu, 18 Apr 2024 08:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] public: s/int/int32_t
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-2-stefano.stabellini@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240410234740.994001-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 01:47, Stefano Stabellini wrote:
> Straightforward int -> int32_t and unsigned int -> uint32_t replacements
> in public headers. No ABI or semantic changes intended.

I understand there is a limited in scope goal here, but once doing type
adjustments I think it ought to at least be considered to go one step
further and ...

> --- a/xen/include/public/kexec.h
> +++ b/xen/include/public/kexec.h
> @@ -105,7 +105,7 @@ typedef struct xen_kexec_image {
>   */
>  #define KEXEC_CMD_kexec                 0
>  typedef struct xen_kexec_exec {
> -    int type;
> +    int32_t type;
>  } xen_kexec_exec_t;
>  
>  /*
> @@ -116,7 +116,7 @@ typedef struct xen_kexec_exec {
>  #define KEXEC_CMD_kexec_load_v1         1 /* obsolete since 0x00040400 */
>  #define KEXEC_CMD_kexec_unload_v1       2 /* obsolete since 0x00040400 */
>  typedef struct xen_kexec_load_v1 {
> -    int type;
> +    int32_t type;
>      xen_kexec_image_t image;
>  } xen_kexec_load_v1_t;
>  
> @@ -143,8 +143,8 @@ typedef struct xen_kexec_load_v1 {
>   */
>  #define KEXEC_CMD_kexec_get_range       3
>  typedef struct xen_kexec_range {
> -    int range;
> -    int nr;
> +    int32_t range;
> +    int32_t nr;
>      unsigned long size;
>      unsigned long start;
>  } xen_kexec_range_t;

... change e.g. all of the ones touched here to uint32_t. None have a
purpose of permitting negative values afaict.

> --- a/xen/include/public/physdev.h
> +++ b/xen/include/public/physdev.h
> @@ -142,17 +142,17 @@ DEFINE_XEN_GUEST_HANDLE(physdev_irq_t);
>  struct physdev_map_pirq {
>      domid_t domid;
>      /* IN */
> -    int type;
> +    int32_t type;
>      /* IN (ignored for ..._MULTI_MSI) */
> -    int index;
> +    int32_t index;
>      /* IN or OUT */
> -    int pirq;
> +    int32_t pirq;
>      /* IN - high 16 bits hold segment for ..._MSI_SEG and ..._MULTI_MSI */
> -    int bus;
> +    int32_t bus;
>      /* IN */
> -    int devfn;
> +    int32_t devfn;
>      /* IN (also OUT for ..._MULTI_MSI) */
> -    int entry_nr;
> +    int32_t entry_nr;
>      /* IN */
>      uint64_t table_base;
>  };

Whereas iirc at least "index" here would need keeping as a signed quantity.
It may therefore make sense to split the patch (I'd be fine ack-ing the
memory.h and sched.h changes right away).

Jan

