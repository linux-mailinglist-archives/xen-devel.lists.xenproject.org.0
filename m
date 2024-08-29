Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7EE963A0F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 07:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785450.1194891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjY7k-0003G6-Fi; Thu, 29 Aug 2024 05:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785450.1194891; Thu, 29 Aug 2024 05:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjY7k-0003Cu-Cd; Thu, 29 Aug 2024 05:55:12 +0000
Received: by outflank-mailman (input) for mailman id 785450;
 Thu, 29 Aug 2024 05:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjY7i-0003Co-Uw
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 05:55:11 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f85b0b2-65cb-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 07:55:09 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5334b0e1a8eso325363e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 22:55:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb112sm31713966b.39.2024.08.28.22.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 22:55:08 -0700 (PDT)
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
X-Inumbo-ID: 3f85b0b2-65cb-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724910908; x=1725515708; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TChNeicFWEvZRxp5rEEVegR0lK4vwAbrXE7Ewib5yl8=;
        b=dGBAL4swy2XlWp0WNSKV9DA8nJ+lI+3T1zhVuExSs8Fseg0jYP5CcI/zgLpSxIoeFl
         zmQIOSijCo1tnaj8tgTfWaBFUMRVz3LkXWOW5t37hQHaoh73sXeGTnz6X5T3LnErRGwT
         qCPgRMd0oV6fENvN0BtJ+OTo+sQYCzqEP0x26euPIYZcrkMmCsyTBkTLkE7wxsqgXeT7
         ObS04OJOoEo72MvHBuWwbQbog9T/7l+3tRPjIThX+KMSQXsy8HS50R9qK61eh3tdcnjM
         cL91bj/l1yrzP92NfEpIB1pPte4yWvAtq/w4SX4ftNwrDs6VfYYX2e3ZQLAOiK8jWnnU
         1IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724910908; x=1725515708;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TChNeicFWEvZRxp5rEEVegR0lK4vwAbrXE7Ewib5yl8=;
        b=T2Cum6PjoQ47BjPfVy+PdmN3T3V9jYHVPCltz/tjueBuzTg1wVq+aS5//7kJ7H+lWC
         mk43Fw3XCsYQgmCucnNE3yrD3LkrTrdruG9PDKMDMywBQQmIQdh+iL0cHploWBvasDnb
         QBzc+9HeG6HdCfvDprwindTm/gdSZbrM5EgB2JngDIBoceJkigOewwMNjdwIXecrziG2
         dFmTxU22eNn/WvgeI4fUiHEz5oHIWKfOoZ3pJhXcZFyz2HPtFRlwfH8VP+mdJIVZryR5
         rn/E67BGQWJ9//hsGraLhG37e4X8mVlm+Oc8zpXScqXVQA8RZiverQwZdnBv5y3hVAy6
         WzKQ==
X-Gm-Message-State: AOJu0YxSOzOJwPyvnjb54C8G0xWPBONeRmP7pAcvESOB0UVA4Le7N4MB
	ppJfSQkvjB4Xo7Vf7vWmKgoDZEgZxlNSaiiaXhLEY0A34QI77XYqkCOFYdebRkuJ7uT0MJ02GVw
	=
X-Google-Smtp-Source: AGHT+IGEZVS9fixFILZZKvdr8rWtiNHg0swOH2e2TQEZMm4TGDdKtU3nb1kOJBXVRQEhLURtF/YeZA==
X-Received: by 2002:a05:6512:2210:b0:52e:d0f8:2d30 with SMTP id 2adb3069b0e04-5353e5be49emr1072170e87.59.1724910908368;
        Wed, 28 Aug 2024 22:55:08 -0700 (PDT)
Message-ID: <9cc9e16d-a4b0-4902-9f12-a7cb337b1763@suse.com>
Date: Thu, 29 Aug 2024 07:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm64: adjust __irq_to_desc() to fix build with gcc14
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
Content-Transfer-Encoding: 8bit

With the original code I observe

In function ‘__irq_to_desc’,
    inlined from ‘route_irq_to_guest’ at arch/arm/irq.c:465:12:
arch/arm/irq.c:54:16: error: array subscript -2 is below array bounds of ‘irq_desc_t[32]’ {aka ‘struct irq_desc[32]’} [-Werror=array-bounds=]
   54 |         return &this_cpu(local_irq_desc)[irq];
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

which looks pretty bogus: How in the world does the compiler arrive at
-2 when compiling route_irq_to_guest()? Yet independent of that the
function's parameter wants to be of unsigned type anyway, as shown by
a vast majority of callers (others use plain int when they really mean
non-negative quantities). With that adjustment the code compiles fine
again.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116519

--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -56,7 +56,7 @@ extern const unsigned int nr_irqs;
 struct irq_desc;
 struct irqaction;
 
-struct irq_desc *__irq_to_desc(int irq);
+struct irq_desc *__irq_to_desc(unsigned int irq);
 
 #define irq_to_desc(irq)    __irq_to_desc(irq)
 
--- unstable.orig/xen/arch/arm/irq.c	2024-06-28 15:56:44.000000000 +0200
+++ unstable/xen/arch/arm/irq.c	2024-08-28 15:12:10.333607505 +0200
@@ -48,7 +48,7 @@ void irq_end_none(struct irq_desc *irq)
 static irq_desc_t irq_desc[NR_IRQS];
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
 
-struct irq_desc *__irq_to_desc(int irq)
+struct irq_desc *__irq_to_desc(unsigned int irq)
 {
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];

