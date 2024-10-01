Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7E98C214
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808328.1220249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfDb-0005Bi-Og; Tue, 01 Oct 2024 15:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808328.1220249; Tue, 01 Oct 2024 15:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svfDb-00058d-LT; Tue, 01 Oct 2024 15:55:19 +0000
Received: by outflank-mailman (input) for mailman id 808328;
 Tue, 01 Oct 2024 15:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svfDa-00058U-S5
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:55:18 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d910834-800d-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 17:55:17 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5399041167cso4177007e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:55:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2978a71sm731911366b.161.2024.10.01.08.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:55:16 -0700 (PDT)
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
X-Inumbo-ID: 8d910834-800d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727798116; x=1728402916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BjyQZ0fV2393b3M8XEjuSgwsSBhv9Smv8eLNwLejmIQ=;
        b=QxfyhN+4RkV6z/Wf9zmJe6yiGG6cI8MZy5n9yfAxKUW6QMcDcc2a63KJpnvQXAgiBK
         GWpavu5QoGXbbfUByaeHCRg6t5X/c+H7robDURUnb4zz4zISZyHM66pXPsfvbIezAA5N
         TuvOrlHYDHSNJHm/zRnwi6sX9P2fpRCU8pjn9InC92uGGFhyZyP7MEB09xIAArnmSeki
         6XtwGR3xhwrs8bcyBuAWxJJQhR4aDY4Ftvh5ST8B8mn8yT/8ioBz+kpHvhpKLwNc8nIN
         29+Ja+x1XnHUUOwuBCqOmD6sfqzRWlX/Gt6MLt+4NeHY5sBL05cw1b4+Ewhzk9kpiEuq
         UefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798116; x=1728402916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjyQZ0fV2393b3M8XEjuSgwsSBhv9Smv8eLNwLejmIQ=;
        b=uSeIusiMW2zFA7AaNT0wkxLdVX1FbIGY24YfremxkW0LEULeooBaNbc8O08gqENSs6
         s/WShkj/WXKYZ8zqRadiRDg+pL67cb7FScontcGYgP6Z3QxBfeoY5LTIeLyR39gUrLso
         kpBL+wSE2KTwUijBJXJl3yHMOEIhzb/efH5sAF+o3P7JAbF57bLMeIvEwiuSRIdZhSPA
         UJYV5dNcBF4WOkCsB42QfljvNEmbfugQM5+41qSBBHQH3qkVdttr0z5CZUVAbRIhpfoM
         LQhe8L5T+T5CGw2KhtDqtZH5lcvlZYUpECajCretTGegzOBRgpwwLwVJsGIQuWOojcDD
         FEzw==
X-Forwarded-Encrypted: i=1; AJvYcCVbDDwyt1rsNV6ERiuRB8jJXPjrnm0KNqtVxOjCR0fEp8KJcYsaab0o2rUNxuHoM/6QlvcivLvp0Cc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxJomHB5Yw8cj1UHU9JpIE/GC8b3lUjXfH12sDiY9S9wrhNKgk
	DLdc6shkg2+WHIoI2HFy+0MkeutPDJS4pO6C8C50P0++A8enlrPmWpKkZCc8EA==
X-Google-Smtp-Source: AGHT+IFwyjtHXnRyRg1DiGGSpL0zwzOvVyAOqMab7D4uSm/k+1NkKsjCPIZSu2O0llnfGSxVEPWaUA==
X-Received: by 2002:a05:6512:3996:b0:539:8f68:e036 with SMTP id 2adb3069b0e04-5398f68e084mr6819510e87.34.1727798116343;
        Tue, 01 Oct 2024 08:55:16 -0700 (PDT)
Message-ID: <68c8b84a-fe05-46fa-b084-ee4ea601b27b@suse.com>
Date: Tue, 1 Oct 2024 17:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/riscv: parse and handle fdt command line
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727708956.git.oleksii.kurochko@gmail.com>
 <e914d15b82d2a28fcd1690dd68af9a61c4cb272e.1727708956.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e914d15b82d2a28fcd1690dd68af9a61c4cb272e.1727708956.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 17:13, Oleksii Kurochko wrote:
> Receive Xen's command line passed by DTB using boot_fdt_cmdline()
> and passed it to cmdline_parse() for further procesinng and setup
> of Xen-specific parameters.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



