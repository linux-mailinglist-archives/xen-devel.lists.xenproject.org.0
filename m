Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0ECCAD09B
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 13:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180409.1503594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZyZ-0005u8-Lp; Mon, 08 Dec 2025 12:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180409.1503594; Mon, 08 Dec 2025 12:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSZyZ-0005sa-Iq; Mon, 08 Dec 2025 12:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1180409;
 Mon, 08 Dec 2025 12:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSZyY-0005PH-Bz
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 12:04:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07532c04-d42e-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 13:04:20 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso2011411f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 04:04:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222484sm25577077f8f.24.2025.12.08.04.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 04:04:19 -0800 (PST)
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
X-Inumbo-ID: 07532c04-d42e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765195460; x=1765800260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ozbJcX6blb5zPRdnoCEqsT7ddEPI/UlCYaZ1hWM577k=;
        b=LmJZUiSzR/b1e4jhiElpGQ7H2Diwm/49PmSBvlFTOLXY3s/6HMrFde1dVmUQlb3Nj3
         LiVYUz0VZIW5uOi4F/SuTpJPt+aN9dviZnc9LbF1fRBbHjQywFP3N5n+LuEF1Y2Ne/y1
         0VYP9VE4ncEZB+GkqKYcDC85KhhU2L04yb5vgIZK4j8f5UR18r87MJfWWnR5YswE3to/
         ZSkm6Vv381PUGp4yovHoMiSIgNfdSqtpAloAfLBzqGPT51/HVLEgqvQAxONy/nTO2P+Y
         WWOziC679PFlsLIkWpQ1kknoJpJX0FjQrOXduP/zEHO74EN1E/4T8j2JsrRktE0l6b16
         QZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765195460; x=1765800260;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozbJcX6blb5zPRdnoCEqsT7ddEPI/UlCYaZ1hWM577k=;
        b=SIMF5Ng7umkAs9Js2NWoeZTE0t3Ve/AvlRj0gTkfmtnD3FlF9mZeWeXoWyOVft5HSS
         Wy41Afne35t9aXR+WspOtIeDYydwe9rqueNREVbfXcgPqmeAMFgzFtNmGmPWQR+ZlIOL
         p6IL8o45CzcPeqbiemAJginI0wxEMhQrlcJc9jFIzbKPxVYzl/SGddqwCfBrsCsxFNQu
         h85alvg17PDfltKyk3Xxq1GCZttfZuunffOU8WGA8cfE9r9iAz4D2ZDEfvlmCBQaIDHq
         5kiQlGKX+j08RSt14jFfD8QciTlU4MTN2BCAPZ3FN/DzTMIMkTe+yJbobCp/tx0j6mD5
         8AbA==
X-Gm-Message-State: AOJu0YwnPtHUWAJZTexkzgbAC/y8A5jx3l509NcLOckE79BFG7I9DARv
	nM2lvHaJ3D8fQU50CQX6Uj2XRUjjEt83QnD+9ZsJoTqybY5YBs/TE3zyAFMUnHbqgWbbVzKWQuE
	jvJU=
X-Gm-Gg: ASbGncvLrV+/t45ClvjhTaEwjPiafOxvojEdAflMUSzWnKF+5Q2inBbP+AY7M7m0PEk
	N1JFph1v/ea6dFMy6C3HOgnATD4iHjRFbUmXAvgfkcYHFq5H8W9GLVn1b0fIf0gM2iid4nvKHEb
	nwfMqj7S04VtjMuHxJIzuSYzhNxI9aGRTb50C1eSgdf9GUddgA+4nNlC3Uh/J+VIsqWRthNb/8D
	SYOr1O+kEQItV6otl2MIM7kYAYKe94V/9RVwBzqFlFNlL5D84BNJBnbK2aTDvhz7uzRa/soXhIg
	lKanoDLphlIRjp8qB5pTUStbLfd5l2bcdsLg502F53P3ldUtDF5RMP0jI4rFQgFVsp4dlkhwlfW
	xStAtrZ4hrGoe10sAGeBmiC7zVoeDw5BQDPYqSKxYqzdcvVTUEkW12v5qgfyq/QAdajZB5KYrxg
	uuR7wB+ocYRuH48+M5Xae2N/GHrpqCEOMHln1cr8SgzcFg6LlbJOXML1Qok3gJ7NeVXkHO4fR92
	70=
X-Google-Smtp-Source: AGHT+IHZZ1S+NISr7aL1jI7+Op8eSyENtWjN7MGGSrDSfZAVLBj9q1qzZUFE9IDsxVzRfxK8DHZMlA==
X-Received: by 2002:a5d:5f91:0:b0:42b:411b:e476 with SMTP id ffacd0b85a97d-42f89f0f213mr6764179f8f.9.1765195460027;
        Mon, 08 Dec 2025 04:04:20 -0800 (PST)
Message-ID: <45eb7fb7-a899-4d64-a031-f6188146e238@suse.com>
Date: Mon, 8 Dec 2025 13:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/3] x86: move arch_generic_hweightl() to arch-specific
 library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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

Introduce arch/x86/lib/, and make it the home for the somewhat misplaced
x86-specific file that lived in the arch-independent lib/.

Introduce ARCH_LIBS-y as a make variable, to arrange for arch-specific
libraries to (generally) come ahead of generic one(s) when linking. Should
any library be intended to come after the generic one(s), it can be
appended to $(ALL_LIBS-y).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Arrange to link arch-specific lib ahead of generic one.
---
 xen/Makefile                                                  | 4 +++-
 xen/arch/x86/Makefile                                         | 1 +
 xen/arch/x86/arch.mk                                          | 2 ++
 xen/arch/x86/lib/Makefile                                     | 1 +
 .../x86/lib/generic-hweightl.c}                               | 0
 xen/lib/Makefile                                              | 1 -
 6 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/lib/Makefile
 rename xen/{lib/x86-generic-hweightl.c => arch/x86/lib/generic-hweightl.c} (100%)

diff --git a/xen/Makefile b/xen/Makefile
index e6cf2874251c..13e336ba5484 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -461,6 +461,7 @@ ALL_OBJS-y                += xsm/built_in.o
 ALL_OBJS-y                += arch/$(SRCARCH)/built_in.o
 ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
 
+ARCH_LIBS-y               :=
 ALL_LIBS-y                := lib/lib.a
 
 all-symbols-y :=
@@ -620,7 +621,8 @@ $(TARGET): outputmakefile asm-generic FORCE
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(SRCARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' \
-	            'ALL_LIBS=$(ALL_LIBS-y)' 'all_symbols=$(all-symbols-y)' $@
+	            'ALL_LIBS=$(ARCH_LIBS-y) $(ALL_LIBS-y)' \
+	            'all_symbols=$(all-symbols-y)' $@
 
 SUBDIRS = xsm arch common crypto drivers lib test
 define all_sources
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 300cc67407e9..61e2293a467e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -5,6 +5,7 @@ obj-y += efi/
 obj-y += genapic/
 obj-$(CONFIG_GUEST) += guest/
 obj-$(CONFIG_HVM) += hvm/
+obj-y += lib/
 obj-y += mm/
 obj-$(CONFIG_XENOPROF) += oprofile/
 obj-$(CONFIG_PV) += pv/
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 16368a498bb7..0203138a819a 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,6 +3,8 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
+ARCH_LIBS-y += arch/x86/lib/lib.a
+
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
 # Prevent floating-point variables from creeping into Xen.
diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
new file mode 100644
index 000000000000..ddf7e19bdc1d
--- /dev/null
+++ b/xen/arch/x86/lib/Makefile
@@ -0,0 +1 @@
+lib-y += generic-hweightl.o
diff --git a/xen/lib/x86-generic-hweightl.c b/xen/arch/x86/lib/generic-hweightl.c
similarity index 100%
rename from xen/lib/x86-generic-hweightl.c
rename to xen/arch/x86/lib/generic-hweightl.c
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 954d9216a39c..efca830d924c 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -39,7 +39,6 @@ lib-y += strtol.o
 lib-y += strtoll.o
 lib-y += strtoul.o
 lib-y += strtoull.o
-lib-$(CONFIG_X86) += x86-generic-hweightl.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 


