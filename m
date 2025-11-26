Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020F4C89372
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 11:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172494.1497558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCZp-0002vn-Fm; Wed, 26 Nov 2025 10:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172494.1497558; Wed, 26 Nov 2025 10:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCZp-0002tG-CH; Wed, 26 Nov 2025 10:16:45 +0000
Received: by outflank-mailman (input) for mailman id 1172494;
 Wed, 26 Nov 2025 10:16:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOCZn-0002tA-Nl
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 10:16:43 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 007e6e02-cab1-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 11:16:41 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso43047285e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 02:16:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790ade13ddsm35006055e9.8.2025.11.26.02.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 02:16:40 -0800 (PST)
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
X-Inumbo-ID: 007e6e02-cab1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764152201; x=1764757001; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uQEFzQAap3W09QdLXG3RE8p3eqZ+zm+kVfIPC+ruvFI=;
        b=A/56HtyQyMXzczKXzMWZrytsBteMD3jmt9RYyNLssMrC5s88CC9uhV32wD1h7yOPzp
         9SzUiVYDY+iV2kxpAlsKi8fDCj44zqpfc0zwdHoZ2bf1fvlzdn94rx0IZ3zHsFYXRGDe
         Xk1By9G1IgTai6l8JHVTJxiffr15JYiqWa9V0YgDt8kpHDPpCtCnAYD2pao7N7XhCRG8
         G0CW/C5Tr5h+Zd8A6Jgea6R/bBXB6SUEtHqUpJkX02ND1Mv8ozTIJN8UIhi6Onz7YVIx
         y32JTJhnGp+3GrgVp7p1zK0SdJ2nn2p3I6lGu1QOLDIkY4kaKhLGgSUzlOMroXgyanJn
         V0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764152201; x=1764757001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQEFzQAap3W09QdLXG3RE8p3eqZ+zm+kVfIPC+ruvFI=;
        b=eXYXy+9+8kMzl6nSLwPqlNG4ZHIJvH72ZopOd3+HQDqcaJRXTWeQZFZpakf98c0+96
         HMOoIhlHWW2OXq2UeRHJM3JwwbObgVXgORlw2pQiRCcv28RsGbnCQxOpOJfCRKaAe098
         iBM98J21gpWqC2hvyCEzUtfNWHSpylQzQBnVgCEwvAPpc18IYQdNunNDHyQFhikzZB0M
         xuwcSNZM7zuowClxfGKKHhUYxej0CS6oHvkbiu56iFC0ewyDHExpT/yvX7KLbDZOFMRV
         rJr24+IDLPxpDGIgHQJzxGQShULOkvNzbFGThuAB2lGbF2sGbv6POgQBKj+kiMzXPsim
         vmwg==
X-Forwarded-Encrypted: i=1; AJvYcCVeprEmz7elZxj6G9diFYjGyVC59PMWjgQN1Po3uVdgt4pUYUlpP0CDiN6i5TpM/hw0pF0xBcXbGQw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG27nhbEilT6oyz+0LaV1c7GUGTxlNQqVBRQW7DKTtSbsSKlG5
	4GfLpaCVLx+7U+e2eqRgxJpAbAm6f2m7Sj0RQ4X+ZUUn6I3kpHBrUnA1o5b8PZn0rQ==
X-Gm-Gg: ASbGnctJBI2ZAPM4rr13qvCbF49c4Zv8niFYxMqst3RD2QslWoheSJjw+h3eWvPVrYs
	xrpiMjTtNNF0TlNIU15Ib+QPuEPUZ0j0BONJJGPYUplCkKqNE8aZ/uPOix3J9yAV62IawTEx8XS
	8D2ULmffR7XroiPnLPxk5bIefR/JNYwi2nspi9ulyWTm30O6cjComS2lxMrBrf/w2vEgAwEpPne
	in5IBgM0TSZq9vRiPnKJOstgjxykf8CoLlG0SX1GRZKtr+cPA1C4REu3fPZQyG0D0d1DWNAlWLK
	JMKTKoeKA9oS+4nr60PHNVj2FkLEHlq+2IurtQmLnv31tyFv/FqFwK28eggG+zLuj2LYn+AaTfJ
	fkzK4s7xEi2GdD8yF6kAzApgS3axcDKYmNwRbeIuW+58R5VqCTLBQVepXDG3QEVotlg9XiZ+akJ
	HsC4Q6H4skg6yJYjhPU5LEGBRJAD6U90VtpfyqgtJyZcj3A9vnirc1hS1SaHLrT/+7G2VdTXrvw
	Z0=
X-Google-Smtp-Source: AGHT+IGGpiRRMmduZJ9y7Q8us1e+qVpqvb+rdxNtu+ppx748C/1XUhFc+0C1cQ0hOfo4l4sOgGGjDQ==
X-Received: by 2002:a05:600c:6c48:b0:477:7f4a:44ba with SMTP id 5b1f17b1804b1-477c0162ec8mr126129885e9.4.1764152201066;
        Wed, 26 Nov 2025 02:16:41 -0800 (PST)
Message-ID: <065310e6-a009-4e64-b599-1f0799ac1377@suse.com>
Date: Wed, 26 Nov 2025 11:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: move save/restore under HVM_SAVE_RESTORE
 config
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251125230040.3070954-1-grygorii_strashko@epam.com>
 <f349a91b-89bc-4489-aff2-2590b521621d@suse.com>
 <dbee8b1c-5914-4b0e-886e-b7dbf579b1be@epam.com>
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
In-Reply-To: <dbee8b1c-5914-4b0e-886e-b7dbf579b1be@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 11:13, Grygorii Strashko wrote:
> On 26.11.25 08:59, Jan Beulich wrote:
>> On 26.11.2025 00:00, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/Kconfig
>>> +++ b/xen/arch/x86/hvm/Kconfig
>>> @@ -93,4 +93,10 @@ config MEM_SHARING
>>>   	depends on INTEL_VMX
>>>   	depends on MGMT_HYPERCALLS
>>>   
>>> +config HVM_SAVE_RESTORE
>>> +	depends on MGMT_HYPERCALLS
>>> +	def_bool y
>>> +	help
>>> +	  Enables HVM save/load functionality.
>>> +
>>>   endif
>>
>> This wants to move up some imo; MEM_SHARING is clearing the more niche feature.
> 
> Could you clarify preferred place - before which Kconfig option in hvm/Kconfig?

There's no "ideal" place imo, as the ordering is somewhat clumsy anyway. Before
HVM_FEP or after VIRIDIAN, I would say (with a slight preference to the former).

Jan

