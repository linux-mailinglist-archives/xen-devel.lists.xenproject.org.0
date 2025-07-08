Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC04AFCB1C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 14:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036447.1408681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7tL-000419-E1; Tue, 08 Jul 2025 12:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036447.1408681; Tue, 08 Jul 2025 12:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7tL-0003z3-9s; Tue, 08 Jul 2025 12:57:47 +0000
Received: by outflank-mailman (input) for mailman id 1036447;
 Tue, 08 Jul 2025 12:57:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7tK-0003VI-5f
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 12:57:46 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23e3d1ad-5bfb-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 14:57:44 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2237925f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 05:57:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8fcf6715sm84219845ad.51.2025.07.08.05.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 05:57:43 -0700 (PDT)
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
X-Inumbo-ID: 23e3d1ad-5bfb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979464; x=1752584264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MWLyW6K1AZssDLX7BhZCwY6LTnFNtAJPzbOfiTkm9yM=;
        b=ZwdNkVhWYOpA1BgPLZLg8LOdOfcFbYBWrTAm8qxz0jN8wsqgTEeRD1zcRiiPG1Q4ql
         f+xg2a0DcE9sVgfZcLzz/KTWJS0l2Y+s945QC2BKojWk0Dxf1bAvBLmL1LLeADm8Apfy
         U9M0i+kTnzsJRjTpBnKxPKThejcELMLKjWgc1WDEsO5mdENwPJgS37E267Na+QCd1IrC
         wZUwwWZMHj12awNKgGt7EBbAdvOmZuYRO3VzOlRP4IkbXbgp6ou0VA3pgiB60d3NjzAf
         LJZOQgyuFYe43H/ZvHCpYPZ9x7uD/NRg4FA8nWAz5aZfiOZe4bs/NfavwrMaMKXl17uI
         8izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979464; x=1752584264;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWLyW6K1AZssDLX7BhZCwY6LTnFNtAJPzbOfiTkm9yM=;
        b=qHXNUEdRRhZZLuIexymVC7FYX9cUU7IxwZiJCY8hhF/HEpfCqXYyBcgWbx9ECz3n+g
         QSKn9YCcn705ZytiMfjPQytfCh/M33adacbI+A7enBlV/0Z/KlPOfmJkf7YpwbC56vmI
         2dHlzHXV1Lfn2P4xSa0YOLl/4pPQiVUovW9kenJh1TFdCn9BZkEdEP+hh+ynxi5cL5pz
         SDHkBd6hCV+DpBBisn6pWnHlrTk6a48WhhmJEmHs2pWsCIQY+zl1MfQ61glTHAx0new6
         S2gpuPqZXMgWcw4J/KIl8DUtW3afSpKHBxduNfZm6Wi2ehzt3aN1kk0R5Jxd0IR9sDAo
         /Yaw==
X-Gm-Message-State: AOJu0Yw5eOj8vM5/tYFprPeWASBduVZcXqpmefXMr3ThVtNyt7trO0lN
	wrLXDcY8XXKV46K4c+9UEr7fX0VL64CQvwckBmhOS8WR/RzsQFWylz+FmOAR0UNRurq/1IWVFKz
	pM+U=
X-Gm-Gg: ASbGnct9mrhRnk2UENuNVSYgkeYAq/X9DDeMxEvfCvWwCI7hGyjkPZCb6eSukA5XeuZ
	gdXuDZh+6N4aGf9WMEb0202UiUrFw3GDBrQqcWi9sLIUqjuqsBXGU04gcjP2N9ug5DW26dlHDZX
	sTmVgEgIWxdw+gPhfYZMHD8brWlL+bEgBIa8uv8Wa44Pb/R9DJTVRxteFyZ2iIANzPQbqx13lxo
	MfjfQ2nIDYfyM5vrxBUmee9P3xFOTBHY8CqbQO2FtJK409ZtRvY21E86hpinaDJSdO8rPB/gv0I
	F2GHdcSzXGQIrk6XOKJDHWqpJU/1GwjefeDhDgca6ZKKDeE6KKJ7SVkxJ6nq/ptTJY7xWiJlbX4
	cLQpT6JBhEnw5r6UpxKziFIXBTQE8X6RxNIctO58x9zQiCis=
X-Google-Smtp-Source: AGHT+IG13UP9Q2oxy9hJTgOxY+cnq17c5SKa7mbHkQJT3p0iuv4dR9OGT78XFsWTQ1P+A+gvGWxyMg==
X-Received: by 2002:a05:6000:4210:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3b49701196fmr14727289f8f.12.1751979464046;
        Tue, 08 Jul 2025 05:57:44 -0700 (PDT)
Message-ID: <a3a748af-364e-4fc2-b656-3715eb0658a4@suse.com>
Date: Tue, 8 Jul 2025 14:57:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/9] x86/mwait-idle: Add AlderLake-N support
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
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
In-Reply-To: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Similar to the other other AlderLake platforms, the C1 and C1E states on
ADL-N are mutually exclusive. Only one of them can be enabled at a time.

C1E is preferred on ADL-N for better energy efficiency.

C6S is also supported on this platform. Its latency is far bigger than
C6, but really close to C8 (PC8), thus it is not exposed as a separate
state.

Suggested-by: Baieswara Reddy Sagili <baieswara.reddy.sagili@intel.com>
Suggested-by: Vinay Kumar <vinay.kumar@intel.com>
Signed-off-by: Zhang Rui <rui.zhang@intel.com>
[ rjw: Changelog edits ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 65c0c2367e9e

x86/cpu: Fix Gracemont uarch

Alderlake N is an E-core only product using Gracemont
micro-architecture. It fits the pre-existing naming scheme perfectly
fine, adhere to it.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20230807150405.686834933@infradead.org
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 882cdb06b668

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -678,6 +678,40 @@ static struct cpuidle_state __ro_after_i
 	{}
 };
 
+static const struct cpuidle_state gmt_cstates[] = {
+	{
+		.name = "C1",
+		.flags = MWAIT2flg(0x00) | CPUIDLE_FLAG_DISABLED,
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 2,
+		.target_residency = 4,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 195,
+		.target_residency = 585,
+	},
+	{
+		.name = "C8",
+		.flags = MWAIT2flg(0x40) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 260,
+		.target_residency = 1040,
+	},
+	{
+		.name = "C10",
+		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 660,
+		.target_residency = 1980,
+	},
+	{}
+};
+
 static struct cpuidle_state __ro_after_init spr_cstates[] = {
 	{
 		.name = "C1",
@@ -1083,6 +1117,10 @@ static struct idle_cpu __ro_after_init i
 	.state_table = adl_l_cstates,
 };
 
+static const struct idle_cpu idle_cpu_gmt = {
+	.state_table = gmt_cstates,
+};
+
 static const struct idle_cpu idle_cpu_spr = {
 	.state_table = spr_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
@@ -1148,6 +1186,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(ICELAKE_D,			icx),
 	ICPU(ALDERLAKE,			adl),
 	ICPU(ALDERLAKE_L,		adl_l),
+	ICPU(ATOM_GRACEMONT,		gmt),
 	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(ATOM_GOLDMONT,		bxt),
 	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
@@ -1386,6 +1425,7 @@ static void __init mwait_idle_state_tabl
 		break;
 	case INTEL_FAM6_ALDERLAKE:
 	case INTEL_FAM6_ALDERLAKE_L:
+	case INTEL_FAM6_ATOM_GRACEMONT:
 		adl_idle_state_table_update();
 		break;
 	}


