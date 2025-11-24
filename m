Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB7BC80718
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170420.1495488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVbX-0001St-7R; Mon, 24 Nov 2025 12:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170420.1495488; Mon, 24 Nov 2025 12:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVbX-0001RT-3Q; Mon, 24 Nov 2025 12:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1170420;
 Mon, 24 Nov 2025 12:23:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVbW-0000wa-0G
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:23:38 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66e8daab-c930-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:23:37 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so29779785e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:23:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9df99d3sm145932095e9.12.2025.11.24.04.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:23:36 -0800 (PST)
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
X-Inumbo-ID: 66e8daab-c930-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987016; x=1764591816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=befqLlpHDaTOJ168AO4nT4V0UY7lsj7BNiz2u+TXq/s=;
        b=eB/YMSJqN+GaWpdXRpbAdPomijnow9DFL4lvYoXf3LVbu9vSWRFdjZejF3fw9bJ4TM
         pxMGH+Q+pHxDgBaJGABXCJrMCRxkp5DrPOecdlEszZ4Zch6PSzm/3g6fNpmOM+RuhEoI
         BjCx+xrgggW68HI0QjE9DMDHrHAJoo5l0kLoY1bHq3B8Fg5Aaha4gOcCsl6JPgoR3AR7
         bQOJk3sXRexDY07aYMV/qtVGNBCUS1KJAFWQ4c0G15GnQ6C3otF8Jeqg1WNRly4gmHa0
         j0uygHQAhGYCuBkJ6MN3G8sgWiZXuOJdDpzPnxDnMALXhsN6eZUmFnsMjyX/KCRaXq7j
         uG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987016; x=1764591816;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=befqLlpHDaTOJ168AO4nT4V0UY7lsj7BNiz2u+TXq/s=;
        b=vs+G8JhzwyJFakZTxoFAx/EkBfUQ1BDPWWJqdKYZX4Sn9YlORL38wfiJUy5JDAdVh9
         jflWnXeGl6vdhftNe3H2Ecu5fbdCkIAdXzHMWc60wd+FEWf+8LAP1pYJ/EgT/aaIpc/4
         ZDBgTzyK0pCRrg0ZMTaSrbAzeZDtTJM90V2zDAsVdzybVT2wiAXgKk70lOkdBcjs4ZtL
         27Y0SqPrsF6FZ1bt2YhTmrzGYHXBreAmpMV2LNN4V1GVnaLQSBWkUMYYOyWMQ+ijOk7j
         p+AuqZ7p+Wh1OpuKO35wzAEBrkvZ3NgWaKEeuM7e7xDx8ImAqhh+UaoEWzeCJIsNDVxu
         cFhw==
X-Gm-Message-State: AOJu0YxtihmCYx7z6TYfwaBAyM3MVDGMd5zL2hJb59cb60T0jwyDmPsw
	GzY6+Z5rYgDFDxgomoB3N7Bwb/aNkcnh8Cz7xx380GzDJLawMTlxYN/wJoRvmruYlT/cAa4eZQ2
	TQk8=
X-Gm-Gg: ASbGncuTQpoex7vXmA8sQJhftlPc4Ov3UxqFGdUYU+3JX9ui0Iqc1umHh8kmdUuZNDK
	Q44Ujoltnmqbrc6Ge9CH3x4++/DTjlNsOudNYoNDJbUS0iPpb3u+8oVWJMCu6CaUXQ132aCkBFe
	1P2aotrTAKtt4QSTh5UUR9CFlN7TQDiUiXCA2+20iklY/n/tWZvzvAfx6vHDSI08TXEjBSz3EH1
	BrwrfRvu1HoiXdeUraGRDtQ1vTOExrPgFR10ALB4046SQJZcxYRSO/4fy35pLUnKN1bP0RA5d9/
	EAQUkxJBPdL7ZiK9FilaMsOPq3AlDgxDeG0yZ4ImvuEPmZ5Kax+hF7sV62yqTHtgPzVpXUPWbWy
	U5tzxiCHYqf+LT3ptybyblmhrq8DBlYB1CbkDYrK9OVeEKjCxUv7+YH4T8o4ei/d0SnA8ICjLoq
	SWejTwRSjMlfSNyr+QJEWbi3DARHlORLvBNXtC/0358vzDWUM5ozR3WhXnQhZ2tRvj1AYDzZ2hH
	tQ=
X-Google-Smtp-Source: AGHT+IEi5Pau7VI/zCzDyGA/Mp2V+Q9AkV/FUSPoLfiNzaxEVAUspg81R8Y6BJjd8zuNVEzctIzhzQ==
X-Received: by 2002:a05:600c:450f:b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-477c01fa4a8mr128989095e9.30.1763987016491;
        Mon, 24 Nov 2025 04:23:36 -0800 (PST)
Message-ID: <8791387c-2799-4e0b-b187-1900b224a101@suse.com>
Date: Mon, 24 Nov 2025 13:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/6] x86/cpu-policy: define bits of leaf 6
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
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
In-Reply-To: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... as far as we presently use them in the codebase.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Or should we make both parts proper featureset elements? At least
APERFMPERF could likely be made visible to guests (in principle).
---
v2: Use bool and unions.

--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -121,7 +121,46 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x3 - PSN. */
             uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+
+            /* Leaf 0x6 - Therm/Perf. */
+            union {
+                uint32_t _6a;
+                struct {
+                    bool :1,
+                        turbo:1,
+                        arat:1,
+                        :1,
+                        :1,
+                        :1,
+                        :1,
+                        hwp:1,
+                        hwp_notification:1,
+                        hwp_activity_window:1,
+                        hwp_epp:1,
+                        hwp_plr:1,
+                        :1,
+                        hdc:1,
+                        :1,
+                        :1,
+                        hwp_peci:1,
+                        :1,
+                        :1,
+                        hw_feedback:1;
+                };
+            };
+            union {
+                uint32_t _6b;
+            };
+            union {
+                uint32_t _6c;
+                struct {
+                    bool aperfmperf:1;
+                };
+            };
+            union {
+                uint32_t _6d;
+            };
+
             uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
             uint64_t :64, :64; /* Leaf 0x8 - rsvd */
             uint64_t :64, :64; /* Leaf 0x9 - DCA */


