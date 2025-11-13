Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB79C57396
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 12:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161064.1489085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVeC-000689-4i; Thu, 13 Nov 2025 11:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161064.1489085; Thu, 13 Nov 2025 11:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJVeC-00066i-14; Thu, 13 Nov 2025 11:37:52 +0000
Received: by outflank-mailman (input) for mailman id 1161064;
 Thu, 13 Nov 2025 11:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJVeA-00066c-O9
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 11:37:50 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ea7a0f8-c085-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 12:37:49 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b7346565d7cso96782166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 03:37:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809ddsm148308966b.48.2025.11.13.03.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 03:37:48 -0800 (PST)
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
X-Inumbo-ID: 2ea7a0f8-c085-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763033869; x=1763638669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sJNALaH0yE+mXCwmbYY/Ta/cfHto0EYt+VbWZLRz5Dc=;
        b=glv6tkwy4wfnT+oTU5RuDpv8Qfuc/Y1Ue9dVyVeig5gLa0trMERNdQYgj9zZJ9H1f9
         HZaAaAUiex/uN4C/Dq81N/UCMKJpGrFnyhnLEDMVI5TdrncSYeVfBWtwL643qNKFh7dY
         IgYDoJUE9C9NtXvUWFAgkp0Ro4mpzxio+D5RapaEeh5C91+MhoMR+Fn0A3hd9hPEQeE5
         usxiMQLcrvmScoqpF8gp1xmIrxyTSZPvZmTTfLb/sYCPN5cqrkf/18SmwffGaLwYj4As
         NiCL0O/3uMxnCkvO/Uz8OSjvKNidyOrSdKK8wO9+NEw3VawlFfN36aZ+/qh2KarwkTgZ
         kJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763033869; x=1763638669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJNALaH0yE+mXCwmbYY/Ta/cfHto0EYt+VbWZLRz5Dc=;
        b=H4Z3KbKo/Pv8vKa3gCaDXxcqmAzFaC3Ff+xu1MZZrX6xj35NXruMjq52BR+1+oWEEb
         vei279RIxlwQeclEoazpB38atyKfoS9tQoiSMtvrjm5vTUHX1EnamDiY/wBixLb2BXvf
         7oSCOM4wA6noeUlf0+BDEj/D+rMgWsc8Gw8DRXzaolvIVjY0uk8eb0z53VeZa6uBiQyX
         qSASspHc4gBmP6ojAR6ecqDzbEvELDXV6UbkboCHjvzgQUt9awbzEXsLKER7Dl07/5tM
         0YPZYyx6cneNF1bsA2AZAxKCVOY3njYUbqFgQF/YOBGpo1aFzlE3YusJ4+m4aJk2pAFm
         d3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUAx3e7DU5jYStaMgyR1tbbzEGSgBKnfR0Yrx6251L3IbqNTLOeLCuTh5rEL6h78UsssMMi454lrHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+cqALe74zuefqA4nfNzrp6lSFyFY255Z964AKu1fmZIKZ2B5W
	VEEqXrzsvphXF2ciwp7l8chGlxoN/MQecEW5v7EACaOR3ntD1/9aylXhmDn5iZtDHw==
X-Gm-Gg: ASbGncuAtuNDhc4DI4bpOu+apQFYuyRyt6S21a+T2OPdjPWvZqXSmsPwNAtjDRBza0F
	eOXvOO4XTWOI1Ruvpwzd3tSfVSNfbVdlQWuHAEWDL/a9u2g9ucuCYKpB1qvDxEe6e6W58AHU0Jx
	vgkbGk1tlzYDF/hPUI8f5FVYadbEteXiPXbsLSqqjCxRtf2Jc768HRJZ/ILpyNRuVkplRxZdX6C
	oFR+KotcO64FiQv/cbSsvvwu3v0dRna2s3o1IWYh5I8VMlQ6PiaxbcNqD33+JcSR/qHeff55A1t
	G/WQuOQnZBEUiAE3IMf3xZDoHjhJKbz4OWun31sMxVpjMz+6pWfh6X9cq/veLRc9Y6DL4cUaZ2J
	HSQB6nrt52hy502OygbjEdAUeZjKhGErARYeATBZuipMD+mjpUQfdXLVDSVmeQgdHHn0vbJP88m
	GKqZaVTcctuzuYvSgnzZqVJ1wvuSVcwKKwmFE2jq2LvuBvvxAxUvTMLPPOORjwQlsH
X-Google-Smtp-Source: AGHT+IEevsvcsr6NYKwHlFUNPqXsUmeUpkhpibbCepuMensWVbWF1WB9/BLUIFZg4gnmxqnQMO3Z/w==
X-Received: by 2002:a17:907:2d12:b0:b73:5958:7e6c with SMTP id a640c23a62f3a-b7359588192mr104207166b.3.1763033869037;
        Thu, 13 Nov 2025 03:37:49 -0800 (PST)
Message-ID: <367dc942-7113-46cf-9c54-fa77dc6b4c53@suse.com>
Date: Thu, 13 Nov 2025 12:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] amd/iommu: Remove dead non-atomic update checking
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1762961527.git.teddy.astie@vates.tech>
 <b0e81bd67c3f135a4102d12ed95a52ce56482992.1762961527.git.teddy.astie@vates.tech>
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
In-Reply-To: <b0e81bd67c3f135a4102d12ed95a52ce56482992.1762961527.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 16:37, Teddy Astie wrote:
> When updating a DTE, amd_iommu_setup_domain_device() would check if
> the update had been non-atomic (i.e rc > 0) and throw a warning if
> such non-atomic update could be dangerous.  However since commit
> 3fc44151d83d, rc can no longer be positive, making this branch
> unreachable code.

I.e. it addresses a Misra concern and hence ...

> No functional change intended.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

... wants at least an Amends: tag, likely a Fixes: one. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

