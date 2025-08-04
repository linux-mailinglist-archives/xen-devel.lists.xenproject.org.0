Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A28B1A638
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 17:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069680.1433459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uixJy-0001Xy-2H; Mon, 04 Aug 2025 15:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069680.1433459; Mon, 04 Aug 2025 15:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uixJx-0001W1-Vn; Mon, 04 Aug 2025 15:41:53 +0000
Received: by outflank-mailman (input) for mailman id 1069680;
 Mon, 04 Aug 2025 15:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uixJv-0001VX-N8
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 15:41:51 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 886cdd11-7149-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 17:41:48 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-adfb562266cso736115966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 08:41:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e82b0sm756737566b.87.2025.08.04.08.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:41:47 -0700 (PDT)
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
X-Inumbo-ID: 886cdd11-7149-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754322108; x=1754926908; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hF+uact1MjumtddVYv5deeAkwW/D2/tEr3KBEzDcDH0=;
        b=RFo1oPWZPbmr/po7GLXV1e37IND41+GRjgQnEpVXhyP0SX9bAYQsWYX1rW4oioH/wH
         h6uNdnjS5VCq/uJA++KfBNilZ5y0aFleebKxxsz0bz0Er2BcHnb+CEZzTuAcMto5JTNj
         iaQvMiTg3ynC7zOdstQ9WA4wRgngDcXVNPArnAbGUsD/YOqnarsxMsnQz2hIigRZKWfe
         6ePnrbsUthpoKrWWkWQ6VhNpMLeTdChI+MqIMlgBjk5ceT2qumdgF1fJe7ZfNPSUYzaD
         uXALUYid9+HQZ3W7CJOa7/xj1BBqCF5RzExuKubEzMkl2U2myi3Uou3OlcZLGuzVvsUk
         oaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322108; x=1754926908;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hF+uact1MjumtddVYv5deeAkwW/D2/tEr3KBEzDcDH0=;
        b=a6ZvnrlqXxoh5ONCIJKMgyhbHetM9nLCngEwQrSN34r3s13VDHd2xm1Uox/6DrPV7Z
         aTL7xjqzv88U08Z16sBYQevl1Ha5kUk71oRcFisAxDaqD9egEwzEcGT/VEgaDzL86q4p
         I0PH9rM3uQbCVQPBvuT3JYuuAmSq38bMUGqni0ZOIcZnqHmr/IAM2Rn6/5o51MdjTyWl
         4rw7HYlvNa0tGupLw0C9tbeIRXxAPwDTn+4xstP+6htgHBQgl/cf9/m8g93ANrXGqno/
         SD7hjgQpsGIqDeMKCP8l0o6cWpTG4uUs2trJI9O7sWlUW4z6s6VY21CKMZTTg+zZsitO
         vRjw==
X-Gm-Message-State: AOJu0Yw0/7Vhwg8qf7SAXiI8bUUxivlYMrHnSsuENbs/F8EiKU1G9iT8
	0/HjOf0m0mXfemfKmmC02d86EmQMUsxtNJ6bvteuMUGor9zG+0jyDA8Qz5y7Kkfexgg6CmeKTal
	52XI=
X-Gm-Gg: ASbGnctjMVwR5TFQW35AszD4rI2ZxPcARNdCWptxDfJ1ZMbdJ7F25HUakIOyznRdwB/
	MFoiI24p0H8docHTE7mGUEgq4ZHYXn6EAkCSTbYUQu3ipvDrEjvctY/Pa9wt1YA1LgJLoKbXzxZ
	+kiiVYTnmDWbA7ezjeHhGXRTj8Nz66/EcWvnmTakI23FSCwWtU+zBx1x9gTWfVTzLLeGYYLyoYx
	nOxzZ3tdwF7W+sP05zNYAlxfAlH4sn6oHLuA2rtwDj3AVhhC0t8MX4wTGRvNN+hDg2FlPjAe/Kw
	BRohfLk4HVo16jDwSUWHw3z5fXG2od/CQzmnxuNclcprEQWCqBIB/eS09AjRKpY8atjb175OD8+
	xUAr6ysvQr7oRASJLuz1cQ+I0wyVyefLPUDYveK1fvBCOQyQtGt4z2R9FNnOQY6XWEjweCkrxGG
	nKhKkpkBU=
X-Google-Smtp-Source: AGHT+IHdT8D/nrzE79KAb9vmkktbHFXsH3QdyKg2LEEhNoIfIwmtFUGE90kUxbI464eexF0i0VABUQ==
X-Received: by 2002:a17:907:7fa3:b0:af9:116c:61cf with SMTP id a640c23a62f3a-af940208ce9mr1104180666b.43.1754322107894;
        Mon, 04 Aug 2025 08:41:47 -0700 (PDT)
Message-ID: <ec351aea-e2a0-4335-b8ee-51c6eface104@suse.com>
Date: Mon, 4 Aug 2025 17:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: polish hvm_asid_init() a little
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

While the logic there covers asymmetric cases, the resulting log
messages would likely raise more confusion than clarify anything. Split
the BSP action from the AP one, indicating the odd CPU in the AP log
message, thus avoiding the impression that global state would have
changed.

While there also
- move g_disabled into .data.ro_after_init; only the BSP will ever write
  to it,
- make the function's parameter unsigned; no negative values may be
  passed in. Also reflect this in svm_asid_init().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -48,20 +48,22 @@ struct hvm_asid_data {
 
 static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
 
-void hvm_asid_init(int nasids)
+void hvm_asid_init(unsigned int nasids)
 {
-    static int8_t g_disabled = -1;
+    static int8_t __ro_after_init g_disabled = -1;
     struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
 
     data->max_asid = nasids - 1;
     data->disabled = !opt_asid_enabled || (nasids <= 1);
 
-    if ( g_disabled != data->disabled )
+    if ( g_disabled < 0 )
     {
-        printk("HVM: ASIDs %sabled.\n", data->disabled ? "dis" : "en");
-        if ( g_disabled < 0 )
-            g_disabled = data->disabled;
+        g_disabled = data->disabled;
+        printk("HVM: ASIDs %sabled\n", data->disabled ? "dis" : "en");
     }
+    else if ( g_disabled != data->disabled )
+        printk("HVM: CPU%u: ASIDs %sabled\n", smp_processor_id(),
+               data->disabled ? "dis" : "en");
 
     /* Zero indicates 'invalid generation', so we start the count at one. */
     data->core_asid_generation = 1;
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -12,7 +12,7 @@
 
 void svm_asid_init(const struct cpuinfo_x86 *c)
 {
-    int nasids = 0;
+    unsigned int nasids = 0;
 
     /* Check for erratum #170, and leave ASIDs disabled if it's present. */
     if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -13,7 +13,7 @@ struct vcpu;
 struct hvm_vcpu_asid;
 
 /* Initialise ASID management for the current physical CPU. */
-void hvm_asid_init(int nasids);
+void hvm_asid_init(unsigned int nasids);
 
 /* Invalidate a particular ASID allocation: forces re-allocation. */
 void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);

