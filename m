Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DFAC6E0F1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165771.1492467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLflz-000492-NJ; Wed, 19 Nov 2025 10:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165771.1492467; Wed, 19 Nov 2025 10:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLflz-00046A-Jx; Wed, 19 Nov 2025 10:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1165771;
 Wed, 19 Nov 2025 10:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLflx-0003Dg-JX
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:50:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9be3f6e7-c535-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 11:50:48 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b73161849e1so1208365366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 02:50:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa80bf5sm1616900566b.3.2025.11.19.02.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 02:50:47 -0800 (PST)
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
X-Inumbo-ID: 9be3f6e7-c535-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763549448; x=1764154248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eRIw90P1ahcneHzGRMqLxQ5Dx5L/DYU6UEQ17i/AD+g=;
        b=EKOJLhcqmTjoGEfPNDGekkVV3GMrM8XutPH5ygp+PgbvsvDpZVp41ovXdP0r/oSDtk
         m9c2ovprDXh9jOvTEjZ21Pq+MK4TspzIXGPQbtJsKgk30QTGxyaqonb4g4PvnjVolZ7x
         AK9BT5RoI0UaT5Za1BHOVHT7f+h9r1Kfvyj2vEG3Wwnc8ZeIOy05otxlJMMkxd83AG7N
         IIcrvNKblQHcgvDoI+eaG5/i9x1mcfTxHmC3yEfgKrVLXnwglF2T/kwW0ladfejoDFkx
         ZyBqmxyCCJ/063Co1mwCSKOckSoWgOk9d6+bJpXHlankZ/B3KUtWjbWB4MNj7dLrjtRu
         Anww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549448; x=1764154248;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRIw90P1ahcneHzGRMqLxQ5Dx5L/DYU6UEQ17i/AD+g=;
        b=MulAyCXphTqPYrs+YS+lUr0K30UAzk3NZsQeWS+Evl6e5cKgye3OqH2yis3AEJxBbE
         H+Tmaddjs0OkETEgtnoIRt/KgBSfblNiTQFVnLx9k6S55BUG3r6ouzGfjitteRpDt5SD
         0hAPGrel7NXPwALtTrvlUwXQ5GHbnBJTzvBXswoxHTXR0bGXS3C1uNd9rrgvRRn6hCCh
         YO2ok6X1foy5J6jWUJMAkEiYuW2LsfHA4nqci29DuFi5nG8QMda3Np1SIm0PnG0GpYuo
         kxkYeZHZgk5nnEORHkmc93HQz9qr0v+eRUg7wTGeEqzv4IzlnKnheOqFJcjxUF51lIz1
         nu0g==
X-Gm-Message-State: AOJu0YyWNFr0F7QF/3q9txpIUKhg1hqe5TY4KlExoXGny0Axn6VVjDSx
	76/cCZ0xgYqjyD7BLSH0vkyiCwIEdm1pur4T8kaXHTmUNTEpWpyp61Sy3F3olfziT+RN0pPxmp9
	MRpc=
X-Gm-Gg: ASbGncsT5LUzQ1kl+p6wfGdXYwB8q1NAcFBQTorRYvgpwdbDANaPqAFXkMdXCDr3aYR
	RhoRIrh6kgt/KO6jiqB1PCauVCyTp3l6whVS/S7J8LQoMa7QvJbCF3AMckXRE9omvM+8ujk9tEl
	rmieiDOXKx60otLRcQCVRB9T8PYiHgoLX6FE+JgoTa5c77JSahGAyupBSqbnJ70CtCjot67OE81
	PIO/1i/uNiGAJS0KIXBVeqetj7m/gN80jWbQmMhQoSjG/8CPZ5V4X5VkDF9UPwqcC5lMFXKvASR
	P5ftSI78RslA4wLGF3Dam4mXcveQYS9ZmcgAL020+/sVi6rmF7zLLDsmFUmEd0vI20ad5sDy5KH
	2DLArPLXHUhrC6KpVYkEgCGE7/yR7/LiStgI1w68Iu93IOm/+5ME+yR+oay8PEvQEUK1m5ylGW/
	4fNQgNK7nrluNXsvkTZxA9g6B+bozV5Hcm5qzQY/6UqD8F0zXElnRD/HeoJnVQb7GIg9VlpbhX4
	YlhriZ67UZwCxz66+OY+NbJ
X-Google-Smtp-Source: AGHT+IH5Debcdi1hBvibEqbG4IgnnstzobN5hsYPDLb/0BEFtc6X1L4wNV9cXEsV54VeOfBtNuurNg==
X-Received: by 2002:a17:907:3f99:b0:b73:3f7d:3df with SMTP id a640c23a62f3a-b76379a1cf0mr198206866b.41.1763549448161;
        Wed, 19 Nov 2025 02:50:48 -0800 (PST)
Message-ID: <3d412bdf-e053-44f2-b51a-300f9cb3e775@suse.com>
Date: Wed, 19 Nov 2025 11:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] x86/IRQ: direct-APIC-vector setting is now init-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
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
In-Reply-To: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With all callers of alloc_direct_apic_vector() now being limited to BSP
setup, it and its helpers (whose other callers have already been init-
only) can become __init. As a result data items can be adjusted, too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Question is whether with this the "if (*vector == 0)" in
alloc_direct_apic_vector() is of much use anymore.

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -970,22 +970,22 @@ void pirq_set_affinity(struct domain *d,
 DEFINE_PER_CPU(unsigned int, irq_count);
 static DEFINE_PER_CPU(bool, check_eoi_deferral);
 
-uint8_t alloc_hipriority_vector(void)
+uint8_t __init alloc_hipriority_vector(void)
 {
-    static uint8_t next = FIRST_HIPRIORITY_VECTOR;
+    static uint8_t __initdata next = FIRST_HIPRIORITY_VECTOR;
     BUG_ON(next < FIRST_HIPRIORITY_VECTOR);
     BUG_ON(next > LAST_HIPRIORITY_VECTOR);
     return next++;
 }
 
-static void (*direct_apic_vector[X86_IDT_VECTORS])(void);
-void set_direct_apic_vector(uint8_t vector, void (*handler)(void))
+static void (*__ro_after_init direct_apic_vector[X86_IDT_VECTORS])(void);
+void __init set_direct_apic_vector(uint8_t vector, void (*handler)(void))
 {
     BUG_ON(direct_apic_vector[vector] != NULL);
     direct_apic_vector[vector] = handler;
 }
 
-void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void))
+void __init alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void))
 {
     static DEFINE_SPINLOCK(lock);
 


