Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97164B0C181
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 12:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051372.1419704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnzd-0003pY-SH; Mon, 21 Jul 2025 10:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051372.1419704; Mon, 21 Jul 2025 10:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnzd-0003o7-PG; Mon, 21 Jul 2025 10:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1051372;
 Mon, 21 Jul 2025 10:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udnzd-0003o1-08
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 10:43:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ca36401-661f-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 12:43:33 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso2941718f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 03:43:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c89d55c8sm5588148b3a.62.2025.07.21.03.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 03:43:32 -0700 (PDT)
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
X-Inumbo-ID: 8ca36401-661f-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753094613; x=1753699413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G9zwzW2RngQe0UoL7/8wWzxdvxN09vlqkp+bU2eQ5PA=;
        b=gqYE4gNy2ZX4XcdrDrcy30mDcp6OheuUrw+eqYYtVOHuxpf6csvMgUGPCs9Ieq/BnY
         CRrsRsMKmu+tThTWbeNRliUBdxhlWS5IOhRTYPjCKVddsQU0jQwWUM1HqPBWWSvZ1fqw
         S76yg2bwPPPt+iDGCnq1HH7pJLQb3q+69m6I0oJaLC5pBgyZeKBdFd1w4bdI1+99b+MY
         amLdo28wPJIRYwwG+64yduKOCVUVU/f/ruZ4CdQ/RecRuh0iJcmVVQ3801zBhV7tQtNU
         OWKVBdzrectZzWpKYmsMPNbF9yhUaQIA9zcYMZAa1g4KAOiC9Ljt1Hbed0Gh0Huk6KrL
         JjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753094613; x=1753699413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9zwzW2RngQe0UoL7/8wWzxdvxN09vlqkp+bU2eQ5PA=;
        b=sVrDpWqin8j5SXcFTeorql1rmf8VY7SBT9fyTdM5Ba6cxo+dnCL/AwEI/qP27MUc1f
         sgUnPfiOPz8sx3rFgp7TZqKsPWYjR8f1NJYl03Cb56ufVWBsFxPi6TB0oJ8l0DsgqRmU
         f9FYNtBBdKFAYIJqcI8Xvpu/9oux0a+Qkx0H/IsQUTCs8SYGMBJKXRa6qPrlmLk8cX4G
         T/NqlqWSoqKj9Rlo2O+pz2NAg+ImpNKJOYiFZk+o0AqhCt1XIYPTabEPaZ+u3yDklrHS
         +Ixgkj4cnNo0yhKa7vjZQrGTO/ccAeYzvq9EiIi+DGG0+eaA2LKdjrm5z98luLAfyj/I
         s2sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUfS2OmIp1u1Vz2ID6SbE7fqqy9y9QSZE4WVQOABKbenTnG5cG+bW9nCQayOUv1Ly4Yo5SLN1cpgA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxq0vyqvPYjoSiS5NLvd34sFkku6+d2/XtqBQ0uI2LFBYdEce4F
	Tj6ADAxEmpyA/mbv8VkdoNPbToaRG7QY9yRlaKm1tQohV3ixRIyVUEsWd+bLmo9uYw==
X-Gm-Gg: ASbGncsCCUf3XKU0UMxnWntfANdRYA1uH8beF2ea4rByt2E9sDeRc+lzLUnEjY7wimN
	nWi1atjO7iLW8wRqZEpXEoO55Wefges7rjiQMeFqABkjjGWmxwEx6PphOTjapHxUd8b/uGLuHBF
	HctflBM99E1taJbiDT1PXcTpmgKGaqlWSWCpBW7m8aexdvbZx5eIrRvsn+h8nnlA9jOm0+Tgaa7
	uZ1REDhdzG0WH8Ec8VxIvExMMRqXrZdcuFLlLGa8PT9dU9ScjgGlFBzXLT7mtkau8p/XofrpagD
	zeumoW7GuXpKkiH/vjrnj12+fUeVQt2XYoc3QKxsqsjIvK1afGpP9WoxFeR8swBg6NCCPUfo3do
	By56ksZdGPLhCZZMyWkee6GUVt0lbsdh1wRToWUPrivNngmaEiS3YHwGRX8370ml2zU1XUzx/rA
	KaSJbEx9OgoOik44yxKw==
X-Google-Smtp-Source: AGHT+IGzRiIuMZsCdMLEwB6X2HBAMNGLwMQRM4flJClip9M5FZkcpFUOMx7ifboUYijhenzCg6Uc0w==
X-Received: by 2002:a05:6000:1447:b0:3b3:1e2e:ee07 with SMTP id ffacd0b85a97d-3b60e53fa01mr16172749f8f.56.1753094613331;
        Mon, 21 Jul 2025 03:43:33 -0700 (PDT)
Message-ID: <146034c2-7d35-40f6-ad07-8101df02b3a3@suse.com>
Date: Mon, 21 Jul 2025 12:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/core: Update vcpu_runstate_get() to return
 nonaffine time
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
 <20250721094951.2006-2-bernhard.kaindl@cloud.com>
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
In-Reply-To: <20250721094951.2006-2-bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.07.2025 11:49, Bernhard Kaindl wrote:
> --- a/xen/include/public/vcpu.h
> +++ b/xen/include/public/vcpu.h
> @@ -79,8 +79,18 @@ struct vcpu_runstate_info {
>      uint64_t time[4];
>  };
>  typedef struct vcpu_runstate_info vcpu_runstate_info_t;
> +/* vcpu_runstate_info_t is in the Guest shared memory area (frozen ABI) */
>  DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_t);

Personally I'm opposed to this kind of comment.

> +/*
> + * Extra information returned from vcpu_runstate_get that is not part
> + * of the Guest shared memory area (not part of the frozen Guest ABI)
> + */
> +struct vcpu_runstate_extra {
> +    uint64_t nonaffine_time; /* Time running outside soft_affinity mask */
> +};
> +typedef struct vcpu_runstate_extra vcpu_runstate_extra_t;

And the next time we need some further piece of statistics, we'll have
to add yet another new sub-hypercall? Or wait, there is no new sub-
hypercall here. How's this piece of data going to make it out to guest
space then?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1110,8 +1110,8 @@ int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity);
>  int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
>                           struct xen_domctl_vcpuaffinity *vcpuaff);
>  
> -void vcpu_runstate_get(const struct vcpu *v,
> -                       struct vcpu_runstate_info *runstate);
> +vcpu_runstate_extra_t vcpu_runstate_get(const struct vcpu *v,
> +                                        struct vcpu_runstate_info *runstate);

As long as it's only a single 64-bit field in the struct, returning this
by value may be okay(ish). Yet I'd still recommend against doing so.

Also, having reached the end of the patch: Where's the caller making use
of this new return value?

Jan

