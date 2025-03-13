Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43244A5F604
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912165.1318485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsigp-0005PV-AK; Thu, 13 Mar 2025 13:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912165.1318485; Thu, 13 Mar 2025 13:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsigp-0005NZ-7d; Thu, 13 Mar 2025 13:33:35 +0000
Received: by outflank-mailman (input) for mailman id 912165;
 Thu, 13 Mar 2025 13:33:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsign-00054A-Rq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:33:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1306f21-000f-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:33:31 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so8256875e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:33:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318aa1sm2188236f8f.64.2025.03.13.06.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:33:30 -0700 (PDT)
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
X-Inumbo-ID: c1306f21-000f-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741872811; x=1742477611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Me251RWcZ43pewsUtLw3vQfNxPNwcf840kn0EwBGFJs=;
        b=dmpT/IHLLLb2jQKU+VBqfzCPOKfLY6lhybHMPE/Hr0s/pB1OdkugXf9sauZf/j630L
         1V9rw8c0nDcymuZ+EsN25C6ipzF13h6KxFzpdy8ix6fGumjSd8huYmy+C9htMCzi6C1z
         exGltjMbnoBR7T0QlW8RydUbRCbtguFN4rNNC3lZxicZ0XRHd/rYhLgynR8VAO2JddA9
         WkbYUXkbHlUBlmV4DAeYd6mzsLOqXtsb/svw3HXDSeKDY/VJg+BxPIkrzDTA34ZwCkxi
         mszF65NrDM8PTsf0RkByrkUUS69nr/LIob2QQ2DeiVF5Q/qPA5fkphVHqufn5QW8E5bL
         xozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872811; x=1742477611;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me251RWcZ43pewsUtLw3vQfNxPNwcf840kn0EwBGFJs=;
        b=CDkoT6dgDqDs2Qh1099zgpsYHp0H6dguAwjgZ5eE/kdrgGtlO5aOE7YXWtigTVal1Q
         xJDx8dwz/+Ql2byKhGwWwHXeAweamunIR8jQCLoRSx4NVVtLB6qMCvyDT9zP8BCRt6RY
         NPTs3k8mZ69zzFJDWvpokZhWNLXn/b4G2cC5nMCoB8QcHwotnj64//aZ3xNtvjl1bCwI
         k7Q1LYIr4ZX/Lnk/WkzqI5zfg09ZuBbAt9QDbQKat8wfgP6Afl4bMrte6SE4u1NXmmQT
         3FzziTYyQgXWvKI7Kwl6CwaHRR75rQW7VKpc9A6fdmNOoun+y0gHvWEfYUOXeHBxkt/y
         mImQ==
X-Gm-Message-State: AOJu0YwlPIiB6zUM8LgltZSgn84XG+jmO/CUjan/l9OCg55bfYshdXLz
	Wi4MatkRZ5gzNwPcwibJVyRQVoo5iyKhhZ6ksNXlkI4wcYNmogjDgfxBJsy1fwidXdnk0KWPnNI
	=
X-Gm-Gg: ASbGnctiyK7vNeuvJUEeaDCDKFTfjNc+/lK7ZID0MVMcfv8tOZspWPVSTSBCPhal+Xf
	h9jrMs7TporV9mQ47dGy5vzQbQ/2Kj1vQafpixrietQWkj9ucm49EsUGkd5h0DHNgqV8eR0ogSK
	1THtEv5l/B4rQ1r2YokYrkjFU5e8tWpF+PfkQduvKekxYAExB0LYMyYoOtEgX8mPJB/6fgMap+l
	OhYdSgGjNk3elHYY3kFM7gtzZXY6lQBzyFTqhTp3qS2+9wk6K5mDIJLskxkf0s4VNcSxTR3nMVV
	TQCO94VVjE9gjsk8mMbf7LxoI+6UAlsEStsyaDXPNfWKY0bwPrEXtIIQgPzwIR/VggiCQDXW7yA
	pjgoIpSKC8wm7Tnlb2CFTL373JcfJow==
X-Google-Smtp-Source: AGHT+IFIuB5tfUpB/P1VsNzLMI+pUqeK67zi/bdexalWFWe2qSO/aADXxhXOsNFGEhbjy3XXHG8Sxw==
X-Received: by 2002:a5d:64ec:0:b0:391:1473:336a with SMTP id ffacd0b85a97d-39132dbc5afmr17663153f8f.36.1741872810977;
        Thu, 13 Mar 2025 06:33:30 -0700 (PDT)
Message-ID: <b09c2c89-ae6b-4942-8e22-61a2ae2862a4@suse.com>
Date: Thu, 13 Mar 2025 14:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] VT-d: move obtaining of MSI/HPET source ID
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8b610dba-0ce9-47ed-808d-035dc48f4f04@suse.com>
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
In-Reply-To: <8b610dba-0ce9-47ed-808d-035dc48f4f04@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was the original attempt to address XSA-467, until it was found
that IRQs can be off already from higher up the call stack. Nevertheless
moving code out of locked regions is generally desirable anyway; some of
the callers, after all, don't disable interrupts or acquire other locks.

Hence, despite this not addressing the original report:

Data collection solely depends on the passed in PCI device. Furthermore,
since the function only writes to a local variable, we can pull the
invocation of set_msi_source_id() (and also set_hpet_source_id()) ahead
of the acquiring of the (IRQ-safe) lock.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -508,6 +508,11 @@ static int msi_msg_to_remap_entry(
     const struct pi_desc *pi_desc = msi_desc->pi_desc;
     bool alloc = false;
 
+    if ( pdev )
+        set_msi_source_id(pdev, &new_ire);
+    else
+        set_hpet_source_id(msi_desc->hpet_id, &new_ire);
+
     if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
         nr = msi_desc->msi.nvec;
 
@@ -575,11 +580,6 @@ static int msi_msg_to_remap_entry(
         new_ire.post.p = 1;
     }
 
-    if ( pdev )
-        set_msi_source_id(pdev, &new_ire);
-    else
-        set_hpet_source_id(msi_desc->hpet_id, &new_ire);
-
     /* now construct new MSI/MSI-X rte entry */
     remap_rte = (struct msi_msg_remap_entry *)msg;
     remap_rte->address_lo.dontcare = 0;


