Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF286B0DD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:53:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686644.1068909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKNC-0002OM-Ku; Wed, 28 Feb 2024 13:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686644.1068909; Wed, 28 Feb 2024 13:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKNC-0002L7-HN; Wed, 28 Feb 2024 13:53:26 +0000
Received: by outflank-mailman (input) for mailman id 686644;
 Wed, 28 Feb 2024 13:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfKNA-0002Kr-CK
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:53:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc70ed05-d640-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 14:53:22 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3122b70439so694660466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:53:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s24-20020a170906bc5800b00a3efa4e033asm1870713ejv.151.2024.02.28.05.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 05:53:21 -0800 (PST)
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
X-Inumbo-ID: bc70ed05-d640-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709128402; x=1709733202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8+WqFSaalzUAe+nFKzuTogcSanw3XdVfQLlmS0YufqE=;
        b=WcbTao1+xDJZDr5rHAtpwwYDm/khjGu5DwDNyCOdvR/GrfV7WbmsLwBGPjl2XXYhUu
         8pOFe+yKlNhdSh8k9CViBC/EchGht2418mfV0MkvZvPApGsTbmakJkpDbcm2J0N1TaCm
         jQeFCyT4Ep1Wt/4MOI8XeeomF7v4gYndEoWK1YQ66uRsHz1xnbysNMxrs8EQoFfShDcg
         Zy9A9QrmF6MAn1ZOQUS/pP71bQMg4iai0xB1tcoisliXMSRonUoAPdnnFdioD9S4Qvga
         UVttXBH81PXxJIyC4zUXY+uMU6cGll8XqUHZHaRhFAYzb2kGE9L54nIQGyTFsGDgMle1
         2gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128402; x=1709733202;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+WqFSaalzUAe+nFKzuTogcSanw3XdVfQLlmS0YufqE=;
        b=sQ2Wlqf4kpv+2DRT0oWjjSVNIbqvr69yaRbGmJVoHsquR07D+0APbe8DmSHvpvcQZ/
         Daab6jF3NvnilWEssuQ69EDhV8kqMdoyRVG75mcSSuPnDOY191QA5xI2n66cJ7L+dTFu
         LIBBY8gMmrHmJgT7MdYexinOV5qhXGE1VJADPUkw+ZVKBFyhjLTPYWn61x1pSD1J49iZ
         toURCU0aFhEYmE64FpBYAQ0WiAZVQodr6A5ZOiuaxHbTW6nt1CtaNvlJjcT+1uEzj7JG
         KYxZH2Rr6QK6QZQxgeOz3f2d30xsLp1x6XZYUy0QHFAtBwtFbA/+CIx64VN4GVBGDImh
         D85w==
X-Gm-Message-State: AOJu0Ywg2G7WgmHy7x2xAfRCEfTZpHsYy6RtXNLO30OISlnAMBXDEQwP
	ulitziYCE1iTZwKWloZMHsSMqfV6/kYW4f00bWaHqzK4G4F0PZqI8++aEMEPqdxjAjkv0XtAMGk
	=
X-Google-Smtp-Source: AGHT+IFXBj6+nUIuDVTPACCxjqiwBVHNhpXEO8GKSg4nnFMo8PfQlrLEa79p1XwGxbyquvxdvyeu3A==
X-Received: by 2002:a17:906:1996:b0:a43:f22e:57a6 with SMTP id g22-20020a170906199600b00a43f22e57a6mr1415733ejd.67.1709128401845;
        Wed, 28 Feb 2024 05:53:21 -0800 (PST)
Message-ID: <fdacbb8b-5a58-4d6b-89b2-ea98b4fed895@suse.com>
Date: Wed, 28 Feb 2024 14:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] x86: prefer shadow stack for producing call traces
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
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
In-Reply-To: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Shadow stacks contain little more than return addresses, and they in
particular allow precise call traces also without FRAME_POINTER.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the 'E' for exception frames is probably okay, I'm not overly
happy with the 'C' (for CET). I would have preferred 'S' (for shadow),
but we use that character already.

As an alternative to suppressing output for the top level exception
frame, adding the new code ahead of the 'R' output line (and then also
ahead of the stack top read) could be considered.

Perhaps having a printk() for the PV entry case is meaningless, for
- no frame being pushed when entered from CPL=3 (64-bit PV),
- no entry possible from CPL<3 (32-bit PV disabled when CET is active)?
In which case the comment probably should just be "Bogus." and the code
merely be "break;".

Quite likely a number of other uses of is_active_kernel_text() also want
amending with in_stub().

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -449,6 +449,11 @@ unsigned long get_stack_dump_bottom(unsi
     }
 }
 
+static bool in_stub(unsigned long addr)
+{
+    return !((this_cpu(stubs.addr) ^ addr) >> STUB_BUF_SHIFT);
+}
+
 #if !defined(CONFIG_FRAME_POINTER)
 
 /*
@@ -539,6 +544,50 @@ static void show_trace(const struct cpu_
          !is_active_kernel_text(tos) )
         printk("   [<%p>] R %pS\n", _p(regs->rip), _p(regs->rip));
 
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && rdssp() != SSP_NO_SHSTK )
+    {
+        const unsigned long *ptr = _p(regs->entry_ssp);
+        unsigned int n;
+
+        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
+        {
+            unsigned long val = *ptr;
+
+            if ( is_active_kernel_text(val) || in_stub(val) )
+            {
+                /* Normal return address entry.  */
+                printk("   [<%p>] C %pS\n", _p(val), _p(val));
+                ++ptr;
+            }
+            else if ( !((val ^ *ptr) >> (PAGE_SHIFT + STACK_ORDER)) )
+            {
+                if ( val & (sizeof(val) - 1) )
+                {
+                    /* Most likely a supervisor token. */
+                    break;
+                }
+
+                /*
+                 * Ought to be a hypervisor interruption frame.  But don't
+                 * (re)log the current frame's %rip.
+                 */
+                if ( n || ptr[1] != regs->rip )
+                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));
+                ptr = _p(val);
+            }
+            else
+            {
+                /* Ought to be a PV guest hypercall/interruption frame.  */
+                printk("   %04lx:[<%p>] E\n", ptr[2], _p(ptr[1]));
+                ptr = 0;
+            }
+        }
+
+        /* Fall back to legacy stack trace if nothing was logged at all. */
+        if ( n )
+            return;
+    }
+
     if ( fault )
     {
         printk("   [Fault on access]\n");


