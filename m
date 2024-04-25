Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F648B22A2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 15:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712083.1112478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzz8D-00059q-Eh; Thu, 25 Apr 2024 13:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712083.1112478; Thu, 25 Apr 2024 13:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzz8D-000588-Bw; Thu, 25 Apr 2024 13:27:21 +0000
Received: by outflank-mailman (input) for mailman id 712083;
 Thu, 25 Apr 2024 13:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzz8C-000581-Rk
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 13:27:20 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89f97c0a-0307-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 15:27:18 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2dd6c160eaaso11919721fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 06:27:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i21-20020a170906091500b00a5216df5d25sm9503790ejd.3.2024.04.25.06.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 06:27:17 -0700 (PDT)
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
X-Inumbo-ID: 89f97c0a-0307-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714051638; x=1714656438; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTlRV7WBcszPv2Xnx017qV68eEqGTn+7m/P3TyItlOc=;
        b=AlDV2yiD/bxQpIaGgxJ5J7rwY9yfRJXm2YpdF9OQHAGu9HscDn7BeSrK2Bp1rOCga8
         /mAU9yBX54u6ZkVvFq8exz/XzX40jSlY6m78mcBUxp21c8FLQCHS66vUgvbRYX5pV/h5
         ZU/OgkNXIVYUepU8QKiUg6Ww0/NkCHoZSgCdx2+7jdJVnSWWAZlsCDQnkHhSqPuf++EF
         LA81cu1UgJ95xMqYDZVpg/XWtJeBmg7J/bQOwrfZPwGPR6OvtIM7uCBlJZtKQ17gsTLT
         yVmcrBHTymQJZ8zaJFJQkN2uwfKmeIDOa/RTYlvAKU0NCqqMiYdZ6qwbJWBKRhCHl1JL
         kVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714051638; x=1714656438;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTlRV7WBcszPv2Xnx017qV68eEqGTn+7m/P3TyItlOc=;
        b=S5aBxWFqcJK9U5vvRuYtj2BhzVJv6nXVVPpn+LKqm98cXbopWIpBe8k1xH+Z4VCsDw
         z+IPwPHwCF6Oxhfe2NvQlqGIct3Z92RuDjRO/+eLaFHimcz25zGADlW/63Hxad3Fp5st
         2rTQtM3Qo5ss/+ADY1zCvWCgWZ3TG8XZp/hnYSTzMN1Id7Ww+CCw11t01EDWBtPxt3iw
         h/m/FDKs+mLG6jxm29vA4VXSKO/HrIdoT94TFyeINBBdi3NodzRPcwWA1OEBxgUx4lML
         w+fEkvxUGTFbjhvr/X/2PmSHvyu2qchz9983kLvg2Jf9bFtGH6AHekwkpErnpczhnlDO
         NSiA==
X-Gm-Message-State: AOJu0YyGmp6HRN5V0KEAl9dftAPriJkfxel+rBv6idIuTo2E0eTWEhyy
	urG5sSRztCD9bSs6n32ZYrAli7X3BwmmjfRFM0aafmUHRCLRs2cfjsvG07TbipgCyOQzEWY3pgo
	=
X-Google-Smtp-Source: AGHT+IFMZqiHuWkZZI/ZEzrX8/qW0CXkMJlYEqtwzr7xTxqeNKVLFQ1PvBd6Nhh+4yVUksGQKrHcJQ==
X-Received: by 2002:a05:6512:483:b0:518:b5af:5f64 with SMTP id v3-20020a056512048300b00518b5af5f64mr5083335lfq.46.1714051638165;
        Thu, 25 Apr 2024 06:27:18 -0700 (PDT)
Message-ID: <1d787e05-28cb-4d1a-9ea6-696d5005f37b@suse.com>
Date: Thu, 25 Apr 2024 15:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VMX: no open-coding in vmx_get_cpl()
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

Neither X86_SEG_AR_DPL nor MASK_EXTR() should really be avoided here,
using literal number instead.

No difference in generated code (with gcc13 at least).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1192,7 +1192,7 @@ unsigned int vmx_get_cpl(void)
 
     __vmread(GUEST_SS_AR_BYTES, &attr);
 
-    return (attr >> 5) & 3;
+    return MASK_EXTR(attr, X86_SEG_AR_DPL);
 }
 
 static unsigned int cf_check _vmx_get_cpl(struct vcpu *v)

