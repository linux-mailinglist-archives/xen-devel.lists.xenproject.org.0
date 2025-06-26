Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCCAEA2F0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026723.1401914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUonm-0004Z9-DA; Thu, 26 Jun 2025 15:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026723.1401914; Thu, 26 Jun 2025 15:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUonm-0004Wr-Aa; Thu, 26 Jun 2025 15:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1026723;
 Thu, 26 Jun 2025 15:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUonk-0004Wl-Ur
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:46:12 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa264e72-52a4-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:46:03 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so719533f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 08:46:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23abe3f535esm985025ad.142.2025.06.26.08.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 08:46:02 -0700 (PDT)
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
X-Inumbo-ID: aa264e72-52a4-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750952763; x=1751557563; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YsUWoyoctkemtOz6fwgwSl0pHJTLE5/67MsKJbMWSp4=;
        b=MzZ4bz1ltb/OtGBBWwYn/ttMYy9TjLh+c2PgCfIES7wnvsIXrmMerANDTq0vu9GsXo
         b7QCmItBRRn8xHJHkK6WzrSCTD2BN8gfeXmSUwPvKvYcpjrE+rdYmsid6cAYkLXRsyBq
         h0hFwx4QcuJkHA+RNYFo3mvmX8siTDwqKlaCwtHWuuFL+nEfZSKqclnNetduy50HBSYe
         Z29B0c3zIBM7h2NBZ3GgNWdjlAlepoghlb0X2PUk6jwSWgMr3yg9qlVdI+xyssTxv0uw
         DUVmIorSpRgqI9PCuYi103acEbIh1Q0DJxCBDedGd3QzxXrLuj3U5vKcmtNwRLLNt8Ki
         wR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750952763; x=1751557563;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsUWoyoctkemtOz6fwgwSl0pHJTLE5/67MsKJbMWSp4=;
        b=ZSP43R8A3KIA35indn5/LIkFKqHpY6ftzaGGtn+K3l31E2tg49h7bA4E2iae2ZlVai
         wPAmXEtihNzCUR2bnQc96AXoSXtfHesALa6HTWWUyfIdbqvtOSAGd+4jU3PuknNJxIXs
         d/RkbTevb0gToWkhOtzxe3+j8wvhJkyO8WWWMdCa2NcjnJd39AG6yEtb3ZeXF1yg2SE6
         s4TwmHQ+rJWzsAIdZS38A2pSiXhdw1GC6IUDU/RA8lBDeCrQI6dh9ZaK8MnvJ61mc+2a
         ciFlSvgvBkKLXhfbqozMWWG9HWAZC8gIW2swGFmzUO6sboudbHXQ0a7qgyZMPE/Dqjpq
         i6GA==
X-Forwarded-Encrypted: i=1; AJvYcCXYzgJT8W/L1Dv/x2KnfidfpjSBnRz15V5yhW5q/qM1JkZBqQpKnqiFeXydo/4/gHogdEO6/BdpfNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQn72LK4pOCIi/IjMK4hjWZ8zdSkbOGy2b0BkcpYR/LnLzM1Zl
	kOUMqZhfmTDcX3X0B+WlLbbLoaUwbRVFRwMwbLMovg5XaoYccW2gAUADx+xWCXoCoQ==
X-Gm-Gg: ASbGncs0jVCUqnRjB2DoOIY2WSLzMr76W9UZD5aG1P0SNeKlhlInPZfhPyFrL993qWZ
	uvNaJcIVl/UqXHkKDGbQzUVguJGMMCoHShF8MlhjkV/ZSeG2i7ixYKraone8BnQWfKeOH0uaa4C
	unJeAFvRykswKKWWmb+7+D9L9fdZbyCyGxnBFfkH9b6bjoRYy06PVCX6H29HQ5zXjOSOtK9l9lt
	qfCRWBiM0RJG8mK+Lh4hewTKpkp8CiNh0WUWG3SgKQuLRjRgjn2bXrzFq32io9aKbPzQ48TI3Wx
	B5AV8Zx++cgN2qXgD3z7W0VY79NlIoCvAE5C1XkCK1b1ivjcBkOThh9+LMHU/BYIdYKCpEDBVEu
	yXFvQ2AdKRJUQZT9R5KJTWjpDiFCa7gbfmbDafaQrQUb905/t7O7Em2Q99g==
X-Google-Smtp-Source: AGHT+IEnL9s+illgmh4N43IAFMmYtwhbDT3XODUPLOB6JeVHsODKLzjrYpFD9sXBkLau5KRoCK9gHg==
X-Received: by 2002:a05:6000:23c3:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3a6ed66a535mr4374560f8f.32.1750952762705;
        Thu, 26 Jun 2025 08:46:02 -0700 (PDT)
Message-ID: <634154c0-ecd7-4c24-bc52-91aeefe367f0@suse.com>
Date: Thu, 26 Jun 2025 17:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
 <fe4920a2-4add-4e07-80f3-50eb37de0754@suse.com>
 <c1d38fa9-a959-470f-96ce-462ea7e04041@citrix.com>
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
In-Reply-To: <c1d38fa9-a959-470f-96ce-462ea7e04041@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2025 17:31, Andrew Cooper wrote:
> On 16/06/2025 1:59 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -487,6 +487,12 @@ static void __init guest_common_max_feat
>>       */
>>      if ( test_bit(X86_FEATURE_RTM, fs) )
>>          __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
>> +
>> +    /*
>> +     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
>> +     * FAST_STRING is not set should not affect the view of migrating-in guests.
>> +     */
> 
> The logic is ok, but the justification wants to be different.
> 
> "ERMS is a performance hint.  A VM which previously saw ERMS will
> function correctly when migrated here, even if ERMS isn't available."
> 
> What Xen chooses to do with the bit isn't relevant to why we
> unconditionally set it in the max featureset.

It's different words for effectively the same thing, to me at least. I can
certainly use your wording, ...

>> @@ -567,6 +573,16 @@ static void __init guest_common_default_
>>          __clear_bit(X86_FEATURE_RTM, fs);
>>          __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
>>      }
>> +
>> +    /*
>> +     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
>> +     * FAST_STRING is not set should not propagate to guest view.  Guests can
>> +     * judge on their own whether to ignore the CPUID bit when the MSR bit is
>> +     * clear.  The bit being uniformly set in the max policies, we only need
>> +     * to clear it here (if hardware doesn't have it).
>> +     */
> 
> "ERMS is a performance hint, so is set unconditionally in the max
> policy.  However, the guest should default to the host setting."

... also here.

>> +    if ( !raw_cpu_policy.feat.erms )
> 
> This wants to be the host policy, not the raw policy.  That's why
> `cpuid=no-erms` isn't working in the way you'd expect.
> 
> cpuid=no-$foo means "Xen should behave as if $foo wasn't reported by
> hardware", and that includes not giving it to guests by default.

Hmm, interesting. That's definitely not the meaning I give this. To me it
means merely Xen shouldn't use the feature (with an impact on guests only
when the feature in hardware is required to surface it to guests). I
don't think we have the precise meaning of this option written down
anywhere?

>> +        __clear_bit(X86_FEATURE_ERMS, fs);
>>  }
>>  
> 
> It occurs to me that there are quite a few examples of clear/cond-set
> which could be converted to cond-clear like this
> 
> I'll do a prep patch to make things consistent.  It shouldn't conflict
> with this, but I'd prefer to keep the function logic consistent; it's
> hard enough to follow already.

Right, I too noticed that there are others which could be swapped over.
I actually had it the other way around in early versions of the series,
and it was only in the course of some re-work where I noticed it might
be a little tidier this way. But I first wanted to see whether perhaps I
have some thinko there, so didn't want to convert anything pre-existing.

Jan

