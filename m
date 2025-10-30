Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33D0C1FF1B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153571.1483875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERUc-0007ae-Mr; Thu, 30 Oct 2025 12:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153571.1483875; Thu, 30 Oct 2025 12:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vERUc-0007YG-JG; Thu, 30 Oct 2025 12:11:02 +0000
Received: by outflank-mailman (input) for mailman id 1153571;
 Thu, 30 Oct 2025 12:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vERUa-0007Y8-UX
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:11:00 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da4c66b-b589-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 13:10:57 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47112a73785so7406195e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 05:10:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728aa6b0dsm35181115e9.14.2025.10.30.05.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 05:10:56 -0700 (PDT)
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
X-Inumbo-ID: 7da4c66b-b589-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761826257; x=1762431057; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPWcilGeVfl3WelYnKhDoEbw+O6Hxo/BoXkhvlcRfUo=;
        b=XUrtJDHUaHliQMLd0IeIIR/fbymL70rD0/VtRaoNQSFLCpg5uox5lqnmU2Sq8CI8ub
         6uzSaxV2bG2qGyVp9Kwnc46Bfoh/cUy6HPiooPKREeI/cMb1fP/HD3MX+EyRuZ+e6hoZ
         W9J1cQExmrKojJTxAo2zth+msi2FHRVsaDVsetW6VL7q4IIlbaMlI/p8N62Bb7y+3IR3
         s1YMjs7A6sJlsrWKv9Ale35ja9+m14h6EuBKRkkjwUIniE3BRSBBo456MOxO/zLkOAj4
         tSaP+CO4hKl8mPSEB/5YnW70iQQJnFeacNqpmEiuQ0uFyUtuNgyBzeySWVw4ow9B+ivc
         gd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826257; x=1762431057;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPWcilGeVfl3WelYnKhDoEbw+O6Hxo/BoXkhvlcRfUo=;
        b=kdIZ09EaaZdba/3Qtr3UtwZn0hQWrtIDv7Id584S0pjEnHHU0J7NK7bf2HvX/syduR
         NLCZE1oxbCvt1B1AhypmeVPzudRxZao4zxUbQ+TzVvf8nqOeaQnMhwb1yWxSysTUlicN
         Ux8QC8ZLBrQMFyRkY1eo0ITQlQ1TOdedn4I+Fkq9g3GTdch+trVv0NLEEHk7cy298ypT
         UhPPjDJgqvAqc31Px3hgqSklY6YxfYMVSy5Hwb17jvHZGaYAlponDsrn/fI638v01+Wa
         H6M+sqvQ5O6u8pKzHsLd/bBai7Erle2NvV1JT/ply/ZWwMR6Ckeb9Q6Fj8Hkda71DpXG
         irWQ==
X-Gm-Message-State: AOJu0Yx12qr2e/gt+II5dO1Tw3O+O2SHqF82jFrM/XoC6AbJmMvgB/e+
	4zOPnq1HiPBR01VWK89LVP0fERCG9+sXa5r5vpt7uEDSs+SI4x5EYDz7gnSyZn/29+alDoel8TB
	zVJk=
X-Gm-Gg: ASbGncurE/sJ3s9DFS4bYc8xq8MNqQZBnJpMs/dNmXprLT6co9ujU5DpvxQ8gTv9Wpi
	GhNX8iEAGPgJPRRCC68lwmlgOv98Ox51oVsABhLvotPPUYYxFLVtP/Jav01AU+LKbnZ0+tSs5vB
	Z8MI1W0nMkUNefXfhzmnyFtYPpDyzO83NWWO3Lqw4h1ODh30tfCotdYxs4MTy0SmvxzOF2GzZJt
	6nZ6hzNG5Lww7/MQ4t5MSVRsHuv8Ky22o7IuOG92FWsEojxtExR6mXdVEpOr62hRgZNwsaRWJsX
	J9kUyNubW91M+ok7JbzP3XzcO2qYpbC83RQs/Ep83vb+POfyctT6fpx2RRyuFqP0f4qd6fxqHgT
	5osj51Dix7gCpevHPUP19BBMwrw7yt9ljsveSsWHc6Yh8ZpM6CHySxFLWq9nx8uOHFm74XgVHmG
	X4riJiIg4/fVTUlOzYQX4xDUBvdKNYtFyPylkj4aAHst0Qx0s8lXnoE+rt0SLP1RR0HskeVwg=
X-Google-Smtp-Source: AGHT+IHc8DZGQw3tXFMVk+xQ1UTA13RrZ9z66HaFe5oMn2dqYE18XMZ/+z6CopJ9z7BsUYVdw+Iq/w==
X-Received: by 2002:a05:600c:4e8f:b0:475:f16f:6f44 with SMTP id 5b1f17b1804b1-4771e3ac8eemr53416695e9.27.1761826256597;
        Thu, 30 Oct 2025 05:10:56 -0700 (PDT)
Message-ID: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
Date: Thu, 30 Oct 2025 13:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] domain: adjust soft-reset arch dependency
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

Arm's arch_domain_soft_reset() returning -ENOSYS is quite unhelpful: This
way a domain will be crashed if a tool stack mistakenly invokes
XEN_DOMCTL_soft_reset on it. Instead the tool stack should be told of its
mistake.

Introduce HAS_SOFT_RESET, implied only by x86. "imply" rather than
"select" such that HAS_SOFT_RESET can later gain a dependency on
MGMT_HYPERCALLS. That way HAS_SOFT_RESET will go off when
MGMT_HYPERCALLS is off.

Check the new setting early in domctl handling, and compile out the thus
dead (when HAS_SOFT_RESET=n) domain_soft_reset() as well as its dedicated
helpers.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -875,11 +875,6 @@ void arch_domain_unpause(struct domain *
 {
 }
 
-int arch_domain_soft_reset(struct domain *d)
-{
-    return -ENOSYS;
-}
-
 void arch_domain_creation_finished(struct domain *d)
 {
     p2m_domain_creation_finished(d);
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -214,11 +214,6 @@ void arch_domain_unpause(struct domain *
     BUG_ON("unimplemented");
 }
 
-int arch_domain_soft_reset(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_domain_creation_finished(struct domain *d)
 {
     BUG_ON("unimplemented");
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -188,11 +188,6 @@ void arch_domain_unpause(struct domain *
     BUG_ON("unimplemented");
 }
 
-int arch_domain_soft_reset(struct domain *d)
-{
-    BUG_ON("unimplemented");
-}
-
 void arch_domain_creation_finished(struct domain *d)
 {
     BUG_ON("unimplemented");
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_PCI_MSI
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
+	imply HAS_SOFT_RESET
 	select HAS_UBSAN
 	select HAS_VMAP
 	select HAS_VPCI if HVM
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1030,6 +1030,7 @@ void arch_domain_unpause(struct domain *
         viridian_time_domain_thaw(d);
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 int arch_domain_soft_reset(struct domain *d)
 {
     struct page_info *page = virt_to_page(d->shared_info), *new_page;
@@ -1131,6 +1132,7 @@ int arch_domain_soft_reset(struct domain
 
     return ret;
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
 
 void arch_domain_creation_finished(struct domain *d)
 {
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -155,6 +155,9 @@ config HAS_PMAP
 config HAS_SCHED_GRANULARITY
 	bool
 
+config HAS_SOFT_RESET
+	bool
+
 config HAS_STACK_PROTECTOR
 	bool
 
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2351,6 +2351,7 @@ argo_destroy(struct domain *d)
     write_unlock(&L1_global_argo_rwlock);
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 void
 argo_soft_reset(struct domain *d)
 {
@@ -2374,3 +2375,4 @@ argo_soft_reset(struct domain *d)
 
     write_unlock(&L1_global_argo_rwlock);
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1687,6 +1687,7 @@ void domain_unpause_except_self(struct d
         domain_unpause(d);
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 int domain_soft_reset(struct domain *d, bool resuming)
 {
     struct vcpu *v;
@@ -1724,6 +1725,7 @@ int domain_soft_reset(struct domain *d,
 
     return rc;
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
 
 int vcpu_reset(struct vcpu *v)
 {
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -466,6 +466,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
 
     case XEN_DOMCTL_soft_reset:
     case XEN_DOMCTL_soft_reset_cont:
+        if ( !IS_ENABLED(CONFIG_HAS_SOFT_RESET) )
+        {
+            ret = -EOPNOTSUPP;
+            break;
+        }
+
         if ( d == current->domain ) /* no domain_pause() */
         {
             ret = -EINVAL;
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3962,6 +3962,7 @@ int gnttab_release_mappings(struct domai
     return 0;
 }
 
+#ifdef CONFIG_HAS_SOFT_RESET
 void grant_table_warn_active_grants(struct domain *d)
 {
     struct grant_table *gt = d->grant_table;
@@ -4006,6 +4007,7 @@ void grant_table_warn_active_grants(stru
 
 #undef WARN_GRANT_MAX
 }
+#endif /* CONFIG_HAS_SOFT_RESET */
 
 void
 grant_table_destroy(

