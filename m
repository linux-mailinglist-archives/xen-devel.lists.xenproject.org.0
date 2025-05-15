Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7AAB820B
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984989.1370937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUZQ-0007vW-CA; Thu, 15 May 2025 09:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984989.1370937; Thu, 15 May 2025 09:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUZQ-0007sl-9Q; Thu, 15 May 2025 09:08:04 +0000
Received: by outflank-mailman (input) for mailman id 984989;
 Thu, 15 May 2025 09:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFUZO-0007cX-7L
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:08:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19a78a38-316c-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:08:00 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5fbed53b421so1376841a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:08:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ff8c016a16sm3065106a12.2.2025.05.15.02.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 02:07:59 -0700 (PDT)
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
X-Inumbo-ID: 19a78a38-316c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747300080; x=1747904880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Co3mP4MRmKEmiQSsN6o3xAsOnisHaBVo9FVhf728+hM=;
        b=azE8KtA9QKUC0m4oJ6Rib1jNshyQaEDBuqe59uj+Rj1172ZJtE3qnxWWwHj2I0ah2Q
         zc89CXtXspAwpPIaVsD/3fQb4WJdM217waGgu+xHficui3sKsMRkZCj7BWncVoCUzF7R
         5EzYyr5WOCxucB9qiwReRAywW5SikoEPi6Q6cRIPfAHp5ydQJ2rpORGqwDloZC5jNH9b
         hw0NanmTiw080MApHYP1LqtSqHQBWhYQi1J77EyT/mpOVUnDtrh98ft8RFwYrtwOsmaD
         HAMa511VB0VIeOi4sd10Bj+6KpRktQYBVNuFqDmb42RQqlLKiEu2xRpg5m6kOLKaZrwN
         QMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300080; x=1747904880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Co3mP4MRmKEmiQSsN6o3xAsOnisHaBVo9FVhf728+hM=;
        b=bcViCATDR9KneLG4pDm/Y2QPnZAgMoWvJmWP8shXHOsugn2QvVfRd823AP2GGvTQIU
         9OV/IB2+RBCSAikNClprv3bN5D/MqRh6EoRds81v7cTMG4c9v/CeH7Xc1xg2wYMwSY3D
         gEhu1Ha3Q/uAQ/L5mR9IXJi+DkmYa+5+lk+QQuAeOLhndEFYjOaA8a8692tQpSzXgdAQ
         JashCUs9Npu3u/MCUSPKFXDWffWZNX6Cs4fCoVsr0SV/FjIm6Fd3vEE2BJXaE/V3lhbn
         dKWuExCbZiiC1KujVqtuG58JjVjpWB3fZdyljSumAswxkY6iULdJqMU4eDBgdpw7Uqc+
         HlVA==
X-Gm-Message-State: AOJu0Yxn0kwhqm8Hjy22YdzJLF+dqGvatqWCBnnLFGQL8Hw5yGpL3OV0
	3gxizBdebmduHsQwUqGU6Lu8X/oGWGun+fPejVV2/U2Izo1JNKiJLLjnX/5vww==
X-Gm-Gg: ASbGncu/qSkqVspF0P/mxWl7vsHGhaS7AA7tOvfRg3CJyCrI53LcTs0VQY/Db+XN4QI
	fVh3xYLpwbKBVsVmE9qCFYEaPKWIiZigitLNR3xa4kIZqdIoVKuXFBxgDuVtahxWp6XppkKLg2B
	8U57HSl5mPghl9aBlYfuI4ZGJ4QpPSW1LzlJhhpq7EcZ3gigv/Du2VQi41yc6o6vf8M6D/QdzM8
	HUULS+O90tuT0pDVLvtdp7bhB3cu1zhJ4EKfvGbejHBRS4xvFGDOTaTbj13mEDIYjjZFIUzQa2n
	1BlHi9Ap84SPi6IuYZEiDRfXCfe61RVx/PobM6QLM5CSypV7Rf6kvbLoxWelSxcspQ3OWpGjsvq
	uAXGuoABwWjmSXu2Dws9CMWMoEbJMaLds0X0YYrtS/NeFnWI=
X-Google-Smtp-Source: AGHT+IEirQ+6HDHZKRfQjrQ8v6wygF3uRg2cqPJOKhUK0wqt/pqjJYpNz5nH/Tqs7lLKNJXL6sCkOg==
X-Received: by 2002:a05:6402:27d0:b0:5ec:da2e:6f4d with SMTP id 4fb4d7f45d1cf-5ff988b0e6emr5200531a12.18.1747300080006;
        Thu, 15 May 2025 02:08:00 -0700 (PDT)
Message-ID: <52da0231-3f0d-4470-838c-84705787249c@suse.com>
Date: Thu, 15 May 2025 11:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/iommu: use rangeset_subtract() in
 arch_iommu_hwdom_init()
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20250515085746.43498-1-roger.pau@citrix.com>
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
In-Reply-To: <20250515085746.43498-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2025 10:57, Roger Pau Monne wrote:
> Remove an open-coded instance of rangeset_subtract().  No functional change
> intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


