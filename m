Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5A3C8A14C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172726.1497834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFoF-0005uD-Tt; Wed, 26 Nov 2025 13:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172726.1497834; Wed, 26 Nov 2025 13:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFoF-0005sg-PL; Wed, 26 Nov 2025 13:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1172726;
 Wed, 26 Nov 2025 13:43:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFoE-0005ll-GL
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:43:50 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f03d11df-cacd-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:43:49 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b31c610fcso5790816f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:43:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f49a7bsm40379270f8f.19.2025.11.26.05.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:43:48 -0800 (PST)
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
X-Inumbo-ID: f03d11df-cacd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164629; x=1764769429; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MzQy66iAeTDGv+bNGxhdi0RJQlPxW7NcdZe6GibETbQ=;
        b=O76O6So2Twlc6kil/OI1L4tCmh13GdsMrIWyJ0WVwOM33NwZneXRY45nvccsX7b0q6
         mXHPjCpPnNE3cvc6QLp/VWPWP4kQ+NFhATtJ9r+0F9W8Qdmj+Ig4FpAvbUH9oaintEQ9
         vP9Lx+Hdvmqw7GzWybvQVtZ3OPGZS3SoCUFhbizEHqWL0rWoziYUzeupLlSdf49VfItD
         6vIPDmp+Zl4QRPiJetxkGiWmtKBI5QlM6D/+vPB7UycON0ZsX1DVaJ1N4pxvg+bn7GwF
         WPYywQPHRx4G5NtffcNihXVzaGcrQVzm2PgpedokpR1zAtaQn/afN5tHl4lKNajcJ1DI
         zLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164629; x=1764769429;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzQy66iAeTDGv+bNGxhdi0RJQlPxW7NcdZe6GibETbQ=;
        b=P2cIOGrO25IDzQzUbjeKAzSii/gqY4aFgxKcFx0kj8M0s0J6O1SXcdxBSE7rr5Qkmm
         ytObu2SSWc8S3cWvZ4ru4yUeyn+dqKrN808ndBl9HRknZX/z8PPkDmY87K151n64Fs7g
         /kPEwjys54KlXwDaj6iJR9CFc589onxw3zt6SwgOTAvkhEZBDBzj8p2iJYrv2SRiO7K0
         d5Klmv7Fm5CjFw8YoJ4wEgSfoIw5MYwQ/XNx92hJ8qaVUCZ8s+XDrkr/NVMESq45MNlm
         aPkf/9RTood6xAxYM2aaT2yBXYeqzAYoAn1mAU+1YGfyZtFhA039N29HNiBpS8NyAAvL
         9hsQ==
X-Gm-Message-State: AOJu0Yy+9n7iSeMHfKLiSBhMhfZbnQw1VpBVgNVzvzfmSatRoi3NOHSK
	jQVUBjqvMdSYP6aC+MKgvk4h2QUXv3VIUkdQuhfsIoRUo+RI6CaSbZ7k2upt8d1maNmThgPn6KG
	bZLA=
X-Gm-Gg: ASbGncu22e7W6r4nv04dqGyfbDODWOKDAr36Nm1jRaRSHYPUXL5w7t4Mokwj5PcOU3E
	QFjFAJIoezAMxB1HFi8OusEK7dJ5RAm0DbvNR7yZmPdr1ZbWhXV9qdAj/lOjOn8e1jwXU1dp3hf
	NYXZ2VDhqpqGV2XHUm8Sr313eygofWM2e5CjXqdcY5wJXA1CB55wJD0VzlVeWfsZhzDkCfhfmXy
	vQSoeK+Q/wjLwBWTLqf/WMQhr/MnxjwUVLdxnBlR767+8QAUJFjeLl+oEu19wFGc1eSog7w4iwK
	MaKf02a9tLhMrStOcBt+VPldJ6ZZZqq3naw69jC5maoD0MpoKs45obb6VLgtkgJUZoPQm1KCHwX
	upCL2w8MO7UYp8Ah6lqOdLYQ1fWHCD9QIx5CVl3o1qyhMhfMruUXv7LHhSQwOjHo9C7NXE97SsQ
	wQR46hJfH9+WR6kxveoXs2Ix959IdDorU0mKCknd11ZiR3IMw5gM2Ie4D7dp1JNSwt3xtV5EALz
	EQ=
X-Google-Smtp-Source: AGHT+IEdYsO0jt/rJPFE/sF/i918ilX7nsBEWoX+TFHpeJcxtroLantROPspT2SGOWEDwMkl75E7YA==
X-Received: by 2002:a5d:588c:0:b0:42b:2f59:6044 with SMTP id ffacd0b85a97d-42e0f21e9e4mr6941088f8f.17.1764164629016;
        Wed, 26 Nov 2025 05:43:49 -0800 (PST)
Message-ID: <8717ed0f-e837-4054-a67b-b41c08449c1a@suse.com>
Date: Wed, 26 Nov 2025 14:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4/8] symbols/ppc: don't use symbols-dummy
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>
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

--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -12,8 +12,10 @@ $(TARGET): $(TARGET)-syms
 	cp -f $< $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
+	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	      $(dot-target).0.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1.S

