Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5CA82EF58
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 14:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667753.1039320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPj51-0000sb-8Z; Tue, 16 Jan 2024 13:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667753.1039320; Tue, 16 Jan 2024 13:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPj51-0000qQ-5h; Tue, 16 Jan 2024 13:02:11 +0000
Received: by outflank-mailman (input) for mailman id 667753;
 Tue, 16 Jan 2024 13:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPj4z-0000qK-8e
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 13:02:09 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ea973c-b46f-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 14:02:05 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-337bcaef29eso353493f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 05:02:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e16-20020a5d65d0000000b003365951cef9sm14481048wrw.55.2024.01.16.05.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 05:02:05 -0800 (PST)
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
X-Inumbo-ID: 72ea973c-b46f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705410125; x=1706014925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BK98qVAnVxAXF21+Q0DPOT+50exbV20IPkjA2QEyWns=;
        b=QSQAEabeyVTfmV7LV6CJPF6PLm/iAa+pZ4CdZkK5TpcVC0cmCuGdZXGGKv05xm1zPj
         1iJ+OizeADrgjRDIx3wKzthUGB4bt++byflrT/c8I6HikncGlJZEIdKZibKK98As0M0C
         QMpLYN6gyFYbgpQavmU2IabHW/odv7VoN1RHrciope4bVw1v5VcvQJC1KKQQaDo41a/R
         ANy8QME76MUUiX1mLhJG7sEGiZptDlh7AwxoM8swG2VNuiLgq4P28BEPwSRaSqqJnVlY
         GIGg4lse17sQunbX1Bhojpm5bARsfgfr9/CdUnI7+COcpzgqBXNLFjCXIWKq5iwmH14G
         FT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705410125; x=1706014925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BK98qVAnVxAXF21+Q0DPOT+50exbV20IPkjA2QEyWns=;
        b=r0CZibTzQYW6UrSFqCqLGGU+en71h4FtZ+ELPMO60H/R2h5Q14xHhY0XRrA4F8RzT5
         UHSJoQTHT5wr99ooAbQyp6yqUAVzHBVlTAQqdWpNme9GdT9Re8PI3Ex96KWKQ/Xhcnr+
         iKkWLBfGeG3buOUpAA2AhvSWTnZSdqM4oz79OrYwkfKYVFCVhM0zuJOYOmeJQKiJ1CSb
         Ttn34XxKzY42ktRF4DzHobGYBcBh4Q+BAUUvdkY+hLe1MjMbPvZvaGw9EkCBCdgNPmFK
         bzFInl4t/cGCZFaUsBClbQgYUpS80a0TI932M5UFmfQxYZ19ZiHhsVXsKxQNNHC5m5U8
         o8wQ==
X-Gm-Message-State: AOJu0Yy1Rw9pP6TqK+IiS17T9D0+t0rRslAiX1UYNczFpywHGu+ersao
	eP12CHRmCPYGUh8vLOSAZOhKTqo2njfg
X-Google-Smtp-Source: AGHT+IHYtz6+VxjXSolvJ0IWh+iO/o8wxBTgd3vJ1UX0T1nrA//6hBG4q1vZ+ZMNG5hQJoUjp8a1qQ==
X-Received: by 2002:a05:6000:110a:b0:337:902b:3870 with SMTP id z10-20020a056000110a00b00337902b3870mr3293407wrw.126.1705410125380;
        Tue, 16 Jan 2024 05:02:05 -0800 (PST)
Message-ID: <39debf73-14bf-40a6-8aff-adf086595581@suse.com>
Date: Tue, 16 Jan 2024 14:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuid: Change cpuid() from a macro to a static inline
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240116115838.560473-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240116115838.560473-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 12:58, Andrew Cooper wrote:
> Fixes MISRA XXX

Rule 5.5 if I'm not mistaken; had to look it up for the patch sent
earlier in the day. As to "fixes" - when it's not an actual bug, I had
(successfully) asked the bugseng guys to avoid that term, and instead
use "addresses" or "eliminates a ... violation" or some such.

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

