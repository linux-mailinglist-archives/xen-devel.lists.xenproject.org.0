Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D162FCC1AE3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187694.1509037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQvl-0008Eg-Su; Tue, 16 Dec 2025 09:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187694.1509037; Tue, 16 Dec 2025 09:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQvl-0008CY-PA; Tue, 16 Dec 2025 09:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1187694;
 Tue, 16 Dec 2025 09:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVQvj-0006HB-SB
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:01:15 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2368090-da5d-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 10:01:07 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so2627273f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 01:01:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f675c2basm17111163f8f.18.2025.12.16.01.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:01:06 -0800 (PST)
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
X-Inumbo-ID: c2368090-da5d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765875667; x=1766480467; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p5fvghTusZQ3e6eOiSVcHZYMJoDMt1aEyAtEMdEqUNc=;
        b=FExVUzDIeJEO4pm8HqIxmDiiM9ndXBlgNlKYftZR+nHrKplf7Bz9UY20JBjNMHZSf1
         ClcTc3W7bfZ4MQoBq/mw5ijhSQ0oeffavqRTyGlOcA3M+Mbwrzzo2vKIm9hDrGzjTIX/
         FyMp44C0FRzgsBGazlTQZb3oVDyBrlKhR93INUvsAt5GyEyS8bjbyKoCaWTGV6UbYZ3s
         O68kopLYtDxrV2g3jb1OQALDbu+eR3nzHpnQvrF5XeVn+yTecbgYKeRZb7smXunZbaxJ
         aeF/tUMOG1xFM7+y+e8b4mcgyseYKzq2jotNr5ZOfuhlrW17SjIVcodJGT6AhHuNy4bR
         sAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875667; x=1766480467;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5fvghTusZQ3e6eOiSVcHZYMJoDMt1aEyAtEMdEqUNc=;
        b=kO3+luvWggrQ+B1wqjpMwfZAHPCtTe1I7EJ8fSoFFDq5C4cm67byTySXybToijVWvt
         4pfa9K0zd75f0sR1ypFThDvP2rPG1/bvWEAJ2XMEUDpwEM0YMUOT/T3cWUoFpXdnPl6d
         0k6fM++dLzLRKYEgRjiNyXNOD3VX3PDSxYElcJI1f61bvyi32a1C+TVwq1pxB/zDZArs
         lpThMdDSVb1Q+GQO9Fi6DoTWLSgYLQZ2AuMI0/u76CgFjAC3u4nq71SwN7vj/b7f0eys
         E51XgBXR6r4HyWZKLmObFaCyFChWfk4f8/KSWQ5CfGdTEKMf74crVyk7g/Ol6sFxvrvr
         ne9g==
X-Gm-Message-State: AOJu0Yy5adrGpwDP2b27LN8ap93KwmSAbvIOVLaf7f5TAWOTsZEwia+8
	O5TSy+pv6AhQ/1sYY67E7DD/tuse0fO6MpQ5MudU/8uX6I8dhbvn/z8TMprC0IprG969zfMQKrb
	A7UU=
X-Gm-Gg: AY/fxX7P+/5eNMJXo8/auBi37SwAz3yb6GVqJTuxCBBdk5YwxrZFoKpMOIjvDLF9qgY
	5kKcf3JHXlmNw5Aol3pNQ2l+7GkvWs04Hdubv4k6+dh6za+Z6FW50bcaa1VZ2ams/KJsPL5gJph
	iqaIwQS2fK9TFbzYIPbGKBftusbPtWc6UGT2XZnODJ9WNZtPtBs8ezWllLrtxm/tD9inbDJAsfI
	htTRw720OhgfT5497pNbJLlEXkKbjIF3wTxTg7mvOY8ooONeH/XZhhGy2uFlJ4vRhZjAQHYd8M2
	zQo9OoARJ/fKf2JsYuOX9PIFvUChFrZlEU+OYm8TnF+FzBr8w9CSGZkrAdEmnZs0r5iDyGx6PLE
	hz14t5sunvIyl0I13i1QG9DjQkPdeP4dIgTvTxWJ5vyp3AJ3d4dTclFfqRSQOxFdzI0VHwqXW61
	Orp0y4NS9Fo473MFyEmHeX4PPC0JvACylb8XPiZByXlqGA4rzMgvmBr8guy3NQXYUzdQVSCrs09
	PY=
X-Google-Smtp-Source: AGHT+IGOWytMuuVl22+958E0JD29pFC8dqjbSrmT0TG1eNwORc1Xjn9lKqBEYJwIrl+ZQs7jm2XVIA==
X-Received: by 2002:a05:6000:2909:b0:42f:9f4d:a4b2 with SMTP id ffacd0b85a97d-42fb44ba720mr14081823f8f.19.1765875666553;
        Tue, 16 Dec 2025 01:01:06 -0800 (PST)
Message-ID: <05012660-b93f-4439-a383-ff6e8e8d9566@suse.com>
Date: Tue, 16 Dec 2025 10:01:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/2] x86/AMD: disable RDSEED on problematic Zen5
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b15a3fb-6ce4-4bf7-a235-073742fff35d@suse.com>
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
In-Reply-To: <0b15a3fb-6ce4-4bf7-a235-073742fff35d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This particular variant has an error that causes 16- and 32-bit forms of
RDSEED to frequently return 0 while still signaling success (CF=1). Refer
to AMD-SB-7055 / CVE-2025-62626.

Relevant data taken from Linux commits 607b9fb2ce24 ("x86/CPU/AMD: Add
RDSEED fix for Zen5") and e1a97a627cd0 ("x86/CPU/AMD: Add additional fixed
RDSEED microcode revisions").

Like for the other RDSEED issue, the same command line override can be
used to keep RDSEED enabled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
See "x86/AMD: disable RDSEED on Fam17 model 47 stepping 0" for pending
opens.

The choice of using AVX-IFMA to tell Zen6 from Zen5 is somewhat arbitrary;
a few other features could equally(?) well be used.

I will admit that I was on the edge of switching to a table-based
approach. (I'm also not happy with the case 0x44 layout, but keeping the
"break" on the earlier line triggers [imo bogusly] gcc's "misleading
indentation" warning. We could of course move yet farther away from the
Linux originals and use switch(curr_rev >> 8), like we do in
zenbleed_use_chickenbit() and amd_check_entrysign().)
---
v3: Incorporate another Linux commit. Cover Zen6, assuming it is
    universally unaffected.
v2: New.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -863,6 +863,28 @@ static void cf_check fam17_disable_c6(vo
 	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
 }
 
+static noinline bool __init zen5_rdseed_good(const struct cpuinfo_x86 *c)
+{
+    unsigned int curr_rev = this_cpu(cpu_sig).rev, fixed_rev = ~0;
+
+    switch ( c->model )
+    {
+    case 0x02: if ( c->stepping == 1 ) fixed_rev = 0x0b00215a; break;
+    case 0x08: if ( c->stepping == 1 ) fixed_rev = 0x0b008121; break;
+    case 0x11: if ( c->stepping == 0 ) fixed_rev = 0x0b101054; break;
+    case 0x24: if ( c->stepping == 0 ) fixed_rev = 0x0b204037; break;
+    case 0x44: if ( c->stepping == 0 ) fixed_rev = 0x0b404035;
+               if ( c->stepping == 1 ) fixed_rev = 0x0b404108;
+               break;
+    case 0x60: if ( c->stepping == 0 ) fixed_rev = 0x0b600037; break;
+    case 0x68: if ( c->stepping == 0 ) fixed_rev = 0x0b608038; break;
+    case 0x70: if ( c->stepping == 0 ) fixed_rev = 0x0b700037; break;
+    default:   if ( cpu_has_avx_ifma ) fixed_rev = 0 /* Zen6 */; break;
+    }
+
+    return curr_rev >= fixed_rev;
+}
+
 static bool zenbleed_use_chickenbit(void)
 {
     unsigned int curr_rev;
@@ -1130,6 +1152,28 @@ static void cf_check init_amd(struct cpu
 		    !cpu_has(c, X86_FEATURE_BTC_NO))
 			setup_force_cpu_cap(X86_FEATURE_BTC_NO);
 		break;
+
+	case 0x1a:
+		/*
+		 * Zen5 have an error that causes the 16- and 32-bit forms of
+		 * RDSEED to frequently return 0 while signaling success (CF=1).
+		 * Sadly at the time of writing the fixed microcode revision is
+		 * known for only two of the models.
+		 */
+		if (c == &boot_cpu_data &&
+		    cpu_has(c, X86_FEATURE_RDSEED) &&
+		    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
+			static const char __initconst text[] =
+				"RDSEED32 is unreliable on this hardware; disabling its exposure\n";
+
+			if (zen5_rdseed_good(c))
+				break;
+
+			setup_clear_cpu_cap(X86_FEATURE_RDSEED);
+			cpuidmask_defaults._7ab0 &= ~cpufeat_mask(X86_FEATURE_RDSEED);
+			warning_add(text);
+		}
+		break;
 	}
 
 	display_cacheinfo(c);


