Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56D39DC285
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 12:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845907.1261224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGypt-0005qo-BG; Fri, 29 Nov 2024 11:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845907.1261224; Fri, 29 Nov 2024 11:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGypt-0005oG-8R; Fri, 29 Nov 2024 11:06:57 +0000
Received: by outflank-mailman (input) for mailman id 845907;
 Fri, 29 Nov 2024 11:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGypr-0005oA-RZ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 11:06:55 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09cfefb8-ae42-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 12:06:53 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cf9ef18ae9so4939053a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 03:06:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d410dsm164348566b.66.2024.11.29.03.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 03:06:52 -0800 (PST)
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
X-Inumbo-ID: 09cfefb8-ae42-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA5Y2ZlZmI4LWFlNDItMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODc4NDEzLjEyMzY3Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732878412; x=1733483212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc4D9daP2jgGDWAVkZSMOGIQAs0gCD6njQOTAAljpMQ=;
        b=OYYOto/AO9ajs30nxAu8sIMCAAZFrHtx4caA2o1lS/VKrTu1eLd8TwhER7jcXlAU5m
         mt4oe2ifUxGksQaMoJM5c/ziXis+5Krv2tZsQroTgjJ8r81JnJGnqYQI5tY2PJWxz0NL
         EuI+v2kIQjzzmUZV+nA+0hNO7NKcUDO4uUIZ01I0jgjlVFLxLroIV+iWdnrN3zT5MoPC
         BOmJCNGK4sUv5c19TFC1MTdv30Y+mH8lPfG8BFprlzywni/rYqvrEBykh2N5NMgISeRG
         PF7pz+uMypLuAXWJNalIpnUZFH1k4Ptpkmw+yO1gJPYC/HEQGxqEP0qq9QGez54VQi/s
         xVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732878412; x=1733483212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc4D9daP2jgGDWAVkZSMOGIQAs0gCD6njQOTAAljpMQ=;
        b=ppwtvbhhKAig/uJ7ZRwnqP5r4vFd36OGoW+JbenMnWoc40Dbrsa78fg6a6U3cmVMsF
         LY5kj25yoi3euZk4QxhRCt2FdKZ8kxL1WFqO5GoYE4WNKgtqIoA+ZuDHi8Lfmz716JCw
         nhlQV7aSnizAXoMl5B5rxzgSRNe/9gDfFwFOqeCHiPSQdF4cOVZKyJsxd9kIGphLkYtF
         mAbhLLYOetJu6Bs8GuGgt3T2ZvHzg6jiN6TrFV+J0GjE1fX49G/ZYyzttHOrwg+ODdrp
         GQWsLUqfIhYq4Rq/pSkMHtwJkaVAgkSPaTm5wGXMpJDFiC35T3um4ZXZwsmNUBeQWboQ
         DLzw==
X-Forwarded-Encrypted: i=1; AJvYcCWOQc0zzrXemvPp1ojx7ZK5StkoGYyRbmOcampe2tdBLWrTHkgIB+WneenX++iInesDbqnuNe+5mCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbHy2BirTDnjruRL6oobnu/DYSD4V7YMYiw81Ta0hXv2VbDmO3
	cBEMVhK419lV+wyuTxVWZMuBNZqu4rOyJdiokoR3VZhMoOda07BHqX2p6ZohDw==
X-Gm-Gg: ASbGncscux1pOQsxCyv4lx5TwyeK6k8IaPNhNzEWhlsSNgV+gbG36fYJ+EAO4J2RtxH
	62rn4C03OhNs+kZvjK+r1v89pn0fd5bcp8Ebz8/F65qwhR31byyxSubYuLkELlD2B/KJ5e6Nkzn
	b974tHj5CbUcjk5UvxD1KCSDJw5VwgwPue/yuuWmu3EA77TgzBEbSzjIM2OcRFpa6RDxyzBND3x
	CP1dQYhQWXSIhKL5LCuE2S+7a0q5xjs5BRtJ0VQwR/bn0EIJEcivB0OoD9mUA2eLNtxsbot/kgD
	MupI5qWu0zptpxVZu3sYggihpKyYPbRYuhY=
X-Google-Smtp-Source: AGHT+IH5K4JEHeYPuqPNXNjI3fcvRDye0qmet2J9C07OLA1meFM6V2ttPPDkOnUbFa6VNLaXPoWnnw==
X-Received: by 2002:a17:907:7819:b0:aa5:3c57:c407 with SMTP id a640c23a62f3a-aa5945f4ee6mr799817666b.16.1732878412365;
        Fri, 29 Nov 2024 03:06:52 -0800 (PST)
Message-ID: <63022d0b-5761-4392-8280-fbfca8c679f7@suse.com>
Date: Fri, 29 Nov 2024 12:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241129091237.3409304-1-luca.fancellu@arm.com>
 <20241129091237.3409304-2-luca.fancellu@arm.com>
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
In-Reply-To: <20241129091237.3409304-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2024 10:12, Luca Fancellu wrote:
> --- a/xen/include/xen/xvmalloc.h
> +++ b/xen/include/xen/xvmalloc.h
> @@ -40,20 +40,46 @@
>      ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
>                               __alignof__(typeof(*(ptr)))))
>  
> +#ifdef CONFIG_HAS_VMAP
> +
>  /* Free any of the above. */
>  void xvfree(void *va);
>  
> +/* Underlying functions */
> +void *_xvmalloc(size_t size, unsigned int align);
> +void *_xvzalloc(size_t size, unsigned int align);
> +void *_xvrealloc(void *va, size_t size, unsigned int align);
> +
> +#else /* !CONFIG_HAS_VMAP */
> +
> +static inline void xvfree(void *va)
> +{
> +    xfree(va);
> +}
> +
> +static inline void *_xvmalloc(size_t size, unsigned int align)
> +{
> +    return _xmalloc(size, align);
> +}
> +
> +static inline void *_xvzalloc(size_t size, unsigned int align)
> +{
> +    return _xzalloc(size, align);
> +}
> +
> +static inline void *_xvrealloc(void *va, size_t size, unsigned int align)
> +{
> +    return _xrealloc(va, size, align);
> +}

Just to double check: Was it at least considered to use simple #define-s
to effect the aliasing? Wrapper functions like the above ones have the
downside of needing touching (easy to miss) when the wrapped function
types change in whichever minor way. (And yes, I do understand that we
generally aim at using inline functions in preference to macros.)

Jan

