Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB65D3AF05
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 16:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208210.1520432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhrDH-0001YW-V3; Mon, 19 Jan 2026 15:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208210.1520432; Mon, 19 Jan 2026 15:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhrDH-0001X5-SI; Mon, 19 Jan 2026 15:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1208210;
 Mon, 19 Jan 2026 15:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhrDG-0001Wz-Ic
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 15:30:42 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d023418d-f54b-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 16:30:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47ee3da7447so27758325e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 07:30:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8d90b3sm203362415e9.15.2026.01.19.07.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 07:30:40 -0800 (PST)
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
X-Inumbo-ID: d023418d-f54b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768836641; x=1769441441; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FG0MWqsc1Mq5LhFOHZaTMZeQ28n5VfcT6LtJkTUwtQ=;
        b=gitpqHDHjnd4YXwsOeDDEoCZPz3IslmYydQ27sk9JJ+A4iWy8lGAfdL2BYTYVQO1x0
         mFU4KGqtHCJ/aVTNEE9msdfsZ1Av0pffn+FCRVwotejCtr+WZQh0dPtudfDueAWDJkNW
         rBhyaxGsBQCQJbUgGUQeF8fRpN1GBe3bwylfglAAO78peJtNQ94bAfjf/pYtpR6wlt3t
         puJ4elqNPsqB3J+EI0hhx8c0CpPuVDycckm0WCvIrN7ysspIh+COhi/cPgvs5mV66kVE
         AX0S6iYRqG3wnrPG7xp2Q2HBXuWtZDd37BFMCId0ZFGUUIqldM07OhftjktZSlIJnHSi
         Higg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836641; x=1769441441;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FG0MWqsc1Mq5LhFOHZaTMZeQ28n5VfcT6LtJkTUwtQ=;
        b=HyJuu+6FDiZQ0g+RTX5aaitVnYbu0pZ5VOs6jcvlwp1Jrigiqsij4rfbFupHdE8Xxp
         QUerpr19TtncUZR7N5HJvT69/OLFe0XS9+vwEg0aeoiQvUFkXKD3Es83MhokS7tdBy+w
         gCAWaLrCKUqS+jXQrNiQevFzi8qAbxRvJ80Xn6LW62yqm6iLeBEHW52D5Gtq5YmGszbV
         BiWvKHqt8Z1QiSP/yeev2r4fKKB0lG1ZoypEgDlLyKIN9ncIVyQuYi22R+DeOtYymmQ7
         R/YeP7dgbHiNqQOjYbYH3I3OCnRbjsT/Y686X4hyxJWj+Q9KMP00WSZEaulcIkZO7nJr
         YPvg==
X-Gm-Message-State: AOJu0YzyuqWTaOMPtPFpPLW50KkcP3v2PbImoFenU+oFDj4IMq4Qnn90
	13q7G0HO03fyZSh+6mDHshtRk6fDFDq8Hhp5K2ciTAVIwYbCfsL/zDcxQROpb57JC7fGihETDvv
	s2x8=
X-Gm-Gg: AY/fxX66X9C4fxISyuDygPbJrfy5Lm0mU7+NKj/p21cEUloAlfIjDOxbxzqWg7574RW
	HOyq0I9JF3+0NBpQuYEhPgVnFL6VtrD+s2/tn/fFnCZiZTTMpu5qaFVZMduJJtvnUeY0J5qgxGc
	UnuvSsYuNxrVhCj4qJbyXiPHvarQ0Ug3VZ/7Y52fn9AJBUCwXMC9Cz4biYKnwfZ/iFyUfcF+7mW
	1H4YF77DcvWLprW83lfgJdJZz7WCuIaKjK7U3OPBUuNfagV+mxHf7++QJLsBQHCGNO0vrLGggE9
	MEGttJIYSrDQH9XsedccqG5ECqivbP2VDETR0uWCMDlc5yyZMB8FyITHQ2bPM9wEoZspcoOvaGi
	/CbHpgr4IGILgtjSGTETT8TIUX0Y8VKL8+zEzyRFp780NZQu4IDH9C8wyZS9j8kY1IuePWm9JMH
	IM3rx0WHoXsS93AYhEn54+e+1Ku6+jmOzrnVLJBwNpvYdEQEJYh3U7qjgqUBTESjPbWYhB++/L4
	qQ=
X-Received: by 2002:a05:600c:35c6:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-4801e2fdf57mr160486475e9.10.1768836640616;
        Mon, 19 Jan 2026 07:30:40 -0800 (PST)
Message-ID: <70fe3986-ad89-4b42-b158-7e7b2b24ec1e@suse.com>
Date: Mon, 19 Jan 2026 16:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: calculate number of synthetic feature and bug
 enumerators
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

Rather than spelling out their amounts (requiring updates when multiples
of 32 are crossed), introduce a sentinel each and calculate the two
numbers from those.

No difference in generated code, albeit debug info size grows quite a bit.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an alternative to "x86: guard synthetic feature and bug
enumerators", bulding upon the expectation that when adding to the end of
either list people will notice the sentinel and not forget to update it.

--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -7,7 +7,6 @@
 #define FSCAPINTS FEATURESET_NR_ENTRIES
 
 /* Synthetic words follow the featureset words. */
-#define X86_NR_SYNTH 2
 #define X86_SYNTH(x) (FSCAPINTS * 32 + (x))
 
 /* Synthetic features */
@@ -44,9 +43,11 @@ XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SY
 XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead of VMMCALL */
 XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
 XEN_CPUFEATURE(XEN_REP_MOVSB,     X86_SYNTH(32)) /* REP MOVSB used for memcpy() */
+XEN_CPUFEATURE(nr,                X86_SYNTH(33)) /* Number of synthetic features */
+
+#define X86_NR_SYNTH DIV_ROUND_UP(X86_FEATURE_nr - FSCAPINTS * 32, 32)
 
 /* Bug words follow the synthetic words. */
-#define X86_NR_BUG 1
 #define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x))
 
 #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} doesn't save/restore FOP/FIP/FDP. */
@@ -64,5 +65,10 @@ XEN_CPUFEATURE(XEN_REP_MOVSB,     X86_SY
 #define X86_SPEC_BHB_LOOPS        X86_BUG(20) /* Use clear_bhb_loops for BHI mitigation.*/
 #define X86_SPEC_BHB_LOOPS_LONG   X86_BUG(21) /* Upgrade clear_bhb_loops to the "long" sequence. */
 
+#define X86_BUG_nr                X86_BUG(22) /* Number of bug identifiers */
+
+#define X86_NR_BUG DIV_ROUND_UP(X86_BUG_nr - (FSCAPINTS + X86_NR_SYNTH) * 32, \
+                                32)
+
 /* Total number of capability words, inc synth and bug words. */
 #define NCAPINTS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */

