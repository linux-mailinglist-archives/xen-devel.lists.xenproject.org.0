Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0084CBB5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677564.1054238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi6s-0000Fp-MG; Wed, 07 Feb 2024 13:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677564.1054238; Wed, 07 Feb 2024 13:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi6s-0000AR-IO; Wed, 07 Feb 2024 13:37:06 +0000
Received: by outflank-mailman (input) for mailman id 677564;
 Wed, 07 Feb 2024 13:37:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi6r-00007V-Gq
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:37:05 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb1c2f07-c5bd-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 14:37:04 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b0f36b808so485883f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:37:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:37:04 -0800 (PST)
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
X-Inumbo-ID: fb1c2f07-c5bd-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313024; x=1707917824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y42iGpChZ2+X/wNXWYFaYLa/ywLQuM+ANdY+in144ps=;
        b=d44bpYhtKeJew4D/SmArcLYoQG4aPDe9wAh1y4VcB2zTDoXkYUQl4XJIYZ0c4xcOh4
         AzUOMe17WRhoMEMyA/uwnyvuHhBwVmqrDCP3wONQwzdvlz3W6IneZw3fB9DC4Sc4se9r
         cGVQeb018pLHOsFLSYzmRq7CmpCJNwuhLZkI7LTdeEZhTLuwXNln7NZRmv7nXQ5SU9DB
         QFih9OYvtHIfH3naO44ZwICIWh5byCzCdiT9hZH8gPHXxaZRMxg93m55/cLdgOnHi2+y
         Ttbfuq5mIPiaX0JtEgjTzmMy3hLxkQtsy4hKJst6MnYjcqxPdKGfnsVmxIKaOtZIpAGg
         C7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313024; x=1707917824;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y42iGpChZ2+X/wNXWYFaYLa/ywLQuM+ANdY+in144ps=;
        b=Cbm5oJwWz5+as8uj6bacx4kW+kZmkLJ/MivaVI/3I6ZGrXaNAKJjuGlYzyCOTFGvKi
         MHNoe7ltIBu9RskWk+pcIrOp4TpDHhcfx5JcohcQKqA7WcwNLytB0LOZw6Gz6NFE4sjt
         3K/w5rMosXuwUoKrc77lLB/iLI8t79YLiosCrddWs2PQSXd8m4jmmApuevCtZ2E2wZfd
         pjBg9HMWx/rgHlr1aU2wBtLUlLOijwYItypWEvDZi86MYrqtXAE5YGu0lhoFxeZR2fvO
         A3slfkh9CVSYkwpYAtARa+ArvOEqVPe0JtaZGy0j/R8MtV3oaJrpiu84tYYrrvTO4nep
         D4/Q==
X-Gm-Message-State: AOJu0YxuRy8i17yZrgYJZSD4AAZTAJcOP4RkfLM33WwI/BcdOTVXoJfl
	Yfx9LLnQMc81qiBI/GbWgpn02baZByqVcnnvMA/QljAvtOT8QxUvzCewTb2HyTHn0YltsJVY7GQ
	=
X-Google-Smtp-Source: AGHT+IGqEj83M/D2sQzNE34YqcaSeXT63U2jm74FPmYefn3qGCzpuoeUh9bblWZ+cxInNq8cnsRdxw==
X-Received: by 2002:a5d:4b02:0:b0:33b:2c2a:934f with SMTP id v2-20020a5d4b02000000b0033b2c2a934fmr3907458wrq.44.1707313024408;
        Wed, 07 Feb 2024 05:37:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDjdr0j/18mr6bOOe4ACIO6K6mAv7beJONhQU9byqRqWrNr6kVo35NwOvtTSCtDBbj3+umFFufEChtn8U6cOMN3v46yLOG8DnmdYv9i6dN8BbfEakK+M/vzjx00qfGLcqY210b7qPQiTVi
Message-ID: <4be8669e-bea7-49a7-9a56-f043c76d2f72@suse.com>
Date: Wed, 7 Feb 2024 14:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 2/7] SVM: convert entry point annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
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
In-Reply-To: <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the generic framework from xen/linkage.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: New.

--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -24,7 +24,7 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
-ENTRY(svm_asm_do_resume)
+FUNC(svm_asm_do_resume)
         GET_CURRENT(bx)
 .Lsvm_do_resume:
         call svm_intr_assist
@@ -132,7 +132,7 @@ __UNLIKELY_END(nsvm_hap)
          * to safely resolve any Spectre-v1 concerns in the above logic.
          */
         stgi
-GLOBAL(svm_stgi_label)
+LABEL(svm_stgi_label, 0)
         call svm_vmexit_handler
         jmp  .Lsvm_do_resume
 
@@ -140,6 +140,4 @@ GLOBAL(svm_stgi_label)
         sti
         call do_softirq
         jmp  .Lsvm_do_resume
-
-        .type svm_asm_do_resume, @function
-        .size svm_asm_do_resume, . - svm_asm_do_resume
+END(svm_asm_do_resume)


