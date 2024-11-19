Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCF9D215E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 09:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839718.1255500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJLu-0004Rg-9m; Tue, 19 Nov 2024 08:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839718.1255500; Tue, 19 Nov 2024 08:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDJLu-0004P3-6c; Tue, 19 Nov 2024 08:12:50 +0000
Received: by outflank-mailman (input) for mailman id 839718;
 Tue, 19 Nov 2024 08:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDJLt-0004Ox-8v
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 08:12:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e569e6a-a64e-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 09:12:45 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9a6b4ca29bso593358066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 00:12:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df52adasm620714866b.81.2024.11.19.00.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 00:12:44 -0800 (PST)
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
X-Inumbo-ID: 0e569e6a-a64e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBlNTY5ZTZhLWE2NGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDAzOTY1LjIwMDE5OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732003964; x=1732608764; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+7bXGfBZyvdIZPTmXb4+ST5abFWGGKww59gbl5MyekQ=;
        b=AgUs1Dfn91gKWrFVIwXE0tj+tPZ9LexlpXPufIUsSA7HsGGrYwudqmw/+kxzrFBByx
         IdmaveHvTZuYAc9Nn+bFOvzceaZomADuOXUI79BGg/6nm1TFcjK164QPUJ+nqjTAgyqR
         EOxnNCCCL0rArc8qEe1je4NBmFx0hwGKjuor2wlCDNiWcytFsiSu5lMBmLqhUVlxHnc0
         F4MWUaqOJVjDnsNZBsesbmf9f/wnzMAWcH94v3DL+c03AKso4HS6l+9J74/slSx44D79
         H1gM7inwWJMVxsTl1oo+6O1l/q1YVesvcIhG94AQ3gsRNvWnN16s8hevfOm9rB5XTLRz
         KlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732003964; x=1732608764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7bXGfBZyvdIZPTmXb4+ST5abFWGGKww59gbl5MyekQ=;
        b=OLNiTcupNFNZX/ciZP7XKYVhw07pHWaz7ILfFsggSDrBBklS8UOoKQq0a527b/N42Q
         gZMFnifaNhUCHXTRVIz9A8L7FlhoFTlYR+md59NmjJxlwSfKWxrGg1+hN+VEXlt9JGBC
         8+Pj5ks1O38RHpyq269N7Kc6pQRZuKLWgVD3EUQBMsL/U4H8OKloAp37AZu7Sc7jawtD
         3zxMaJQe6ON6315pesmNz9K+7uD37/iB8dKj772YFnc4lPbXSdGoW6PIwQVZvZdWBe7Y
         glJubvApVHKFuJ6pLPhD1U0RjXgFW68vfRKd9su026NELCR2X7kymY+iFGWIZZvGJE+Y
         zX3g==
X-Gm-Message-State: AOJu0Yzug2NBXmvjV2oBVBgeQAPovubbcL77zHHquENb/gExsPftgBxr
	9q5ZdYnoHGgH+mV3VKPCO8uP1soleGxLi+mpGCCZgBrN23y3jYeK3l0Q25Xucw9Fhs6Pk+erThk
	=
X-Google-Smtp-Source: AGHT+IGfEobCDnR+0BVd+TV/EDYd/Jy+aAxF5dEjs6K9N2/qtzeAdIyQmomQ033PZeHDuVN4nKoNaA==
X-Received: by 2002:a17:907:981:b0:a99:f779:ae0c with SMTP id a640c23a62f3a-aa483450acbmr1482197966b.25.1732003964659;
        Tue, 19 Nov 2024 00:12:44 -0800 (PST)
Message-ID: <06b4f2c5-8470-4375-9311-c31921d7aaa8@suse.com>
Date: Tue, 19 Nov 2024 09:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] x86/pmstat: deal with Misra 8.4 violations
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <4de83f5b-5fde-44a9-8943-b1bb3f41d2e3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <4de83f5b-5fde-44a9-8943-b1bb3f41d2e3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While the override #define-s in x86_64/platform_hypercall.c are good for
the consuming side of the compat variants of set_{cx,px}_pminfo(), the
producers lack the respective declarations. Include pmstat.h early,
before the overrides are put in place, while adding explicit
declarations of the compat functions (alongside structure forward
declarations).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -4,8 +4,8 @@
 
 EMIT_FILE;
 
-#include <xen/lib.h>
 #include <xen/hypercall.h>
+#include <xen/pmstat.h>
 
 #define xen_platform_op     compat_platform_op
 #define xen_platform_op_t   compat_platform_op_t
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -7,6 +7,12 @@
 
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
+#ifdef CONFIG_COMPAT
+struct compat_processor_performance;
+int compat_set_px_pminfo(uint32_t acpi_id, struct compat_processor_performance *perf);
+struct compat_processor_power;
+long compat_set_cx_pminfo(uint32_t acpi_id, struct compat_processor_power *power);
+#endif
 uint32_t pmstat_get_cx_nr(unsigned int cpu);
 int pmstat_get_cx_stat(unsigned int cpu, struct pm_cx_stat *stat);
 int pmstat_reset_cx_stat(unsigned int cpu);


