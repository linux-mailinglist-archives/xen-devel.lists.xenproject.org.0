Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942AE8173E4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:40:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656066.1024016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEnN-0003UY-Nz; Mon, 18 Dec 2023 14:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656066.1024016; Mon, 18 Dec 2023 14:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEnN-0003Si-Kh; Mon, 18 Dec 2023 14:40:37 +0000
Received: by outflank-mailman (input) for mailman id 656066;
 Mon, 18 Dec 2023 14:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEnM-0003LJ-Ek
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:40:36 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67750d39-9db3-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:40:35 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso37433805e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:40:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b0040c4acaa4bfsm31329915wmo.19.2023.12.18.06.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:40:34 -0800 (PST)
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
X-Inumbo-ID: 67750d39-9db3-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910435; x=1703515235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlEogBHJ42bqKdVld3OnXFEdms3+g1R9Ku2xVNYGcew=;
        b=gZrgDnmAwawg3irOr18KAp9h+dD4j3JiSPgde5BxZI8h6dhs6I6Po1mtpOibzAQXKq
         bArCBImfhYBbkNatGuevwG2iFC15eEERp4xuTstRm5ufdqIXB6dYIb8Ro7ZHdpzbNGB3
         BID3fgfU3XN4Qk8O3+AZKSWXHcZgSxJ9LYSTsrDUJ3xkdR335+0gENcm+MEKczPV/Q49
         jpV4qPQ0y3353jHY0MrqMg4xo2W6pQKdOM0VMoFY5BPUb4lErITT3mUorAwZHmNkc7BY
         GK34vIKTkppuAzaMCEPs7SMPri6aHrxMUdAC9CVbq6M5IOdH2m1AhcScR0W5pBs8DGP/
         T74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910435; x=1703515235;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlEogBHJ42bqKdVld3OnXFEdms3+g1R9Ku2xVNYGcew=;
        b=QtNOOS46HVnzbpL9SKmtBggep4Kz7NUsMFlxaavj7VWEYSCLZOPrie3ILDxKIS/C3I
         1i4/pjudPIQou96nA78kGKSuwXm3796xrWt5rzrZXvCFGwEoZxriVMVeh5i2udXZwIyj
         PhTU0fBDj8536ieLbVC8NpQKcqOtjshbqY262n6GP/FFrbDqClANTUprABaOvaKsYc2/
         Ox2uvJ27miGcI2LZQd/3hL1qPhfLFVe/BmWFq71PS8swAfxrqsyFoH9bckd/jZHfP7jq
         +7OmdazR5ICV2sRPpj/ksjWRKYMI9Ppik8ZUt6eJmxshVTOH55z28QNSVhbzepVaWiTw
         t/fQ==
X-Gm-Message-State: AOJu0Yw/uooAv+uTRATKbVVlhNHPg8Cl1QB8A3dUSti2niH0/wfGNIIH
	pAjtdtO+8thvyuEfsnChBu2KI2uG7YGuH0HtvnD2
X-Google-Smtp-Source: AGHT+IEhltKV7HXRK7qqDP6DCXQOLNvBF2soPdud5P371fCtyDZ4MAsc1yR8Nze4nLgdwVHGL3VMiQ==
X-Received: by 2002:a05:600c:35d3:b0:40d:18ee:1d08 with SMTP id r19-20020a05600c35d300b0040d18ee1d08mr883863wmq.138.1702910434890;
        Mon, 18 Dec 2023 06:40:34 -0800 (PST)
Message-ID: <160696b3-13ff-4b4e-99ec-3d926a3c0be8@suse.com>
Date: Mon, 18 Dec 2023 15:40:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/5] x86/vPIT: check values loaded from state save record
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

In particular pit_latch_status() and speaker_ioport_read() perform
calculations which assume in-bounds values. Several of the state save
record fields can hold wider ranges, though. Refuse to load values which
cannot result from normal operation, except mode, the init state of
which (see also below) cannot otherwise be reached.

Note that ->gate should only be possible to be zero for channel 2;
enforce that as well.

Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
the value pit_latch_status() may calculate. The chosen mode of 7 is
still one which cannot be established by writing the control word. Note
that with or without this adjustment effectively all switch() statements
using mode as the control expression aren't quite right when the PIT is
still in that init state; there is an apparent assumption that before
these can sensibly be invoked, the guest would init the PIT (i.e. in
particular set the mode).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
For mode we could refuse to load values in the [0x08,0xfe] range; I'm
not certain that's going to be overly helpful.

For count I was considering to clip the saved value to 16 bits (i.e. to
convert the internally used 0x10000 back to the architectural 0x0000),
but pit_save() doesn't easily lend itself to such a "fixup". If desired
perhaps better a separate change anyway.
---
v3: Slightly adjust two comments. Re-base over rename in earlier patch.
v2: Introduce separate checking function; switch to refusing to load
    bogus values. Re-base.

--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -47,6 +47,7 @@
 #define RW_STATE_MSB 2
 #define RW_STATE_WORD0 3
 #define RW_STATE_WORD1 4
+#define RW_STATE_NUM 5
 
 #define get_guest_time(v) \
    (is_hvm_vcpu(v) ? hvm_get_guest_time(v) : (u64)get_s_time())
@@ -427,6 +428,47 @@ static int cf_check pit_save(struct vcpu
     return rc;
 }
 
+static int cf_check pit_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const struct hvm_hw_pit *hw;
+    unsigned int i;
+
+    if ( !has_vpit(d) )
+        return -ENODEV;
+
+    hw = hvm_get_entry(PIT, h);
+    if ( !hw )
+        return -ENODATA;
+
+    /*
+     * Check to-be-loaded values are within valid range, for them to represent
+     * actually reachable state.  Uses of some of the values elsewhere assume
+     * this is the case.  Note that the channels' mode fields aren't checked;
+     * Xen prior to 4.19 might save them as 0xff.
+     */
+    if ( hw->speaker_data_on > 1 || hw->pad0 )
+        return -EDOM;
+
+    for ( i = 0; i < ARRAY_SIZE(hw->channels); ++i )
+    {
+        const struct hvm_hw_pit_channel *ch = &hw->channels[i];
+
+        if ( ch->count > 0x10000 ||
+             ch->count_latched >= RW_STATE_NUM ||
+             ch->read_state >= RW_STATE_NUM ||
+             ch->write_state >= RW_STATE_NUM ||
+             ch->rw_mode > RW_STATE_WORD0 ||
+             ch->gate > 1 ||
+             ch->bcd > 1 )
+            return -EDOM;
+
+        if ( i != 2 && !ch->gate )
+            return -EINVAL;
+    }
+
+    return 0;
+}
+
 static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
 {
     PITState *pit = domain_vpit(d);
@@ -443,6 +485,14 @@ static int cf_check pit_load(struct doma
         goto out;
     }
     
+    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
+    {
+        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
+
+        if ( (ch->mode &= 7) > 5 )
+            ch->mode -= 4;
+    }
+
     /*
      * Recreate platform timers from hardware state.  There will be some 
      * time jitter here, but the wall-clock will have jumped massively, so 
@@ -458,7 +508,7 @@ static int cf_check pit_load(struct doma
     return rc;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, NULL, pit_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_check, pit_load, 1, HVMSR_PER_DOM);
 #endif
 
 /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
@@ -575,7 +625,7 @@ void pit_reset(struct domain *d)
     for ( i = 0; i < 3; i++ )
     {
         s = &pit->hw.channels[i];
-        s->mode = 0xff; /* the init mode */
+        s->mode = 7; /* unreachable sentinel */
         s->gate = (i != 2);
         pit_load_count(pit, i, 0);
     }


