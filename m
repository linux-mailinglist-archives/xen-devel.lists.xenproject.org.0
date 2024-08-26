Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D795EE79
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 12:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783391.1192722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siWzP-00045k-5B; Mon, 26 Aug 2024 10:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783391.1192722; Mon, 26 Aug 2024 10:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siWzP-000442-2D; Mon, 26 Aug 2024 10:30:23 +0000
Received: by outflank-mailman (input) for mailman id 783391;
 Mon, 26 Aug 2024 10:30:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siWzN-00043w-Mr
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 10:30:21 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3145f582-6396-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 12:30:19 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bede548f7cso4919441a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 03:30:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f48ae0dsm643733766b.184.2024.08.26.03.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 03:30:18 -0700 (PDT)
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
X-Inumbo-ID: 3145f582-6396-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724668219; x=1725273019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VT1IyEs9CC0EKgB+k94gZ+5VIa/8LSFZ0vZJITSVsXM=;
        b=GFjDFbF6fE10Yek/Ok7P82kCfkO2iim+6SG8PbjgjbuL2E0N1pULat0wPK4NkVyC/N
         4oKzav1mqwDRek23eKA93KwMYqjw9uFpeoKcFDnL7D2RRrScZy3GZvwkA46SwUKp9KN7
         IvJnYl2LFhVEWs/dr7xQN7x1Q3JOdXwtcENe6j/8g4bSbWdDkbG4DzImfprNxg9zn8Wo
         EftI/AeKryP/NqPL0blZOvJLGRoUaYrDtHwS1QGF/GNDMWF6oC2opZfHLQzbaI6ry7lp
         q+6pFSk45/kHQg2P19nBwD+1CfM/mK72dxMbEgwxnybLNDgxf3lmzNKfgGEnVl36Zv9r
         Gy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668219; x=1725273019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT1IyEs9CC0EKgB+k94gZ+5VIa/8LSFZ0vZJITSVsXM=;
        b=Gnmtyf5htmmxp0ybvJQ6KjRhbWY8bWcyykDF3rXGbRx+3qqz/gWqppooIHG+HlmBTB
         lgQZ6hd/fFhq6qh4QqA0Wr1uy/RF5O84fNXfK5ARvMz1qBNYYjFFgyjKKE9DvJ8eDzvS
         3YGo69UbKH/u5aoAacOnmPPDlhXufVbXbvlutNk1OcDKFjRaKcMyiZEQh6rCC0WVYXmA
         ZL5vq/U25holXXoybFjSS46mkprp++bZ/u+Vu1B4DubLWHurQatFZ9Pq080ZPismQJA3
         G5TRsh7XHumNuFknH9Cs/sbCbAfOcjI1lPbSM10/yVCMq9M7MyIXTjcq4x5Z08pfzpLH
         kzEg==
X-Forwarded-Encrypted: i=1; AJvYcCUIHxf6tnMB1gku4ZdNR29vojE30Qrze4BWzRPjM9Di9O9ugpAGncFhn/UCmo6JhhRrEu0Q3G1FqBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6zMdnNB/saE2ZLKDS+t48ieS3Rk/4HWmXFrlEroBpQ3XEj+/t
	hThbx1+xMBRUiBYKdRybjSgcHWZLYiMVKUW1okvfCsQTRrHa+RSsBnkDJLFd+Q==
X-Google-Smtp-Source: AGHT+IFem1U9/b7YpLCYE/Ye/upLDunjJ/3iVT8rDH5rI32RVvJ+uTFptHFhOU4gMPL4sdIZAzGt/w==
X-Received: by 2002:a17:907:7214:b0:a86:798e:b8db with SMTP id a640c23a62f3a-a86a54b0e27mr493593966b.55.1724668218870;
        Mon, 26 Aug 2024 03:30:18 -0700 (PDT)
Message-ID: <841e2cde-6fc2-49d9-b947-534bd53bc00e@suse.com>
Date: Mon, 26 Aug 2024 12:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] xen/bitops: Introduce a multiple_bits_set() helper
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
> This will be used to simplify real logic in the following patch.  Add compile
> and boot time testing as with other bitops.
> 
> Because the expression is so simple, implement it as a function-like macro
> which is generic on the type of it's argument, rather than having multiple
> variants.
> 
> Testing function-like macros needs a minor adjustments to the infrastructure
> in xen/self-tests.h to avoid bracketing the fn parameter.  The utility of this
> outweighs the associated risks.

We may need to mark these two places as deviated.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark/request:

> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -84,8 +84,32 @@ static void __init test_fls(void)
>      CHECK(fls64, 0x8000000000000001ULL, 64);
>  }
>  
> +static void __init test_multiple_bits_set(void)
> +{
> +    /*
> +     * multiple_bits_set() is generic on the type of it's parameter, as the
> +     * internal expression is so simple.
> +     */
> +
> +    CHECK(multiple_bits_set, 0, false);
> +    CHECK(multiple_bits_set, 1, false);
> +    CHECK(multiple_bits_set, 2, false);
> +    CHECK(multiple_bits_set, 3, true);
> +
> +    CHECK(multiple_bits_set, 1 | (1UL << (BITS_PER_LONG - 1)), true);

This is really the same as ...

> +#if BITS_PER_LONG > 32
> +    CHECK(multiple_bits_set, 1 | (1UL << 32), true);
> +    CHECK(multiple_bits_set, 1 | (1UL << 63), true);

... this, at least as long as BITS_PER_LONG > 32 in practice means
BITS_PER_LONG == 64. Perhaps not really worth keeping that line?

Jan

