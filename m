Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3539CA6856
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 08:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178505.1502287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQYJ-0005Gc-17; Fri, 05 Dec 2025 07:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178505.1502287; Fri, 05 Dec 2025 07:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRQYI-0005Dv-UF; Fri, 05 Dec 2025 07:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1178505;
 Fri, 05 Dec 2025 07:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRQYH-0005Dp-P3
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 07:48:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7f8742a-d1ae-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 08:48:26 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so11346015e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 23:48:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4793092ba4fsm71926195e9.4.2025.12.04.23.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 23:48:25 -0800 (PST)
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
X-Inumbo-ID: c7f8742a-d1ae-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764920905; x=1765525705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rdVt5JwVmldy3kt+MVUYmdY9scOHHe/WODn3QAmmHk=;
        b=VVDT/VcuTMxwfGWHFpj/7ZKztQKkbxwqRQFy0HFbFMnWMbVA+SnSbzYKeTzUUHD12u
         6NSC7H9nWSCCMecBwu1e1jvikmGdUoJVeuzBsHEQpRXcVbnKrwnjILNZW2utmg0KHqoS
         PYSUiNKWeJu9G6aEOwaLkewxzfWX5vx0A/ETYBb+8gdgftuHIHcGAWb5KtUMQifWwftl
         zCah29c30+mV2aoUcpVU0LNJ0b3iTQeZir5gQra/ARQsKUlRctRjcW4ZjrpBW1lVHEea
         NRI9pAFW0XKh6fddPot3ylUsxk6ed360cLBw0k6wEJYKVI6MdHkUBcPFkk0MsB+uy9Tk
         zI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764920905; x=1765525705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rdVt5JwVmldy3kt+MVUYmdY9scOHHe/WODn3QAmmHk=;
        b=oNpI6QD3X7iOSNdaNX4KeIAdngHjuawLi8GA6VMBnXMx9IqjmdL13txcaDFe3tXB0l
         J4ne35Tkg+NrqpRbVxsOxUlkWKkphJ3KqEdLr4E3fHMngvjJv091K1F0DfoNlHVG229Q
         yoryugQupcBacbPiXCVn0BhHYiIr+6a6EMptVEidYAY6VuMzYFdsy/g6uB64tttQhBUn
         NigSaczCoON3D3/HHU7ifOO7i2KxHbCkNO31cHe3u5d0DJ5x5w1VPhk61HVGTOHM6Tpu
         g+tnJPN2b3FbT4KXjZpDWJSLVFbgeMngWKKdvVCloytnF66h03K5BQOOKcA/LlEU2Vok
         3rVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5lorHb200/2FBWjshHYuCiIqrBlnml7tuqt/mWJganhKxqBPWr0AK2362BZZFZEqzFJrf8vR0E/0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpS+buFKLa23XHOY7mGsuHCqXZe/XOPsGrioac9bv9hWfxPCGn
	WGZakOKRkOTx2bNfMukwmGBHWhN49zwQmEm8nleq2k+Qv2+hVt7rmPcC+Ac1vc+eZw==
X-Gm-Gg: ASbGncvqTVtoU6Tw5twyKXogSVdiwMPLeGSAta1CUUWA5CS3oE9cD+DBWaVniHifnn5
	3Q06/Qjef6Oxm3fGqgiTHyy+lolvmN+SDOEAnzdZX6uWDtqjx8zliaqiZyDhy5L2NLeats7hX7f
	1SG+AFW9UtiW0OcD4lGeIFwwDWR9tYOsq00g/MgPgEk2ORbxtS56BDdoYaF3OvuBq1VgY0Yc4RM
	gAam73cbjFAZQ62rZ8GkbkDcgR5Pd6hmJuPTu/UX8uo9T/tCQlfcfN7ji8hJRa6jwmWLH45iElY
	rDw1GVvdhUm+JpeG+MKJusNMj67R60GDbJj/hKMm6HrU7IzRK0mUaZcxNaGo2cd4mXpPHfcQ3tz
	HqO4TMZpinH0A0p1Ev2RHzO8srDfZ08sPY72hhAI9bLW/Vh1VktIxJ79rzKiL9vkwdaIf2oFMyj
	2NIok1g1AbheLBq1W7fcFYicCb4/e8KeBIDMiW4MYdXYIAmow2fBgKPPQ8gOm1O5FZCrvr7aE8g
	9s=
X-Google-Smtp-Source: AGHT+IEFImYhT7yG5RIOln7xiZs3YEQSU9XttqB/4QMST7UScS3Y+PnoKTT+Hgy9o/uWdBYOwgitJg==
X-Received: by 2002:a05:600c:198d:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-4792af1b339mr107300595e9.19.1764920905367;
        Thu, 04 Dec 2025 23:48:25 -0800 (PST)
Message-ID: <c21ddcb3-ba38-4dbb-9860-731eb43c38f3@suse.com>
Date: Fri, 5 Dec 2025 08:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/treewide: Use __ASSEMBLER__ instead of __ASSEMBLY__
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251203133258.1624223-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251203133258.1624223-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2025 14:32, Andrew Cooper wrote:
> __ASSEMBLER__ is how GCC and Clang spell this, removing the need to set it up
> manually in AFLAGS.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While I fear this might end up biting us significantly on certain backports,
still:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

