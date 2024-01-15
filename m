Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F4082DB61
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667411.1038643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO4C-0008SQ-Ou; Mon, 15 Jan 2024 14:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667411.1038643; Mon, 15 Jan 2024 14:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO4C-0008Pw-Lh; Mon, 15 Jan 2024 14:35:56 +0000
Received: by outflank-mailman (input) for mailman id 667411;
 Mon, 15 Jan 2024 14:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPO4A-0008Pj-Qo
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:35:54 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a5b556-b3b3-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 15:35:53 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3367601a301so7611299f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:35:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j27-20020adfb31b000000b00336e32338f3sm12166221wrd.70.2024.01.15.06.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:35:52 -0800 (PST)
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
X-Inumbo-ID: 62a5b556-b3b3-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329352; x=1705934152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f1C+rppgzTNnRF/Pqgedt1f2Tofhn86tPcLKmKXp7wk=;
        b=YnwJhDSb+1aNgogFQq1WXGKeHlsbrHpnIeZbNeTrumTlfNsVRhkFN5fTKHBqUXSGXI
         lNpQlwkXAP7HMwqgdUDEcy54TQqmXHO+BygyJHFTEStzMePJnLVoYJurn8g18Klbmnhb
         jIkeU8FAoFNUce19zOFni9WmXKc+oIOedfrktqWnUZEssKw2XYcb4r1yjhs0HW27esLK
         4gyHLnW9pCFFKwdHO5VTETF/hEKH9uv9NxaHIaowaKEohO6BbnBt4+5bS+WQAx6esMag
         4+5SUCr+69fnwyLKb99wut363TsT/2KQCvVMatL6Y7uP6FdReLLl7iArm0v/YZsbaHdV
         XyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329352; x=1705934152;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1C+rppgzTNnRF/Pqgedt1f2Tofhn86tPcLKmKXp7wk=;
        b=fPvzhtv2tl+IOLqsx+N7MwEzdiikoKN8fmSKNrXfcjsiDv7z5XaRpgwPr5BXz8Jrd3
         wVVyiFkANUGAaQccudGbCBapE/dG9F41y0d0HKcgDpgJTxYZ2Xort31jhaHh23sk81+R
         sCuDTIIrEDNYK3kGQ9apoq4NdIqvcXz4BgfTdGRHuv7i6/JyVrF8nfzZjfUKWsDvQ1BG
         IXUUCPxTLrYcFErk3iR8slbnw6H9gapjLBEDy1fwALI/TVdLZ5ccaIzRm1jbcz+ymzp1
         LjxfFUv2yd7GGG9kXouIlH36XZvZhq6SetvLs73kPca2TyVl25e8+J5uc6n4zVihqF+1
         a6VQ==
X-Gm-Message-State: AOJu0Ywc8wGrRo7ezgZZOKlVMfKiVookNwWUaMMu2j/x4iIMcdHPMbV5
	Bt15rJlZHy5RWFovIbUkCcypygIBmF6uUhGTEGV5tPJsxg==
X-Google-Smtp-Source: AGHT+IGX+tq8xYYgAgp0/quQgemYqyrfWtWcRx5Jibskl1EE2xes/OmGyTSnvJ1B07cd6yi9RZxuMg==
X-Received: by 2002:adf:ab1b:0:b0:337:5c70:304 with SMTP id q27-20020adfab1b000000b003375c700304mr2296044wrc.15.1705329352708;
        Mon, 15 Jan 2024 06:35:52 -0800 (PST)
Message-ID: <bbc1c26a-e511-4710-8803-2b915c750d70@suse.com>
Date: Mon, 15 Jan 2024 15:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/8] x86: also mark assembler globals hidden
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
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
In-Reply-To: <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Let's have assembler symbols be consistent with C ones. In principle
there are (a few) cases where gas can produce smaller code this way,
just that for now there's a gas bug causing smaller code to be emitted
even when that shouldn't be the case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5: Re-base over changes earlier in the series.
v3: Re-base over generalization of the annotations.
v2: New.

--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -47,11 +47,11 @@
 #define CODE_FILL 0x90
 #define ALIGN .align CODE_ALIGN, CODE_FILL
 #define ENTRY(name)                             \
-  .globl name;                                  \
   ALIGN;                                        \
-  name:
+  GLOBAL(name)
 #define GLOBAL(name)                            \
   .globl name;                                  \
+  .hidden name;                                 \
   name:
 #endif
 
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -19,7 +19,7 @@
 
 #define SYM_ALIGN(align...) .balign align
 
-#define SYM_L_GLOBAL(name) .globl name
+#define SYM_L_GLOBAL(name) .globl name; .hidden name
 #define SYM_L_WEAK(name)   .weak name
 #define SYM_L_LOCAL(name)  /* nothing */
 


