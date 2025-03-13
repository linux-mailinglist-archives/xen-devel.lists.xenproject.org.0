Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C6A5F615
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912196.1318516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsilY-000787-CT; Thu, 13 Mar 2025 13:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912196.1318516; Thu, 13 Mar 2025 13:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsilY-00074z-9Q; Thu, 13 Mar 2025 13:38:28 +0000
Received: by outflank-mailman (input) for mailman id 912196;
 Thu, 13 Mar 2025 13:38:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsilW-00074t-Fg
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:38:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fcd0bfd-0010-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:38:24 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso8905585e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:38:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb92csm2167590f8f.91.2025.03.13.06.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:38:23 -0700 (PDT)
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
X-Inumbo-ID: 6fcd0bfd-0010-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741873104; x=1742477904; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzXMOHfPm7CScqNWrsWmokrHguyd8BKiOsFIoGP0Fts=;
        b=B2ltFwAnrf8p3ob70JFd8T67Sxyum9lEb7scHjO53hJBq1FK4VT2qw9WL+HBAGmaBD
         fvbfaAY+WPtn8T5XkwA3nvIeYqEkMBrB7X7Mo3cVfYAxfzlz4zzZUQ/Q9JZKnIpF7yQj
         yJD/MDkCISOSXLdHjbMXTFMwjEhs69bYRWp1hVaixVEfHfTnbrZeDdITbFSURqjW16QQ
         oluFs2NSOoBANZiDQgNhYf3RADiLLV+bAZZ+czraF8g9rcMZx0KlyCajFNI5JlCC4qJu
         XbY11tKIlB9jOKmpg+jhUGhOkHYn3sAcFyCnMGtEG6KY2gN4LXGRm+pvd9w3rilqV6Y6
         +jQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873104; x=1742477904;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzXMOHfPm7CScqNWrsWmokrHguyd8BKiOsFIoGP0Fts=;
        b=OrOEk6BaJglv9qsO6HJGZzF2RUWOgAay7Ep8UyJp0gSONMt3vq00LfXCepPeLkOGmZ
         r7FdwPTWs22GQL8wMdrQbhJN07HcVYbFYGXxDOi7k6EYg452yb2El9g+EmQsiroe0L8d
         N2aphTUILvZVYWau3YgPyKRyGXZdw2udvN65bYLJHzskAk0g8wrNF6MYem+1RwQLMqET
         PjWQGDjsAYq+dJnwziNEYGHgu2/qyYDjX2hdE7wLH4wbtEvvZAoZQZJR/EylY+ZIbed0
         0yseXY1RyN+9+vkct0XiKELvjs5seSiuAdFwIKuyDNbtJyWp4EUet1x+6pqch1+ekcSG
         WMPA==
X-Gm-Message-State: AOJu0YwLR+z5fSyoSMj83/c2jhsXsW8cy+Ob0rduMMNOzdXrHnk+47hL
	vEB0/ifKfZKb1S3Djvi+au0tJa+dHjNzwGAencmeJDgHQYHUvx7B257qb/SxHhUtfBrBxy8bEkU
	=
X-Gm-Gg: ASbGncumQmxUHyIPIN3+jR0L/lP/GGJJJibC6LeGMDpfJrsL2NmI1Zpk57WJ5aeJS5q
	Xqo7Za6c1vEeTER44tGoaBX7AAVXrLJsquFmwt04ADpVo877oOePexWwa7+Av62RHNXooD/JD1K
	vVmsN6SbFvafFbChnwQf15+1Q4UAMJv2YCoOpIqlzB6W17puTmf+GOSrysI4vFXc++JWeMkvP3k
	gQfz7PYtIp3XeqpTLp7zdOSQ9iHJbQbUz0qhGIRsW2wZImqlIA7AJFGLlrhgvSF58HmIfiFDHKi
	PcbNref1F620iNGksJMotPklm/gnYRRxyoOstRkr+fJMXCbtfkQ7YOUz0bOlGP/dWt2yFS1h2p5
	/1z2jgVNB+I1S7jyWJ+77BVYMpSEV6A==
X-Google-Smtp-Source: AGHT+IHno2+MkHdgWaYhwBiUYlFfkV0ukI4B2SfkUhi/OlNXFReumqbScvVtutrtcb25nUE7GZ8/QQ==
X-Received: by 2002:a5d:59a8:0:b0:391:2d76:baaa with SMTP id ffacd0b85a97d-39132db1be7mr23493523f8f.46.1741873103966;
        Thu, 13 Mar 2025 06:38:23 -0700 (PDT)
Message-ID: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
Date: Thu, 13 Mar 2025 14:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] trace: convert init_trace_bufs() to constructor
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

There's no need for each arch to invoke it directly, and there's no need
for having a stub either. With the present placement of the calls to
init_constructors() it can easily be a constructor itself.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Same could then apparently be done for heap_init_late(). Thoughts?

--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -491,8 +491,6 @@ void asmlinkage __init start_xen(unsigne
 
     heap_init_late();
 
-    init_trace_bufs();
-
     init_constructors();
 
     console_endboot();
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2143,8 +2143,6 @@ void asmlinkage __init noreturn __start_
 
     heap_init_late();
 
-    init_trace_bufs();
-
     init_constructors();
 
     console_endboot();
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -336,7 +336,7 @@ int trace_will_trace_event(u32 event)
  * trace buffers.  The trace buffers are then available for debugging use, via
  * the %TRACE_xD macros exported in <xen/trace.h>.
  */
-void __init init_trace_bufs(void)
+static void __init __constructor init_trace_bufs(void)
 {
     cpumask_setall(&tb_cpu_mask);
     register_cpu_notifier(&cpu_nfb);
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -29,9 +29,6 @@
 
 extern bool tb_init_done;
 
-/* Used to initialise trace buffer functionality */
-void init_trace_bufs(void);
-
 /* used to retrieve the physical address of the trace buffers */
 int tb_control(struct xen_sysctl_tbuf_op *tbc);
 
@@ -49,7 +46,6 @@ void __trace_hypercall(uint32_t event, u
 
 #define tb_init_done false
 
-static inline void init_trace_bufs(void) {}
 static inline int tb_control(struct xen_sysctl_tbuf_op *tbc)
 {
     return -ENOSYS;

