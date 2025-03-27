Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA5A73365
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 14:32:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929298.1331913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnL6-0005vc-Os; Thu, 27 Mar 2025 13:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929298.1331913; Thu, 27 Mar 2025 13:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnL6-0005uA-MD; Thu, 27 Mar 2025 13:32:08 +0000
Received: by outflank-mailman (input) for mailman id 929298;
 Thu, 27 Mar 2025 13:32:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txnL5-0005u1-Lf
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 13:32:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e03576d5-0b0f-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 14:32:06 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so9282515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 06:32:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f995a10sm19755881f8f.6.2025.03.27.06.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 06:32:05 -0700 (PDT)
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
X-Inumbo-ID: e03576d5-0b0f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743082326; x=1743687126; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkoaVwWLavIxu1YQJCb3NH/+CQa3gtkc1a2kSLpQG28=;
        b=Jd8TD3/AYvuwKNAjVOhAKjAUwzOiP2dAbl2mElpcbgIxsByNisBuuje4ThR+OT0ys9
         lu+Njp7f+SShCtEC4MFpzjpIPaEbwHbIwLqFyfZGIjuCGVqNk2HAkdAH1OD/xdaQ7tcl
         Chh2h0ew3+CtqV7Z2AiZlbaqloiZ68smUMD5DPpvyJ/G7Y9vC9NtTGaJ07YFU3XuBTdj
         iyc/mHJ1v8H7q80n1HpAtSTFzc4xfKA9f86qOzBeMrjijeuBRW3nwfXGNHzCUFtPyEkf
         HIRkxONIocN/0tQZxSdOSFsBj7QUOPg5b6AlbPsI4nWCyHt5vqt/oTGfPxyQJnpINvFX
         +h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082326; x=1743687126;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkoaVwWLavIxu1YQJCb3NH/+CQa3gtkc1a2kSLpQG28=;
        b=aIDvCzDZ4CvJdYH/uojbmiCaSMsLTliAr+FGiR0FS137jW3PsZ06P2yVrBBhK5CpEu
         1Unebg7qcutfMEi0BwtQak0PzJ7gVRP8Xofp+yDm17U5ryuUgChQtZw2MSwdDC2HkuTB
         FG1hJMIyMtQ+IRMa+o1o0Wzb0sAQoQ9Q2QZuHn2aIp+YR6WJXWhwoErX5BepsddQ5g85
         jS9sUonXWdzrZS8nWeCTpf9prnYSqTfRcF2kEBP2CkiRL2hO0aoNBotp5i5i6nbceaTp
         viI0Y3hG2V3acKjB5zj4UweAe8Bqg4FKQesg4t4W9EA0MKTIMPqjbxD8E1WPjRzvmrIM
         SKgQ==
X-Gm-Message-State: AOJu0YwC4C42wd/j6552Xw3t5xoHc6futRTnkh3SpRgM2ZhNluKGOW/L
	f5WTUWd4KfLIqRcBtsuU+W76y2dwfGLIDQ3rIwJfJDm1/rWeZOfbzzb0oFm4z/1GC/poSI5wIFA
	=
X-Gm-Gg: ASbGncvBo48LytDu5g6WNrPamSzaaoNfIEbZomd/G3PUeXanW+4yX18GIP9coOiJsH7
	5VtsCZ4sq5d0hbRyR45Z9pmCuJfq0llqgnOZDOJY7hgxEcu2A2QfEdyFbuhcwBgMjn2NeO+lxSf
	AUbLocRf1mtBeNuGfTV0998BEzHkkEKuY0IUctuxZb6NaKLHcUaDOeX53SzCN6QhRUEBf8/ChWx
	7byak2smqjYJVn5A+XyDkxHDh22NZ3fyPCY8E41LMKer4QYW78fHUOuxPNGBh0LclhOrCBQPc3/
	hz4V46fzAuAt8I0sNHBC3GawnWfg3MoDXtQramW6MA+uI9Wv7PseUV9oJxfrF/KXLn0gomJ/xbD
	xR+Y6SpSitsWW9XW+p0B0TjLT3rj/5g==
X-Google-Smtp-Source: AGHT+IH0n5JHR5/vKHkTlG3sa1k6VaExBrgIAzaFybvzX9QULLCeN+02lt99BGck2XbqUGSV7AJHlQ==
X-Received: by 2002:a5d:47a2:0:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39ad17491aamr2687831f8f.15.1743082325624;
        Thu, 27 Mar 2025 06:32:05 -0700 (PDT)
Message-ID: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
Date: Thu, 27 Mar 2025 14:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxc/PM: correct (not just) error handling in
 xc_get_cpufreq_para()
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

From their introduction all xc_hypercall_bounce_pre() uses, when they
failed, would properly cause exit from the function including cleanup,
yet without informing the caller of the failure. Purge the unlock_1
label for being both pointless and mis-named.

An earlier attempt to switch to the usual split between return value and
errno wasn't quite complete.

HWP work made the cleanup of the "available governors" array
conditional, neglecting the fact that the condition used may not be the
condition that was used to allocate the buffer (as the structure field
is updated upon getting back EAGAIN). Throughout the function, use the
local variable being introduced to address that.

Fixes: 4513025a8790 ("libxc: convert sysctl interfaces over to hypercall buffers")
Amends: 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative error and stash error in errno")
Fixes: 31e264c672bc ("pmstat&xenpm: Re-arrage for cpufreq union")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -212,31 +212,32 @@ int xc_get_cpufreq_para(xc_interface *xc
     DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
 			 user_para->scaling_available_governors,
 			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-
-    bool has_num = user_para->cpu_num &&
-                     user_para->freq_num &&
-                     user_para->gov_num;
+    unsigned int in_gov_num = user_para->gov_num;
+    bool has_num = user_para->cpu_num && user_para->freq_num;
 
     if ( has_num )
     {
         if ( (!user_para->affected_cpus)                    ||
              (!user_para->scaling_available_frequencies)    ||
-             (user_para->gov_num && !user_para->scaling_available_governors) )
+             (in_gov_num && !user_para->scaling_available_governors) )
         {
             errno = EINVAL;
             return -1;
         }
-        if ( xc_hypercall_bounce_pre(xch, affected_cpus) )
-            goto unlock_1;
-        if ( xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
+        ret = xc_hypercall_bounce_pre(xch, affected_cpus);
+        if ( ret )
+            return ret;
+        ret = xc_hypercall_bounce_pre(xch, scaling_available_frequencies);
+        if ( ret )
             goto unlock_2;
-        if ( user_para->gov_num &&
-             xc_hypercall_bounce_pre(xch, scaling_available_governors) )
+        if ( in_gov_num )
+            ret = xc_hypercall_bounce_pre(xch, scaling_available_governors);
+        if ( ret )
             goto unlock_3;
 
         set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
         set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
-        if ( user_para->gov_num )
+        if ( in_gov_num )
             set_xen_guest_handle(sys_para->scaling_available_governors,
                                  scaling_available_governors);
     }
@@ -246,7 +247,7 @@ int xc_get_cpufreq_para(xc_interface *xc
     sysctl.u.pm_op.cpuid = cpuid;
     sys_para->cpu_num  = user_para->cpu_num;
     sys_para->freq_num = user_para->freq_num;
-    sys_para->gov_num  = user_para->gov_num;
+    sys_para->gov_num  = in_gov_num;
 
     ret = xc_sysctl(xch, &sysctl);
     if ( ret )
@@ -256,12 +257,11 @@ int xc_get_cpufreq_para(xc_interface *xc
             user_para->cpu_num  = sys_para->cpu_num;
             user_para->freq_num = sys_para->freq_num;
             user_para->gov_num  = sys_para->gov_num;
-            ret = -errno;
         }
 
         if ( has_num )
             goto unlock_4;
-        goto unlock_1;
+        return ret;
     }
     else
     {
@@ -298,13 +298,13 @@ int xc_get_cpufreq_para(xc_interface *xc
     }
 
 unlock_4:
-    if ( user_para->gov_num )
+    if ( in_gov_num )
         xc_hypercall_bounce_post(xch, scaling_available_governors);
 unlock_3:
     xc_hypercall_bounce_post(xch, scaling_available_frequencies);
 unlock_2:
     xc_hypercall_bounce_post(xch, affected_cpus);
-unlock_1:
+
     return ret;
 }
 

