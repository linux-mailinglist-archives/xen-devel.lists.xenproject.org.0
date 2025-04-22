Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9128BA95E12
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 08:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961669.1353019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u772a-0001ow-0e; Tue, 22 Apr 2025 06:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961669.1353019; Tue, 22 Apr 2025 06:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u772Z-0001mI-TI; Tue, 22 Apr 2025 06:23:31 +0000
Received: by outflank-mailman (input) for mailman id 961669;
 Tue, 22 Apr 2025 06:23:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u772Y-0001mC-23
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 06:23:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 464c59ea-1f42-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 08:23:15 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so4657771f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 23:23:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9e6csm164685085e9.1.2025.04.21.23.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 23:23:14 -0700 (PDT)
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
X-Inumbo-ID: 464c59ea-1f42-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745302995; x=1745907795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=70iTuBy0pAYM6hB/WUqWVv+V12glWn8GNi+sHtRdTU4=;
        b=G9LoNtjUSpwWlrGFKXu3+rSauOMLTBTOgd1lc5hIcWDnwJAwvNoZGApnwsrsdxLydZ
         Oy5atQHIJ+kxK9CDbn178K37cTvoKmcBWIq2SBGwNuzB9SbdJUXMHN5eFGUWugee7+QK
         xBvlKEpTJ/YX25vLCgOA0jFuKZLCCsUng+tbtA66NBAjzuGN0/oyh+EAe9e/gzSd1Nek
         T0sE1P1tKJEJ9t1pHsViuFjJnfEPiQu9KvHRbSHdak+TqNa47qkC+o0/ChQLaHadkBfc
         IoWoZbD0FhGIsmQTDSWYQV0PHWczuvLL/gA7MNlClyLu2dSG52WX8laYhUuFhoFRpy9z
         zdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745302995; x=1745907795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70iTuBy0pAYM6hB/WUqWVv+V12glWn8GNi+sHtRdTU4=;
        b=ebmir3vwididl6VFgJuLUM3K+Egq0mAeJGmIBc/whP6mN/DIxUgJWm+q8sM9+/Y/RI
         /bE4sWSY33UE7df7icbnZWHUA53DrxmS4ydmDr9lOfdyPdV+7uMUDr6Z+PCKwzE3+Okz
         2rT3qRTVdv5paBeSjqJOdQDjxH0da1LWarLDYRu4Sp0WWdc3Icv+Fck7TrO9AY45hBMt
         YqqIEkNJkAD45cu64ZO0sNCcytmJdddi3q03eSxWmfFO1I18k484/qhX6KiIK3B20e0I
         ZZC0Ry4S5x+tJgXcxB6/0Nak9m1NFNTsewAsQJjhUeHRSq629l0utMS9GMwZxMdFnSJQ
         vmrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzYOKVEs5Mz8kqzDDcRVx1zPHidbdCBgAqO46ExMs397dsEbHjLz+28QLgMJwT/3R1yu7hnPCXCMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyyYvgdcGj/4GqrbF9qS/JWuFAONSPEX0zXsLlX5EfaI42HKuL
	vUpP5xPEfF9O1XWSelcw4JIp11IgcMXAFZk+O9SnRFF/jCLjCWnERtzd7UPFRA==
X-Gm-Gg: ASbGncuCiHGpzjyCQ+W7SjtPdWQFrj3DzCSlTpsRGTK5F3CpAUQpKblTsTffaR/nMbl
	3XP9IL3LMRA7GUQ1T0Nn5X9xnYyN8kJ+pRYomGx47gVsFdbFrwO8fDe5xGqAt12MHccZbzVw+AU
	7zHlGzllP2WkHUCKmSkEeNAMBbmZ+y4UhbbRsiNuaJ6UGxFGNXJRMZ2gcRAj/rudjlMwCVognEH
	S//CCMf/OwlPNGEtHi/t3QgZHaLAQA4ZBwvPc4wq6LYfMDQuAkTJvUvmqGSHPhmThT4ZLxZKvoN
	6HNawsKf7sn+qvtvKJ103G2YSAGeGly+U2IxPuHyxHEFMJ6E0Z6Afn86S55XL+wykNE1aEh9Mpb
	N9o3UbwdSKjmgf2pMra4YOwGutg==
X-Google-Smtp-Source: AGHT+IFCIBGBhxPLv8dW7GkDdvIwAOboZFXvqH+TtEz3xJDccozhcZtBcyf4WpLOLFakS1odw/yIww==
X-Received: by 2002:a05:6000:250f:b0:39e:f51d:9cf9 with SMTP id ffacd0b85a97d-39efbb01f56mr11015184f8f.48.1745302995209;
        Mon, 21 Apr 2025 23:23:15 -0700 (PDT)
Message-ID: <f1266283-7166-428a-a4f1-e260e60f70fa@suse.com>
Date: Tue, 22 Apr 2025 08:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] compat/memory: avoid UB shifts in XENMEM_exchange
 handling
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Manuel Andreas <manuel.andreas@tum.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ffd8f532-6714-4f56-a358-71ab580202b6@suse.com>
 <ebae7fb0-382c-4db3-a37c-db458af3299b@amd.com>
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
In-Reply-To: <ebae7fb0-382c-4db3-a37c-db458af3299b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 18:50, Jason Andryuk wrote:
> On 2025-04-17 10:08, Jan Beulich wrote:
>> Add an early basic check, yielding the same error code as the more
>> thorough on the the main handler would produce.
> 
> "as the more thorough check in the main handler"...

I had already correct the typo ("on" when "one" was meant).

>> Fixes: b8a7efe8528a ("Enable compatibility mode operation for HYPERVISOR_memory_op")
>> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> With that:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

Jan

