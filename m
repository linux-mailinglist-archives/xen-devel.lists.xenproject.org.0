Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC2A18C9C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 08:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875772.1286192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taUuu-0004sT-MD; Wed, 22 Jan 2025 07:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875772.1286192; Wed, 22 Jan 2025 07:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taUuu-0004r0-Jb; Wed, 22 Jan 2025 07:12:48 +0000
Received: by outflank-mailman (input) for mailman id 875772;
 Wed, 22 Jan 2025 07:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taUut-0004qu-3I
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 07:12:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 473ec8e3-d890-11ef-a0e5-8be0dac302b0;
 Wed, 22 Jan 2025 08:12:45 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso44535505e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 23:12:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31d99ffsm12695865e9.29.2025.01.21.23.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 23:12:44 -0800 (PST)
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
X-Inumbo-ID: 473ec8e3-d890-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737529965; x=1738134765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KK+6IApfm6L63hE7/QkDSe1SVLuwZgq9lNGJ5H7WOKU=;
        b=FWIp/2hmmmv8OzEgbhY448c6vnGojRb0abFJKcbTqxDHXuDXKmifkq1ge6zFtS10qt
         1hYjysDcHkq4PFjAuMkrrEdpDGgrvXXGaPfKQTpifEsOPo7Mw4nY4QxP99pFUndCtEaK
         Tn9pjrxEv2rozmD34m4b7FFOPHT47x0qnIlvHOgl8fQmovamcTUnuRmpb7GxCsGAMq4f
         0H/jIM4ZguUMP+Fc4t9GntcBbFUB5RTzQJHPwYn8nxej/SHZkUPJu2hRqith2gzycpk/
         fPrRU33hPiG83pXF1Lv6yYo8py6lRuf23PFkNalrGMtUHKUYfWuj332xkP79Y2hWRgCi
         uAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529965; x=1738134765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK+6IApfm6L63hE7/QkDSe1SVLuwZgq9lNGJ5H7WOKU=;
        b=rJHecxtLnL8NFWKm1LM50/WlwEf1WeQc43kfzpKpAh1rJMQHbCVR6tfYxGtnh0ovD8
         KjXemytQZWC9dtndo/1rS8S/PgP8uQvnK60vjFjd+o8XMsTPUDnUpjvEhhhq3JCF4SfG
         USnBKw7uUN+LONu5jq4nycP5YyFSn2yhdWBgATwZEVQU8D4mseIvm2uAzWd31o6OQdFo
         rxyzRwR28XlYAwR3z2goIdMCSUQzviN8uWXcR/F5T1BaJAnRD3Tx4UGD/VVbNdc5uR1Y
         QcpYzvbBOaniWLyCAYBZEH0z4Oc1nRxwrVJD5WFEh1lIZlIuvXpKBSmv29Zz0RUsbZ/3
         +8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkb8ChFV04JxYl6R2eS2pB7loCZLh9tcvpVBrDSzCqbL8tdI5tEbv17uQNerA+jt2i4AxUCpQ1HLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvgTfNJhtVJAuH5dzOXBvPvuz1rRe3gl9OYkAscSRPUTy6L8wp
	w5fqkGJPofnGKxHV35xv02dGMzKLVnkhsN3Pnzm0hpT1WkEj+molpRii4QEe9Q==
X-Gm-Gg: ASbGncsjNHzIrBTJFZ4Ej7Thu4PuzUeazqDb62UQDwENcBbEZsLF5YjQx9C+ec56VBu
	hSTi604U+dH3z+MOnDpVqo9mLzwGWRyeUYdGJp/4VEBlxluCdT8SmHCR+MjQWKdT2u4HYfN3qv4
	/BgYmN2WjhX4AddLg2kAP9duQCe/dL22hLDvjBbpRRDmOonP0V8ur8X0DJ12mkYzsCPF78GDoTd
	kHTGP+aYFMN1LuF0nyxnYpaojhUtDA/nrCCBZSBZcNyfis3dBx5dJE4bhfRFFaMilm4XVfl60Vd
	W3baFsi0lkgjz5+Gy2PQlSvKN1x+OKvOtaBUV+ya7gTpjRNdiDA/XCQ=
X-Google-Smtp-Source: AGHT+IHRrZ1BwNeb5Wv8RdaMiKxFFpu/ItS4uhc46rNbgB8Hn9mV9P4aHmdWRn8LYnJ4V8ejlhLyLw==
X-Received: by 2002:a05:600c:a03:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-438913ed350mr194670715e9.12.1737529964912;
        Tue, 21 Jan 2025 23:12:44 -0800 (PST)
Message-ID: <c1e6d78e-d5c4-4fbe-815f-e1bdcbc47e31@suse.com>
Date: Wed, 22 Jan 2025 08:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v2] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jonathan Katz <jonathan.katz@aptar.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
 <20250121165626.380627-1-andrew.cooper3@citrix.com>
 <741f15ea-2c54-4e02-8be6-bcce10c7393b@suse.com>
 <fb62d881-720e-499f-a301-fdf1880b097c@citrix.com>
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
In-Reply-To: <fb62d881-720e-499f-a301-fdf1880b097c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 18:07, Andrew Cooper wrote:
> On 21/01/2025 5:04 pm, Jan Beulich wrote:
>> On 21.01.2025 17:56, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/intel.c
>>> +++ b/xen/arch/x86/cpu/intel.c
>>> @@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>>>      printk("%u MHz\n", (factor * max_ratio + 50) / 100);
>>>  }
>>>  
>>> +static void init_intel_perf(struct cpuinfo_x86 *c)
>>> +{
>>> +    uint64_t val;
>>> +    unsigned int eax, ver, nr_cnt;
>>> +
>>> +    if ( c->cpuid_level <= 9 ||
>>> +         ({  rdmsrl(MSR_IA32_MISC_ENABLE, val);
>> Just curious (not an objection or anything): Is there a reason you have
>> two padding blanks here instead of just one?
> 
> Alignment with the next line.

Yet that's then merely a matter of removing a blank from that line too,
isn't it?

>> (Really we may want to gain
>> a function-like form to invoke RDMSR, but that's orthogonal to the change
>> here.)
> 
> Indeed.
> 
> * def0701b5373 - (xen-nj-msr) switch rdmsrl => rdmsr (30 hours ago)
> <Andrew Cooper>
> * 1a3f92abccf1 - rdmsr (30 hours ago) <Andrew Cooper>
> * 01c9ec7d9482 - rdmsr_safe (30 hours ago) <Andrew Cooper>
> * 7ec72a0379b2 - fix error printing in write_msr() (30 hours ago)
> <Andrew Cooper>
> * 3ff3d60835a5 - drop wrmsrl (30 hours ago) <Andrew Cooper>
> * 136128799b4a - wrmsr cleanup (30 hours ago) <Andrew Cooper>
> * b2ed78d2e7e3 - x86/msr: Move MSR_FEATURE_CONTROL handling to the new
> MSR infrastructure (30 hours ago) <Andrew Cooper>
> * 7691edea3d67 - x86/msr: Clean up the MSR_DEBUGCTL constants (30 hours
> ago) <Andrew Cooper>
> * 77ba2827a955 - x86/msr: Clean up the MSR_MISC_ENABLE constants (30
> hours ago) <Andrew Cooper>
> * 7f2768cfc4b3 - ---upstream--- (30 hours ago) <Andrew Cooper>
> * 8b2e048fdd14 - x86/msr: Introduce msr_{set,clear}_bits() helpers (30
> hours ago) <Andrew Cooper>
> * 562f88503342 - x86/msr: Clean up the MSR_FEATURE_CONTROL constants (30
> hours ago) <Andrew Cooper>
> * 199888c9e2f8 - x86/msr: Clean up the
> MSR_{PLATFORM_INFO,MISC_FEATURES_ENABLES} constants (30 hours ago)
> <Andrew Cooper>
> * c3f5d1bb40b5 - (tag: 4.20.0-rc2, xenbits/staging, xenbits/master,
> upstream/staging, upstream/master, origin/staging, origin/master,
> origin/HEAD, staging, pending, master) automation/cirrus-ci: introduce
> FreeBSD randconfig builds (4 days ago) <Roger Pau Monne>
> 
> That was work I did while sat in an airport unable to leave XenSummit in
> Nanjing...
> 
> It's blocked on arguments over naming.

Is it? I couldn't find any replies of mine in my outbox (and a quick
attempt to search by subjects on the web also didn't reveal anything),
but then Nanjing also was quite some time ago.

I fear you will not like this, but from a more general perspective:
When you say "blocked" for your own patches, it's usually the case that
the ball is in your court. Interestingly other people's patches (say
Roger's or mine) are, when they are "blocked", also often lacking
feedback from you. While it's apparently close to impossible to get
you to reply on such threads rooting in other people's patches,
shouldn't it at least be entirely in your own interest to keep the ball
rolling when it comes to your own ones? That is, make an attempt (or
perhaps repeated ones) to come to some form of agreement?

Plus for anything you deem blocked, you know where the list of pending
x86 patches is that you could add yours to. Since in that table we
record last posting dates, finding the patches is then much easier as
well.

Jan

