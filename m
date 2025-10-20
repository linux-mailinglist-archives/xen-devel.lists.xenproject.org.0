Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713CEBF0C99
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146131.1478597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnu4-0002ZR-VM; Mon, 20 Oct 2025 11:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146131.1478597; Mon, 20 Oct 2025 11:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnu4-0002Wt-SE; Mon, 20 Oct 2025 11:18:16 +0000
Received: by outflank-mailman (input) for mailman id 1146131;
 Mon, 20 Oct 2025 11:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnu3-0002Wn-Mh
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:18:15 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77d64fd8-ada6-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 13:18:13 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-426ed6f4db5so2795930f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:18:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144b5c34sm238288115e9.10.2025.10.20.04.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:18:12 -0700 (PDT)
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
X-Inumbo-ID: 77d64fd8-ada6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959093; x=1761563893; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KVGn4sSgSWJeCO6UHgtOAx+xuyuXxHCg46TnMeapxz4=;
        b=Eia43L4yoT3jzNAxTNf9azSIxr57j3FQQDyZXH1Ztp5r5lCfh7kgteWbbhTz+d405m
         3omkGcBJGSdq3ygJVTFUzaBlJv9mUt5NqmLuETE+gopW11eCtjQ5h0WePun0/lR9qsj3
         jC0Ry7LvLKIFoQymCXHcm1vh43DSDWn1gbUmBhCiCKzB6BrjnzDeqP66asn3aqJ4bs+G
         2xmidKOPw1xJWqB9hlcNlAVK/Unz9XHzJSWsWv4WPc6MWJSGhhPHji/n94u8mmA8Kkx8
         P1jJyKEUrhGq23aJCZCQYg60RGY/thmj/BcGRRts4kzI4l6SpbNpLNH4crZblWWXHPwm
         RVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959093; x=1761563893;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVGn4sSgSWJeCO6UHgtOAx+xuyuXxHCg46TnMeapxz4=;
        b=Pg24slOp1Lxh37+lguwoaTsgiYCli7QUZ87uLZpdC5xMFCZrjQ5Vb4Czl5M1mWFxzA
         DQsZjWVtuqWvQPH6LAjHtsVHhZbAYm/eZi6lapzYmpyOVpJqvTvG54qxhfDSZnPZO1X7
         /x4355K6PYC1FBpHY0E2bKtmGPk3t85F3QNBtAcj3S256wAip3U4ozMBbWCltp2niACA
         9OcNI0zui6P4kUBy2EME4h/EI7mtrOxlvrgJ8q00Nl3FXIxvLGzf2S1SjWl9GZUVyY9P
         AsuxblniRE/6rB+dTtjU4wvO0vGxUCKAZf4rGR0BmS7tGMhRkD1Q3N6ITxjWDURNk9Ha
         mI3A==
X-Gm-Message-State: AOJu0YzBaSrbLjH0wshqPgQd1QalBTSPNQbF/5w7xRFcBi1YjVgS3Pty
	DtpSZ70eiYLJJXgLT6s9umhbopbvD/KPdjqmc1wA8HnRenEBeUZ4ACvUSEqC69Y9sQjfxrPGx9v
	bJwg=
X-Gm-Gg: ASbGnctZG0H3U/8bN176Xio+mMokrVEzeRIcAi3AGZbh/1oaBJ10oJ5iexOmKHF6K4e
	NSd4T3awFfvpfjL4xJxZyb85hqN2wKNxceQO0Xt8sGVFLATFRwvgIlgwxP2ez7285qIRqWT05Dx
	Uo/Ka0vgVkolsZ3F8CC1tCEts68s/D6tW8ASgA2btzIPMDigSYiWzRzpGsMjU7Wq/2LxDUAwh7l
	KZ0eUA8qCWoGGCjIhFDKs2R2tO5+tUg+YasAOnXVQ3Q3TxC0q+eT5TZzueaGAie2ZeqUKlg5yyv
	7I0rGp/TjGhnStv7vBxMlYWybbU1TY1YK5UG3SzEalUbpw9Tz7EteM73k8hRTCET0ITMy8vkOU9
	B8vB0aKAnzYLeh4twFEqTf9aYyA7WXbNCkHRGy9OCvm1iH+18qyS8QFw8gwzu17JwSgFwFKm+Bj
	jUuMcWxsoHpcA5+Dy0NjZnL9TWNnXbQkbK81lrcqcKXGmZPL3v0SM44/HHbpb5XqgsR0IMwmU=
X-Google-Smtp-Source: AGHT+IEeLtHxI4cjVnB/zNhFXjIUxVciyqMKTfrEeVESCvrehyFM9Jjg2xcIxTZfTBWwfCknjNsJ/Q==
X-Received: by 2002:a05:6000:2c0c:b0:3df:22a3:d240 with SMTP id ffacd0b85a97d-426fb6a1c87mr11575515f8f.4.1760959093082;
        Mon, 20 Oct 2025 04:18:13 -0700 (PDT)
Message-ID: <53011168-7b4c-4232-9295-f33399580578@suse.com>
Date: Mon, 20 Oct 2025 13:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.21 1/9] x86/HPET: disable unused channels
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
In-Reply-To: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keeping channels enabled when they're unused is only causing problems:
Extra interrupts harm performance, and extra nested interrupts could even
have caused worse problems.

Note that no explicit "enable" is necessary - that's implicitly done by
set_channel_irq_affinity() once the channel goes into use again.

Along with disabling the counter, also "clear" the channel's "next event",
for it to be properly written by whatever the next user is going to want
(possibly avoiding too early an IRQ).

Further, along the same lines, don't enable channels early when starting
up an IRQ. This similarly should happen no earlier than from
set_channel_irq_affinity() (here: once a channel goes into use the very
first time). This eliminates a single instance of

(XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
(XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request

during boot. (Why exactly there's only one instance, when we use multiple
counters and hence multiple IRQs, I can't tell. My understanding would be
that this was due to __hpet_setup_msi_irq() being called only after
request_irq() [and hence the .startup handler], yet that should have
affected all channels.)

Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
A window still remains for IRQs to be caused by stale comparator values:
hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
Should we also write the comparator to "far into the future"?

Furthermore this prolongues the window until "old" vectors may be released
again, as this way we potentially (and intentionally) delay the ocurrence
of the next IRQ for the channel in question. (This issue will disappear
once we switch to a fixed, global vector.)

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -262,10 +262,9 @@ static void cf_check hpet_msi_unmask(str
     ch->msi.msi_attrib.host_masked = 0;
 }
 
-static void cf_check hpet_msi_mask(struct irq_desc *desc)
+static void hpet_disable_channel(struct hpet_event_channel *ch)
 {
     u32 cfg;
-    struct hpet_event_channel *ch = desc->action->dev_id;
 
     cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
     cfg &= ~HPET_TN_ENABLE;
@@ -273,6 +272,11 @@ static void cf_check hpet_msi_mask(struc
     ch->msi.msi_attrib.host_masked = 1;
 }
 
+static void cf_check hpet_msi_mask(struct irq_desc *desc)
+{
+    hpet_disable_channel(desc->action->dev_id);
+}
+
 static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
 {
     ch->msi.msg = *msg;
@@ -295,12 +299,6 @@ static int hpet_msi_write(struct hpet_ev
     return 0;
 }
 
-static unsigned int cf_check hpet_msi_startup(struct irq_desc *desc)
-{
-    hpet_msi_unmask(desc);
-    return 0;
-}
-
 #define hpet_msi_shutdown hpet_msi_mask
 
 static void cf_check hpet_msi_set_affinity(
@@ -326,7 +324,7 @@ static void cf_check hpet_msi_set_affini
  */
 static hw_irq_controller hpet_msi_type = {
     .typename   = "HPET-MSI",
-    .startup    = hpet_msi_startup,
+    .startup    = irq_startup_none,
     .shutdown   = hpet_msi_shutdown,
     .enable	    = hpet_msi_unmask,
     .disable    = hpet_msi_mask,
@@ -526,6 +524,8 @@ static void hpet_detach_channel(unsigned
         spin_unlock_irq(&ch->lock);
     else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
     {
+        hpet_disable_channel(ch);
+        ch->next_event = STIME_MAX;
         ch->cpu = -1;
         clear_bit(HPET_EVT_USED_BIT, &ch->flags);
         spin_unlock_irq(&ch->lock);


