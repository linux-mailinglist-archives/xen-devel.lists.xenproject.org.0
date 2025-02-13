Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335CA3403C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 14:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887584.1297047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZD9-0002Jt-Fi; Thu, 13 Feb 2025 13:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887584.1297047; Thu, 13 Feb 2025 13:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZD9-0002H8-CK; Thu, 13 Feb 2025 13:24:59 +0000
Received: by outflank-mailman (input) for mailman id 887584;
 Thu, 13 Feb 2025 13:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiZD7-0002Gj-S3
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 13:24:57 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea4fd330-ea0d-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 14:24:55 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab7cc0c1a37so165921766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 05:24:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53284042sm129936766b.82.2025.02.13.05.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 05:24:55 -0800 (PST)
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
X-Inumbo-ID: ea4fd330-ea0d-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739453095; x=1740057895; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9A2ZqGlQVF5jAnHDP9IKVcBJx7H9PvwbuvwHPjyA7Rg=;
        b=B3UV2ZDLzH3LKeokkDTgjyyvdSvq/VDBV7uadGiUioUikl3pWxy+3eJCcXzOl0Qc5L
         TozL/1TpJJgdyUHftzTghdmvqRir7O1pILzxosz6/LhSlQM2kon9QNNOoAv0qxazhiyj
         wlfvQ9i+vaCq/v47zukPI3h4EO0viYzZ6bWbjXKRuu/1hUmasP7QFkJE9G9CY/o1eL4W
         JOtAj6bOsGAH9Gps17DddcFhcJ5MIQGt9ScDN1fJDKBAAF9TRjXl1TUIxHbrgbiIXlW3
         suSON6dEHif3Y2FxJxmmkqNHhfLQxjjD1IMlARn0GS2FGjJwhVhNR6Vb/CVM/hTW98uJ
         EnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453095; x=1740057895;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9A2ZqGlQVF5jAnHDP9IKVcBJx7H9PvwbuvwHPjyA7Rg=;
        b=FtbtmnnIpsPwZgPCBcDrtii6eTr/bMq04HgPNNT6MTXQzpdOXFQ6sCeM53fL8LwwDD
         e+uTAA4FvR+WrvP5wn5Gp1uzVSCID5VdQnECSWsFY8/nZVqbOjni84Wb6TFVCFGbhto8
         o3OQs6wbLCaCQH5k1kSjYgbuhNMdiIw+nWPsxovuaIlHo1tcgMUzsp2BNOEH3MR32ORp
         LybozHNMEP88dlVtI58hfpsnnpVvOvXqDMl4xff2ej4iDzXceaVZH+2PPdM9xCFDw7di
         AQcJr0TjRG9+q3aUMV+N9z9dVIK/39W55Cu+lrgcT/036e+xqjlGWHmy71AhTizwWoa9
         dnkA==
X-Gm-Message-State: AOJu0YysuHHSRr509b8Plz4N+Sl/KeAy8LF5aCfiIwSD1Ake5yoNbLzR
	okFXfv+SE3gQNiY+F59oo6nmhgzogg04k7WLMwLsdH84WrUaCZYxgJhSSdbelHdGyo6rGAXZJ5M
	=
X-Gm-Gg: ASbGncsUYeUl7vkxQXi5vVJGdzsG5adU1vAHtepAIvleH1jW7b8RfDwpp+eQfvUqwct
	XAh2xd0Lcc2CMQW5XdjhmZh3gfbFXYn2Qzust6uSB1t/6VmzG040xBDuD/+bndvp39I4sfLXd8j
	xbs/47Z3poa4JufvfeaJ+StaJ9/Ajny27LAAyrWb9Wst7kG20Zw6CVfCMC2/6eeMVUOkwNdMlNG
	3Oqt38WBiGQIz9hBMt4JZK+aKrlvqM7ycj7qM6hb3LyUfZ3QCjVBaa+Q/58W32S5XWPSpa3lg9G
	ZcRzIFZ4Y4HV+kjpK7m//Q+o1aBlDe3bqTAh+PEtXjeLmkUnuqNyW5mhdF01vK5wdUvLECyMerL
	k
X-Google-Smtp-Source: AGHT+IGctY2n1yR6CsLIOHwWoBiAgSilZR7jQtBehnR4wi+D+16RWvVEwb+c5QaVPIasLQX94yF/rg==
X-Received: by 2002:a17:906:9c93:b0:aba:598b:dbde with SMTP id a640c23a62f3a-aba598bdc2dmr104270066b.8.1739453095275;
        Thu, 13 Feb 2025 05:24:55 -0800 (PST)
Message-ID: <d27c75e2-df05-41b9-84d4-9d3d6443ef1d@suse.com>
Date: Thu, 13 Feb 2025 14:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE: fail init more gracefully when CPU vendor isn't
 supported
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When mcheck_init() doesn't recognize the CPU vendor, it will undo the
all-banks allocation, and it will in particular not install the CPU
notifier. This way APs will pointlessly try to re-establish an
all-banks allocation, while then falling over NULL pointers due to the
notifier hot having run and hence not having allocated anything for
them.

Prevent both from happening, and additionally delay writing MCG_CTL
until no errors can occur anymore in mca_cap_init().

Fixes: 741367e77d6c ("mce: Clean-up mcheck_init handler")
Fixes: a5e1b534ac6f ("x86: mce cleanup for both Intel and AMD mce logic")
Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -634,16 +634,13 @@ static void set_poll_bankmask(struct cpu
 }
 
 /* The perbank ctl/status init is platform specific because of AMD's quirk */
-static int mca_cap_init(void)
+static int mca_cap_init(bool bsp)
 {
     uint64_t msr_content;
     unsigned int nr, cpu = smp_processor_id();
 
     rdmsrl(MSR_IA32_MCG_CAP, msr_content);
 
-    if ( msr_content & MCG_CTL_P ) /* Control register present ? */
-        wrmsrl(MSR_IA32_MCG_CTL, 0xffffffffffffffffULL);
-
     per_cpu(nr_mce_banks, cpu) = nr = MASK_EXTR(msr_content, MCG_CAP_COUNT);
 
     if ( !nr )
@@ -654,8 +651,11 @@ static int mca_cap_init(void)
         return -ENODEV;
     }
 
+    if ( !bsp && !mca_allbanks )
+        return -ENODATA;
+
     /* mcabanks_alloc depends on nr_mce_banks */
-    if ( !mca_allbanks || nr > mca_allbanks->num )
+    if ( bsp || nr > mca_allbanks->num )
     {
         unsigned int i;
         struct mca_banks *all = mcabanks_alloc(nr);
@@ -667,6 +667,9 @@ static int mca_cap_init(void)
         mcabanks_free(xchg(&mca_allbanks, all));
     }
 
+    if ( msr_content & MCG_CTL_P ) /* Control register present ? */
+        wrmsrl(MSR_IA32_MCG_CTL, ~0ULL);
+
     return 0;
 }
 
@@ -751,7 +754,7 @@ void mcheck_init(struct cpuinfo_x86 *c,
     }
 
     /*Hardware Enable */
-    if ( mca_cap_init() )
+    if ( mca_cap_init(bsp) )
         return;
 
     if ( !bsp )

