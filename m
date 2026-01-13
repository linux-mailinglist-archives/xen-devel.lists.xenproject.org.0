Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FFBD1831C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201441.1517082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfby9-00042M-Am; Tue, 13 Jan 2026 10:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201441.1517082; Tue, 13 Jan 2026 10:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfby9-00040C-7W; Tue, 13 Jan 2026 10:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1201441;
 Tue, 13 Jan 2026 10:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfby8-000406-0H
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:49:48 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ae0f8d-f06d-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 11:49:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so2767465e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 02:49:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f418538sm402117265e9.5.2026.01.13.02.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 02:49:42 -0800 (PST)
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
X-Inumbo-ID: 91ae0f8d-f06d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768301383; x=1768906183; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NPdN5854aDZtJwMwF5HuddLMf/w8UhIX2kIB6bT6G7I=;
        b=Orlto4wxhA0Z6t+2QmP/W7vTh+m0/xZH5FsJEAF8nVmWHURSLWDJfp62g08chLXlT2
         X3408MCN8fbI2XCGPs6viMApcPZ2PVesQp1XdmMDWruGPsnW/6bD+B7/n0vnDXkPZmj5
         t+2k45pqS1/J7OZ35rHK+mZBoQI7cmZCIIJDgQWaY+duLcsypQFZ5cz6f+/Zb3wDBYXG
         Fy/hel9twvpc/QEuHfDBrxYj0QIZnSWhagqWmL76lqT0OLG3NbChVGAcS16glMm/tOhJ
         NNwt51BY4WPgviv/2AHr1uSWRK8xyasgdS2NmwQ7F+2gXwpqdPaOo93tpnpQtYUAPW0/
         oKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301383; x=1768906183;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPdN5854aDZtJwMwF5HuddLMf/w8UhIX2kIB6bT6G7I=;
        b=RWctp6zdXljgEmYEd31CsJcPVa+HjKtlbQPthKFkT0yVH0AOXrgwoJ3JcYRfL/tqSp
         fxCwqkbENjw509z2A6Tm9fpk8jde1eTdWu6T8ISF7ZQOvLy9VPpb+B6bq/TsnfTMnYHi
         N2B137PtFvl4QV1TfBtegMZH3Lh3hTnERNs86wMMkOKjMHy83zgqGNkgGIJ8aDGt9tiX
         sycZn3F1ee3oVH7+WAvlEmNWVz3ZGJ2uFTa7vy4pyA9MyvGwr9mHINdVlhDFBsGwztbo
         C8nHSgfSAM0Y35GO2p5OzL6PQoJtm2s1jyEcFwHCNZtPB9RRLL2C+/UOaJhbc046QL09
         5qNw==
X-Forwarded-Encrypted: i=1; AJvYcCUYt6SGN2XRG73J5oY42+DduQD1y0NvWVrHPdn34VJcAn9XzmHH7m5ruMb1nHs3sNr2C6aBCBx2QHY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw6qBOYp6UKo02eAr9dA0Bm5Wgaa6Ni5UfcSD6veVA2qaVITul
	+RpbCGwfVsHT+QO+QYKIzum6EryOm53mZnSk/CbNJAkfZ0jXD8KEGu26ujddvmKpog==
X-Gm-Gg: AY/fxX72Urm176AYAf923MeS8L4sUwJZurqwKwmQHVdPgSDG1cpW5Q1r9zNg5jBAt40
	UBvfQzVF8z5tGW7vEVUmvqwaKRBk0jO3wgQ+NnJZrhwVcIyVjP+3WpbWtGoASekFAmZZS4Cd1hv
	8SO9WZDXDGtVTzZqfTzkF3AXLkutXAuaUbctPbjHPxrq2qt6WAOtx0/rUoUeIrtY6CGns4ShaRs
	Zvl8I3v+PJ2HG7rXTlrxpiZjijRx+l5gvi4KuwqekstEzhzj23KD12/Ru1LYFfAie7PAP4soxsI
	THrTTxk6RycpSHe7CkmQZ6oTZEFFcjR8/uPir+NndSWuAyOBenug46vqlLxHkG8uVfqZ9U/aNi8
	wMnL2APvhNpfjPSmdkH2f2b+9T0O66rIfgMlHNVjzBnw5wr1fn6nSevQF+oyo3ADezkyeNDCmrP
	NfuQ1nsTcw0yK1OcEY3n6lhw26uTCY9lPryueId4KXH7Jy0bFcpTEGFVJB5gShNR+kl6R+RZO29
	mk=
X-Google-Smtp-Source: AGHT+IGdQ7YrpAxDPiYcDUqNzeQ7+6//p77Xu52rres6PcH9CyHGUoNP6fQIjR3fWx21HzG9wWY/OA==
X-Received: by 2002:a05:600c:630f:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-47d84b3b4d7mr237090045e9.30.1768301383039;
        Tue, 13 Jan 2026 02:49:43 -0800 (PST)
Message-ID: <866ca08c-fb7c-4950-92b6-61368f567fe1@suse.com>
Date: Tue, 13 Jan 2026 11:49:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
 <5b00ab27-5ad8-46c0-92fa-a1fa4b65bd99@suse.com>
 <DFNEFH1XI008.1RFBCEC15UHXU@amd.com>
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
In-Reply-To: <DFNEFH1XI008.1RFBCEC15UHXU@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.01.2026 11:45, Alejandro Vallejo wrote:
> On Tue Jan 13, 2026 at 9:58 AM CET, Jan Beulich wrote:
>> On 12.01.2026 18:15, Andrew Cooper wrote:
>>> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -331,8 +331,20 @@ config REQUIRE_NX
>>>>  	  was unavailable. However, if enabled, Xen will no longer boot on
>>>>  	  any CPU which is lacking NX support.
>>>>  
>>>> -config UCODE_SCAN_DEFAULT
>>>> +config MICROCODE_LOADING
>>>> +	bool "Microcode loading"
>>>> +	default y
>>>> +	help
>>>> +	  Support updating the microcode revision of available CPUs with a newer
>>>> +	  vendor-provided microcode blob. Microcode updates address some classes of
>>>> +	  silicon defects. It's a very common delivery mechanism for fixes or
>>>> +	  workarounds for speculative execution vulnerabilities.
>>>> +
>>>> +	  If unsure, say Y.
>>>
>>> Please don't re-iterate the default.  It's a waste.
>>
>> Well, first of all we should be consistent: Either we always have such a brief
>> sentence in the help texts of boolean options, or we never have. Who knows -
>> cleaning this up thoughout the tree may even address some anomalies (where the
>> sentence and the default setting disagree).
> 
> Is that a request to add missing ones while fixing existing mismatches or remove
> them? Not as part of this series in any case, but do you have agreement on the
> course of action?

While I agree with Andrew that these statements are redundant, I wouldn't call
this "agreement" across all maintainers, at least not until a little more time
has passed.

Jan

