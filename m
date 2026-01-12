Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79444D114AF
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 09:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199909.1515944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfDW3-000154-9B; Mon, 12 Jan 2026 08:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199909.1515944; Mon, 12 Jan 2026 08:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfDW3-00011x-66; Mon, 12 Jan 2026 08:43:11 +0000
Received: by outflank-mailman (input) for mailman id 1199909;
 Mon, 12 Jan 2026 08:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfDW1-00011r-9D
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 08:43:09 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4c87f3d-ef92-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 09:43:02 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so62860985e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 00:43:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f686sm341713815e9.3.2026.01.12.00.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 00:43:01 -0800 (PST)
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
X-Inumbo-ID: b4c87f3d-ef92-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768207382; x=1768812182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUtbrT3/VK7ixul3bKTwExavRHv8vag5XdwonnMG/E=;
        b=KjBiC5x7zKX4mCS9FvHPrbM44A3R3aSQx37+58p+m94aPvc2035MKHc/ibSN7RFCK1
         ts4gZ+K39NSC+I+GmgtCHN4918ojzDxMrf2OWF03LurR/2MZlGa6uRiVu4GidnV2pzFa
         ZTeKM44pqnCHe48pyLecVsLxlJvuJik4LpoXEP6BiLkgWlFJT1l8Bxkc0dyGjXfJzdp1
         oEA45UfANvA5fGeNu1swrOv+bKq1nTWjkAt/lO8CJrD8wrEvt2PQJSWAT8FOLhIhWlJ3
         aTROV2qD1hA1okl/jjbaxvj0X8ECOVeksiLkfbvfigI9+VPEOeoTeX9plbaeRaHFL5h4
         RZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207382; x=1768812182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oUtbrT3/VK7ixul3bKTwExavRHv8vag5XdwonnMG/E=;
        b=vpbFZDvxuxdI1BUN3K8CLewT9wTVdYqeph/AqoB9rL7sKyyPbOwmpNVR1PLufC+LoI
         DZbPwlVdoILhXUDKQp57B4rVMhKFKflPeZC4LJ+i1UUY6R9NVzgBKW4TTttTvJKvGaea
         DkRc7EoGGC2Mb9fpa6J5ACSIJp/Lah/j81oMMsxeKkj3tWHh/0LbNfNTafFTX21Q5fBB
         4ufQK1yqeX+VEzkVsXjj/Kh1hh+bxfIBZ5xhk3cWjuXn3G0m4uVGmEdcu9bw/sBDKe8w
         GMne8Se2n/uw5WRHmLRht7FGx3iOouImqdDjjcSIrdk35Y/1FTguHCTVkPepg4GaWeAl
         42uA==
X-Gm-Message-State: AOJu0YzwHRMcCFxSIxKe4LKwAXyquWx6pe1QGZZpMNcioXIWGfMd2ezq
	4Omu7IrNZprxIyBMNnmq5cEPr30AjCem9WMaiFBXanPfbddEQtMT0OsQTQtDBLyVzA==
X-Gm-Gg: AY/fxX5wN04eD52RpOXNwxSSoyHYsKDyk9RbdowyJYrFMUHER8KXFT5FnTV4eMJlobR
	EJMQgDBdKbUyG8mWILImArfCqApEHZtmlVKY7LHCexjO2SQ4vxVaBa6OHvXcpQLo3iJjX4/kaT9
	92+HTG/JqRFWRPI7TdLgCFW5MEODfZ5P3QxBCBSdScO48yaFDJOKrK0cPWPQenKbMqPo2KOid4K
	NJmTxdzkOGZz6wpOYkYlyDqdHo5Ixx7OgWYPVWI5zWnjAoHpsN2jBTXKu5WJu+Ws5HDlyGVgzXS
	V93UlndAzqYSO9eC177mwbrNV4So9lIBFUyeoEeCBN1Iwk0Vvbh8DKSQnSteY7pXlZVjwtZnncU
	veUmRFBhpy2TElfhtTlj2p2bAkfipejzTON0HCShLXVozZEDeTmtALww+AP3Ydt4GQy9rpJpKwI
	1SWRPwfEMK2NoJ4oqE1Tu+wggIfC8ZRskT6bpOPJZxtq3GGjW8gXksHsiZZmhT0hdmeoOnHcnRd
	JxuF/63TshLCQ==
X-Google-Smtp-Source: AGHT+IEweAC+rlhcy5i5NRxELR50Y4/nSt1dqxGH81AOkk2/aXvhX1D9nlR48EF6dvli2FR22ZSJdw==
X-Received: by 2002:a05:600c:34c5:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-47d84b3275fmr228218325e9.24.1768207382136;
        Mon, 12 Jan 2026 00:43:02 -0800 (PST)
Message-ID: <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com>
Date: Mon, 12 Jan 2026 09:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cpufreq drivers not working on T480S
To: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
 <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
 <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
 <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
 <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me>
 <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com>
 <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me>
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
In-Reply-To: <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2026 09:44, Milky wrote:
> On Thursday, January 8th, 2026 at 7:46 AM, Jan Beulich <jbeulich@suse.com> wrote:
> 
>>> The same is also true under Debian Live; does it mean that frequency scaling, since it seems to be working under Debian Live, doesn't always rely on this?
>>
>>
>> Yes, that's possible afaik. Which driver is in use there?
> 
> `/sys/devices/system/cpu/cpu0/scaling_driver` shows `intel_pstate`; confirmed also using `dmesg`, which shows Intel P-state initialisation and HWP being enabled.
> 
>>> Maybe also with Xen's command line try cpufreq=xen:no-hwp to disable
>>> HWP and see if the regular ACPI cpufreq driver works better
> 
> Following from Marek's message elsewhwere in the thread, I now tried adding in grub the correct Xen flag to disable HWP on Qubes: `cpufreq=xen,no-hwp`. I am pasting below the output of `xl dmesg`. It seems it no longer reports HWP being enabled. However, `xenpm get-cpufreq-para` still says "failed to get cpufreq parameter", `xenpm get-cpufreq-states` returns nothing.

And was is meanwhile checked that ACPI provides the necessary tables, and
xen-processor-acpi manages to processes and upload them?

Jan

