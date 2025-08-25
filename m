Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EAB33DC0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093014.1448599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV9o-000103-6x; Mon, 25 Aug 2025 11:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093014.1448599; Mon, 25 Aug 2025 11:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV9o-0000xo-4F; Mon, 25 Aug 2025 11:14:36 +0000
Received: by outflank-mailman (input) for mailman id 1093014;
 Mon, 25 Aug 2025 11:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqV9m-0000xi-Oe
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:14:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad6f2469-81a4-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 13:14:33 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7a7bad8so579809666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 04:14:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe8d03f94asm87251666b.57.2025.08.25.04.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:14:32 -0700 (PDT)
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
X-Inumbo-ID: ad6f2469-81a4-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756120473; x=1756725273; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbLRWEm1J5ANIdAtHNu87pWZc77qiIAqn0iKwi8Q95w=;
        b=KATrIBPa7UAoosFXOPaAhe31Q7ZQ5UwQVnL2oBCN5NH8ddwYzPj+g8568h1MVfb1Tq
         HfRCWM0Cu5CV1Dx4QOFsIh+PUbRkSRdRvJxg1+A9MZwx20vuqz19R6Lyuvtvt06cT4Ts
         6b2yyDfLfCmUXv+q5UJn+5JScT82wuOmt7IJOC8oMTjgpvoxt1+6A2pXoOLhqN87Wr/g
         KDlis0I1jNrt3c9sA517YCsoJzpH+tiapDfHQIpZJgMhmz0P7IaYgim+25H+7WzayN6j
         zC1g+k5b/6opUJtcv07P32I7DxdFGBKXK5DcEXXjIJoJaq7XrZ89rxMrNRMSQdg124kJ
         F6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756120473; x=1756725273;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbLRWEm1J5ANIdAtHNu87pWZc77qiIAqn0iKwi8Q95w=;
        b=f6u/nOpRldkKasaDqRoPiqaRdaWSxcBx3wgzzljhjwFbjfgRgARR7PNl6yz/VddlUK
         SjLHgJhOByllGMqFwtyS3j/lwbIE37CVOBT0LuKFj7vyrhErs5dUiPSomQ+EVU3/zFFi
         1CoXbmIWYkoHrr4ISU+PKUQpyapIIwOaaHqA3OA+RjIcQD60P5OtE+aep7BdHEcTXRjK
         O9xLEC7Vit6oTSS0Ihx54w5yb+3kbzVEeO7Thj2XgurAtNK1iFqSzlTjkpR4nsvYKgNc
         1WaqSqPZmnH3qaosvaOCHTNiLyLpP7hLmsJr3bjMTAaEJ6talXJ/d4Tc5AK3Pe0X2bBJ
         rA1g==
X-Gm-Message-State: AOJu0YylY90xxISYjpX84q7JimxtX3lOo9nwz/RkYpfqj3EOzhE1BDK8
	hg70BUCEtFBYf6+4RLtUFuYWstCtkFKHcjbUq4BBEez5ix18xQKwbFsRY6TYkOJQJDUXLc4LRtB
	GCRk=
X-Gm-Gg: ASbGncuc/QZ3Im+IiMSGlLkS+pSc8wxByOkUfdmwaueWXA+NUDJS9kTrVVibdqVpC21
	e18WzrIpmme9jOu/XZYTPAdngmGjqBFxdFJUXwOt0wx4kIlncOWTJFHk9GLC8X54b4InZn+382H
	PhSdlj0jNwWT5ZY4Zl5zNGi6Z7LUhflPzCv8d4I1n+d5yj0GxpmZp1+ri3cgdVP4cNp18alvzCh
	RCcQLXQCtL2Dwh88ZnAuQYw33Wo/hPR9htZHzH3POVAjYLRi3adwCavPVTOghXIxDIkHfthAFRT
	VctvOopAPlbU2sfR8H5NLIrAM1wDuIkCp42AhYA5PGAkzUQ8LhSVyzk9yw2jmdiK5oTMn2cdHNW
	0wcYK/c3Fk00Z8K8DzvKsWOPrRi+tZ0oO/TenAZUBrLhirPLEvpO9lNGhdUrOghOIweJapT3rwC
	WFDDm+GwU=
X-Google-Smtp-Source: AGHT+IFVemMjp6hJDSN3OseRfzkfVEKuLo4ppCBKTT1LRmIf3ZRaQofbqdmrfHNf+vJWoSxIvLxRnw==
X-Received: by 2002:a17:907:7e85:b0:afe:94d7:775e with SMTP id a640c23a62f3a-afe94d7797dmr40979466b.18.1756120472751;
        Mon, 25 Aug 2025 04:14:32 -0700 (PDT)
Message-ID: <0ebb4f2d-31b6-4536-91fc-75b5a9aa7dfd@suse.com>
Date: Mon, 25 Aug 2025 13:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm/platforms: fix build with gcc15
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

For two of the headers gcc15 complains "header guard ... followed by
'#define' of a different macro". Misra certainly wouldn't have liked
this either, if these headers were covered by a scan.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/platforms/midway.h
+++ b/xen/arch/arm/include/asm/platforms/midway.h
@@ -1,5 +1,5 @@
 #ifndef __ASM_ARM_PLATFORMS_MIDWAY_H
-#define __ASM_ASM_PLATFORMS_MIDWAY_H
+#define __ASM_ARM_PLATFORMS_MIDWAY_H
 
 /* addresses of SREG registers for resetting the SoC */
 #define MW_SREG_PWR_REQ             0xfff3cf00
--- a/xen/arch/arm/include/asm/platforms/omap5.h
+++ b/xen/arch/arm/include/asm/platforms/omap5.h
@@ -1,5 +1,5 @@
 #ifndef __ASM_ARM_PLATFORMS_OMAP5_H
-#define __ASM_ASM_PLATFORMS_OMAP5_H
+#define __ASM_ARM_PLATFORMS_OMAP5_H
 
 #define REALTIME_COUNTER_BASE                   0x48243200
 #define INCREMENTER_NUMERATOR_OFFSET            0x10

