Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582BEA78ACC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935316.1336733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzu9r-0006Gf-18; Wed, 02 Apr 2025 09:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935316.1336733; Wed, 02 Apr 2025 09:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzu9q-0006DW-Uv; Wed, 02 Apr 2025 09:13:14 +0000
Received: by outflank-mailman (input) for mailman id 935316;
 Wed, 02 Apr 2025 09:13:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzu9p-0006DM-B5
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:13:13 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3a117ee-0fa2-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 11:13:12 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso5697939f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:13:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66363fsm16914518f8f.36.2025.04.02.02.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:13:11 -0700 (PDT)
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
X-Inumbo-ID: b3a117ee-0fa2-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743585192; x=1744189992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LdnoTxTKSF7fSTh0u+R4IIHdHncbHjgjfzFp4UydAQ0=;
        b=Zw3vXSFGhDmINn10NM/pq5Vji2CKQxUtpXfaMDSNAgRa+w6CJtyAJcE7pfT8KSKQ3Q
         V7IERl3BT7OsCaTGMarOEZ0i+lsPfT+cLaRtE/l3TjlApr+ViJL2VWbL13pGnQpFBazq
         6U5wFpWzrNv+6YajyYjcYTEX12gJ2l5cLsyvvoBiYBoBp/3E8CAvauWukQ+bXrer7jxv
         NF4Sl5VC4qD02kHSjsTy5+Kxn/bUs+AdTPHXwHlnM7Epuxk4jOcR/j5QbiRyCC0KJIlL
         n3ROTln1I+eoyDr+1zd3p5nBnENPmFMowJvzMdK/yxWHzNzRlSOGx4OldYWsRP/CaBkV
         a/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585192; x=1744189992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdnoTxTKSF7fSTh0u+R4IIHdHncbHjgjfzFp4UydAQ0=;
        b=iv6DZR/Lm7OdiSj5yFEzSZGW0lkupnVZuOlOyy24nPq0nEX+MOjBdEBGn1YT5SzLLk
         /BFOiKOwN/GciEU4Xdr/0CvGZmqrK79OhxvDs8Kj9+kF9AYtr1tiflyxk+7xfM03u925
         co4p7Dky9BassQzYsaE1gurDM9jyQe/b+anfkQwtSZ89Nusrbm17kIJe+K0tqpGKGDkL
         YjYHAXUzKMRpHXlw6dwR9U+mnGIjzsAQxjRf+ncwEYge3bDaEFpCxFrVICL8kuicEVtZ
         844XtdabO2YBCubQjZynAWAk33qSUR3RFoIJm41wTm118094dGKXMlJZTj11aVcxvI6f
         Ycew==
X-Forwarded-Encrypted: i=1; AJvYcCXCS1wd472BxWzrI44POZP26N87oRGCEF4vqfJbWPe6vY5z+T/nBCLbPr67NqsjY+T8kbzYEFs5XXQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi7JuOHoH/kk63EufvORJigBMZe211pnL8P5cdwUzFvqPCp6IK
	HO5fa0axuG3e9Jt4UlqHpU3DU9DcB1QpzMqf9oC0pyG7JU+Pk60LGIjUjE1vfg==
X-Gm-Gg: ASbGncuTKVBmEMaOxW6JJBuPDQR+cN/BI+QM2o7987yhJHoqYwTHUIhQ80F/EHmA0Cl
	xTdKVwy9kbfUtcwLWkVquN+DnwgMcJ8JL6wqPcXRfNvkboUUB8dBEy8Rn47kB+p0S/iVPHsLS/A
	I2H6HK/hrm75hL2bpN/1HD0ficaXPYyg5kgfl0eMP3U9S2b8veUO1eAIglN6WolVBQqzMjbU7F1
	GRC1lzdhAOalQHmc+8D2BnbWMJ6Yuaoht6TlEgWGc/sq4/vm6A46fh5Dk1tpe0eViZMu+OAItb8
	17Iywu7x31MEJmUj34OcfX64rLHR1zWe4mZKhum27ZzNNDddPfEOfp0fGplUDXhQoMsPouTMAjv
	0kwjLyloTt+WP7KjcdGB0F06U6NuAUQ==
X-Google-Smtp-Source: AGHT+IHtyy3OsNBWilkv4NusLAIsg9/dJmuo1yuVQ6WpForVgWE2tTeTCuEyizqmFBnFbRLtGhsHRA==
X-Received: by 2002:a05:6000:401f:b0:391:2dea:c9a5 with SMTP id ffacd0b85a97d-39c120de319mr14307966f8f.20.1743585191660;
        Wed, 02 Apr 2025 02:13:11 -0700 (PDT)
Message-ID: <4ec15a0b-7fb9-4722-8ac4-ace83eee74c8@suse.com>
Date: Wed, 2 Apr 2025 11:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: mpu: Use new-style annotations
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250402090229.161177-1-michal.orzel@amd.com>
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
In-Reply-To: <20250402090229.161177-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 11:02, Michal Orzel wrote:
> When purging old-style annotations, MPU code was left unmodified. Fix
> it.
> 
> Fixes: 221c66f4f2a4 ("Arm: purge ENTRY(), ENDPROC(), and ALIGN")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm sorry for the oversight. I had meant to do a last-minute grep before
committing that patch, but then forgot. A tiny bit to my excuse: The
introduction of MPU post-dates the common-ized assembly annotations by
quite a bit. It should have used new-style annotations from the very
beginning imo.

Jan

