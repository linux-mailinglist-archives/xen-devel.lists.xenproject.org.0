Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D3AE9DC1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 14:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026321.1401507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlyi-0000bu-WB; Thu, 26 Jun 2025 12:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026321.1401507; Thu, 26 Jun 2025 12:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUlyi-0000aT-TP; Thu, 26 Jun 2025 12:45:20 +0000
Received: by outflank-mailman (input) for mailman id 1026321;
 Thu, 26 Jun 2025 12:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUlyh-0000aN-6k
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 12:45:19 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69faae26-528b-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 14:45:18 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso788406f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 05:45:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34c4473133sm1677962a12.59.2025.06.26.05.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 05:45:16 -0700 (PDT)
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
X-Inumbo-ID: 69faae26-528b-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750941917; x=1751546717; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnD865kQZT3U9m0YypsVhDcIpSJ1IT0MoGncbtt139I=;
        b=WwLhNOVNQPtoH8TFjBTgW++uCtq+w0/DP5ruVYziy/XkaaK43GewSxoiOSuLBHHX9h
         xXCnhYd41JMIkp70m42u6xUhm4Z2VS4WFL9OldQf4G4vw81rW/nJQlNZtVTTopnqRfOX
         rsLkJt0Bs6lcwzkeYOGsxgj6Tez0kCKH32WRsfpsaVFkeMwLg4ZCtuPfmk4raMhuSc6d
         eHnyBsqENC/cn2CuTIlyVUhWwxaRzY32Ax8CRhUf6PuP+0KuggGvJlYMqU16k3AS/Atg
         dV+2YHp6VahRhvrcr7CrJ1YpfDyE8falwiTiY9BRtunFupskL3Oxb0dRnTKYZkhvVvPv
         SkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750941917; x=1751546717;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnD865kQZT3U9m0YypsVhDcIpSJ1IT0MoGncbtt139I=;
        b=pk2v81yr1AT/7J4gTRpCTlgfcfXRTdaK/0OFi3hxwsAxm6/8wylcmgB65XgN4/MsLo
         rbNVE8rPX3rSMbamorA6KzB+BMl7ZENsx84a0un/v67fNF240DKlKKpvsp8E5ehqaSzA
         iTUuHWQSKHEMapCmNpqzvkKdVHoJIMXke9F9qUZJKzKpaE5ObO7Qubk1dGV2h18JhK9w
         XRBJCICmlXlXFmyYXVrk85RUKtVewU7pbAOqQkYKpj72XcUfkY53G3ZrSEJCQscjukjR
         ikmxCL6VxOPMF/iolkHmTuEUTd25SB6lHKqxjNFtZpyPjgQCRYfWwnCe8sOt26kSW7nu
         /fXA==
X-Gm-Message-State: AOJu0Yxd+u+Fs7s+0EBniXYRh91wAsq28ILhWFCI554x8AjkaZgTT+0d
	PnwOZH97FQlOpx8MxxbZH0b8p7rdXMV2Hdan3KHCnNfUZ3gQsDOZrMBeglZf1upXWLvpiGdJ/nT
	L+Yw=
X-Gm-Gg: ASbGncvbJId0vr+2pzLQloM3f4wCmUCqFIAWZBGMIMJWhR94RmYRuA+qBWZ/gWBRWh3
	bM7ok2fjCgdo4RqzvGtawYILdhiyGU+o5e/6a/+Wy8LSPlbOPJlLJaXgx1S9C/iyJyoL4YZ4okn
	UME/uhcbrEnssQk2n8ZCD67t4k0K+Vo3hTEWv8uEewLkXaQOmpIrvJ4Xvn+/lBcORBL/dCEWGAs
	Uc3HWNJM2A8zK5Vebs10EPZ6FUKtZPhh79UNS87N09M/j+/HwHSI6n6A2Y1VScucBMEHckG6YUb
	69akz5gvKFyEgE45ZBJsQpPY7DYworvy7lrDBahVwP0QzA4GopZcFu5BMEhs/j2EepAFSfFmRyR
	bh80KUbtj7iLSYG4mneoc1I1pQpLOH5j578InyEAO4ODPWjo=
X-Google-Smtp-Source: AGHT+IFgNX90Jkv79okhnr3X7yZYSluPgNCpiOV3F1rIVVA/MUCX5Xsfyjwq9Nqv4OaF11BYTKiWwA==
X-Received: by 2002:a05:6000:1a50:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a6ed641e0bmr4827813f8f.28.1750941917307;
        Thu, 26 Jun 2025 05:45:17 -0700 (PDT)
Message-ID: <a4343e2b-7bbd-4dca-8bcd-d30caf7555cf@suse.com>
Date: Thu, 26 Jun 2025 14:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: restrict use of --dynamicbase
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

At least GNU ld 2.35 takes this option to (also) mean what newer
versions have controllable by --enable-reloc-section. From there being
no relocations in check.efi (as we don't pass the option there) we infer
that we need to involve mkreloc, we'd end up with two sets of
relocations, which clearly isn't going to work. Furthermore the
relocations ld emits in this case also aren't usable: For bsp_idt[] we
end up with PE_BASE_RELOC_LOW ones, which efi_arch_relocate_image()
(deliberately) doesn't know how to deal with. (Related to that is also
why we check the number of relocations produced: The linker simply
didn't get this right there, yet.)

We also can't add the option to what we use when linking check.efi: That
ld version then would produce relocations, but 4 of them (instead of the
expected two). That would make us pass --disable-reloc-section, which
however only ld 2.36 and newer understand.

For such older binutils versions we therefore need to accept the slight
inconsistency in DLL characteristics that the earlier commit meant to
eliminate.

Fixes: f2148773b8ac ("x86/EFI: sanitize DLL characteristics in binary")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -106,7 +106,7 @@ efi-nr-fixups := $(shell LC_ALL=C $(OBJD
 
 ifeq ($(efi-nr-fixups),2)
 MKRELOC := :
-EFI_LDFLAGS += --disable-high-entropy-va
+EFI_LDFLAGS += --disable-high-entropy-va --dynamicbase
 else
 MKRELOC := arch/x86/efi/mkreloc
 # If the linker produced fixups but not precisely two of them, we need to
@@ -117,8 +117,6 @@ EFI_LDFLAGS += --disable-reloc-section
 endif
 endif
 
-EFI_LDFLAGS += --dynamicbase
-
 endif # $(XEN_BUILD_PE)
 
 export XEN_BUILD_EFI XEN_BUILD_PE

