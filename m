Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0DCF452E
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 16:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195492.1513430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmFg-0000Vx-Vy; Mon, 05 Jan 2026 15:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195492.1513430; Mon, 05 Jan 2026 15:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcmFg-0000TP-SR; Mon, 05 Jan 2026 15:12:12 +0000
Received: by outflank-mailman (input) for mailman id 1195492;
 Mon, 05 Jan 2026 15:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcmFf-0000TJ-BQ
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 15:12:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6e80784-ea48-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 16:12:08 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso326035e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 07:12:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d143f6asm167040315e9.6.2026.01.05.07.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:12:07 -0800 (PST)
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
X-Inumbo-ID: e6e80784-ea48-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767625927; x=1768230727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8hrn6pHQjABHadqBMB5YW34vBH/fMQ5tWPi/R90yKAw=;
        b=as8/8La1UcUEfTInk44YPZ4Vgt9Vget3ugTsQVvkA6bvpzMdQGv1UjFhf6BadstYry
         IZPZ5d55YAk+9UBWBNrVHWN7J9L9pH5euykk6zGcR1EJ3z+mn/2xqz9m1TXQy4NNAjpK
         rdrvQshtLGzhXO+bdv02yfhtfZBJZgIoyjOlS/HDwgY6CHwkH/Jn4IWlt+5c74+zqDG8
         WXB1kKYNusgsxMuJS/5oLKPyUEoE5myZUdVd7cSuQITukwAhKIoJlxN93zNDnSfsTUzG
         GGePALWWQUN20sMK2KY0E3SPYh85rIqB/yYLTZtCakxrbDBJ7qQ8S5sKPG8PCoXuTpRM
         YQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625927; x=1768230727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hrn6pHQjABHadqBMB5YW34vBH/fMQ5tWPi/R90yKAw=;
        b=Lu8b7HkCU4whTWCQc3J6PM6jrBUAsZ0VouomtLL1bQ2XVPDn9c0O8r/5FkHIkZEfSW
         Bet3/2vthAL1rRxmZMKb8DBktGShzoacXYsuP3NI/h/4z8w/KHQdWqK7BHGa6KQzmyMv
         3Cn4CCyggQAew5AXUK/9XmoxHGIxbMEuRX8BNFzYcJFf6NUFk/dD84a7QWFr2I5Jdb1R
         DDs4D/hQPhnTphQekNYwpc49iNJCuJc8xjvGgRadKIcPhg/UKkJSilkaYzK+x1KIHa89
         yPmIaywUTTuAh1Q9gbpjMg/ZUbbTDj0ScOYQwjz+3I2LiZHYfwRzK2zxgT8W7y9QT7tA
         aH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGC1gKr1BvJx8pYXUVyVz7ksqYuq+iTRpZYliYC3s3mXH2igpT0xJBQwDzSHWN+TOyD7J2evnQU70=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNRUAu0sQbwQOIpciqjqL2/L9UiwpTUj0P3tL2/I1FyOh012N5
	lGjqCOMhVtjkCJe2Q4PnOp/NW6bRVtGmgz9gTR4WlQX9i4Ys5HhPyvesqZ7E6qLqQA==
X-Gm-Gg: AY/fxX6lTXRyA1WgTEGnzmqZARbk1jdZPFsbvDnSKHRYLkx3u1LXH4B8I33czF+kdTU
	u8m2gWI1qTx+JV4I6i8kb1dC/cedN4pmo+L60Y5tq6XJDdy8K20DDZdeLKKQQ7zyIa4lTXPoBBZ
	NeCA0TTNvqFgamkD0nqu5ltZq2HQqfZULvHJzA0fTOTyFS+QirOmhq4x3PO9QEsC9DI6sWf9QAJ
	jpZos2RxXf1SwNglKHQh9w4mnyBBHDDcHxRzIVu5m9D6EdW9lhKsaNfhOT80X45K7qlxs0uQoe5
	N0Wu2fCi+PaYqNZ4UtDX4iHFYrYk6qxHlOE0pAN7JvGRYHvczKIqLywJ1inIMBOMLbVWTpEK4f0
	CQvkmaPDX7cAoWvM/OgCxED69UT2u2UtcOe/Fqk7Vjkcl/8ufhY8GTYAAoPvHhwRVTqF7za/BKu
	BD9kLGF0YwAdp2OynPWl8oB4zs0yYN37fWCEWyw1T6AIvLLd3O//nbx3anUz+ATpC8Kk2P5Vk7c
	N31bctbnT6yWw==
X-Google-Smtp-Source: AGHT+IHZyN7U5aT0UYgATnhqh9Xqt1sc9MPAssVhBJEJwbNwRIya3CzWusYqM02OySmkP049cdz63g==
X-Received: by 2002:a05:600c:8208:b0:47b:d949:9ba9 with SMTP id 5b1f17b1804b1-47d19566f0dmr629104285e9.13.1767625927597;
        Mon, 05 Jan 2026 07:12:07 -0800 (PST)
Message-ID: <12a0ebd2-26b6-4743-a1cd-8948ad85e1f0@suse.com>
Date: Mon, 5 Jan 2026 16:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/xstate: Deindent the logic in xrstor()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135427.188440-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:54, Andrew Cooper wrote:
> ... to improve the legibility of the following fix.

... wanting to replace the for() with an open-coded form of a loop. Which
is fine, but could have done with saying here.

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

