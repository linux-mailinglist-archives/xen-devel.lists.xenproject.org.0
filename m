Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D476F82B08D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666316.1036866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvyj-00037C-W0; Thu, 11 Jan 2024 14:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666316.1036866; Thu, 11 Jan 2024 14:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvyj-00035O-TF; Thu, 11 Jan 2024 14:24:17 +0000
Received: by outflank-mailman (input) for mailman id 666316;
 Thu, 11 Jan 2024 14:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNvyi-0002j1-Nx
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:24:16 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19819739-b08d-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 15:24:16 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cd84600920so11503081fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 06:24:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y7-20020a92d0c7000000b0035fffb69deasm313951ila.81.2024.01.11.06.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 06:24:15 -0800 (PST)
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
X-Inumbo-ID: 19819739-b08d-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704983055; x=1705587855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0p4AvId7LsdumQhFUTANpZvFp9Wi6kOxkHUOGtjN1Vo=;
        b=L9/EZCNnxl8kODvcGWF/ZDYNoYljaWQ+Osvj22BTiod1SrXsFU7oNg5CXu2glaXhJu
         LOnQOJM49i51rcB+cDLEHbkBQxhp1GxUQoK7yxBI9NTCqBZkiLauvFD88tnSfaGAi8Y9
         s7z3/oNJQ9VrA5o9BRbLv8IR+Xb3RCV+8MGr8xCUMezUtqsuMK/roacyhGaA474LQAd6
         Lofofxnf3CrOMWpXB0eLR7maPCpRAOZKZ+mCyADQrR7z/jhbgx1sEa6Zv2QHZ20YNEco
         rd9XGKMs/vhVMcVNY5JWo3TDt94CWbSd7nmt2kiD9JP1yxbrjoURB6z8kuBAABa8Dkti
         Udqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704983055; x=1705587855;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0p4AvId7LsdumQhFUTANpZvFp9Wi6kOxkHUOGtjN1Vo=;
        b=UApSiCW1k3EGFVXAV3mPQ5/HAG1jjc53XWjErRouPxg3XuJjmpMVRjujHXDSnWIsmk
         CSC0x9Yk7XemnZPrg+7wlSKFGCzpQ1fOfhQIkKyldSwOeiN6NNuaqgLDPiswqO17eWIe
         8/PbZmXf0UqxK0Kgb/jgftUoaPuc/aFcHxRllL6crbwbN7quTKwLwEaGvbybdQ42LTyL
         jQs0NynuEPci/fKvj+l784gh3HqwQTT1HlEFVUwW7/R/2FOgmUKgaRKGFLF6JYPhYvqj
         iItK5a3IdAtvyEhbG/GfGCTitJIS7JMRSE00pK0KKSrrgf2bURrRweqddMgyNnqZ4ndR
         I/tA==
X-Gm-Message-State: AOJu0YxdlNxM3VFurzAscuX53Y3SVpmGYT2vWPO7xy8NPRIfUr07mWw1
	CdbwP/qdx8V26PvCBKAp1NTvXJXElZiy/JkmTewp8DmBFg==
X-Google-Smtp-Source: AGHT+IFPNL9JlvkuqXrRZgkT0lFsShxJTdo55QhNUBPVOJm95lWXEhYv/cLy2GvCg8bYiP4CZ0eCHg==
X-Received: by 2002:a2e:b947:0:b0:2cd:143a:ae5c with SMTP id 7-20020a2eb947000000b002cd143aae5cmr440364ljs.51.1704983055628;
        Thu, 11 Jan 2024 06:24:15 -0800 (PST)
Message-ID: <18b8ea5a-21bd-40fe-9c32-fab41853131a@suse.com>
Date: Thu, 11 Jan 2024 15:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/3] x86/CPUID: adjust extended leaves out of range
 clearing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <774ece90-296a-4975-a31f-038de45e98bc@suse.com>
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
In-Reply-To: <774ece90-296a-4975-a31f-038de45e98bc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A maximum extended leaf input value with the high half different from
0x8000 should not be considered valid - all leaves should be cleared in
this case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
TBD: Andrew suggested to drop this patch, but that sub-thread still has
     a loose end. Hence, until I'm convinced otherwise, I've retained
     this patch here. I don't think it conflicts with any of the
     subsequent ones.
---
v2: Integrate into series.

--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -528,11 +528,22 @@ static void test_cpuid_out_of_range_clea
             },
         },
         {
+            .name = "no extd",
+            .nr_markers = 0,
+            .p = {
+                /* Clears all markers. */
+                .extd.max_leaf = 0,
+
+                .extd.vendor_ebx = 0xc2,
+                .extd.raw_fms = 0xc2,
+            },
+        },
+        {
             .name = "extd",
             .nr_markers = 1,
             .p = {
                 /* Retains marker in leaf 0.  Clears others. */
-                .extd.max_leaf = 0,
+                .extd.max_leaf = 0x80000000,
                 .extd.vendor_ebx = 0xc2,
 
                 .extd.raw_fms = 0xc2,
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -285,7 +285,9 @@ void x86_cpu_policy_clear_out_of_range_l
                     ARRAY_SIZE(p->xstate.raw) - 1);
     }
 
-    zero_leaves(p->extd.raw, (p->extd.max_leaf & 0xffff) + 1,
+    zero_leaves(p->extd.raw,
+                ((p->extd.max_leaf >> 16) == 0x8000
+                 ? (p->extd.max_leaf & 0xffff) + 1 : 0),
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 


