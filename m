Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBEBACAB1E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002942.1382371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16F-0008Ei-RB; Mon, 02 Jun 2025 09:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002942.1382371; Mon, 02 Jun 2025 09:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16F-0008CJ-Mx; Mon, 02 Jun 2025 09:04:55 +0000
Received: by outflank-mailman (input) for mailman id 1002942;
 Mon, 02 Jun 2025 09:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM16F-00081k-3x
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:04:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a56f24f8-3f90-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:04:53 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a367ec7840so2772397f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8b26sm66014585ad.9.2025.06.02.02.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:04:52 -0700 (PDT)
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
X-Inumbo-ID: a56f24f8-3f90-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748855093; x=1749459893; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ngZ6Vuh7hQeKo6LT9x+wiicwheB6dNz7u4CSeZREy7I=;
        b=X92C0ClR1hPXNoLhvTspdhilb+TWmjBSQ8R7x7TUH1QBD2b4mhvi0lhaPwiQD3mhNs
         veEyVIJz/XPeQD5krwPAMKcWs/d/0YLa2byuUBdHH1N5OlU/Qk+WDH7Up29W34owSQIB
         Ca5jz5dr4u1MbFRHw8K3tYm2wKVN6pP3w66lZCY3NGzijNgDmwjqJbN2Txt7BWDwLSgZ
         6Ct1CQaALQXdQNrP2Y8Be3tV3ffAkW1VZI3b95DgS2PR7yQP/K5gZLddheK9KuRtyaVN
         uC60pd2sHik50BG5RFXARmp1ODio4W287EnkNxxECmq27WAZI98ZpISSLZyqYCR2vK8S
         rCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855093; x=1749459893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngZ6Vuh7hQeKo6LT9x+wiicwheB6dNz7u4CSeZREy7I=;
        b=ArPkS/CzY/JDNcFOR/iolVHu68uLlew0P6TMOUcUxSOuxWZH+M6jmea46eeZU+U0Ud
         8hXz4QSmVenb8/+fXHT29HJ4DmGsPuk41w06sKBDMG2nfWGh6KfKlA97FJSqU23omsbJ
         sUfOfG6ppP/qpZNEaeCtfTQSdU9ePdtUC/SzngZ3sCzq5oCf94Avxz3fDgFMlQLjJ7xQ
         VUVP/VZ9Kfx/pwHeFrn1LOOtPDrjDOd28WxFTPONUzddvjvCrGN38I57FLUdyjCDhSkg
         MMgqageascFFcxzw+werl1vduJ8ybvAWfHFpNOC5N2APF4eUQLuomov6gP8z2vY6N5u3
         k1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWeMnxXJck0cC+Z8r2HBdkkc9GtdKnNAeseaEx/yT+ciKG2kiyuxWHZ4LV9tdnOoaAfYGEiunn3HU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPJSBa7HCLbxyP0pAm+yUskDXfMHhE5nmYrn3DsMwNY0/HNZTv
	FR1UyqVwqejpj09VGZGmu6g+P10LPsR87hM9KRLkRzpg6mCs0BgnnmcjDr0q04gJzw==
X-Gm-Gg: ASbGnctFlA1Uw0qDFkKMd5fIUsJ+dakDFgQpmTEQ2l5n83SL/EpDT7Z7AgNlcxN2Atk
	vpCjezR9adVLnVmG66vdh3BYQrjK3P3ARlCHuMp991/mqCZJDSUlMK+I2GdRe64YL7jl+9wHfOb
	zWEKOy+M/5yygbhjlREPIU2gzuTKeiGHF+q8DGrJ1gDGRMNG8Oud+F9/WsuHqU28uMuit9riOuh
	PFjNYW2ZToiIrHksEmQ1nzRMgJohXdrO3RaI1gljvxZE+VuSeP4fZeZR1H30IPonbuEZ3ALojwe
	MMst6YA5+WWOWBN04ZZSH3A+v6GGu/JOl+0+YI0AYiztoVgiSRiokmAlLe2sM3ApAqSXG6c7Pyp
	MgpGmTRV2pOMMliHyIoyBlE5nLwDuq9tNzPuy66oUw6DHPGE=
X-Google-Smtp-Source: AGHT+IFx3pepFQ+9Hv0YIA9CI0Hq8K45c/r5jJbK5V+IFastwKJcN18fCSYaUS2VkFAFiXMlAxFAjA==
X-Received: by 2002:a05:6000:2302:b0:3a3:6991:dcbb with SMTP id ffacd0b85a97d-3a4f89a7f8dmr7847316f8f.12.1748855092705;
        Mon, 02 Jun 2025 02:04:52 -0700 (PDT)
Message-ID: <2c4f4c2a-b1d7-4cbb-834e-cee0fd3d2433@suse.com>
Date: Mon, 2 Jun 2025 11:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Remove is_periodic_irq() prototype
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 "consulting@bugseng.com" <consulting@bugseng.com>
References: <20250527223753.47055-1-jason.andryuk@amd.com>
 <1c850e02-0d87-4fd1-8504-0aee53949136@citrix.com>
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
In-Reply-To: <1c850e02-0d87-4fd1-8504-0aee53949136@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.05.2025 00:39, Andrew Cooper wrote:
> On 27/05/2025 11:37 pm, Jason Andryuk wrote:
>> is_periodic_irq() was removed in the Fixes commit, but the prototype
>> remained.  Drop it now.
>>
>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer...")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
>> ---
>> The full Fixes line is:
>> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer (PIT/RTC/HPET) programmed as periodic timer and adds them to abstract layer, which keeps track of pending_intr_nr to avoid time interrupt lost and sync'ed timer with TSC.")
> 
> Yeah, the older commit messages weren't as well structured as we insist
> on them being these days.
> 
> How did you find this?  inspection, or a tool?

What I'm curious about: Why didn't Eclair spot this?

Jan

