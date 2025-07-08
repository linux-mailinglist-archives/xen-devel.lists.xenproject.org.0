Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA9AFCB2E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036475.1408720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7vh-00075G-GO; Tue, 08 Jul 2025 13:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036475.1408720; Tue, 08 Jul 2025 13:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7vh-00072r-Df; Tue, 08 Jul 2025 13:00:13 +0000
Received: by outflank-mailman (input) for mailman id 1036475;
 Tue, 08 Jul 2025 13:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7vf-0005RT-IP
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:00:11 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b1e094a-5bfb-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:00:11 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so3578318f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:00:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8431a211sm110548245ad.31.2025.07.08.06.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:00:09 -0700 (PDT)
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
X-Inumbo-ID: 7b1e094a-5bfb-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979610; x=1752584410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MTjOQqFh8wQb7VDmEXIv+GaChyb/hvLM77mZdC4kZA0=;
        b=UORqcq2I3tH9GpnuPXah796lgPASqRz9xbla5lTg4nnIG7DBZhYvUUBM7acGSFT20h
         Hez6/CkEuWlfT8yEYhPAX6PbwuTNgXOI5BPCAR/K03Iur3/jwXtbtR16fje/ybYDA3v/
         h1YKI3zht5YslJMWMSNoN2T5erXJwRDKPW4r2nH9lmDbwa3ymUaZi9tND0nmnN/UrFAt
         XyseCEdeubZd8ExZ8Sj4H5DzG6XftaDzVGO4Q14tYeR2SowYXuN+jjAWk37UXzacdsRO
         XW3Al+nHM2wFgGum3f2zUW1FeL7rW/loAkkI7/GLIuyArbZLBS7qf+8TbonP2FCJ33aC
         jG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979610; x=1752584410;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTjOQqFh8wQb7VDmEXIv+GaChyb/hvLM77mZdC4kZA0=;
        b=nPF+T/JfjnuOwgqs5BAgxIXYEn/U2SxXjsmCOSdUZUDZA6rAOoDXo8woTg/GHQ6HLY
         SEKgwLakazGpfXYQUs66oiDOlpLAfYsW2YHRb6f9ag38T233NQD7/0Y6uyseulXUsSqt
         vR37cjXyMsdUVRLd/IbXyOt0VcVrcAG+6EE+uVzn9sEKt/OM/E5hKGBGHrufIbpr6rhp
         UtdcT7leajAd1zeja1Ro3w2dY/CgsVRSAPimMZpD8F7Wcy5QNMerVZHgl8fXUq/iH3hk
         n5XdikubXulrTztrcvnf21sEKYC7SOn8LiraPG8Rb9Vq3FyR1+3nBYRKClBwjE/yCcYy
         6SLQ==
X-Gm-Message-State: AOJu0YzBMZ+vLEJ3sMUXPt9Td+86dU38mv9ZfuMUnhAc3fxrJzrrR1q5
	9W0LfriDzVYuuFjA5fT5ZIsO/cCM4FShCjizPH02yzbSCn1/c8FC5S4zle+LdAYDf4FJ/EGG/P3
	rnWs=
X-Gm-Gg: ASbGncs7UA45eRQZBAAcX8A+hNuuM+xR6/EWkBGvP1xAthZq81stQ7TvaAp1aCWo+KL
	5hbzwsKBET/oCQUNHAIJaYOzarck0oe1gYA7t7qAoGmSg74THulv1p3p8clOMEZJ/SXiO/cNEuB
	CotqgKau4QSMiarCgJ6LjOXwoXi2Bux8qTMAnnzhls3GkTVpuudG1NpLdsfvbICyab+GSvs2ep1
	gxHvzuaA3QOkOKptqLj6WaM3EQJ/SUNT+5g05JqwABFaNANXnFvklNG1ESOQDe1Zpsr1APafW0x
	jpVeYltnvOjYGMdPt6g6ruxZuVpNLu6UmtO2xsNsTJmuvuariulr1iNu2M8OU+RsnYe6q9Ib8fh
	QaFxByeKxiwruPYUEqGLSnRt/nU7SbmvQhOc1JhFM3yjPEC0=
X-Google-Smtp-Source: AGHT+IET7z6Bxrua3NzvjZ0s38ad7qzb6RfuOCX6+pAz581VCq/PHJe+THATCRZnb4L+0D4062o1Tg==
X-Received: by 2002:a05:6000:4205:b0:3a4:f70d:a65e with SMTP id ffacd0b85a97d-3b4970315damr11443145f8f.37.1751979610259;
        Tue, 08 Jul 2025 06:00:10 -0700 (PDT)
Message-ID: <9aaea4c3-6563-4c76-baf1-55ea18210fbf@suse.com>
Date: Tue, 8 Jul 2025 15:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/9] x86/mwait-idle: add Sierra Forest SoC support
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

Add Sierra Forest SoC C-states, which are C1, C1E, C6S, and C6SP.

Sierra Forest SoC is built with modules, each module includes 4 cores
(Crestmont microarchitecture). There is one L2 cache per module, shared
between the 4 cores.

There is no core C6 state, but there is C6S state, which has module scope:
when all 4 cores request C6S, the entire module (4 cores + L2 cache)
enters the low power state.

C6SP state has package scope - when all modules in the package enter C6S,
the package enters the power state mode.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 92813fd5b156
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -950,6 +950,34 @@ static const struct cpuidle_state grr_cs
 	{}
 };
 
+static const struct cpuidle_state srf_cstates[] = {
+	{
+		.name = "C1",
+		.flags = MWAIT2flg(0x00),
+		.exit_latency = 1,
+		.target_residency = 1,
+	},
+	{
+		.name = "C1E",
+		.flags = MWAIT2flg(0x01),
+		.exit_latency = 2,
+		.target_residency = 10,
+	},
+	{
+		.name = "C6S",
+		.flags = MWAIT2flg(0x22) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 270,
+		.target_residency = 700,
+	},
+	{
+		.name = "C6SP",
+		.flags = MWAIT2flg(0x23) | CPUIDLE_FLAG_TLB_FLUSHED,
+		.exit_latency = 310,
+		.target_residency = 900,
+	},
+	{}
+};
+
 static void cf_check mwait_idle(void)
 {
 	unsigned int cpu = smp_processor_id();
@@ -1199,6 +1227,11 @@ static const struct idle_cpu idle_cpu_gr
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
 };
 
+static const struct idle_cpu idle_cpu_srf = {
+	.state_table = srf_cstates,
+	.c1e_promotion = C1E_PROMOTION_DISABLE,
+};
+
 #define ICPU(model, cpu) \
 	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ ## model, X86_FEATURE_ALWAYS, \
 	  &idle_cpu_ ## cpu}
@@ -1248,6 +1281,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(ATOM_GOLDMONT_D,		dnv),
 	ICPU(ATOM_TREMONT_D,		snr),
 	ICPU(ATOM_CRESTMONT,		grr),
+	ICPU(ATOM_CRESTMONT_X,		srf),
 	{}
 };
 


