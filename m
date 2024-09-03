Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9996A2BE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789375.1198979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVWD-0007CH-GB; Tue, 03 Sep 2024 15:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789375.1198979; Tue, 03 Sep 2024 15:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVWD-0007Ak-D7; Tue, 03 Sep 2024 15:32:33 +0000
Received: by outflank-mailman (input) for mailman id 789375;
 Tue, 03 Sep 2024 15:32:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slVWB-0007Ac-EV
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:32:31 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bace88ed-6a09-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 17:32:29 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so477921266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 08:32:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c2fsm698828766b.197.2024.09.03.08.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 08:32:28 -0700 (PDT)
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
X-Inumbo-ID: bace88ed-6a09-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725377549; x=1725982349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ERDlCuvylNRxzPufNikmy3BWycOgqhbL+fQAbqxyYpE=;
        b=atXLWwiKieCMErNj54vv2hXUCTPpMl4OZFHdq+OO11m+XM1422PT36+ETVThru7UsN
         z/ZhgJ7HJKgmKPVlt9R4ci4XcWHfbZiATm+ac/QJGqvVybw6ngo3JfPk00Phr1JieT1K
         WhI2NtbMuVQlC8Q6oXAv74MONxnr2yXhFu/XktopGH6M/avYMiUhA/osGblD/mP1V4Q+
         1mMhdewu1OJAzORLDwZszThM6cTqlORw2kfMwLN/HfgezA60IJtIr1i7H90jNcHWyonZ
         VvV6bUhxZiPmEXfaGXeBe6l4S6jrnbH53lW0JpMKkT/cK4BOXlxFXDe+g+mku6iPZDnP
         8kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725377549; x=1725982349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERDlCuvylNRxzPufNikmy3BWycOgqhbL+fQAbqxyYpE=;
        b=bUHH+3YRm99A/FhC4JpTUjOX1qv3IzDFoXI8i8R/wu2KFZMs+Xzsv6UldxkUrJ1a5R
         Dlvhu0q89Is0xYZYEwDakNr5VJSzf9BX7YIzU3v+qe5xsQawe/Sx0l0gvGnYb7nOv660
         GqtSUN2BFRqRxQ8JW04P6URbpbFw0xPNTBR5bOzErE5iQPm394jxSnO3gsqmlKcqe3Ub
         eQHQoQ6Vvtu0YY9K0VBhCNMj/+2qOf25A5Rv7KYauSrP2sDnkzf76LcH8WFG0DPVddYD
         VLh2FA/bMRqFhK5pgTSzkEpeGWxUu0S2fUlfQSEy1E+9JoW7QDGML9btsO89i0bHIG6w
         kyyA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ98942O0SG5iSf7yGOuZ4c0ETWKnfaf0GKSnzRmW1nc0p/09QqJW6Zh38oHHie8Lc7PExwFw2i+g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhCWIwQfP94BP1MlzigqQMs9IvH6aiChUx4xBxrv2ZKx4Mx2ni
	1feTcd6OHvsu1Hgcp/AeOhRguxw0KdhxZiI8ImAZvWuGGEfGs2Zw/cvFmkyqiA==
X-Google-Smtp-Source: AGHT+IE7rF3/vh0n/qCNuhm8HRi9AAr/dCyiOdjDG+MY9ffJeIqKvlNe+65DkbcVAEzo0upBmjkN8A==
X-Received: by 2002:a17:906:99c5:b0:a83:9573:45cc with SMTP id a640c23a62f3a-a89fad7b546mr527980766b.14.1725377548683;
        Tue, 03 Sep 2024 08:32:28 -0700 (PDT)
Message-ID: <bc1bd23f-edf5-447a-9799-bca0a6cd696e@suse.com>
Date: Tue, 3 Sep 2024 17:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] x86/time: introduce probing logic for the
 wallclock
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-5-roger.pau@citrix.com>
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
In-Reply-To: <20240903130303.71334-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2024 15:03, Roger Pau Monne wrote:
> Adding such probing allows to clearly separate init vs runtime code, and to
> place the probing logic into the init section for the CMOS case.  Note both
> the Xen shared_info page wallclock, and the EFI wallclock don't really have any
> probing-specific logic.  The shared_info wallclock will always be there if
> booted as a Xen guest, while the EFI_GET_TIME method probing relies on checking
> if it returns a value different than 0.
> 
> The panic message printed when Xen is unable to find a viable wallclock source
> has been adjusted slightly, I believe the printed guidance still provides the
> same amount of information to the user.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Looks a little involved, but I'm largely fine with it; just a couple of
more or less cosmetic remarks:

> @@ -1329,28 +1338,13 @@ static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
>      return false;
>  }
>  
> -static unsigned long get_cmos_time(void)
> +
> +static unsigned long cmos_read(void)
>  {
> -    unsigned long res;
>      struct rtc_time rtc;
> -    static bool __read_mostly cmos_rtc_probe;
> -    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> +    bool success = __get_cmos_time(&rtc);
>  
> -    if ( efi_enabled(EFI_RS) )
> -    {
> -        res = efi_get_time();
> -        if ( res )
> -            return res;
> -    }
> -
> -    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
> -        cmos_rtc_probe = false;
> -    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
> -        panic("System with no CMOS RTC advertised must be booted from EFI"
> -              " (or with command line option \"cmos-rtc-probe\")\n");
> -
> -    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
> -        panic("No CMOS RTC found - system must be booted from EFI\n");
> +    ASSERT(success);

I'm not convinced of this assertion: It's either too much (compared to
what we had so far) or not enough, considering the behavior ...

>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>  }

... with a release build.

> @@ -1533,12 +1527,82 @@ void rtc_guest_write(unsigned int port, unsigned int data)
>      }
>  }
>  
> -static unsigned long get_wallclock_time(void)
> +static enum {
> +    WALLCLOCK_UNSET,
> +    WALLCLOCK_XEN,
> +    WALLCLOCK_CMOS,
> +    WALLCLOCK_EFI,
> +} wallclock_source __ro_after_init;
> +
> +static const char *wallclock_type_to_string(void)

__init ?

>  {
> +    switch ( wallclock_source )
> +    {
> +    case WALLCLOCK_XEN:
> +        return "XEN";
> +
> +    case WALLCLOCK_CMOS:
> +        return "CMOS RTC";
> +
> +    case WALLCLOCK_EFI:
> +        return "EFI";
> +
> +    case WALLCLOCK_UNSET:
> +        return "UNSET";
> +    }
> +
> +    ASSERT_UNREACHABLE();
> +    return "";
> +}
> +
> +static void __init probe_wallclock(void)
> +{
> +    ASSERT(wallclock_source == WALLCLOCK_UNSET);
> +
>      if ( xen_guest )
> +    {
> +        wallclock_source = WALLCLOCK_XEN;
> +        return;
> +    }
> +    if ( efi_enabled(EFI_RS) && efi_get_time() )
> +    {
> +        wallclock_source = WALLCLOCK_EFI;
> +        return;
> +    }
> +    if ( cmos_probe() )
> +    {
> +        wallclock_source = WALLCLOCK_CMOS;
> +        return;
> +    }
> +
> +    panic("No usable wallclock found, probed:%s%s%s\n%s",
> +          !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
> +          cmos_rtc_probe ? " CMOS" : "",
> +          efi_enabled(EFI_RS) ? " EFI" : "",
> +          !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
> +           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n" : "");

This last argument is sufficiently complex that I think it is pretty
important for the question marks and colons to respectively align with
one another, even if this may mean one or two more lines of code.

Jan

