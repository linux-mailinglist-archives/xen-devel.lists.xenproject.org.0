Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA4A26DF4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 10:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881204.1291328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfExm-000614-7Y; Tue, 04 Feb 2025 09:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881204.1291328; Tue, 04 Feb 2025 09:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfExm-0005zC-4x; Tue, 04 Feb 2025 09:11:22 +0000
Received: by outflank-mailman (input) for mailman id 881204;
 Tue, 04 Feb 2025 09:11:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfExk-0005z5-OG
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 09:11:20 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe4d57ec-e2d7-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 10:11:18 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so8248713a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 01:11:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47f1e23sm880322966b.82.2025.02.04.01.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 01:11:17 -0800 (PST)
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
X-Inumbo-ID: fe4d57ec-e2d7-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738660278; x=1739265078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wHv6bVR1cHAduHzOBPtdl12AxupWPf09/YoJP+NcNq4=;
        b=KYDjvASUg2HmRbGcQay6CBVNn1hVG9nhNzHDcuEHhFiyaA6za8upedJsxwASpuvSla
         9fAN3gkuMCekK7ql+GQc8pCY1kFE5E0UNDJFQoAbSuyJBWWOo69oZ5zo9OEfIVBHPDiF
         5JXQb/WoU0Vko5PtuE7eR+2s0HWq/KHD5D/CVOZFm/hf4pRDSkCGdRq0zrLp+ko8IkQb
         MsBL4l7iQpFotc93qMR7APZsWE+kikXwvMuOVrkCLMfa8hVw5WEqv1j5CzflfLgOZ45H
         IcbVyRsgsDWLrMjKY1Xq2ma3yssgmkIffbnDLbQF302iBvCYUPRI0+ECG2XL82naUng9
         Mctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660278; x=1739265078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHv6bVR1cHAduHzOBPtdl12AxupWPf09/YoJP+NcNq4=;
        b=coB2b9ds2hR8Z9jNtyQA7EShVrU/EM3tLIBE3tLFXtfROMlaz5EzNw/8jYxj6MziEW
         QTT3OZOC949CDXr8htvJlLXiRU5C7bSU83G2Pkk3t6KdDWVpfdLP2ZOCULk78qhOFwF6
         VMMuxeZZdbgSUDf+9lpXxaiVUp/tCypAlzO0ExuCdKkz3eYDZwMJwC633MHoTGpZ+a1m
         53BSSnBxrLcEAeBzStDK/poc85SvOLf2vTRWzfduHiY5auF+EfXIM91G1oMrdUEAUtrT
         6pvpI63xU3aLIsHIYy4/x8XQWXE3InorBKs6lhWQ/ipBJ7Z0mRMQbjdWXk3OXzMZxfxC
         wcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdZLF2gndo2R3+j+u60z6DA0R4LAjyuUfj6vH2Q/FdFcRwkWoM+NignnhllGVuq3Ky2hM33OymOkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLZVSsglV7Iv1I40cGsZKXsbvbRv1JFG5TiOvRpRIomIJlmAWE
	SPt7Gp+b7zUWjTT4mWAxO0rSf4GoOF5xfyJg51IpRUauvKe2uDsvwYaAkOT2UA==
X-Gm-Gg: ASbGncsmeR8HI/f9GAH9wl6SXbZd+WuFXQ2T6vCGurPZE891yVgyq0KCdXW6Nbk783M
	bJNSxp5OgoFxvdaxHqdgOQ1eyOY2BDfUSzVQvVEoiBa1DJkY0IsTX+RdFHKmxW+YpolB49Gph6r
	7ZVqCyRS32CX5Bxh6x2bfHsBgdylXKaUj5n10GxhfHAaodmelpu9jaGwhiFZSFzlw6klkDtXkHV
	54fYIWUSEkK+r3cNkbwy1yAxbZRQfnLuZKeyAPfySs9jFIEgV7OiJQfZybokqNn4qC+epqnhOEw
	om6OLJjs0PkaeiCHIFgXb1NK8uYTAZDvfZZHZqNbOp4E5aEAyxUoMZZVAQ9wyNStOrj3+xi23RA
	t
X-Google-Smtp-Source: AGHT+IEQcC3xIpVeK/iGl3mVUJICJjqITTTH6TRzP2xTaraDTtlIC4aKUTm3bZ1eESrhbLQcfs7eWQ==
X-Received: by 2002:a17:907:940f:b0:ab7:b7d:62b with SMTP id a640c23a62f3a-ab70b7d06b9mr1364304766b.6.1738660277808;
        Tue, 04 Feb 2025 01:11:17 -0800 (PST)
Message-ID: <173d18bf-f68c-4bd5-b822-abb1c1f0c51b@suse.com>
Date: Tue, 4 Feb 2025 10:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] meson: Deprecate 32-bit host support
To: Juergen Gross <jgross@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 mark.cave-ayland@ilande.co.uk, berrange@redhat.com, philmd@linaro.org,
 thuth@redhat.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250203031821.741477-1-richard.henderson@linaro.org>
 <467a5a58-952e-4930-8e91-744eda6d87d9@redhat.com>
 <e40c39d4-425c-4566-af41-373941894045@linaro.org>
 <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
 <e7611136-1e90-4f3a-8f37-68244c22c4cc@suse.com>
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
In-Reply-To: <e7611136-1e90-4f3a-8f37-68244c22c4cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.02.2025 09:19, Juergen Gross wrote:
> On 03.02.25 23:43, Stefano Stabellini wrote:
>> +Xen maintainers
>>
>>
>> On Mon, 3 Feb 2025, Richard Henderson wrote:
>>> On 2/3/25 04:54, Paolo Bonzini wrote:
>>>> On 2/3/25 04:18, Richard Henderson wrote:
>>>>> v1: 20250128004254.33442-1-richard.henderson@linaro.org
>>>>>
>>>>> For v2, immediately disable 64-on-32 TCG.
>>>>>
>>>>> I *suspect* that we should disable 64-on-32 for *all* accelerators.
>>>>> The idea that an i686 binary on an x86_64 host may be used to spawn
>>>>> an x86_64 guest via kvm is silly and a bit more than niche.
>>>>
>>>> At least Xen used to be commonly used with 32-bit dom0, because it saved
>>>> memory and dom0 would map in guest buffers as needed.  I'm not sure how
>>>> common that is these days, perhaps Stefano knows.
>>>
>>> As a data-point, debian does not ship libxen-dev for i686.
>>> We cannot build-test this configuration at all.
>>>
>>> I can build-test Xen for armhf, and I guess it would use i386-softmmu; it's
>>> unclear whether x86_64-softmmu and aarch64-softmmu are relevant or useful for
>>> an armhf host, or as an armhf binary running on an aarch64 host.
>>
>>
>> On the Xen side, there are two different use cases: x86 32-bit and ARM
>> 32-bit.
>>
>> For x86 32-bit, while it was a very important use case in the past, I
>> believe it is far less so now. I will let the x86 maintainers comment on
>> how important it is today.
> 
> As dom0 on x86 is a PV guest per default and Linux doesn't support running as a
> 32-bit PV guest since a few years now, I guess there is no need to support qemu
> as 32-bit on x86 for Xen.

Yet then, just to mention it, you can run a 64-bit PV Dom0 kernel underneath
an otherwise 32-bit distro. I've been doing this successfully for very many
years (with a very small kernel adjustment, just to work around an apparent
shortcoming in system init scripts).

Jan

