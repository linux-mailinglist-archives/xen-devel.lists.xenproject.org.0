Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D375696BB40
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 13:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790161.1199861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sloW5-00057Y-Dj; Wed, 04 Sep 2024 11:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790161.1199861; Wed, 04 Sep 2024 11:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sloW5-00054x-AK; Wed, 04 Sep 2024 11:49:41 +0000
Received: by outflank-mailman (input) for mailman id 790161;
 Wed, 04 Sep 2024 11:49:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sloW3-00054r-TA
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 11:49:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3984708-6ab3-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 13:49:38 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so678524366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 04:49:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989092143sm802749766b.96.2024.09.04.04.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 04:49:37 -0700 (PDT)
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
X-Inumbo-ID: c3984708-6ab3-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725450578; x=1726055378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t2CyRcIERORzrgXWh/GpSXPVkZLnLv9xWLmaGadaoK4=;
        b=NlyMdhvZE+LYqBTG3+KUEyoaWCA52kIxBrEBha08V924kJvqmtgSr+PZSr6DXd0aaB
         SF5Bgs1BA3bMiKVUgwiPbu/1HdLaWRNlKdmAvnAJ2pP9TeKZvRVx4ETyeIu3OAGuw+T2
         4LCaT+BnL61poV5OZgy9FXV0IaBFGAk3im+w6ACPV917SbCmmsngO9zHi3WN34V3FbtZ
         3EJCLdH5G59cJqP17i+7g40ujjmbxGLNVOwPowWUjQ/YCI4P7f+LHDGpRfxkUsp+qZC0
         zdJjT3sDon3WLPGNbrfs+wOFFvxw26x5d6oZmAohb1XlgvkYXIMVAe8y8JFobZmgixhy
         cUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725450578; x=1726055378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2CyRcIERORzrgXWh/GpSXPVkZLnLv9xWLmaGadaoK4=;
        b=Z79T86EUKUOZNpkYZYxCmu5hh5oe0wBaR49mq1VDdgeArE1G9TkZ4Bn/2xg6cJnIKy
         Pbkvlq4i4b6ipwYm78gVLheoDSDmW4KGWQ7WMujCSzxqdV8qVKrsAlq1FYuTyD8/hELe
         e614xbEhBMNw59+aVpfZ5DcW4etGcBimUMKZ74gAwtoTG3T9YgX+h73wCJNVrp7/6l6Q
         QQ+YwU9LEFL6ljAkpZ7ERzhgaeVka463BSTHfX6jMYgcYFXFQy4Pr3cSvwyYS8RT/UKn
         xBHcDHsLD2eHEF3/XqOlZx7LTHjF/gYDHLWKIWs3MwNUy/WiMP7s5ltnnw0MgRAPU8fb
         ek0A==
X-Forwarded-Encrypted: i=1; AJvYcCU6xWEzzCSAl5XtdOePF4+Vl9ttMH4m0QNshHF6hBROjIL8OKZjeTREofL571KRfWyzPKf84h3JId4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUc3gCUdO4iSjAw6fAERUDyLBY4e1kh0aEFg9ni2oczCxmzDU2
	Y5dDdczdhTlrPTQTfRTj1799TtN0XtkQqsRW6TxIv5zYI9W55HFh4DI/KPuG4w==
X-Google-Smtp-Source: AGHT+IE/e/2CZoMpv18ewmDJLrZdHTU1woxACwFFQak7VtcZ9aMOtiQ0H3tGNjRY+6pvFmGZY9D7yg==
X-Received: by 2002:a17:907:8f07:b0:a89:f590:98a5 with SMTP id a640c23a62f3a-a89f5909994mr576257266b.60.1725450577967;
        Wed, 04 Sep 2024 04:49:37 -0700 (PDT)
Message-ID: <dde7fd70-3273-4569-b412-d276d4974882@suse.com>
Date: Wed, 4 Sep 2024 13:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] x86/time: introduce probing logic for the
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-5-roger.pau@citrix.com>
 <bc1bd23f-edf5-447a-9799-bca0a6cd696e@suse.com>
 <Ztg9VeXxdM2iBLOR@macbook.local>
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
In-Reply-To: <Ztg9VeXxdM2iBLOR@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 12:58, Roger Pau Monné wrote:
> On Tue, Sep 03, 2024 at 05:32:27PM +0200, Jan Beulich wrote:
>> On 03.09.2024 15:03, Roger Pau Monne wrote:
>>> @@ -1329,28 +1338,13 @@ static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
>>>      return false;
>>>  }
>>>  
>>> -static unsigned long get_cmos_time(void)
>>> +
>>> +static unsigned long cmos_read(void)
>>>  {
>>> -    unsigned long res;
>>>      struct rtc_time rtc;
>>> -    static bool __read_mostly cmos_rtc_probe;
>>> -    boolean_param("cmos-rtc-probe", cmos_rtc_probe);
>>> +    bool success = __get_cmos_time(&rtc);
>>>  
>>> -    if ( efi_enabled(EFI_RS) )
>>> -    {
>>> -        res = efi_get_time();
>>> -        if ( res )
>>> -            return res;
>>> -    }
>>> -
>>> -    if ( likely(!(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC)) )
>>> -        cmos_rtc_probe = false;
>>> -    else if ( system_state < SYS_STATE_smp_boot && !cmos_rtc_probe )
>>> -        panic("System with no CMOS RTC advertised must be booted from EFI"
>>> -              " (or with command line option \"cmos-rtc-probe\")\n");
>>> -
>>> -    if ( !cmos_probe(&rtc, cmos_rtc_probe) )
>>> -        panic("No CMOS RTC found - system must be booted from EFI\n");
>>> +    ASSERT(success);
>>
>> I'm not convinced of this assertion: It's either too much (compared to
>> what we had so far) or not enough, considering the behavior ...
>>
>>>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>>>  }
>>
>> ... with a release build.
> 
> My reasoning was that on a debug build we want to spot any such
> issues (as it's likely a symptom the RTC is misbehaving?) but on a release
> build we should rather return an incorrect wallclock time rather than
> panicking.  I can remove the ASSERT and local variable altogether if
> you prefer.

I would prefer that, yes, but I also won't insist.

>>> @@ -1533,12 +1527,82 @@ void rtc_guest_write(unsigned int port, unsigned int data)
>>>      }
>>>  }
>>>  
>>> -static unsigned long get_wallclock_time(void)
>>> +static enum {
>>> +    WALLCLOCK_UNSET,
>>> +    WALLCLOCK_XEN,
>>> +    WALLCLOCK_CMOS,
>>> +    WALLCLOCK_EFI,
>>> +} wallclock_source __ro_after_init;
>>> +
>>> +static const char *wallclock_type_to_string(void)
>>
>> __init ?
>>
>>>  {
>>> +    switch ( wallclock_source )
>>> +    {
>>> +    case WALLCLOCK_XEN:
>>> +        return "XEN";
>>> +
>>> +    case WALLCLOCK_CMOS:
>>> +        return "CMOS RTC";
>>> +
>>> +    case WALLCLOCK_EFI:
>>> +        return "EFI";
>>> +
>>> +    case WALLCLOCK_UNSET:
>>> +        return "UNSET";
>>> +    }
>>> +
>>> +    ASSERT_UNREACHABLE();
>>> +    return "";
>>> +}
>>> +
>>> +static void __init probe_wallclock(void)
>>> +{
>>> +    ASSERT(wallclock_source == WALLCLOCK_UNSET);
>>> +
>>>      if ( xen_guest )
>>> +    {
>>> +        wallclock_source = WALLCLOCK_XEN;
>>> +        return;
>>> +    }
>>> +    if ( efi_enabled(EFI_RS) && efi_get_time() )
>>> +    {
>>> +        wallclock_source = WALLCLOCK_EFI;
>>> +        return;
>>> +    }
>>> +    if ( cmos_probe() )
>>> +    {
>>> +        wallclock_source = WALLCLOCK_CMOS;
>>> +        return;
>>> +    }
>>> +
>>> +    panic("No usable wallclock found, probed:%s%s%s\n%s",
>>> +          !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
>>> +          cmos_rtc_probe ? " CMOS" : "",
>>> +          efi_enabled(EFI_RS) ? " EFI" : "",
>>> +          !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
>>> +           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n" : "");
>>
>> This last argument is sufficiently complex that I think it is pretty
>> important for the question marks and colons to respectively align with
>> one another, even if this may mean one or two more lines of code.
> 
> I had it that way originally, but then it seemed the extra
> indentation made it less readable.  Will see how can I adjust it, my
> preference would be for:
> 
>     panic("No usable wallclock found, probed:%s%s%s\n%s",
>           !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
>           cmos_rtc_probe ? " CMOS" : "",
>           efi_enabled(EFI_RS) ? " EFI" : "",
>           !cmos_rtc_probe ? "Try with command line option \"cmos-rtc-probe\"\n"
>                           : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n"
>                                                  : "");
> 
> But that exceeds the 80 columns limit.

Right, formally the above would be my preference, too. Here two shorter-
lines alternatives:

    panic("No usable wallclock found, probed:%s%s%s\n%s",
          !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
          cmos_rtc_probe ? " CMOS" : "",
          efi_enabled(EFI_RS) ? " EFI" : "",
          !cmos_rtc_probe
          ? "Try with command line option \"cmos-rtc-probe\"\n"
          : !efi_enabled(EFI_RS) ? "System must be booted from EFI\n"
                                 : "");

    panic("No usable wallclock found, probed:%s%s%s\n%s",
          !cmos_rtc_probe && !efi_enabled(EFI_RS) ? " None" : "",
          cmos_rtc_probe ? " CMOS" : "",
          efi_enabled(EFI_RS) ? " EFI" : "",
          !cmos_rtc_probe
              ? "Try with command line option \"cmos-rtc-probe\"\n"
              : !efi_enabled(EFI_RS)
                  ? "System must be booted from EFI\n"
                  : "");

Either of these or anything more or less similar will do imo, just as
long as the ? vs : alignment is there.

One thing I notice only now: The trailing %s will be a little odd if
the "" variant is used in the last argument. That'll produce "(XEN) "
with nothing following in the log. Which usually is a sign of some
strange breakage.

Jan

