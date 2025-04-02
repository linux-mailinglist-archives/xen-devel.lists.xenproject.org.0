Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D1A78A5D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 10:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935240.1336675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztpB-0006Tn-3I; Wed, 02 Apr 2025 08:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935240.1336675; Wed, 02 Apr 2025 08:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tztpB-0006Qf-0M; Wed, 02 Apr 2025 08:51:53 +0000
Received: by outflank-mailman (input) for mailman id 935240;
 Wed, 02 Apr 2025 08:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tztp9-0006QX-JI
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 08:51:51 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b707f2d7-0f9f-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 10:51:49 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso6264834f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 01:51:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b65873bsm16139318f8f.8.2025.04.02.01.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 01:51:48 -0700 (PDT)
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
X-Inumbo-ID: b707f2d7-0f9f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743583909; x=1744188709; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6i5GaUj6GyWkycrBBRANG2P7pRkOQTgytmmORF3WS4=;
        b=VzL4rRIBWtjrJSVnIIvLZCm8IGIJqb01FUUuILogcBJ/rrMowvQaebDV2PIj3NFKVE
         c2wyOBfGtm1O4NX1BNshbfjkdwLLaUZKpYUn4+SU6g+LBdTdZn42SP/xejctfmjWO3wS
         xl+esWME+EvaLw5lAhb6j7Orl3Qo9T6qcUuG3/jVJrVbdk7SJKV1G88HVVMZPEKfTCs+
         1rJodA2b49rCJau3eDrMenT4QfOp3AaG4ia9qWFsKSzLoqudy6NGClE3QNJrKoNr2bwW
         OJfh7OtW0/9wMdUxJMDzkOYL5no7hceVc6H7aO2+hzF2h2x0b7XAflQKN30wRNlcluTj
         OCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583909; x=1744188709;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6i5GaUj6GyWkycrBBRANG2P7pRkOQTgytmmORF3WS4=;
        b=EiG8D6zRXyOLDdYIyCtn2+JDdHuhFE7NmKIf6rjzp3jLl14hXm2EDw7xFHdxWYupsY
         js5SdYJRkmSLVZpUBRytT0MoOea22IlK59WMoTcOzhwbU3La7zRMIutJk3cBqk6aJJ9I
         OAiPhTlaeVqO09y0X8oZoYMndefSDhvSuHiGU+NaMvyD25nb/qa7m/vf41bvMwj5PLRC
         4ZI126k8YrRTA+W1fXL4N1kAMk6/lZRBKv521Kw/rXQSz8vfVUP8/KXDg1brFCLokQFN
         sTgi4dqtiUcFC3DBelLyOJa70uwYgAsx4jvNHr0I94oDW+tD+VJEtizdzyxkcQXPFR0b
         PRbg==
X-Gm-Message-State: AOJu0YwfgWBTAqANGDdhtvMmsXsqnd2J4v5mdSOPwkqY6n/J5NCqggE8
	1Dwie2G93vC36DeRQgJ6JWVpCDG92ohUftUQu6SRVjmH2nft8p4aLnoNGOih823gVvU77giwdWc
	=
X-Gm-Gg: ASbGncshF3o+9SG4cIDAf53yhnKVjUrn4TnV3BkyfD1RRF/XWZ/GhPEpQv4ifdRzlo9
	i933YRP5uZmaYEwNuEMs2jkS3NNjT42oVqez7o13xt58kctwmW4fQ3v7sHhD0McrIhGotmc3aAY
	XS5savd9uOlJi6wOT3a5nEcIHKdMiz66FeuG9Mqbtaz0OTGsyInHYf0mRmsFCieQD+nC/QOiMIk
	5mvMGqqhHeJnkuSZSflOsPBTP3ITHoP967A79FrGB3sNBcA1s/jwdnSTx+gJaxOwrotY60JzJ6x
	fKFnt4po10FIrYJes42TSs1jZMm/07H+iLE6+5HsSD9VDyagh/9p1ggK3ts2h5QVut09KsJ8CGP
	SJm+kmm5AjMR29SWJRYv5NlS8IBgaWQ==
X-Google-Smtp-Source: AGHT+IF8qeu1KvLbhNAptedlw3vK1X8n5cjfuVwRBkY0mPtEYzVRXUFuhUYFUtR9AxnDNr71/QiOMw==
X-Received: by 2002:a05:6000:430b:b0:39c:1258:7e1a with SMTP id ffacd0b85a97d-39c29a04af9mr1344106f8f.59.1743583908893;
        Wed, 02 Apr 2025 01:51:48 -0700 (PDT)
Message-ID: <90354241-4ebb-4d52-809c-0af788d2b860@suse.com>
Date: Wed, 2 Apr 2025 10:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: sanitize DLL characteristics in binary
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

In GNU ld --disable-reloc-section implies --disable-dynamicbase (and
also --disable-high-entropy-va, just fyi). Therefore to yield
functionally identical binaries independent of whether mkreloc needs to
come into play, add --dynamicbase as well.

GNU ld further defaults to --high-entropy-va (along with --dynamicbase
and --nxcompat) unless "Cygwin-like". This seems wrong to me; that
default should be dependent upon "MinGW-like" instead; for the purpose
of building EFI binaries with a PE32+-capable ELF linker neither
"Cygwin-like" nor "MinGW-like" ought to be true. We certainly don't mean
to have this bit set in the DLL characteristics, so suppress its
setting.

Sadly while --high-entropy-va is supported by GNU ld 2.25,
--disable-high-entropy-va was introduced only in 2.36. Luckily the
defaulting to --high-entropy-va was also only introduced in 2.36. Plus
--disable-reloc-section was introduced precisely there, too. Hence
leverage the probing we do as to base relocation generation, to also
determine whether to pass --disable-high-entropy-va.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I remain uncertain about the applicability of DLL characteristics to
non-DLLs, i.e. images without IMAGE_FILE_DLL set; current MS doc says
nothing either way. Yet producing consistent binaries still seems
desirable, even if the field wasn't to be used by loaders.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -113,6 +113,7 @@ efi-nr-fixups := $(shell LC_ALL=C $(OBJD
 
 ifeq ($(efi-nr-fixups),2)
 MKRELOC := :
+EFI_LDFLAGS += --disable-high-entropy-va
 else
 MKRELOC := arch/x86/efi/mkreloc
 # If the linker produced fixups but not precisely two of them, we need to
@@ -123,6 +124,8 @@ EFI_LDFLAGS += --disable-reloc-section
 endif
 endif
 
+EFI_LDFLAGS += --dynamicbase
+
 endif # $(XEN_BUILD_PE)
 
 export XEN_BUILD_EFI XEN_BUILD_PE

