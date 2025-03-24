Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B01A6D9C0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 13:04:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925421.1328283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twgWp-0001cK-2U; Mon, 24 Mar 2025 12:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925421.1328283; Mon, 24 Mar 2025 12:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twgWo-0001ZY-V8; Mon, 24 Mar 2025 12:03:38 +0000
Received: by outflank-mailman (input) for mailman id 925421;
 Mon, 24 Mar 2025 12:03:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twgWn-0001ZQ-Gm
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 12:03:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04038069-08a8-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 13:03:36 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso22516115e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 05:03:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f55c99sm170125865e9.24.2025.03.24.05.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 05:03:35 -0700 (PDT)
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
X-Inumbo-ID: 04038069-08a8-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742817816; x=1743422616; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyOGreXbOlA3WaFOtjdWCycg+RWAWFkGmtPBXbu/83Q=;
        b=gnRhCIyZaEe5Tq86FcjcO12b3oRnerzOisCmWS08JWlR9Sr0pKJclObeOpdIZqK4GH
         QjsoEnoGBrjW4OybgShm1CQwQqsYbe3+eeG64ydef2py4hWIK4NSwa+Ln55c8o09WHUf
         onqO997VN80ZbvLyR7/fSmPgPir/0fj423RTrurbhN/6dXpSGPQ1abgw3BuC8ANWvt3K
         nBlNuYYdf43nWmtY8G1kTmcXNN2gMDRQwtTEFBlO3TNGaqvxMDuXuimmCG3KY+w2ZFzW
         mIN0INPC4tGeyRQEqmcwba+LROEwKQddJoRHeBDMUvRe8/HV1SEwyLvjwENGdfqCMWnH
         HLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742817816; x=1743422616;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyOGreXbOlA3WaFOtjdWCycg+RWAWFkGmtPBXbu/83Q=;
        b=ZDsvfMPUmOJrF3+Km4E/EwdGDOAAhEpNrinFM2T90AZnG78u6AO+SjuWNRiZT1Acav
         WPLkWOf1O0ugCikCjFeZMGZjjKSTr8schbfc6RzlpMPckdNJCCGGexw/qDRkP6NBPUMV
         MHQmTYMYQzbDDc6RJawQxvC64YUDbQwozDOTUS9hkFDVl7Yk4SCW0Zlv3uPChf+iBtdl
         jgKVraOhAqVeFQ5Nm3LOHnJoQlyT1aszo/PeKXH2mxmqOSp0q+nfXwKOOGtmy8ui41XX
         egubCwpTgLOSPPCQYjRj5bnRZgZwWvdMXyVPErS4eFA8wQKZuFZpOzo45uLdSqhYehcD
         x2Ng==
X-Gm-Message-State: AOJu0YxoxI2029narMfu4SIZnlwbAUjNIfiJnTRGWJKEA6ajkB5NMyXe
	MNGS0mb7GZL/CCFIEmoAVv1g8izMstPmq54gKuAJQPcZMHw48BPSGGN9X/tiC56OsVRi7LMK3EY
	=
X-Gm-Gg: ASbGncv/9Z8/FruErsnN1JZuo36V84JH+Y0latF6OIvVjiFeosIhbrSkdEEAX3zqtEr
	p9yz+JtVKeGDcjH079GWCjYVJV8AKglcbmtDqKn6A2Eq/wqE0rKrTOe2CG48aMGFHEYCzwHYQwo
	HKXIE/03N/YkQInMLiQR7gU4WbiJEQAnda3R5/tuVgee+8U8WOla2jlm3pbgi69D7avTakEJxt1
	4Glqk3gTEtPs/FvGDKyQe2zXY6X2V80g1x9JqjHB+zmLRME/lRNm7VHvuB0RgJVSDVyB9wkqThV
	ydzPA+aVa8NKLmgKLXgx23RYEJoBOh/0ELGf1aErcZi3KHfTPEPOBIiS+DHsp+7c+263hf3Mfok
	63Bz3DuTRGkIZRPoxr8f5NEPe4tTCYA==
X-Google-Smtp-Source: AGHT+IE7qBlUBcsZyUe1RQrPieQ75oR6FRiZPo2hpVbL7aFB5viC+DlSYVbJDB/kqvkCvp1Rj/KoUA==
X-Received: by 2002:a05:600c:ac6:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43d5677bbabmr80766385e9.17.1742817815809;
        Mon, 24 Mar 2025 05:03:35 -0700 (PDT)
Message-ID: <110f0966-0b89-48d6-b1b3-abae93802c19@suse.com>
Date: Mon, 24 Mar 2025 13:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/PVH: account for module command line length
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

As per observation in practice, initrd->cmdline_pa is not normally zero.
Hence so far we always appended at least one byte. That alone may
already render insufficient the "allocation" made by find_memory().
Things would be worse when there's actually a (perhaps long) command
line.

Skip setup when the command line is empty. Amend the "allocation" size
by padding and actual size of module command line. Along these lines
also skip initrd setup when the initrd is zero size.

Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Permit empty initrd with non-empty module command line again.
v2: Use elf_round_up(). Introduce initrd_cmdline local. Re-base.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -652,9 +652,10 @@ static int __init pvh_load_kernel(
     unsigned long image_len = image->size;
     unsigned long initrd_len = initrd ? initrd->size : 0;
     const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
+    const char *initrd_cmdline = NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
-    size_t extra_space;
+    size_t extra_space = 0;
     paddr_t last_addr;
     struct hvm_start_info start_info = { 0 };
     struct hvm_modlist_entry mod = { 0 };
@@ -712,10 +713,26 @@ static int __init pvh_load_kernel(
      * split into smaller allocations, done as a single region in order to
      * simplify it.
      */
-    extra_space = sizeof(start_info);
-
     if ( initrd )
-        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
+    {
+        extra_space = elf_round_up(&elf, initrd_len);
+
+        if ( initrd->cmdline_pa )
+        {
+            initrd_cmdline = __va(initrd->cmdline_pa);
+            if ( !*initrd_cmdline )
+                initrd_cmdline = NULL;
+        }
+        if ( initrd_cmdline )
+            extra_space += strlen(initrd_cmdline) + 1;
+
+        if ( extra_space )
+            extra_space = ROUNDUP(extra_space, PAGE_SIZE) + sizeof(mod);
+        else
+            initrd = NULL;
+    }
+
+    extra_space += sizeof(start_info);
 
     if ( cmdline )
         extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
@@ -740,12 +757,11 @@ static int __init pvh_load_kernel(
         mod.paddr = last_addr;
         mod.size = initrd_len;
         last_addr += elf_round_up(&elf, initrd_len);
-        if ( initrd->cmdline_pa )
+        if ( initrd_cmdline )
         {
-            char *str = __va(initrd->cmdline_pa);
-            size_t len = strlen(str) + 1;
+            size_t len = strlen(initrd_cmdline) + 1;
 
-            rc = hvm_copy_to_guest_phys(last_addr, str, len, v);
+            rc = hvm_copy_to_guest_phys(last_addr, initrd_cmdline, len, v);
             if ( rc )
             {
                 printk("Unable to copy module command line\n");

