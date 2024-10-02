Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB498CDA0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 09:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808621.1220581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svtXx-0004iT-H9; Wed, 02 Oct 2024 07:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808621.1220581; Wed, 02 Oct 2024 07:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svtXx-0004fw-ER; Wed, 02 Oct 2024 07:13:17 +0000
Received: by outflank-mailman (input) for mailman id 808621;
 Wed, 02 Oct 2024 07:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svtXv-0004fn-GR
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 07:13:15 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca23618e-808d-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 09:13:14 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fad6de2590so32356321fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 00:13:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299aca5sm822545666b.224.2024.10.02.00.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 00:13:13 -0700 (PDT)
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
X-Inumbo-ID: ca23618e-808d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727853194; x=1728457994; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiX/v88DnQtK6zdQ+BL0d3mjMtINKCgQD8boqnd4tE4=;
        b=WdAg52U16p8YPjE37Oa8mVOg6eoQhHFMNIUPOThYm4fejr900TZX4MO9Y9W762pDr/
         dqaMq8rnHm3EyfTZE2gFUQsBpRA30abryiwsKYDZcv40T6GwI5sBclmBvvGbwYTrG/+m
         lbZEcNn8dLxm1BkKr08ntgecKlsDLu5v3zh8acuY77NceXUtFC/FMyY5s4BKKfg6pU41
         Yf/dlhnBHMg0NLqS09/9wuMj7EYmuE7f7j0VRcQG1Vcwai1GEMDYFsitZIijEe8p2/OM
         SFYHp3KG/55fAD68IvYZ6pKvsrrlOtM80AMm+lTmF3Q83zsApmDCvtXMwN4doRSvXWNA
         Y/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727853194; x=1728457994;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GiX/v88DnQtK6zdQ+BL0d3mjMtINKCgQD8boqnd4tE4=;
        b=GeZWiR4h0Sf5GGSkmb+HWhHSmEiL4PazFyzM0yNB3nuZKZzHpbqhyM5kgPYaX0uvLN
         8GXQi/bOcASPtndnqZ7TR8uQFsCL3HrpmqEp9BVtd2CQ2FFeSkpClAOMmSzI26Ut/4ge
         vjAHwpzdjoVMJKb99t4JmHiGn3HTSKYmjJk6FHhhdKzufYCFSIXqtmGcF5ud2aRtkwV5
         JLfxfKUBTinHIUA83xpjVQHuSc/WtZn4EQzO6pg9y9ZdhmrwZWc05UjVWV7G9CZqE0wG
         T2/Z9Q4N86I6D2zqJEHn03ttiVfgLFhs1ZIJ9jvatFPuFwhJDutT/L19EFepPgrVhyn2
         iQkw==
X-Gm-Message-State: AOJu0Yw71gqkieexAW45ZuZD6gA0GQZAJ48nrECHcSQ/FGgXtcfkofZm
	P7rBgUYEaaYAXXX8aqQXsC2JAABqtZQBt8T7cx3B0UaFOme86lHnCzqZT8xuJlAqbHK5EwTQd8s
	=
X-Google-Smtp-Source: AGHT+IEVfuctcUZTyYMDMNLWyveaQtojzbMJOtuS4RsbeOQLkQic3v0qoT1Ct0tYQn6M+yHeBiThFg==
X-Received: by 2002:a2e:9907:0:b0:2fa:bd56:98c5 with SMTP id 38308e7fff4ca-2fae10a628cmr15409081fa.33.1727853193507;
        Wed, 02 Oct 2024 00:13:13 -0700 (PDT)
Message-ID: <bf96d727-77d1-4aa3-b81b-3fc32e602fe0@suse.com>
Date: Wed, 2 Oct 2024 09:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] CODING_STYLE: header file guard naming rules
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

Provide a (small) set of rules on how header guard identifiers ought to
be spelled and what precautions ought to be taken to avoid name
collisions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -153,6 +153,48 @@ E.g. timer-works.
 Note that some of the options and filenames are using '_'. This is now
 deprecated.
 
+Header inclusion guards
+-----------------------
+
+Unless otherwise specified, all header files should include proper
+guards to prevent multiple inclusions. The following naming conventions
+apply:
+
+- Guard names are derived from directory path underneath xen/ and the
+  actual file name.  Path components are separated by double
+  underscores.  Alphabetic characters are converted to upper case.  Non-
+  alphanumeric characters are replaced by single underscores.
+- Certain directory components are omitted, to keep identifier length
+  bounded:
+  - the top level include/,
+  - architecture-specific private files' arch/,
+  - any architecture's arch/<arch>/include/asm/ collapses to
+    ASM__<ARCH>__.
+
+For example:
+
+- Xen headers: XEN__<filename>_H
+  - include/xen/something.h -> XEN__SOMETHING_H
+
+- asm-generic headers: ASM_GENERIC__<filename>_H
+  - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
+
+- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
+  - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
+
+- Private headers: <dir>__<filename>_H
+  - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
+  - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
+  - common/something.h -> COMMON__SOMETHING_H
+
+Note that this requires some discipline on the naming of future new
+sub-directories: There shouldn't be any other asm/ one anywhere, for
+example.  Nor should any new ports be named the same as top-level
+(within xen/) directories.  Which may in turn require some care if any
+new top-level directories were to be added.  Rule of thumb: Whenever
+adding a new subdirectory, check the rules to prevent any potential
+collisions.
+
 Emacs local variables
 ---------------------
 

