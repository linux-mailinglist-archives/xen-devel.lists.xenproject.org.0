Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C9C1578F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 16:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152227.1482744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDlhP-0008WI-4y; Tue, 28 Oct 2025 15:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152227.1482744; Tue, 28 Oct 2025 15:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDlhP-0008Ul-1H; Tue, 28 Oct 2025 15:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1152227;
 Tue, 28 Oct 2025 15:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDlhN-0008I1-Tw
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 15:33:25 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 718e1912-b413-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 16:33:25 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so3824600f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 08:33:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb55asm20970320f8f.17.2025.10.28.08.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 08:33:23 -0700 (PDT)
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
X-Inumbo-ID: 718e1912-b413-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761665605; x=1762270405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z85qis9vgMeTegmX7okcikREeWqzsWQQfOD8abtYAGU=;
        b=NCZ+YbWeJkHZ8TnkE3ZQah/AIMczsnZc/FpWI/ca+e32z3PIN3EFRUyGuoOHFM/YJr
         b+lsVuiwF2XS0eNASs7LvU3A/S/N+y+93xP7buUhbHSmmsaZrE022maV7zm+PGO+QKJK
         2eQQWeaAilCU4YxHdH/IRzPWhrUaV3+fMbmzKoQaGNhkbwrB4i5pW8xrzfVrDXWJh2wY
         Dten3wlpURkMBJvKjTpQUIObXNGTYdPRttGyg0dKJ8YwspM+Lwg9nlA6eD2WCfWJsEML
         fCOACR6SGVyjJXXtgTx/sSeb4vAapriuCfA0DKIvpVeK0D5SMykElGD5eA3gHt/oLg/f
         VWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665605; x=1762270405;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z85qis9vgMeTegmX7okcikREeWqzsWQQfOD8abtYAGU=;
        b=KQGc3klfi4wzyHeGsPfUXR5Bs+rcoftvO8Re2qx8fvngf2na1kJevZ1n5Y7DFir0r2
         WlPQ6p30zl4w7Ll5kmfZ9q/pS3J2qG9t4AkMKtaTv/gxQsNOQ5/C9FAwwbiw46m7hPJO
         WGRb9QqFeIt4XcotNNp02u4UmlzpSX+Udjg4zDQcpJvpXPw0FlnBD5G3aZpaJAcKjylA
         SCS1/G72V0EP8iszdFIg1Rj1XM+x7PP2k4DhmOuzuyCgLCbjszARqEC69JpEafICksQQ
         XNw9oaGI+D3BfQh0Ocgkn/QhtNk/PBKTv+RoVj0Im0DF8+msC4Q/NJM8MWCmqoKXd6Wm
         sQ5Q==
X-Gm-Message-State: AOJu0Yx2GDBZG+h4BvjVtrmaZsdIAy3nfxYcyRcA2iBZZQyZTgr90iYY
	1ynhBx4MLclWN2y6Kd9Sz42M1xQEzM6oqueJc0zosmMJMbASuK5ZVQ5ibK54gOuUkirNpDOv4dt
	lP+g=
X-Gm-Gg: ASbGncuIomskwQDQI4R5OUfJITsjky9tDnAboFQJTzBN/SY0AEMuIfpNnNpCnAdqwbe
	1jFSXxMhRDqBOL7GxGRzmYhqA6q2/Y3ch0pk9uJko/G0t1C7/4EDey3+qH8ULQHvqbyZG8RF7hs
	Jj0x+yLEgUAIuSuvsmM3jDAKhynIWgGUC+MCmMffQnj4y4ChrMv4p4bK4A+ncXB3omFn2qpwPlX
	3ocR5+tnuA19ss0QioHQPy8jkCKpzwwSE2Q3xqHqWtk3hH8ZVRxopFqUTCmiUL4Q9ArbPWi/CQ5
	OKOjzj29lltawQCaPdXvMhEIpZV5srupHPwBkvkv5MlX7pKdo8gn/JwVXgfQoL5WkNEEBr3d1zX
	aD8d7ODLsCM+pZaGnjYtRXltTI6T5yAdbYJKB9UaKJoC2T7mGEN5BJKyoQH/uSN01z8N7n+RLoz
	/8WTX05F3W6aFKwkjWhv1tzaHpyHgUttV+cJcBKd+SB9MfOjVuGls99CQNw9GE
X-Google-Smtp-Source: AGHT+IFdHz/KOsiOfgTgdzLq2IeWArno2v5IbL6+6WUH6N4NFKj3YOMR/aRvtxYMRaQOhB3Hyg6uOw==
X-Received: by 2002:a05:6000:290c:b0:427:7ad:466f with SMTP id ffacd0b85a97d-429a7e83a78mr3434976f8f.39.1761665604568;
        Tue, 28 Oct 2025 08:33:24 -0700 (PDT)
Message-ID: <b18027a5-d277-4274-b762-dd63e96b6d6c@suse.com>
Date: Tue, 28 Oct 2025 16:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.21 1/2] x86/AMD: disable RDSEED on Fam17 model 47
 stepping 0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
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
In-Reply-To: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This particular variant has an error that causes RDSEED to always return
0xffffffff, while RDRAND works correctly.

Inspired by Linux commit 5b937a1ed64ebeba8876e398110a5790ad77407c
("x86/rdrand: Disable RDSEED on AMD Cyan Skillfish").

Like for RDRAND, permit a command line override to be used to keep
RDSEED enabled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Considering how it is described, I didn't think probing RDSEED (like we
do for RDRAND) would be necessary.

Am I going too far in also updating cpuidmask_defaults here, or is us
not doing so for the RDRAND disabling actually an oversight?

Using warning_add() may not be quite appropriate, as we don't really
mean the admin to possibly override this with "cpuid=rdseed" (that's
only a last resort, in case the issue is yet more limited in scope). But
mere printk() would feel like hiding the information in the middle of
lots of other output.
---
v2: Correctly check model, not (again) family.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1219,6 +1219,24 @@ static void cf_check init_amd(struct cpu
 		}
 		break;
 
+	case 0x17:
+		/*
+		 * Fam17 model 47 stepping 0 has an error that causes RDSEED to
+		 * always return 0xffffffff (while RDRAND works correctly).
+		 */
+		if (c == &boot_cpu_data &&
+		    c->model == 0x47 && c->stepping == 0 &&
+		    cpu_has(c, X86_FEATURE_RDSEED) &&
+		    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
+			static const char __initconst text[] =
+				"RDSEED is unreliable on this hardware; disabling its exposure\n";
+
+			setup_clear_cpu_cap(X86_FEATURE_RDSEED);
+			cpuidmask_defaults._7ab0 &= ~cpufeat_mask(X86_FEATURE_RDSEED);
+			warning_add(text);
+		}
+		break;
+
 	case 0x19:
 		/*
 		 * Zen3 (Fam19h model < 0x10) parts are not susceptible to
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -123,6 +123,10 @@ static void __init cf_check _parse_xen_c
     else if ( feat == X86_FEATURE_RDRAND &&
               (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
         setup_force_cpu_cap(X86_FEATURE_RDRAND);
+    else if ( feat == X86_FEATURE_RDSEED &&
+              cpuid_eax(0) >= 7 &&
+              (cpuid_count_ebx(7, 0) & cpufeat_mask(X86_FEATURE_RDSEED)) )
+        setup_force_cpu_cap(X86_FEATURE_RDSEED);
 }
 
 static int __init cf_check parse_xen_cpuid(const char *s)


