Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708DC8A158
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172740.1497844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFp8-0006Wi-9L; Wed, 26 Nov 2025 13:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172740.1497844; Wed, 26 Nov 2025 13:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFp8-0006Te-6M; Wed, 26 Nov 2025 13:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1172740;
 Wed, 26 Nov 2025 13:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFp6-0005Pn-FN
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:44:44 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fd0d6ba-cace-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:44:42 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so39847175e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:44:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adfd181sm46260225e9.14.2025.11.26.05.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:44:41 -0800 (PST)
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
X-Inumbo-ID: 0fd0d6ba-cace-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164682; x=1764769482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HxIScLNANYzouHrWfAoiXuYKiGIbOKebyuIsqekA2Es=;
        b=GOGzLJRAdfu70vcgzOOPFfTyalR+PTDug0Gre70QgEu/QFi7XhGNTt8MX0Aj12ZtyV
         tUkodinqOQJl8u/QM94yNrZpSJPcgjtD0r9AsNzkZf2SbHYTeudPuR9jXH1qB1+cfcp9
         LX1m5UeXh1dqCJf/kC8QXD4lzYZIlaiHHJDUUvoRy4cLnSL5zm6Wvb1BOzlzsfnYs/uI
         xXWpPJx01p1aZV1J0sF5qCvGbsDLzHgePhFBgaMxS/+v11PgAQTNehCWMOFxHrk42bA/
         CsAHANy6EI1PTWDWEn1WPK+hCp/4VIUgPLtXamJ4t0kshDyKghWVs0cw6alO66jkUSV1
         H2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164682; x=1764769482;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxIScLNANYzouHrWfAoiXuYKiGIbOKebyuIsqekA2Es=;
        b=Ai4qYD2XkchJ/3bv1UqO0vwOJUGwo5re0SEP/61yc9IfBF9wyEacXV67Kidg4ZFnRA
         twUPao9ihJslalgqC7NLqSeqKg03+3M94g3w02Hc1ZuzWDpvn/1A90ZsXieWZlWx3UtW
         c9vv8zlRUZPw+dgnI/1Y7+a5Pnxfe+3KRS70BJyrp8+ub5CCbDxqkut+4UX0/UteikjT
         wxsxyv6lJmLNy5L440PZctQ0svs/85hLPY+LdcSUzCxrwXMvy1K0J+fpAQWYe+W9zScb
         mxYnx42/MStaHDOyBSBU4jZXIhbKqYbcFfcJ+TBeXS279rg+PX5ULnQcanYX3Ek6Pnmd
         G6/g==
X-Gm-Message-State: AOJu0YyluRdhTqybVm3QjvASa82kjg61gETMaItTPcQd8A8LPoDgRN+k
	rSgr1OUgpWtDY7vT1mllkuHVRLW1dnt08qvR570/NgVOJjUEtJ9Fc+Gx6G1KJwrv5tyAMpqVIt9
	bM+s=
X-Gm-Gg: ASbGncueAv9JurWCbq9xVyLZ+jH66zAwhkJvDr+HJMZbJzpP5nLD5e3xqe1UcYsbEBQ
	XVPY4QwWseZshUyvUbDrwEAAJUGzDarZLn50xBTY/rXrbI5V48KXHIlfp3bz9QmYbnAf6+t995b
	aenb+AOhAqnybuAcpXmHyffFB7ErAzH3QwU1cBiDEtUr5c9IhVoOWgPK/HZGrxJwnXn7ykO+Z2P
	4iWMRGKO5yHZOj0JQSivXnIHnk654W7d1bJ1+epVXhjS1+PNH1OuOATrbq+g0nkDgegcCbpeHpO
	rv3tEqXGZRJXbXwgGfYeDx9L9zGtaL3m1KDbotrse5DdF9tAvpvBgpISO9jQmBSAediNMQAQzw2
	el66CWHxHNWfneWQL8FFrufDaFAmtq92LytMzOMaM/4HfpxHewIk7rEw52rDS+HRmGNXJ5/ejdJ
	AAzwgLIAeTJr0BaIfQ4QvMQQkaKSESidgULrBU2riGfjNrQgCjYHFUMyXdFC/g+b6bpio68iU5G
	Do=
X-Google-Smtp-Source: AGHT+IG/91j5TeT/HiBPrnIXF7wBbmePNHgABuUtI/yugbV8FseA9dOWeg4+x99iNU7X9gMVQvSSnQ==
X-Received: by 2002:a05:600c:19ca:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-477c1143073mr185528705e9.22.1764164682055;
        Wed, 26 Nov 2025 05:44:42 -0800 (PST)
Message-ID: <37ed4a18-f1a0-4c1f-b915-1708c235068b@suse.com>
Date: Wed, 26 Nov 2025 14:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/8] symbols/riscv: re-number intermediate files
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
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
In-Reply-To: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation to do away with symbols-dummy, re-number the assembly and
object files used, for the numbers to match the next passes real output.
This is to make 0 available to use for what now is handled by
symbols-dummy.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -26,16 +26,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).0.S
-	$(MAKE) $(build)=$(@D) $(dot-target).0.o
+		> $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(dot-target).0.o -o $(dot-target).1
+	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).1.S
-	$(MAKE) $(build)=$(@D) $(dot-target).1.o
+		> $(dot-target).2.S
+	$(MAKE) $(build)=$(@D) $(dot-target).2.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).1.o -o $@
+	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map


