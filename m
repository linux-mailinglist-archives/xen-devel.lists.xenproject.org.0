Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745D9CC1B82
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187737.1509076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRC2-0003N7-0G; Tue, 16 Dec 2025 09:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187737.1509076; Tue, 16 Dec 2025 09:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRC1-0003JU-Te; Tue, 16 Dec 2025 09:18:05 +0000
Received: by outflank-mailman (input) for mailman id 1187737;
 Tue, 16 Dec 2025 09:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVRC0-0002x8-Gu
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:18:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f4279c6-da60-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 10:18:02 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso1540944f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 01:18:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b750sm33747905f8f.42.2025.12.16.01.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:18:01 -0800 (PST)
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
X-Inumbo-ID: 1f4279c6-da60-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765876682; x=1766481482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h64sTDLguGxk8lP/Vg5Q4BOrQyBRO8zqvkCiMvX5SkE=;
        b=DCYV9XdnnkjvQLj1XegC1ZNBcfauGowunyvupf0VVS6KyiFBCnUoGSITCnOzZwUjIe
         MNMj+0t4iGPrflDpvcsjJvh89J3A1oXCw0rOLweRhnsVTjP+xGfWRxRpzNLdX/LYFGbC
         AFsMC68ehbnXrFgvJ4SzTqxHE/eGoqtzpn3y+7TIUWgGHMSGrRVA5GVwJcTioxGrao9T
         kKTqv/CRutMnBKApDHLeYr+7VdoICSunb3o8gtvg0g/6O5I9lG1dcuYfMEV5540/M6Ka
         Yj5oke6ois3VF5o7W1rI8Z+HYN39stp8/IVG50wuzjRFIqkCswRlRp80odTfiAKbwkit
         a0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876682; x=1766481482;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h64sTDLguGxk8lP/Vg5Q4BOrQyBRO8zqvkCiMvX5SkE=;
        b=LV3ZRcEONY51JHENZffl6y31jF5CDHTdESIkHhLbGVYDsN8Y2tzd51vQKdju5PrIl8
         et8EIZP3Vnr++4LAeOAwi0SENQrnay25qviebcZ8wUwqj6U4NQveVI3qsLa3DgkT1ACn
         nGtR4cmrto3sbm6FKqXrW+Zw2+88u2481j3ll/FT/4aGhtHYEHy2ddcEakcUtWzKNBeb
         VMOPzsX5kdUwlq0/6C9VhPu3kvhPIM0juoCW1D97O+keS2uw0zdh/bVJC/NLTWZfWnzj
         Odp8pQMavI2na9vV5H8Bcmaq1803uxNrAdbuMJm3/HwJpshrtTT1enTDyCXL/jfZgKl0
         ntuQ==
X-Gm-Message-State: AOJu0Yze0PyPQ5C+mF9D4TngatUi7SYFUMXu5ZiFFJzyKzOzOGkdbxYz
	Q3jQPqdemdHxNE/EjSGpDOE+IOXNcwBYXSvqtac7JNCBBmhK1IOxMuamon85sN1T3PVsemIkGYf
	2eQw=
X-Gm-Gg: AY/fxX5b56UlAYx+mPZTqA1hG6RJxk2NBIB0bZsXN5003vNhAYqwlxISd0KU1LoC/qK
	KV8W0X5g5bNDEIsYuAb4bHkUa/R08OMwv0z+j4g8i2f3hTxXDmCUI06LDKDaNDMHEAthNQ9TRZY
	MplNLSirANcDGe3KnJZQJvownUY9eaWER8ZysQSLyqHYB3l0Ei6n0yURStz9G0eTHre00Ebw1bZ
	ProY/wO9hcQzsQNVAZ93vbUtK4dIDtbDv80deDV3F4VvB6ie+JGw3jgTsAgAOP2/zfET8c17UCY
	h/gTHXd+nXtPhmaYASPhSqmY9LM3rBasyR8d0ZIBEvrOB1/AroROdr8A6Ya9VmlszrX5FTNEFn3
	FiB6cd94xvXaUzFYY++rVdix3hbmOta9MFeFOxWpSzHBuX+Sx5gvG7Y3bg2qVy3S5tGV0IHFbPx
	PiVEMFwpM3btOwLEaP6SehuxvCfM0sain7wll48wgNIAn4ieuLjJ5Xv+CGkkLgkelU665YFwkPD
	NY=
X-Google-Smtp-Source: AGHT+IFAY6FsHV3I9WPbISaGV1wLqBZ/XPu/1Ydb3y0EhUes/HrpQ4m7WNEmIXHmQDezrbkDlFI4Ig==
X-Received: by 2002:a5d:5f92:0:b0:430:f6c0:6c5a with SMTP id ffacd0b85a97d-430f6c06ce4mr8796492f8f.22.1765876681942;
        Tue, 16 Dec 2025 01:18:01 -0800 (PST)
Message-ID: <8b856e83-5da0-4e96-a4b3-0561becc57ca@suse.com>
Date: Tue, 16 Dec 2025 10:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/3] x86: move mem{cpy,set}.S to arch-specific library
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

If not these, what else are library functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.
---
 xen/arch/x86/Makefile           | 2 --
 xen/arch/x86/lib/Makefile       | 2 ++
 xen/arch/x86/{ => lib}/memcpy.S | 0
 xen/arch/x86/{ => lib}/memset.S | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename xen/arch/x86/{ => lib}/memcpy.S (100%)
 rename xen/arch/x86/{ => lib}/memset.S (100%)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index dfb258d7ac1c..43117c88e59d 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -48,8 +48,6 @@ obj-$(CONFIG_RETURN_THUNK) += indirect-thunk.o
 obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
-obj-y += memcpy.o
-obj-y += memset.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mpparse.o
diff --git a/xen/arch/x86/lib/Makefile b/xen/arch/x86/lib/Makefile
index 8fe2dfd88553..a5169f5e19c1 100644
--- a/xen/arch/x86/lib/Makefile
+++ b/xen/arch/x86/lib/Makefile
@@ -1,3 +1,5 @@
 lib-y += copy-guest.o
 lib-y += copy-unsafe.o
 lib-y += generic-hweightl.o
+lib-y += memcpy.o
+lib-y += memset.o
diff --git a/xen/arch/x86/memcpy.S b/xen/arch/x86/lib/memcpy.S
similarity index 100%
rename from xen/arch/x86/memcpy.S
rename to xen/arch/x86/lib/memcpy.S
diff --git a/xen/arch/x86/memset.S b/xen/arch/x86/lib/memset.S
similarity index 100%
rename from xen/arch/x86/memset.S
rename to xen/arch/x86/lib/memset.S


