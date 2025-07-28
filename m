Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425DFB1394A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061312.1426830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLV4-0008V3-3j; Mon, 28 Jul 2025 10:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061312.1426830; Mon, 28 Jul 2025 10:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLV4-0008St-0O; Mon, 28 Jul 2025 10:54:34 +0000
Received: by outflank-mailman (input) for mailman id 1061312;
 Mon, 28 Jul 2025 10:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugLV3-0008Sn-4H
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:54:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dd47fd5-6ba1-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:54:32 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so40036615e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:54:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e83598df8sm5533657a91.40.2025.07.28.03.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:54:30 -0700 (PDT)
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
X-Inumbo-ID: 3dd47fd5-6ba1-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753700071; x=1754304871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uW81d3ne4QMO1YqF9Z4Lvjyt1OIaRQBWQodzeQtb36M=;
        b=Dua217cXd18o5s95NuD9MZUNdqdAgCTWe+pXhnjzLajXB6sFyaWcHoA5xm4FFpZIBP
         Sa8uuk584BKgBkor/8GCWdOfpImfd/F+hSTpXdu2ZAwoHptWXg+Jll5OwTrZvJFw7lb7
         zXEtIcCOGcZEAyYRyqfg2HEoyVpe0zY4sEaGTNdaJ8QqBYCc/Qs22c3+UaF83EWLX+9c
         WvPJ47omNE514ucUM7jSjNdhT6dyBX1p3mIqtHregav6f7d5msXaOzoAddpRGBtVy87f
         rNM9/O+sB3DTBAGlWESwcUHmx+TYROaJMW+qDGqq1LU4zsvy3emBsgNeGwUs7wBGSiOL
         dpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753700071; x=1754304871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW81d3ne4QMO1YqF9Z4Lvjyt1OIaRQBWQodzeQtb36M=;
        b=Mio4iQkcGUxgLV1JJek5dqZyIOpsXFw9bdPMOw+f/GTywvb9KrV2EnsdSheSTOkxZu
         YB29LU0SciwYNnqcvMcaogc6d35b+ZZ5D6fgnQV1eVMJ8QujYt00iqJ9P8e2CjDl2StH
         I1c7Hyc5kpW32i5PqWqTDIg39NxT/JJBjA8EkoVhJvP3eVA9w+AvF3rZVKTYGYSSHu8f
         pzgwf5oKLkqwFwLQRrHUxzxmvbNLZP/u3kpQwt2++HgMQuxwZx0SGbvj6/yDPqxuK/aX
         GqRjd4GLkAUlzQGpmJ6TZoE4QMaplw0Jpgg4NgNF+EtjuBvSbfP480X6zWavWTnNn9E+
         CSMw==
X-Forwarded-Encrypted: i=1; AJvYcCVlFPl9mvLZ8RR0nTp88I6Q5kVDBhHmbIyLs/48rO+7lUilGhJPE6ZGF2eNkZGDMUM3SioNsQB4XLg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw61wt+el9d5uNw3hCBKGLky9NhdYdCZCWHFRgEQ/ORFMs24xm0
	qF053PMvcFoGw6yHf7rEFeWnemG1OWpt2Vp6hpaUqkCWuB2Vg7Np5nX2cpi5+24mcg==
X-Gm-Gg: ASbGncszC5lR8VM9pPpcZKT2OEbXDYtkRD7Mz5BSWhaxCFC6GNYdh/cI9WqUQ3opIi0
	tj7wl0XzLrf2qhkQbxoClxbWfWHdXiKZw8Z6mD+I5of7RExuUe9S5bY+94X4tb5jDa68KUMg7Ue
	3qwh/XRcp7RH5iZOK/IrfNI6g2+S6V9Y4IIRGXX/RyeCz/vVq0AmP/+eLeeNXfTlqaOSz67bX8+
	S0crEnBV3daGMv7e4k7juq70JH+AHsWOQ+1aR/DDCbN4sJ52Y5nVdDYgiwWNty35jnzkSTJ/Poz
	fLshrPocAcszAQGQztWWzSMn5M/NrrT7HDI6SBwwcJs3lb6IZxFlR39XvFzDZiwXsG0WnX46ydr
	UiumsS5JBG6vDw9kuyXoYswe7ziH35sFkYzeRVGnccYtydFvc7f5jPDfMn1bdz1gwkuLZjucPJ4
	U+XVqo/8xzu57vFZI7lQ==
X-Google-Smtp-Source: AGHT+IGMF5y+Em9sUiezZnfmuYDAwICcEGs/Cs6K0GzsFb9QxGmpbjr6z+trRs3WVtgk1agNHd7mMw==
X-Received: by 2002:a05:6000:2088:b0:3a5:2599:4178 with SMTP id ffacd0b85a97d-3b776735b1cmr6742278f8f.19.1753700071278;
        Mon, 28 Jul 2025 03:54:31 -0700 (PDT)
Message-ID: <927f46ef-c37a-4b8b-841e-8cb07ac79bf9@suse.com>
Date: Mon, 28 Jul 2025 12:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: don't crash on NULL command line
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250728102422.2245808-1-marmarek@invisiblethingslab.com>
 <b4e3c287-7847-4cdc-8fbb-bb788a6de8b5@citrix.com>
 <CACHz=Zh27UTGY0G=iVKK25qkr-zVcp5cxAbxoP575m=UfgqYtw@mail.gmail.com>
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
In-Reply-To: <CACHz=Zh27UTGY0G=iVKK25qkr-zVcp5cxAbxoP575m=UfgqYtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 12:50, Frediano Ziglio wrote:
> On Mon, Jul 28, 2025 at 11:46 AM Andrew Cooper
> <andrew.cooper3@citrix.com> wrote:
>>
>> On 28/07/2025 11:24 am, Marek Marczykowski-Górecki wrote:
>>> When running xl in a domU, it doesn't have access to the Xen command
>>> line. Before the non-truncating xc_xenver_cmdline(), it was always set
>>> with strdup, possibly of an empty string. Now it's NULL. Treat it the
>>> same as empty cmdline, as it was before. Autoballoon isn't relevant for
>>> xl devd in a domU anyway.
>>>
>>> Fixes: 75f91607621c ("tools: Introduce a non-truncating xc_xenver_cmdline()")
>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> ---
>>> So, apparently the "No API/ABI change" was a lie... it changed "empty
>>> string" to NULL in libxl_version_info->commandline. Quick search didn't
>>> spot any other (in-tree) place that could trip on NULL there. IMO NULL
>>> value in this case makes more sense. Buf maybe for the API stability
>>> reasons the old behavior should be restored?
>>
>> Hmm, I didn't intend to change things, but I also didn't anticipate
>> libxl__strdup()'s behaviour, or for something to depend on that.
>>
>> While this does turn out to be a marginal API change, I think your
>> solution is the right one.  I do not think it's reasonable for there to
>> be one magic pointer that has differing NULL-ness to the others, and
>> NULL for "no information" is the better interface.
>>
>> That said, is the other use fully safe?  I can't see anything that
>> requires sprintf()'s %s to detect a NULL pointer and not crash.
> 
> That's the standard behavior, usually "(null)" is printed.

Except that such behavior isn't mandated by the C99 spec, afaics. In
fact, strict interpretation of the language there ("the argument shall
be a pointer to the initial element of an array of character type" and
"the argument shall be a pointer to the initial element of an array of
wchar_t type") precludes passing in NULL.

Jan

