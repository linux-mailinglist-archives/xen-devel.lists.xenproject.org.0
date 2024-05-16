Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CE8C766B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723278.1127986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aGL-0002zt-2S; Thu, 16 May 2024 12:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723278.1127986; Thu, 16 May 2024 12:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aGK-0002xt-W6; Thu, 16 May 2024 12:31:08 +0000
Received: by outflank-mailman (input) for mailman id 723278;
 Thu, 16 May 2024 12:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7aGJ-0002vB-Tt
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:31:07 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 292ba30a-1380-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 14:31:04 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a599a298990so341816566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:31:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a8b634cdcsm290995666b.93.2024.05.16.05.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:31:03 -0700 (PDT)
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
X-Inumbo-ID: 292ba30a-1380-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715862663; x=1716467463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6Jl3scWQzYKH3aqoYM+MbdxOBcOQosmLLJsxmjmqf0=;
        b=L1SmPFzptd1OCCvjQjdEOt+u/Dmwhjt9pREWDd/QFCbCHOFE23ia0uDvaXFvZ/dbXM
         65ROdiv2XuFeXs4xPzh2jpqiNMhR7CIQ0UtNp8NwEIBj9Y/76vg0eacHkPGLH8ko2pLv
         wEFPv4qtJE4bdFNcDS9iShD+7ZGcmGVfbiYTdgR2W9bkm/NV4+l49axqOriW/xQJEBFX
         Mcq0iQmaUBy2kzMupiZVAgcn9lPEmSkSirrHsW4bPwZv2npbVtek6q+/9aBaO+lC9q4k
         /4Zb6pozYJclfxuFugP+8ZzvZW/wjG+vxzieNbM0zlGiysUTgoKButzy+BGlAs7ywzPj
         CEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715862663; x=1716467463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6Jl3scWQzYKH3aqoYM+MbdxOBcOQosmLLJsxmjmqf0=;
        b=F1Lqfon4DUC3IW+rcXxrKZkDZWvep+If/ict0npGOweX8ZWO8Nv9yGGuF3GQbDzpka
         UDDvtzmt10H4RMF5gG9vFCBdVY+qTGdigxTFn21Yf18sFl4ePcije3B5cQcjWL6hMBww
         G7TLKlTWjMkPS2Go4u/vR0EZY7wCtV9E4pr26nyeHjQ9kZHmTQCcwUxPIWoIGdSTojNC
         soQ43nXf/Rlg735Ae4+DGazGOeLObsRNKPbIT17+ftVKdg+YynYQZ6BRKCQvXpsq08mp
         U8CNcWKSkSpE0O3+FOoChSNcCd43zX9Lg1dSp+pfbQ+GlF7OtDbiXZImwqP70oSjCw3E
         mHqA==
X-Forwarded-Encrypted: i=1; AJvYcCWQksVrvLym/W36zuuCRxwShjSZBTcWUP9xKS8q9JX7OURKtdFbKGJNWOFu7qedJ6jLYOIvRDr2mkOsOGZ4DQ1Ehbk26/x6uDz8BoER01I=
X-Gm-Message-State: AOJu0Yyl0MEpxyep7tt5LYRZFnEGm3kFWYifmKxMPF0RGAQfg4UZaeBl
	Cib8mU/yqpBoBKQhI03agVK8IYy2GfZT1KSqQvDmJs+kPOg9bBAP6NPom2M8SA==
X-Google-Smtp-Source: AGHT+IGBEN96TpjIslGxdcss8E719zdXnuxhhMxmdiylrd3LuaRUjFkCajtn/0gnm4fqIx/h2OJCmw==
X-Received: by 2002:a17:906:34c7:b0:a5a:4683:e961 with SMTP id a640c23a62f3a-a5a4683eaf3mr975258966b.52.1715862663448;
        Thu, 16 May 2024 05:31:03 -0700 (PDT)
Message-ID: <28138e7d-26c7-4faa-86f1-a1c7b175114b@suse.com>
Date: Thu, 16 May 2024 14:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] xen/arm: Add XEN_DOMCTL_dt_overlay DOMCTL and
 related operations
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-7-xin.wang2@amd.com>
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
In-Reply-To: <20240516100330.1433265-7-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 12:03, Henry Wang wrote:
> +static long handle_detach_overlay_nodes(struct domain *d,
> +                                        const void *overlay_fdt,
> +                                        uint32_t overlay_fdt_size)
> +{
> +    int rc;
> +    unsigned int j;
> +    struct overlay_track *entry, *temp, *track;
> +    bool found_entry = false;
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> +    if ( rc )
> +        return rc;
> +
> +    spin_lock(&overlay_lock);
> +
> +    /*
> +     * First check if dtbo is correct i.e. it should one of the dtbo which was
> +     * used when dynamically adding the node.
> +     * Limitation: Cases with same node names but different property are not
> +     * supported currently. We are relying on user to provide the same dtbo
> +     * as it was used when adding the nodes.
> +     */
> +    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
> +    {
> +        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
> +        {
> +            track = entry;

Random question (not doing a full review of the DT code): What use is
this (and the track variable itself)? It's never used further down afaics.
Same for attach.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1190,6 +1190,17 @@ struct xen_domctl_vmtrace_op {
>  typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>  
> +#if defined(__arm__) || defined (__aarch64__)

Nit: Consistent use of blanks please (also again below).

> +struct xen_domctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
> +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
> +#define XEN_DOMCTL_DT_OVERLAY_ATTACH                3
> +#define XEN_DOMCTL_DT_OVERLAY_DETACH                4

While the numbers don't really matter much, picking 3 and 4 rather than,
say, 1 and 2 still looks a little odd.

> --- a/xen/include/xen/dt-overlay.h
> +++ b/xen/include/xen/dt-overlay.h
> @@ -14,6 +14,7 @@
>  #include <xen/device_tree.h>
>  #include <xen/list.h>
>  #include <xen/rangeset.h>
> +#include <public/domctl.h>

Why? All you need here ...

> @@ -42,12 +43,18 @@ struct xen_sysctl_dt_overlay;
>  
>  #ifdef CONFIG_OVERLAY_DTB
>  long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
> +long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op);

... is a forward declaration of struct xen_domctl_dt_overlay.

Jan

