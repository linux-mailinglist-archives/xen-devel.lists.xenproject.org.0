Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0642E829D07
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665556.1035786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNa2E-00009V-N7; Wed, 10 Jan 2024 14:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665556.1035786; Wed, 10 Jan 2024 14:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNa2E-00007t-I7; Wed, 10 Jan 2024 14:58:26 +0000
Received: by outflank-mailman (input) for mailman id 665556;
 Wed, 10 Jan 2024 14:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNa2C-0006ap-JA
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:58:24 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b308f556-afc8-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 15:58:22 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d8902da73so40293545e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 06:58:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b0040d91fa270fsm2449640wmb.36.2024.01.10.06.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:58:22 -0800 (PST)
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
X-Inumbo-ID: b308f556-afc8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704898702; x=1705503502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ymXg0bpmFz+1mXkWwxvgqG3wuNIkNAkO2q/Jn5XmZJc=;
        b=BBxPKhk/Bh+Qm8tpX2EQ9OH9XMPhqAmh2J/8DNvCNehmOkiVeTq2rKNmoQWZX/PObw
         tCTHlTIKO27O0GBqCB4ClOr5Lovw9OVmTTbHGvVgGVPjevg1kcdhK6SiTDpypqB7ji6D
         MR+jKwfPgFsocG8ODcRxylN2fnQh7vJt8iXF9W3H7BOWMeKRmgVU7uzIBajfXCfSa9w4
         iMIQl2nhFBwWdv1Z5BB+Z8RwvIeUwb/5EJDzaOR0hHwPRLSzqqubQgBoAkUERolcQcLu
         jjCjf7B3r37balHeAIvxA8k7F+04bbOyal6IgHzkL+WWQ+HdDB0xW+7VgV66OK1RFFMh
         objQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898702; x=1705503502;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymXg0bpmFz+1mXkWwxvgqG3wuNIkNAkO2q/Jn5XmZJc=;
        b=PtgUitod+TboyHowhqg3EmnFAL8deK+ijNi57vxZTUJNhzOQ5dPqAKK90ZAXrx1JhH
         S1NvwFBwBXixcgxJSJkXZE6NmuqXFhBObci/fFwcthFiAbYwbtU7/fv3uP9gSuKVoFrb
         LtBaIDIQM6BG9BMZsNINl+uI6zZie2sokdkTuJmQjin6Fa3yzCSJ/fJWJItbxUNNq5Gi
         Wa8Oj2X+NaYtORwPdhsK2DESb0lJDjHFvHn82F0yeWQVt0Naeo1lr69qY2BQSp1ZE9ts
         GsyV+NlcJEWPZ1AJN0YWe/siqTnoa1RcKl23yqE6yQqD5ebAYk3LJ4DsgEhxU4vhGSiY
         y66g==
X-Gm-Message-State: AOJu0YyFDRdjt5hW8mqSx6y90aPEVNAgkEKlN+KT8pi8E9WyRkQAhkya
	xHgiSffw2yqRuw1d4zczxx15TxBr/1jcBXImd2MGBKy39g==
X-Google-Smtp-Source: AGHT+IFCaiRv24o3bDw9N2BNcvtjXE01o5QxDf3PNFqJMyakBhMThs2ZpoGXKh7zM9QwlPCXo3yo/g==
X-Received: by 2002:a05:600c:4b8a:b0:40e:4cc6:b4b4 with SMTP id e10-20020a05600c4b8a00b0040e4cc6b4b4mr770987wmp.36.1704898702379;
        Wed, 10 Jan 2024 06:58:22 -0800 (PST)
Message-ID: <5d68379d-a08b-48bf-a73f-2ef1486c5984@suse.com>
Date: Wed, 10 Jan 2024 15:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 4/5] x86/vPIC: check values loaded from state save record
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
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
In-Reply-To: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
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


