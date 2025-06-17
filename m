Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1243ADC798
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 12:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018062.1394977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTFC-00027K-1Z; Tue, 17 Jun 2025 10:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018062.1394977; Tue, 17 Jun 2025 10:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTFB-00024l-V5; Tue, 17 Jun 2025 10:08:41 +0000
Received: by outflank-mailman (input) for mailman id 1018062;
 Tue, 17 Jun 2025 10:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRTFA-00024f-UC
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 10:08:40 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09b3bef6-4b63-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 12:08:38 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3993063f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 03:08:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb0f55sm75870345ad.188.2025.06.17.03.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 03:08:37 -0700 (PDT)
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
X-Inumbo-ID: 09b3bef6-4b63-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750154918; x=1750759718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/G0xM7PKUijSaxYeTVZlljJZhsxjs9kjAz8E8g8k3sA=;
        b=JDF+rz6eC8mTvPXtCGvNdRw+2irAZ/htvmR43glKm5qeYncc4sAzPF0DkiaedE5nG/
         q7pOLIbQpqWFUTzEQFmGs0ZFl53Rp5LVK4zw3mMofyeUyO+FraF6cceCkomc8mQ7Su/1
         K4Aftiq63zoSmMCjmfeGII248fbNCbiN9grRzw52SCIophxvvzrb1qLUHJfqR/iTuKeI
         cMa6KvFqaV/9eUTn23hbKHhRbmkVeSZG/hA+cH/tHc4jl8vINoDzrRjFFijMlNmw8mS9
         JZ6PUt1wTNm5aqydYruol378hG2m+z4bvgEw+TdzQ3m7g4O/XjxigUesnGoWNuY3d4fk
         ZsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750154918; x=1750759718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G0xM7PKUijSaxYeTVZlljJZhsxjs9kjAz8E8g8k3sA=;
        b=jlnWQHSBeq/rrObjSSE01s5ZEuxHX2RngJ2YWkEGLKjM0hRqC8uaPfGfD5Yl0CPqRj
         +ssji3EnAvg5UEhVDjd6rCR8Q3dMzDapBwY6SXKNcwh1VbYvUxG1tj8/qISChJzAGhOK
         0lmeYhig7dcvXFgM1FYwQx7gvLEQwmuVdTDBDbkjOZwbG96Fddi6XYhUKtU0EA9uvl9Q
         QAVa75+g6f540xjyA1aB0b2t0wr1SXgadml6wuKF+itD3XALVnIIWkfv4kNW/Br5LAZv
         hAGBAwgMddX9gF+ffRSr53n04lINaLByCihVp8nij6uRYSmhBQ9LqHz5cQ0m8B26io8v
         OQSg==
X-Forwarded-Encrypted: i=1; AJvYcCXjz9G9Re1EPEEnOhNHESKQYn6JtzTzTVedF4ihIX/2DU/ChuXn6SoStTTtMb3ClDov598Gv31Fse8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3Usak9+Q4czyrw2EfgKY9ENETGZBk1pzwAlIA9XFPbUHTfWJL
	hbWqm3BVjhTc3N9j3/q4ou8BpGlePdY1cgUsu/VVu9vdzQWrHW1JA8BuEnzKSoXPgA==
X-Gm-Gg: ASbGncsih/Pfp3wKekOsr9+YXOFeQLi8PMGOcutVFsedAdwVnlRF5FV3Zfmd+UpkIDi
	dw83DCKPJu2ikHi4PePOL/PFwZqZSbmlJTe4uiRwBN9ty3EGJy1oXIG/c/qShqVXAmf4XkBEX0B
	ysOWXV2hx/DmH1aDlysfisf/SSKQGfoeq50CpjjGLBXyidEjjQ/drEgV7yjp+xvJTCypo/zXDnk
	hgNNTgVyc0kQMMEzu1eGT1FM1yE9BtSrDELgfuBWmDuVw7NIa9D5RuxP6EO39busnzl5qhm0nul
	82BM26CdDIW5TUDOZ11wsonDKUGTob07UN16INjg4w2unRTSVOFHtZhEa7WtCPbswfH+QyVb8w2
	kDnfkgNBpN/FPWjj0NWaA4EqzjDMpebMJ54yQgmCQcJGF3BU=
X-Google-Smtp-Source: AGHT+IFZ7tdos8JEFArZnLuChDHHRx1qYbKLToTiu2R/wOKrsdnvK8OsMMYu4/qb9okmZyHZBXe0Kw==
X-Received: by 2002:a05:6000:26cd:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a572e79674mr8119315f8f.41.1750154918001;
        Tue, 17 Jun 2025 03:08:38 -0700 (PDT)
Message-ID: <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
Date: Tue, 17 Jun 2025 12:08:27 +0200
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
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -69,6 +69,7 @@ void show_help(void)
>              " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
>              "                                     set the C-State limitation (<num> >= 0) and\n"
>              "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
> +            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU <cpuid> or all\n"
>              " set-cpufreq-cppc      [cpuid] [balance|performance|powersave] <param:val>*\n"
>              "                                     set Hardware P-State (HWP) parameters\n"
>              "                                     on CPU <cpuid> or all if omitted.\n"
> @@ -812,33 +813,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>  
>      printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
>  
> -    if ( hwp )
> -    {
> -        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
> -
> -        printf("cppc variables       :\n");
> -        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
> -               cppc->lowest, cppc->lowest_nonlinear);
> -        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
> -               cppc->nominal, cppc->highest);
> -        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
> -               cppc->minimum, cppc->maximum, cppc->energy_perf);
> -
> -        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
> -        {
> -            unsigned int activity_window;
> -            const char *units;
> -
> -            activity_window = calculate_activity_window(cppc, &units);
> -            printf("                     : activity_window [%"PRIu32" %s]\n",
> -                   activity_window, units);
> -        }
> -
> -        printf("                     : desired [%"PRIu32"%s]\n",
> -               cppc->desired,
> -               cppc->desired ? "" : " hw autonomous");
> -    }
> -    else
> +    if ( !hwp )
>      {
>          if ( p_cpufreq->gov_num )
>              printf("scaling_avail_gov    : %s\n",

I'm not sure it is a good idea to alter what is being output for
get-cpufreq-para. People may simply miss that output then, without having
any indication where it went.

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

This (tools-only) public interface change, otoh, may be okay to do.

Jan

