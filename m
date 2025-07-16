Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430DAB06E5F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044848.1414871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubw7S-0000E4-Oo; Wed, 16 Jul 2025 06:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044848.1414871; Wed, 16 Jul 2025 06:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubw7S-0000Bg-Lk; Wed, 16 Jul 2025 06:59:58 +0000
Received: by outflank-mailman (input) for mailman id 1044848;
 Wed, 16 Jul 2025 06:59:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubw7R-0000Ba-5C
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 06:59:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a158d73-6212-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 08:59:54 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so356321f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 23:59:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9248d466sm1026360a91.2.2025.07.15.23.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 23:59:53 -0700 (PDT)
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
X-Inumbo-ID: 7a158d73-6212-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752649194; x=1753253994; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBzrShIR/2CpHU6XZg+2Ng+YAKvNsS/+gHsNdbasztU=;
        b=OgN6SBZ76YRKPeCa/BxuVW++t6dOOIRbPT3/mIzOr0oleU7GVZ/plcLEP0np3pKc0g
         m74n+ezYkXdTRMrcUKyfNaltNyQNAM5pgxvBGSa8yhDaoxNCm9szAlBpDQ4YCRbi+Qtc
         /xUvwd1lVJqqXKTxa93hCG5a6B7F4on2t79oLs9AVtY2PadvaFv2aU6Zdmh66CV/84TO
         RLNCUjvuFFBTsbNzKV1LDChkwTy64HYsX47Pvr4NlTeQ7dxug1w1NnGJrVVLH5WI0DXh
         vOR0qlQjGy9QAvacOoSKEBTZBppg4/W39lFdWNPXYTayAHp75GjR/7Oj0spm0ebEKBxr
         7OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752649194; x=1753253994;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBzrShIR/2CpHU6XZg+2Ng+YAKvNsS/+gHsNdbasztU=;
        b=FccNn9iGZUyO+jEFED8OrgT7ppDeUHbrFvCONZKrhqVC+P95tU4vSo+HULKMZJSrQc
         +L8jm9OWFJkXODERF8VadNZPSDhFELpf0lsfJA1zpbp8grbYe30gyE5auibPcr6ozqeM
         xHK4dKOUdnayFPUXwqLSbi/LfB4m3Eryci1zUYHQzeSnPC2xqUKbrOjSVjYoYkD4gjpo
         IjVO4+aItrQYiu51vKuhAOnWWcb1OS2R4cx/M8KBqBBOwNtA9amNbRrr8A1xf1FuwS1g
         6PhDqt/hmsdVRpF68P5v20J5PnKHpq/96OA2aMMLOUueMCgHOX6Tyw6fLEICtcj4Jd/r
         J+rg==
X-Gm-Message-State: AOJu0YwETSvP5X8WALAfNaH1NLSGk7QiA8I7eThFywewSmgSvxFIoOCF
	xxRyRurskSyCrRHzIaSP99a9CMggBfYSAWwEgJnsPbzy4r49wAwygVCHTFcAw7AUk6Mk1PzCuyn
	mWBo=
X-Gm-Gg: ASbGncuYHfXTJJSnBqqSnZiEGmAYv1rPXz1hhQiLpi7iscb54CgwKVGISV/O8Qy9ub3
	4FeHwu6jGlVq19h2M4pRXnojrD2ptJhO+V8kqdWVCS2aHFxqb330WIqL8ceIo0NwEhQq8hHyDdd
	KM0hK4QKu2cTNbK6Ass2njBan8NTfJOn8dRShtyPT3FpQsxxGPDOAoRMvlaUKCWtdRmYGwsSQ7g
	MD8arEi6fTU1cMmaQAD4w6X+3/CWgXW9KaY9wIFj1D8jkClaJIXT9zXzVFbmqZLWLKVBIqA4buj
	ONLsovAJejxO/y9Lg6nHyZnttjsD+1kNJSWJMeLD9bhSdo8OySiFXis8bF0mRrzzT4XsInd8VH7
	MBCHsLeVORA1jJemN4a8/aEDg/ZqIrYKUlHtsLG2dqXeEr7Dpb+J2VvtKq73jObaSjpVpdJP0Vu
	CwmeSx7vo=
X-Google-Smtp-Source: AGHT+IFZ9OKJt4oVMV1ZiE0vhtYzw5kO9uI52hJNc3/nbJ4jpA1XLCGo74ee+f3TjCSu1l77YkFBTA==
X-Received: by 2002:a5d:64e3:0:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3b60953af23mr5362399f8f.16.1752649194114;
        Tue, 15 Jul 2025 23:59:54 -0700 (PDT)
Message-ID: <73d725a9-4163-4dd8-a9ac-b1c234005ced@suse.com>
Date: Wed, 16 Jul 2025 08:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/gen-cpuid: correct cycle detection
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

With the processing done linearly (rather than recursively), checking
whether any of the features was previously seen is wrong: That would
e.g. trigger for this simple set of dependencies

    X: [A, B]
    A: [C]
    B: [C]

(observed in reality when making AMX-AVX512 dependent upon both
AMX-TILE and AVX512F, causing XSAVE to see AMX-AVX512 twice in its list
of dependents). But checking the whole accumulated set also isn't
necessary - just checking the feature we're processing dependents of is
sufficient. We may detect a cycle later that way, but we still will
detect it. What we need to avoid is adding a feature again when we've
already seen it.

As a result, seeding "seen[]" with "feat" isn't necessary anymore.

Fixes: fe4408d180f4 ("xen/x86: Generate deep dependencies of features")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Doing AMX-AVX512's dependencies like mentioned above still isn't quite
right; we really need AVX512F || AVX10, which can't be expressed right
now.

This contextually collides with patch 2 of "x86/cpu-policy: minor
adjustments", posted almost 2 years ago and still pending (afair) any
kind of feedback.

I'd like to note that the commented out code in the loop (sitting
between the two hunks beklow) doesn't really work for ARCH_CAPS: The
first unused bit (between XAPIC_STATUS and OVRCLK_STATUS) triggers

Traceback (most recent call last):
  File ".../xen/../xen/tools/gen-cpuid.py", line 608, in <module>
    sys.exit(main())
  File ".../xen/../xen/tools/gen-cpuid.py", line 602, in main
    crunch_numbers(state)
  File ".../xen/../xen/tools/gen-cpuid.py", line 382, in crunch_numbers
    (state.names[feat], repl(seen)))
  File ".../xen/../xen/tools/gen-cpuid.py", line 378, in repl
    return "[" + ", ".join((state.names[x] for x in l)) + "]"
  File ".../xen/../xen/tools/gen-cpuid.py", line 378, in <genexpr>
    return "[" + ", ".join((state.names[x] for x in l)) + "]"
KeyError: 534

(line numbers slightly shifted due to other debugging code I had added).
My Python clearly isn't good enough to try to guess how to fix that.

--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -350,7 +350,7 @@ def crunch_numbers(state):
 
     for feat in deep_features:
 
-        seen = [feat]
+        seen = []
         to_process = list(deps[feat])
 
         while len(to_process):
@@ -363,14 +363,14 @@ def crunch_numbers(state):
 
             f = to_process.pop(0)
 
-            if f in seen:
-                raise Fail("ERROR: Cycle found with %s when processing %s"
-                           % (state.names[f], state.names[feat]))
+            if f == feat:
+                raise Fail("ERROR: Cycle found with %s" % (state.names[f], ))
 
-            seen.append(f)
-            to_process = list(set(to_process + deps.get(f, [])))
+            if not (f in seen):
+                seen.append(f)
+                to_process = list(set(to_process + deps.get(f, [])))
 
-        state.deep_deps[feat] = seen[1:]
+        state.deep_deps[feat] = seen
 
     state.deep_features = deps.keys()
     state.nr_deep_deps = len(state.deep_deps.keys())

