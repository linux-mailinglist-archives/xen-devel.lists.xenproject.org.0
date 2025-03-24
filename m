Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA465A6DDEB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925752.1328635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjT8-0001ox-Pl; Mon, 24 Mar 2025 15:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925752.1328635; Mon, 24 Mar 2025 15:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjT8-0001mT-Mx; Mon, 24 Mar 2025 15:12:02 +0000
Received: by outflank-mailman (input) for mailman id 925752;
 Mon, 24 Mar 2025 15:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twjT7-0001mN-LU
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:12:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553703d6-08c2-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 16:11:59 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso20429585e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:11:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43e35sm175001775e9.14.2025.03.24.08.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:11:58 -0700 (PDT)
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
X-Inumbo-ID: 553703d6-08c2-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742829119; x=1743433919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0efqYD186GXVVYA7T8JcMDY9M1tLJwqz6EvCmU/Tl4c=;
        b=CEM39Kya7CbszSAcOI5MD051leDlm7XT6AnOSV1tdDr2p5MirNS6V1+52NHDWCG8MJ
         rivcNXQJV7aIXK7UW0Z5Ac1R6a/dRJaCBxUZ7JBMd7vTpFKJhQQ0Z4qUZiCQj+4IxdOi
         hooVm2gkwTxKn4f9xIvcHMzu/PKSXM/vLMOF1uqUt2lYnOic3ZIjXkwbhLLuURV/K5+i
         oZBLbzG1g269HK0FDISH4JgUz/Yq6sWVFqfd+OrU6COSnIGbZkJR/FFJIjPbViIkvR3/
         u8Qa+O+C/IbdugXdabPjF8WIBNAaPhquJboTMWtgy/yzato2ShxS5j9St2ExAENHkBx5
         TRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742829119; x=1743433919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0efqYD186GXVVYA7T8JcMDY9M1tLJwqz6EvCmU/Tl4c=;
        b=X259HPXBUJDBjPRZWAlVlQuKGdeXD/xpUU08OZbQiNHimUBUUyet/V5pZs0PulGIMy
         lApq8TbMkX0MaB7tQD5drDVHVWajQcUhpaT6vDt6xBrSaT6EM+oqSvJF/o6jiXvpaT5W
         hweAsQctyZd32vIvLtRak6URV3MN9D368RKe7SbejW91umnycxf478fdnhabtSfk9BlU
         nncBRQbBH0pFVxSNEIzOfyys0I5Qi8CkwhkQ3asgTGNeers6Kk5D6/W8+WbftQsnP52x
         O/DM21zmFCPS7rZXB/tqM7zYHX7F6p89ZJMbeGJobKuZAIW/bNH1szpJ3DyiOMhdP6+F
         2Www==
X-Forwarded-Encrypted: i=1; AJvYcCXFdw8E7o1q+ZmSvAFLCoZy/zZDX3a84U/15pr8tIqUYCJ/RaHzxdhGNs5n99n5k0/KPRWVIU5gPCM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx99nOiMEbO/Hs5gZ3mEF58Q8+R9vIco4CGCPQyUsJXsERNnqS/
	2DTzW+lMA8X0wWDiH1i4Mo2NMGOtnpSou7nc8+V1qkY7dE2dPgAP+4n67PA9ZA==
X-Gm-Gg: ASbGncv79f/KZU5ssuCE6Gf+g+ZLzn+xatoiqEdgc3QGW6BJwhY6wx7opYH9jThI/BO
	KtqckpO1HsMkeQA3tjjbImzACu1lEbm4wxxNNXs/52N/xNzhhbOP8Ffb6mZF4H2xUBm9HL9WG09
	7AXyyAEm5HHj4nsCkt/J7ojop5f2LRQQZE+EYdWzcue0kaHVEURqTUmqHHD+4INiAxUVAVmNjNN
	uZFX6fpmxGfchltDEa2Xlm0n4QEKo/8QAUijBg3UZDMU96gG/q20SmjM4rFDv72/Z7ibWc79DHi
	5R2yEH4oE+xoCe5y9Y075Cts6Y6/R6gntG3csgPk+smN0E2mnPW7UbJpnXnFihUm2KwwvKcwgmv
	eXb7HgfAhjWxxTVcHp2PZpFKulI0AHQ==
X-Google-Smtp-Source: AGHT+IEWyQ5FlN5KYZiBYojnkfaGLdN7xn7MIQ9ZfyWLPjnB3cJpkGVMsDwCQ4uWJqZdZT0m88GBFQ==
X-Received: by 2002:a05:600c:1e8f:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43d50a3c4d9mr125810875e9.29.1742829118950;
        Mon, 24 Mar 2025 08:11:58 -0700 (PDT)
Message-ID: <a6010274-d7b0-409f-b9a8-d4dfa0e72974@suse.com>
Date: Mon, 24 Mar 2025 16:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] xen/cpufreq: move XEN_PROCESSOR_PM_xxx to
 internal header
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> XEN_PROCESSOR_PM_xxx are used to set xen_processor_pmbits only, which is
> a Xen-internal variable only. Although PV Dom0 passed these bits in si->flags,
> they haven't been used anywhere.

Please be careful with "not used anywhere". See e.g.
https://xenbits.xen.org/gitweb/?p=legacy/linux-2.6.18-xen.git;a=blob;f=arch/i386/kernel/acpi/processor_extcntl_xen.c;h=eb6a53e9572c137da505a7d4970b1a5b7e1c522d;hb=HEAD#l193

> So this commit moves XEN_PROCESSOR_PM_xxx back to internal header
> "acpi/cpufreq/processor_perf.h"

Essentially you're again altering the stable public ABI in a way that's not
acceptable.

Jan

