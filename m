Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D517487BDD7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693236.1081081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklHC-0004hD-Ay; Thu, 14 Mar 2024 13:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693236.1081081; Thu, 14 Mar 2024 13:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklHC-0004eL-7y; Thu, 14 Mar 2024 13:37:42 +0000
Received: by outflank-mailman (input) for mailman id 693236;
 Thu, 14 Mar 2024 13:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rklHA-0004eE-S7
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:37:40 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0640739a-e208-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 14:37:38 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso1275821a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:37:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z20-20020aa7c654000000b005686184eb77sm723829edr.78.2024.03.14.06.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:37:38 -0700 (PDT)
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
X-Inumbo-ID: 0640739a-e208-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710423458; x=1711028258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRPBSc9tVTtYpmQX2XYGrzNR5RaaO3zD+OQAAHDOvQw=;
        b=Jiz4EIFaUNgITvuupbi/4FO0p+HiBXnqWUSTZbJYCkRZRZQ1CSy4kbZBtw97nVX5Ou
         PgxEjfwdrx8Ksf0k3BaAaVljkMo5j1pdIwoKKqKBWErsUflQhOsJYg09/f3IoNgniuG/
         1GxHC8TeHX8IVMnp4g/IpE+7omPKOlx3CHxh/2jgBubo0UvelQ25/9XsHQtqatrWEXsh
         ClJzL4Qubi7hXwZYSOYy099nhZ02iu3U03eBz3XMQJMXAXJJuv/zmBd1fmzlJS38SmIG
         vQl37z9PAYLbPY5nFhy513lP8YBN10syLhkqYgayrxAeIezf6nxIfTtBviWOgMYJuN23
         BhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423458; x=1711028258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRPBSc9tVTtYpmQX2XYGrzNR5RaaO3zD+OQAAHDOvQw=;
        b=hBUSvulZ5RdEBXAXWuxJCSH8M0rymnU2+FgUNRPS97b7Ujoozn2VAJpYIpypld5e67
         X2HSqys0eq75Fjp/QPgMO56NYo+wWSzw8YwLTH8qZW8Saqpj3KH3IMKe2feLcHlfbjxE
         qSyU6JnWcdOV3/xcN6SYKf6n1ze+NuFDwGlH5S/ZMBEPLMy+LyTkSici8EMlWDwGC6kP
         KMkobFRoMwGPv80OiIur/CqoEN27yrliFx7+Q1PkjVNzrdtE9+TCut0Kz907sz0NsBX5
         rUnvDb3AgDQ/HzYpaJmv+l90DDoKNKDFn+29O6Imny6q4PpagPMWvbugniSH9XC8/WKP
         uhTw==
X-Gm-Message-State: AOJu0YxKTzrRCNzXgt9R6nkBxMNn+pxkWDVwLqprLhADhInTzPCR8nEM
	R5PXECj352leNBqetmHhYwBCRtEBsuKEaYk8Z/PeQsYvZB14Yx8gqlkFH5lKwQ==
X-Google-Smtp-Source: AGHT+IHj9RaEr/1IeBfRbWxPvhwnXm2Z4pLX6zJ4vTzphYNCb6jWQln9LpIlJvEyMmHgrJftx+i91g==
X-Received: by 2002:a05:6402:4586:b0:568:2505:93ad with SMTP id ig6-20020a056402458600b00568250593admr1218061edb.5.1710423458382;
        Thu, 14 Mar 2024 06:37:38 -0700 (PDT)
Message-ID: <d2be3727-3a94-408f-a751-e91792c9d15c@suse.com>
Date: Thu, 14 Mar 2024 14:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 grub-devel@gnu.org
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com>
 <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
 <CAG7k0Ep6fDfjKXj-iwuGh=pF_BS-1EaT9kRm1xJTZ=bmt=3+rA@mail.gmail.com>
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
In-Reply-To: <CAG7k0Ep6fDfjKXj-iwuGh=pF_BS-1EaT9kRm1xJTZ=bmt=3+rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2024 10:30, Ross Lagerwall wrote:
> On Thu, Mar 14, 2024 at 7:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 13.03.2024 16:07, Ross Lagerwall wrote:
>>> In addition to the existing address and ELF load types, specify a new
>>> optional PE binary load type. This new type is a useful addition since
>>> PE binaries can be signed and verified (i.e. used with Secure Boot).
>>
>> And the consideration to have ELF signable (by whatever extension to
>> the ELF spec) went nowhere?
>>
> 
> I'm not sure if you're referring to some ongoing work to create signable
> ELFs that I'm not aware of.

Something must have been invented already to make Linux modules signable.

> I didn't choose that route because:
> 
> * Signed PE binaries are the current standard for Secure Boot.
> 
> * Having signed ELF binaries would mean that code to handle them needs
> to be added to Shim which contravenes its goals of being small and
> simple to verify.

Both true, but neither goes entirely without saying, I suppose.

> * I could be wrong on this but to my knowledge, the ELF format is not
> being actively updated nor is the standard owned/maintained by a
> specific group which makes updating it difficult.

And PE/COFF isn't under control of a public entity / group afaik, which
may be viewed as no better, if not worse.

> * Tools would need to be updated/developed to add support for signing
> ELF binaries and inspecting the signatures.

As above, yes indeed.

Jan

