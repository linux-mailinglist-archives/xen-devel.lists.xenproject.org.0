Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2024C9B442C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827102.1241593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hYP-0003v7-1t; Tue, 29 Oct 2024 08:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827102.1241593; Tue, 29 Oct 2024 08:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hYO-0003rx-Ts; Tue, 29 Oct 2024 08:26:16 +0000
Received: by outflank-mailman (input) for mailman id 827102;
 Tue, 29 Oct 2024 08:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hYO-0003rr-79
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:26:16 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 769b85c4-95cf-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 09:26:15 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43161e7bb25so49677615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:26:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b579968sm167146265e9.39.2024.10.29.01.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:26:14 -0700 (PDT)
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
X-Inumbo-ID: 769b85c4-95cf-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730190375; x=1730795175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ksTbZP07FbGaPxA08RDchhZppw5LpHT8BHRa+YtuE78=;
        b=Ss9/X889DUymCI9If505/Iw+F57/6D3htHVDgfZOXqQmzEMkX4X8ZPHaisk+bzENmD
         T+v8z8yVkU6tXHDewWttubsxw7iNi/mYoP4p4142438KdNgjayT/XIGSJA+YZomSaS7j
         Lw/bZis3F4wMZkwcYr86HJJttwaryfrQjndyrDWPhITZa7FJoBu+B3QQ/CGewqdfFmfP
         md2Cb0x5Le0rE/vosynFnXX6VAnKfrMDiWXng/vAQzYEQ5zdPq1Z4gsQCtujqDUio3ae
         XSg+wQJnZqy3/pOQyLAN+cYafyYK9b7mzu4HYtY7zWu6kJ1l0NwkuRX9evKiZdJXzNw/
         XhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190375; x=1730795175;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksTbZP07FbGaPxA08RDchhZppw5LpHT8BHRa+YtuE78=;
        b=B3lyhumIESFEacPyDmWhkusPtkOea1NLd5Srdq8+xTbp+jqJ9SwSItzgAj2LePqKhY
         H2cRXEhx0QGfz7PVARk2eFnd+QpLsygaVUWNCSbvxKtoy2McA4JirPG/+xDkfB4E/tTn
         0ZgtMxQ/fYnqgDCCwfDbiW3oP2R9yLxrEm/l83qlLJl+6JHFHl5Us2QqQjddQP8KenX+
         AgOCnb1NAL9/Z1m9mAtyZ1MJIGrzBXPwjNbyyvDRlpjnyEydDYiKGeZLFJBqtqkgVtpV
         LivFa2gDCltZ02VUPrcAGVC8aXFQ+uKZdtu6FfAshRN/oIbnN6j8N61EHDPkLfk7k8+Z
         TpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtRgNxp20BzuJsgKVuE4E0mlCPjx+OQk4bPOoScoLgGH4zRyF0LGdE6Y/nZk3nWpRBWAyF2hrR6rc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGzgsHJhv6gdgzuQyWeGb/iHBtisei9pRTM5sS+fQfQBYWzZmA
	BwCLRQkmURz4YVjwm3A9a7F/qj9ZI6uMZSs8a/y9uWsir67KOaVqSgY8Ups3RQ==
X-Google-Smtp-Source: AGHT+IGxpT0PtowK4nXbwBo6xmR4wpQwfJIyxx54rD3fMRCd/5GyvEjX7dU4G/ISQXQI7gpwBX8Y7g==
X-Received: by 2002:a05:600c:524c:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-4319ad234d3mr88321435e9.31.1730190374811;
        Tue, 29 Oct 2024 01:26:14 -0700 (PDT)
Message-ID: <4f49f8df-d455-4be2-a245-e876713addf1@suse.com>
Date: Tue, 29 Oct 2024 09:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] x86/xstate: Map/unmap xsave area in
 xstate_set_init() and handle_setbv()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-6-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241028154932.6797-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 16:49, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -993,7 +993,12 @@ int handle_xsetbv(u32 index, u64 new_bv)
>  
>          clts();
>          if ( curr->fpu_dirtied )
> -            asm ( "stmxcsr %0" : "=m" (curr->arch.xsave_area->fpu_sse.mxcsr) );
> +        {
> +            struct xsave_struct *xsave_area = vcpu_map_xsave_area(curr);
> +
> +            asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
> +            vcpu_unmap_xsave_area(curr, xsave_area);
> +        }

Since it's curr that we're dealing with, is this largely a cosmetic change? I.e.
there's no going to be any actual map/unmap operation in that case? Otherwise
I'd be inclined to say that an actual map/unmap is pretty high overhead for a
mere store of a 32-bit value.

Jan

