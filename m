Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99C2AB68B0
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 12:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984169.1370351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF9FS-000627-Hw; Wed, 14 May 2025 10:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984169.1370351; Wed, 14 May 2025 10:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF9FS-00060A-F4; Wed, 14 May 2025 10:22:02 +0000
Received: by outflank-mailman (input) for mailman id 984169;
 Wed, 14 May 2025 10:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF9FR-000600-3A
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 10:22:01 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44cf3d69-30ad-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 12:21:59 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso12355133a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 03:21:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8535sm911701566b.8.2025.05.14.03.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 03:21:58 -0700 (PDT)
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
X-Inumbo-ID: 44cf3d69-30ad-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747218118; x=1747822918; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DJucFn8jQPJRmsvoZ29DnHutiXDNc9NAieB+LH9yaI=;
        b=PpNo4yx++OOC78cjxUiDmZ7F5wRo0CHOd6ZZ516nAw4s36xQrtcYZ98QHFhbCdfzR6
         pCPcldC+LBfRF8NDS7KgNh7qwi5h1hbq8DQMUeNLG0oamXTNllqHf4+fOtR7AgArn4W4
         Onxb9VnVI8HUYdoiT4CN9of98tfNCkZikqJqhF/2Uk5v2SiswP3X1maPEU/DE4hBqzyv
         Ms5swAwOFBG8rTY1szj8azd7my0ySijV/fNA+Tps98LJ9BQms4cigPVZN7Dq2jTC/qfH
         TWGHyCjKdwGLMW2ORGMsIf9gV7diI2JmCfLNgyo5D1DnzXxbsu3fK/Nj9q9adbhOPFm/
         TT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747218118; x=1747822918;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DJucFn8jQPJRmsvoZ29DnHutiXDNc9NAieB+LH9yaI=;
        b=CGJz+WphjoUlj/WLXRh/JoIhdCljYl1jDK2dP/xoKnEZwsZx/zxiudK1C4+S9NhTvR
         nOgcZIKuvqRkf32pg1qrtIw7Vd0cdjhB+5ugVZGNejQcozJv1dB4clD4i+WPNrjCpjeO
         5UD+6+Bz31hEsXioXJxpyeuOCFqbUim7bgmw2X74fA68z3FfoXDoLcMlfWx6z9SsVUrq
         Z80KD8GIHcyHAeyW3wH/d3pRjmwOIqF6e+P+Yzk52lLSqMJapU0VnDvbbNE9XFwF/2sE
         qRm5BK5fJqXxNCtXbHCxTPS2or0OcSw/kCuljOFxvv1OBfUZ98ZD4NPh0cyYGLzUay/4
         /kTQ==
X-Gm-Message-State: AOJu0Yx455O0f0XJFfFm8IO8BAysD2cndTxDhJaqKlvFAU2L4CTdf/xX
	S4dqPdslOOtUku0h58XxBIFY0R1Yosork/bX3FOmOvMtXxITEwLuo6++9OzEt4/4Jxkp0THDFd8
	=
X-Gm-Gg: ASbGncuAtOwF7Fld09qwQN4aGWxo2zWwDDMGhDhR+r9AAWhFOpeLR4knLvGKSPmyY7Q
	8HBv5UdkYFKnzvrol+SC1X5OwHNmGczSXXyAuzJckDtakdbc3DYsl79MLJw9yyIy2R2RmB2mejd
	i1CzRhP+YLs3IprFwNx7ZARjR1hmubTZh3EkxwofjIQZeiTcIeWTw76MdUTH3Ok3DqMnJDUT6mL
	/fQAD/BAkOwizCMhcxAwDIrRxyY851XgvUEFDCmRnSuu8Eboh6tK0VBulPQNRgDJ5Wft3hkMZZn
	cmaLvAp375F9TzFXeVsGTjrEoIOpLdeMopXw1r81h8c6YB/RlJCWhfWLYrlWWB5cNA2WVDK7o5X
	/Kjy636IP8Fa4Mn88MQMFS+xs+BREv0AMeMi3L31A2jhFObA=
X-Google-Smtp-Source: AGHT+IF/NrIiXqK83X/mnLgxn3wohHytRvw+TLELdhCz7PVoiUNCyJIzp4zt9hEXgRzc2WQdcOevYg==
X-Received: by 2002:a17:907:72c9:b0:acb:b267:436b with SMTP id a640c23a62f3a-ad4f7153c35mr294155566b.25.1747218118521;
        Wed, 14 May 2025 03:21:58 -0700 (PDT)
Message-ID: <b1aca3d5-958f-4389-82e2-375ddfb04100@suse.com>
Date: Wed, 14 May 2025 12:21:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EFI: purge a stray semicolon
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

Aiui in principle this constitutes a Misra C:2012 rule 2.2 violation.
Just that we didn't adopt this rule (yet?).

Fixes: afcb4a06c740 ("x86/thunk: Build Xen with Return Thunks")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Noticed while backporting to 4.14, where patch context changes.

--- a/xen/arch/x86/efi/check.c
+++ b/xen/arch/x86/efi/check.c
@@ -4,7 +4,7 @@ int __attribute__((__ms_abi__)) test(int
 }
 
 /* In case -mfunction-return is in use. */
-void __x86_return_thunk(void) {};
+void __x86_return_thunk(void) {}
 
 /*
  * Populate an array with "addresses" of relocatable and absolute values.

