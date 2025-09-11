Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C2B5335F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 15:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120252.1465273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwh7n-0001Ws-Pu; Thu, 11 Sep 2025 13:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120252.1465273; Thu, 11 Sep 2025 13:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwh7n-0001Un-N3; Thu, 11 Sep 2025 13:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1120252;
 Thu, 11 Sep 2025 13:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwh7l-0001Uf-Ki
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 13:14:05 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f563e7b-8f11-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 15:14:02 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b0428b537e5so102092966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 06:14:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da37dsm128642666b.18.2025.09.11.06.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 06:14:00 -0700 (PDT)
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
X-Inumbo-ID: 2f563e7b-8f11-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757596441; x=1758201241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aL6a1NHLWC8VwdXipdoBqMORqHdqxc8SyRVYKG45v+U=;
        b=YdT3mGas34r28JMCvkN9763Vl1iCNjRrhhULde2jlSDaAu3Z8nJ/+IB+ORwvkXb4Jp
         Q3A2B6/na1ANeNkGQY1Dgn8z8w1FpO7TlrDyUlMHuKex/d+sym3NpNtgsnKlYxsodeQB
         fpjf1qbeHgutzck7uDG3Nn6s79AN9kOkLOoOQ2UJrBWb8wDpvSnEiB+nYV7S4LOyG50p
         5EoFdWS57yBLZqHPEfQHbYCDXiczK3G93m2hUNnuNkzTXn6kibSGW/43z+ueFkEusjZC
         7dDemmVf+BZkLkrV3CfnB7N4lJoPsc3z8PBtVqhCvOvuvWeQuXr9ssbfc0zTCQybokuv
         L8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757596441; x=1758201241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL6a1NHLWC8VwdXipdoBqMORqHdqxc8SyRVYKG45v+U=;
        b=OCQVc/H8B2I46QOJDf8gfeecSe+0gOEYLU8sljtGvsYGVn2zWhdix0pAZ3ipn3sR4R
         IHohvwK9gcAltNAaXVRherjLg8Pdxx7l1xGhCqA7mMvQW/zrhKe5Ziy9Vy29hBNun+wf
         GI/98Ly2s6uBOjClQ7Y4ILM7tfpInSfnSrp9+RAYM0pomIA4QDWZfLg+EdQYRnxdtxWh
         EpvhaYYp3OvDgSsdME3FSsrSCyLKhs55Wc5b/GuuDZBxqNKhN2UTtIJvnSnQKJHjGoP8
         ZxSL8R83K9lUYYLFj+BsnYZ3egHTZdQfdm1N2wbS/7c+8Dm/Wiffx96f8u2pMgl2zB8C
         QZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhQVHFvxKAmy6hdWCQnQqhhNI6kJ4Bk5cr+VwfsRl1yuAtZpvnHFH6KGfupGSS/LFqwMBmG8n2qU8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBP2xVs7Inf6cVl49Pjjq8l6ss9EltqN8AHvwO5NCUBpUL9eji
	6SrY0HUj37EP6SDbj4zm6UHycHe6abhaHzgUHqQESwz7ylvEKbG80gW4ejmj2qetZA==
X-Gm-Gg: ASbGncvmBXacyEmUm1AGPNSunht0nY4JJ5il3OVdIMMJduZ9u8YS/qvSp2/AhOcdUWf
	zY/o8kosaPxmegl71cVDaYOhx1NQ1GgI5urw8zMZmT+EKKtFGs7aUKkR8pDCFuvMbvAFjcdvgMy
	rMTgDAznBelClmjFI8VVbsVnB8sAfiSzeq4fzp6lRhsikO/jppX93qSWJpmsvS+KKrKNkw+QuhO
	7krxkcLPwM0cpiD/OYECWI+Jt7aB1OwlSugjNV7G8xaCaR2tIpGlsYnH9NtZ1ZkOxB60pLoUNoE
	iEogE6+KNfsX2055xPEMtEkWj4E5pL/LE+94os6gTMm7wmz45xzLefKUJtT3psqYKiTjahCjoQk
	8nbn2hSvteW9iOV7dl1fiIgI9bWpMnJVzuKxsfbyuK5V1HqDbwkFQ5cCVDFHbFgpVLUKDZYpgCa
	5mpLAnwC0=
X-Google-Smtp-Source: AGHT+IFw7IHnswo+zmiA0nq6BiFCvO7q9MXfRcEEU9C43WA8CJueeMKfjmr7a4bjWwGS2UMqGNTpIQ==
X-Received: by 2002:a17:907:3cd5:b0:b04:4d7a:8509 with SMTP id a640c23a62f3a-b04b1559b84mr1825324466b.36.1757596441501;
        Thu, 11 Sep 2025 06:14:01 -0700 (PDT)
Message-ID: <a0c45dee-c396-4b71-8c81-b38c81bad2c2@suse.com>
Date: Thu, 11 Sep 2025 15:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/26] xen/xsm: wrap xsm functions with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-26-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-26-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> The following functions are xsm-related and only invoked under arch-specific
> domctl-op, so they shall all be wrapped with CONFIG_MGMT_HYPERCALLS:
> - xsm_domctl

Doesn't this come too early (reflected by you putting #ifdef inside the
function), while ...

> - xsm_{bind,unbind}_pt_irq
> - xsm_ioport_permission
> - xsm_ioport_mapping

... these fix unreachable code issues introduced by the previous patch?

Jan

