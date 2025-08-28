Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FC3B394A0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097644.1451899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWjT-0004LG-SP; Thu, 28 Aug 2025 07:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097644.1451899; Thu, 28 Aug 2025 07:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWjT-0004IR-PR; Thu, 28 Aug 2025 07:07:39 +0000
Received: by outflank-mailman (input) for mailman id 1097644;
 Thu, 28 Aug 2025 07:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urWjR-0004IJ-Ha
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:07:37 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac7bf9cb-83dd-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 09:07:35 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso1026786a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 00:07:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ceaf6ec7bsm58887a12.17.2025.08.28.00.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 00:07:34 -0700 (PDT)
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
X-Inumbo-ID: ac7bf9cb-83dd-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756364855; x=1756969655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m42sx7qU7u6WWcPc/suLWzmTZmdMTViFYKj3+YjUiPQ=;
        b=BcsGD7Usd5CspMUpSW5brrpheNfmEmrSb3T4wJGwXKYuphNLuAyHh5ZxJJ3JkDjtIV
         +q/HoWDanW87uHwM0Zoi0sg5aMjp8ErQibVTKX1xPMemU1Ru2ovP7NDmNkePq//Iq46k
         Pwfm8ZutfXpowS0s1d+WQgwNqhccK+KiQ2pguptGvrGIW+lCqn3T2j4dBdg4f8iJeUel
         FGL2bPAKopaAAJdecsAGgX5RYOUEggRXLz13J1ht00DrVyo4h/vgJ6GGh0JJgTJHuskv
         AnZV/aIFCxyiewgxQ0g1K7KMBrC1im4i8RxST6CxW29lSYV/9w9uYwvN3aXFSwVGsWm5
         DHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756364855; x=1756969655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m42sx7qU7u6WWcPc/suLWzmTZmdMTViFYKj3+YjUiPQ=;
        b=kif3GdDn9AsJiVKpfHN6KKaje39HITiaJ6YYpGgfcwa1j0avC5A7qWKJjxJWhu3Ur9
         89GpKwYQfXrVOlpXvQrEsadOU2d7HIZnf4NGtJXnIcDMmYCEUfyJNoDsx206LkGn9mVY
         9tGICVRqiFEvJ4IKKG+wcE1b14QZLGfFAKQIbKlUbDIIVPBrnOnaHiSvFeKYPdWYmmiM
         JweXM6mHPwPV/5dXomoWTBWpIaiMtHLnU1CPIaEdoneHln+rB3BqpppWMvJ3dmwSpSEb
         CX1XvaM1oh3P8c1luJnoGTQisM+1ax6BWXa1uk6RZHIKCE1M9pErB4c63PElGAGXZ28a
         pnIw==
X-Forwarded-Encrypted: i=1; AJvYcCXOTv1WRjx3gEjJvu7XEESUNExwVu5Zn14mp6g/HIdjQU7be4kjm/B4TiMv4cOG0k3CN7m6X2rm9pw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0vZ/u3FRoMRM6FiPVMptlViaYeO1xQ05u4wggO2MtrJF617bL
	6+/F+catq/DO085urliloP5Hna/EgAgP5wXMRtIm/WOkBWtiJQ92Qy+nSwdWDaHFtw==
X-Gm-Gg: ASbGncvx2qrEhT/POQvl+pISPIbfqO3UkzO0Fx6i+2QAIiB+2ILqv+pE4UOg3OdPSdy
	AMQ9aFS4yZDIeF4t0TVatFJkqx9+xBmNZ0YOmHgd8x0D4GjbubjO2vd+R3nClT02EL1JoUSOp7P
	CMvmJCugNKhsYfWVRrlYA+p36WMOzFnrulcLbQyODvGdynbf03RH9KIAkM+WYi0ShVcjz6YsPRt
	LXGBIL9SQSu9Ad3iv/IW2TDfUjFw2srpmeU61HnZrPhgWuSuMjEhQQNvODPK0eOU0YpyeFw2Alp
	PpkU9dje3/0VjcnOcwfEri+gL7Hr8LitdYu/SjYlnHtmlmRkLVYWSwui4qGHQ3uGb9pTRAxNLGU
	FWyp9MSOrtAXjp6LqbmUDCVSeNiRbkVK/mrwFcvnp22Q7mNxdHNb1txyQPs2ItnCbD2sEQ4Ecc6
	52uoa43qM=
X-Google-Smtp-Source: AGHT+IHzWo8V14hZvbSK7dIKnSoUmXiI4Nq+33hnLBA6Gmrhltk1UiaCloTfyw3E1buUdiAY8sEBOg==
X-Received: by 2002:a05:6402:26d0:b0:61c:5474:ffbf with SMTP id 4fb4d7f45d1cf-61c5474ffdamr12248127a12.33.1756364854855;
        Thu, 28 Aug 2025 00:07:34 -0700 (PDT)
Message-ID: <1901e764-9725-4e9e-895a-54c704473510@suse.com>
Date: Thu, 28 Aug 2025 09:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
 <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
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
In-Reply-To: <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2025 19:47, Andrew Cooper wrote:
> On 22/08/2025 2:47 pm, Teddy Astie wrote:
>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>
>> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>
>> $ cat /sys/hypervisor/uuid
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>> $ cat /sys/devices/virtual/dmi/id/product_serial
>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>
>> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
>> written in the table; which effectively fix this endianness mismatch with
>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> This effectively changes the UUID seen with UEFI guests as it was
>> actually inconsistent with SeaBIOS and SMBIOS expectations.
>> ---
> 
> I agree this is a real bug and needs fixing.

Hmm, I didn't realize this is a bug, and hence put the patch off as 4.22
material. If there is a bug being fixed: Teddy, please add a Fixes: tag.

Jan

