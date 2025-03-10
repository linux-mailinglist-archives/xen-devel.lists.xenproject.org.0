Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23DA58E35
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906212.1313661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYZU-0003JR-6h; Mon, 10 Mar 2025 08:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906212.1313661; Mon, 10 Mar 2025 08:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYZU-0003Ho-2B; Mon, 10 Mar 2025 08:33:12 +0000
Received: by outflank-mailman (input) for mailman id 906212;
 Mon, 10 Mar 2025 08:33:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trYZT-0003Hi-6Q
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:33:11 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc95433-fd8a-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 09:33:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso6528575e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 01:33:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8b0548sm140571575e9.6.2025.03.10.01.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 01:33:08 -0700 (PDT)
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
X-Inumbo-ID: 4bc95433-fd8a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741595589; x=1742200389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RneuC5f88/+yB+ka3HOx8pMC+s52XkO3VAwsuvDvj+4=;
        b=U9bCZGyk4bJduk4LBEmdBOFXRHS87BTSQeTuWNdYmvkGqcKVdNSSqNQ2m9Goz8JPuN
         Ijtoej0ZN6Q7JJkLS4K2A7SdYP88JwyevWwRuPQmw0/r+Y/tCXXnV+DIj91Ipohke6PI
         +M1xw2Sb/xsxG6Nsd3BD4hLdaFnyar+cmMKFqMIWg6t0U2ssKihzFWJBkkTbgpGkWeYS
         3hTu4g47EVjdH/O/ToRIM6g7O9t4ScLbFDSfIDP092p7GsUhIZMJ/2CxqoQHat2CdaMf
         3WkXhgaFCxiW5KvGWLyBjGn7n0cLrk0RBTvFgTJLUX3NiX1NlaawIdgsfBSdnvlg3vOo
         eIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741595589; x=1742200389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RneuC5f88/+yB+ka3HOx8pMC+s52XkO3VAwsuvDvj+4=;
        b=KdP5lN/NWRbBxeNTo6nXZo8Q8itdWVgQLdImnvF26lv2kG5JeRiFGiQjTLvK9LbZTu
         TZEMhCvRlcxD5y158mQEO73Ak50bNEBFAaOLtk4ganTs+DGiuVf90Ij6wYSxsR/tsSDK
         F4FpRWiZ4d+Lpy3AfhmBAoPdPeIjqRNd29pfVirCy3IyMfgJqrOZ6mIIsonfJ/JhTpYD
         mERRX+YukNQ92XmUtlNWF+0tMzsz0bdnt2HAVULMPrtO9u6GLchKuvWLD/vwmh4WxGYM
         1X03D7Cbw62uOo9REwdDZb3teLGlwODB59zPjpH1YyDQpS/V0CQZuqjaXKbH18wdCEnv
         kM9A==
X-Forwarded-Encrypted: i=1; AJvYcCVMeMomWdhdcjMNIygDd3C0ZKE1PISNKcaY/0KvFHUbtWRnyWNAzMZuZvwuMFxVorxwcHpco2DESOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK25HGhK7Py18iVPjjl8peotWZjkfwuNvkQE2OQ/nJ51JDaP4w
	wYO7uZKMqOmhliAqbheoz7ectr2R4ma7y7HPhgiyvm7TMosvOMpJqEKqdtIqKQ==
X-Gm-Gg: ASbGncsQUn99mHMEt+szRjGNJgJQ3CB+qFdjKkvIdzXnTkQ37CXkZu4Byo15/x5i5c9
	ryvvNqH3s/7AkTbqa5iwMm10+ljgqPoxNDJR0n75SWcYvuS9oX8XJl9hhOfrn1UyZmfhMEApE06
	GJUps4Yh9VoORfdVcd4aZS9Xp+iWctPSZFtXdf8uXKgIjSAoMNl9t1OiPl5YfgxPpAmjRThtVxw
	1kVAYIeTmiPl/0ycdQ+Mzkvg6qANttSWaza7CPOf2XwjbqfqcJ/z3090Jg7bcQvWCU8ryPKE//j
	l3nbd52YoiFQt/BGnlQXkYCPSzFT5yVOyOCJFu1DqK9I3fDNN+ALs73x9TPIrqTEFYqT2hemEUq
	OYZK3PwXhnjwJV9e+HAXiM8w+9/7ezA==
X-Google-Smtp-Source: AGHT+IEqbXSkAKWCn0JoVGE9qWogy9VWGBxXp15YTDu7vqOfbiz0kZda5wLOBzIZ8JCCJC0Du3S/ew==
X-Received: by 2002:a05:600c:1d03:b0:43c:eacc:9d68 with SMTP id 5b1f17b1804b1-43ceacca125mr37128335e9.20.1741595588628;
        Mon, 10 Mar 2025 01:33:08 -0700 (PDT)
Message-ID: <c72e7407-4b2c-460d-a425-a8c056a23a26@suse.com>
Date: Mon, 10 Mar 2025 09:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] tools/hvmloader: Decouple APIC IDs from vCPU IDs
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 18:31, Alejandro Vallejo wrote:
> v2->v3:
>   * Moved "extern uint32_t *cpu_to_apicid;" to patch1
> 
> v2: https://lore.kernel.org/xen-devel/20250204144542.7399-1-alejandro.vallejo@cloud.com/T/#t
> v1->v2:
>   * Dropped patch to skip writing the MP Tables if apicid >= 255
> 
> v1: https://lore.kernel.org/xen-devel/20250128163342.1491-1-alejandro.vallejo@cloud.com/
> source series: https://lore.kernel.org/xen-devel/20241021154600.11745-5-alejandro.vallejo@cloud.com/
> 
> The hypervisor, hvmloader and the toolstack currently engage in a shared
> assumption that for every vCPU apicid == 2 * vcpuid. This series removes such
> assumption from hvmloader, by making it read the APIC ID of each vCPU and
> storing it for later use.
> 
> Alejandro Vallejo (2):
>   tools/hvmloader: Retrieve APIC IDs from the APs themselves
>   tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]

Acked-by: Jan Beulich <jbeulich@suse.com>



