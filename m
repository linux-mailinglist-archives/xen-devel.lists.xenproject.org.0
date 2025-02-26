Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA4A45D23
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 12:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896410.1305090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFcH-0000Xf-Un; Wed, 26 Feb 2025 11:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896410.1305090; Wed, 26 Feb 2025 11:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFcH-0000VC-SC; Wed, 26 Feb 2025 11:30:17 +0000
Received: by outflank-mailman (input) for mailman id 896410;
 Wed, 26 Feb 2025 11:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnFcG-0000V6-1o
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 11:30:16 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 077f644e-f435-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 12:30:07 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e4b410e48bso351033a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 03:30:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e45a8b8c59sm2619906a12.27.2025.02.26.03.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:30:05 -0800 (PST)
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
X-Inumbo-ID: 077f644e-f435-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740569406; x=1741174206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VvGs45OR4lQKAYng59eJtc8d7UHTEeZjP1aJzZ98Y4U=;
        b=AvfXFHmXJo3Ir+T07rTwvFj8JQ29vTDW/9KYKfIpsq3Bibdpkvy0x40RALOC3eCQKf
         nX0pKWycucgbK6UaLWafHj86DHiAw0FBX+xM6lYbTRFiyDYK9reQDf8cfLFzxsvqCFv1
         EZeIOBVWe6ubTS1XSKTP5W6L/giZkKS7nRIKqBdjzdGFAmcOXtJNL64BbrMytsBU5d10
         qAyhHIZxyBlg2sLTQVSuPb3bYou9ciSn6R33dv/2saQyAI6XB8GcmwqshyaTwc0LaD/h
         KNZ8o2w//XmrX5OTfCsBihx87K39lq9Fpj/IAG3+olKNzCuqsclMYBhEOZ5rTFdZsybA
         8PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740569406; x=1741174206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvGs45OR4lQKAYng59eJtc8d7UHTEeZjP1aJzZ98Y4U=;
        b=fwjNAm2LlB6QJNltAKMxMC30CiZ8P5uyoHZoXHbFE7Q77q79plDcwT22MkhHqVxgy0
         Rve7JhCCAX0kALjIInduXTx2InydRtQsx/+lOCfA5V+TCjyxfkYknOIjy9RPD5zBWMlG
         WsL3zCrxHNOWvokTdH9aXiDLPvHaVG/1pzqBtY8gC+H+ARdlEjhApeE1w4+t6niqoaZ5
         1SHVhE5NMlvj8caLpfxF/HhLhpxwLP3TCHfUDHRiajO51wdW2cgpAD7qvLZkgTrI2Ukl
         Yig+BCFWnB8FXrGSD7ZHshz4UGqZb9htd9kDSQjDfzGkxZ65OTDkmerRKYg9Y1qiftBF
         Vk1w==
X-Forwarded-Encrypted: i=1; AJvYcCWGhzOalPha5JPm6ZWhkopMOLwzVP8FbngTFaqCDYA+q7BImc6a1hj+wDzGeELbc/BhNmUz2mYoREY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzxyI0Q99Om1OUaFh6GXgMXLXvYBrm4rQHPwraPb70CnM6FA47
	HF8vyQi+Ak9N0f7fTTatLxVEHdnVzfqK+Fr+mrzSDllQ6Dh0Os8EFDZylAe3jQ==
X-Gm-Gg: ASbGncuy6WmTLgHJvc1dgQ9TThnHSms0rAy65n70TIWDo7E33yVz0v49OE/JcQjowyF
	0deM1+of4kKRbBf59TNxgdAB+SIswJamLgVHiN/pZ8JgEoYyTRYMYKglhQDIWRMBmrHNLwrDUnv
	B4mApkuKPS1koso+Q4UU7iY8UbdMJbnWR9SC7BsDyLlcPJWyKqnrLzykJXNX3ZWOifm7X4cKSjE
	40ZNfdfsmhvc1IQMTjhVv6Hc7ghoh9sUP2TS6yeEv5XJ6ml/svRltPjD4OsR4k7G6v5S5FP/IbM
	QjgTAZeg8reHvYJkjZtPPQ9oWymGZONbpZ+7S+F8ExkJFBkGzVj83YxlyjKN3FeuCAXGo55YmtQ
	PSDLM88TvKyI=
X-Google-Smtp-Source: AGHT+IE5gXICOQEYwboD5o3R4pgICRg3PwlwE7M6ksyon3tWLwQkWMRCtrm988T1Mze+5LmT9vACJA==
X-Received: by 2002:a05:6402:4493:b0:5e0:348a:e33b with SMTP id 4fb4d7f45d1cf-5e0b70df00cmr19844390a12.12.1740569406250;
        Wed, 26 Feb 2025 03:30:06 -0800 (PST)
Message-ID: <d955ba46-6556-40dd-9809-8f64c53dd704@suse.com>
Date: Wed, 26 Feb 2025 12:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: introduce console_{get,put}_domain()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250218083048.596012-1-dmkhn@proton.me>
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
In-Reply-To: <20250218083048.596012-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 09:31, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_input_domain() takes an RCU lock to protect domain structure.
> That implies call to rcu_unlock_domain() after use.
> 
> Introduce a pair of console_get_domain() / console_put_domain() to highlight
> the correct use of the call within the code interacting with Xen console
> driver.
> 
> The new calls used in __serial_rx(), which also fixed console forwarding to
> late hardware domains which run with domain IDs different from 0.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Link to the original patch:
>   https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-4-c5d36b31d66c@ford.com/
> ---
>  xen/arch/arm/vpl011.c      |  6 ++---
>  xen/drivers/char/console.c | 53 +++++++++++++++++++-------------------
>  xen/include/xen/console.h  |  3 ++-
>  3 files changed, 32 insertions(+), 30 deletions(-)
> 

This patch doesn't apply to staging. Looks like it depends on "arm/vuart:
move vpl011-related code to vpl011 emulator" without this being said anywhere.

Jan


