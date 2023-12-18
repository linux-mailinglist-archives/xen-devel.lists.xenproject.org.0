Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416388173E5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656068.1024027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEnh-0004B4-3y; Mon, 18 Dec 2023 14:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656068.1024027; Mon, 18 Dec 2023 14:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEnh-000496-0c; Mon, 18 Dec 2023 14:40:57 +0000
Received: by outflank-mailman (input) for mailman id 656068;
 Mon, 18 Dec 2023 14:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEnf-00048G-8T
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:40:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71c86c98-9db3-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 15:40:53 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c1b5so34652435e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:40:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b0040c4acaa4bfsm31329915wmo.19.2023.12.18.06.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:40:52 -0800 (PST)
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
X-Inumbo-ID: 71c86c98-9db3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910452; x=1703515252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ymXg0bpmFz+1mXkWwxvgqG3wuNIkNAkO2q/Jn5XmZJc=;
        b=ZCYQm2n0QmuJkA1KAHqAgTPpY9OfnV0NWGiRWFZvjmelZxG+Yn0bqX86wyqon5La4j
         JnEgc3idnjOCqHQbJPr5v0OdZc/I8mUxQT2Vjo/5FfJtcCCCmPE21g77DIahjM0zj1uq
         RATUnBYhX9UfLBMhxUTaUlA+PXoBwzdjTE/gWvpiEpjuhd/kAQkevD53po4/sgZHMf5k
         qyrUALjWBKwoQCVe0+8XV6RpyWZb4vgblgYnp41Jdl4yckqyfcREpUOwzcD2z31GoSSp
         3TkezJIUh2DFrA01WPVdzu5r4XZlZkxHYR04M1HljKDQr5F97fxQ1AmYBmZ/KkCUrFYA
         EHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910452; x=1703515252;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymXg0bpmFz+1mXkWwxvgqG3wuNIkNAkO2q/Jn5XmZJc=;
        b=UjT1rA1PA3HKuc7EUE7+KciYZiYkRqKQh6d+N0FwmhjRJM71JvuUIgQNPtWrU0/7eV
         zotmR7Ohg1gO12BVc9XfPr3Yn6+JF4fUrh2H6TZSgXVINhvchDgCAv/BsqTAUIzxMj9m
         sPpS6ZArL5udMdEnvRWNKW8ITIiiTAhVfdoYi0Mr3Jg2rDP3SVuiibxIGfoTvOSA6fxD
         /CTQua69f8BMHFsbqHykEoNf2c3p1blCk/Jm9BQKOVw1L3xpio1loPrcKMnpnfzMmYoF
         dpYbv5leGqgF4YmlQ7YZp0srMM/VuJCDdgpS13oUAdinj6hlltY/Sxt5fr1BZyZfykfz
         0qNA==
X-Gm-Message-State: AOJu0YyAAu9bp0q4GEpNiMJMSByMnNBSt+tneH3gSGVFWztSwFqHhA8u
	XaLvqCktyg/EKnQP7yGsUIYW9NyZ9hoYfUVh4Z4M
X-Google-Smtp-Source: AGHT+IENCFbPhDWDJ3O0ULNCi2CFlhIgp2QC7so5i0AAfbe74adx52KuOILEZGhet3fdRhlvc10odA==
X-Received: by 2002:a05:600c:1715:b0:40c:2bfa:fb03 with SMTP id c21-20020a05600c171500b0040c2bfafb03mr8060780wmn.72.1702910452441;
        Mon, 18 Dec 2023 06:40:52 -0800 (PST)
Message-ID: <9ab115f2-04c6-443f-95f1-581b2889b08f@suse.com>
Date: Mon, 18 Dec 2023 15:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 4/5] x86/vPIC: check values loaded from state save record
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
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
In-Reply-To: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Loading is_master from the state save record can lead to out-of-bounds
accesses via at least the two container_of() uses by vpic_domain() and
__vpic_lock(). Make sure the value is consistent with the instance being
loaded.

For ->int_output (which for whatever reason isn't a 1-bit bitfield),
besides bounds checking also take ->init_state into account.

For ELCR follow what vpic_intercept_elcr_io()'s write path and
vpic_reset() do, i.e. don't insist on the internal view of the value to
be saved.

Move the instance range check as well, leaving just an assertion in the
load handler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: vpic_domain() fix and vpic_elcr_mask() adjustment split out. Re-base
    over rename in earlier patch.
v2: Introduce separate checking function; switch to refusing to load
    bogus values. Re-base.

--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -429,6 +429,38 @@ static int cf_check vpic_save(struct vcp
     return 0;
 }
 
+static int cf_check vpic_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int inst = hvm_load_instance(h);
+    const struct hvm_hw_vpic *s;
+
+    if ( !has_vpic(d) )
+        return -ENODEV;
+
+    /* Which PIC is this? */
+    if ( inst >= ARRAY_SIZE(d->arch.hvm.vpic) )
+        return -ENOENT;
+
+    s = hvm_get_entry(PIC, h);
+    if ( !s )
+        return -ENODATA;
+
+    /*
+     * Check to-be-loaded values are within valid range, for them to represent
+     * actually reachable state.  Uses of some of the values elsewhere assume
+     * this is the case.
+     */
+    if ( s->int_output > 1 )
+        return -EDOM;
+
+    if ( s->is_master != !inst ||
+         (s->int_output && s->init_state) ||
+         (s->elcr & ~vpic_elcr_mask(s, 1)) )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int cf_check vpic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_hw_vpic *s;
@@ -438,18 +470,21 @@ static int cf_check vpic_load(struct dom
         return -ENODEV;
 
     /* Which PIC is this? */
-    if ( inst > 1 )
-        return -ENOENT;
+    ASSERT(inst < ARRAY_SIZE(d->arch.hvm.vpic));
     s = &d->arch.hvm.vpic[inst];
 
     /* Load the state */
     if ( hvm_load_entry(PIC, h, s) != 0 )
         return -EINVAL;
 
+    if ( s->is_master )
+        s->elcr |= 1 << 2;
+
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, NULL, vpic_load, 2, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, vpic_check, vpic_load, 2,
+                          HVMSR_PER_DOM);
 
 void vpic_reset(struct domain *d)
 {


