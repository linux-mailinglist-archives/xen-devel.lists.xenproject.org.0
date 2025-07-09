Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEA5AFE3BC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 11:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037941.1410462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQqK-0002FF-9L; Wed, 09 Jul 2025 09:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037941.1410462; Wed, 09 Jul 2025 09:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQqK-0002CP-5I; Wed, 09 Jul 2025 09:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1037941;
 Wed, 09 Jul 2025 09:11:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZQqI-0002Az-Nu
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 09:11:54 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c14aaab5-5ca4-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 11:11:53 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso5181215f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 02:11:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c301ae5fesm1487843a91.38.2025.07.09.02.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 02:11:52 -0700 (PDT)
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
X-Inumbo-ID: c14aaab5-5ca4-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752052313; x=1752657113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3u+nBpmFkqXw+4u/+Z/DE81CYhppbwOKZkUrUxP88MI=;
        b=bVSIdlK+WMV9gcsYLO2VVeHg+keJdKDaG6oyV2SEn3ACi9W+79oDidOPj3CVlgkoUJ
         K2y0wWwmfRQin8QATpNFucxuCZf3RWe0xnqRh6HuUqOEIgoC83eSoKif8oo2+OF8YEZj
         C3aJlfH4sW8mpQB79DHd2lCBzNi55JkyDBAT2//J+iv8SAuN2DpbqdRZxabbjVvMNqun
         tGC51j9b6iHtVQ7pMBTmHbyXh8F6ZNc2KvjFKd+LhfKuq/DZdqE9s+kwPbAFdeXsB8fR
         jXI9x+KBQ6L8E9e0excXGca8F3x1NMc7avh/nii9UJUyKlUCdJTFxoLjhrYhW04PbXml
         uXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052313; x=1752657113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u+nBpmFkqXw+4u/+Z/DE81CYhppbwOKZkUrUxP88MI=;
        b=UfP9A+FdUjFs2YslCAJQkCMyllZiHmQ7An5zJ01gPP2qTQ7lPRMT4MG8l8fhbehfHM
         CPzgRYe2iZX9G9Zp3K+oD6Osz5MF34W+26P3R/PHvzSFLK45Pama3IIBQVQp7jyPOTOo
         jYkB7Wx/kzjZVcxvBIvk1ajRuD6BSmiXHZ9ZL4XM7I6D59qLfyF1EvnHgB4KBkoyIIOn
         ArOq/ZiOm7qpNwXFMXc7XYz1DOMxAEQ6eWW47GZ7RD0jvTIUGC8JERofYU0C4zfFMNaI
         Q1prAPZoxUoDIyj97nkwgWxUe7FfU4ncc78WXYXZUsUeaRTdbRVV+WvJQp5XHilEOSgu
         1zng==
X-Forwarded-Encrypted: i=1; AJvYcCWhRCEiknucEtgxqsls5IRF5t1Y/kZpE/jkX3bFE6NnY0nabu3uhr05PoHmHoCIZfFckc99RTbLVgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsNn2iJPc1c7fsoXYxMLVds4hS+f2xmooHnSj6p0CjNU381uj5
	4939kVIdvddE1mBXkkk8vYOL5D7KU43PAH6NJBYLtjorf6TWURRnBaTGaHD9pwsDoA==
X-Gm-Gg: ASbGncvVNVAtXvp60QnRRBFSPUPmBcgGkrnhc9AvZNkSBl1S0J4IdxNYHOwiC7aIPA7
	rPIyi3ewsml89PVgPrXk52YZXT2WZHdDy7gVDLdAS0hso7r3pUSUxNrIa7MDk65XQsj1go56dox
	jvr2RzdgKGZqy8+yhhzzKM62GdVaHQLBPYZEn4Cx5D6TKvrSlsGzlXgLqaD60BHP/XE4V4+7OI6
	eb+cHgVkTL8dKUuMRMM77cyjL5C5MKloMWw2CGNUoocVmLkz2PDDNIqh40oQHI2JGFa7Ha94vLT
	l3yxv2vg6EGqDq3ajZwj6NruwwiqDipFAB/66aoA2n3Hw9rOxchOs1iHS5VaIhC0xNf0Yb2Pl+Y
	UZyaAPqnqoyXUxIeGdgDr5pdH6htl0oFadpLqw05W6GCjwr4=
X-Google-Smtp-Source: AGHT+IFchoMsCSw4vHBZCB+K0XRvcN2VQg82E1SZiu2jf3jmRQCM9hm78K3/WCSp3kdcC1xEiKz99A==
X-Received: by 2002:a5d:64e7:0:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3b5e45244d1mr1228845f8f.31.1752052313040;
        Wed, 09 Jul 2025 02:11:53 -0700 (PDT)
Message-ID: <feaf2adf-1cd9-4a1d-960f-ebf18de112d8@suse.com>
Date: Wed, 9 Jul 2025 11:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
 <662366f6-7442-4b36-81a6-90ddcad6e59d@suse.com>
 <CACHz=ZjgqBDKt=8xO1-BW-HzJ1W=_ogA4zdMaSK7P34YNT0HfQ@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjgqBDKt=8xO1-BW-HzJ1W=_ogA4zdMaSK7P34YNT0HfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2025 11:07, Frediano Ziglio wrote:
> On Tue, Jul 8, 2025 at 4:41 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.07.2025 15:56, Frediano Ziglio wrote:
>>> EFI code path split options from EFI LoadOptions fields in 2
>>> pieces, first EFI options, second Xen options.
>>> "get_argv" function is called first to get the number of arguments
>>> in the LoadOptions, second, after allocating enough space, to
>>> fill some "argc"/"argv" variable. However the first parsing could
>>> be different from second as second is able to detect "--" argument
>>> separator. So it was possible that "argc" was bigger that the "argv"
>>> array leading to potential buffer overflows, in particular
>>> a string like "-- a b c" would lead to buffer overflow in "argv"
>>> resulting in crashes.
>>> Using EFI shell is possible to pass any kind of string in
>>> LoadOptions.
>>>
>>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>>
>> Have you convinced yourself that your change isn't a workaround for a
>> bug elsewhere? You said you repro-ed with grub's chainloader, but that
>> doesn't imply things are being got correct there. I can certainly
>> accept that I may have screwed up back then. But I'd like to understand
>> what the mistake was, and so far I don't see any. As before, being
>> passed just "-- a b c" looks like a bug in the code generating the
>> command line.
>>
> 
> The only reason I put the "Fixes" comments it's that you always asked
> me to do so. From what you wrote it looks like you are taking it
> personally. I don't care much why there is the bug or when it was
> introduced, I found a crash in Xen and I want to fix it. Marek in
> another comment said Xen should not crash that way. IMO even if the
> bug turns out to be outside Xen and GRUB should always provide
> something as argv[0] Xen is failing validating the input received and
> good software should properly validate inputs.

Yes, such an issue wants fixing. But it's also relevant to understand
whether this is a workaround for something, or whether our code was
genuinely broken. In the latter case I'd further learn from that, whatever
it was that I didn't pay attention to back then. The EFI maintainers may
well view this differently, and it is them to eventually approve the patch
in whatever shape or form.

Jan

