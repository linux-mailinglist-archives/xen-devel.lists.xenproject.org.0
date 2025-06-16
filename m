Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E39ADB0CF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 15:00:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017206.1394182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9RT-0004e7-7F; Mon, 16 Jun 2025 13:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017206.1394182; Mon, 16 Jun 2025 13:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR9RT-0004Z5-2y; Mon, 16 Jun 2025 13:00:03 +0000
Received: by outflank-mailman (input) for mailman id 1017206;
 Mon, 16 Jun 2025 13:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR9RR-0003pW-RX
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 13:00:01 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf83a78b-4ab1-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 15:00:00 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3313320f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365d88f447sm60051525ad.45.2025.06.16.05.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 05:59:59 -0700 (PDT)
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
X-Inumbo-ID: cf83a78b-4ab1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750078799; x=1750683599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+5Soi2kJcSJ+g49AA3Ctrt1tH15NUClp6ljEBqxL0MA=;
        b=CJ6AGN+AdNR7G/ELf5OxfU33EakJzDn6LwM1ZTbPHJpUUWW4PxNf2+0ViZAClRnGfS
         mD5na5OD8xFvYnL4f03GNO5msueXNppRgHujQ4oc4V6Qg0PCBKstg57BGO97l7RgdYWD
         ajvRg4b2R3YHIh5sseUAh3HiUfliYTudWNs+ryeloq9itqUYWCyrPARNFe4Z9IxRmX5n
         6qxbAYHCRZ7mFBtmP/pf5Hiu3n51l2a4gjc60X7AcwePo+y0kvV2Xvh+qZpT7yTqkQjt
         51SP3xY6ven9wCi1LCRlHXPY0xZ9rZ6WTFIrialpOCp2OsitEZEGHdbpeJ5Zl20dCc71
         IOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078799; x=1750683599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5Soi2kJcSJ+g49AA3Ctrt1tH15NUClp6ljEBqxL0MA=;
        b=gmi3SEgKBWNhCtHYjKaFI2xGzqvVMQDyI41zl2+16cNL+s3gmi/WaWe5yK9B8NwkkM
         X4NWWXw0OpeOOuGZjGFBJDuSflz9ydmEb9tCjAWFquHon6vY4dQPns3zkiBZAWQcz5W1
         xgBQRhDgAI0RwmRQ3QMPhJnO/SPvpoIT4Gde+CC54k5B4suIwuppPJJEISjRNnCziPOV
         /XpDYFKgjhARmpGP5hUsK36yaHM/P/J9DkLYeLYJZR1K4d6xtTAdzlOkY+J4NorAnc+Z
         c9W0D70jSR5Xvt585rNGzqaqJXY5+lxoNmPtaxv5FzWnX0QQH/0VxpjE35yQ+R50sJKT
         rZmg==
X-Gm-Message-State: AOJu0YwEcsRVnCEg9FlCOJe0EzjP4Mp2WsvTkq2FMUwDG3OMGRhm3kwK
	Zn2XK/Dear0CtukE0DfpLUeLqtKOPExIGQUGNHKvkr20KWMZmK+rxXLyVbKQB4PGFBwKwpSNOL0
	dOUM=
X-Gm-Gg: ASbGncsn9aZ9LH/58uBOU+Foj9F0EiNd2tur/YYCzhpataPLDpJKAJ9wrabq87DZu/z
	ohKrejbeox0sH8NHjDy+S87NqXkzkiJPNkTilc1mJAnnJP6tgCmefcgElnQCEpQVXv62v3IKpVG
	q2omZYuqCrvnDZEJ2xtybNUPNTHldOxmab/EW96Kxpw5fbzQ4eFOfQDig2KGe2r7mCmir2B6j2q
	TPtghu8sONpbRutzW3KOksfknKCnRirQO9Kiq59AUAzT1MROb6DfUE5LyYbdhVacVvO5PFUwPo7
	sQoyrmpXim+SiQVNaXSiYH7tGAnpNoq88w+Ql0ajSpLNzcMUUrWzvPG4b43phuAObc/7vghMaMq
	IL0m+3fEs9Rd7kVHWeokZrHTaT2v3qhin9Fov3CaiXfE1dfg=
X-Google-Smtp-Source: AGHT+IHZNO5ywfqqom9NEqGjAoqenIhMq3NeePncRuDPT2gLtO+3sY5htYXdBhtw100vKrKUt+p1pw==
X-Received: by 2002:a05:6000:3112:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a572e79749mr8135800f8f.44.1750078799533;
        Mon, 16 Jun 2025 05:59:59 -0700 (PDT)
Message-ID: <658802b4-1847-455d-98ad-244d97fddc5e@suse.com>
Date: Mon, 16 Jun 2025 14:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 2/7] x86/alternatives: serialize after (self-)modifying
 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
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
In-Reply-To: <c5e1e7e0-a295-4028-b003-152b861ee14f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While supposedly safe via enforcing a control flow change when modifying
already prefetched code, it may not really be. Afaik a request is
pending to drop the first of the two options in the SDM's "Handling
Self- and Cross-Modifying Code" section (still present there as of
version 087). Insert a serializing instruction there, and remove the
"noinline" in exchange.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking with LIVEPATCH=n the if() (but not its body) is dead
code. Adding IS_ENABLED(CONFIG_LIVEPATCH) would feel quite a bit like
extra clutter, though. Plus Misra rule 2.2 is globally deviated anyway.
---
v6: Split off. Extend commentary. Load deterministic value into CR2.
    Drop "noinline".

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -194,13 +194,18 @@ void *place_ret(void *ptr)
  * You should run this with interrupts disabled or on code that is not
  * executing.
  *
- * "noinline" to cause control flow change and thus invalidate I$ and
- * cause refetch after modification.
+ * While the SDM continues to suggest using "noinline" would be sufficient, it
+ * may not be, e.g. due to errata.  Issue a serializing insn afterwards, unless
+ * this is for live-patching, where we modify code before it goes live.  Issue
+ * a serializing insn which is unlikely to be intercepted by a hypervisor, in
+ * case we run virtualized ourselves.
  */
-static void init_or_livepatch noinline
+static void init_or_livepatch
 text_poke(void *addr, const void *opcode, size_t len)
 {
     memcpy(addr, opcode, len);
+    if ( system_state < SYS_STATE_active )
+        asm volatile ( "mov %0, %%cr2" :: "r" (0L) : "memory" );
 }
 
 extern void *const __initdata_cf_clobber_start[];


