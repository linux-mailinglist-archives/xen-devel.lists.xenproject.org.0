Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D6DA7DC72
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 13:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939748.1339734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ko7-00072r-KD; Mon, 07 Apr 2025 11:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939748.1339734; Mon, 07 Apr 2025 11:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1ko7-0006zo-GH; Mon, 07 Apr 2025 11:38:27 +0000
Received: by outflank-mailman (input) for mailman id 939748;
 Mon, 07 Apr 2025 11:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1ko5-0006zi-Fy
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 11:38:25 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc8793a-13a4-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 13:38:23 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso27941915e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 04:38:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16f1a73sm130663245e9.24.2025.04.07.04.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 04:38:22 -0700 (PDT)
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
X-Inumbo-ID: cfc8793a-13a4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744025902; x=1744630702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L5sXjp2UQVYfKS9+UFeyghnxKulqxKnxroMYAmNfXZQ=;
        b=Vt/nrur8v0Ulm6whkvOO4t0VZHlHJXnnsPktwzgu/gl83NIkpBRI6qHjg74kJT+Jxo
         VNaRKjDo/HoJe/qUbNyou9f+5nadM2axuoken9awP9pVKJrmKnt/aEjpPaJCa8FmAtQG
         /5I4dwQrB0cgSkA2wQhG65PgVXWEy/d/2eRNDAyevy4rk5efeh9evz8RrOfKA6x8zqwv
         L0USwZn7nDO/6aHk+gT3rcdbGjN1Uwl7F3et90hATRMR02NU/JgCGhJYyc+AZQX1kGXs
         4n0Z/4TwrzwAjsYADCn+tiYKEyGOPZwxFUKvE3NT1BPZ5x7EPLBJKMfXawVTZfv1b0f8
         QMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025902; x=1744630702;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5sXjp2UQVYfKS9+UFeyghnxKulqxKnxroMYAmNfXZQ=;
        b=YmiWPDG1bG5EuCxEtA1aA+GTgSRv734WR8gpsZF9P1ffoEl0zgUwzDYZNmBd28Ks7+
         uCv/uwEx9GfCtNA4NUogzJkLcDjMHrpd7hv3PsnxHwr2/OycHwfn4/XZRw26Ovnp0Co4
         4T4MskVydiHqqZJ+Sa8ljLm3ErQi75KE2W1HaT6LSFRdXlcJeTj1uBs7ZAX/c2zvcWdh
         xnhZQZugX6RnL1kEUEidZd9aiYV5idWydKQ6tZCPCKte/IvQ3Hwj61EecLVz/e754rmJ
         w8YwoKFaGZHj2d7/yWNkkXAoP7vPxOsx58dlWA/SuX69OyoJxMLO5+Yr1hWD2PkF0jOU
         MuFw==
X-Forwarded-Encrypted: i=1; AJvYcCXKsWVC1Js7ljI6aui8n74BKtCabB3dqIUJ4S6JyzXA/113Ngs2viw/e62H0Y8l4OOlOJMPeyROEtU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS5BTdKmGjrcLRlqYhJnbgT+ieu3ELvDAXMBf9Mx06o80W/cOi
	znyV9xAX98Yg8pEjH6MpmK2flCIJ8QDAuOw5/dDnPuywTkVEzKIOFlTi85RnXg==
X-Gm-Gg: ASbGncsRAKlLD5OPpxDYDkX+Kig+OubIZj3i+X7OvwSgv5DitVPy7msQ0WMvuyR98C/
	VB6nSpajpZQYUgAUQ0PnAMKfjTz3Uihdnag5MTQH077JHC0L43GWhBWrGMvczYKKaOchILeTKOC
	vZIGHxaq2pwjeFtJGRmkUbrnZzyXYb5BZjXT3HR0M/2wYJGBVWcCRtSLkLOcyMvyf0yRukd7UaA
	4ebEmbH2H53VCOml3jB9RMdZgMuJfX+kbCJkucDGgXjVgele6JSuvajnvjzfRR3+rRzGeJ4Q+/8
	FIrdYDHh6RoFTCEA4FHEpcjLm35zQ+BCHb6LkBrm6ThAmAuxPW4CKKsEK2+avitQxTKMGobZA9o
	j276967p9dGUxqXgmySRzCMv11wTEMw==
X-Google-Smtp-Source: AGHT+IGtQhpbJf9EaOQQQYBQBMRKp54AGsEjfLoQZVPwYrtaLQuNb2v8OLA5fosSJDM/FX2xEEPvOQ==
X-Received: by 2002:a05:600c:1f16:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43ede41cc27mr98680205e9.3.1744025902549;
        Mon, 07 Apr 2025 04:38:22 -0700 (PDT)
Message-ID: <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com>
Date: Mon, 7 Apr 2025 13:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] libxc/PM: correct (not just) error handling in
 xc_get_cpufreq_para()
From: Jan Beulich <jbeulich@suse.com>
To: Anthony Perard <anthony@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
Content-Language: en-US
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
In-Reply-To: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 14:32, Jan Beulich wrote:
> From their introduction all xc_hypercall_bounce_pre() uses, when they
> failed, would properly cause exit from the function including cleanup,
> yet without informing the caller of the failure. Purge the unlock_1
> label for being both pointless and mis-named.
> 
> An earlier attempt to switch to the usual split between return value and
> errno wasn't quite complete.
> 
> HWP work made the cleanup of the "available governors" array
> conditional, neglecting the fact that the condition used may not be the
> condition that was used to allocate the buffer (as the structure field
> is updated upon getting back EAGAIN). Throughout the function, use the
> local variable being introduced to address that.
> 
> Fixes: 4513025a8790 ("libxc: convert sysctl interfaces over to hypercall buffers")
> Amends: 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative error and stash error in errno")
> Fixes: 31e264c672bc ("pmstat&xenpm: Re-arrage for cpufreq union")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I ask for an ack or comments towards what needs changing?

Thanks, Jan

> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -212,31 +212,32 @@ int xc_get_cpufreq_para(xc_interface *xc
>      DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
>  			 user_para->scaling_available_governors,
>  			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> -
> -    bool has_num = user_para->cpu_num &&
> -                     user_para->freq_num &&
> -                     user_para->gov_num;
> +    unsigned int in_gov_num = user_para->gov_num;
> +    bool has_num = user_para->cpu_num && user_para->freq_num;
>  
>      if ( has_num )
>      {
>          if ( (!user_para->affected_cpus)                    ||
>               (!user_para->scaling_available_frequencies)    ||
> -             (user_para->gov_num && !user_para->scaling_available_governors) )
> +             (in_gov_num && !user_para->scaling_available_governors) )
>          {
>              errno = EINVAL;
>              return -1;
>          }
> -        if ( xc_hypercall_bounce_pre(xch, affected_cpus) )
> -            goto unlock_1;
> -        if ( xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
> +        ret = xc_hypercall_bounce_pre(xch, affected_cpus);
> +        if ( ret )
> +            return ret;
> +        ret = xc_hypercall_bounce_pre(xch, scaling_available_frequencies);
> +        if ( ret )
>              goto unlock_2;
> -        if ( user_para->gov_num &&
> -             xc_hypercall_bounce_pre(xch, scaling_available_governors) )
> +        if ( in_gov_num )
> +            ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
> +        if ( ret )
>              goto unlock_3;
>  
>          set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
>          set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
> -        if ( user_para->gov_num )
> +        if ( in_gov_num )
>              set_xen_guest_handle(sys_para->scaling_available_governors,
>                                   scaling_available_governors);
>      }
> @@ -246,7 +247,7 @@ int xc_get_cpufreq_para(xc_interface *xc
>      sysctl.u.pm_op.cpuid = cpuid;
>      sys_para->cpu_num  = user_para->cpu_num;
>      sys_para->freq_num = user_para->freq_num;
> -    sys_para->gov_num  = user_para->gov_num;
> +    sys_para->gov_num  = in_gov_num;
>  
>      ret = xc_sysctl(xch, &sysctl);
>      if ( ret )
> @@ -256,12 +257,11 @@ int xc_get_cpufreq_para(xc_interface *xc
>              user_para->cpu_num  = sys_para->cpu_num;
>              user_para->freq_num = sys_para->freq_num;
>              user_para->gov_num  = sys_para->gov_num;
> -            ret = -errno;
>          }
>  
>          if ( has_num )
>              goto unlock_4;
> -        goto unlock_1;
> +        return ret;
>      }
>      else
>      {
> @@ -298,13 +298,13 @@ int xc_get_cpufreq_para(xc_interface *xc
>      }
>  
>  unlock_4:
> -    if ( user_para->gov_num )
> +    if ( in_gov_num )
>          xc_hypercall_bounce_post(xch, scaling_available_governors);
>  unlock_3:
>      xc_hypercall_bounce_post(xch, scaling_available_frequencies);
>  unlock_2:
>      xc_hypercall_bounce_post(xch, affected_cpus);
> -unlock_1:
> +
>      return ret;
>  }
>  


