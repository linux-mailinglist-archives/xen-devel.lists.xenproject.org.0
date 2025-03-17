Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE90A653BE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917035.1322034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBaD-00077r-KY; Mon, 17 Mar 2025 14:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917035.1322034; Mon, 17 Mar 2025 14:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBaD-00075k-Hp; Mon, 17 Mar 2025 14:36:49 +0000
Received: by outflank-mailman (input) for mailman id 917035;
 Mon, 17 Mar 2025 14:36:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBaC-00075e-Nj
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:36:48 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 400aaaf7-033d-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 15:36:45 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso15736215e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:36:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b43sm15376704f8f.35.2025.03.17.07.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:36:44 -0700 (PDT)
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
X-Inumbo-ID: 400aaaf7-033d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742222205; x=1742827005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l3Tj3cSQJP9ZgGn61qeuoZ4GpiyZjdMJ4QRd66Y928k=;
        b=akqruF2x7NKIiQra98dL6JNBuoTJFplhtqlyUA8Np15k+DriDVSzbtrwYEs3n0U4i/
         OVUF3BGDXyF2N4dX1ZTMS+LZKr05KZrghTh32YcI9k6CF74XxbkJhj6QccEQeghSiaWC
         nggwtXI6JS8H8zRjTZ361Z423DWSX/tEIr9EMy+cDx5sHGsUs7C1oKHJy1rWd63zvEYA
         TSdHrIaaAvnCwI83dNRekGhkkSpIc4KZh7XP4Bct5qawqg9W0oBnLfdnk0IV/shbO7gW
         do6eRPC0PNIn5CqfsPQy6+stXG21BKNFYI4czvNGguiAPr4wrY/KkfgGzWfQGjSFWzzG
         uoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742222205; x=1742827005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3Tj3cSQJP9ZgGn61qeuoZ4GpiyZjdMJ4QRd66Y928k=;
        b=gcW/Dd0bIFIO9qCLBQjPXYbB+UAooP8suo6IidagSi5MxRwtNPJ4I/4PkxJUQ18Agc
         GK9XLBB+ID+Hck3NhvBZK2qb/Wme6iyQOWBgE0Ka6EqoDVnUZ0jjGnFaD9LVw0VMAdlW
         H55JQ4nEYYsF77tSk7BPIiGUYz3MJFqV5Zl1/5HkcOnVHGitvnC5ex0iL9dJvkt/QNdc
         h2HMFAny1i7x2AGTQuo3UpjYzCgZgDAIpE/ChZhZB5w1A5JbyzBfXFedIhZ7SFtWfq/T
         wbMLpsQuDPoapoBjZozykPYPhCP8q3fjQVZ4183JmYVQlwM7MNQ0HEMgBnWm4J7fNiBK
         q6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVfyt+iy1ZTOncDKFFezv9m1OG6WIQ7XP/msbHTU0ljaOxpj7Iwd6UCLYleOaB99Bbm0sjj2Le1lT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydNo1jw4L5BBUsV/qaCRidM47hKxG/jKgfF4BtJWCCfAkAVKJY
	0uYlOhjCgyRo6k8FfWYAJBxDAikNlcUav97dbKzg0hqicp8tk6OQlb47XwubrA==
X-Gm-Gg: ASbGncvwWPc0rPzvYLCCeUrgu+oDYI2eupO9XWeJeVqDqYFCBfHEWLkWvdjozB8zKdO
	Ee2JORaDGNAkYIi/BZKC4us9zoWicLSKBdJ0Ufuk5vBBiIuYDk5xObiWx+EE7KFF44MnM04VTWZ
	k1Kxg13AtupTiZKSnhSeLtlXoft95XvtUDdFA89Aqt7AxvkvcRpUTjcUoNJO1Gi/FxpkZkm5/VZ
	Sracr/10BdaRs2iwMbJDAdJqKbc3IP3zzAcfx+4BRWw0yKQFfrtN/9EQATsx8kqVC3VScEnAdEs
	erZlXlfISJK9IndtA5vF3dFWMcZ5UqOvR9syTsr+zKO7nQzrkhRIoUx18dvCdLPu27KKs6yFvYy
	opGiSQYNzSiiM1VX2M1p6bFnuoHi9SQ==
X-Google-Smtp-Source: AGHT+IE3odevN7Xc2V7BQwWcwQV2hHQCUJE8mShecrdEU1w4rXAhgJjIt7KqBYdHkm0YI/4MChUyqQ==
X-Received: by 2002:a05:600c:1d05:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43d1ed0f578mr118184935e9.28.1742222204657;
        Mon, 17 Mar 2025 07:36:44 -0700 (PDT)
Message-ID: <9ca3ec40-7b90-444c-a682-bcb5f17bd3d4@suse.com>
Date: Mon, 17 Mar 2025 15:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/23] xsm/dummy: Allow sysctls to both hardware and
 control
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-20-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-20-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> xl queries SYSCTL_physinfo for the physical cpus:
> domU:~# xl list
> libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
> libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
> libxl: error: libxl_utils.c:817:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
> Name                    ID   Mem VCPUs        State   Time(s)
> Domain-0                 0   800     1     r-----     130.0
> dom0less-1               1   400     1     r-----     130.3
> dom0less-2               2   800     1     r-----     130.3
> 
> Hardware and control are both privileged.  Allow them both access to
> sysctls so they have insight into the running system.  This is coarse
> grained permissions for the dummy policy.

In an earlier patch you alluded to the control domain being guarded against
the hardware one. Shouldn't hwdom be limited operations retrieving info,
but refused to make any changes to the system? Or maybe some kinds of
changes are to be done by hwdom, but then shouldn't be possible to be made
by the control domain?

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -194,9 +194,10 @@ static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
>      case XEN_SYSCTL_getdomaininfolist:
>          return xsm_default_action(XSM_XS_PRIV, current->domain, NULL);
>      case XEN_SYSCTL_readconsole:
> -    case XEN_SYSCTL_physinfo:

Didn't you add this line just a single patch ago?

Jan

>          return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
>      default:
> +        if ( is_hardware_domain(current->domain) )
> +            return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
>          return xsm_default_action(XSM_PRIV, current->domain, NULL);
>      }
>  }


