Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8375C023E1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149377.1481039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxZj-0003rY-6v; Thu, 23 Oct 2025 15:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149377.1481039; Thu, 23 Oct 2025 15:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxZj-0003pA-2q; Thu, 23 Oct 2025 15:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1149377;
 Thu, 23 Oct 2025 15:50:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxZh-0003ZG-QU
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:50:01 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee2c4cf3-b027-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:49:59 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4711825a02bso8183095e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:49:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427f77bsm106482355e9.3.2025.10.23.08.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:49:58 -0700 (PDT)
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
X-Inumbo-ID: ee2c4cf3-b027-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234599; x=1761839399; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xYN7wbVt5Z5S6tRDPU16XcW0H4EsCETtfXEP3dnQTa4=;
        b=JwW6nP4hN1bumgl1fWHqCRmoWFo/KyU4ZBjyXUmJe+S4AjDDRcozdZDxIs1eBqbSb3
         ozzV2C3ze7k8W5aXtfek16NUzkKq4h9Dp34TAqHcvGo60GDAiwek9a0I3IojjV9jZ5Ty
         QVidZwqdx4E+c0rxYzS+4oqmhLVf5cMUA51Ze/CirFMTj99Thr9C1+3zyUpxAYSJ4RMc
         VWZdVpiG6bdwJ7tjdYAV8+O4ape6j5QWnWlYjseHfrU5GsWMfKSi9eB2wdea9zFxEFB/
         ogXhkOiWHM3tgcd8G5ekATsKT80TAVTzRNd9q859G6nKWcOY97zCPUw8f0I6bU3POpD6
         gMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234599; x=1761839399;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYN7wbVt5Z5S6tRDPU16XcW0H4EsCETtfXEP3dnQTa4=;
        b=BfI5l1v0/Uej+HRLLP6SwAjH9yAqsE7UsVUvnUY77OStDU88moahqckunibGWms54V
         QIA5xDkIbz3itb6QmX5zzhd4O/0+UMOgv+6LRCYoKNzA4R4VuJ1fTj/597IT7PnujwkW
         6f/mspe4iObKFAvBrUe7IHvKF89ZcDVKQjDmegMT4qCFS46FLLeytrcu078FMkPwznpl
         jfuigASOl/LmlYvxhgrfKTI8YlvpCdHNSf7u5mwtL0kdRJ2uDck0BLBzF3cPUhTGVWPx
         5YjqNZ0L4a9MPIxEjkJmy7IPYfTxkT3K+GvqlejExrMwnae8l+XBi4meGXMLtBIXThSa
         OvZQ==
X-Gm-Message-State: AOJu0YwvwqFfV0+3vbZOTcvrmM/lXd3o5Ju7P8tduR9Gn6x8FTYEDAwG
	7SmB+dFewqMCjgRYI3bI1VUdjyw4VQjaSJrRf+Kmq33ln74uhBO6KP6hzG3Zyx5OJiaSPx76GsM
	bUEE=
X-Gm-Gg: ASbGncumya9CqolUuAmECIZJFr5iwBgAwe50/2ey82ac+Az1i/0C/3oK2UndamSTJQR
	hcOOnT6ZtR/I+xPdNdlRjs4XQQiPZgQifnpgR8n2zG7IZc33VOhh9zSgQV1XmbNriZ0UkGJRnIJ
	udLgKRtsoMQRKe2sd5g7bFMOvsAv2/GSXIio8O6OVC7ri8uyyiwj8xs6s0RUxOgZk68VqH6HVPz
	fLBw/QCFV9LRqtbJ5R6eWjTmupnf9HCAmp1O+nydZrRq0aCQ/XeSdBJkjh4rFzKZX9VjbycZn4x
	OiT67rvFV65SBTAI+wVMwSno5aIx5Ekl67O2FvD9RKrwm0nSHrSUZOq2AGs7QP6DFyFvJh8pP7R
	o18vOA3hhJ+SyB7fOd+8tteTHXvLfFO8hU4bhuKHhuQpd63YVBmS5ZUy/s9G9+6nDmBOGzINTwa
	c+hI1IGIOmB869njEf3A5/ohApvfqhGg1AlrOsye3GVO6zjvHaSmZKUUILkL0N
X-Google-Smtp-Source: AGHT+IGnwDYxW5UufGMOiBlDPLZ2gPYdS3aIFPWYUR9OjKDI4sg/WJpI/GzVSBGD0n8f7kYKcmYcVw==
X-Received: by 2002:a05:600d:6357:b0:46e:1a07:7bd5 with SMTP id 5b1f17b1804b1-47160987501mr108488445e9.29.1761234598886;
        Thu, 23 Oct 2025 08:49:58 -0700 (PDT)
Message-ID: <86001bc5-de05-4a5b-9683-54d09c5fa8a8@suse.com>
Date: Thu, 23 Oct 2025 17:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.21 1/9] x86/HPET: deal with unused channels
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
In-Reply-To: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Keeping channels enabled when they're unused is only causing problems:
Extra interrupts harm performance, and extra nested interrupts could even
have caused worse problems. However, on all Intel hardware I looked at
closely, a 0->1 transition of the enable bit causes an immediate IRQ.
Hence disabling channels isn't a good idea there. Set a "long" timeout
instead.

Along with that also "clear" the channel's "next event", for it to be
properly written by whatever the next user is going to want (possibly
avoiding too early an IRQ).

Further, along the same lines, don't enable channels early when starting
up an IRQ. This doesn't need to happen earlier than from
set_channel_irq_affinity() (once a channel goes into use the very first
time). This eliminates a single instance of

(XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
(XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request

during boot. (Why exactly there's only one instance, when we use multiple
counters and hence multiple IRQs, I can't tell. My understanding would be
that this was due to __hpet_setup_msi_irq() being called only after
request_irq() [and hence the .startup handler], yet that should have
affected all channels.)

Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
A window still remains for IRQs to be caused by stale comparator values:
hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
Should we also write the comparator to "far into the future"?

Furthermore this prolongues the window until "old" vectors may be released
again, as this way we potentially (and intentionally) delay the ocurrence
of the next IRQ for the channel in question. (This issue will disappear
once we switch to a fixed, global vector.)
---
v3: Don't disable channels, only set long timeouts.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -295,12 +295,6 @@ static int hpet_msi_write(struct hpet_ev
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
@@ -326,7 +320,7 @@ static void cf_check hpet_msi_set_affini
  */
 static hw_irq_controller hpet_msi_type = {
     .typename   = "HPET-MSI",
-    .startup    = hpet_msi_startup,
+    .startup    = irq_startup_none,
     .shutdown   = hpet_msi_shutdown,
     .enable	    = hpet_msi_unmask,
     .disable    = hpet_msi_mask,
@@ -526,6 +520,8 @@ static void hpet_detach_channel(unsigned
         spin_unlock_irq(&ch->lock);
     else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
     {
+        hpet_write32(hpet_read32(HPET_COUNTER), HPET_Tn_CMP(ch->idx));
+        ch->next_event = STIME_MAX;
         ch->cpu = -1;
         clear_bit(HPET_EVT_USED_BIT, &ch->flags);
         spin_unlock_irq(&ch->lock);


