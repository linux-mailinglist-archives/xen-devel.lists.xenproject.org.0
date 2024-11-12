Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14359C5B20
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 16:00:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834699.1250469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsN2-0005RR-L3; Tue, 12 Nov 2024 14:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834699.1250469; Tue, 12 Nov 2024 14:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsN2-0005PB-Hg; Tue, 12 Nov 2024 14:59:56 +0000
Received: by outflank-mailman (input) for mailman id 834699;
 Tue, 12 Nov 2024 14:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAsN1-0005Nh-7W
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 14:59:55 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c56060c3-a106-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 15:59:52 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so55034315e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 06:59:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0562ccdsm209284065e9.23.2024.11.12.06.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 06:59:51 -0800 (PST)
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
X-Inumbo-ID: c56060c3-a106-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM1NjA2MGMzLWExMDYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDIzNTkyLjc1NTgyNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731423592; x=1732028392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TU8Ns9FIXoCBKIxNf+AQYBkQRkjWvvKPbMIsXHaW3nQ=;
        b=RHMTeInJeFww+COdbN4sIQatkwOf5TK1AjkQist2f1Opo7HdDu27ib7gsNOogGzNwu
         FRYHunSG/HUNC/ovOlyQX+sb86q5iMW2Raoa3CH6SHBYesXpdZ3wFhC277JpX6XxDUT5
         UPjniOX4hlEkebJRclH85hcPRlnsKTZXvFShEUaDpEiv5MFgv/6XgPN3eScvgHZ/hPR+
         6SuDiA0Hp46mJ8k4ibN6ddGA23lHCqNvcr4w4TEn9zzR01JmrZWzFKpAhRW4qCi5/8Pe
         B6Hz/NVcI9pMnUmCjN1O5QP2Lz7Cck9CDYEKqk8pXBhmHKM7Nky8duKOxF/0QfMuov0y
         8aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731423592; x=1732028392;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TU8Ns9FIXoCBKIxNf+AQYBkQRkjWvvKPbMIsXHaW3nQ=;
        b=GkPWv8TLciKDqYMLaOu95aufvelmVTWRCBPyB/gizlCK4ATQHWYosT1fZ+Gq/jQ45b
         Rul4NSnrDDcVZBSUF9/Dc6CD5/ARdNSwHRDhieWVzfEbJyBqGUzeIYmlZz4QYR34NEJs
         GYionE+yNoQ0CYRdbrvQKyZQa5VccmSVqh2xtZrFc+fTz6z4Uujh3rAEvybwfaI3Oh3d
         dKiXW+smG1bXFXiB7XfkSWz0ir8n+E5PoO4+hJ6XHE9Lg6zSZbd40sYTk9gqerIGe+xP
         kbGccp+zUs5nLF9ndobh3BeWNNgiSbVfAYXBN2AlFNaT/ENXlqRVXGEUtG0rLTWuEkHh
         /Sgw==
X-Gm-Message-State: AOJu0Yw6JiqFZJIzwRZ3ObjyOIFqkQdmY2zPQx0lFqQlvd0DbCvL/EhY
	C3HLShZBlD3E2yH7SQk13Ln9/dyghZSE+vrVpoygy11yqJoTO4/ffgMlTwHTrzsc/qbFk4X9z3A
	=
X-Google-Smtp-Source: AGHT+IGPRdaxe7Q9uLR9F0FYCVIfsEcUEh9OBbxEqWXCREADQFk8YDkkhh+tm8UtO7r/KKQW1a8xEg==
X-Received: by 2002:a05:600c:5488:b0:431:9397:9ac9 with SMTP id 5b1f17b1804b1-432b7507c16mr127253125e9.15.1731423592021;
        Tue, 12 Nov 2024 06:59:52 -0800 (PST)
Message-ID: <04602af0-9a03-4d43-beb3-28b76e2cad33@suse.com>
Date: Tue, 12 Nov 2024 15:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86emul: correct EFLAGS testing for BMI1/BMI2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
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
In-Reply-To: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Apparently I blindly copied the constants from the BEXTR case, where SF
indeed wants leaving out. For BLSI, BLSMSK, BLSR, and BZHI SF is
defined, and hence wants checking. This is noticable in particular for
BLSR, where with the input we use SF will be set in the result (and
hence is being switched to be clear on input).

Convert to using named constants we have available, while omitting DF,
TF, as well as the MBZ bits 3 and 5 from the masking values in the
checks of the produced output. For BZHI also set SF on input, expecting
it to transition to clear.

Fixes: 771daacd197a ("x86emul: support BMI1 insns")
Fixes: 8e20924de13d ("x86emul: support BMI2 insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1969,10 +1969,13 @@ int main(int argc, char **argv)
 
         *res        = 0xfedcba98;
         regs.edx    = (unsigned long)res;
-        regs.eflags = 0xac2;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
+                      X86_EFLAGS_ZF;
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ecx != 8 || *res != 0xfedcba98 ||
-             (regs.eflags & 0xf6b) != 0x203 || !check_eip(blsi) )
+             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+              (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF) ||
+             !check_eip(blsi) )
             goto fail;
         printf("okay\n");
     }
@@ -1988,10 +1991,13 @@ int main(int argc, char **argv)
                        :: "d" (NULL) );
         set_insn(blsmsk);
 
-        regs.eflags = 0xac3;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
+                      X86_EFLAGS_ZF | X86_EFLAGS_CF;
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ecx != 0xf || *res != 0xfedcba98 ||
-             (regs.eflags & 0xf6b) != 0x202 || !check_eip(blsmsk) )
+             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+              EFLAGS_ALWAYS_SET ||
+             !check_eip(blsmsk) )
             goto fail;
         printf("okay\n");
     }
@@ -2007,10 +2013,13 @@ int main(int argc, char **argv)
                        :: "d" (NULL) );
         set_insn(blsr);
 
-        regs.eflags = 0xac3;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_ZF | \
+                      X86_EFLAGS_CF;
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ecx != 0xfedcba90 ||
-             (regs.eflags & 0xf6b) != 0x202 || !check_eip(blsr) )
+             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+              (EFLAGS_ALWAYS_SET | X86_EFLAGS_SF) ||
+             !check_eip(blsr) )
             goto fail;
         printf("okay\n");
     }
@@ -2028,11 +2037,14 @@ int main(int argc, char **argv)
 
         regs.ecx    = (unsigned long)res;
         regs.edx    = 0xff13;
-        regs.eflags = 0xa43;
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
+                      X86_EFLAGS_ZF | X86_EFLAGS_CF;
         rc = x86_emulate(&ctxt, &emulops);
         if ( (rc != X86EMUL_OKAY) || regs.ebx != (*res & 0x7ffff) ||
              regs.edx != 0xff13 || *res != 0xfedcba98 ||
-             (regs.eflags & 0xf6b) != 0x202 || !check_eip(bzhi) )
+             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+              EFLAGS_ALWAYS_SET ||
+             !check_eip(bzhi) )
             goto fail;
         printf("okay\n");
     }


