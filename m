Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2DC8085BD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649767.1014638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBvU-0005jf-O5; Thu, 07 Dec 2023 10:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649767.1014638; Thu, 07 Dec 2023 10:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBvU-0005gd-LK; Thu, 07 Dec 2023 10:48:16 +0000
Received: by outflank-mailman (input) for mailman id 649767;
 Thu, 07 Dec 2023 10:48:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBBvS-0005gQ-NA
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:48:14 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eea3c2b-94ee-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 11:48:13 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so9821095e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 02:48:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b003333c2c313bsm1103151wrp.100.2023.12.07.02.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 02:48:13 -0800 (PST)
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
X-Inumbo-ID: 1eea3c2b-94ee-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701946093; x=1702550893; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w8sIjouI6UYrV4jC1euue2uqKFDircc05iJIKnqVbUA=;
        b=RrOltP28FNtC5iRvdeaEdHQQqVUBwRnJOU2y9DHpNieh0vY0BwG1wCr2DLhy2g62U8
         0hHdGCY9k4oWRUZ1u/vDMbahBblGh7zETNEbP/PzQAzB/UwRlKewpAapUdKub8dKjJZ7
         AqKM3LyIfZYGSluYAy9KeVn0f2oVRClLnyFDPkwKuYm6mnGQ82NsM2knmcmettpJ7W+O
         OPsESmfskaqaK3texPzxul9aQM5xbPcsMM2YAHcBXsklLRJ94aWNhkcsODYYxhUSujAT
         10fkcfcugFrWSfNTWDoWaNUZY772sSmEIwiPMOV20CDfAfI0Bj5es/hkJjRysoy3QSjQ
         SgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701946093; x=1702550893;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8sIjouI6UYrV4jC1euue2uqKFDircc05iJIKnqVbUA=;
        b=VKFfsNhncAGRIeql+OqTk2+fzqqayWl+yWHUyDbwgvTUByulpGXoGKOmcd/WXS1IyA
         /xO3Fph8OmiW+zgjnLfKBTv3uBBkjpgz5bmwLnU3He0gTtwr6Ez6nxoBY67r7/z5QZY5
         zSjPwPFJV6zcSNtvVk9Bj01IS20T/SmBkVG3GxW934yRLHLdXsRi23K59jbiXm5+49vd
         HDC/0QxmSlrb0Vsw7DwndNp28HqXbqWjXBwEeR0vzdOOE6sG2cZiNGghFHeD6q2Jic9k
         7eB9HrbVKfWDUH15sf3Qp8Ad+gGmL/okN5yy9fnnB2H6/4Vs1GLSGamLDrU40/H/WRho
         gmlA==
X-Gm-Message-State: AOJu0Yy8Xo6yIXqVGVX3iamPxhnVgNmBdR00Nj9PnRg1Pkkk2OnHT1U4
	qPx7bm0ilWjU1BuSCMKHFhpR0ToDXKp2cPh+DnLS
X-Google-Smtp-Source: AGHT+IFaW5z10lvIgIOsGDzG26K3fo04ambOYLBA2MsZomHRgZScGTsKGIRZgxDqRQxHWd07cL8cLw==
X-Received: by 2002:a1c:7410:0:b0:40b:5e21:bdcc with SMTP id p16-20020a1c7410000000b0040b5e21bdccmr1399889wmc.91.1701946093264;
        Thu, 07 Dec 2023 02:48:13 -0800 (PST)
Message-ID: <7f0d8e16-c580-4dba-a81a-72d5334052dc@suse.com>
Date: Thu, 7 Dec 2023 11:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/EFI: correct compiler probing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
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
In-Reply-To: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Passing in $(CFLAGS) means also requesting inclusion of certain headers
(via -include command line options). That's particularly xen/config.h,
which in turn requires generated/autoconf.h. This has not caused any
problems so far only because arch.mk is processed twice, and the missing
header on the 1st pass would be there on the 2nd. Having added an
inclusion of asm/asm-macros.h to x86'es asm/config.h, the 2nd pass then
also fails on an initial, pristine build.

As per dd40177c1bc8 ("x86-64/EFI: add CFLAGS to check compile") dropping
the use of $(CFLAGS) altogether isn't an option, though. Hence remove
the problematic options only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is now the 3rd place where the -include needs dropping. I was half
decided to introduce a new lazy-expansion variable, yet it's not
consistently $(CFLAGS) that the options need purging from. Thoughts?

There probably ought to be a Fixes: tag here, but it's quite hard to
tell which change to actually blame. It's the interaction of various
changes which has resulted in the (so far only latent) badness.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -87,7 +87,8 @@ efi-check := arch/x86/efi/check
 $(shell mkdir -p $(dir $(efi-check)))
 
 # Check if the compiler supports the MS ABI.
-XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check).c -o $(efi-check).o,y)
+XEN_BUILD_EFI := $(call if-success,$(CC) $(filter-out -include %/include/xen/config.h,$(CFLAGS)) \
+                                         -c $(srctree)/$(efi-check).c -o $(efi-check).o,y)
 
 # Check if the linker supports PE.
 EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10


