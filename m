Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154A2A825DD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943978.1342566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VGp-0005Gx-7e; Wed, 09 Apr 2025 13:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943978.1342566; Wed, 09 Apr 2025 13:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VGp-0005Dp-49; Wed, 09 Apr 2025 13:15:11 +0000
Received: by outflank-mailman (input) for mailman id 943978;
 Wed, 09 Apr 2025 13:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2VGn-0005Dj-PS
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:15:09 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7db4c70-1544-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 15:15:06 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so31356605e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:15:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fc83sm19961815e9.26.2025.04.09.06.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 06:15:05 -0700 (PDT)
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
X-Inumbo-ID: a7db4c70-1544-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744204506; x=1744809306; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=359++Fx7n3tcb9o1gRWcBstwZPRV3RIAe6brpygAlrc=;
        b=RUiJvATi2O8bKaTYSzIXHG6tY24EXkHOdI727Be0b7Zf2T7qwpzU7sq8WLAFAuh/En
         RTqV+/sx2IKs8qN5VupGXp3LrvUzVilw30D5Crb1gJ6uUSFNDStNYNcmTDj6elZxpxnK
         L7q00PiczbUEIO3wjEgBI8yNPLIslMwJ+BaMLr4Aoe1copIcBAlcFmiTDYs8ya4/JLIJ
         blbsBRCq7z86nBsJSXWfYtpB6JNvzaquY+5dX3//xgruZ6lWHfmjHhhTWvPf9r5qpuS6
         ppkIo9Skr961Q8dtTOdH10T0n+vss8cwiQ+niD4RPZezS9+ZVNj/xri8w6dO1HmzoDwI
         bUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204506; x=1744809306;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=359++Fx7n3tcb9o1gRWcBstwZPRV3RIAe6brpygAlrc=;
        b=isAF4JWqEUbuuIIUiGHPuF0gQqXEDrqIKVPhk1IOju4QN2dhLRaloKPCEA6HF8rk/n
         FR3NMrwnOtA7CuFv94xE5w0V+c9mxv+hbDt+LumG1nD944rk12Q5ZWt0tGtVnzgCdxKG
         tIqZLInUrWq6fPc/3Ll3WTQO1QesjsrFhdt3zdJQ8CT4w6SYm1i/FVxKbs4uRtLfHsmV
         VgqcO37BAft4sO9DYeffQsq+BcOFsD2jv5mPiUqDZedC02SsT/YK6uqDnX6MlzuIyp9D
         LJ4V82dkyYBdUoslp0sNWZog3prVjXiBbp0tbpbqpJ2HEBAcQoPMo0eA9IyWk6SD3WK7
         DFSA==
X-Gm-Message-State: AOJu0YyBkcZB2wsWXilBcDJvDub8aDvlsd0sd8tMPGlXwMxc6JODJWiY
	57Pt9iOh93VIl9OmciyLKIgldr1FrP8fVyWWm4oOwQl83vj612uE6Pr5E7kM60KjpgSK06cgq3E
	=
X-Gm-Gg: ASbGncsqQLULobbizCjZoOqmsykkr9Ny1dfsGKFQcs2JrAcVFQChN3RHcayjCBDyNg3
	pfGb864LhdF5zJnDZ6iNIqCXWdlk0RVzN2Va4Q6+mlt8RoExXShGxpsbbWFwqIpMBh/kn+qhzVV
	KixYCZhIgbKylsaeBEjY0v5B54SuQC80RemyIyJaNWCRujyJAUsruvsWE2Vz4KXt7FL4zMV8vwJ
	je4f8cesI4WYbMVvEk1OGfy56w6c0Vsz4otGWvbTPlLgaERqYBWRK77o/AthIpTBSSaKJAsRmeS
	Y9xHNOV0aqSsjDS/f9mEvZVuXBYkv/M+Ho3N55YbVP7O7MdXC0v3ztYutRa2TZyh3oyKYDj0a0m
	7v7W32dTaid188n3Dy1Ub1mtpuw==
X-Google-Smtp-Source: AGHT+IElOFxLA2a3fXBesCjNIJVZK6RCABoTRCshg1ERAF2uS43drs+Vg09VwZER4aZ93qVAXIJrYg==
X-Received: by 2002:a05:600c:c0a:b0:43d:585f:ebf5 with SMTP id 5b1f17b1804b1-43f1ec7d133mr27469635e9.1.1744204506184;
        Wed, 09 Apr 2025 06:15:06 -0700 (PDT)
Message-ID: <41aa7f80-7d27-4b37-83a6-239e2380168f@suse.com>
Date: Wed, 9 Apr 2025 15:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] include: sort $(wildcard ...) results
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

The order of items is stored in .*.chk.cmd, and hence variations between
how items are ordered would result in re-invocation of the checking rule
during "make install-xen" despite that already having successfully run
earlier on. The difference can become noticable when building (as non-
root) and installing (as root) use different GNU make versions: In 3.82
the sorting was deliberately undone, just for it to be restored in 4.3.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While this was an issue already before, it became noticable with the
toolchain baseline bump: The custom-built compilers I use, run directly
from their build areas, wouldn't find the C++ header files when run as
root. Hence the C++ checking rule would fail during "make install-xen",
when needlessly re-run there.

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -41,8 +41,8 @@ cppflags-$(CONFIG_X86)    += -m32
 
 endif
 
-public-$(CONFIG_X86) := $(wildcard $(srcdir)/public/arch-x86/*.h $(srcdir)/public/arch-x86/*/*.h)
-public-$(CONFIG_ARM) := $(wildcard $(srcdir)/public/arch-arm/*.h $(srcdir)/public/arch-arm/*/*.h)
+public-$(CONFIG_X86) := $(sort $(wildcard $(srcdir)/public/arch-x86/*.h $(srcdir)/public/arch-x86/*/*.h))
+public-$(CONFIG_ARM) := $(sort $(wildcard $(srcdir)/public/arch-arm/*.h $(srcdir)/public/arch-arm/*/*.h))
 
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y) $(headers-n))
@@ -130,7 +130,7 @@ all: $(obj)/headers.chk $(obj)/headers99
 
 public-hdrs-path := $(srcdir)/public
 
-public-list-headers = $(wildcard $1/*.h $1/*/*.h)
+public-list-headers = $(sort $(wildcard $1/*.h $1/*/*.h))
 public-filter-headers = $(filter-out $(addprefix $(public-hdrs-path)/, $($1-filter)), $($1))
 
 public-headers := $(call public-list-headers, $(public-hdrs-path)) $(public-y)

