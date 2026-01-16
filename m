Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46864D2FE9B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 11:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206418.1520005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vghRi-0005PN-QL; Fri, 16 Jan 2026 10:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206418.1520005; Fri, 16 Jan 2026 10:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vghRi-0005Mu-NX; Fri, 16 Jan 2026 10:52:50 +0000
Received: by outflank-mailman (input) for mailman id 1206418;
 Fri, 16 Jan 2026 10:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vghRh-0005Mn-Aw
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 10:52:49 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1d6c1c-f2c9-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 11:52:46 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso2413325e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 02:52:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435699271easm4454843f8f.14.2026.01.16.02.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 02:52:44 -0800 (PST)
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
X-Inumbo-ID: 7d1d6c1c-f2c9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768560764; x=1769165564; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA4sDXX2gIlKk6nQgwb2ZVwBL0/C4PuwImesDY0dvQE=;
        b=Nd+4jJ3elFUlPsZy78hgNEf8Mgm1ofXldP6J3dDTAaclo/VCgi/osfbe59rjtoz1CK
         hULGcKiyKxvl2rPqj0GgE49uJhcxMysfyOjWtI27IaY0IAKOFgbAfu6A9OSjKYWiYwS/
         1ptjtCq+vAuhImkk8H+k81FdWfOJgfFqMQUTMpBvviDgWQoelaglikUEKhFoPzqoGZZS
         Vz2xcEqI5M9tqxqGcytt6nqe/JxJUDDvt0cRknHV5iRjwHJINeTzhQWnACcjz8AdCg+K
         fSVW6W3EFnKVUAcYLCvmHN/Ewa7xPYrhKoApIbBMmT+oD2Cv8NfEL3f0bzIQg5wGl2Vc
         L40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560764; x=1769165564;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA4sDXX2gIlKk6nQgwb2ZVwBL0/C4PuwImesDY0dvQE=;
        b=QiIjzpGaxfGDQiS9xXeE9P+Ind54yAwGLJ2H8AuLuRWpYXKRUnY8H9GFdg3MgTMKx5
         JlJNXyrgbpD7v4NA6uDqv6marjyglrGgJBoqFpqfskeeG3WSLpGdlKpSghPcUEiTQM24
         HpcDqXaohQX2sb6Oy7H2QT84wDH08jnSGQPEPHGZspQp79Jnh7dkxHgIyxomayMyUNM7
         oKuwdqckFl1qdev9g1/anOALMAzcVO9EmgB28CUS+R4GnfdNlFp3reaNMUovL6Yz4VnU
         Ldu9jJKHULIsDq2T7rYsG86XPZAlS09xvSJVthAPcbM/MUYtWrmORbytpv5ECXNoFUn+
         yvCQ==
X-Gm-Message-State: AOJu0YxXPWiO7isDijLE4mjoo7XzveyQh+3Mk1O+qyXeMpmda5s+jk5s
	fH504yv2sFHCpGiQmi5Imww2ZwujwP37+st7m+SyiNu2DVOR/1cI2BNj08y6RGPhEpbFGHyAT+G
	KbC0=
X-Gm-Gg: AY/fxX6M3mj9z2yT3KCNZ/exlXPJSyv3qKoHKxdZompsypKIdPO7dcbJj1jjtTnWurQ
	PLIcYDmjUCPnLvRz7eoPZWywgCO/1nBb8fsMGh0U0XKzD6D7B1slfnMRWI4Umkwtv+C19Hgs/1o
	xUW6aSw2OY7doy6z3GJBXOxOeC2zG4ID+KvzkOnyBW7+jY1Z2VjBFOjREuTdbtoxgDIJCRY43O4
	29c3wg/05MwSR5FK7G+Ucliy10Y3xSAHTWEjYqV3xfhbjTK4C4lWFxhh72HMFJCFSG2OTt+2LZs
	L6wNny9Wja2LEKAb7/FNIGScpFx1XZ1zEvOcZfdLkPhbt9/N9aNBT5znZdSQwOIFwa3JHRjan07
	jmbKidA5ehLY6JUcs0w/f+lj+L35tPmg9uah88F/urzechKb7F+artIK5313fnOtgd2ctqxVpeU
	QYNXUa16zT+zz4hKdCJW7xL2rzFYu0cgspE1yUbUCgFE0qNDF8y1lj4/nPTM6iFb6yp2xG4GNJg
	zg=
X-Received: by 2002:a05:600c:4745:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-4801e30fae9mr33450515e9.15.1768560764294;
        Fri, 16 Jan 2026 02:52:44 -0800 (PST)
Message-ID: <f05fbf28-86dc-4910-96d5-922f8e7e4e89@suse.com>
Date: Fri, 16 Jan 2026 11:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Mykola Kvach <xakep.amatop@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build/non-x86: fix symbol lookup in presence of build-id
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

It's not clear why only x86 had $(build_id_linker) applied to all three
linking passes. Not doing so will alter symbol offsets between the 2nd
and 3rd passes for, potentially, all of the symbols at higher addresses
(intermediate alignment padding may mask this effect, though, so it will
look as if problems appeared randomly).

Fixes: a353cab905af ("build_id: Provide ld-embedded build-ids")
Reported-by: Mykola Kvach <xakep.amatop@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -87,13 +87,13 @@ endif
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -14,13 +14,13 @@ $(TARGET): $(TARGET)-syms
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -28,13 +28,13 @@ $(TARGET): $(TARGET)-syms
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \

