Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A94EADC878
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 12:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018083.1394998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTfG-00073b-D0; Tue, 17 Jun 2025 10:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018083.1394998; Tue, 17 Jun 2025 10:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTfG-000723-93; Tue, 17 Jun 2025 10:35:38 +0000
Received: by outflank-mailman (input) for mailman id 1018083;
 Tue, 17 Jun 2025 10:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRTfE-00071x-K0
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 10:35:36 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd8d3bb9-4b66-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 12:35:35 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a510432236so4016107f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 03:35:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b499c0sm10193516a91.29.2025.06.17.03.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 03:35:34 -0700 (PDT)
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
X-Inumbo-ID: cd8d3bb9-4b66-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750156535; x=1750761335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XQQTrRfNHm7CV2lqUXXSjbBc03p0TU3sjU6o7uzbLf0=;
        b=NU9Wa9u3wIEVOpXXPUQNKi9nDou1s34AMrwEu8puyNuTHYRp3b1sO6AFliDVURLUHs
         IlzEdm+zn4TaUnq7jp9ZYJdFmcKXb6eqabDUXxQW09XEpWWdaBVoefNhB7IrojiJrO8y
         JY2g31n8ZeE7BtFV67Fz/fdOQEI6MOqx5/hts2RSQk/IyYawqgyW/E5R9DCfrOyRf818
         5uOe+Sms9QYhoyZo4yTsKXGsekjHMpTNcH9g9m4GOxYBv4aZOqqGPx0koT8tMDhTpAiv
         zWRQRYFO0JNBMRvmISbJePeeaYMF5BIP4NyHeDVG/Jeg9QnPQFLbeL5dG7btmUhsriqD
         syzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156535; x=1750761335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQQTrRfNHm7CV2lqUXXSjbBc03p0TU3sjU6o7uzbLf0=;
        b=OZJNb+jIZCWpi2neOxTR6sjDkedg/eUF/w0supcFGXdLjJTHS5bP8MA8+6dHZSD4Ym
         oKh4FWykO5zw0EyZn+bsURY65Y+SP74Fb+5xjN0Pw85tW4S9dpZR+Jin1xO1iKXVK/8B
         us08b+49zViczHBB3VoGXCPWpVkkRufon4m7ECNyD2406Xfnypa3nFrCgnfa0kvrhhgC
         30EUTPSEvcAwcdA9lJiScVn3P+Oz68scA86m7yCwudHk/V6W3+AhxYYvquUHlo5dWcik
         8MlpkjWRrGTAnLRFz1+iHVAG2xem+b96BfyHpcpw80h9zF0RE7aifAM48QZtvy89HIfm
         cWsA==
X-Forwarded-Encrypted: i=1; AJvYcCW0fL3cLrB1ANvZiwmXnfAK700FkhPmvznssZZF2ZPq7yDmEgF1A7RdnO5yJIljsfwbEggN4HuYYkA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEeWhcX8Y7cDhLAYNxMAuuN76a6xtjDNtPktk7Kqhm3SKLPoet
	udnAXXyW2FwYCbLIs3c3qeCkHqUyD5pYqe5KI3UN+eWAzHgZl2ydxXZbUes3VdsCBQ==
X-Gm-Gg: ASbGnctEsBKhb1/4lH6cpjCUiJ94z+D5pjkBIs8ab0o/jUymnsbTjSQ2CFghZzHbPsk
	l7QZ+GPnEm7IoVA4LHwwpoj6Eg99LVrOUJUP9zB8PRiQCOdOjshq8Q+DNQTWLx9HcW8slZZx5f6
	SqxKb0h8kCMy4s9eMQwrp0mnQa6X8dhPDRvOAEMFQpUTQnts7fCkRFFMv+hJeWcDMeWscFDb5K8
	zRUG0kvJ26zykX9XOetbkxMmXh+t0wTxssq8wIlV2hlPMQ6PNFl4azp9ZUVSW4UwTpiwIV+s9ZY
	5KQyI4rNt9R1IL2a0QqSqA8Tu2OH6rqlVAl1dZhUBrhE3+VWvp38U73pQzGMaydGdqt9aMK6fkJ
	eKfNz+k/HQK76AniWNunwyVs7XyNWyrPAYFR1hV6UN5K6Bi8=
X-Google-Smtp-Source: AGHT+IErWHAQwd1+eTfJ4ks1U/1/HXuh1ZJkT9hgyE1ZzOedz1B01JaOLTrNfJEVRDDaTiuGMMmKng==
X-Received: by 2002:a05:6000:188b:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3a572e79551mr10001142f8f.40.1750156534873;
        Tue, 17 Jun 2025 03:35:34 -0700 (PDT)
Message-ID: <c536fce6-f776-44c9-babf-aa48de82988a@suse.com>
Date: Tue, 17 Jun 2025 12:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-15-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -462,7 +462,6 @@ struct xen_get_cpufreq_para {
>                  struct  xen_ondemand ondemand;
>              } u;
>          } s;
> -        struct xen_cppc_para cppc_para;
>      } u;
>  
>      int32_t turbo_enabled;
> @@ -493,6 +492,7 @@ struct xen_sysctl_pm_op {
>      #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
>      #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
>      #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
> +    #define GET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x06)
>  
>      /* set/reset scheduler power saving option */
>      #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
> @@ -517,6 +517,7 @@ struct xen_sysctl_pm_op {
>      uint32_t cpuid;
>      union {
>          struct xen_get_cpufreq_para get_para;
> +        struct xen_cppc_para        cppc_para;
>          struct xen_set_cpufreq_gov  set_gov;
>          struct xen_set_cpufreq_para set_para;
>          struct xen_set_cppc_para    set_cppc;

Imo with the move and new use, the struct wants to become xen_get_cppc_para.

Jan

