Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF0CAF894
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181317.1504383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuZ3-0003B6-4x; Tue, 09 Dec 2025 10:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181317.1504383; Tue, 09 Dec 2025 10:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuZ3-00038B-1t; Tue, 09 Dec 2025 10:03:25 +0000
Received: by outflank-mailman (input) for mailman id 1181317;
 Tue, 09 Dec 2025 10:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSuZ1-000385-Fa
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:03:23 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b39ce07-d4e6-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 11:03:22 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so44135935e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 02:03:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8fe8sm30759265f8f.2.2025.12.09.02.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 02:03:20 -0800 (PST)
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
X-Inumbo-ID: 4b39ce07-d4e6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765274601; x=1765879401; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZpaecb+JF7bmSjlzXmdZ2nWOO8dFkaLpz8JThfqNYQ=;
        b=duSde+ma8tmQgitZekuJ/EnhdF94zODPhXnsc+SZ+stlIxAoCQkxJqmeakY9DzdDeA
         6T7b3uUJSDEwtysABylEsh4t+qR+hLHN6vbYQHezb8sF9D7M26t3UYJSBxefQim67+Uw
         5ShP1sc2jvMNmSFwSOvl9MmzviZirFX6DtQQfQ4J2pGCJ5mI8Lx8P0YmmCFE8/trcbbm
         7YBdr4AcfQewkYhYoQLijkPg/ERKCW/+g78rd7NU/3vs5q25QvSvEEyeSubwnpXGi1Da
         +NawEvmew3a2lcMKoMldTsAcKAbm5974ZXaukoLHlZK9ql2eGIvAjXLuGFUa7c/Wcg26
         QPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765274601; x=1765879401;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZpaecb+JF7bmSjlzXmdZ2nWOO8dFkaLpz8JThfqNYQ=;
        b=jhx5VKpDx6CAn60K6XuiQqH/C6CvyJaHZ6lUmt09DLTm6PyW6urA2PHwb4fHp8q2Ai
         YrYIBC2L6XwSkgMU0PAQ/3DNZadPeFChjTcmfVYssn6aIum7sFDTjVydhRfzfYEMVGkR
         MyAb8EOooZouDoadFj1sWnugStkkbKZdvxY3uCw5ccv7MPO+16UVyfA2YFgCSGXdjrEE
         +I3T7/UGJw6tIH4IU8lWT/HcgL8ogmlORrXsNxQ7aQGUoRD+i+fq+PgQirXsRH1CmBmu
         Pea6Hh5vs+rUVUvlnQl11RzlaEtD3PZoxrg2K3d7PEt3JxkXlyt189JXtFu9t1ZrAnF2
         zJEA==
X-Gm-Message-State: AOJu0Yw+hUErMcY699KSfdhNf/Szk3Bg3mZhB29MvNBa46k6UmkyXpqK
	5MnfzH9IDU+cPyb8jd0Hw6dcKel1CGeuMKg8De30qb6g+kHya+2G1Qp6198q/S5AtlryiLIGYyG
	mIXM=
X-Gm-Gg: ASbGncv11V2vJgIys086c8y3WWyHl1RRUQSQ8dp46xc5/s8Y/DZWd5xra5G8AlfZkUY
	N+IBVS3JJn4fOdMS6UM7smxEy3RezzFDhQyasVQfIxQ6Xxh6VW/3Nl+gd1zVXtc/ybgYM9nCadp
	z6/cpatsODApUoD/2OH7QVtA86N9aNsojOOHhYUylAvOvDJPV4vwKIuay8/6ofLtqDdNMlsMqXn
	8SgtWYudjRhTfYsIQUJ0SO9La12QrXfTc1S6QbomyDG8t8ILoNiH0OthtWz/Z46iCP1j+rTFbhQ
	AESXnhKoKnh2DwBW5Lob0HfZKLZTc0SaAjpfCN/TIU66nOWcG/wRDjd6b+WrsFWXc5E7f2wftUu
	Z5P7v+P/nOl4/yVehpx3ur6LAIxazRuCeHsbaJnNcDDOfZuOZOz9RIg4y/O2a3vxH5mTSweBhpS
	uQPxk5m+t0ap26/LlE9gVsLG2Y8wEBcI4Qg8qTGE2eZaacfpo154j12ABSEaE3415zzpD7pXugF
	Js=
X-Google-Smtp-Source: AGHT+IHn34SEuxmGT+foHMrEd2tpF6jZnsvkNLnE+RdJKtsR0Fj0NiPI6Ag/LdGC/wsulvgWRWRkUw==
X-Received: by 2002:a05:6000:230c:b0:429:c2fb:c268 with SMTP id ffacd0b85a97d-42f89f70656mr12105618f8f.56.1765274601262;
        Tue, 09 Dec 2025 02:03:21 -0800 (PST)
Message-ID: <f0f885a8-02f9-4d04-8bb1-4ed7dbd7666a@suse.com>
Date: Tue, 9 Dec 2025 11:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: restrict TEE{CR,HBR} to Arm32
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

Support for TEECR32_EL1 and TEEHBR32_EL1 was removed from binutils on the
basis that ThumbEE was removed from v8 before the spec was finalized (and
hence it never appeared in production silicon). Limit respective code to
Arm32 builds.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Requires 5bbe1fe413f9 ("ARM: Drop ThumbEE support") to be reverted first.

Further cleanup up may be wanted, but I wasn't sure whether to fold this
into this patch: TEE{CR,HBR}32_EL1 are now unnecessary aliases, and the
32-bit-only TEE{CR,HBR} constants could be used instead.

Also cpu_has_thumbee may better be either hidden from Arm64, or be made
constant false there.

--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -111,13 +111,13 @@ static void ctxt_switch_from(struct vcpu
     p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
     virt_timer_save(p);
 
-    if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
+#ifdef CONFIG_ARM_32
+    if ( cpu_has_thumbee )
     {
         p->arch.teecr = READ_SYSREG(TEECR32_EL1);
         p->arch.teehbr = READ_SYSREG(TEEHBR32_EL1);
     }
 
-#ifdef CONFIG_ARM_32
     p->arch.joscr = READ_CP32(JOSCR);
     p->arch.jmcr = READ_CP32(JMCR);
 #endif
@@ -244,13 +244,13 @@ static void ctxt_switch_to(struct vcpu *
     WRITE_SYSREG(n->arch.tpidrro_el0, TPIDRRO_EL0);
     WRITE_SYSREG(n->arch.tpidr_el1, TPIDR_EL1);
 
-    if ( is_32bit_domain(n->domain) && cpu_has_thumbee )
+#ifdef CONFIG_ARM_32
+    if ( cpu_has_thumbee )
     {
         WRITE_SYSREG(n->arch.teecr, TEECR32_EL1);
         WRITE_SYSREG(n->arch.teehbr, TEEHBR32_EL1);
     }
 
-#ifdef CONFIG_ARM_32
     WRITE_CP32(n->arch.joscr, JOSCR);
     WRITE_CP32(n->arch.jmcr, JMCR);
 #endif
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -211,8 +211,9 @@ struct arch_vcpu
     register_t hcr_el2;
     register_t mdcr_el2;
 
-    uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
 #ifdef CONFIG_ARM_32
+    uint32_t teecr, teehbr; /* ThumbEE */
+
     /*
      * ARMv8 only supports a trivial implementation on Jazelle when in AArch32
      * mode and therefore has no extended control registers.

