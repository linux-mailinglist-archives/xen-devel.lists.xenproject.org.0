Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75CAA712FF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 09:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927294.1330048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMNy-0004hX-8C; Wed, 26 Mar 2025 08:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927294.1330048; Wed, 26 Mar 2025 08:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMNy-0004fQ-4z; Wed, 26 Mar 2025 08:45:18 +0000
Received: by outflank-mailman (input) for mailman id 927294;
 Wed, 26 Mar 2025 08:45:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txMNw-0004fK-Ko
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 08:45:16 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0dd904b-0a1e-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 09:45:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso60079075e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 01:45:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43e50sm223821745e9.12.2025.03.26.01.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:45:10 -0700 (PDT)
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
X-Inumbo-ID: a0dd904b-0a1e-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742978711; x=1743583511; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThFG/mAw83Ey+P00bpzBVT1gQWokGrngj1fNehpPLsk=;
        b=TPs/O/JSkjI8XXTJPOOvxXPp4KhJrpgVBsKL3tO5PFprRGDw9UKNGfzE4y5aIYKGvF
         9FN59gKM5BIleDdFnSd1JKVVcF4a5aCyrRlmPGlSm0oNyaisiOu+8MoVJRSLVg+tBxzm
         OGDG4nnWBJVuKD4MiSbVnPrbqgrWaqrIWJymRHiKhKiMdTf6Pngx/xDVkExMbr/O2llN
         hJB2y6vvWZrCzBhfMXHPBTooI9rKsOsP/xAnZLCilTHb6MT7jYDLn6dZ3JeWdX9CmaCu
         Xtrd28tNtH/RPay8X0eQxUql/EGfnPiI2Xjj1IHAyzSmUK8aK0DWQ2/8EoxvYdLkX5kO
         bXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742978711; x=1743583511;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThFG/mAw83Ey+P00bpzBVT1gQWokGrngj1fNehpPLsk=;
        b=vektz8/CeEBdjRX/M4Ji8KqSPd5B6Xhm4I1xofiX06/BG+iD2anmy0ZUdiKIsL7qYJ
         qePmCAF0NfyNXcbQr3y9Qj+PmXayxAmM7Zli4LlccvQq8h6AStWKGz54NjDNvdSJtgdR
         hJYAifnoOMyblA/2ZwsJy7HYZsxAYlctqFnu0XlOYJeREdGfSIE7ZYQ359jEtJ2mUN/h
         pDemTFkXSQapWH/pMe4Bt3YJ+r9Sb8f/Vgs8Q7mtEjAKdBoykCGadqMYkqw/6EWTMLg1
         xImItnasTLPqzpFYwJbyxpT7TJEI1z9Xir81n/+EWWW5jSLr/8CHwVhNUy3snzkFo7t0
         TOjQ==
X-Gm-Message-State: AOJu0YwpbBseYWNUl5n2I7LmWp0eMa6i5jzj8qLSkhOmVaFCAWd5b/JJ
	M3M9S4jb5lcT51tUZ7qTwsTnd7spFFmugzTchJGWba+3yBcWRCdaPPxwNafgkKaV4Nr0m+Mms1A
	=
X-Gm-Gg: ASbGncvb9ZZ4cSHZsTo3BmSqPtac820sUc1LST8QOp9xpmDGfWKkdv7mrBRx7xxIc9E
	+WIuWyadjXz8PlcvbGJu8erisxXbEmEpEpXOqxY+pPqlLkqM7QbjtkouHk9Yd+W7t3pL5wjUQNL
	gxZo8AbMW+dB1p3O1vFLYvY+2alPj/8B/gYpJLfTAPl8NFf2KB7yZVowFORxkNBoYQg1xAXWgB9
	XgVy9uSsgOEgYwv2m05uuOY4zAU/Ez8El/X1t9FQwFVH96y83CMjTlxRBmb2O2b9mkI/W1M3jvF
	3cHjrRneAmUioMVGruYaUWYPmxAms94EIFej70FdICTlrGBVMKUHgCnzvZDiX92UCiQfjRoQye7
	sJSXrNiljR7ha6pioQ/+Xa5pamCZ4UmG0t9OeifAE
X-Google-Smtp-Source: AGHT+IGXclyPgZTc+a160hhj0+0xj9CmWHnuHXKynkMFctv3tPO5i+nxpFiJJ07Cqe7/sikOVoPEUQ==
X-Received: by 2002:a05:600c:3d8c:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-43d50a58731mr195883865e9.31.1742978710707;
        Wed, 26 Mar 2025 01:45:10 -0700 (PDT)
Message-ID: <c9365d42-c15d-4d93-acd8-106ca46cb7f3@suse.com>
Date: Wed, 26 Mar 2025 09:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: expose OEMx ACPI tables to Dom0
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

What they contain we don't know, but we can't sensibly hide them. On my
Skylake system OEM1 (with a description of "INTEL  CPU EIST") is what
contains all the _PCT, _PPC, and _PSS methods, i.e. about everything
needed for cpufreq. (_PSD interestingly are in an SSDT there.)

Further OEM2 there has a description of "INTEL  CPU  HWP", while OEM4
has "INTEL  CPU  CST". Pretty clearly all three need exposing for
cpufreq and cpuidle to work.

Fixes: 8b1a5268daf0 ("pvh/dom0: whitelist PVH Dom0 ACPI tables")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly the commit above says nothing at all about the criteria used by
which tables would want to be whitelisted. Further tables on said system
which weren't blacklisted prior to that commit, yet which also aren't
whitelisted are DBGP, DBG2, FIDT, LPIT, MIGT, MSCT, NITR, PCCT, RASF,
SVOS, UEFI, WDDT, and WSMT. Even without diving into the details of any
of them it seems pretty clear to me that at least some would want
whitelisting, too.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1010,12 +1010,20 @@ static bool __init pvh_acpi_table_allowe
             return true;
         else
         {
+    skip:
             printk("Skipping table %.4s in non-ACPI non-reserved region\n",
                    sig);
             return false;
         }
     }
 
+    if ( !strncmp(sig, "OEM", 3) )
+    {
+        if ( acpi_memory_banned(address, size) )
+            goto skip;
+        return true;
+    }
+
     return false;
 }
 

