Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC98AE97A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710675.1110031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHAi-00085b-3J; Tue, 23 Apr 2024 14:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710675.1110031; Tue, 23 Apr 2024 14:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHAi-00082a-0T; Tue, 23 Apr 2024 14:31:00 +0000
Received: by outflank-mailman (input) for mailman id 710675;
 Tue, 23 Apr 2024 14:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHAg-00082U-8z
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:30:58 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18a79fae-017e-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 16:30:56 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41a7ae25d53so14768495e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:30:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c458e00b00417e5b71188sm20409631wmo.34.2024.04.23.07.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:30:55 -0700 (PDT)
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
X-Inumbo-ID: 18a79fae-017e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713882656; x=1714487456; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht0m5BcsURQGqtGmxHJYyEq1YxO5Oc16ttLrmedXCUg=;
        b=WLrwY0vcf+e5IpBMalUfRg1sjQL27ddCzizmJEk2z3UMrNkG+pi/bI71HgNaACkOSa
         hRO0UgTTCujgLHNLhGgEI7+aZaYv93XhNgkiHHfaqAVW6VKHrosQH6h8sky+8C1P85/C
         FoQ/gNTYK9EoXv0q6g7ewKL+jHWOjA7CGJVL5GLVpOR2UK5LZCwF5flek/+wP2W1rlM1
         7wakNNLorPo0+7i+sQ0E71OJ1d+enU7FHAMS/w5rWpSGMevIS8u/BtCC3qo8JZAC96HP
         wQ+6X3B8TvEYF0F8zSEYpTVGrQnnSEIRVfwniYkN217uQRTonqVR/9Pblm20ni1HYvh5
         7JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882656; x=1714487456;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ht0m5BcsURQGqtGmxHJYyEq1YxO5Oc16ttLrmedXCUg=;
        b=Af/rTC5IbpMAziFJdJp+Yje4UgJXHKs+1hsMEmfTmIsXfuFZl08p9Lng7bTUvcEnQr
         /dLUn9L/t23EK291p/HEkUcE5Q87xHHg7WyYxjA8xI7Amm0rZ5wmKaeqUmTUCQS6i33P
         oke/8FUntYDct6zpTlN+1IYq+U0AN9hBLLQOgrNut2FobG6UpW4KN6319Jdh1vMl/EQD
         rY0Bj4iI7C/Hheqhi3WLyRNyFXPDhkIfYfZH3ZM/m2dM8ged8IkBS1O2hIwbGK8Hw3G4
         vE5swM/ZqJc+5C/ivUXR12aZAVHtrYrRJcoYBu7NSuBHF/aG/u2hqRuWkIiCK23OmLWA
         hPtA==
X-Gm-Message-State: AOJu0YyI3UgK0M/+SGSmZZU69Ii2uH8GofYYEjHtMLI6ZKFV9kLq10rD
	8ENG7S/49cn8E1cQIC2GIpC0PCcm3tvUjTTC5g26oBDO0tfnZI3dIuKXCy8qCMmJLk3Ig7gquJE
	=
X-Google-Smtp-Source: AGHT+IGk2hMtL2OOVUi2sq2UFqp423rJGs1Ua7R9nkt0vlQ4skbtwZ9xkHJfL0pEecwim8XuCfAJ+w==
X-Received: by 2002:a05:600c:4ed1:b0:418:2ccf:cbc7 with SMTP id g17-20020a05600c4ed100b004182ccfcbc7mr8710261wmq.2.1713882655848;
        Tue, 23 Apr 2024 07:30:55 -0700 (PDT)
Message-ID: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
Date: Tue, 23 Apr 2024 16:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86/mm: assorted adjustments
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

1: P2M: write_p2m_entry() is HVM-only anyway
2: P2M: un-indent write_p2m_entry()
3: paging: vCPU host mode is always set
4: shadow: correct shadow_vcpu_init()'s comment

Jan

