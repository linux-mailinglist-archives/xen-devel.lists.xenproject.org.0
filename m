Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A23830259
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 10:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668307.1040387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2GH-0003Hw-C6; Wed, 17 Jan 2024 09:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668307.1040387; Wed, 17 Jan 2024 09:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2GH-0003FF-8E; Wed, 17 Jan 2024 09:31:05 +0000
Received: by outflank-mailman (input) for mailman id 668307;
 Wed, 17 Jan 2024 09:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ2GG-0003F8-OT
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:31:04 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21cfe5ca-b51b-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 10:31:03 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e779f030aso16926085e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:31:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l14-20020adffe8e000000b00336755f15b0sm1196574wrr.68.2024.01.17.01.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 01:31:02 -0800 (PST)
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
X-Inumbo-ID: 21cfe5ca-b51b-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705483863; x=1706088663; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7d5yqvWynTJK0DON1Pp2j9n2EnKryr1JAOIGpNMoy8=;
        b=OhgixGAjdwAFevS8qmpVaPHhQaRV8mkRFo3RIMwuOg2QxPYb5uoRyDo98avg89dBvc
         er08VIdfJ+FJ02M0X43NWQ+JohTlI4Lza21TxR538FcSnEoA+kP8LrwMFwUAMBumF4gy
         r2/Z9Sy9u828Xk72B+8j1vvkXxKoHaSJEIGdmw1bs3H+gcQDSEyvbzR4YzcrPMFuCAGC
         8nZqx4SnMmiSR9rA+6b8KDJq0K2bvVNlS7XSHUJO14+/Lr2DXqaCYs6nxY0SYXXPMM0X
         hvMvVtTtmxeS05p/oRrVsuHh1Zrxw8yQbvmePAdra/A17Q22f8ios/U7/mlfpMVerWE0
         awdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705483863; x=1706088663;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7d5yqvWynTJK0DON1Pp2j9n2EnKryr1JAOIGpNMoy8=;
        b=uiMiXKN/XI5kpQa1X88+AW5JeREyINJ2iNHcNXvT3zedOZq1jwa0id3VuGAVspMe0n
         wuAiFLLuV5rlxmEnq3QtcX3ifntidKCFDZ6jIkT6CkzL+KJe9KscbYWZm+v1VpA465t4
         Twwt+ty7G4fdCTFSRX8fwXxPGaMiJ4jAIH2aLBz9BB2L3ViyUuHWgmlK88X/Omoitlo/
         W9XSBHqEeR6GotvjzpbnlB0OhlB7GykQhRWNLfi3T1qP7Dk1KnkjopwrYnq+ttA93qx3
         yT1AbAQvAquhOfGGduxeAPj5PBpXTSkN25PB5ZP8EMyUguXIl3grrJHoiTdOdDDuQgxI
         YHnw==
X-Gm-Message-State: AOJu0YzQAzKSm/AJuPTxoH9yq+UBe/hkmTJvZ54Yg90CyJ124wbQ3qYJ
	pm9tldQFf0sE4Wu//4Ri809Ztm6MkSZBVpAm/0L+XLK+Cw==
X-Google-Smtp-Source: AGHT+IG3/dFyK74fsbs14901TkS6LYRk9/VQLopE0GCu3Ur11sM9D/QWqFUf+Hla+6rjnHNnCLA7ig==
X-Received: by 2002:a05:600c:26d6:b0:40e:52e6:ccc3 with SMTP id 22-20020a05600c26d600b0040e52e6ccc3mr287114wmv.48.1705483863003;
        Wed, 17 Jan 2024 01:31:03 -0800 (PST)
Message-ID: <65fb766e-ab5a-49ab-a904-01ee9711d42d@suse.com>
Date: Wed, 17 Jan 2024 10:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/guest: finish conversion to altcall
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

While .setup() and .e820_fixup() don't need fiddling with for being run
only very early, both .ap_setup() and .resume() want converting too:
This way both pre-filled struct hypervisor_ops instances can become
__initconst_cf_clobber, thus allowing to eliminate up to 5 more ENDBR
(configuration dependent) during the 2nd phase of alternatives patching.

While fiddling with section annotations here, also move "ops" itself to
.data.ro_after_init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/guest/hyperv/hyperv.c
+++ b/xen/arch/x86/guest/hyperv/hyperv.c
@@ -207,7 +207,7 @@ static int cf_check flush_tlb(
     return hyperv_flush_tlb(mask, va, flags);
 }
 
-static const struct hypervisor_ops __initconstrel ops = {
+static const struct hypervisor_ops __initconst_cf_clobber ops = {
     .name = "Hyper-V",
     .setup = setup,
     .ap_setup = ap_setup,
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -13,7 +13,7 @@
 #include <asm/cache.h>
 #include <asm/guest.h>
 
-static struct hypervisor_ops __read_mostly ops;
+static struct hypervisor_ops __ro_after_init ops;
 
 const char *__init hypervisor_probe(void)
 {
@@ -49,7 +49,7 @@ void __init hypervisor_setup(void)
 int hypervisor_ap_setup(void)
 {
     if ( ops.ap_setup )
-        return ops.ap_setup();
+        return alternative_call(ops.ap_setup);
 
     return 0;
 }
@@ -57,7 +57,7 @@ int hypervisor_ap_setup(void)
 void hypervisor_resume(void)
 {
     if ( ops.resume )
-        ops.resume();
+        alternative_vcall(ops.resume);
 }
 
 void __init hypervisor_e820_fixup(void)
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -318,7 +318,7 @@ static int cf_check flush_tlb(
     return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
 }
 
-static const struct hypervisor_ops __initconstrel ops = {
+static const struct hypervisor_ops __initconst_cf_clobber ops = {
     .name = "Xen",
     .setup = setup,
     .ap_setup = ap_setup,

