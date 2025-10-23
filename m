Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604E0C00475
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148919.1480738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrkL-0001vB-3f; Thu, 23 Oct 2025 09:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148919.1480738; Thu, 23 Oct 2025 09:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrkL-0001tG-0w; Thu, 23 Oct 2025 09:36:37 +0000
Received: by outflank-mailman (input) for mailman id 1148919;
 Thu, 23 Oct 2025 09:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBrkJ-0001tA-Lt
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:36:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c14dedf4-aff3-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 11:36:30 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4711f156326so5430895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 02:36:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342860sm86515375e9.11.2025.10.23.02.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 02:36:28 -0700 (PDT)
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
X-Inumbo-ID: c14dedf4-aff3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761212190; x=1761816990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BH8U/IUuQiAyqBVk8sJPwecDI+OHVavSfIRaEjX7xO4=;
        b=TjM6P3S0S2594o+OiTRQLjs7nnnxl4XMriu4Ruqp0XaBX/+gFpEDW24LSYhCsCMqGo
         TqDpotqNSpR5B+wrXFqxrGMAk/j7Y+Y2G3FNZjOx4blW32RPUgN3M1r28PoQSR/HfnR9
         11YAVHlvH33Dtlwh92+A2jbTeg0eAb0P/6gnAS8YI/ecMQCkDlyeJmGSSrlpnuABMAEN
         R2CifpWHpkk3K5CqomrPkaPy7xowF4xmWxID1r5MOMSwcTqUVyeOiOoCaBd7asakHA6a
         MM9sl4dkf8a/90yqdO/9wzqHaatVEaG1OP9/j+51ac5T1CJrl4tSlApjxhZhnhrqhMhI
         wi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761212190; x=1761816990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BH8U/IUuQiAyqBVk8sJPwecDI+OHVavSfIRaEjX7xO4=;
        b=aZrtho8E5j0UB+AzsJkEFUlMKnqMBTceIqUQFujQNdBgHwOpwn9lTqsAsFk40/ephd
         HGOjKwNasS9F+IUR1zNboDNri2PuHrWoY6EXqSaiWLPPFkPUvqp0M1oT0Xf2POmRIiA6
         AGgdlp2ZULx/CBAiOguhkBN1fNjVp/+WQ4qClgNFZ9ER8YsU9viesF0WZaLDOFZ1+1iM
         aAtBbqW+lCd2Xh8/MiAisjgHpliI0qWU9LsM8qD1Evx0V0ThSwg5rWIY0Otc9jlWbwMY
         S+4VyHiT9lHQlsjpb9vgqyHqdcdxPacXZ+oSVotqUKoSltCtnSFvkAYwNuipKAWBnk9M
         7UEQ==
X-Gm-Message-State: AOJu0Yzi82na0+7W3s3wjzbHifwxKnjHRHg4Tb+clKPqX1YKp4SJyvAp
	MaT6L/6bxKugeCoRF/PV5B/3gWir61uh6jUb0rcS0e6clKCn6J38RGPtf6bNuAi31A==
X-Gm-Gg: ASbGncuO+2gQAM9z9N1dwflJOcw8fEb9rYOvOENfGABXF67cwu1fg9XjWVikf2974Te
	BjBXtF1IjxGrvZciBKNC707vXCLQd3EZa9PzAGq8smCms5i+3fQVtt8/Xo+3o9lilwQuWZUzDSm
	f5brhgp9cfxmfMI96Ec0FXPUCbpXr12P9RyW2e9u4FL+HYSbHlmY/Nrs1onbFO7bbU/N+djNU10
	7tt+U9Ya07s0aXxejsjusZZwjt1pH2HdmQMITttAEdGVpkDKnGAsjKigHe0AJyWcFS6X8qiWHCD
	M2AUJPyNZtj+GeAwF6JRktCY4wDJy5AzNQ07UC9nRGGGqVIrh6xirDAnTaHjw6BxZMUobMaEhTb
	gcIE9AbtdiDZp4Wz9Kw/XpDNNOubhIrdDFe4G4ahYLvhSrc5NQTLwn+KTneNo+wtYv1WPpSJQ0N
	r7Sr35d7RtFoXdNQO1PTT45oMCfUKa2s6N5F0B6K1kUCtOugnr2LnXtEzPMAZb
X-Google-Smtp-Source: AGHT+IGbo1XB5j1AZbc8YpaGjlVSAXhjYkffwA0Wy0pvZW57g06Q28pknjqN80rpdoFFXjaS85ZT1A==
X-Received: by 2002:a05:600c:3b8d:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-471179176b9mr202388915e9.28.1761212189922;
        Thu, 23 Oct 2025 02:36:29 -0700 (PDT)
Message-ID: <b6016150-4df7-42f1-8f30-82ad214bdc87@suse.com>
Date: Thu, 23 Oct 2025 11:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] vtd: Remove IO_xAPIC_route_entry macro
To: Teddy Astie <teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
 <5bd53445740ba85c8b49d9018b6600fd90eadb50.1761209564.git.teddy.astie@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <5bd53445740ba85c8b49d9018b6600fd90eadb50.1761209564.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2025 11:12, Teddy Astie wrote:
> This macro was introduced to abstract between IO-APIC and IO-SAPIC (ia64),
> now that ia64 isn't supported anymore, this macro now only refers to IO-APIC.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2:
>  - formatting changes

But you could have retained Andrew's ack, I suppose?

Jan

