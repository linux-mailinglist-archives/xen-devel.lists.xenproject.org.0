Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC39872FBF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 08:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688970.1073816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhln0-0003qW-8t; Wed, 06 Mar 2024 07:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688970.1073816; Wed, 06 Mar 2024 07:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhln0-0003op-5c; Wed, 06 Mar 2024 07:34:10 +0000
Received: by outflank-mailman (input) for mailman id 688970;
 Wed, 06 Mar 2024 07:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhlmy-0003oj-3R
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 07:34:08 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e975e4e7-db8b-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 08:34:06 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so9733751a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 23:34:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h6-20020a0564020e0600b00566d87734c0sm5521382edh.16.2024.03.05.23.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 23:34:05 -0800 (PST)
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
X-Inumbo-ID: e975e4e7-db8b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709710445; x=1710315245; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZ5Y9z+hZxEhmTStWr9SS8VQ2KHUVonSI9wVZkbY3U4=;
        b=Xri7zDWkmbAS5MmGeM7Je81PZPj2bgFrT+SIb5ySNq3CGsG4p0CZVCClu/QBEuZhnS
         IqMVtLBJ0vup3RYBRgvuta79Cn19huhvtXL17g4IwmH9+DB5MDVcVgERTOXR3fob6+ld
         ZKwfbhbzk4YzCQDzwlWew3TL1qcV8fAP2BBsq1QaYrdf8JXMauArMq6L9jLLdiL0PqTp
         6Dv+TVYU8T2QhHriTPlLpVhidm91fxG/0KpgrF11OEzlMHPu33NrrjW4r/Eg1G4b5kNi
         KvD9gCFNKHAQ54WbSxmlNrfi43t/HqVcmEQ+PxIBTPzdHZvwDN6I5kYKOZRRVFVYnh6a
         wRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709710445; x=1710315245;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ5Y9z+hZxEhmTStWr9SS8VQ2KHUVonSI9wVZkbY3U4=;
        b=AC2R9vp/cfGoJGQe82vrQmwhmx47ivbhQMIiTI5O1y40zn90pjfoaH5L2Q6iJjE59X
         87ytzeM1ZZ/yIMMdsPpyrk/CbLl5j8jTSmeq0qQ1K5m/25Ej13I+tjyh7WuBgcqwWDWQ
         il7wXcl2Y9kzcIuK7krSdR0d+cnsPCC4c89gTbzEInpwhCJwukClhVZJngXyJGQIyiA6
         JFCv3+TEfDlyyyZOHs8D+AVkAcxH6i2r2Sn/+J4BPr9dYo0YdijzWigesnOad8Zj8Hu4
         GBd3WazsD8qw4BHzholJzlxrKSGvFw6Q6iqg/hwHVregUzbA3Jyq+X/TrUnH88j5pA3p
         1rcA==
X-Gm-Message-State: AOJu0Yycw5UPEQ4v/syD1rAfSxE4URjS+UaeOUDnVV2VIs2QbiVunE5Q
	9QTOmO9a+kZrTWT7LBCpVps1ELRcgU69zhGloCHRcHjylt5iQ/F+B56NwJmaGxEAx/rHSqD3+pw
	=
X-Google-Smtp-Source: AGHT+IFJxaiZzsndaId/iEKEmUt5plO33xatbtDulALePkUVnHHnVTJZL1142XWjIdMWPrAVmtKkag==
X-Received: by 2002:a05:6402:1d91:b0:566:b09e:8d24 with SMTP id dk17-20020a0564021d9100b00566b09e8d24mr8449629edb.12.1709710445459;
        Tue, 05 Mar 2024 23:34:05 -0800 (PST)
Message-ID: <f15631b7-8cbe-40f3-b1d1-ac240440b10e@suse.com>
Date: Wed, 6 Mar 2024 08:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/asm: add commas to BUILD_BUG_ON
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

In light of recent observations with how macros are handled by gas,
let's play by what we informally set for ourselves as a guideline: Use
commas to separate parameters/arguments.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -82,13 +82,13 @@ register unsigned long current_stack_poi
 
 #ifdef __ASSEMBLY__
 
-.macro BUILD_BUG_ON condstr cond:vararg
+.macro BUILD_BUG_ON condstr, cond:vararg
         .if \cond
         .error "Condition \"\condstr\" not satisfied"
         .endif
 .endm
 /* preprocessor macro to make error message more user friendly */
-#define BUILD_BUG_ON(cond) BUILD_BUG_ON #cond cond
+#define BUILD_BUG_ON(cond) BUILD_BUG_ON #cond, cond
 
 #ifdef HAVE_AS_QUOTED_SYM
 #define SUBSECTION_LBL(tag)                        \

