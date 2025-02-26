Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE53A465CA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 16:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896898.1305646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJoL-0000Yx-V9; Wed, 26 Feb 2025 15:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896898.1305646; Wed, 26 Feb 2025 15:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJoL-0000WY-Rr; Wed, 26 Feb 2025 15:59:01 +0000
Received: by outflank-mailman (input) for mailman id 896898;
 Wed, 26 Feb 2025 15:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnJoK-0000WS-0v
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 15:59:00 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 965b7f06-f45a-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 16:58:58 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso45267815e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 07:58:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e0eb15dfsm207706f8f.43.2025.02.26.07.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 07:58:57 -0800 (PST)
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
X-Inumbo-ID: 965b7f06-f45a-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740585537; x=1741190337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M66Vkch3UZkoaa+cT+2LLFfqgTMdadG46WzK7udubTg=;
        b=I5k/4avyYfIBdhhCC6OYKaBY9dPPMGtEz9TLqJV9kZbWG3Ghsi8Su4yEdrVgnfLGbQ
         FCdJYwOqdyyoVRkNeRH2YYQbWxJ4j/FiCPqFzDaiAEddzWwpchzJ9kk4ysUmYSZ7oUMV
         8HQrwv/DEknyMIGoU9cnwj9zUZLN+AXRD1onPkyiMyN4BL1ArekwElVgy/O44sIDpAFb
         DOq+Ug4hgjENb4+CryckOwmn2LGjwem8140DOky+U/OSaJ2QVqJobYFLDBOOBnUxKTqq
         LOPNj3va3WXlYuCYbcxj/wkM6nHudAbltuK5EnfJTFjyzvZcYz9nynaiYGrKK8xaCkdu
         waog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585537; x=1741190337;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M66Vkch3UZkoaa+cT+2LLFfqgTMdadG46WzK7udubTg=;
        b=QuEnH1/zvhdFcKSK2tf7asMEgdswkM/cqH4BiDbQFVi5J3oVOk7kgaIExTt96LqAbA
         jn0f9fhETp6d9lxm39AG8v06yag1n02b2ujE0VXnWLHhwVUqR06j64xjYGOZVjJf9EAy
         Zs+qRwWX0hdKMMGfNgHnY1HF+vVV3l05apH6LviJG5u8qUXv08LrZvthyYdqdU1DzYyd
         fEUP0RriyJFB08JbDgKkHwnLXvegPGYgzyhZvSOB7hpjRBRdynvkzoQKnZq1u7URI5lh
         KU0ezobBkmxOw2F+usrGymR7ywCKVFO6JaLRJOAEt58in3KhzxO/54h420JKqywfq4Gw
         ffpg==
X-Gm-Message-State: AOJu0YzE5oEB8nJWx5Ckxx9uXeEOzZYO5zOg7B6Hp9GaQZgRTKDZOg7W
	WP2k7G1EHkiQPsbj/WEnLnmAaAEZUN6yGDHUIK4afEBTwSbQVjiEtCXYpspAtNWwSwPNzpumkTU
	=
X-Gm-Gg: ASbGncuLNFTFuUsMW0OkANJQRsGdQM3Qjk8mcU533Cnk7Gb6CsWibHEZblUSkQ2Bp+S
	G0MdVRNm5Bqin/uQZBpKXr2vaVcREsOeHwqr3dx72+rBSYNJIKIuCcz0YhAWCK4syytEFkAdDG9
	b5GLOpJvKq79hdOL/MtvuVUhpZauPSAY7FUKnck1JqCc8Z0+511oHyfDCJJV8mt4kDetgCP1jU6
	ujAzeG6C8TJYWbpkqvk0RbFTAkm2oxytFfXc5sn/c0apoSZ0p+ylZ/fG1YzY8mrrbeDD2G+KFgf
	62wKAuEow1RJQo4RKp3P+OvjFfCvnYahgHamSWrpmArmDms2lbTkTzdNpExOuYE+j6UvumQBdLb
	wqNT8en9OZIM=
X-Google-Smtp-Source: AGHT+IGNtYkzCNs/wBGXXLPI5Zk1x5Po65lAQ9OhVkDJ7d+G36ZMD+5JTxXdW7JbkruVNr4rQKy/zw==
X-Received: by 2002:a5d:5888:0:b0:38f:2b54:874e with SMTP id ffacd0b85a97d-390d4f3bcaamr3327949f8f.16.1740585537326;
        Wed, 26 Feb 2025 07:58:57 -0800 (PST)
Message-ID: <e09dacac-b673-43fa-9a1c-3a3a5b5d802a@suse.com>
Date: Wed, 26 Feb 2025 16:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 0/6] (mostly) Arm32: add/convert entry point annotations
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Language: en-US
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Besides the (now) last patch only Arm32 adjustments are left in this
series.

1: Arm32: use new-style entry annotations for library code
2: Arm32: use new-style entry annotations for MMU code
3: Arm32: use new-style entry annotations for entry code
4: Arm32: use new-style entry annotations in head.S
5: Arm: purge ENTRY(), ENDPROC(), and ALIGN
6: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions

Jan

