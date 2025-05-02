Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6113BAA745B
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 16:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974717.1362492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAqxs-0001tq-52; Fri, 02 May 2025 14:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974717.1362492; Fri, 02 May 2025 14:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAqxs-0001s1-20; Fri, 02 May 2025 14:02:08 +0000
Received: by outflank-mailman (input) for mailman id 974717;
 Fri, 02 May 2025 14:02:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uAqxq-0001rv-PN
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 14:02:06 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0756664d-275e-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 16:02:05 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so476211466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 07:02:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cf1sm55416466b.68.2025.05.02.07.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 07:02:04 -0700 (PDT)
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
X-Inumbo-ID: 0756664d-275e-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746194525; x=1746799325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YO5zmwpmbepxwvUEifQhQ9pOCIdLe74vn5s/qdroAmE=;
        b=WFfU6N4p6tlffuxdi1cpmN3GIZVjfGm+tlDPWPrhRcPbK5uLvnTXpYRRfetyeESp5j
         TE1SYe5L91rVULVUzYjukLME9Bx/GSjs0yvP+lIKIlByQFNJakMkOIRE/k724Nh5tYY0
         3G61wyLQyW0/6Cd8dp6Qdifp/c5x6pAifjew3tVBxynVHZyEGaoP8iq/YRMvF+A4aFwi
         heETvFvfiRn+FeOHrGEOT32wHTTn0beSUrW+FZNCcFqZpWOY+8+eo3poUiVA5EDkVLe8
         x7RljGDRoU8FLuHXWCucj5tVTmpb17rhp0saQXCWVqA9jDHz33QuBon0+hWwsHxumh5z
         GTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194525; x=1746799325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO5zmwpmbepxwvUEifQhQ9pOCIdLe74vn5s/qdroAmE=;
        b=RqeBKwJWS28keCMKLLCEALibGNViN7+VnCIq9RQGYtkUIU9q+uDZdWiwgOGf0GWuKD
         qbAraPLl0ZfCXvZSbZqT5zihQtPCJDhIhueoFNrcamAQmJVu2KiUTvsQKOnUBoGlWO9c
         8xxWJKYhu8oi3VAca5Lnt6r2AHPZgiWX4CihescjlyE+IOpcJwbfQe59VJA1MDElDYtw
         4QLKOYjOKOkH2DzXrwWiGdMuLYI9/GUSYCMEbow2W7LSDVSRl3tDboWJmBMPhlkSGAcw
         jAkQBrSf5V0X1uMJk8fZzyY1s7K3iKsFp9AZKPZrxQcYhO0SaPVo3Jd0mHFeyWSzFi7q
         g3ng==
X-Forwarded-Encrypted: i=1; AJvYcCXyJrI5TSG7GCDauFab/LhpSenuBTvtZ+TKm7acFOGirkfXJd4LL3O36Tffvnn5OH4phwCwh4UXWz4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxsIBbz/YYJGu7L7Lrv6Oj4p9Iw1d4ouSpCp5msP9fOQGm49T5
	ORD3DZ4ouHVVMOg1rVnKZkIk1fHirsBUTGGhinLRTGAio/QEeImogQJkLGcZvw==
X-Gm-Gg: ASbGncsPt8jLqNazj0HmU7b4uKT73K0XJYCVPc2Ofr6L+PYrjrjheuXzYHQP9EA71mY
	FrxlX/NHgIa/tNiqMvHmvcAjK/BgZu02gyDPmkQYuTMd1FVuXELHhg9mKAwaA9A3JHnLxS0j460
	K6eySlYN3h0GAUBjbmL8Yq9/JQ8LLMD+RIonCdg2Gd+6sJcWp3o4lC9V9hRW0bvD6JOCjkHqzun
	m9bbKQ77bnZLoYlVPCmZya4iJ2PRRq8nzxsPFQzV1Ge8Kx8s9y/HCWzSJOqsc+1GaQkS2YyRpfK
	5U3CbJVSEEoRhEKeLJ7YhXygf1Hs3kx01CmBC1EKgCZv1dXx1Xne7zk4BLYJ92H9e4H0kaW5YI8
	tj+ACUjagIPHCXbZ2ggqn2+z/7Q==
X-Google-Smtp-Source: AGHT+IHKAlEURCmptFJ+byoO6avNaqN9eGZ3CwX5LSoEA/jRUAids5zcsoeA0shdXCXU4+a6ISVRMQ==
X-Received: by 2002:a17:907:d503:b0:ace:52f6:8500 with SMTP id a640c23a62f3a-ad17aeee406mr304549466b.45.1746194524726;
        Fri, 02 May 2025 07:02:04 -0700 (PDT)
Message-ID: <4f37480c-fed3-48dd-956e-b8d6b29a1ea3@suse.com>
Date: Fri, 2 May 2025 16:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Improve bitops in vcpumask_to_pcpumask()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250502131331.813701-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250502131331.813701-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2025 15:13, Andrew Cooper wrote:
> This loop is for_each_set_bit() in disguise.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



