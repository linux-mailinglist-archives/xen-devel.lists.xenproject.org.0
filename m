Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE5CC1B8B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187749.1509087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRCV-0003vt-9G; Tue, 16 Dec 2025 09:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187749.1509087; Tue, 16 Dec 2025 09:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRCV-0003tE-5t; Tue, 16 Dec 2025 09:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1187749;
 Tue, 16 Dec 2025 09:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVRCT-0002x8-JZ
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:18:33 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30a19a6c-da60-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 10:18:31 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso52498065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 01:18:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f268d459sm18845621f8f.32.2025.12.16.01.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:18:30 -0800 (PST)
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
X-Inumbo-ID: 30a19a6c-da60-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765876711; x=1766481511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ANz5oLAgLPEi3G+5B2ZyA8WOqvy5xevNUG2OWEhCbwY=;
        b=PPfvHidQJIoBmUeoAqBeZxEJiE/oxXNh/hSGi/t14kMPFSrdBS/vKpte/CVJJMgpon
         fEseWGHIVCHW9U0ERB4WhKyneJxLMiyzA0/m3qeCjTpJez2zE+iVh4T6C0M+0/LRCBVi
         iTLGYB94F/lzjws69BP49jKuPF0cX704v6DmE8TmuB86S9O08zYBezyQ4HbrU4tT6RMu
         mQiuf3T2jqJXjlV7HQuWY5z48zkVYK7PL3Z8L50bwmSTxGGWs3mKfyYdAhN8X2QWMEnW
         spUg3pmItvJM9g0e0pcKV/9aMtAvsfqS9Vxjf7PfRR5AYN5m0Yzf8ttb/PMbIyfU+J+F
         Reig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876711; x=1766481511;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANz5oLAgLPEi3G+5B2ZyA8WOqvy5xevNUG2OWEhCbwY=;
        b=e73cEF25hpY8XoRrEGTqKv2MUD2U4ARTkhryPQSwOGmN3CNPNyBjpAeO1PkGt4LC+V
         4tfb/D7lmwQkn4Ngt204W6FpIwacrCFwqVqPiaW2/TcP4r+pSGBUDIblTI7UNL1hqBCL
         o95tY/zx6lDbPrxZPpCt6hgKdlXL7sDyLpHwEeLFCjlZZbkDLOVioqhS4MMye2do+d9C
         bwao2Wm9xf09gYxF9MR27N5qjcWe7wIK8Cugido17RpsjGh9GvoLcEYQx3ARSOflc9oF
         OEwCKhHfs1Tm3f3Q3tKl/kFF/ZebQ1nqXY0QN40R5lR3Z5LBJ9H2RFrIO8kREUF6S7+y
         C23w==
X-Gm-Message-State: AOJu0YxDyNXi5dryGLt1UVcqm89trx2loh7MMVYOJgAaXcuk1wVDTtkh
	dmrmbHV28ikzBDAEAV/GP/k+1z1i4VRW/pfSyU/94PecGSVuX0dQsCulXzVyZPQfEQUP1ptei4f
	2pnM=
X-Gm-Gg: AY/fxX7mo1bMmuKi0Px8RIhB/2eQ6E7fuDCkTyRWPYtVRJ9n3dDEGFFxub91wWJRdE8
	wSmSHiEPODzDfAYJBrXSs4gVEaJ0zUI1j9rgGgZGBF/VLrCA02NwI61lVTP7nq5ESwAV/qFmBO2
	bv4vAbN1AJu7ENzP7hlWWJwZ9+U162boYCgvu9zOHEQV9QyyCmAZUuR+1qRNOVuLA60z6Rk+xyc
	rOIWEW0SyXsI/4aBh7SxOj1OT+lAiSCeoTM0WkB9ZxtuLesAu2gq+1fx0CQhDy1Vi3c9Vr0MAST
	HsOqFMFJCsv3zeaYRo4ZyAV8rMjP9XtOHbpXTKExhWgkG8meDyLSvg5zDPZ/saVytQuPEkri1wg
	IItJcP1G/v0mkYbOKQpUAAeHXCkA+99ReYNFUsn6kSOpe75TGTLcaWkDV86fC4xZ0KVn6XNhSA8
	5zdgxBssn2Zqn4yLvpTt/toxr9GXo2zYMeZA/mcMmRQIm3iIkhTT26WoVtFTvBZiXVqhH15Iv58
	RqQceLj2MMRrw==
X-Google-Smtp-Source: AGHT+IFWoWq4Un9AFPJHFLLN+PMuHGfqC0Of2ZBbcCiWWbTfmMIxvPsUEbP9C7XLINEzD6HPIVC/TA==
X-Received: by 2002:a05:600c:45c9:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47a8f90c516mr143378485e9.27.1765876711194;
        Tue, 16 Dec 2025 01:18:31 -0800 (PST)
Message-ID: <2c224d52-6f3f-4fa9-abd5-dc7ea13b3402@suse.com>
Date: Tue, 16 Dec 2025 10:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/3] x86: move {clear_,copy_,scrub-}page.S to arch-specific
 library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
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
In-Reply-To: <f73aa7e9-c176-40c3-b5f5-81c69cb219ac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

These are pretty similar to the standard library memset() / memcpy().

Switch to building scrub-page.S unconditionally; the linker will simply
not pick it up when not needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.
---
While moving I noticed that the files here have .file at the top, while
mem{cpy,set}.S don't. There not being any static symbols, likely we could
omit the directives here, too? Or should mem{cpy,set}.S gain them?
---
 xen/arch/x86/Makefile                           | 3 ---
 xen/arch/x86/lib/Makefile                       | 3 +++
 xen/arch/x86/{clear_page.S => lib/clear-page.S} | 0
 xen/arch/x86/{copy_page.S => lib/copy-page.S}   | 0
 xen/arch/x86/{ => lib}/scrub-page.S             | 0
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename xen/arch/x86/{clear_page.S => lib/clear-page.S} (100%)
 rename xen/arch/x86/{copy_page.S => lib/copy-page.S} (100%)
 rename xen/arch/x86/{ => lib}/scrub-page.S (100%)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 43117c88e59d..1fc651146f10 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -17,8 +17,6 @@ obj-y += apic.o
 obj-y += bhb-thunk.o
 obj-y += bitops.o
 obj-bin-y += bzimage.init.o
-obj-bin-y += clear_page.o
-obj-bin-y += copy_page.o
 obj-y += cpu-policy.o
 obj-y += cpuid.o
 obj-$(CONFIG_PV) += compat.o
@@ -57,7 +55,6 @@ obj-y += pci.o
 obj-y += physdev.o
 obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-$(CONFIG_X86_PSR) += psr.o
-obj-bin-$(CONFIG_DEBUG) += scrub-page.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
index a5169f5e19c1..b9a65c662a56 100644
--- a/xen/arch/x86/lib/Makefile
+++ b/xen/arch/x86/lib/Makefile
@@ -1,5 +1,8 @@
+lib-y += clear-page.o
 lib-y += copy-guest.o
+lib-y += copy-page.o
 lib-y += copy-unsafe.o
 lib-y += generic-hweightl.o
 lib-y += memcpy.o
 lib-y += memset.o
+lib-y += scrub-page.o
diff --git a/xen/arch/x86/clear_page.S b/xen/arch/x86/lib/clear-page.S
similarity index 100%
rename from xen/arch/x86/clear_page.S
rename to xen/arch/x86/lib/clear-page.S
diff --git a/xen/arch/x86/copy_page.S b/xen/arch/x86/lib/copy-page.S
similarity index 100%
rename from xen/arch/x86/copy_page.S
rename to xen/arch/x86/lib/copy-page.S
diff --git a/xen/arch/x86/scrub-page.S b/xen/arch/x86/lib/scrub-page.S
similarity index 100%
rename from xen/arch/x86/scrub-page.S
rename to xen/arch/x86/lib/scrub-page.S


