Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A7896E71
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 13:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700484.1093717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrz64-0008L4-Pn; Wed, 03 Apr 2024 11:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700484.1093717; Wed, 03 Apr 2024 11:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrz64-0008JX-ND; Wed, 03 Apr 2024 11:48:04 +0000
Received: by outflank-mailman (input) for mailman id 700484;
 Wed, 03 Apr 2024 11:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrz63-0008JR-6O
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 11:48:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 062c1e85-f1b0-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 13:48:01 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-415584360c0so27158585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 04:48:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d59c7000000b003432ffc3aeasm16875631wry.56.2024.04.03.04.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 04:48:00 -0700 (PDT)
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
X-Inumbo-ID: 062c1e85-f1b0-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712144881; x=1712749681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2owOw/yQvthp7c/KpUM1LHw3jB7QZA6ll0rBYGECgwI=;
        b=asj1vuMmhGF8SB/bahohXIfLjTTl4lfZNQPmlKg2MeGSF03i0ds00sWinJAYQL1E1L
         O21ArvYjg91XDd1t255HqMejqUGKcKM5rwplOwENXkKoo7MQGNd7C6A8CPDDJVMES7vK
         mRsUsbXVgyVRitd/pBSOHN4Ubbto6UaUBPBlP1g4z/P8qeflZhiKTI4Snj8RiT15MMUM
         Og+jfHTlVsup3UhpnqIRpV/QnGu0r5572FBtO2q9KEopwUWacF+T577R/1U4naNRQAIY
         GwqMutqT1R2CJozFLjcP2q+/xq6PIesI/ri1qvI1X5ZQTFp2F8Chzmpn82An9dfv5BG3
         +0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712144881; x=1712749681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2owOw/yQvthp7c/KpUM1LHw3jB7QZA6ll0rBYGECgwI=;
        b=o5Sg0eRgpIJxzBeDsTjQbJ/LgDh52iiH6x4xM1JpJ2Eh2r+pMRwesshsuRGu2WGao/
         K5D15UkpWoSdcI1MYJ99vHEUxmK/rcidJ848Q/QD1TIs+qoCxV1vPNPbMbM/cuM0aniw
         Pe4aLqzAS6+AEDmsw6lsMqGLEx9vewtZYxgZmXe8+dzkuxiVvXcCMDaeTt7Zu9+EuwPj
         hXNallRjrSx9jkU4qxEs8bw7DFquN7NsvJ24uT7jBiLFz83EIfzfbhC2IZIy9zhSc9wK
         5LEber0UquEQALvfP2n/pY5SxiqLT+1xN+gRkNlYt5EV9zZXK0IZ9tniCaxE5tgXHbW2
         /yFg==
X-Forwarded-Encrypted: i=1; AJvYcCU1uGMkVztIad6RqPGsv8PfM2qrmcDBpw0ZwcT0CAImxqP5ochtsPS3YWu2KCd73ecqJFBJV1hpcTLy/sfF98EUwqiOuSZlBBxF8UioUDg=
X-Gm-Message-State: AOJu0YxdoiwI3X7RkTLLu3TtHC2hghAdqY2edZbUmTUXIPvwkSOGMTK4
	spRkjdhDv64RklCxJ3yblhIXuE+UDmeseoit93mTf8Hv/3x2cXWPtVoEqPBOrg==
X-Google-Smtp-Source: AGHT+IEjYYResav9CJl9L6T4a8DM9HvcEVDV1+ijBm7uGZhAtZrLpQOBxN2VdqlDFXfeqPsxwjg8Nw==
X-Received: by 2002:a05:6000:1562:b0:343:39ef:53b0 with SMTP id 2-20020a056000156200b0034339ef53b0mr12368756wrz.24.1712144881082;
        Wed, 03 Apr 2024 04:48:01 -0700 (PDT)
Message-ID: <07971008-b961-49d7-8337-df9e1d2794ba@suse.com>
Date: Wed, 3 Apr 2024 13:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
To: Juergen Gross <jgross@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
 <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
 <77d63eccd4906ebbb3a5add624490cc25b2cba0c.camel@gmail.com>
 <34407204-b661-4cde-b88f-461808711a08@suse.com>
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
In-Reply-To: <34407204-b661-4cde-b88f-461808711a08@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2024 13:18, Juergen Gross wrote:
> On 03.04.24 12:54, Oleksii wrote:
>> On Wed, 2024-04-03 at 12:28 +0200, Jan Beulich wrote:
>>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>>> This patch disables unnecessary configs for two cases:
>>>> 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds
>>>> (GitLab CI jobs).
>>>> 2. By using tiny64_defconfig for non-randconfig builds.
>>>>
>>>> Only configs which lead to compilation issues were disabled.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in V7:
>>>>   - Disable only configs which cause compilation issues.
>>>
>>> Since the description doesn't go into details: While I can see that
>>> PERF_COUNTERS and LIVEPATCH may require (a little / some more) extra
>>> work, are HYPFS, ARGO, and XSM really causing issues?
>> For Argo, I recieved the following compilation errors:
>>     common/argo.c:1416:5: error: unknown type name 'p2m_type_t'; did you
>>     mean 'hvmmem_type_t'?
>>      1416 |     p2m_type_t p2mt;
>>           |     ^~~~~~~~~~
>>           |     hvmmem_type_t
>>     common/argo.c:1419:11: error: implicit declaration of function
>>     'check_get_page_from_gfn' [-Werror=implicit-function-declaration]
>>      1419 |     ret = check_get_page_from_gfn(d, gfn, false, &p2mt, &page);
>>           |           ^~~~~~~~~~~~~~~~~~~~~~~
>>     common/argo.c:1427:10: error: 'p2m_ram_rw' undeclared (first use in
>>     this function)
>>      1427 |     case p2m_ram_rw:
>>     
>> It seems it should be included xen/p2m-common.h and asm/p2m.h in
>> common/argo.c.
>>
>> For CONFIG_HYPFS_CONFIG ( there is no issue with CONFIG_HYPFS,
>> overlooked that ):
>>     common/config_data.S:1:10: fatal error: asm/asm_defns.h: No such file
>>     or directory
>>         1 | #include <asm/asm_defns.h>
> 
> Hmm, this seems to be needed for ASM_INT(), which is currently defined the same
> way for arm and x86. Maybe we should move that macro to xen/linkage.h and
> include that one instead of asm_defns.h?

Indeed while doing the entry annotation work (also touching the build logic
here iirc) I was thinking of doing so.

Jan

