Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB47CA5F6C4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912236.1318546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj0D-0005Gp-05; Thu, 13 Mar 2025 13:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912236.1318546; Thu, 13 Mar 2025 13:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj0C-0005Ew-TT; Thu, 13 Mar 2025 13:53:36 +0000
Received: by outflank-mailman (input) for mailman id 912236;
 Thu, 13 Mar 2025 13:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsj0B-0005Eo-Bm
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:53:35 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e1fbc28-0012-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 14:53:34 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso8868695e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:53:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188bb81bsm21058715e9.23.2025.03.13.06.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:53:33 -0700 (PDT)
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
X-Inumbo-ID: 8e1fbc28-0012-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741874014; x=1742478814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fCxxDGYuy2Cc/IFubfex0MjwHffrK4iFN5U1SgdHJM0=;
        b=gkw5rDRXCn5NJeyC37OadYrar6eFKzGfgGSisNWoFjxFKLYceoY7FNEup5AEDhC7jH
         7BYyo9odLKNlqNn50g+gE8NAUWEa6xpOcuifOEZjMbxe0LDeonEVT6v6Qs3Lxp92KeVN
         7ICwgrdavJMvw2vc7cxHTIkXpRkaZiKlkUKGXKrZWNfcdq7GooK9Ts3IfxLPafLlajbF
         DXPq9xaC86sjwkp0splyYk+ytEzMGGU9btgYhok1mKkTioueeYEY5MzpaIM+ncOMkWft
         wcGdUxAgHOmOVWeUjM2meEs+KLMcLc+BNStfbl4yQkezaeG4OfchnLgesJ9CFFCw5z3V
         LsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741874014; x=1742478814;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCxxDGYuy2Cc/IFubfex0MjwHffrK4iFN5U1SgdHJM0=;
        b=CRpWfnAcBaQXIORS39dHYrT6KA4WeW1Bye/GVIa3uAxisSB22FhsUtvyxZUNP5yPn0
         An+fgULSKv3PobRFvv8NNC3q9ccAZiXloktuc94cmCT3rBGKtgdv7bSipjo9U/iKb6OC
         XeI3otZleV38MuywdqSV/a/4vDMagveVTcQpEhazLoTP7aI9OL/R4VT2Ijiy+YraB+/I
         YyGXlne6nNxDmQrHlXY0eL0eKb3diCsPIlR+YJlefu7W/y31rQxoDEqIfoLoXlbUR1mB
         LBqTzpfLJHwTJL+vFu2XbD/QwzNIZDwgcYa161JLKW7iry3n4ZK/3oqBiiBuGtk3Kn+D
         mORg==
X-Gm-Message-State: AOJu0YwvoUdXSAwY1xhB81JmEmQEDBRgky7DsGLTGn88y7BL9hSNqJx2
	GuNtCTPC5C3+AfBtuxlWSlrlP8r1FT+LGzJtxNXGraPNstY+G0JcrzK50cjAPqOcVgDby5Q/8Zs
	=
X-Gm-Gg: ASbGncvC77X4bNzB2AmJf46IaUuI8awfFFLEquOIelTxQaw2eLz5vJbYvOCB6IDNLZG
	s9ncUdH7kjvmj9vJAQdfrHMDoiLxHQ2H3N2rgnyWpzE0VBB1dzSBuSDQCtLhn5Io0Wudo/sZDCO
	kbqJgzcrwg71MleEM2dUr91Q4tjNUUq4qESEGXgceuT2p85eudnsArxoLUbmXKwxbcDQK95DNS5
	lE5dq4C8p33fmAEy8olMxd1yMBmU66KMnJvsRrgcfc5vWcjONR+9ustOlqzgBvKMZ91aOuwAYxX
	fCoAyrOlkcinnLuVynpBFV06zkXC+R6Aury4phdGvIk5ulWpsjkmo6eqWxIQHngso7GGKBO7byu
	wwRC5plrQoxUKqrlS2VLBR8yAWOFFBA==
X-Google-Smtp-Source: AGHT+IFZjjQ0qBDB7b0zosF9/jHin5+CIaPO9cDuH6HESGaEsN6bV6XkBUq5irp9zrsar20f4aT0qA==
X-Received: by 2002:a05:600c:3b8b:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43cf6b2135cmr156894775e9.31.1741874013813;
        Thu, 13 Mar 2025 06:53:33 -0700 (PDT)
Message-ID: <816a0320-d229-4f7e-b1b5-51dbb640c5c8@suse.com>
Date: Thu, 13 Mar 2025 14:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/6] symbols: don't over-align generated data
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
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
In-Reply-To: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

x86 is one of the few architectures where .align has the same meaning as
.balign; most other architectures (Arm, PPC, and RISC-V in particular)
give it the same meaning as .p2align. Aligning every one of these item
to 256 bytes (on all 64-bit architectures except x86-64) is clearly too
much.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Even uniformly aligning to 4 (x86, Arm32) or 8 bytes is too much imo,
when some of the items require only 1- or 2-byte alignment.

Is there a reason only x86 defines SYMBOLS_ORIGIN, to halve the address
table in size? (Arm32 and other possible 32-bit ports of course have no
need for doing so, but for 64-bit ones that can make quite a bit of a
difference.)

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -304,10 +304,10 @@ static void write_src(void)
 	printf("#include <xen/config.h>\n");
 	printf("#if BITS_PER_LONG == 64 && !defined(SYMBOLS_ORIGIN)\n");
 	printf("#define PTR .quad\n");
-	printf("#define ALGN .align 8\n");
+	printf("#define ALGN .balign 8\n");
 	printf("#else\n");
 	printf("#define PTR .long\n");
-	printf("#define ALGN .align 4\n");
+	printf("#define ALGN .balign 4\n");
 	printf("#endif\n");
 
 	printf("\t.section .rodata, \"a\"\n");


