Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4497EE58
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802164.1212332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssl9i-0001yM-U8; Mon, 23 Sep 2024 15:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802164.1212332; Mon, 23 Sep 2024 15:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssl9i-0001vE-Qy; Mon, 23 Sep 2024 15:39:18 +0000
Received: by outflank-mailman (input) for mailman id 802164;
 Mon, 23 Sep 2024 15:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssl9g-0001v8-OP
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:39:16 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9584d4-79c1-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 17:39:14 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-378c16a4d3eso4890294f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:39:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b38b2sm1240689966b.126.2024.09.23.08.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 08:39:13 -0700 (PDT)
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
X-Inumbo-ID: fc9584d4-79c1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727105954; x=1727710754; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a4CvbnpaABjXMbMkUMVMZRg74RIiZwnfpeLB4DbkJA=;
        b=bbg3Pr+vVdUEMBVVAMBQrN6y4BVyzxQalJZAP/Qby+PKJ/qF2BunevZF73SYlLN6e1
         OzR1XS6Df/oRhApsTj+WLWA7Rx5ffj/BE2AmoTdB0Oddwp8dlrszy9e57IR6JDEypIM+
         9RMXj2CFTMBlQz7q71X+rVrmKcQqSWiP+guzF1Z4MxCI5licy7OjRudWfuEo1mjq2I9y
         PKw2AIK4EoA18TUIE7aXwJRMvEwgTLPPfC/oDyjgToO/qzt5ax+ttK8fC72nosDRZJrI
         bC5mIOF6ykrOzFsNITs90ibnwfOvJpR9dHl5S+VTwZrxfuPIYH9Yx+cP3LiY4y8lNBA7
         CBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727105954; x=1727710754;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+a4CvbnpaABjXMbMkUMVMZRg74RIiZwnfpeLB4DbkJA=;
        b=HAKHRcmiU4XRqHgdFIfwBujk59ziSXRPD0VI5Q5J/BCyqN6qxkRLECeSZGFrF7tBoU
         JMae21T5rf78R0oQv2iakdUXZGwFuDN/f+zf4rJqbc/MVQFRx6equK8z+hrmeSQNPZiB
         LoJqh3wJay9mhwET7oslnCKByhO2f1NZ9Ln9d2QQOgCpZrZ22MZ9K1OUfyi9zddaeBxM
         hV6I2f5Cmw+Ad2VKR0TG9QADkkEhLVSrPtF15JJ55MywVp3+rVDIlnApPewDDBDfrnv+
         GVn8RLLDJm3KLFNLof3bVgPN1YD20C2AkokmyoaP5wj6iEMTYrNb050bE8LlZWtYEldQ
         0h8g==
X-Gm-Message-State: AOJu0YyO80prQAgmze2QsvA2egOg4xCzrgH0wdkywi1StN6VqjjFG2FC
	+Nf2/ZPtLv5dvJ0sxSFbiqGbCt1vDsMHGWCGcnIquLcCx+hxxMlRvtoHWy8oTFAaofaXOUqsEBA
	=
X-Google-Smtp-Source: AGHT+IFY0bFt8nuAANoDebXQm6VQQgfvmbI8fifDodq0frPgokb9Pc1aVdMtWicNRurfrxCwIlELLQ==
X-Received: by 2002:a5d:5585:0:b0:371:8e3c:5c with SMTP id ffacd0b85a97d-37a422532b6mr10204464f8f.7.1727105953998;
        Mon, 23 Sep 2024 08:39:13 -0700 (PDT)
Message-ID: <c075d5e8-5581-4bf5-9718-e5bfedb1dac0@suse.com>
Date: Mon, 23 Sep 2024 17:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: enable long section names for xen.efi
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

While for our present .data.read_mostly it may be deemed tolerable that
the name is truncated to .data.re, for the planned .init.trampoline an
abbreviation to .init.tr would end up pretty meaningless. Engage the
long section names extension that GNU ld has had support for already in
2.22 (which we consider the baseline release for xen.efi building).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Interestingly builds with debug info actually use long section names by
default, at least with recent ld. Or I'm unaware of where we control
that behavior.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -91,7 +91,7 @@ XEN_BUILD_EFI := $(call if-success,$(CC)
                                          -c $(srctree)/$(efi-check).c -o $(efi-check).o,y)
 
 # Check if the linker supports PE.
-EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
+EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10 --enable-long-section-names
 LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check).efi $(efi-check).o)
 XEN_BUILD_PE := $(LD_PE_check_cmd)
 

