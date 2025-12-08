Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D091DCAD0A7
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 13:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180431.1503615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSa1Q-0007Ca-AQ; Mon, 08 Dec 2025 12:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180431.1503615; Mon, 08 Dec 2025 12:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSa1Q-0007A5-6X; Mon, 08 Dec 2025 12:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1180431;
 Mon, 08 Dec 2025 12:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSa0H-0005PH-EQ
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 12:06:09 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 472744f4-d42e-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 13:06:07 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42e2d52c24dso2317559f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 04:06:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222478sm24800082f8f.20.2025.12.08.04.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 04:06:06 -0800 (PST)
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
X-Inumbo-ID: 472744f4-d42e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765195567; x=1765800367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HzX+wdHildeYBD0jUaBNnwRIzpTXlHrCCezhauXt/3E=;
        b=BvdfeexB+O+yYWnCd8d6KViNVWWmBFsLeC/hUaojMqYqKqVydZJtKBnBShCVUVsmCC
         oKzVRA5kXbGU2nR1orNhI4JKxD8ZBe1ftXQgl1el4s6AIFHAd4q0ZSvM50K7Dti9OCSr
         RLuN/4Gr33fp+T3sgIX5x78VAIgI+0VKm8jVRXatkdEvytceH01DwsJ5HMEMxpgWgIRI
         GU7I8pPl0HRAV2KbB0Ccz3gez61irD4eT65xQzbUw6jIsRRWV0+gXuFiWJzLZvllfr5t
         0ovlqc/6ewnrJsgRDKPBURjgdq7A9VokNEAerMsFmKieuOwxtosQcnryM9roxLARHkSd
         migA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765195567; x=1765800367;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzX+wdHildeYBD0jUaBNnwRIzpTXlHrCCezhauXt/3E=;
        b=BNo4HkbtTswiS1I7sOON8tlMQbt15KedRuO/323r+Fym1zJY/dP4MbxRUfX7V/9qHq
         EUorI6rqxxZxsKCjMelKCPvzrIwreyC9tVgA606tQcLa9tUUCi9eUr0PJ6xPMNKtjvmY
         L1Gzi2kOHzxDOBkp0003Ugwmks8yGlfx6fd0hPSr7L18IMJLG+dAodF0082pcv/9UqeI
         k7Q/fnW+FT2AGCqcAAqxlw6mMMy5WFqKdCV494LVhe3NTZk8e2buuqj4eEznhLZ8HtsF
         FhFAxKclBaQmyik2LEbytrTEt58czbIAqcFiCvI4Y+vlmRJ31mtw0gfNpkpOxESdVGfN
         cS3g==
X-Gm-Message-State: AOJu0YxQRaSxPUD1747pI/0CPDTurHKRbvSkQQjbP2ZerlwV1siFFkN7
	GUoNK/KzjLM6bGYTYJYj+v0jgxX+1yacdjSWhyOzhYM5jXZubuLWKbOPGZuOnaNqIcN/oRI8oam
	DPPY=
X-Gm-Gg: ASbGncsOV+iy9945jYU5ieMwCbT0nsHGCaSW7SxQVkl4daSY4l4rUKicCufdzVxu4Aj
	xL+xwmhfUb/wYsGekkTTlYLWd/ax0z0o1HdhbhDizZm43FVHSwqA7P1iSC/aI1ufXj9zMrTt5j+
	rldhyhjxrJqwrxx/U1Dr3zknJ7CiewTyGJxH5XwllVD+//IlEiz1IQ2tD4hcJgbuad2+M78ua4F
	tPs4qOhkSrmNRjWKhU0gAxuI6fN6XCdlBMiWwDWVaF0B904Sx1VJ4ZP+ExdmEIbnCh68Y9H9e9F
	gke9zEIHnpucRXn9c8inY81ZQC3D38GZZXPzb4X/HCM7n9DTT8ws0Z+qNQvQL1PXlY2ExH3zsSE
	yYN1uEYWG11F6dWe05w56u1PS/6iki1vZ1a28XyebnZQR8i3l1+NSWBCuSmry/bSAgm7AtUhssd
	moBQqEfJuYS4zMx3Y8lHg88qtSpY/Q/WJ/IPLE7L3Y4q9JvCEedZr4/Vih0lexyJsOjwPjUeNUb
	L8=
X-Google-Smtp-Source: AGHT+IGxVdVSryLepq5rPrR81ICPa90f5SY7Mzj70ewXoB3SAwVTEjeVcsPJQtGOV5z8zGfWNUTXBA==
X-Received: by 2002:a05:6000:2c04:b0:42b:2fc8:170 with SMTP id ffacd0b85a97d-42f89f09ce8mr8385124f8f.12.1765195567041;
        Mon, 08 Dec 2025 04:06:07 -0800 (PST)
Message-ID: <fc35728f-0fcd-4e29-bbc5-9410323a7a64@suse.com>
Date: Mon, 8 Dec 2025 13:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] Arm: actually put library code in a library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
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
In-Reply-To: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that the build system supports it, build the $(ARCH)/lib/ directories
actually into libraries, thus permitting unreferenced objects to be
omitted.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
 xen/arch/arm/arch.mk            |  2 ++
 xen/arch/arm/arm32/lib/Makefile | 10 +++++-----
 xen/arch/arm/arm64/lib/Makefile |  8 ++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 9c4bedfb3bd4..dea8dbd18a44 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,6 +1,8 @@
 ########################################
 # arm-specific definitions
 
+ARCH_LIBS-y += arch/arm/$(ARCH)/lib/lib.a
+
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 
diff --git a/xen/arch/arm/arm32/lib/Makefile b/xen/arch/arm/arm32/lib/Makefile
index 18326b284e3b..f5ff7f92d195 100644
--- a/xen/arch/arm/arm32/lib/Makefile
+++ b/xen/arch/arm/arm32/lib/Makefile
@@ -1,5 +1,5 @@
-obj-y += memcpy.o memmove.o memset.o memchr.o
-obj-y += findbit.o
-obj-y += bitops.o
-obj-y += strchr.o strrchr.o
-obj-y += lib1funcs.o lshrdi3.o div64.o
+lib-y += memcpy.o memmove.o memset.o memchr.o
+lib-y += findbit.o
+lib-y += bitops.o
+lib-y += strchr.o strrchr.o
+lib-y += lib1funcs.o lshrdi3.o div64.o
diff --git a/xen/arch/arm/arm64/lib/Makefile b/xen/arch/arm/arm64/lib/Makefile
index 66cfac435ab4..d6b231dc6193 100644
--- a/xen/arch/arm/arm64/lib/Makefile
+++ b/xen/arch/arm/arm64/lib/Makefile
@@ -1,4 +1,4 @@
-obj-y += memcpy.o memcmp.o memmove.o memset.o memchr.o
-obj-y += clear_page.o
-obj-y += bitops.o
-obj-y += strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o
+lib-y += memcpy.o memcmp.o memmove.o memset.o memchr.o
+lib-y += clear_page.o
+lib-y += bitops.o
+lib-y += strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o


