Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B760BA98A67
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964653.1355388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zmx-0007FW-0P; Wed, 23 Apr 2025 13:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964653.1355388; Wed, 23 Apr 2025 13:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Zmw-0007Dr-TT; Wed, 23 Apr 2025 13:05:18 +0000
Received: by outflank-mailman (input) for mailman id 964653;
 Wed, 23 Apr 2025 13:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7Zmv-0007Dl-RZ
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:05:17 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d92120-2043-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 15:05:16 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso45141515e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 06:05:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408c7cfcabsm30603085e9.0.2025.04.23.06.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:05:15 -0700 (PDT)
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
X-Inumbo-ID: 99d92120-2043-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745413516; x=1746018316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8wPVfY45gC81xzNrIkM612/keOtLJ8qS7AT1W6AKxnc=;
        b=V90dMauxRsxzmLIX010B8PVEg170I+xl6ahtyFB3frDCxcJeZumgb90qEVCpnuJ0d0
         uwtzedszdZxc3kXUil+R/bNKeAtzkyD4Iux4B68/w60Ia1SfyeS8GjFRVJh6jtaf0Tod
         ov3nb8Pl1BAhdI7wgEZ0i0anGJs9vpNDEp1GdfhIW95hdBHtjiKF1P32HRkwCIIH8ZAz
         bM5WDXr1zK4aalfDMx+p6w2MJK7+iNWV+3uvuI4eHDFHPMvab9WPrhvAfA7DF2gRS2Qm
         eOgjilrnEJE4O2z8JjNbfQXVpo+qUUjf49hbL/SQZKginsAkBOQyLnpbL9QSXuSXGb/2
         2vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413516; x=1746018316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wPVfY45gC81xzNrIkM612/keOtLJ8qS7AT1W6AKxnc=;
        b=ulm3B1HZZtSQsstPLOt/MpiBY+OUsuUYVEnFRwEfgNijfMPROGzG55PhX0iTEpf6kM
         rf6fVnYLDgSqZgQO2KtmY1nbuR74rv11B7k5HVoSdr22KFdTVkOy8uzJkA2AcZByXYb8
         PjWuE9nM/MCpAvteD30Juv05QzaDKqxN6WvISP7h1PRemb4joe0aBYkLkhSwuwhXnLnv
         defxFbCjO+dSZHgVR8yuXU09OjdDOB4AtrLk5fK4XzP27ALmF/wzQvItutwIO9gWR6UU
         SFPtVCZk57WfWXKf2yggSfLqgcqM3x7RmuJkPhqM+4WLrvlMVjAuzyJjxCu5UzAHLWHq
         5nRw==
X-Forwarded-Encrypted: i=1; AJvYcCXf5MolSIfat7DnIelaZucoEIDzge2YktriOaKdN+aCQlWqryVFyCtWM3jMtqVmG2YmMIL7FdFuNIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFR5y7/GsHKbik8OPHcuO0nz7czBZH0N+a/6gv6XRBJFEWwXP5
	wz6KXNTzkcVS7qqGEdWoCli4c8lXS5/puLO18tMqkX3bGDCNoncdmMwQ4cobdg==
X-Gm-Gg: ASbGncsZ98/W0JHRbW/Th5yjM8WJ4z7rHW2/7QL2x/eU6usY1+3WNLHL+3pNwLbppU0
	jlBLwOWGkiFusBDm89pgMe4aKue/qZSXvae6aYgAc4IjGFK3MhamOdb+nWSK2Ve/wgr8ODZ30Li
	Jb1OqGJt/AUSn0xrEiLi8gWoYQub0cQ9DshruyXDRKX59HrhLnfg5oz9OLWMvHcgWGsi7+lm+IU
	oQdwnj/LDQyIo5X4YAeBp2QvMkKlAY8Qg2EuWqnu2FSnPUEhbLSWbbrrzkoH756GFnx3iM1pBBm
	VDzbdqVRPBSxB0FqSLG7q51wC3dwo6PIzWQMIncSepDTcbChFG/3LbZkCQGEcrYh5H78kheP7be
	HrEpdQkpBovBedPJPhqb/YAgPEQ==
X-Google-Smtp-Source: AGHT+IEDG7mmceJmZh7QuPpfuuYtqOZbm3py8DdvpSbt2Kt3yiREDnuqtX+4pLuyoOpSg9Pcuy2ATw==
X-Received: by 2002:a05:600c:3c8d:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-4406abb282bmr144535775e9.16.1745413515654;
        Wed, 23 Apr 2025 06:05:15 -0700 (PDT)
Message-ID: <a9511d98-64f5-4c61-a3f0-440616d0de35@suse.com>
Date: Wed, 23 Apr 2025 15:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/intel: workaround several MONITOR/MWAIT errata
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250423113215.80755-1-roger.pau@citrix.com>
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
In-Reply-To: <20250423113215.80755-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 13:32, Roger Pau Monne wrote:
> There are several errata on Intel regarding the usage of the MONITOR/MWAIT
> instructions, all having in common that stores to the monitored region
> might not wake up the CPU.
> 
> Fix them by forcing the sending of an IPI for the affected models.
> 
> The Ice Lake issue has been reproduced internally on XenServer hardware,
> and the fix does seem to prevent it.  The symptom was APs getting stuck in
> the idle loop immediately after bring up, which in turn prevented the BSP
> from making progress.  This would happen before the watchdog was
> initialized, and hence the whole system would get stuck.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with a nit and an entirely optional suggestion:

> @@ -380,6 +380,38 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
>      }
>  }
>  
> +/*
> + * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
> + * processor to wait in a sleep state until a store to the armed address range
> + * occurs. Due to this erratum, stores to the armed address range may not
> + * trigger MWAIT to resume execution.
> + *
> + * ICX143: Under complex microarchitectural conditions, a monitor that is armed
> + * with the MWAIT instruction may not be triggered, leading to a processor
> + * hang.
> + *
> + * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.
> + *
> + * Force the sending of an IPI in those cases.
> + */
> +static void __init probe_mwait_errata(void)
> +{
> +    static const struct x86_cpu_id models[] = {

__initconst

> @@ -406,6 +438,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>  		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
>  
>  	probe_c3_errata(c);
> +	if (system_state < SYS_STATE_active && c == &boot_cpu_data)
> +		probe_mwait_errata();
>  }

You could simplify the condition by using just system_state < SYS_STATE_smp_boot
(without any &&), I think.

Jan

