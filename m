Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3EDAE7B79
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 11:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024501.1400350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUM4s-0004un-7Y; Wed, 25 Jun 2025 09:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024501.1400350; Wed, 25 Jun 2025 09:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUM4s-0004st-4z; Wed, 25 Jun 2025 09:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1024501;
 Wed, 25 Jun 2025 09:05:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUM4q-0004sl-5Y
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 09:05:56 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99b532e8-51a3-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 11:05:55 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso848507f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 02:05:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f53d9098sm1235474a91.31.2025.06.25.02.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 02:05:53 -0700 (PDT)
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
X-Inumbo-ID: 99b532e8-51a3-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750842354; x=1751447154; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuI9+lF7qlVECjIOb4TEfzkDj+6Kd7hWaKl7whIrRmk=;
        b=FGmwWs3M07DPjdC3mrRu5CTNZWNsEyL4iC1B7irMeA5q6pcDliCLieoRhtZf5WfDWx
         8YiyuzB9iTV+nZI2/Jz/t8I3xYIeyzpiiy1WsYKPJozm/CkBf4LGqLUSpexIRQ4glaul
         khL5scjAqNP8uJcHXhRO5fv90ip/kk0hs/I58g0vjDJGimLCA/gU3XckspM2d5F+O8gw
         4NFNOaoQMO7Kc/01Qb9wiWDJ0duW37H+jXuCRgg8/7AqwdRDT+2/9PrhqKo0tYQQsvQg
         DsiiXsG/ucvI0ro7gcGXKZrnYnZgANtJVPVTc0cMcpdnWm3/ooNbrAp69V5m6yRt/t/r
         rc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842354; x=1751447154;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OuI9+lF7qlVECjIOb4TEfzkDj+6Kd7hWaKl7whIrRmk=;
        b=da/DKvOopQUvEDvPtMhFrJP/jKL6Ru17N4SBKQV94Zd5JSlEqU3m9qXWpSVLVPHNvh
         5XQdOFn2G2jVeAgcrxrY0LjfU/sYS+bAG9TAZKObQ8TPj4P3Qdh69EDfvj2sbrwVMcgb
         rSSeuhSceknrgNkVyeQIprJXVxi88PBMw/StyIuz33+s8c/G8rnsesikuxIxHTks/yJC
         XMnErhVGCCSjN0Cd8Izc6Rper7e4K+5kuZZLsEGEifFguD3/KMeRTThltgGwQYod+aoQ
         uCtlAiIIoD6pRuc0OWuDcF8NAK0rmiLLeQz3uDTdY/y6wb/GYYLvH7q5Lx8Qo/oyEBL/
         nWVQ==
X-Gm-Message-State: AOJu0Yypl1uBqtvyMwi32UyeSVEKKSwhfzQywL7uG47SxsJBqnfj+tuB
	GcV6gNTSpc62+yGzp+L1q6myhkql2h+rpm/CIilVpWrpV/MscGl/GjNUWpo2OQMkPrgqzW4nhIZ
	MEUE=
X-Gm-Gg: ASbGncve64Ko+cVwvJ5ILUaE0LUUVLiMDndbrxIrLisSmziuY41QetOpCl7E71VwRmc
	Ma78DrwqxZy2S5vEi+cyxi2btGi36DAq4UxWk3/KIk9H7Ds8HbFh6HHDTlgsLMHD3OYQMHMlGU0
	fKZhs/e+DfqRFByvmc/zZ7TxqP0mAI7gdRO0DuGAIiHFU568fKCLkSHXIOyWOrSBioTgx2+LxK9
	PfgM4r8ThsicadfpHABnAulybib66yGbf7DhEvQZWy04QH3DzlZ9RmeZCVL5CFMD6dd/nskssCt
	OfADr3dGPTtzKhC0CLQA//cOjcgj3xlgF0R/kpoJVormxPTzyfSZQhzaxvhPBIUs2uqPyt4giK3
	nbLktUnur7UPNHSNsoT2kNjbKJhj+FDR7pVbGFjSKf0uhTCY=
X-Google-Smtp-Source: AGHT+IHc1brvycHUDqGfh4sWCwouMRG1kvc0R1WO0f2urWT8RnQGfVLk0rtFLAMOhpf4oYMoaVrxUA==
X-Received: by 2002:a05:6000:40ca:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a6ed66fabfmr1419464f8f.51.1750842354330;
        Wed, 25 Jun 2025 02:05:54 -0700 (PDT)
Message-ID: <f7c4f267-c491-4066-b13a-e1a1060c4962@suse.com>
Date: Wed, 25 Jun 2025 11:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/boot: move l<N>_bootmap
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

Having them in the general .init.data section is somewhat wasteful, due
to involved padding. Move them into .init.data.page_aligned, and place
that right after .init.bss.stack_aligned.

Overall .init.data* shrinks by slightly over 2 pages in the build I'm
looking at.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
All three tables are merely zero-filled. They could hence even be put in
.init.bss.page_aligned, yet then we perhaps better wouldn't use .fill
but .skip there (i.e. a larger diff for little gain). Thoughts?

--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -193,7 +193,7 @@ END(idle_pg_table)
 GLOBAL(__page_tables_end)
 
 /* Init pagetables. Enough page directories to map into 4GB. */
-        .section .init.data, "aw", @progbits
+        .section .init.data.page_aligned, "aw", @progbits
 
 DATA_LOCAL(l1_bootmap, PAGE_SIZE)
         .fill L1_PAGETABLE_ENTRIES, 8, 0
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -221,6 +221,7 @@ SECTIONS
   DECL_SECTION(.init.data) {
 #endif
        *(.init.bss.stack_aligned)
+       *(.init.data.page_aligned)
 
        . = ALIGN(POINTER_ALIGN);
        __initdata_cf_clobber_start = .;

