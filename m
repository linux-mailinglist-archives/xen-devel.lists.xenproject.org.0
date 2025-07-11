Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7892B01BFA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 14:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040860.1412146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCqY-0000I7-66; Fri, 11 Jul 2025 12:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040860.1412146; Fri, 11 Jul 2025 12:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaCqY-0000GY-3J; Fri, 11 Jul 2025 12:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1040860;
 Fri, 11 Jul 2025 12:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uaCqW-0000GN-1i
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 12:27:20 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a731a4-5e52-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 14:27:18 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1100224f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 05:27:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6f841csm4927885a12.57.2025.07.11.05.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 05:27:17 -0700 (PDT)
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
X-Inumbo-ID: 62a731a4-5e52-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752236838; x=1752841638; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KPqwsWiw6HzydeQXNWFMclkEc0oILqtYNyvo4pL05AA=;
        b=SO4dY3ObZZMfP1CHO2KulxheBSrqH6rTiewHAjs+s9snEyBaf0LgvgdCC6pcMf/gKp
         X1qnxqx8NDZMlhZlzWg6HTu9j4fjJ4CsQxRkzAfL+Z1Wx/EAuN9aqD3O+1ChYXHeITHh
         ZUhRI4z6+YPerhGoCanpVUWB3CIDl+JeqZs/Dd9jCBIaNMIRoacQ1LSRUaY5cYhcHzFz
         tHiDw/TrgoqBSvJ/6DDXUXTjZOoqDG2CPF1s7nCQGgkpo5luBkdP7ipaIM76JOTPLMcZ
         AzaXHfBAszgYZlMUORGMyZr/5fMVV69mPONIMdDoTnWNejfREVX58jPdRSKKoyulvq/H
         9yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236838; x=1752841638;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPqwsWiw6HzydeQXNWFMclkEc0oILqtYNyvo4pL05AA=;
        b=RZkdHN+oPt0UZGO/pbJK3/hXIWRyvJhc1fi84+fmM8vOFuKd+1P4v7iuvN1sQR1Az/
         LlBUHcdprzl4iGIKwh0rXxEu+pXMuBF1hwYiHlhu+caKhU6Tsvgsbazefg8jm/tRdjmt
         KN/pfeleRAQsyt804KQ6c25RyVvg34uSZJgVsxOsRQVENzBSvAOhzwovDvKo8uxUhA3t
         c+C52rKU5q5xqXUcCXRi4J6M+lOr+LtBYRBaVvJr4K9+pGWfUi3ABN/zwRe5VGdt1one
         arKfrP1KbMztnBMNI+18efw7c7bhIbYSrKzC6kvgBtQNFhhl0/a5pS2tvo+lHI6VY1Ik
         hFQg==
X-Forwarded-Encrypted: i=1; AJvYcCVW3QfJs4tysf5Vb7hEyG9/4MbIDetGvvWPsLJZ/N+CpaywSjw+7QIBOSZPxJ/POcYK0CaKBql8/uI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQxdie3J/BVu+PWRfCDz9QI21XIsg22xZNzVcEIUaNf/4wfLk0
	r3C78FqhHUHt1+5/K4Lk0XPTB9dZL8Xyw8A+7KaDXcbf2wcpobztjCq2UajgtmYYNQ==
X-Gm-Gg: ASbGncvWavksXRfGXKE8nxTehQ/FFYnEC3X9O3MxWlGXC/P6hkrhqWIzjYMzrd5N2wY
	Nlp1ka6uaVwRuLKjG97i/Sb9AzFTsrMUnlKv6Qu72Bd1iuSq5pz1ouqcHdMJR/8knsn7jhY3aW5
	e4pEuymnEQguQBqAopZxIduFZePGcuuHLE72C8WlXFqtkNmddJTFduJYglEUo8VR3gSLx4GhG5j
	lKozfb2tQGTU3YdXd0+7rHJYz7BexHeCuQ82BAP8pmvrqyc6HdzPIGOG8KgICJT0dB0QY4FI0oK
	DRYbH/HnEGD0eZbk/GJ+NbNebr+8yu9kpzvg3p1lbvuo2S1/16wo8vqZnWiyt/R384WJynmPVMT
	ZyPLqYGn4Tu5RyQcq0SEaZGudzzVXmEpdqoSalmCCypH+SakhG7zE/et9mWoreaN/XgxIsqwXoI
	NsVUliTJI=
X-Google-Smtp-Source: AGHT+IGsxJjsQst6x4AAnbmzOn6p8nxrCEnDje5plS4ih7B8IUe23Ye3NYpEPyWhbY7fT5jOGPKXpQ==
X-Received: by 2002:adf:b642:0:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3b5f18eb8efmr2216472f8f.46.1752236837967;
        Fri, 11 Jul 2025 05:27:17 -0700 (PDT)
Message-ID: <9d98b6bd-e325-4cfb-b4b8-c6a5321e02c6@suse.com>
Date: Fri, 11 Jul 2025 14:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH] e820: fix e820_get_reserved_pfns() to reserve
 page aligned area
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250711120333.23745-1-jgross@suse.com>
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
In-Reply-To: <20250711120333.23745-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 14:03, Juergen Gross wrote:
> e820_get_reserved_pfns() needs to make sure to reserve only page
> aligned memory areas.
> 
> Fixes: a7d27a7332ba ("mini-os: add memory map service functions")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


