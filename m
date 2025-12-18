Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB39CCC747
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 16:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189817.1510525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFuH-0004eO-AJ; Thu, 18 Dec 2025 15:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189817.1510525; Thu, 18 Dec 2025 15:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWFuH-0004bJ-7J; Thu, 18 Dec 2025 15:27:09 +0000
Received: by outflank-mailman (input) for mailman id 1189817;
 Thu, 18 Dec 2025 15:27:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWFuF-0004bD-Si
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 15:27:07 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02cc662b-dc26-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 16:27:06 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so7469835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 07:27:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3286e72sm44073445e9.15.2025.12.18.07.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 07:27:05 -0800 (PST)
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
X-Inumbo-ID: 02cc662b-dc26-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766071626; x=1766676426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JHLHzXFqeQNuBT/YaIpQNpdKJL6MPjWbCC3ZJ9xRFxE=;
        b=DG6s11uI7YpJLzSXfQRURgXfXbytUNOyCwhhDlzojBF6cyZLyoCK7gKAkie3KxlFIS
         8TNguwgEQ6PGz9GAen4CC8Mll1ibu+WVoEf0G4zaxyNcjrLMjURR93otEiik+BeJ4nbm
         FF1tDd42GAvmb66MNt9EPjeeaHsrHXVJ4GGKWmHxR3HhOeE7b527+/EoNa4nCagGDqoV
         RBnwwtYM/hazf1qXVgpO6TIGth+BWAOYKXYtzWbQ6AV/DBRqf5Lb6oKoGqCpeHGGr4me
         YFhIM4jfCvNkzAOCn9VYtItuRhW09SGzs9PVnGUcCjIUxogiMQmbpqpU/uDJJeqtt9OZ
         AwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071626; x=1766676426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHLHzXFqeQNuBT/YaIpQNpdKJL6MPjWbCC3ZJ9xRFxE=;
        b=ajbfjL//pv5VVexRQfk6tX4AysnGWnio44QGtbXgOaTrDpxvULr5HSI5XY3dgCs6BZ
         yfQZ+5eo4NSROhZIouRUgvwCrjJDoLm8qsrpUdysDrTYfPCZjvk6gZd+X4ztDwuz528M
         BLP/bIuEaz7m63/M9BNub1YW6GU9HVpMwUsuJcVX9RtbkQxmR+pDy28SXObD7fXciAeC
         5v8yBQ/T6njnYoA0nCqpN12P3KvOkegMj1CIUfHGys+kMMgO8opA5nFatHL0F4qxBJIR
         7IxXwSGQOpNIBVNy7/Ii9Df9OsI74krsGhjkQBV7V415S3kOa+F6MFj0HaJwoS5yS0cJ
         m3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCW27oGCFTyAJ2xrr5fY8eqpP3yV0XBqfYjyVTP1XiaM8L+Z+AA0HG4DMYuYzZbbvvIDdm6g2J6NwPE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx98MSXvHdh8U5nWfk1YTi2/aWZ4NbzxTovyRj49nWQb0woinFe
	KrKHznlqzrHHUVKp7H+LMvga9wDPb8g40PZkQVd4b/O58WxwATWcIGmlPYZyOtX1kA==
X-Gm-Gg: AY/fxX73mLIUSAlOlKfYx+nkxsrva0m++iGQIn6c4mtSX+fBKbL0KcXvAbysBzspplo
	b2KeSCGdbUQLQbZ9GLPu9ocXpCfw1GIwZJBOi/ngGiJF0ZEKfSrxXjMXrN1g38hc+5h2qbnBhPB
	T8Sx8jyyuTKtxMRp4aoSwH3zhxACvor0G1q2j8w0pLgW++lr8IzUZ+guUYB62KE6iqiG0vmLxq9
	YOcOydNVyovu7tkRkV207SVIPYx7EIRytppy+aEzL0pqJifm1+4/cSpqz4sXOaIwD3DAFeh9JNQ
	O/Q44PXck+5nspWW/R/CK8tyh3SYWaWockF0J+n926DxOps4TzMofWbyyamoLzNndE1LGAzMmAw
	lghNAiJ55vAy13YXTWC4tPV83nkrs2kywmc8aIAp18DfQ7AzKYQfosbP0fQoB752BJAFL7QEROL
	jb55ij7IWYekPUel8vltoHiOQp+S/iUxHFp3El4hKLmiNuBRhlkmDRiwjjk8t2FiFBgg7kI6HUO
	bo=
X-Google-Smtp-Source: AGHT+IEgVAOGRbEiLxnSWcLDNVYlzMl+foRqhcS4BWabdPKXt8EGstBvG74Qs/lpWl0zPbjjo0hwAw==
X-Received: by 2002:a05:600c:699a:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-47bda6e58d4mr87075315e9.14.1766071625743;
        Thu, 18 Dec 2025 07:27:05 -0800 (PST)
Message-ID: <b9e1d2d9-22c9-4574-9f83-46ab649d28af@suse.com>
Date: Thu, 18 Dec 2025 16:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libs/xg: allow caller to provide extra memflags for
 populate physmap
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20251218151728.28339-1-roger.pau@citrix.com>
Content-Language: en-US
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
In-Reply-To: <20251218151728.28339-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 16:17, Roger Pau Monne wrote:
> --- a/tools/libs/guest/xg_dom_x86.c
> +++ b/tools/libs/guest/xg_dom_x86.c
> @@ -1260,14 +1260,15 @@ static int meminit_pv(struct xc_dom_image *dom)
>      /* allocate guest memory */
>      for ( i = 0; i < nr_vmemranges; i++ )
>      {
> -        unsigned int memflags;
> +        unsigned int memflags = dom->memflags;
>          uint64_t pages, super_pages;
>          unsigned int pnode = vnode_to_pnode[vmemranges[i].nid];
>          xen_pfn_t extents[SUPERPAGE_BATCH_SIZE];
>          xen_pfn_t pfn_base_idx;
>  
> -        memflags = 0;
> -        if ( pnode != XC_NUMA_NO_NODE )
> +        if ( pnode != XC_NUMA_NO_NODE &&
> +             /* Only set the node if the caller hasn't done so. */
> +             XENMEMF_get_node(memflags) == 0xFFU )
>              memflags |= XENMEMF_exact_node(pnode);

I'd like to suggest to avoid open-coding the 0xff here and elsewhere.
XENMEMF_get_node(0) will be less fragile overall, imo.

Jan

