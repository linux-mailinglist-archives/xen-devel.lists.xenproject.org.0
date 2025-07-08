Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD473AFCB38
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036489.1408740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7wY-0008CN-Uc; Tue, 08 Jul 2025 13:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036489.1408740; Tue, 08 Jul 2025 13:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7wY-0008AY-Rx; Tue, 08 Jul 2025 13:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1036489;
 Tue, 08 Jul 2025 13:01:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7wX-0006zh-AW
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:01:05 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a83dc09-5bfb-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 15:01:03 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so3435711f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:01:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c21d67cbasm2373950a91.16.2025.07.08.06.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:00:59 -0700 (PDT)
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
X-Inumbo-ID: 9a83dc09-5bfb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979663; x=1752584463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qJlffilZp56bq/OKiDBvGvagfKN2hZx6aMyEZZYQ5II=;
        b=Kf+DmL49/rHn6AUYcQ98p1SAGOdUXn7pUENnELfQmob0NIsGGSjZPdg9UvuAmHHnVq
         lNe2gdlyBuvIN5jSI3Qojg9KWgg66HKNVKF84/Y4L1pmgvJyBWFyjGOvfgaL+6HrS8H2
         dDCHcE3PMj7G0ka5MWMiOIesKMz3lt5PZW/3a6z79itReQrqNtx2SUh5z9UIz8fEGjFe
         b662/Z1tu9VuNqYbVVI+F7lVsB7vtfjVZr0a3YL86KIQfMPY2pUlRZI1IucFpx/6M/oO
         PFvcSE+BPVTVgjP7Z0rtlTDcocfLcFrRPdkzh1cm5qjzthRV7OxmA17Q+uuRHLw6qmOc
         AcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979663; x=1752584463;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJlffilZp56bq/OKiDBvGvagfKN2hZx6aMyEZZYQ5II=;
        b=YeS9GbFQyEuOYsQRpTYvRIh3Ge8Crq210qrZmBQaca8lX6UxfzrLdBlB9rh3H/euUO
         B+ZaagwJBBJ/Qjzd6Hv6WlBITC3sxC68Fctmpqy+zbZjdfaSadP46l/M7QN47MJ1RjJJ
         0sQp2/nifvfdH52d1eVR6E6gWGC2Prb3OayhrK0+NxznQ/+raUWKdTaZvFqqRrIZBh2m
         VHx5zFtfW4frszCYJNVINs9hLwGq+SX05aqm4KZHwddtYwGmRB1nv1WTRCaipOCfsKyz
         2aKFeTn7mPEzGBVR32H8Hr1R+q9itgGJO5Hcbnd9Ur4VnPBnrwz9PUjbgBpLnmCxM+yS
         gKhQ==
X-Gm-Message-State: AOJu0YxjX1csv3KjwD03KNyZla0CZLYWx8EXGq0O4s1l1z3tY5RiMxa6
	qyd4dGYvXHqI0KfAvAzJMXKGqUqOV+KRgWLvj4DLdHc34nneW8F2AyJ2ZnerZk7shcv1VagN0Ut
	6FrQ=
X-Gm-Gg: ASbGncvd9uZavi6wlY7C2NDd15gmecPFeBX5rM1dq3xg1ft0pT7cM0Rtv1hpUUXfm1i
	P2fGVpVKcglVJqYQ7tNlewTCvyq3UJX69eNPzltArsinn+FeoMCZoCpo2r0NPq+QolacyauNwVb
	vOebRcEdGIBpMvtX0iarZezWtB5YThQFzCPseQ8D/hOpoEJxsUpHipbYR+d/7TcNjdh6ykKefvy
	bUs+aC5OSkkeGBqJCIGRHYLL5FSdZzPj49zpwn3ZHYtUPYoBz6ih+Fqj9isAx8ay0ggxoSyLiyc
	A2w5MjCofmipRykHXcLS1tgM38ogwHlNlr+ZyTgtQveU+oysg9KkN5P1UCYYPDCM6QHX60APNXu
	apWktYz0rplbD7ZGZVA3zY5BfPurW2dnW5mCJ+bKGiggPC8M=
X-Google-Smtp-Source: AGHT+IHatjlJKLNtRQIIPWNIU/FQekytHD449EDZniLbNESf5SZflNyNsbDGR2s5fzJj5/yPGDgTUw==
X-Received: by 2002:a05:6000:1acf:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b5ddf56110mr2416754f8f.0.1751979659796;
        Tue, 08 Jul 2025 06:00:59 -0700 (PDT)
Message-ID: <f0f5ec27-5e62-4da7-96ab-ee10f5cd23f8@suse.com>
Date: Tue, 8 Jul 2025 15:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/9] x86/mwait-idle: add Granite Rapids Xeon D support
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

Add Granite Rapids Xeon D C-states support: C1, C1E, C6, and C6P.

The C-states are basically the same as in Granite Rapids Xeon SP/AP, but
characteristics (latency, target residency) are a bit different.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Link: https://patch.msgid.link/20241107115608.52233-1-artem.bityutskiy@linux.intel.com
[ rjw: Changelog edit ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f557e0d1c2e6
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -784,6 +784,34 @@ static const struct cpuidle_state gnr_cs
 	{}
 };
 
+static const struct cpuidle_state gnrd_cstates[] = {
+	{
+		.name = "C1",
+		.flags = MWAIT2flg(0x00),
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 4,
+		.target_residency = 4,
+	},
+	{
+		.name = "C6",
+		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 220,
+		.target_residency = 650,
+	},
+	{
+		.name = "C6P",
+		.flags = MWAIT2flg(0x21) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 240,
+		.target_residency = 750,
+	},
+	{}
+};
+
 static const struct cpuidle_state atom_cstates[] = {
 	{
 		.name = "C1E",
@@ -1235,6 +1263,11 @@ static const struct idle_cpu idle_cpu_gn
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
+static const struct idle_cpu idle_cpu_gnrd = {
+	.state_table = gnrd_cstates,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
+};
+
 static const struct idle_cpu idle_cpu_avn = {
 	.state_table = avn_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
@@ -1310,6 +1343,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(EMERALDRAPIDS_X,		spr),
 	ICPU(GRANITERAPIDS_X,		gnr),
+	ICPU(GRANITERAPIDS_D,		gnrd),
 	ICPU(ATOM_GOLDMONT,		bxt),
 	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
 	ICPU(ATOM_GOLDMONT_D,		dnv),


