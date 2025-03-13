Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC28A5F5A6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912130.1318456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiO9-0007a4-Do; Thu, 13 Mar 2025 13:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912130.1318456; Thu, 13 Mar 2025 13:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiO9-0007X6-Ao; Thu, 13 Mar 2025 13:14:17 +0000
Received: by outflank-mailman (input) for mailman id 912130;
 Thu, 13 Mar 2025 13:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsiO7-0007X0-Oq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:14:15 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eafc444-000d-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:14:13 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43948021a45so8100975e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:14:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74d558sm53464955e9.15.2025.03.13.06.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:14:12 -0700 (PDT)
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
X-Inumbo-ID: 0eafc444-000d-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741871652; x=1742476452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=guEkeWx/FqE3FMvJpuz9pVjvKgSt0VIztTBPUY/p+Q8=;
        b=Nr9bqWjL538DQslTBACZFOzKMxk1nffoeeU6e/7JNThWl2DYTC+K/5XESosAT+zTWg
         2Eb+OmaEYVdFeb952rGTR3GPyO8gkmVl+4ModX88YDPG5mIZfW+Vfp2dTsWPsjISg8aS
         wdPZ+zTToAWO6ZVD+yurvhh058sk5Ub467KKNIGuRVldCpNHft7RNfoPa0fQLLoMl4MU
         /yH2oiZm3C/Beh+Z1DC4DEjl5mTNerLJzYjyTR3uBHfSo3Hfft72rKAZCgsZExXmWBvP
         eJc7goi2yrwfGSAaYutADhevLhhNHLM30MZMhKTFH3+SOYIKU1AsAKKkoBhvvws5658h
         2lAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871652; x=1742476452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guEkeWx/FqE3FMvJpuz9pVjvKgSt0VIztTBPUY/p+Q8=;
        b=K8OgbqtoQ6usQBqJM5iPI4DQ1z213F/8IKbAO4e+Pe4U/HSO9o7VYTu/vrbuKdyFnQ
         Oc9DFcvV+aZbbTvQlbrlWN9u4X/QyB3oH5Uvr5jL9IGc3KM5V0dUhrj/DGMhsIZDadpA
         iFnjM2bUwGi0eaJ3wZXfk6YSFBdhbspX2UAEBPMp7q+xQKabM3skpqNbNQIcHuxloqq3
         4rWHcxVwo8tqXhjKJK3YSt6iXuWaYlqf252811qS1sanJL7lYkXo1PoJxDZyVxBDmJUW
         bJWlvArsYEaDt0a7lmTJdbPVoHfCqcrJ4qsE3dr8fFLO13RUhTVtu/67GO6Klk+e4T0F
         jsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgTHqTdE/mjkjX/OmHLiEyJesTK02/gkMbIiv4xfXKn24aq8HmczJTml7lDZ3mdOrr0W2U5luiHn0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEqUuX8obr5LVp9eoejST/3YlaG1Ef4/m6J2kXmVMykyrPovjt
	N/30BAHxylqfDxgaUSr5eTVWnC4t23B+oIQY0h30hIZJfEG5IGUfOL+gprsQ7A==
X-Gm-Gg: ASbGncvPJZNu+OeCnSpH6XD3AijSvIDnZGBYJNM3xsGSUNKfQIdVTnIpsfLE/3ZC8sF
	MQbGLH0qIT9+VhRX3grMYk0CTX2wGmtqAE/iqg6LcKtfEwV2CIryBU9XzFeHBeDF4yhLKxZCex+
	LtfsrQhpJRgWAITCq11VCi8R/N4s6/CgoHXW+AOyJPdUlgS7ngnhqX0w9Z1vRT6CmzRM6v7M2ha
	naFfZlSl9UF3I4WKx4EUuuttXNqlY7t/JaB33nRnx0NrKRzWj4JBA1c9NOO4Nj0WRyVEYlAmeoB
	xOfjHZ0bdO5PjMQFoGVtRvQuQEaJwslY8XSB4Ud5A91BdoFX3BLbycr34HVv3pQ/NQog+fmrSDt
	FYAjCBAhf8X0MZnXQdFBoyvQtrXHFkw==
X-Google-Smtp-Source: AGHT+IH6QkdAPlUsT08mgJ1aY28Z4I5uFTPTVbQQjhMmWhZSSVJZ0pRIsc2uHDEZEeSobVDvB6Ba9Q==
X-Received: by 2002:a05:600c:4fcc:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43cfcb1544bmr131037775e9.6.1741871652447;
        Thu, 13 Mar 2025 06:14:12 -0700 (PDT)
Message-ID: <9cb526f9-fd2c-424c-82b1-7db57e0db50c@suse.com>
Date: Thu, 13 Mar 2025 14:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools: Mark ACPI SDTs as NVS in the PVH build path
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250311092905.991-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250311092905.991-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 10:29, Alejandro Vallejo wrote:
> Commit cefeffc7e583 marked ACPI tables as NVS in the hvmloader path
> because SeaBIOS may otherwise just mark it as RAM. There is, however,
> yet another reason to do it even in the PVH path. Xen's incarnation of
> AML relies on having access to some ACPI tables (e.g: _STA of Processor
> objects relies on reading the processor online bit in its MADT entry)
> 
> This is problematic if the OS tries to reclaim ACPI memory for page
> tables as it's needed for runtime and can't be reclaimed after the OSPM
> is up and running.
> 
> Fixes: de6d188a519f("hvmloader: flip "ACPI data" to "ACPI NVS" type for ACPI table region)"
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v1->v2:
>   * Copy explanatory comment in hvmloader/e820.c to its libxl_x86.c counterpart
> 
> ---
>  tools/firmware/hvmloader/e820.c |  4 ++++
>  tools/libs/light/libxl_x86.c    | 17 ++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
> index c490a0bc790c..86d39544e887 100644
> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -210,6 +210,10 @@ int build_e820_table(struct e820entry *e820,
>       * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
>       * before an ACPI OS takes control. This is possible due to the fact that
>       * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
> +     *
> +     * Furthermore, Xen relies on accessing ACPI tables from within the AML
> +     * code exposed to guests. So Xen's ACPI tables are not, in general,
> +     * reclaimable.
>       */
>  
>      if ( acpi_enabled )
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index a3164a3077fe..2ba96d12e595 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -737,12 +737,27 @@ static int domain_construct_memmap(libxl__gc *gc,
>          nr++;
>      }
>  
> +    /*
> +     * Mark populated reserved memory that contains ACPI tables as ACPI NVS.
> +     * That should help the guest to treat it correctly later: e.g. pass to
> +     * the next kernel on kexec.
> +     *
> +     * Using NVS type instead of a regular one helps to prevent potential
> +     * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
> +     * before an ACPI OS takes control. This is possible due to the fact that
> +     * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
> +     *
> +     * Furthermore, Xen relies on accessing ACPI tables from within the AML
> +     * code exposed to guests. So Xen's ACPI tables are not, in general,
> +     * reclaimable.
> +     */

When asking for a comment here I really only was after what the last paragraph says.
Especially the middle paragraph seems questionable to me: It would not only be ACPI-
unawareness, but also E820-unawareness, for the range to be prematurely re-used. And
buggy bootloaders really would need fixing, I think - they'd put OSes into trouble on
real hardware as well.

In short - I'd like to ask that the middle paragraph be dropped from here (which
surely could be done while committing).

However, there's a second concern: You say "PVH" in the title, yet this function is
in use also for HVM, and ...

>      for (i = 0; i < MAX_ACPI_MODULES; i++) {
>          if (dom->acpi_modules[i].length) {
>              e820[nr].addr = dom->acpi_modules[i].guest_addr_out & ~(page_size - 1);
>              e820[nr].size = dom->acpi_modules[i].length +
>                  (dom->acpi_modules[i].guest_addr_out & (page_size - 1));
> -            e820[nr].type = E820_ACPI;
> +            e820[nr].type = E820_NVS;
>              nr++;
>          }
>      }

... this code is outside of any conditionals. This imo needs sorting one way or
another.

Jan

