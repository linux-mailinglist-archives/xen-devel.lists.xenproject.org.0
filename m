Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45EADD3B6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 18:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018320.1395219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYkH-0007R5-1m; Tue, 17 Jun 2025 16:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018320.1395219; Tue, 17 Jun 2025 16:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYkG-0007OW-V6; Tue, 17 Jun 2025 16:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1018320;
 Tue, 17 Jun 2025 16:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRYkF-0007ON-NM
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 16:01:07 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4683e42b-4b94-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 18:01:06 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4881352f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 09:01:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31c1b48c69sm887321a12.31.2025.06.17.09.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 09:01:04 -0700 (PDT)
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
X-Inumbo-ID: 4683e42b-4b94-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750176065; x=1750780865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ulK3xIt+h78Zthsg3MeayiU/GOWMs3yPXN88/YiK/8M=;
        b=dX+60u4LpyCgl/JljXPSdAFq3KawB5eFiH0qRGVKHXc69KQcQBiRVpyjmPVAXVtdmI
         BSbF79J/8EVDm4fNwPolXqBwsRGhBJKOooLc9aHyVGydyPfTCN+u38SJSwHb5KJQOFQB
         aaPt92Qwfv9HHkVuo75F2f8Y+F+mU2VAC0woHLylnzYCfeJvqiF191aIGnmfqEW8JAKy
         BN3hUq3ADb0bNEUpBRnFlOGKN+Re1OWUWhwxtoq3jl8XQGCPrkDgLBCN6VM83liyCZuK
         owriRjuWm1LSKXT6sKwbPc53pygW+Te9dKVFn38naAffNIH/99AKUFXwB7CrWeTsqQt9
         25Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176065; x=1750780865;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulK3xIt+h78Zthsg3MeayiU/GOWMs3yPXN88/YiK/8M=;
        b=dnfixQVqRxugQqYJf7/7UVg4OjcjJZBSSub4U/2jFZgSVZ258oGNnnUbu2iayVSxnt
         AWdU9OzpW1NdKhy+8RS91O2OpQRb2M9FxmgBGPiLRzNrhG+cHPUDtGIzqN6LXSR8irPm
         rhHw8Q30OrAE4iOS8BVc7tL28B3auhG5mews1EeJxKj78bkBDLXrdGjqEKw1/lVzFzv/
         M8Lx4XZgup7Ys4ZlflwJ9DdC+n3jLXxJYZE93jgA/ahlqw/16nnm7SNCoOyX8pJGKFLs
         3ToyVc9BODnXyLACEFZYhVzgG0icLdjaFOgJGxatvxVB76P4fqlZXKn05e8lmvavTYNI
         MRog==
X-Gm-Message-State: AOJu0Yxl/mNSNXHdDKVghKFPR39bP9Ym2v+x1SFvhzDcyYesXLN/roYN
	AxqtF6jlW+YVWX18/uPvkBXDl2Nou30xSbS/GyrY8iUglIaalhbnylF22T0nk0UrJgAFQftUW5I
	8I9w=
X-Gm-Gg: ASbGncsHmWaaLP8dJMNFicnyu5icfUhcd/xwAVTkO4qXuEJVZGUXS+j2ATU9kPhnzLQ
	FMYJIDlIvQujLhs3V2QzNTILLZEQmJ0bwcR1SfpyAlLhSl+tpCTtI88hIXwRa0Un/ul9oXkGFxG
	+8BYulpllv1fT4vNw7sssGXfp9DgD190H5gYgiIHrnumVNIFGPPCQ7pcnT4C+R6AZrrazetuGu1
	fJmoM4EMCMT0jnDdfiy530MrPdB+q2d5fYa8m5pi+csonuIAaZO7kBjLYXDrjpGOZEus/sYNL0/
	OJ2QOjVjZoQnE9L8DhPsG1BFQhHGpFAmMSte+6IR+drwp+iBAw7tgGMrqr/HYXNvAOvyvTeRmGd
	SUQpSdfj+Gk3RDf7a9YPIxMzFrrdoDfD/xvmNaty68poOwLqEs0XLTB3Jsw==
X-Google-Smtp-Source: AGHT+IFjZmYHii4t2L2R0ugtCzUKVlmB42TBcZ5xy1BcP9d5aOoVv0yvcaJKBbeg5694XWmPTYP8tw==
X-Received: by 2002:a05:6000:22c2:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3a572e568b4mr10994770f8f.49.1750176065283;
        Tue, 17 Jun 2025 09:01:05 -0700 (PDT)
Message-ID: <6702a867-da38-46e1-88d3-614776f55e5e@suse.com>
Date: Tue, 17 Jun 2025 18:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/5] vVMX: adjust reg_read() for 32-bit guests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
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
In-Reply-To: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using the full 64-bit register values is wrong in this case; especially
soon after a mode switch from long mode to 32-bit one upper halves of
registers may continue to be non-zero.

Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the affected VMX insns are invalid to use from compatibility
mode, and hence the more expensive vmx_guest_x86_mode() doesn't need
using here. (VMCALL and VMFUNC, which are permitted in compatibility
mode, aren't taking this path. In fact both aren't dealt with at all
[explicitly] in vvmx.c.)
---
v2: Add code comment.

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -360,7 +360,18 @@ enum vmx_insn_errno set_vvmcs_real_safe(
 static unsigned long reg_read(struct cpu_user_regs *regs,
                               unsigned int index)
 {
-    return *decode_gpr(regs, index);
+    unsigned long val = *decode_gpr(regs, index);
+
+    /*
+     * Outside of 64-bit mode, zero-extend the result from 32 bits, like
+     * hardware would.
+     * NB: A long-mode check is sufficient here, as insns this logic is used
+     * for will #UD in compatibility mode (and hence not make it here).
+     */
+    if ( !hvm_long_mode_active(current) )
+        val = (uint32_t)val;
+
+    return val;
 }
 
 static void reg_write(struct cpu_user_regs *regs,


