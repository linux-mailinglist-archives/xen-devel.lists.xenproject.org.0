Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197EAFCB34
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036483.1408731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7w7-0007aA-Nr; Tue, 08 Jul 2025 13:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036483.1408731; Tue, 08 Jul 2025 13:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7w7-0007Y7-KW; Tue, 08 Jul 2025 13:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1036483;
 Tue, 08 Jul 2025 13:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7w6-0006zh-37
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:00:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a4f3812-5bfb-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 15:00:36 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so29953045e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:00:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce35ccb9esm12488109b3a.50.2025.07.08.06.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:00:35 -0700 (PDT)
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
X-Inumbo-ID: 8a4f3812-5bfb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979636; x=1752584436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u3ed5gRqwIPMy5dsz7SJ6P/xF02wveOulMi8hArm5lE=;
        b=aM2ScxXpqZ1nSLahSU1xjgFa+LFxIgeqEHURENIzzC/joKMEL/DF0dFRw/2zOTLs1n
         TWpCC7UR58J3+PyJclVZmWfVSJtrEORY1OIWp1vkCNt2NXpMX0ReZYtku0byTtsVgoFR
         3SeMZLQIQ3U9k+ZuH3yS5OJkuHwNP2hEZFv978ZfGV/6BkZMnJejbdUY19rXqpO6nGLq
         D7SLR/5eSNZ2OcT/9H9sC0K/Y3HGCt93T4xeetXjvEFoLrbtb8m8D0DU8CQx+RYk8tzm
         Y4rLTMi2R85k/eH2GxcabbxfSG+QutnA3nXxrHvXf3Xj0B69ck2l/JAIxAOzEgpCdSDy
         cxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979636; x=1752584436;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3ed5gRqwIPMy5dsz7SJ6P/xF02wveOulMi8hArm5lE=;
        b=fSbIROOmGUiR78OiEebcXN1oh4APNHUhTpkAg0XCl8Ul2JXMHWWiNO79XZ2DII/q9g
         Y3nv6E2oGesu9NciIrL6W/TLx8P2Sj3CxD1ZTSd+w9wFrasAVHWQLvrQPaVvsrReSuGU
         1cNuRor1LcNMO6CDfTuyi4+D+YVi1C/0OowC9mHlZXJSwv9RCzQimzbwG4rkD/d8FPB5
         ElJAy3E965ARbNcNd+VNyyOOW6d5XD7joHAZBEgq/rOuOMJd6aGm3gQEiEvTSLbcVulb
         AIJSD7VGIY3axqcWq4jehL6DVMWTdIyeGnIg11WG/6fTkc7EtXz8feV7WH8JQs08tCnE
         cTgA==
X-Gm-Message-State: AOJu0YxdmmNJ3laDNR+ZMCTTJXFrhmV7070pLqwIp2qv6MJR/GDd09xa
	8n64tsC/i/Dzc3qzrihyTuCjJtbbc8le7iuUzLSKRj2qRnplr6o+8TU+0aZAWeSWu5vaEjWx+IS
	xBM4=
X-Gm-Gg: ASbGnctNRD30jbWBxb5lFzBU9DClIvzzuvm2h18lVaCVucD1agqhsZ8I77EPrVN2Oo3
	o8zfBxRPmPVfVADNIXoWjQo8EEwoJybxMoCmPZGiPsCRmU3xLTzNKqG0ikbEy4pRhB2pXJcHvxY
	jtKkeB7fKaSsz8omHYDHBx9+PfBGP9WJElWWPhPYdphdnef8XrW4KTsooFCv/AotKYY15ZP1YRk
	Ls82wgkO5RRpEhKgc9r5nzEXgoLpVi11YDVdH5CdIAD1BOm0fFHykUk+shZurHvtV1V8qZWVeml
	xrZaiGuUxrA4ElG3Sku+8C6R4eLr8fwhq8OJwVvRyb8I35CdHS/ZuASDrCKLpSm8TARCnKNewrm
	FGS1wtIHet94c52UtxPNTV8bBl0CKbOaiWU0SaYQoKx2cCvU=
X-Google-Smtp-Source: AGHT+IFbQyhxGYfntF3kNsnpJ1vhIMjMnx8m+j4hDZmjOKGaKJ0PtEFf8iSXNOXxA1Ni67E2ss3TKw==
X-Received: by 2002:a05:6000:41d5:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3b4964c3dc3mr12401628f8f.21.1751979635674;
        Tue, 08 Jul 2025 06:00:35 -0700 (PDT)
Message-ID: <359d8ac6-5f54-408d-9f4f-81ff425b7da3@suse.com>
Date: Tue, 8 Jul 2025 15:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/9] x86/mwait-idle: add Granite Rapids Xeon support
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

Add Granite Rapids Xeon C-states, which are C1, C1E, C6, and C6P.

Comparing to previous Xeon Generations (e.g., Emerald Rapids), C6
requests end up only in core C6 state, and no package C-state promotion
takes place even if all cores in the package are in core C6.

C6P requests also end up in core C6, but if all cores have requested
C6P, the SoC will enter the package C6 state.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Link: https://patch.msgid.link/20240806160310.3719205-1-artem.bityutskiy@linux.intel.com
[ rjw: Changelog edits ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 370406bf5738
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -756,6 +756,34 @@ static struct cpuidle_state __ro_after_i
 	{}
 };
 
+static const struct cpuidle_state gnr_cstates[] = {
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
+		.exit_latency = 170,
+		.target_residency = 650,
+	},
+	{
+		.name = "C6P",
+		.flags = MWAIT2flg(0x21) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 210,
+		.target_residency = 1000,
+	},
+	{}
+};
+
 static const struct cpuidle_state atom_cstates[] = {
 	{
 		.name = "C1E",
@@ -1202,6 +1230,11 @@ static const struct idle_cpu idle_cpu_sp
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
+static const struct idle_cpu idle_cpu_gnr = {
+	.state_table = gnr_cstates,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
+};
+
 static const struct idle_cpu idle_cpu_avn = {
 	.state_table = avn_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
@@ -1276,6 +1309,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(ATOM_GRACEMONT,		gmt),
 	ICPU(SAPPHIRERAPIDS_X,		spr),
 	ICPU(EMERALDRAPIDS_X,		spr),
+	ICPU(GRANITERAPIDS_X,		gnr),
 	ICPU(ATOM_GOLDMONT,		bxt),
 	ICPU(ATOM_GOLDMONT_PLUS,	bxt),
 	ICPU(ATOM_GOLDMONT_D,		dnv),


