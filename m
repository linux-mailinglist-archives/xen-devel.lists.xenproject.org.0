Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC007A68B60
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920308.1324518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turWs-0002Ku-NP; Wed, 19 Mar 2025 11:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920308.1324518; Wed, 19 Mar 2025 11:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turWs-0002IA-Kd; Wed, 19 Mar 2025 11:24:10 +0000
Received: by outflank-mailman (input) for mailman id 920308;
 Wed, 19 Mar 2025 11:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1turWr-0002I4-96
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:24:09 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac6c4a86-04b4-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 12:24:08 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso4245395f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 04:24:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d440ed4cbsm15956525e9.34.2025.03.19.04.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 04:24:07 -0700 (PDT)
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
X-Inumbo-ID: ac6c4a86-04b4-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742383448; x=1742988248; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lJcoUHWqnM3NSVKjJ6tVIHs9P0zRrAN19d3SqBB1EE=;
        b=XE9sUgT0uyxLZtsDqU6sL9fAGNiu2rSe+ddqP47Lk8jemiz4/HPRu19F9+ZqIBhzwd
         NBAkzX0pOROBia6gPdyL6wQ01Kd+JqTxvxz69JVZ6BUhS17vIyQYrMfYCvrE/3F3hNgH
         MxMJ2AVJkWFGgQ/BGmAT1FVtWByo1rotF9GIsP4+8uLGJ+IAUTrWW6sbQyTEgFbkXbjv
         Mi6/4S+YaxebZdhW3CKpPRQAR+p5jtledflpoG1crD+ZVwXfzV1Tu3B79dTPj88Tku4I
         QZ1TENGmFl3ZlRRrAUUV9eUnamvZ4gwESBTq5c8Jp+J4KX/mICLsqMaUZmljG9oRrWsa
         xv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383448; x=1742988248;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lJcoUHWqnM3NSVKjJ6tVIHs9P0zRrAN19d3SqBB1EE=;
        b=PuWocpfOdqZx7I7JyHNZ54Cg0aTZtG9i6fk1jBQvkWcsZxzThmiJmaymlvbJuh+8ks
         +nMutHHvNTfwaqxfoCBpJI7ILhroU+HeEDj9bVKkSTuQjjOkTkt9MvbpbI62CHieGW7/
         RWr/KllrffNf0Hn+03v4ATTYrcPQNBhqP++CdS3tfMlh1gDULIN2pQ/0yfZujbcDLETl
         31R5ATt3332m7UB95CrDVHN6Pk2rsm3kOrHYIHaUXsSxVdkJ7r7fgGKeiP7ZKjiq3ppM
         E9tu50+2temUIYcrHvUGsg3+jRXtmDyPcWkTYVvNCeigDnPNqjtPqpYHWRfXdCGQUtNf
         NUKQ==
X-Gm-Message-State: AOJu0YzgZXMt31RvKeWMk1fRqsQRuamBhwHwtMmBPGPkriZYzG13JzGF
	CZqIPNHdl739H96G90W68xaAwCWJh+/Hn5vrhUbIhoBpR4glzRf5swyl4IoNOWKLQbPs/96nZrU
	=
X-Gm-Gg: ASbGncuhBbN389isc2g21AdGdXbTN2FyGo0WrwHHNvcvJdntJ2xCA3b/YbN2uAShb6S
	03RLbcKjVlJv4e+pOiA72P+Uhz+qNTGRgILfgSBtX4mVFr1+C+q7L1szGSXn9UaA7q+fq5jqR1M
	FPIJEqgpW7QtT+wb487o3MQkTizfJ6mG9SfAwKksp9zeOgvoApcDbrMf7Fr5bmRXL8LjNmn5L+n
	/5RTMI7JOrQwCDNKEEmcaph9SSIsKF7ZmHny6YVnGvocozccuaJoESnGJO5JkEAqxy+vKfFjFUT
	aDZEVmXsG62NcUgqW9U//mM6XtvtihiOQI0w+zuJlnt9Pan6+s3XVJrAhHknr8Sqi8XsUy8p5wP
	rJQLSFst4YoYWI4eqo6EkQ6M/dps/UA==
X-Google-Smtp-Source: AGHT+IHSOyG6pieQTICne3Nq9cq4lLzDGUFvGMppWIdEGBoXRo7PtXGHkjKGdprU86ytC0bv+/QC3w==
X-Received: by 2002:a05:6000:1a87:b0:390:fbba:e65e with SMTP id ffacd0b85a97d-399739db618mr1899265f8f.32.1742383447690;
        Wed, 19 Mar 2025 04:24:07 -0700 (PDT)
Message-ID: <190ea0fe-887b-44dc-bf05-db154f26a03d@suse.com>
Date: Wed, 19 Mar 2025 12:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/cpu: Validate CPUID leaf 0x2 EDX output
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

From: Ahmed S. Darwish <darwi@linutronix.de>

CPUID leaf 0x2 emits one-byte descriptors in its four output registers
EAX, EBX, ECX, and EDX.  For these descriptors to be valid, the most
significant bit (MSB) of each register must be clear.

Leaf 0x2 parsing at intel.c only validated the MSBs of EAX, EBX, and
ECX, but left EDX unchecked.

Validate EDX's most-significant bit as well.

Fixes: 1aa6feb63bfd ("Port CPU setup code from Linux 2.6")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/20250304085152.51092-3-darwi@linutronix.de

Use ARRAY_SIZE() though.

Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1881148215c6
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't really convinced that we strictly need f6bdaab79ee4 ("x86/cpu:
Properly parse CPUID leaf 0x2 TLB descriptor 0x63") as well. Thoughts?

--- a/xen/arch/x86/cpu/intel_cacheinfo.c
+++ b/xen/arch/x86/cpu/intel_cacheinfo.c
@@ -186,7 +186,7 @@ void init_intel_cacheinfo(struct cpuinfo
 			cpuid(2, &regs[0], &regs[1], &regs[2], &regs[3]);
 
 			/* If bit 31 is set, this is an unknown format */
-			for ( j = 0 ; j < 3 ; j++ ) {
+			for ( j = 0; j < ARRAY_SIZE(regs); j++ ) {
 				if ( regs[j] >> 31 )
 					regs[j] = 0;
 			}

