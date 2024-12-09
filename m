Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B289E9B51
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851591.1265636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgMX-00085M-F6; Mon, 09 Dec 2024 16:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851591.1265636; Mon, 09 Dec 2024 16:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgMX-00083a-CJ; Mon, 09 Dec 2024 16:11:57 +0000
Received: by outflank-mailman (input) for mailman id 851591;
 Mon, 09 Dec 2024 16:11:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgMV-00083S-As
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:11:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cecf893-b648-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 17:11:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434e3953b65so16333345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:11:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2162e21321asm40682655ad.279.2024.12.09.08.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:11:50 -0800 (PST)
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
X-Inumbo-ID: 4cecf893-b648-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733760711; x=1734365511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gyzqo7bRVYMufBR17kdjp7iMc+i69+DLutsfKr8+tTU=;
        b=Bh6rfJc58vkkRhmcqFVo+d/Ltzm3XDhCY/WO7+rpAB2wqIAYBq3NVxWMQ7IpvDvRMj
         Giqvr5IPlg3Lo1PnvE7bBq19qJKjdtAOx3ImReRsN1QB1+rka519sS5t+S9rui6WkYLR
         3M+y1Zx79Sw4A/pzeAM+DAWy/DF+h4tU+dCUWwOdXE2kUSZrI7p+Mg5hADNatbr0+SM8
         u475/uxQ/Btz2wHueHzFeUqy/7LEk56dXcLy/Dp4gka2/UmtHQKKYMhDes2DfC7jAUct
         zzLgtetkRmneiKE0nxCgkd2PzOzgDG93tiMqGDRRUJh9QDpoDIeDa0npwE297pVtRw35
         soDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760711; x=1734365511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gyzqo7bRVYMufBR17kdjp7iMc+i69+DLutsfKr8+tTU=;
        b=RmC9Yk/hrToU/TTnuHOHNYD5LxUbT4NEgYXQnZWaXE7bhCSERrHl+VLKemesIuF4/s
         K1qIi2xN3+WSYL0bt8hFLbGaNS7XNnVaRnXzxzkraofFtfYERXnioBdmvxX9m4BtWiZd
         N62tMIE7b7ejzmXoCGP78eDO4SU18OnEjPg7xuHL1U9SHR+c6elhO+u++Xs+rIpfBl+5
         0rW/UVQEmhk89K2Qx2LYr8632Mder+yObRlOLZaa5BbvBKUryhF61t1risk+wHiO3nZO
         8jui0+a7+zpJK2o3pJND4o6LrPJ5yn7vIQEQLOxVnqgEG3LkR672j211GkejMjrjLqAO
         hIlA==
X-Forwarded-Encrypted: i=1; AJvYcCWsCgtqpY0l4hb2Yy038E9lsgt23MHFzgqw1rVvC5LY7xWwklfrV9fnseKZ2l7RjeaLlxdAdHTFQYc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjCSD8o4XNGUz4Hgy85LTQCFmWBQnzt+F4DMsDC2xk6pzEQUKK
	Dg6FPn7EJ3Qnkird4Q72HWT2kMpCW4+nR21tzL8jDhxrtSUyTh+I4y2Ngo9rHg==
X-Gm-Gg: ASbGncuYZAhAu2OFxLN5y3Mu1W8QLCVAkzbVxQmR7UZhWpZo6tEX6O4ClTT0U4kltCx
	QZvTIzbcNuKAP37bKV/D2wF45IPOP0XzaER4cxvu5m1hJkEJVESWFF/k6cRiE9JKl2O66U+FiOP
	vivBAp0gjEG2qkgL8NtWV9T+z9PLpwd6+D3Vja0hFM/ugrOuctmDUVdj9dbAWZsSmYsugBQBqTC
	c46XTQkOE6mEP8kI6SkREgk6q1K+z5CqvBSVuBwXFQHECl5EQqYxlJEQ55hlumkAXYEDLTgerAy
	nKBt94sCeB9EgHu4FtNq3T4AMe2lXdnIEtE=
X-Google-Smtp-Source: AGHT+IGmNpHaOT+4fLUqC65cWUDK16xQMCJs+oPNKzepCaHfISj0rWu5TYQwxkevxiPhyoXaYseAsw==
X-Received: by 2002:a5d:59ab:0:b0:386:3f3e:ab11 with SMTP id ffacd0b85a97d-386453eaaffmr889480f8f.34.1733760711107;
        Mon, 09 Dec 2024 08:11:51 -0800 (PST)
Message-ID: <2948b6c9-eb8b-400f-be0a-274cbf7ffde6@suse.com>
Date: Mon, 9 Dec 2024 17:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] x86/xstate: Create map/unmap primitives for
 xsave areas
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:32, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/include/asm/xstate.h
> +++ b/xen/arch/x86/include/asm/xstate.h
> @@ -143,4 +143,46 @@ static inline bool xstate_all(const struct vcpu *v)
>             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
>  }
>  
> +/*
> + * Fetch a pointer to a vCPU's XSAVE area
> + *
> + * TL;DR: If v == current, the mapping is guaranteed to already exist.
> + *
> + * Despite the name, this macro might not actually map anything. The only case
> + * in which a mutation of page tables is strictly required is when ASI==on &&
> + * v!=current. For everything else the mapping already exists and needs not
> + * be created nor destroyed.
> + *
> + *                         +-----------------+--------------+
> + *                         |   v == current  | v != current |
> + *          +--------------+-----------------+--------------+
> + *          | ASI  enabled | per-vCPU fixmap |  actual map  |
> + *          +--------------+-----------------+--------------+
> + *          | ASI disabled |             directmap          |
> + *          +--------------+--------------------------------+
> + *
> + * There MUST NOT be outstanding maps of XSAVE areas of the non-current vCPU
> + * at the point of context switch. Otherwise, the unmap operation will
> + * misbehave.
> + *
> + * TODO: Expand the macro to the ASI cases after infra to do so is in place.
> + *
> + * @param v Owner of the XSAVE area
> + */
> +#define VCPU_MAP_XSAVE_AREA(v) ((v)->arch.xsave_area)

When this is fleshed out, I expect (hope) type safety (type of "return
value") will remain to be there. I think it would be nice ...

> +/*
> + * Drops the mapping of a vCPU's XSAVE area and nullifies its pointer on exit
> + *
> + * See VCPU_MAP_XSAVE_AREA() for additional information on the persistence of
> + * these mappings. This macro only tears down the mappings in the ASI=on &&
> + * v!=current case.
> + *
> + * TODO: Expand the macro to the ASI cases after infra to do so is in place.
> + *
> + * @param v Owner of the XSAVE area
> + * @param x XSAVE blob of v
> + */
> +#define VCPU_UNMAP_XSAVE_AREA(v, x) ({ (x) = NULL; })

... if this was typesafe (at least on x) from the very beginning as
well. Thoughts?

Jan

