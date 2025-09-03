Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6233FB424A1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 17:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108610.1458689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpAh-0004TW-TV; Wed, 03 Sep 2025 15:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108610.1458689; Wed, 03 Sep 2025 15:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpAh-0004Pw-Qc; Wed, 03 Sep 2025 15:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1108610;
 Wed, 03 Sep 2025 15:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utpAg-00047C-Nh
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:13:14 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8250c5d4-88d8-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 17:13:13 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61cb4370e7bso10088679a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 08:13:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b042dcb9105sm771389366b.2.2025.09.03.08.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:13:12 -0700 (PDT)
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
X-Inumbo-ID: 8250c5d4-88d8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756912392; x=1757517192; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eU9yPIjk+hMAyig/Ct0852tYZLmHe6qE5yP90ZCdm3A=;
        b=gG2vS24wAWy3TcIfLtiyNNtA9k6o67C3HtDJp5iDP1iLlU8yIw5O+hJ4+r+iR8+22T
         CjOxG3wnAtOyoblgWqCVojKykpwV03L2TW4tgSb820tZXM7ugYXxAOTHV+ucCnObbHqG
         72ngeX1baeIBTRQEuskkglPQOerJAnJRloZetwYCtKxznHuqurTNsOICWB8kYKw/uC2B
         1Q8exkFLD2VItNNaEJ0jDTRoN00MhSOtICvrmEcehiufyEK+Bpf4OPEM7iyIPEZypEsq
         suibDqsXOKipfAw3eGjGRVaSWZSxdtklylQq+LNkZ23Ltle9YJcbLabI9044kaNHfkYZ
         obuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912392; x=1757517192;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU9yPIjk+hMAyig/Ct0852tYZLmHe6qE5yP90ZCdm3A=;
        b=WgxyMk0dtPui3GxWPwM0+XjJZJaRim3/f21ln8O684ZTYbGrpfxTVGzs7ECIw/t0iX
         WeXQxAJ5JfCAKMvAOJBj/IUVig2Vb+J3l5W58j8iWxDwAs0HwVriRhOELb65q64zovKM
         5pL/CnvgTIm9FPWIBGzbmvS/g+FCVyxXGUaGhxcvANJafPwmN0LVsLoCBmuMVhd7he3M
         pxnCBKbuwazGldg8YKcckVPbLxBYzdpn4FvpgZDA127CEZObWk1VZYLTUZ1hI2N134eS
         3K2Z+P7K1lE5akjJvpX3JIXhKZ5200R5U7SqrXcHF/3sMGBePj0TjznyNh+KCOWEWefF
         kYcw==
X-Gm-Message-State: AOJu0Yxc4vgOT3DEYaC4m26a4hTYMgkGP9UeYkA4AK6Oadgz4tmhezGc
	pD4KI9nCuOH8YedsrYvo0DqqKtPvvkAuv6IoDbMrXCYPpcyA22zcBZBq9ZqD5TvtFvOWlybF+KQ
	0q14=
X-Gm-Gg: ASbGncte9Me7vWxRN2X2A0QDd+QjwUgmQrecZdxpeWaS4W4XzP0vKp88g5DEoO5cT0m
	7gvmzJWFcX0dJM7XLKevXybiZlXOrrQEVKX92P7b6Cv3FOmetn+7F92FlxAAfhSXBxh+RD7pbUv
	C5OhRqNYPrYbBhlu5L2Vx+2jDLua2p60LzqRnGn6IvnsSYWJiNom30sC/5oVSMRb6QqzKnir1Bd
	JanKJehtP1ko/SqBy6/i3GZ59ty7BKfHaUIEFneFQrAUfT+YbSDhvHH5mpu++92/pDksjtz66de
	+lb67HX0drwP+jIRrftp+Rqh3m69L6xbQLNHCRUAVqOHVOMfgQeIptDGFAOemafwnwgkcW5crTY
	HMv7cv84rHic/blfqSZvBMueMLvu+oe1w5dhAk2UFlurt1vbZbO5dtEwWDT2wOJVDpecu0FK6sx
	VvrJjeQP8qNsQIJ2KZuQ==
X-Google-Smtp-Source: AGHT+IHMC07VAfa4DaT2Xm8NfFfTUewmCpyOhnTBxMcnx9r7nQ2vuTzTL5r7n29y62fteALKa4ELoQ==
X-Received: by 2002:a17:907:971a:b0:ae3:6cc8:e431 with SMTP id a640c23a62f3a-b01f20ca668mr1723529666b.57.1756912392383;
        Wed, 03 Sep 2025 08:13:12 -0700 (PDT)
Message-ID: <1071997f-efe6-4088-b753-b74d3a045a09@suse.com>
Date: Wed, 3 Sep 2025 17:13:10 +0200
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
Subject: [PATCH] build: avoid absolute paths in executables
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

For in-tree builds relative paths are used, whereas for out-of-tree builds
in various situations absolute ones come into play. The extra paths can be
long, wasting space and e.g. serial line bandwidth. They would also get in
the way of location-independent reproducible builds. Leverage newer gcc's
(and Clang's) ability to "remap" file names. For older gcc fall back to
using the option affecting debug info only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course we may want to consider putting this in the top-level Config.mk,
to also affect other sub-trees (presently mainly/only affecting debug
info, for which even gcc5 already supports -fdebug-prefix-remap=).

As to a Fixes: tag, I wasn't quite sure whether to "blame" the
introduction of out-of-tree builds.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -448,6 +448,8 @@ LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin
 endif
 
 ifdef building_out_of_srctree
+    CFLAGS += $(call cc-option,$(CC),-ffile-prefix-map=$(srctree)/=, \
+                                     -fdebug-prefix-map=$(srctree)/=)
     CFLAGS += -I$(objtree)/include
     CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include
 endif

