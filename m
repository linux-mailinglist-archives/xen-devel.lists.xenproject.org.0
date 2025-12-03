Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A53C9E738
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 10:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176507.1500975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQj4f-0005cx-Dm; Wed, 03 Dec 2025 09:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176507.1500975; Wed, 03 Dec 2025 09:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQj4f-0005aH-B0; Wed, 03 Dec 2025 09:23:01 +0000
Received: by outflank-mailman (input) for mailman id 1176507;
 Wed, 03 Dec 2025 09:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQj4d-0005a0-B5
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 09:22:59 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6eddde5-d029-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 10:22:56 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42e2e6aa22fso1796163f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 01:22:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c3c8csm45852278f8f.2.2025.12.03.01.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 01:22:55 -0800 (PST)
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
X-Inumbo-ID: a6eddde5-d029-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764753776; x=1765358576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SYGvs6y/iFswRC7dH+RpYLA5wBXDkTx4wOBA/LCpgG0=;
        b=UrXS9haSzxG9tMg3Ueu+q6fMTBOwFmjgjm4PTi5R3JA+LXXZcw+QG7ia2GcIFHwuae
         r8rGDt/vpmtNViattGXM7QsmPiRBGlzrWBfCBDHsDRu9twE0P8eB4t+4cyxBIkTHCH3B
         0jOYbNoGUplerveiluH6Eh37FG/c8f/qYVPJWiE8gh5PO+u+ypZFZSZwUozHeOuel1n1
         fvLfreBfcYIvv9iLjKW61Gsb0bQQB9pc+btA9CbexafI/CrqYxMF2VEbst6WC3DyJGpu
         dLWY1kSCNYLAuIjFJbWM/xc2U+E8tRyvJSM6Gdhb0fK2O6TFwzG3wbDkMd5ABOxUTa86
         fM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753776; x=1765358576;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYGvs6y/iFswRC7dH+RpYLA5wBXDkTx4wOBA/LCpgG0=;
        b=v5NX3XBsTNs4pRZE1b4q7AMzDfiwX/2GwSjGhgNnUIYw3PHufhdU3fBuFEp80eCHaJ
         1OaK4MaHelT+LGNBwXxTUyElZk47jU4QY0M5zbyRW4PtMipj24MjFbnU1R0q3r7ZcG2V
         F1pL+eCOxqlAjISJQHXqByjHzu6+pPKYNdQGhO8Egf7lnJL0/6HmmeQB04RlVztKDqgc
         iuFtqvh1EeVPTFnBGkuWTIvgkdF1dsbIhvJQrhsUELxLhEZp2mdLtlNmHnwW1uMe/Nf8
         h+FqEZKgd2a/kq0/nl2+XqE12iXenFx41OJ8ASXCty73QwNSFhTzT2BWNmMeuwAdkq8A
         bYhA==
X-Forwarded-Encrypted: i=1; AJvYcCWMTBS+bDd/lj3ZVHHJjy4pjQtHQ6ksR3aRkvCf8Ke+CM15CG4lMAru5ZByjTWb45griXRg3A7827s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7OPL/w9mL0VqqjvSFK0IC2S8oVCUBxzKsEpcIRCwcYmndw1NX
	uC0Dro3y0gUFgbwCSCt/1H/xRuDD8xEZmJKf4GqcJhBKLTJX9cOQG1IpdQchx0EGIg==
X-Gm-Gg: ASbGncsZUD7wFfVeAJFOgVszBBCIR5/WMae7fagmiaPlgb3sbECqeQYlZRbdmLRS/8k
	Nw14rj0xAuvvYvoATrjonRaWtc47HTP92dlQZOxneE/Lo7l4N+XM0vDluZGaDXfpo7a1wdeltxv
	bst2G/UzDdK9sARPpoEVmh6xY+75+PYbek5+pYY5/dFGs2NzebNO5+4PRBwOK1LiPk3TTVwPxYP
	4CjqjVuJs/lnseRq0CfJvaJs2ma6/lOZdXq6qAZXuHBt9roIQL8sTlg411gFzGQLD77c4i6w0E3
	rbeFuNogzVwlTxfS1U3kyeCZq4Aw7DIW6mW9DVaTKc46IiUo5c1SWMPqsPkqifJXt2ADRmtYrbJ
	5h23ntde0nrdXf1EFJDYQqy5ZzT1Z8Y86QkcTPvKjSYEhx0RDwbYdvgCAhlN3nT9gCcjYER87HD
	kAMZ0rgdqTPyiXuGNt7Na8JpjpD3X6lJwdTatu3FOXY+nqUM7NEg3u/FJjBDY2aUidEos7KWwWA
	ncWofWtuW1+AQ==
X-Google-Smtp-Source: AGHT+IHaJCdVq8xN8O5N3JTmJS2/SIjqFwvaWxVmv/saLcIrlTKItHwNT4wPqkkKGG7YhygYRJrXmg==
X-Received: by 2002:a05:6000:25c4:b0:425:7e45:a4df with SMTP id ffacd0b85a97d-42f731699edmr1427919f8f.11.1764753775820;
        Wed, 03 Dec 2025 01:22:55 -0800 (PST)
Message-ID: <ff49a553-3d5d-447f-ac45-faab7afa8aca@suse.com>
Date: Wed, 3 Dec 2025 10:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Feature names for Granite Rapids
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251202153935.1476414-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251202153935.1476414-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.12.2025 16:39, Andrew Cooper wrote:
> Slightly surprisingly, AVX10 is the only unnamed feature right now.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Hunk borrowed from the AVX10 series.

Please can you also "borrow" the gen-cpuid.py hunk from there then? With that
Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I'm sure you understand that I'd much rather see the full patch go in.

Jan

