Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2FC8A15B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:45:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172746.1497854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFpY-0006vL-Hv; Wed, 26 Nov 2025 13:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172746.1497854; Wed, 26 Nov 2025 13:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFpY-0006sn-EJ; Wed, 26 Nov 2025 13:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1172746;
 Wed, 26 Nov 2025 13:45:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFpW-0006nR-Ty
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:45:10 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 204d1277-cace-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:45:10 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso4276050f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:45:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ff3sm41647454f8f.16.2025.11.26.05.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:45:09 -0800 (PST)
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
X-Inumbo-ID: 204d1277-cace-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164710; x=1764769510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=43Nsypl1oM4oh8KH04Gpj1BPETT37MdF9gF2yxSQyNw=;
        b=DyTJBRUWX47xJsjbf/0Nayba+EqIAVNvRmW+EBEDgtSx8PW1FlLAUEK6W6kUME3hiE
         l8kvsdsxbSJ5oD1IXWlNfh8rl3Ixi502dZKQni16GXGMkoT8pAk10JmsoERr74EQ6Fqg
         tCktpQMg8fUof1YxcbhMs3tDRCX0KmoGkQgK5aoRLw/OlNt+WXCBj/HlViuwptow3d2+
         qgZt8ZbrzCBHpGlOlpcBtPU9y1S5/Y+vTgkkR4RB55vnR8780X+VxEnaFbCyFRJEsl8c
         fdjzyUQPtvF3LwbXKYYi8lkf8T3yVSWUpL3v44MldfTx0B4tQZayGHbF6cNXephjJTxf
         bk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164710; x=1764769510;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43Nsypl1oM4oh8KH04Gpj1BPETT37MdF9gF2yxSQyNw=;
        b=U1DzIEFm+a5fcHIe9kFVNDsqfZ+1oAACvzj9Ig/sbo3PRnizPbIinjnAJvooykGb9Y
         63QXRVqtyoiKjx9Oy+cjhUUy6QMjARbJCTTPBX1pb6uAaW291fUZb+ZkeZqWs3kSPMIP
         /anPfLrVTYrdnvT+U1kLJD8DDiYymDMyktJeHjfMYQPDmIEEjdfmzRsLi21xYA3VImGv
         4WeO83Kxv7A7wXH3TqVfBoJK98Nw1WPSXkaMR0QERpm1o3Y00keFuCrcTVG4zyasSOtO
         Bt+tkg5r3usgPnH/PhdUn5fezwVadj2Bd+22awSRPsCDgd9Kt4fEEBGI/Re3w0XrxNDX
         TotA==
X-Gm-Message-State: AOJu0YzoKNES4op34LDQHXnCjsS/x8Ox78TJrzTVTEV+jt+ulu4chVv8
	ZgY+O7jChtDY9myhAq6OrXQ4KJqc9jmccdlalw1kPpG2yYYuQigZpe29jNjb/xSDsDfoMTZbJ8+
	F/rM=
X-Gm-Gg: ASbGnctALP6MCOTUyZNGmVgfyrtcTWlcOSycTC+T+mduzgD4FBROl3gZiVv15M3jwIe
	a6XVvxuxv5sfzi816kArjRTsIxn9JeJ5nZLOtdyd3QMrl9I6DiJm1tPMUFhU1Kr5kXtyLXtFdgX
	uUIKkLeoi4yNZc4ZNdy3aRutqDcixqrOGfn55iupBvLLa/4kOHAFud2SQkW2uC49oveKDY24VbM
	cn4aqGfn28bjIJUFXBLG7idnGleaGk+SVWFFH3b2VldDDvgPEFSb1ZC0KQu4sSbuxn6IQ6TeD4t
	BjcL38yM3LkxBpeeYVSa5wawlB2Z854QEf4jp8OY9K5aW5a+sxaiLxeNW0LWoyCtAKzvWVfV/Zf
	zOGguZjxo5InSyGjgjOCY7McsKBB9tyZxKGhDw6Ln+kwg6NJ3BXyR5CEILkiLWO0hqLe5XGFsbb
	TVfdAQkzbEiPKj4AZCPIhWm3ptVLSP0AQQv9Ibck+RfRYsJ3XKUFJOMSHhVBCdwd8fwgQhB/3mS
	dM=
X-Google-Smtp-Source: AGHT+IEKIEkuCDXpikzUkhqwVCKZCuAAELq99cJb9h3DjL6oVfLAawKJsDPzDU7izYDO9RCvu3kktQ==
X-Received: by 2002:a5d:5848:0:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42cc1d0c9d6mr21421980f8f.47.1764164709797;
        Wed, 26 Nov 2025 05:45:09 -0800 (PST)
Message-ID: <5e5ee09f-88b7-41eb-99da-a9b5cf4bf348@suse.com>
Date: Wed, 26 Nov 2025 14:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 6/8] symbols/riscv: don't use symbols-dummy
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

In particular when linking with lld, which converts hidden symbols to
local ones, the ELF symbol table can change in unhelpful ways between the
first two linking passes, resulting in the .rodata contributions to change
between the 2nd and 3rd pass. That, however, renders our embedded symbol
table pretty much unusable; the recently introduced self-test may then
also fail. (Another difference between compiling a C file and assembling
the generated ones is that - with -fdata-sections in use - the .rodata
contributions move between passes 1 and 2, when we'd prefer them not to.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -22,8 +22,10 @@ $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S

