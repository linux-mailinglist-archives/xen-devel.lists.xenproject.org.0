Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5864C894FA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 11:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172504.1497568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCoT-0005ma-Iu; Wed, 26 Nov 2025 10:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172504.1497568; Wed, 26 Nov 2025 10:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOCoT-0005jF-G0; Wed, 26 Nov 2025 10:31:53 +0000
Received: by outflank-mailman (input) for mailman id 1172504;
 Wed, 26 Nov 2025 10:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOCoR-0005j9-R6
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 10:31:51 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6ecf26-cab3-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 11:31:49 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so43166325e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 02:31:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adf0b2asm34372895e9.11.2025.11.26.02.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 02:31:48 -0800 (PST)
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
X-Inumbo-ID: 1d6ecf26-cab3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764153108; x=1764757908; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygbQtP4Gy+uyLgHvdIXGVmUP8yFQ+ItIK+LjfBJ3E80=;
        b=WTr7BHIa6f/K2851I0AMI0NAFSGDWymU8qMRYavli+8HaUr5GCMAf8ZAWNI8wUehqX
         TbW5IiR6bq3GIPSXGkNPrC2KyI0Al/qJa4ejO+hED+uy+zsWrXSA9YDIklABDHeEmhkJ
         660PtuDn5QhZzJ3i1ML+4e16ji20t8fGpZKmHz3LUm6RfSHln+8415AtgE6UAe8MIbVr
         RoiOwONCOP7M643/HDQA5VhCDDhjXF/ti9j/7eRMQ8IfDf4DRcHIFL5DLGM4esaH7Lw4
         GxOEtongmsUyea7UCNFWevVYSd2cczCuLJgFkO7mSlqdI5Aid5RdoZM1HHWq84ydruF3
         HC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153108; x=1764757908;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygbQtP4Gy+uyLgHvdIXGVmUP8yFQ+ItIK+LjfBJ3E80=;
        b=rrwrAA+u0yCl8SfEZFWGOjy1lD4n1yN5APDwVSYVQNgkytkE6cJsRGKnVM0YvFxRBA
         CIdeI0AbIJdzm9voJxOZ+nhF67Zqx6DifBXDt7vp7o4/ZSGovial6JMus/Sv0PNnaMdp
         Znl0ziRik/6Dc3rvyZogmN71kGHAEsqb9yPBWcDJWIKlLF/GCZDEAJFXJ5d7X2NDjP0c
         mT0/Nm4bsEeb8HzKnp6kDNyV8h9/I5otdSsKjnHDB4uwqA13QoOKBPekBaYFbKPDhSx0
         6J+2/sOESH6hCPXLi6sTty21RlLm0YmSquAzzX0msUar93XQsALoFp96/PQjFzPvvwRk
         zBgA==
X-Gm-Message-State: AOJu0Yy3ayMfKZyt8lngao+64JeTgguQk4JZxiSu3rCrUd5F6tPfzm6U
	ocekGgoc6mbQKDChL+Fv2Ay3ECTdlHPY4bFZud5PgVz8guS3QgEIWpyWwuBCbtT98CQdCuAY3fy
	tv5U=
X-Gm-Gg: ASbGncuqfuYiUrwnWO5/Tw6Isefh9lM7ii/uTA+LQx5nfWjLehJPCkvlTPNG/ziFyse
	VfH1muGDjhgG9yHgZqsJMloXLjAwZ/wdo8HpXqZcslJfmZ3/DNIboMRAJMxjegH1ZJMKD4cv4TR
	Upn2c/FRDJAVgWNHX6Jfa6aRExrrg1yKZb/w2h0xqv4O/ghYjsMuhJxR2+bcty5SH4wPOckPKhO
	5gVRqcaWBgI4ro7u5mfBabOjNGxhXxU8h26msgj+fN5L9xT5AYsDAbm+Tc4wwOF0NUvCXk/AIs0
	7/Pv8FzkxnTDJZ9Kqztt2gKJs+Y1cUb5zPFY9cUU5egobptctZEIc4UsXRNYqNEB9dnib3JunS5
	M5x1gWLLe2qTWoectCr20bJCd+SZNx//0UtWYiX4aXPyyupJCKMwR+lLxHnjqmNu/FyK2lzZnq8
	aqwbatUDaCdXJ1aYsFj/gEGWEd/RDqfzseO5REt9yYXFhlpbxlbJfzE1Dhu/zgxD8DAV3AYMlOV
	4g=
X-Google-Smtp-Source: AGHT+IGGyoWYVme04GJAdaNhVIIJ9qvAKtlsOqaFPRnFkFcWpRjj/QOwJjfLarYBEeGHU7RQuA6Czg==
X-Received: by 2002:a05:600c:310d:b0:477:9fcf:3ff9 with SMTP id 5b1f17b1804b1-477c01c359fmr182474385e9.27.1764153108582;
        Wed, 26 Nov 2025 02:31:48 -0800 (PST)
Message-ID: <b010c8ad-afcf-43f4-b273-fdb43ab641ed@suse.com>
Date: Wed, 26 Nov 2025 11:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] domain: skip more stuff for idle's vCPU-s in vcpu_create()
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

Nothing hypercall-related needs setting up there. Nor do we need to
check whether the idle domain is shutting down - it never will.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For vmtrace_alloc_buffer() adding the conditional may be questionable: The
function checks d->vmtrace_size first thing, bailing immediately when it's
zero (which it always will be for the idle domain).

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -427,12 +427,6 @@ struct vcpu *vcpu_create(struct domain *
     v->vcpu_id = vcpu_id;
     v->dirty_cpu = VCPU_CPU_CLEAN;
 
-    rwlock_init(&v->virq_lock);
-
-    tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
-
-    grant_table_init_vcpu(v);
-
     if ( is_idle_domain(d) )
     {
         v->runstate.state = RUNSTATE_running;
@@ -440,6 +434,12 @@ struct vcpu *vcpu_create(struct domain *
     }
     else
     {
+        rwlock_init(&v->virq_lock);
+
+        tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
+
+        grant_table_init_vcpu(v);
+
         v->runstate.state = RUNSTATE_offline;
         v->runstate.state_entry_time = NOW();
         set_bit(_VPF_down, &v->pause_flags);
@@ -450,7 +450,7 @@ struct vcpu *vcpu_create(struct domain *
     if ( sched_init_vcpu(v) != 0 )
         goto fail_wq;
 
-    if ( vmtrace_alloc_buffer(v) != 0 )
+    if ( !is_idle_domain(d) && vmtrace_alloc_buffer(v) != 0 )
         goto fail_wq;
 
     if ( arch_vcpu_create(v) != 0 )
@@ -468,7 +468,8 @@ struct vcpu *vcpu_create(struct domain *
     }
 
     /* Must be called after making new vcpu visible to for_each_vcpu(). */
-    vcpu_check_shutdown(v);
+    if ( !is_idle_domain(d) )
+        vcpu_check_shutdown(v);
 
     return v;
 

