Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE238B139DA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 13:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061348.1426904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugM1O-0006bg-Hc; Mon, 28 Jul 2025 11:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061348.1426904; Mon, 28 Jul 2025 11:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugM1O-0006am-Dt; Mon, 28 Jul 2025 11:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1061348;
 Mon, 28 Jul 2025 11:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugM1M-0006ad-S0
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 11:27:56 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8001438-6ba5-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 13:27:55 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so2009937f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 04:27:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffdea35d1sm31625035ad.28.2025.07.28.04.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 04:27:54 -0700 (PDT)
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
X-Inumbo-ID: e8001438-6ba5-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753702075; x=1754306875; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yZixrOsQ1geRi9hdx6coZywwcx8ktrpvj8GwJmt9rw=;
        b=VLszZAG5SoLQsk0F0cuN89RzU8QKOW2cwfdZ4PrH7s/chEm/1vPYiNFl9ntbgdjmBL
         i5qmO8If3EZ3hk2BD3FJkBdRQXD9vOjrad+f8yhjWHk1V+5WlNM5xAGoOR61cHJjuINp
         ysN/6Tyox/zh0NhzY+Cz77niuB7GZefZoO0cxhdQx6omovzhUTAUxjTnHYTuygP+yptK
         3+UARHk6leaH67PA8UwdjZCoeJGGy5evzCaJ+T6zhLf9/NB86VNDxmeJzB+mEL7OsgKJ
         0G4YjS7mhas89/Pu69UiFUTrP+zvmPRrXp6U8lqx72TFiNpdPgKQhnJppNhuKuKTcrwu
         0ySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753702075; x=1754306875;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yZixrOsQ1geRi9hdx6coZywwcx8ktrpvj8GwJmt9rw=;
        b=pzIMFHzia/FEnqX4nZds6e8EPdwNB3CgJf4h8VJX+1JpjOkjUPov2W/HuCjMbI3XI+
         D0KMtpwR8NTkPy+P3rEJBq7np/O9daUgMll6Kb+K3MvUd5f1UWgKR60RxsZhxcAuIeaA
         lkY9oNzTn9RkWwkHbDtMSqvoMfb0qBPwwJTO590Tg6vEyz7R7JFVFTZeUsVj7TfyJ4s4
         uj8MA+bIWCCcf/fAqfH8q94hbqzTQfnldBs8on/r2KvOAYRKLL8sb3+FuR2g1AgBFEGk
         Mel4iYM3RvpQLlwYi8Z173b8Jax1/UJRkZY6lXj5gOcDce1dIXpeEo+U6djBUquYEVYK
         KTXQ==
X-Gm-Message-State: AOJu0YwlfxBzmudLkBVl1Kj/iSWeWh/uvHV8RYeRl9Hkv/5Qy+7FTEbC
	NG+xtoGk0ge1WM7LaG6sXbs7HZmTqmhjnNhSVHKV1PqKWurAjis/xzL8XskY9pjY0m4DJOTF7bH
	ilI0=
X-Gm-Gg: ASbGncs2lm0W96h2MStn/Cyj1gMuJvdWjgstJ3HfJ4zGi+LD4KW3j8q5dONfuD7+9QQ
	IHkH89rWkLrqA5Aee9O0wF7WfEgaH27b/neE27EuNHyGgXl8I6n2GtSz6TpDeSOt0y7x4UkDoca
	siopEMuEKhFIdf7fDOtxnnMLWaHiqC5GPrCoFwyYInak2BK2uE4CLG8V0KU7p9U284qFNHZwLRa
	KGmDo6z/Xuw7tyubEE8DpGIOfwp3+4KOdXiGtoL9RuuIRmNTlHv17sAyhybaVVXYGoRooaZUfGK
	15V7HTTVUVPVto3B9hSHDnntkQUP/GniV/LFxqTDjMBN9SaUUHjWXU///uxXuQXr1jXcwxqkQQ7
	g2zmA/g4Lfch3HrI82xD0/EW9hYV3sE1JEV9sA/4o6CfkDEJTqyr94wKaRIlKu0wIDUy7gD0xG9
	m9C0qWx58=
X-Google-Smtp-Source: AGHT+IEd30cD7CCXBqUxYOPtde4kVBUfBPITnKXOnTrlvfzPkyLfkcSSjPQujIiQGYXcZ/qjxFnfSA==
X-Received: by 2002:a05:6000:26c1:b0:3b5:e714:9770 with SMTP id ffacd0b85a97d-3b776733877mr8587399f8f.14.1753702074919;
        Mon, 28 Jul 2025 04:27:54 -0700 (PDT)
Message-ID: <c9e21aa4-5267-4fa7-b304-1d8c1ff32472@suse.com>
Date: Mon, 28 Jul 2025 13:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/oprofile: switch to xv[mz]alloc_array()
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

Use the more "modern" forms, thus doing away with effectively open-
coding xmalloc_array() at the same time. While there is a difference in
generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
code really cared about such higher than default alignment, it should
request so explicitly.

While at it also use XVFREE() instead of open-coding it, or instead of
leaving a dangling pointer, and change loop induction variable types.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Use xvmalloc*(), extending to op_model_ppro.c as well.

--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -19,7 +19,10 @@
 #include <xen/string.h>
 #include <xen/delay.h>
 #include <xen/xenoprof.h>
+#include <xen/xvmalloc.h>
+
 #include <public/xenoprof.h>
+
 #include <asm/msr.h>
 #include <asm/apic.h>
 #include <asm/regs.h>
@@ -142,30 +145,29 @@ static void cf_check nmi_save_registers(
 
 static void free_msrs(void)
 {
-	int i;
+	unsigned int i;
+
 	for (i = 0; i < nr_cpu_ids; ++i) {
-		xfree(cpu_msrs[i].counters);
-		cpu_msrs[i].counters = NULL;
-		xfree(cpu_msrs[i].controls);
-		cpu_msrs[i].controls = NULL;
+		XVFREE(cpu_msrs[i].counters);
+		XVFREE(cpu_msrs[i].controls);
 	}
 }
 
 
 static int allocate_msrs(void)
 {
+	unsigned int i;
 	int success = 1;
-	size_t controls_size = sizeof(struct op_msr) * model->num_controls;
-	size_t counters_size = sizeof(struct op_msr) * model->num_counters;
 
-	int i;
 	for_each_online_cpu (i) {
-		cpu_msrs[i].counters = xmalloc_bytes(counters_size);
+		cpu_msrs[i].counters = xvmalloc_array(struct op_msr,
+						      model->num_counters);
 		if (!cpu_msrs[i].counters) {
 			success = 0;
 			break;
 		}
-		cpu_msrs[i].controls = xmalloc_bytes(controls_size);
+		cpu_msrs[i].controls = xvmalloc_array(struct op_msr,
+						      model->num_controls);
 		if (!cpu_msrs[i].controls) {
 			success = 0;
 			break;
--- a/xen/arch/x86/oprofile/op_model_ppro.c
+++ b/xen/arch/x86/oprofile/op_model_ppro.c
@@ -10,9 +10,11 @@
  * @author Graydon Hoare
  */
 
+#include <xen/sched.h>
 #include <xen/types.h>
 #include <xen/xenoprof.h>
-#include <xen/sched.h>
+#include <xen/xvmalloc.h>
+
 #include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/apic.h>
@@ -231,7 +233,7 @@ static int cf_check ppro_allocate_msr(st
 	struct vpmu_struct *vpmu = vcpu_vpmu(v);
 	struct arch_msr_pair *msr_content;
 
-	msr_content = xzalloc_array(struct arch_msr_pair, num_counters);
+	msr_content = xvzalloc_array(struct arch_msr_pair, num_counters);
 	if ( !msr_content )
 		goto out;
 	vpmu->context = (void *)msr_content;
@@ -251,7 +253,7 @@ static void cf_check ppro_free_msr(struc
 
 	if ( !vpmu_is_set(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED) )
 		return;
-	xfree(vpmu->context);
+	XVFREE(vpmu->context);
 	vpmu_reset(vpmu, VPMU_PASSIVE_DOMAIN_ALLOCATED);
 }
 

