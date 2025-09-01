Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A22EB3DD23
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 10:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104184.1455301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0LS-0001z8-0v; Mon, 01 Sep 2025 08:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104184.1455301; Mon, 01 Sep 2025 08:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0LR-0001wb-Tu; Mon, 01 Sep 2025 08:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1104184;
 Mon, 01 Sep 2025 08:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut0LQ-0001wV-AC
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 08:56:56 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b78469e-8711-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 10:56:54 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso210699166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 01:56:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff15fccad1sm627989566b.108.2025.09.01.01.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 01:56:53 -0700 (PDT)
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
X-Inumbo-ID: 9b78469e-8711-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756717014; x=1757321814; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N9SDNFNNmkHRjQNNVUzXHvawpqEnyUdSDygomNw7bmY=;
        b=P17YsNH7GpMASb/7eVWFtwFwPG68w9Lwgii9WbnISW48lftAK0r0o88w8IXSjhk/PJ
         gfBfU+a3FnuGGXPVqf4KZgQLlsZOvUlSeQ7IiWlRF+o+eATWTb3yAzFT9YU0ZyZmpBmL
         gNVJS8Gsp8IWEe3P4mKZG1Ya4qL9tCtGZoxSYW7CSouXHP5CSWisfP8HaSnF1ultP9N0
         eYpVxh4mfKln8CNrAU2AHlLpDZ+58MCoKmMgyLfnciumNt0nbeP3APWHHY30HoLF0dR1
         ZnPov1xz3nSqYU9m21HiwqA3ryEogdHmpaks0hR47gF+oiTk5tHByWqn8nm+kBeAoHAP
         bB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717014; x=1757321814;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9SDNFNNmkHRjQNNVUzXHvawpqEnyUdSDygomNw7bmY=;
        b=p7sYQQ+HCv0G/G+8Ls4jkGsV2yubWnwJgP6T0dn+jxqY5t4yx+NC94kUU/zXf1zSvQ
         4jcd/tBgJlezCSycoOl6KhDyQUitNmE5hON4ME27pHKPK9ybC6WAb0sB5JSiG4mEn5lY
         4XFZjKaLzbj3UZ4H4ydWo9epQWprkPckvbpFcgD00oA85X8d9YBw/liztOrTcM9yAyIr
         nrk75ktvYCAB4lAiprfCJc895aiXIZ/uBt6PWJv0CinB8RVuoocXLSGnU7L10HpS2Ske
         vXuEMbrL4z7CPlEVix+fC5zXnDhd8jXkIYZyrRmBsT/299fwQewd14dvseuzUV+Oqhkz
         RwYA==
X-Gm-Message-State: AOJu0Yzn0CYHcy409rAuKF11K0dazAid8Xgi0GRVDX/WHXKWqS6XWAyE
	XlziuUkW1+Zb56R1fKvQN4xZFTKOZjg1fgsqsAT+FKSAKXq9eDMcpsc6X9bbcLlLtmQSQSms9Ev
	7zqM=
X-Gm-Gg: ASbGncvaUBlihGAkc9TzXxBas2Ah0rftG2Rb0Ydzr/tptwZoxF4Oy9DHZ4e1JgwUA71
	RlD+ewgsQujMwfjVgP/UbKzJL1col6Fyl3oI++J4e92ppOukZPUVx+gshu8acUgCgI2/PXqvaRt
	qCWyRHsg0+d/hFMVIRAh1dnCTVUwHvOXo9y3G5EYPAP0r2N+2aJMVkURnsIKpzotvdMslNR/tzE
	KQ30+/IztMeXRAMz7VMem+rQ7e1sr8NW3mPN+B5KvuGCw37qCQ5m/PguqRHtozfwt8uvOBQgRyv
	yTAOsuyQ9oT1qUDgoCDhnMsh7Vg48/4ECcC8yYhcnVu+DUHuAldvbSV5NwaiqeCz6Ei22BgzocF
	z5XrNCmVE9p1v17fSgiPQaAPMnXuF5gw9YRl5yhj80syQygArustZwsfZHMY0QwGnjtfR0gsoE/
	0pYUC1x10=
X-Google-Smtp-Source: AGHT+IHx+eZb5Ns66uHXiuh9bYCarqdoK0NWtQ7X43CRFoR3TLSpYHoaWMFt6J6DWm6fxy+6Ghu8mw==
X-Received: by 2002:a17:907:720f:b0:afe:c1e4:5561 with SMTP id a640c23a62f3a-b01d8c802bcmr716634066b.25.1756717013650;
        Mon, 01 Sep 2025 01:56:53 -0700 (PDT)
Message-ID: <41ba214a-6137-4d8f-9f4f-3a362940d8a8@suse.com>
Date: Mon, 1 Sep 2025 10:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/gen-cpuid: correct cycle detection
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
now. I'm now handling this by some custom code in the AVX10 series.

This contextually collides with patch 2 of "x86/cpu-policy: minor
adjustments", posted almost 2 years ago and still pending (afair) any
kind of feedback.
---
v2: Adjust an error message. Reduce diff / indentation some.

--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -366,7 +366,7 @@ def crunch_numbers(state):
 
     for feat in deep_features:
 
-        seen = [feat]
+        seen = []
         to_process = list(deps[feat])
 
         while len(to_process):
@@ -379,14 +379,17 @@ def crunch_numbers(state):
 
             f = to_process.pop(0)
 
+            if f == feat:
+                raise Fail("ERROR: Cycle found when processing %s" % \
+                           (state.names[f], ))
+
             if f in seen:
-                raise Fail("ERROR: Cycle found with %s when processing %s"
-                           % (state.names[f], state.names[feat]))
+                continue
 
             seen.append(f)
             to_process = list(set(to_process + deps.get(f, [])))
 
-        state.deep_deps[feat] = seen[1:]
+        state.deep_deps[feat] = seen
 
     state.deep_features = deps.keys()
     state.nr_deep_deps = len(state.deep_deps.keys())

