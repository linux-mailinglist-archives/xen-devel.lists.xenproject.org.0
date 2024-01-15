Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4682DDE5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667532.1038893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQAR-0001Wm-Vz; Mon, 15 Jan 2024 16:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667532.1038893; Mon, 15 Jan 2024 16:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPQAR-0001Un-TG; Mon, 15 Jan 2024 16:50:31 +0000
Received: by outflank-mailman (input) for mailman id 667532;
 Mon, 15 Jan 2024 16:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPQAQ-0001Uh-RB
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:50:30 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 309d442c-b3c6-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 17:50:29 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so109840981fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 08:50:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o15-20020a92c04f000000b0035ff59f9ffcsm2967233ilf.62.2024.01.15.08.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 08:50:28 -0800 (PST)
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
X-Inumbo-ID: 309d442c-b3c6-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705337429; x=1705942229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGx3HHEx1eMnvP9RBHECTf+SVCi4B1rDNyRaJ7O+qMk=;
        b=CVays0LEzBn1wk8I/yUf8nz53885EiM9ZBIg6ZmndHFvvNOspL/PM6mBQUWbHgzuIb
         T+QdmvIKhYuSOCGhW2xPeRDJ5ulTM3hL+3tHJXQz2/Ub2JReuApil7nfh0LFuDI5Hpat
         ZlwtEkrFTxgVJZfMHQS+MZCe6EJg1eBkC3MG5bTpMu5h5iEXtEE96bET7YDZxdZBuP/6
         DmtCMBvFeW85XvSH+lW/GaQJQ3f8EyLRNwNtm0UBKhUKBzbkiPRIqEMxHMhCodXu0MwF
         8Id0/JSb1oH/2Ucw0v8eIVQXYfr5N6mKYkWzpLqqMxiw/WFe4xR76Ty7XB27hMTEoSmK
         l1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705337429; x=1705942229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGx3HHEx1eMnvP9RBHECTf+SVCi4B1rDNyRaJ7O+qMk=;
        b=DAh8FsgUaoadd55Xjd45mdTIIf+An9SdxuOf46qSLFTI/+I5MOWoJnhjaNirN0P8fG
         vxxSrHilSfDXinP/mQZPHmmAQq/0XhwL8RlKM52FzyzZ+2JMCkT5O7sdSWclrJVEmUcq
         7BfQr78fw1k2K1zgvQuAJMDKsAj46d8es8Re28KSMbit4aSbBex5PU8QeGQ/YIYUX98e
         aTyJGJ0KfhIwi5zIInQ8pLd5qOFUGTPzvMMukRHtW9bHuy0AMV5PUC2Fv6Xy19RFjJHT
         cxnSG6XWAF75Agb/fJCBAW4LjVWfp3JlBo7bXeFuLE9Lms96tukjX8SnAzCX7WcxDwbQ
         g7Yw==
X-Gm-Message-State: AOJu0Yy1z7+4bsE06Ew+Be+RRQsFtMiVKcl3ZTvxT9nyLRQQAUlFAAi6
	1RZSD4goq17KTfDZPda0niBmSbeXLeZz
X-Google-Smtp-Source: AGHT+IFyGtT4/a8f7OfZqPF0OfhHdWPEf3deP0sOguX4asQ4lZdqizAHERimxt+7ss2sNy/+8Qqkug==
X-Received: by 2002:a2e:968a:0:b0:2cc:fe00:c6ee with SMTP id q10-20020a2e968a000000b002ccfe00c6eemr2528890lji.95.1705337429071;
        Mon, 15 Jan 2024 08:50:29 -0800 (PST)
Message-ID: <39a0477d-a4ad-40e7-8a16-0b2d514e8097@suse.com>
Date: Mon, 15 Jan 2024 17:50:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: HWP vs "xenpm get-cpufreq-..."
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2e66d36-5545-40e4-847d-be3b3a523944@suse.com>
 <CAKf6xpsdtUZ8ugO3rtdU1ZMSR=UzhxpGhe4XSef9odnVhofz0w@mail.gmail.com>
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
In-Reply-To: <CAKf6xpsdtUZ8ugO3rtdU1ZMSR=UzhxpGhe4XSef9odnVhofz0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2024 17:45, Jason Andryuk wrote:
> On Mon, Jan 15, 2024 at 11:04 AM Jan Beulich <jbeulich@suse.com> wrote:
>> I thought I'd try hwp on a SapphireRapids system, and of course - short
>> of easy other ways of seeing whether it actually has any apparent
>> effect - I've looked at "xenpm get-cpufreq-states" output. Just to find
>> that according to this, the system never enters any of the designated
>> Pn states (all CPUs are always claimed to be in P0), while at the same
>> time the P0 residencies remain in the hundreds of milliseconds. The
>> latter suggests CPUs do leave P0, yet it's then unclear what state they
>> are in during such time periods.
> 
> The `xenpm get-cpufreq-states` output may be stale under HWP.  If
> normally the acpi-cpufreq driver is updating them, they won't be
> updated under HWP.  I'll have to look into that more, but I guess they
> shouldn't be returned under HWP.

Likely - anything that conveys no real information (and hence is at
best confusing) would better be avoided.

>> I was also a little puzzled when comparing "xenpm get-cpufreq-para"
>> output with hwp against that with acpi-cpufreq: The latter lists a range
>> of 800MHz ... 2501MHz, while with hwp base is 2500MHz and max is 4800MHz.
>>
>> Do you have any explanation for these apparent anomalies?
> 
> The 1 in 2501 indicates the ACPI entry for the turbo frequencies.
> It's a limitation of the ACPI tables, AFAIU.  The tables weren't
> designed for turbo mode where the thermal constraints dynamically
> limit the maximum speed.  On systems I've looked at, there would also
> be a 2500MHz ACPI entry, which matches the HWP base.
> 
> The HWP 2500MHz & 4800MHz values are taken from cpuid output - I feel
> confident they are correct.  The output of `xenpm get-cpufreq-average`
> under HWP looks reasonable for scaling all the way up to 4800MHz
> (which can only be hit briefly before throttling down) - I think I've
> only seen ~4700MHz as a maximum in my use, and they it may drop to
> ~4200MHz for extended preiods.  Maybe try that command on your test
> system?

I'll try to remember to check that next time round.

Jan

