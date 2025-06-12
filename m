Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6AAD71DD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013090.1391631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhyD-00080x-9X; Thu, 12 Jun 2025 13:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013090.1391631; Thu, 12 Jun 2025 13:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhyD-0007z1-6j; Thu, 12 Jun 2025 13:27:53 +0000
Received: by outflank-mailman (input) for mailman id 1013090;
 Thu, 12 Jun 2025 13:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPhyB-0007yv-Ic
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:27:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 095c8589-4791-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 15:27:50 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so11026405e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 06:27:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fd62c2d65sm1108433a12.52.2025.06.12.06.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 06:27:48 -0700 (PDT)
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
X-Inumbo-ID: 095c8589-4791-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749734870; x=1750339670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fxnfw+jwQYw5NuVhxc0jjRyWOMGtOF6GJ0xpu9TzAvQ=;
        b=Sks2tKri9V0fwqzOoX3/Oy7n2RZHAcHMlgZFQv6D18m6Ww3bEd1+6he4ws/5Nx+Z/i
         3piKm/m3+sJMC7sSrch18hFyDgNFLa6lDpxe0hGGVXwRdeMxZn9HnGkTr0iOdEBx5Xcs
         Nshf1C6WDB8hl+ZWTB1dsjwMvmY2V8YTNvRsZeX0lwSpftL/O2QWc45YNv1IOrAGg507
         /DnikYnwhPrLh7TB8s5y5zs2OLQDNPhy5tQuYE7GpE2ltDAtEtgZN7YOQYEttPyqBLEu
         Jc7gxUOr7q+1jKJFdGmZBpfudLKHgf4uA9Q47neacZ1VvuWLrLpuyXVCBhSODBJAIwZn
         otmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734870; x=1750339670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fxnfw+jwQYw5NuVhxc0jjRyWOMGtOF6GJ0xpu9TzAvQ=;
        b=HiO1I654M1H3mZf3InAqf1EcHlwya1AE5OSnYqpc4C8e4FAakT13Ch8OOkwIdR8lAm
         IG2afqs+770C4sXm78h53peJojgt8BTvJw7M6WtK9gJhAJ+2pIIvTPNPCPYVzwA/H6Kd
         +TDUIdzdeZ5BOyalO+JXckUTkkGr2hqddTmSMlesGTGOrFTzZIPs6ReQDgj6M18wQcLB
         75pX4CmKSLkCkBH/kW5AVqKz77zCWOLldOTAJVvqG2KPQEEncn1uq88fy7hUkyh6Kp5x
         77icv4YxZwoRsyKVHx6sc43e0zF9LBMtoVOHksmwykyKjUfJKZdQlZB+AizwP3bxLJ/n
         Khlw==
X-Forwarded-Encrypted: i=1; AJvYcCUxn2TCzucuQqUP4ErezlZyhCC0TPHljS3kF/g8SwVrbP45vx8GbOv0gnLagebrI1at/9oeKeBV7oA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE55lvNxWZ4PXQbdUQYXq8DOnoNv7ngF/Oo6a4B1o5SxMSMb2t
	s+1gpyC+iFybwGAxjfohzPzPRS71DdnKE4Kp/GwkWcMYC0R9iJ6U1cTl2RU1tZjpmg==
X-Gm-Gg: ASbGncuCrlXoeXfXtDVbC/StkO/rfKHXT5+ynITRkwpnXw5F7GVLo90vFcbKcyS/M8Y
	yzip0fwZkWl3EtM0Rf3OHfp4Q/9nIDwv7sfWo3V+19tioBVjy0D0hrHULm3cOcWb4mvL4hyFzel
	zE5LVAOr55SP/HC5/QvPO6oCAHWi3gMl1MbfwW4MZiahFGzzQQEtxV4WqUSthnEr6rNhYHEtAzE
	+TpmoyZAZszRSyUbZ1Rn1rWraej1FY+zPS2TFYCDUic642pBGm7imUJgNpZu1+MUQRrwGR/7RA0
	0Ze5MoGnT/pSva9QqWtDwxinV9jaWPwg5pVP+BQ9/h/dR8bA7QPMMPln8IP6XfK7B7/irKMhGth
	8vSfiWv/+oXqwsgx3ZuypaiTKJ6MzlvTRQBuqUooMCEe0XX8=
X-Google-Smtp-Source: AGHT+IH3iUPlYVXlklur4seHf5ZUvRv/WrRApQz9xyWpA867rJrMtly69CFMzHp2u+lMMjJ7Hxtziw==
X-Received: by 2002:a05:6000:188d:b0:3a4:d0dc:184f with SMTP id ffacd0b85a97d-3a5612f42a1mr2811521f8f.39.1749734869550;
        Thu, 12 Jun 2025 06:27:49 -0700 (PDT)
Message-ID: <26da6299-4000-46f3-835e-ad926a4f91a7@suse.com>
Date: Thu, 12 Jun 2025 15:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/18] tools: drop "has_num" condition check for cppc
 mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-17-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-17-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> In `xenpm get-cpufreq-para <cpuid>`, ->freq_num and ->cpu_num checking are
> tied together via variable "has_num", while ->freq_num only has non-zero value
> when cpufreq driver in legacy P-states mode.
> 
> So we drop the "has_num" condition check, and mirror the ->gov_num check for
> both ->freq_num and ->cpu_num in xc_get_cpufreq_para().
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4:
> - drop the "has_num" condition check
> ---
> v4 -> v5:
> - refactor title and commit
> - make all three pieces (xc_hypercall_bounce_pre()) be as similar as possible
> ---
>  tools/libs/ctrl/xc_pm.c | 43 +++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
> index 3c9e272aee..cdc072e757 100644
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -212,34 +212,41 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>      DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
>  			 user_para->scaling_available_governors,
>  			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> -    bool has_num = user_para->cpu_num && user_para->freq_num;
>  
> -    if ( has_num )
> +    if ( (user_para->cpu_num && !user_para->affected_cpus) ||
> +         (user_para->freq_num && !user_para->scaling_available_frequencies) ||
> +         (user_para->gov_num && !user_para->scaling_available_governors) )
> +    {
> +        errno = EINVAL;
> +        return -1;
> +    }
> +    if ( user_para->cpu_num )
>      {
> -        if ( (!user_para->affected_cpus)                    ||
> -             (!user_para->scaling_available_frequencies)    ||
> -             (user_para->gov_num && !user_para->scaling_available_governors) )
> -        {
> -            errno = EINVAL;
> -            return -1;
> -        }
>          ret = xc_hypercall_bounce_pre(xch, affected_cpus);
>          if ( ret )
>              return ret;
> +    }
> +    if ( user_para->freq_num )
> +    {
>          ret = xc_hypercall_bounce_pre(xch, scaling_available_frequencies);
>          if ( ret )
>              goto unlock_2;
> -        if ( user_para->gov_num )
> -            ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
> +    }
> +    if ( user_para->gov_num )
> +    {
> +        ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
>          if ( ret )
>              goto unlock_3;
> +    }
>  
> +    if ( user_para->cpu_num )
>          set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);

Any reason this can't simply move up to the bottom of the identical conditional
above?

> -        set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
> -        if ( user_para->gov_num )
> -            set_xen_guest_handle(sys_para->scaling_available_governors,
> -                                 scaling_available_governors);
> -    }
> +    if ( user_para->freq_num )
> +        set_xen_guest_handle(sys_para->scaling_available_frequencies,
> +                             scaling_available_frequencies);
> +    if ( user_para->gov_num )
> +        set_xen_guest_handle(sys_para->scaling_available_governors,
> +                             scaling_available_governors);

Same for these two then.

Jan

