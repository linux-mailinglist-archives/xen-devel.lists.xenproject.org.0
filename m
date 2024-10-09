Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7B099653E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 11:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814060.1227158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySx4-0007YC-Oc; Wed, 09 Oct 2024 09:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814060.1227158; Wed, 09 Oct 2024 09:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sySx4-0007VN-LP; Wed, 09 Oct 2024 09:25:50 +0000
Received: by outflank-mailman (input) for mailman id 814060;
 Wed, 09 Oct 2024 09:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sySx3-0006qE-A4
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 09:25:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77a3e6c0-8620-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 11:25:47 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c8784e3bc8so9009733a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 02:25:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c920366ffbsm479657a12.73.2024.10.09.02.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 02:25:47 -0700 (PDT)
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
X-Inumbo-ID: 77a3e6c0-8620-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728465947; x=1729070747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lSt1UFZef/+6tCfhe9oUpk8XmMT2KJhBEjzS3rL8n6k=;
        b=MWHWkfcPM2BMRiB1lPl02FA36i12yKDwwKP84aHPb5XGW1rLfN3Wzax7h7ENy/6Wwv
         JPQSAEY9uDmI+r0JadMHT1tkQvbgQu6QyI2sepnzWQ3t8ob/fjyOEssMokVbATDmynPb
         U5jhicG2JhtYedvIPRuv4vrjN0/+VWuSy6H9ABDmbwPNehnIl+eAJeQNGWudPk/GXdRf
         1acxB3fcEYLopEYC1vfn1DWq+vmyvL8F8slWOaig07TGNHCYmT71uwe27FPmJYXPeJAz
         CPoEvIPOXcaI0MC5M2m9T3mTdRcV0+AUC/B7A/Kptca9AiDdw1rkuxE6XIGyBCYTcpN7
         S/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465947; x=1729070747;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSt1UFZef/+6tCfhe9oUpk8XmMT2KJhBEjzS3rL8n6k=;
        b=EMB5IRMrteywyxtyGkO7SOuPX+iSU85cYDn0ZDOZ7x1LXLnsm4FFTjEEabTOpP3Rsg
         +NtUcThLr2EMDVSF3eurjkMlYAxIwSxvAAyzhI/lJ6Txa8VckEtabyKbra9nHa4Xyqy8
         6xoT2DXmNUKg5QarTHZ2UMtU9KBeco5eADpGDjbKCTqhWF6He64qgMPCgFOp1fwOCVMc
         JoOqMQqKsGOeKvPoeJYLGEywL7Z0NWuD05Gz8csLgckmp0wORQiE5hgwjJQLUNnpXA7v
         8gbdJvOVmPdOtPvKcdSd6xtItOvS88p5+9eWmAQhHeD/gV6keLXfkFQXfXoPBHRiNvCE
         lWtg==
X-Gm-Message-State: AOJu0Yw5s+q2T8RODjgnAD2kbHMel6oqbdn7gTf+/STNjpYDILHVwaOF
	25YlMvtA/DVLmlMgLPa8SfzNVYLLY0iPVM+T+beB9Jw39ss3DDYSBguzxrVjmtvJNrugMy76pns
	=
X-Google-Smtp-Source: AGHT+IE9Ma2LvpqfTXUPLh4dG1TSxzztnL8Nx/XBTB6RGQ/Xdj3Z+eujl5DhjMFHvY1u/YRGrVrcDQ==
X-Received: by 2002:a05:6402:278d:b0:5c8:9406:535b with SMTP id 4fb4d7f45d1cf-5c91d5c97b8mr1405593a12.18.1728465947227;
        Wed, 09 Oct 2024 02:25:47 -0700 (PDT)
Message-ID: <d9e2f267-26de-4b43-8a10-8992f6049be7@suse.com>
Date: Wed, 9 Oct 2024 11:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/7] types: replace remaining use of __u64
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
Content-Language: en-US
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
In-Reply-To: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... and move the type itself to linux-compat.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -31,7 +31,7 @@
 			  : /* no outputs */ \
 			  : "c" (msr), "a" (val1), "d" (val2))
 
-static inline void wrmsrl(unsigned int msr, __u64 val)
+static inline void wrmsrl(unsigned int msr, uint64_t val)
 {
         uint32_t lo = val, hi = val >> 32;
 
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -18,6 +18,7 @@ typedef uint16_t __u16;
 typedef int32_t s32, __s32;
 typedef uint32_t __u32;
 typedef int64_t s64, __s64;
+typedef uint64_t __u64;
 
 typedef paddr_t phys_addr_t;
 
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -8,7 +8,7 @@
 typedef uint8_t u8;
 typedef uint16_t u16;
 typedef uint32_t u32;
-typedef uint64_t u64, __u64;
+typedef uint64_t u64;
 
 #include <asm/types.h>
 
@@ -55,8 +55,8 @@ typedef uint16_t __le16;
 typedef uint16_t __be16;
 typedef uint32_t __le32;
 typedef uint32_t __be32;
-typedef __u64 __le64;
-typedef __u64 __be64;
+typedef uint64_t __le64;
+typedef uint64_t __be64;
 
 typedef unsigned int __attribute__((__mode__(__pointer__))) uintptr_t;
 


