Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A00CF4959
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195568.1513499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcn7Z-000414-72; Mon, 05 Jan 2026 16:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195568.1513499; Mon, 05 Jan 2026 16:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcn7Z-0003zg-4J; Mon, 05 Jan 2026 16:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1195568;
 Mon, 05 Jan 2026 16:07:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcn7X-0003zR-KT
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:07:51 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae697904-ea50-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 17:07:49 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so9496945e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 08:07:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d73066fdbsm109741885e9.15.2026.01.05.08.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:07:48 -0800 (PST)
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
X-Inumbo-ID: ae697904-ea50-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767629269; x=1768234069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x40MIlm0Dc9F4QL8EOqSeDunw4hJcgQNZdr1PWNMoPc=;
        b=GcvN/wLjU7Qug3JHWgpAl3386vAJciRsYBdG0evON0tYPlvBXpwnOBux1XQBy4Wap7
         suM5I/SERCOg2C087eb8rPvcxMdv+ZBKnSszw5Dn4CHZJuU59GY7L45x+vZAU44EKhs2
         /N+37apBGzGa6B+nuFqnuNTw2qLPjvUmyd4dzoI8HWSdma7ObI6DQOOsigf2Khz8MGfx
         vvyVV80rJEZYfKqwYWaT58I4CqHyDD1Hg7I9x/iRDKyNO7xAv0cX9PXgdeXsasztslsn
         D8vZJU8Fw/v3LtvaMdA3ABHYu9h3jBPk5WHRKGTf/IqYJev9MDRE2C0cVTAyrskq00XN
         Uqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629269; x=1768234069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x40MIlm0Dc9F4QL8EOqSeDunw4hJcgQNZdr1PWNMoPc=;
        b=orOd630yJ6hY27PrPPCyFRHmm6YuGnL3g0zJBsQfd3JBnfXW80tauidNXjZBe/7ucM
         yvzSUgSVxRf0U6P/rjnhaBVP3/Krzp61zCq+alc5uisGeWwpauLJ8zC2knKRL0Xz8Cl8
         QRJjDKfWBccFQ+8dU0KnnkCun8+f3dWOr9p9aIpTE1C4K65UZ2C2ToXs9DMreTBlq83u
         0S50w4YkyXm5Ea2FkOvJcL/aiVO5n5Xf/KTs41eUjkPJeJIWoZQ07P7sWc/6OcvVaZln
         Wiim5jYj3392+S2LjSoPuDml3/mczDS2GA3Sf7j1Jq2Ka9Rbn2IL5FpEZlDlEVTAxkA9
         lw4A==
X-Forwarded-Encrypted: i=1; AJvYcCXZWxbITbcChaQzFzcN4Q66c6uyooRpek0ttEv5H+/SI9uON2hgkwJuTVgCPqQr0nGX6GerGIZv3nU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxztS1Jz/DZThXh7PO/e+6YP8r5MsnCx4AP3PopBVpe2vHLEyuF
	CqPQgZdBBpTkv4kBzhpiDvK+zHI8Rr9MWo6afhhHDWixROQ08+q+fMFNGGfbqgFhmw==
X-Gm-Gg: AY/fxX62Hp7C3eAXv7j8D3ccN1gdd95Th+p0GgN3VP6U+gJ9MEsJeyFV0tPiO8K0gSN
	N8Y5iQXs98Bz6+oZaVwGou3D5/Ruw+O2Te/Sct+d7gJTk55V3p23kl0AW1VhUEy1U76JiMGjiZb
	KHab93u5uFhrXnHFmh4AxTF6B47a9yOIzw7639HRfhQs/CbGyBpv7ksLzebLImR9Ua8SKjrHBei
	GN0ACHcZfvJ9h6VELzb/Cr6453A8HfU8Cd/gKxnIBd6PsgjQteOdKN1FqCCV/RqU4aliZQ4k0u/
	GULdNK+mbwpZUE4pgdg5mq8BrrBLgsW2GWtSfkuaqQwbvKyHGguZpWFPyKHtlBgX4Kd7WDvFk5H
	vpOB5PX+8I01tDGW11tzq7MzZjjEzBFl9H95lfzk4SCt7tzRSbkVQrs4MbRbqD2c2hMJiz0N5rb
	tWcZ3X3gJ8GIDYQufhbD+6J49TUMx8UC/96s+3tPUUSEiINk1YvW67hudeR4rWqxYgGG14lul/l
	DE=
X-Google-Smtp-Source: AGHT+IFFrHlg8cXLcqfrSt0VstVqB9RqjZ/OQbv1t5eoivSbWriYQa2uBQC67J+1OA5jauQLzHE0mw==
X-Received: by 2002:a05:600c:4e4c:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-47d6ba7e435mr112395935e9.4.1767629268885;
        Mon, 05 Jan 2026 08:07:48 -0800 (PST)
Message-ID: <58b2ca93-4d13-453b-a880-f40c890f0af3@suse.com>
Date: Mon, 5 Jan 2026 17:07:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/time: Sort headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
 <20251230135050.188191-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135050.188191-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:50, Andrew Cooper wrote:
> ... in preparation for a logical change.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


