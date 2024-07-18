Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F64934BAF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 12:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760374.1170204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUOP0-0005Ly-B2; Thu, 18 Jul 2024 10:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760374.1170204; Thu, 18 Jul 2024 10:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUOP0-0005J4-82; Thu, 18 Jul 2024 10:30:22 +0000
Received: by outflank-mailman (input) for mailman id 760374;
 Thu, 18 Jul 2024 10:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUOOy-0005Iy-H9
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 10:30:20 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba28e553-44f0-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 12:30:17 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eee1384e0aso8500931fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 03:30:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bb6fb25sm89896805ad.11.2024.07.18.03.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 03:30:16 -0700 (PDT)
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
X-Inumbo-ID: ba28e553-44f0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721298617; x=1721903417; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxNKuvy/zBGVOu/zcJ7AqOHugfc2mwFTevSCPeXANuc=;
        b=FWsT10KZpydH+7qDTtYlLV0o3exH68tYS4qr89UbiLjW9JbuJLqO85sbT7HPQRfYcU
         hP3Sh8FRFxXyO4Iq0ibrwDnIGrp9xXGeIe0lAWQCFuoqPCxSgco5zLAPORU2MVA1Zsn8
         I34dRxrlskv2e6bSijZHjRLL+adz7HF0+phGHJ5r3XM+ySuBcN/cXmvmBjzSqaR7uH5E
         OhEOWwTuq+9c4EstBI453tIgLL4+ll+XC4c4suRJ0NSJ5cm2RnsmLM0WRw22TsuZzHFG
         LzN4W7kKBSJdZ2szpVgNILKZYg6U9kojHZeDMBhkITeB0fxZ5RNnbhvkKTcpOomPQPJR
         6NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721298617; x=1721903417;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxNKuvy/zBGVOu/zcJ7AqOHugfc2mwFTevSCPeXANuc=;
        b=G3FGSTdZnpLvJ4QJp/qP8kKbeJh0RmnHCw1HeCkKbdTfgR6VKWUfogOL1HZbqrSG4G
         udJ8UriBHpY4eHf4ebMUYC2M8hT5wzliQ9RUhF/pEaL3b+y7ZKv2OZ0AclWTK8rCvYSY
         ZO9Lk3A/2Im4nvuP+VC1SGeS0nOqXQyotJTA2P6BcMojE1yx6S5K8rTwU3mRYcL+gKqa
         hOgLrt24jdxl61iNg69N7eOqL8cVVjwnQGK559Kn3AvV6BfTWwy4tV89865eG6M3m8CU
         zfSupShXAGxOmaPRxfY4M2w951k6LDFgg/tZ0VoM1mGlKJknwCr6k871ltFv3HrVCiK5
         +vZg==
X-Gm-Message-State: AOJu0YxkBucWh1xUYqk+wh4+gAuB3tm2TvIeYPjiX7Lki9a+9pItlfko
	kqPB/RNCYWRZVTFlJu4sIT9GGD44/5I43RAK3pyGxNTik/v4tWGomRDUYgEvtuUawuhbAopWNUk
	=
X-Google-Smtp-Source: AGHT+IGMOuCPcuquFrDjDueuVCU4IJZYrSRLr7YMVWptk0GvKuZpKiHnWtHbufz96/m7biP0Jk3kTg==
X-Received: by 2002:a2e:990a:0:b0:2ee:8698:10e8 with SMTP id 38308e7fff4ca-2ef05c6fd82mr14031901fa.20.1721298617252;
        Thu, 18 Jul 2024 03:30:17 -0700 (PDT)
Message-ID: <f3998ed5-4122-487b-aaa8-8683bddb6e63@suse.com>
Date: Thu, 18 Jul 2024 12:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: drop separate x86/mm section
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Let the subtree fall under general x86 maintainership instead, then also
properly reflecting Roger's role there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -594,12 +594,6 @@ F:	tools/misc/xen-cpuid.c
 F:	tools/tests/cpu-policy/
 F:	tools/tests/x86_emulator/
 
-X86 MEMORY MANAGEMENT
-M:	Jan Beulich <jbeulich@suse.com>
-M:	Andrew Cooper <andrew.cooper3@citrix.com>
-S:	Supported
-F:	xen/arch/x86/mm/
-
 X86 MEMORY PAGING
 S:	Orphaned
 F:	xen/arch/x86/mm/mem_paging.c

