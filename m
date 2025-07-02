Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D003AF1549
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031026.1404711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwPF-0001qi-18; Wed, 02 Jul 2025 12:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031026.1404711; Wed, 02 Jul 2025 12:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwPE-0001oW-Tr; Wed, 02 Jul 2025 12:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1031026;
 Wed, 02 Jul 2025 12:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwPC-0000ib-Qa
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:17:38 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0bc667-573e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 14:17:38 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so3773906f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:17:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da5f2sm12760548a12.58.2025.07.02.05.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:17:36 -0700 (PDT)
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
X-Inumbo-ID: 8b0bc667-573e-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458658; x=1752063458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7gcE9ICgrUlPBGCD5woSZRLeZLOTdIQyX79rN8wCOY=;
        b=S7d2r1Qv+OGD/m5BsL9f4gUfsQPUZ/Ve1rWnw2qa3e6dpu+UdCdvySzuqhJKHgshct
         vZ6cTP6lcfJdml/TDA8XDLTnm6thquMh0G9ykyyZAW0cz0q7iNk9NV+/Pi5X/7vYXna+
         unf82t+uIboO/Bgh507uAAXDkkirdrcFjTNiGOYjen2gwt1QjByOQvKFSjAQITABEXYk
         re8092BhJUeF3tFVnpcuMtJ2ZJxgHy/mTA3vtijk6+mDTO84b0R43OWSsw6MD+QyxDpN
         Iuk52u59BGlXls6hj6Sufp92lrU9MHuiK4VYBTT6RkY+lJJs2/q62dnvR/dhBrmZGMw5
         L/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458658; x=1752063458;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7gcE9ICgrUlPBGCD5woSZRLeZLOTdIQyX79rN8wCOY=;
        b=gRtdNao01nahn3xJhbR02rSX2NdjvwKrdehtcjIxSQRY9Go013RMOEQnYGBoFilPxs
         31WrT0SGlO6Uh4MW4X/soE7J/WMN0terX5Nj582JsyMBNYZ4sqZH8J3JFG9DSzwecIkz
         utb9qnI7bIK+EdlGc/izhYGn+3ZXiC4NM0U1u+jVbT4K94yDDcyV7rF28EPpa8ScVtrM
         A9jwI2KGLMJmWzZFUz0dpv6RhAMjZHW1K1eKeufj0I338DfmkymsVdif658qDPd5r9TW
         B1wEpDo1VuXSuHm8XF0TlZJH6FR3xoKvvpQEyzyQ5qbAqzDds1O9mZJiBX1TUjKSLg3H
         koRg==
X-Gm-Message-State: AOJu0YwNk9lHb8/SsaLKwyRgmMGfHf3hxf4Lf8TUkdZ5FTqGaJNxrybe
	IVJl8tyNHMfRyI7HrSUmv7GCTRottTiRflMImsfCcYmQWtCGm0/g6C+sf00OG7+0LAsu8/mrW+h
	zeu4=
X-Gm-Gg: ASbGncsHlAIKVmR8a5ZpD5M2B2JS3xHXjTKRO/EqpxPLnyqVxxsFEMeuXBw7p01M3xd
	HKtbEmKE54SaVie+zZcOBVrhyvmS71ZejyxpIqjmJvbeTLZQaWfm2QOetfcr6EifKDNBdoCjMOe
	bt95Hae0NvkbPZFi0IA+pBqd/9LHwCT4QHjNfJL2qyJaeMUgpxTSYa1+YotbYnrazpn+ZY3eBLG
	cYzQq4BG9ovvyxOL1Ae1XNKhorv0ETghqTEIwdCmIhppdBeuIbbVUp5+OxBSc9Plcp8jq5zZ/uo
	4QHBFDdwUHgwKO6rfMpggkxMstkAIcPdxu5RGjytzdzORNfQLoV2DqaLzAHmv1dnqLtKd8lxaXA
	H1OveA0WI57YReCTW3dYXXMS9Lu1OlIR8/DpfsmI2hnSHopc=
X-Google-Smtp-Source: AGHT+IHzoH1tP4FyHzzh7758qKumA1283hbOfoPr+w6nt2GvdfwYzadlKiKpp2QZHERG0VmVfkf8ig==
X-Received: by 2002:a05:6000:481c:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3b200e29fe0mr2111662f8f.47.1751458657562;
        Wed, 02 Jul 2025 05:17:37 -0700 (PDT)
Message-ID: <7acea351-2a87-461b-9423-e157f1850450@suse.com>
Date: Wed, 2 Jul 2025 14:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 5/7] x86: control memset() and memcpy() inlining
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
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
In-Reply-To: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Stop the compiler from inlining non-trivial memset() and memcpy() (for
memset() see e.g. map_vcpu_info() or kimage_load_segments() for
examples). This way we even keep the compiler from using REP STOSQ /
REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
available).

With gcc10 this yields a modest .text size reduction (release build) of
around 2k.

Unfortunately these options aren't understood by the clang versions I
have readily available for testing with; I'm unaware of equivalents.

Note also that using cc-option-add is not an option here, or at least I
couldn't make things work with it (in case the option was not supported
by the compiler): The embedded comma in the option looks to be getting
in the way.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3: Re-base.
v2: New.
---
The boundary values are of course up for discussion - I wasn't really
certain whether to use 16 or 32; I'd be less certain about using yet
larger values. A respective Linux patch [1] uses 256 ...

Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
for known size, properly aligned blocks is up for discussion.

[1] https://lore.kernel.org/lkml/20250605164733.737543-1-mjguzik@gmail.com/T/#u

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -58,6 +58,9 @@ endif
 $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
 export CFLAGS_stack_boundary
 
+CFLAGS += $(call cc-option,$(CC),-mmemcpy-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+CFLAGS += $(call cc-option,$(CC),-mmemset-strategy=unrolled_loop:16:noalign$(comma)libcall:-1:noalign)
+
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
 # and various things (ACPI tables, hypercall pages, stubs, etc) are wont-fix.


