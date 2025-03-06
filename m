Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6409A5505D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 17:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903884.1311823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDuu-0008E5-CU; Thu, 06 Mar 2025 16:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903884.1311823; Thu, 06 Mar 2025 16:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDuu-0008Bc-9a; Thu, 06 Mar 2025 16:17:48 +0000
Received: by outflank-mailman (input) for mailman id 903884;
 Thu, 06 Mar 2025 16:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqDus-0008BW-O7
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 16:17:46 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89d369c1-faa6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 17:17:45 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-390e6ac844fso781554f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 08:17:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c10437dsm2508549f8f.99.2025.03.06.08.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 08:17:44 -0800 (PST)
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
X-Inumbo-ID: 89d369c1-faa6-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741277865; x=1741882665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cxo+B7wMTeDEYrYk8zA1Lp1PXuaFKoogffK5F+qLA5w=;
        b=MrOg8X9IWuJRhvjyQnbjRtQjVhrFlQI6yhAGAhxbRyXPd5EqN3Fg9ur6qkbFk13tYt
         bslGZRH8yJqubpSMjJJXcWI9fTlJIGUOojqjRRZz3JHY/hMUCF+FL/VkFBQEhkGY12Hv
         LD0F5jvp4fEcKc0whJOOgnKeR6SHJ1wDn3TS581HG3wdDyzM30JSHzrs5mmSlJBnlMtS
         oGdJzST7YuoboELN4zSZduWjR2CgULiXLxeZ9ve6Vb+N6acJmqaIQRUkE0XhqSoU+y76
         gxHVcVBLOQq/SpcD9uvnBqwE1CiGt4S0V6LMQcXmoL6dwB1yhMQjS0uuQe3aesITII6P
         eMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741277865; x=1741882665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxo+B7wMTeDEYrYk8zA1Lp1PXuaFKoogffK5F+qLA5w=;
        b=Ex61oaKj7RgsZzBKLKrjKR3we8h6EkXLmWjXm18HNlhbWfHyAlZ43Lq25K1rp8ouPm
         JF36EZril+kyY33TLPUWY3TuaMu7CW2cVZSWEFG39VQDhutoanFnR7PYNkTyZe2Vrut/
         5485aKRoY0bF3h1323/KX4IJ99zz3H7ve/7ZwLPKNYg+ceDhlL5kbVPScFC5iwRDNuLa
         EwuY6htbv0KDAz39iOm5/FwMYWtasfPbikcsXxWSoojJioWeXo3Zgp1Xx8dsTzK0G0da
         8DLJTRPngoMmPpxWH0fK92hWv2erzLPchySF+DOG5RJuYp7aGJvcNJaXIWPeX7s7+Dk2
         MGOg==
X-Forwarded-Encrypted: i=1; AJvYcCUa6EM0J6chk12PKxOIYiZK5DszGlcY4xyZfOe1wfmtvJvLXmsCkxDN6YiguAyRipDon6mFlLaID+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJo4NgoAldf9jxsns2ZsiNnI4YwFqll7D8pNWgN6f6v8P9T+cQ
	SBRO6bHmBvcWqmWIPqT4AkMg8viozuWT8N7R6+pTiaHAZImWI/A/byMumIj3xA==
X-Gm-Gg: ASbGncslmDyBBGy2DN/tHB2ebzJs+YwaXAQgUiunFT1lIlXjai7t27cxSE6hkp7oXT6
	4xJxb5D2HOu1/+EnO/ChzqNGVhVZf98kOzEdJGa6arS2pRMLLwuoatnGBGP8Yk/t5IAOURivliU
	e9TvI0vbxRqDN7ZuSd/kCP/7PdyljI9nnjaUuJHu/OwwuacUPEqPwNyl2kZeSky/auUKa7tZtfu
	2ilsFF+2xlZ9dOVslisRsBFEtMCd6YymB1/Vb+7N/zA9NpjVMOlTgqYdGfqz5Ax4xh0GrWqSnDI
	uct7yrPwVO7wttd0pTXOOkkxkPQM0too2KEP0kHeXgOfApq2nQ7Nz4tyvnr7dktV9DMDiaDF6Ta
	8ZdmXMKRg/JqwwhGRms9sMJel9509ng==
X-Google-Smtp-Source: AGHT+IGyDuVTBXTSxhZxsKqHNe3r8fc8X2+nGIvo+8ZukL+zMC3ppaG+RsrhDuARK+eK58A+7ezbZw==
X-Received: by 2002:a05:6000:144e:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-3911f74e691mr7631816f8f.27.1741277865166;
        Thu, 06 Mar 2025 08:17:45 -0800 (PST)
Message-ID: <8167332d-d87d-4858-9f28-0ea703fce5bc@suse.com>
Date: Thu, 6 Mar 2025 17:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/events: fix get_global_virq_handler() usage
 without hardware domain
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306161305.10236-1-jgross@suse.com>
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
In-Reply-To: <20250306161305.10236-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 17:13, Juergen Gross wrote:
> Some use cases of get_global_virq_handler() didn't account for the
> case of running without hardware domain.
> 
> Fix that by testing get_global_virq_handler() returning NULL where
> needed (e.g. when directly dereferencing the result).
> 
> Fixes: 980822c5edd1 ("xen/events: allow setting of global virq handler only for unbound virqs")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



