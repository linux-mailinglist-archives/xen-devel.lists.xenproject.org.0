Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4116696B80E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790020.1199708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sln2h-0000WP-Ej; Wed, 04 Sep 2024 10:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790020.1199708; Wed, 04 Sep 2024 10:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sln2h-0000Uu-Bc; Wed, 04 Sep 2024 10:15:15 +0000
Received: by outflank-mailman (input) for mailman id 790020;
 Wed, 04 Sep 2024 10:15:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sln2g-0000Uo-8x
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:15:14 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92452190-6aa6-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:15:12 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5333b2fbedaso11181507e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:15:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898922259esm788550766b.209.2024.09.04.03.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:15:11 -0700 (PDT)
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
X-Inumbo-ID: 92452190-6aa6-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725444912; x=1726049712; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeNIzN2b2u/5QAD5o+qedFl6/Bre1iyXww+BMt4MVLk=;
        b=BOQKnJeCV+vXlJ+G0/5GsbhSrSSzrfyBBqubPMUTR9k1FY41pLjCmav/c4mLsF4Hu2
         svL6l4RDjQcvM8WCBtNKfDS82gel/heUlbHaE1sLKSndY+8Y1W8LynvwZLkf8Xo7dic+
         M1c1nY/CY41I1IhHwDg38Ul2s9WTdUD06CLJrx1/eYEKZlApWTCK/S0VczXcNVZKadY1
         L8s91HVC/wu/CJxzCzun4fTUd0rfiagWnQd9LdQOl7LJhrIjqaBL407tbGvOWERhbqMd
         P3lw/i8LrN69Khx7ivXcAQp+bmphlOLMSlCJtGbqIQeOznR7Mi3dYDCPo3LAwrkQRd2D
         wxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725444912; x=1726049712;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GeNIzN2b2u/5QAD5o+qedFl6/Bre1iyXww+BMt4MVLk=;
        b=ZXJnAJKjpVTeALREgoUq3+CUaU+uqmol5Rpf68vcbyMR5Wm+ZmoVZ9xEY9JdIHAnMS
         AUBX+LbtMDt6nlQjz70jalz80f37wXADoIKgAvqFz1qSUdp1TMlPQAxVOjyGIe9HAU5q
         +PFv3MvL3WsDUqEI65bBmCx7HCuPi6y+8VR8Lzi4jMD+0LPP1qJ9ynP3bE74cLun8ZyI
         kq4SI683m9x6B9K5gn0eKtnDWtLfwYsKUe2HsiZq4W2NTFYWVx1Ltd6ysjjEmw/h4/mP
         FB/tS9obkCl5zM9BbsqfpFwqmOrWam5OYRB7U4NSpP5FKZnPzZqvuZoxfEQyAzwnJG8q
         z7eg==
X-Gm-Message-State: AOJu0YxNQ57+PRYuJqy8H53pazJt7BpOJSWqe4ExwMt8Qh2bQbGX1iyA
	Hp10F1DAFwePuu/+5iquDlE4L9fgRH3gYJpkltBLLkSHN8RlMQCGk3fpniDT+d9tUUEOpOs7FVA
	=
X-Google-Smtp-Source: AGHT+IGHYDtReK+cg/Jpy2sMNL/Yu2TNJI8ebV+xYmPb18b6ZVagPybUCDByWcomQFCvf8pt5udrZQ==
X-Received: by 2002:a05:6512:3352:b0:535:6992:f2c3 with SMTP id 2adb3069b0e04-5356992f3dcmr602076e87.41.1725444911650;
        Wed, 04 Sep 2024 03:15:11 -0700 (PDT)
Message-ID: <6c7e29c6-eefa-48a2-9f02-e74b35d0438c@suse.com>
Date: Wed, 4 Sep 2024 12:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: fix UP build with gcc14
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
Content-Transfer-Encoding: 8bit

The complaint is:

In file included from ././include/xen/config.h:17,
                 from <command-line>:
arch/x86/smpboot.c: In function ‘link_thread_siblings.constprop’:
./include/asm-generic/percpu.h:16:51: error: array subscript [0, 0] is outside array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds=]
   16 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
./include/xen/compiler.h:140:29: note: in definition of macro ‘RELOC_HIDE’
  140 |     (typeof(ptr)) (__ptr + (off)); })
      |                             ^~~
arch/x86/smpboot.c:238:27: note: in expansion of macro ‘per_cpu’
  238 |     cpumask_set_cpu(cpu2, per_cpu(cpu_sibling_mask, cpu1));
      |                           ^~~~~~~
In file included from ./arch/x86/include/generated/asm/percpu.h:1,
                 from ./include/xen/percpu.h:30,
                 from ./arch/x86/include/asm/cpuid.h:9,
                 from ./arch/x86/include/asm/cpufeature.h:11,
                 from ./arch/x86/include/asm/system.h:6,
                 from ./include/xen/list.h:11,
                 from ./include/xen/mm.h:68,
                 from arch/x86/smpboot.c:12:
./include/asm-generic/percpu.h:12:22: note: while referencing ‘__per_cpu_offset’
   12 | extern unsigned long __per_cpu_offset[NR_CPUS];
      |                      ^~~~~~~~~~~~~~~~

Which I consider bogus in the first place ("array subscript [0, 0]" vs a
1-element array). Yet taking the experience from 99f942f3d410 ("Arm64:
adjust __irq_to_desc() to fix build with gcc14") I guessed that
switching function parameters to unsigned int (which they should have
been anyway) might help. And voilà ...

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -226,7 +226,7 @@ static int booting_cpu;
 /* CPUs for which sibling maps can be computed. */
 static cpumask_t cpu_sibling_setup_map;
 
-static void link_thread_siblings(int cpu1, int cpu2)
+static void link_thread_siblings(unsigned int cpu1, unsigned int cpu2)
 {
     cpumask_set_cpu(cpu1, per_cpu(cpu_sibling_mask, cpu2));
     cpumask_set_cpu(cpu2, per_cpu(cpu_sibling_mask, cpu1));

