Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9549482DB59
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667405.1038623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO2W-0007N5-64; Mon, 15 Jan 2024 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667405.1038623; Mon, 15 Jan 2024 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO2W-0007LE-2Q; Mon, 15 Jan 2024 14:34:12 +0000
Received: by outflank-mailman (input) for mailman id 667405;
 Mon, 15 Jan 2024 14:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPO2U-0007L8-Jg
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:34:10 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 244fb6bd-b3b3-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 15:34:08 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso6981551f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:34:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j27-20020adfb31b000000b00336e32338f3sm12166221wrd.70.2024.01.15.06.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:34:06 -0800 (PST)
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
X-Inumbo-ID: 244fb6bd-b3b3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329248; x=1705934048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DhGYC5xunoV+JtWHCdjOaB9LbyhgNpSYq/w1/ajKmNQ=;
        b=gYOwCgSVWGQxiWxu068OA3ETFHZSPuSndxT5wxwx07sCC3alnGPjtQOvwkshFy2VXT
         3BtthMrcI8Pdvqka8V7hDDBqYO0VlbfJqtNkBwt5Iy3uBcnhhMh5cGwLZGo5qevbDOMA
         wMVFeRvUj1jG5LIaH2io96+JcbGvEvzI2VzFTTOQwi8mu3ePiNDcGjNdBsNv3wEsdOcM
         lRMnsjFIxKcPCqWcfwSxELAoqeKKvGG45LZxjSsdRDU4JiwOXssYOd7eMcMHqEbgrtSX
         g94sVL8EKITc7TiIxoxUYitlkFHWwe7b06WeHnuY9VzBtKHEhx0KAXv5UOJ4tCKxpmtr
         Uu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329248; x=1705934048;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhGYC5xunoV+JtWHCdjOaB9LbyhgNpSYq/w1/ajKmNQ=;
        b=B5zHUScJAxe9mJiqvM/0Qu0qx1hH8gygvgPrQjOxheVbZJT+OX1dFHfQjxoJrvZYbx
         xYLwDigoiEmIaniG2mrsJVsJWE149wy2KytM01BbObTAuisny/txBcF6VHiBlCrq0dED
         hgTSIjBD/Zp+zI4L3FUZJDLQ5O5OWK1ac/VbYEAmEDafcLopZe4f3upFyUNkbqP8SIrM
         xXn3ETKjKvTuJdXIukE+M2iQaD2rmqlnX7MW75lobN9csJvcx4B6kwKDdFP/d6mmtk8y
         lzBzY7j7ZcOusiUuGFC/F+hSM4Y0P7Vog3yrJRtCh1RrFFjbxrD/vfofIQHBPPfWolZw
         HCSA==
X-Gm-Message-State: AOJu0YwNj4MsnBpeDBXEddnlGOwrTMGuJeS550ZNARTuQealgDmyTLSD
	i7vSUDNIxAF6oHe0Th4K52u+vQWp8aZTMGdwk0u44T6rjw==
X-Google-Smtp-Source: AGHT+IEbL4YAIAz4BJr2LEx28p98YovKKsD5FVF4ZkpcxIETid1bcqstUeK/zBjnrNRHsIaBFDSFkg==
X-Received: by 2002:a05:6000:91:b0:337:4202:6166 with SMTP id m17-20020a056000009100b0033742026166mr3560027wrx.80.1705329246587;
        Mon, 15 Jan 2024 06:34:06 -0800 (PST)
Message-ID: <38de36da-0822-4452-9594-8d50a5a77335@suse.com>
Date: Mon, 15 Jan 2024 15:34:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/8] common: assembly entry point type/size annotations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
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
In-Reply-To: <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Recent gas versions generate minimalistic Dwarf debug info for items
annotated as functions and having their sizes specified [1]. Furthermore
generating live patches wants items properly annotated. "Borrow" Arm's
END() and (remotely) derive other annotation infrastructure from
Linux'es, for all architectures to use.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

[1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
---
v5: Drop CODE_ALIGN fallback. s/algn/align/g.
v3: New, generalized from earlier x86-only version. LAST() (now
    LASTARG()) moved to macros.h.
---
TBD: {CODE,DATA}_ALIGN are byte granular, such that a value of 0 can be
     specified (in case this has some special meaning on an arch;
     conceivably it could mean to use some kind of arch default). We may
     not strictly need that, and hence we could also make these power-
     of-2 values (using .p2align).

Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
still have ALIGN.

Note further that FUNC()'s etc "align" parameter is intended to allow
for only no or a single argument. If we wanted to also make the fill
value customizable per call site, the constructs would need re-doing to
some degree.

--- /dev/null
+++ b/xen/include/xen/linkage.h
@@ -0,0 +1,54 @@
+#ifndef __LINKAGE_H__
+#define __LINKAGE_H__
+
+#ifdef __ASSEMBLY__
+
+#include <xen/macros.h>
+
+/* CODE_ALIGN needs to be specified by every architecture. */
+#ifndef CODE_FILL
+# define CODE_FILL ~0
+#endif
+
+#ifndef DATA_ALIGN
+# define DATA_ALIGN 0
+#endif
+#ifndef DATA_FILL
+# define DATA_FILL ~0
+#endif
+
+#define SYM_ALIGN(align...) .balign align
+
+#define SYM_L_GLOBAL(name) .globl name
+#define SYM_L_WEAK(name)   .weak name
+#define SYM_L_LOCAL(name)  /* nothing */
+
+#define SYM_T_FUNC         STT_FUNC
+#define SYM_T_DATA         STT_OBJECT
+#define SYM_T_NONE         STT_NOTYPE
+
+#define SYM(name, typ, linkage, align...)         \
+        .type name, SYM_T_ ## typ;                \
+        SYM_L_ ## linkage(name);                  \
+        SYM_ALIGN(align);                         \
+        name:
+
+#define END(name) .size name, . - name
+
+#define FUNC(name, align...) \
+        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+#define LABEL(name, align...) \
+        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+#define DATA(name, align...) \
+        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
+
+#define FUNC_LOCAL(name, align...) \
+        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+#define LABEL_LOCAL(name, align...) \
+        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+#define DATA_LOCAL(name, align...) \
+        SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
+
+#endif /*  __ASSEMBLY__ */
+
+#endif /* __LINKAGE_H__ */
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -21,6 +21,15 @@
 #define count_args(args...) \
     count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
 
+#define ARG1_(x, y...) (x)
+#define ARG2_(x, y...) ARG1_(y)
+#define ARG3_(x, y...) ARG2_(y)
+#define ARG4_(x, y...) ARG3_(y)
+
+#define ARG__(nr) ARG ## nr ## _
+#define ARG_(nr)  ARG__(nr)
+#define LASTARG(x, y...) ARG_(count_args(x, ## y))(x, ## y)
+
 /* Indirect macros required for expanded argument pasting. */
 #define PASTE_(a, b) a ## b
 #define PASTE(a, b) PASTE_(a, b)


