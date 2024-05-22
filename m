Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB58CBF23
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 12:18:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727457.1131924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9j2M-00063R-Aq; Wed, 22 May 2024 10:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727457.1131924; Wed, 22 May 2024 10:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9j2M-00061Z-7r; Wed, 22 May 2024 10:17:34 +0000
Received: by outflank-mailman (input) for mailman id 727457;
 Wed, 22 May 2024 10:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9j2K-00061T-Rp
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 10:17:32 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8002fb06-1824-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 12:17:31 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so10667124a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 03:17:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b017a5sm1758048466b.180.2024.05.22.03.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 03:17:31 -0700 (PDT)
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
X-Inumbo-ID: 8002fb06-1824-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716373051; x=1716977851; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsEGTnCgHx262Iq6DzYer+wCgYB5sQXE9o6NLnCsuBo=;
        b=RDlfUaW8o6s9axQS1/E7R4ThBvm4CyvFuZrjpYyejdlLH0qf2UEeVqjGBj7+MSf6TV
         oxxSAGKtvIMHrWsO/oS9x1DJyt1wVHT1UP9rVbXWT/ShnhlhAlh4zwXg/7MHgCjlRaZN
         diPzNACPus2yFflav3XRBjQgJEAaV7yoMseuKQCrIekd6TQqyUDwJ9o9blQpFdzoOntv
         MW2CWp8Nj2rehQBa8MAl5W8y2hCUKlQ8RKZlB+KG8rSh3wGvTlvyqnHDF7F4HQxL/Jb7
         aVz6BAB4NR4+NhB6JZ8N1u1t2j4nyyXeniqqMDSEW3KIszZEQi7c7EtN2HOsRv2WQZ7u
         VTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716373051; x=1716977851;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsEGTnCgHx262Iq6DzYer+wCgYB5sQXE9o6NLnCsuBo=;
        b=Z4wl0QtjtXi+bDc51NHc0MsqS+sQU1pLL+DSSz2ZR+ZXBvuznYSBxOnrOVNvadbkXw
         bhDuLV29FmVzPyyu0GtQlae27yvHlU0/YFJtdHlafTB4knePV9tKrfIKFDFY+TYETyan
         6bvGIFWRLFEyeQB57zvXfyrlaPQTCfmpDdec51irVVq7MOg4Np9Y10KUL/0+ADqmo8/2
         iP9uRh5VZED3kE5PMyRnJ9nHE7wuW2iMv5FopzjMz2x3e6pF6DUMByLgJB+UwLUQRYuj
         s0qdr08fmiHBwbE99yMFv/ZKuySGKTDuQL+f59qlLKewTL3WbBRqJoZoRhnTAZmCLz5M
         W9UA==
X-Gm-Message-State: AOJu0Yy2jf0cLLFcIPnL2MuuPUlSaxFOw/yAkYQzopvSVuZsVgai2ET5
	HXQaOUVQvcQb5IlH20/+6td+TUEOHY8CHbqIL56KaWTg+sv6nk6P3yShP4Zn1d53U6GsafYDvXk
	=
X-Google-Smtp-Source: AGHT+IEerRNk/qnKg7CM/QXot6V5imyKJxpO6/hp2cu+eLXdmcVWzjdtokqAlPIXo++nXmDoIUabzA==
X-Received: by 2002:a17:906:16c9:b0:a59:b136:e40f with SMTP id a640c23a62f3a-a62280b6fb3mr97414266b.38.1716373051238;
        Wed, 22 May 2024 03:17:31 -0700 (PDT)
Message-ID: <5133a01d-346d-4779-b319-a156ef944669@suse.com>
Date: Wed, 22 May 2024 12:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@cloud.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: don't leave trace record field uninitialized
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

The emulation_count field is set only conditionally right now. Convert
all field setting to an initializer, thus guaranteeing that field to be
set to 0 (default initialized) when GUEST_PAGING_LEVELS != 3.

While there also drop the "event" local variable, thus eliminating an
instance of the being phased out u32 type.

Coverity ID: 1598430
Fixes: 9a86ac1aa3d2 ("xentrace 5/7: Additional tracing for the shadow code")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2093,20 +2093,18 @@ static inline void trace_shadow_emulate(
             guest_l1e_t gl1e, write_val;
             guest_va_t va;
             uint32_t flags:29, emulation_count:3;
-        } d;
-        u32 event;
-
-        event = TRC_SHADOW_EMULATE | ((GUEST_PAGING_LEVELS-2)<<8);
-
-        d.gl1e = gl1e;
-        d.write_val.l1 = this_cpu(trace_emulate_write_val);
-        d.va = va;
+        } d = {
+            .gl1e = gl1e,
+            .write_val.l1 = this_cpu(trace_emulate_write_val),
+            .va = va,
 #if GUEST_PAGING_LEVELS == 3
-        d.emulation_count = this_cpu(trace_extra_emulation_count);
+            .emulation_count = this_cpu(trace_extra_emulation_count),
 #endif
-        d.flags = this_cpu(trace_shadow_path_flags);
+            .flags = this_cpu(trace_shadow_path_flags),
+        };
 
-        trace(event, sizeof(d), &d);
+        trace(TRC_SHADOW_EMULATE | ((GUEST_PAGING_LEVELS - 2) << 8),
+              sizeof(d), &d);
     }
 }
 #endif /* CONFIG_HVM */

