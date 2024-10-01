Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0798C166
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808254.1220143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svedb-0001El-Tp; Tue, 01 Oct 2024 15:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808254.1220143; Tue, 01 Oct 2024 15:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svedb-0001D3-RE; Tue, 01 Oct 2024 15:18:07 +0000
Received: by outflank-mailman (input) for mailman id 808254;
 Tue, 01 Oct 2024 15:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sveda-0001Ce-QN
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:18:06 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bb4648a-8008-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:18:06 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c8952f7f95so3115911a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:18:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ad571a92sm928966a12.51.2024.10.01.08.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:18:04 -0700 (PDT)
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
X-Inumbo-ID: 5bb4648a-8008-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795885; x=1728400685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e60l8OM3J3mEWjrRG/wj+VAi+SfyVlJ4UmMEasaEyyg=;
        b=dePLSNEsS96r8zqVwiEy9Rx7nPpg8B0vg/W94O+vRHWxOdjHzKIG47C9P+PnZA1VnE
         V1OBoKM9wET0Cu4TAL9yaHS8vUcDNP/GE+fU8rP+g9AhsGZskQK2sViCcDsZ1UizejTo
         8lQYyhCrWYvk0jxhuYTQwlNGzfIcUMMDyVMFaBJB+4lh6TSE+xYWXIylI4PVv5B7+YyS
         0J2atldS8P+2CsmRWIUkaHXcU5EVTJOyR+qI7WESoxUDedRCjHVtKvgu+/VCnJvE2FuD
         elPKgoSJ+SagmT4ch3Hbz6Xg9fhKspG6yQaPwzfnn4MWSjZfbMeuonEzm/r4G9Pivyb3
         BFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795885; x=1728400685;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e60l8OM3J3mEWjrRG/wj+VAi+SfyVlJ4UmMEasaEyyg=;
        b=gcTfwjw51HTMVOLbwg6Jb1/cuMNNm+QW1/OkfBzAuXzbrxt6lmEH5fAeHjiETSj06v
         dFd/3fXhwYcvbk7B9cleR3g6cVs1D8FShXhjqhD2SaaJM/X4uGBu4+3TCQtMEj4ipdHG
         c738vnTWmMoBSqjv+ibuFEVRa4Puj1Js/Da2VKZGSl2AsQIa+3wBq5xfQwRfeQH8nug7
         IBOHdH8ksGIrthgT84BMmwm4jbmIvIu5IkOfTw8sYyDbaHYwR4osB3AEktFNgH4TTgVx
         Qs/Xg2F/3odnLvI2Wr55TBoGl/FzedyQUyaNTFRmXsFsAnGgajTVm8oS330V6AOOXrrS
         ZePw==
X-Gm-Message-State: AOJu0YzYxkciiLho7Jjtu/1h4R9X0tnz2YfYLCqfcn3Ow3cXm0/Vbd/S
	FlDwKY82h7ThL05CBOxg7OuQb9/wye/c7EzHtAR4jgeRvHWbzwUTg7Goy4QdIuWgkd1RUQanN4A
	=
X-Google-Smtp-Source: AGHT+IGTJBIaSZgiJPEF9LAypFy2KxDlEDBhqAZMPtPgmQ0OlaNYU5UV30P3VinNj93wIdCp46NojQ==
X-Received: by 2002:a05:6402:1e92:b0:5c8:9861:a2aa with SMTP id 4fb4d7f45d1cf-5c89861a5c0mr4560235a12.21.1727795885361;
        Tue, 01 Oct 2024 08:18:05 -0700 (PDT)
Message-ID: <07da5e97-42f6-49cc-8309-5ea64e2d3567@suse.com>
Date: Tue, 1 Oct 2024 17:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 11/11] Arm: purge ENTRY(), ENDPROC(), and ALIGN
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

They're no longer used. This also makes it unnecessary to #undef two of
them in the linker script.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: New.

--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -53,17 +53,9 @@
 
 /* Linkage for ARM */
 #ifdef __ASSEMBLY__
-#define ALIGN .balign CONFIG_FUNCTION_ALIGNMENT
-#define ENTRY(name)                             \
-  .globl name;                                  \
-  ALIGN;                                        \
-  name:
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
-#define ENDPROC(name) \
-  .type name, %function; \
-  END(name)
 #endif
 
 #include <xen/const.h>
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -6,8 +6,6 @@
 #include <xen/lib.h>
 #include <xen/xen.lds.h>
 #include <asm/page.h>
-#undef ENTRY
-#undef ALIGN
 
 ENTRY(start)
 


