Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B95CCB831
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 11:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189435.1510178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBiu-00086f-5I; Thu, 18 Dec 2025 10:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189435.1510178; Thu, 18 Dec 2025 10:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWBiu-00084W-2g; Thu, 18 Dec 2025 10:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1189435;
 Thu, 18 Dec 2025 10:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWBis-00082Q-UR
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 10:59:06 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91940e2b-dc00-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 11:59:05 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso1940935e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 02:59:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432449986f1sm4350918f8f.29.2025.12.18.02.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 02:59:04 -0800 (PST)
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
X-Inumbo-ID: 91940e2b-dc00-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766055544; x=1766660344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+MS8oG8pUBLpaQoG+yzL4UbkTWEGCYSjvyGDww1VIsA=;
        b=H7fZCybPn648sBOBnWORSjzeOJ8xTmI8pXLPixCiNBoQwl0t87dfTObBp3+K2j+WAA
         8XDljxH3Y5iRmOHmNBFmcCHagYuf12//SnZzCRt8fvE5mb5C2LiWTacn5QWOWEn+VbBF
         PzPLsskSANRGUTdQqiKG89S15BdaIPmOc2XWIHVIu9Qvl/bzGB4lDxugci1QRMdXw0YM
         N8svTe6sPdpiSBjcmebEe+U1qxYEKRnI/Jb3/cdvD4y+BR5ztqjEuLmc1WnhgpZEpqzl
         5/DgMtRkbcbxRuKrNswZ/3X1Mz6ztGxrNaJqX7Xs911jzKcz1exNoEduhYSLo7feMUfv
         dqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766055544; x=1766660344;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MS8oG8pUBLpaQoG+yzL4UbkTWEGCYSjvyGDww1VIsA=;
        b=tijNxmTRgwQ5guSiNr2pQ7DQT/0T5T6dXV7uR7QgtoFcY/P0uFypnQpAJauCUxTqNl
         GPda+HHRfXpKlr8cPtHo4WVPhKESm81j7Bp8HWeIjmK9xNyGfas+OmgffBEreN1pqRVU
         MpBm/QqnNQ1nVtl4KXfepszia7wTNu7yjnRrOoDSjHbXpy+2YV/fiRwTeEio2ZiBKEP0
         n14wylVCQKWwFjMFAPdKrZG5ZoSMc8UXwlOubiOB4ksp0XfKXIh71lFGFzWOpB+Nvvej
         GXwyivxJS+8MlTfcs+VA5N6+M5KoL+gO45hghFkzNO/+5K7nTdrgrrbtHaTrJjDRxJZ7
         Ea6A==
X-Gm-Message-State: AOJu0Yxyu0/pKk+kHdz40/FiH5jrVhuF3zqbnERgTnZju2GUC/PrTH2l
	/z2m4V7gtL1CfJx3QiAbVZPJx+6baQ0+ktAIXESSuqav+iLfRPPfgRDblAKqPxNBPsKaFs6ZT0m
	+lEc=
X-Gm-Gg: AY/fxX6EIMXgqXlmz5p0CGfWgq3gbVHZdJHr2QEcrmfat5jlvAAv4E5/RzJMeXkk+kO
	3tNCGWsYAYvK/aQ0VFWfQSfMV09DhG+WgjL7s11K5HSIO51lrTfCxMvKJtkijfVCE3vaRdV97ad
	HLI4g3WRpAoTsY18WDsDvNA2hXWq5dRPiwQfxCMywWV92psw3Zi0ftJ3+MlZs19ZE/RmXQqEvaN
	Jlh+LMr8RzRHhR683+Tbmp0ROzxxwMBSB/IzFbyC9ZXOLoiHipsI7ABlRqXsJ8B+McJCgT44WSI
	XZm06iIql0tV7fujUJpgve5wrgE1oXK65F61SMukWbgQ1bnMOLT3aXWLQ3+8+Fj2cTbT3qZUHSx
	OaSQbtQusBd3yIia6MUNCcDN10BopgfDaKzBJe5idI2W4hZP7oqETRt5J3CJOMG6CVHg0fxbChj
	JJh7tU83kiYVxWQ5xZBDPH4uPbYPvkC9aZXop9YdQFxOMfJW+YCJQmZApaxNX0kCS6+yyUBfr0r
	jU=
X-Google-Smtp-Source: AGHT+IG1h6YzQpn4T2sYw3fL09qnnlD5LpknoNKEUFYFPlCwJ8RqugGeTysENlgInzV8mrgLwQl3jA==
X-Received: by 2002:a05:600c:3f08:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-47bdd99c3c4mr50599395e9.6.1766055544459;
        Thu, 18 Dec 2025 02:59:04 -0800 (PST)
Message-ID: <7582d5d2-bb9b-45ee-8d79-b10cf00eeeef@suse.com>
Date: Thu, 18 Dec 2025 11:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86emul/test: use vpath uniformly for access to code
 living elsewhere
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <4c2a53b1-7133-4900-8bc8-26fc97aa1702@suse.com>
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
In-Reply-To: <4c2a53b1-7133-4900-8bc8-26fc97aa1702@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Replace the remaining non-local symlink-ing (i.e. of core emulator files)
as well, to avoid mixing approaches. (The symlink-ing of test blob sources
needs to remain for the time being.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Unlike in the subsequent fuzzer harness patch explicit dependencies can't
go away here, yet. $(DEPS_INCLUDE) would need making use of first.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -11,6 +11,11 @@ all:
 run: $(TARGET)
 	./$(TARGET)
 
+# Add the core emulator to the build
+vpath x86_emulate/%.c $(XEN_ROOT)/xen/arch/x86
+vpath x86_emulate/%.h $(XEN_ROOT)/xen/arch/x86
+HOSTCFLAGS += -iquote $(XEN_ROOT)/xen/arch/x86
+
 # Add libx86 to the build
 vpath %.c $(XEN_ROOT)/xen/lib/x86
 
@@ -287,12 +292,8 @@ else
 run32 clean32: %32: %
 endif
 
-.PHONY: x86_emulate
 x86_emulate:
 	mkdir -p $@
-	ln -sf $(XEN_ROOT)/xen/arch/x86/$@/*.[ch] $@/
-
-x86_emulate/%: x86_emulate ;
 
 HOSTCFLAGS-x86_64 := -fno-PIE
 $(call cc-option-add,HOSTCFLAGS-x86_64,HOSTCC,-no-pie)
@@ -307,6 +308,8 @@ x86_emulate.h := x86-emulate.h x86_emula
 $(OBJS): %.o: %.c $(x86_emulate.h)
 	$(HOSTCC) $(HOSTCFLAGS) -c -g -o $@ $<
 
+$(filter x86_emulate/%.o,$(OBJS)): x86_emulate
+
 x86-emulate.o: x86_emulate/x86_emulate.c
 x86-emulate.o x86_emulate/%.o: HOSTCFLAGS += -D__XEN_TOOLS__
 


