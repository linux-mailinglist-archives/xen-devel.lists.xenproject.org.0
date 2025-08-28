Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60EB3948C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 09:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097635.1451890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWi5-0003oR-Iz; Thu, 28 Aug 2025 07:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097635.1451890; Thu, 28 Aug 2025 07:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWi5-0003m1-Fp; Thu, 28 Aug 2025 07:06:13 +0000
Received: by outflank-mailman (input) for mailman id 1097635;
 Thu, 28 Aug 2025 07:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urWi4-0003lv-7F
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 07:06:12 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75702524-83dd-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 09:06:03 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so97333066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 00:06:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe91744bcesm682110466b.81.2025.08.28.00.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 00:06:02 -0700 (PDT)
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
X-Inumbo-ID: 75702524-83dd-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756364762; x=1756969562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KyATRfxTFTaic50PhjktpwSqtLAZL7ebszpPG7VAP5o=;
        b=QEBj6bJFX4ZNMarDjsY0Scl5KYfjODLRwHSl6TI0ENgSFfUzAiMUq/eyokAjDV9/so
         9CjlxGmVuIujynOp1hoGZ1yJdsZOl147y3SK+9HUpZZLhI2xujexWb6jCEMEn4HYVUxb
         arLtafU53lLVhPi87vV97cvMUz5s8xNg5vWRQxgyxdA/b15RyjSD76XJGzePNtKuDV9k
         cfLa65asDIzC+n4J/wutMvaM4+/1834brJpvIfpTWlAHvg/O9r/llO5h74zMiSbS4HSx
         Vux551xSISBPnwnDj+dJxZxMY6Xuot3YEiFr1Cn89EQ+sP6quXjPgDXmq4Sr+zo3q+tO
         sW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756364762; x=1756969562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyATRfxTFTaic50PhjktpwSqtLAZL7ebszpPG7VAP5o=;
        b=QiTk+uPmsphX19t2XwN67oDm2jzy9azyiDkc3rKXeq4naFEfqK/GB8hDL0+Emt9JrG
         Juur4gTGNbNZwqIx8oKCMkTAoCVAwJRf6l/RWW5FmiejLgGRwVkQE/FyKQSEJNUetYYk
         pjmASiTm0YeQ4tcTOrM9Ks+nZdOQjcCnsHymon5gyaRzjl5YBxHmyonXz5fKT71q7XOU
         41XjD5kyX7H56ei/GXLv+zidmHfCjCmZwlnw+Mkyp3c+k5OPG6L0PAXLSNwl30GbV5sq
         uZXomJXpNXpuLNQdMsgU3Fgt4O19j2PcRDxLE+yf+u138c8huguVgBaRELovIpEckamt
         Ohnw==
X-Forwarded-Encrypted: i=1; AJvYcCUlqR8KeNsbAo1JylfJ4DNwC7hUw5Mreqh6SVSE6xFHnK0MgvaXd6j16NdHhOAUg3VNBJ2KDEj6xgk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ4E3+krQyLHz1Sn7A16IYBr+my3UlYKPbF5Lr5wPH1XgcVPG3
	Igo71MLAyhyZT3lRYMtZWepNlR9pYBhA9UeKV2HLMpXP9cmseoCUL1nmzuvXiuMYoQ==
X-Gm-Gg: ASbGnctijojMERmG8/IYZhEutYxtOk4kMWnrEZzR5NdkLNbHRHdR24v71jCh9HVQYLW
	jXQKQ7JWi7LuSAD5t5w5FrSiWSjc9kQOhH2byUDtIsgi1kfma9mBk9WBPA1t4P/Cvv5ea42edxK
	uq2gezgJL+1Jr3zyIH0JdRM250dWKKZ3HvH7OaRXU9TMqCuECxSy2FbuAMJ9QrfBdcX76Lbwu6R
	VqlHo9s2G4UyrQvCrNKhYr9Sys4kp5k4JWkk7MtHYKRH12kPXn2Om2uFHfo/wnGmv9rMFyAI4XI
	n4iGasAqvIpAxpiDfYFT54Rj2RtpmyONOpQfQvKD7wB1J2vIvuakwC4982x5kHaqDGyS9hQW7HC
	LAthB+xY1Zq0DvdUvag91l/3PnlVeKXv6O04g5bwjdoMIdFMITHTObDRom05viwGptR1QghiDFj
	azkm/BmOs=
X-Google-Smtp-Source: AGHT+IG86qDfFCS95HLsvV9+dBDsWykmZ7eT0R/UpJw1eK3sEO3lsRUMNj4dGuaFRw4KBvji0IrJ4g==
X-Received: by 2002:a17:907:6eab:b0:afe:ef8a:ac69 with SMTP id a640c23a62f3a-afeef8b9573mr48925466b.43.1756364762378;
        Thu, 28 Aug 2025 00:06:02 -0700 (PDT)
Message-ID: <0e47cfed-75e6-4cd3-8ee2-ed8ea000a376@suse.com>
Date: Thu, 28 Aug 2025 09:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
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
In-Reply-To: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 15:47, Teddy Astie wrote:
> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
> 
> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
> you have a endian mismatch causing the UUIDs to mismatch in the guest.
> 
> $ cat /sys/hypervisor/uuid
> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
> $ cat /sys/devices/virtual/dmi/id/product_uuid
> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
> $ cat /sys/devices/virtual/dmi/id/product_serial
> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
> 
> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
> written in the table; which effectively fix this endianness mismatch with
> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.

To update to 2.6, fields new in 2.6 (compared to 2.4) need adding to the
various structures. First example I ran into is type 4, gaining 5 new
fields in 2.5.

Jan

