Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378A8ACAA14
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002846.1382241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLztv-0007sU-L7; Mon, 02 Jun 2025 07:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002846.1382241; Mon, 02 Jun 2025 07:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLztv-0007q0-Hg; Mon, 02 Jun 2025 07:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1002846;
 Mon, 02 Jun 2025 07:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uLztt-0007pu-L4
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:48:05 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea3ac6f9-3f85-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 09:48:04 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4f78ebec8so1584116f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 00:48:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2eceb396f6sm4343096a12.42.2025.06.02.00.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 00:48:02 -0700 (PDT)
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
X-Inumbo-ID: ea3ac6f9-3f85-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748850484; x=1749455284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VuQJh8JOIlFyJ8NwWZN9JrryHkYz8OsrTmzcYDIvA3Q=;
        b=X/r4lK4lXR7ZtjEYccnVcr3yimo2lYgcrqVpsQ2Edc31d07mAyg65cSCTO9OmF2Ufa
         KRHiPmwtgPzn9OZNOp5vqlAou2+cuJ6ExTCX9kXm6dbQhDGnjCAKz6NkrKjB4/ARcR6G
         9B5EtfUYx+VV3PaUaqUu5gq93uH4tsSZ0eqLKP9tGUI2r+BIo/JD1X0tK6Csh88uDn7+
         QYdv50B+X1PYcrBMT18goPw2/7EFjd7/sDw57+59FTRY51H+5zsLALyTM29ogq0LuAtx
         9hme3Najcx/+RW6DUYRAR0614zWo8NuCsodhzp2GRB+gO4rHQTLw5x0ZU7fNdTmzYBdV
         LxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748850484; x=1749455284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuQJh8JOIlFyJ8NwWZN9JrryHkYz8OsrTmzcYDIvA3Q=;
        b=KfwXuvEnAT40uue1ORXV94KJGpLrf1Snhgpjn8Kqh8IE01dh6yQB2QX28oJyZu9Wru
         4XLKzDoLoBqsvjEn1VL/6Qfmrrbd5WBmYB0C+mqCo/cXHcmMd1JE7JYjvVUwLlLYzWIB
         g/wbr7Oqm9AnFviAFW0SNV/dJzm1jEK/iNX6MZS1Z3l1XMXOHU/4613z+9wbxT1uRZ8G
         1tk8V1V+xg5Hk41J2XLub5CHDZCE2vsVfHR+ILYovlDXt0Qo+X9IWSO0r8tyKodFIrCe
         NsVtjB3TWElH9ZeQGfsIyZnzdogxLB+hMzq7ZtzeOX0h4HcbRwHF7/FqWI6iivD2AGjl
         pd8w==
X-Forwarded-Encrypted: i=1; AJvYcCW7x9EMTGrBEzJf18M9BGCDla/Ap/xeN3wk9ftb/Fq0pHk6p7UICzszUpooNcYpHXSIs7MCIczjRps=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFRaYhDVcz0Snvf4hVEU0qw7k1uxjUzxg5IPEV4Kfjx62oZSlJ
	7t/i+XC7pKFiIoshy4BDTv6MsOjfg7i6ihQX317d8EIenliI5cGoFvC/OmiPEuJtLA==
X-Gm-Gg: ASbGncsgAb5iLKrlWXan/z1CWtBtTqHZvRMS0znY0BmTnsEde/DPR0Xn1enZEpFdkLY
	UHprFpC5fzHq8wqXhTl0FYrMK0ionVXkkaz3Ytl4VkglA8xPM7/AVDcPL3cVBe97o/eeQSnzUJ0
	jvIhDV7A2PiASSP1/xhpcrEW1x3zLkHz8DgvqkqnPy2ghb6ecJZpZqtbLx6+1454p1DaGcpua4V
	rPwbVPTBDdteOVlDhSmfV19bT9rannQF0ERLfUdSloV5vnjA8Ym/Opxn1bbRfsn+QdQBAGKsaQH
	rvDahI6myAOAiDsVsOhAl3VIJkdXOzyfG7FyJwo2Nen909QApz6SFjsTG7v01QIiRGNWdb0RvFL
	KtF28itKeCqoMWZKrBAzICacgWwTZLeAQSGNy
X-Google-Smtp-Source: AGHT+IHyW1eNEyTCSasXANQXDAtgz7lLhxfRwi5KfDWrlt58AlPDdJfdZpZXOftJAvwUXnz/CcBtpg==
X-Received: by 2002:a05:6000:1445:b0:3a4:ef30:a4c8 with SMTP id ffacd0b85a97d-3a4f89a5d60mr8129392f8f.10.1748850483633;
        Mon, 02 Jun 2025 00:48:03 -0700 (PDT)
Message-ID: <680c7ba4-e4f4-4fb9-969d-ecaa206e37c6@suse.com>
Date: Mon, 2 Jun 2025 09:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] x86: Add missing pci_dev forward declaration in
 asm/pci.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-3-agarciav@amd.com>
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
In-Reply-To: <20250530120242.39398-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 14:02, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -13,6 +13,8 @@
>                          || (id) == 0x01128086 || (id) == 0x01228086 \
>                          || (id) == 0x010A8086 )
>  
> +struct pci_dev;
> +
>  struct arch_pci_dev {
>      vmask_t used_vectors;
>      /*

Would it perhaps be better to put this ahead of xen/pci.h's #include, thus
helping all architectures?

Jan


