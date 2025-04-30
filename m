Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6739CAA4D04
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 15:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973590.1361678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA7FQ-0003i9-0X; Wed, 30 Apr 2025 13:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973590.1361678; Wed, 30 Apr 2025 13:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA7FP-0003f1-UB; Wed, 30 Apr 2025 13:13:11 +0000
Received: by outflank-mailman (input) for mailman id 973590;
 Wed, 30 Apr 2025 13:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA7FO-0003ev-FN
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 13:13:10 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbfe87dd-25c4-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 15:13:08 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so11513427a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 06:13:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed726f6sm915060766b.158.2025.04.30.06.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 06:13:07 -0700 (PDT)
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
X-Inumbo-ID: dbfe87dd-25c4-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746018788; x=1746623588; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g7ffsEKzhLGOZhH2SP5FQKlKiAyfqXDg3g/n2QUBAs=;
        b=WSwloKzo2FfrndPhxBeflvAoIWWNHZbBytiv86UNg9snMpkhs4gb3hS8YM1GpMjTV3
         bIWpJakZBAakn6CE2v5iWc+VfEVaZTXBtXAZx+xoWhTyspIQSL8mNxcplgclTToihoj9
         YxQsmmSTftFjFYW6v7pbOsmc2sz6fuX5GG+gL5WFNlRKPzj2Ui6nxWC2Cv55lUGq9Occ
         ygYY6cfxyTrQk0skODg7lvq2TZZMUtUbgIpFyKgJ+sIpI9YLGganQ+idTIMjlbQk5ihA
         DiCl2lNGJ/DOQcep0zMSyhZwqJ5U6mjFqGs/yHvMWl1ZMxsX2tqZXylJu+4EecvCh6AM
         5Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018788; x=1746623588;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0g7ffsEKzhLGOZhH2SP5FQKlKiAyfqXDg3g/n2QUBAs=;
        b=MhtYsU2OmU9aLbb8xnVCrZjqj4WlYF97fygKA9L95JdrM0aJiAnOQrNhD0arEnfAYN
         ChrbxWtTmG0QrcYntctEmERomB+wIA24E7VAwSdZVeAwDYLlGRQm6em6bs9gdG/msFcU
         LiqhqCbnNoFTQ0xO2yVV5I/bWKQgbRKfIPX8LnZeJeseMJzNeKpbAROnS+rvVwUKf0Cg
         GnhQ3mmjRKZ/o+DR2FdtLojcx8gzQ8Wbmfg6mLk+x2zU2kUmhPDQ7jjbKm6ytgnDtNNh
         zSbaDDCLMH0s/tH7bvFm/F1u2OaIg+YAO06/K0h4Tz5Kbf1eyneLbz/aLvk4BqozBbK/
         Aiug==
X-Gm-Message-State: AOJu0YyNtdhOo8csHI5f2an9NqhdQi8cjGdwbE2UaF0xwamECxRnwSxX
	sRzIH5aE43oda/S8FM9koas2etJ5DgaO/IuX70o47dtZSSIOn3tp28fOInYtPmxmPNDDzWEynhY
	=
X-Gm-Gg: ASbGncvGDcKyb9kVLDI2Bcmj8fiUk41vfldlt0W0zdL3cxZjPtl7GKAkEqhrpFli0tN
	7EwM7fgHYBZtMvwaY+VUEhPQ2Z4IfiId0g78SfJ/+Ui9rM7ake9Bcu1lr9FTNVtIBd8REBpcSvv
	hFipgIbalC7tM2FNt02qLtsxsmFHmgBGpUc/ltzxgP/Y9nfPIPdzJ44qOoFP94OnBAeZCaK/FZ3
	PdlPGBLvgibqEqJwrmWIF8yLWPZlUQ+VKy03AjoyDC4j1SWMadplf4OH6ow/tGxnaFi6iFB2eyZ
	hDAUvuY6Fm/s6gX1H5L5zOTffQ9XoUH/z/aGmI75wtGW8jY3mWNVY41uhplKvec7l3IFIGobmQl
	uj/JLVGEkkWekUB5O8iVW3eHRUw==
X-Google-Smtp-Source: AGHT+IGTtBEeMMFl48XiFu6x/uAjcUr1yvpr3CSBt+dg46LXqdhuk3+d7sbokK9GFxwHlCi0UUF5tg==
X-Received: by 2002:a17:907:3ea6:b0:ace:d91c:926 with SMTP id a640c23a62f3a-acee25ca48emr240871366b.42.1746018787909;
        Wed, 30 Apr 2025 06:13:07 -0700 (PDT)
Message-ID: <c4a71d96-b255-432e-b148-1daf1b14c77f@suse.com>
Date: Wed, 30 Apr 2025 15:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/alternatives: allow replacement code snippets to be
 re-used
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

In a number of cases we use ALTERNATIVE_2 with both replacement insns /
insn sequences being identical. Avoid emitting the same code twice, and
instead alias the necessary helper labels to the existing ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -51,6 +51,8 @@
 
 #define decl_repl(insn, nr)     .L\@_repl_s\()nr: insn; .L\@_repl_e\()nr:
 #define repl_len(nr)           (.L\@_repl_e\()nr  -     .L\@_repl_s\()nr)
+#define clone_repl(new, old)    .equiv .L\@_repl_s\()new, .L\@_repl_s\()old; \
+                                .equiv .L\@_repl_e\()new, .L\@_repl_e\()old
 
 #define as_max(a, b)           ((a) ^ (((a) ^ (b)) & -as_true((a) < (b))))
 
@@ -100,7 +102,11 @@
     .section .altinstr_replacement, "ax", @progbits
 
     decl_repl(\newinstr1, 1)
+    .ifnes "\newinstr2", "\newinstr1"
     decl_repl(\newinstr2, 2)
+    .else
+    clone_repl(2, 1)
+    .endif
 
     .popsection
 .endm

