Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994C9A904F4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956178.1349663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53CG-0006ca-NO; Wed, 16 Apr 2025 13:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956178.1349663; Wed, 16 Apr 2025 13:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53CG-0006b2-Kb; Wed, 16 Apr 2025 13:53:00 +0000
Received: by outflank-mailman (input) for mailman id 956178;
 Wed, 16 Apr 2025 13:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u53CF-0006at-4d
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:52:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19fde73d-1aca-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 15:52:57 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so55547885e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 06:52:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c102sm17374366f8f.35.2025.04.16.06.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 06:52:56 -0700 (PDT)
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
X-Inumbo-ID: 19fde73d-1aca-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744811576; x=1745416376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2SZh3kBBWxDwGsa5xAebvI5A8C1nD2fROmU1nZP71aI=;
        b=fDIept6AYvr4m/7iDRsCWFBSWBRbxRQcYxcusEn6TaqPDoQCGPlSvndZvZFGyPby6w
         zTetLwoTMZwBKisyNd8zr8jhI3cQNLuasV/7R0Mi/Gmsu6cLPeZzX9VCuTzUTt8NqGQs
         /mVmPLg5Rv878V/vwiFT0QCkgvjuYYGXjD5OvR+wQuAo/3IM6CP3/JuJVChZUPpUKjzo
         0Djl1yEvCUt3e9r/uy/JC7eGBdxJp0uTT1l3G/wT8dI5nCYaXZGGktR9vAkkvvUG+a/E
         2vjs0cohTw+7JEJ+sIHDcrDaRPTGKhP7kcHcSn6a8vssqO2Hkfo1ujoYfE826hngvP+l
         qfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811576; x=1745416376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SZh3kBBWxDwGsa5xAebvI5A8C1nD2fROmU1nZP71aI=;
        b=eQmrye54dM7bZpb+W9PN8brLQldZUC64uwrzgwrbYnZAN+FkQDBNZoVQpJikPWmpKk
         kCgpzGcI4lvriI2GaTlcfiwxvpnFTT4rMLe7NOFXvRBLiY3SHFXTHQlGPvnKPrO0NWyk
         4Iv9dch29flmLk6Z86iDiMYtIRsaUeMK58OJye86aCqeB9SFZaiGFy3Y4mODQfQpyT9w
         eB2HIeVmQlNZSdwWCk2E0szMiPC8+EWn2ZGgOOxq/dJRp0XV+7DDWXX2DbiwPbed0CfK
         6vO3ZEm29AgxfNfIiy5BYb0AB30zcS1ZdvxVCY3oYm1QtpZ+tRGdYuOx4ZycTX6EjWYL
         hNQg==
X-Gm-Message-State: AOJu0YyLFMajOudiDbodS3zMHTYTwA3kA3t3apXofpLiolgwUZx5ri3t
	Dv4HMwJZzjytObeX1bgrBsvbl9rHNhaoHW2+f7ciUL9bvHwfutlh8MqO70E3ZA==
X-Gm-Gg: ASbGncuFyhB5SrahteadqBhCVO1zqTCnd0wVGdyoneEfRbfL7pE55t0wSCjFzgPHk5S
	56FQ5PWjzsYDQuNa4rf4OMRZKxzR3Ar+RsBTqwu4HP0HBlQCbEfae4U4eUuva+iCKJZr4neipS3
	iiHehCzula7AonWzn8I9p2t0962uQ0165vzNbVWNz5gh2/7NkrMnxCe0I/zMvOhtgSOKYzaOcF2
	Y1HMGBW4rVTrnyiUKxUkH4KQJWyuMyDzrENfxPGsWgo1DzxDT6+80XeNixlGETjvgs4WiUDT08I
	2MpZXYuPkZ5gqPnljM06euYNAXg2jkUBf5Ei+TEVuyEQaDq0ceIraGIPJj/VwxlXHrBzDIVZESx
	pbnzns1AFAu7fCgAFsOOlx1AsEDOfFBjqFIcR
X-Google-Smtp-Source: AGHT+IHnIUEvAguW6tieAVGMMqRXyNC7pbF2aYxl2avsJTrBKaTh/T3KFAQJZIwmpmJR+zGgs4Vy8A==
X-Received: by 2002:a05:600c:5109:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-4405d6aa843mr16841885e9.25.1744811576568;
        Wed, 16 Apr 2025 06:52:56 -0700 (PDT)
Message-ID: <26f9b5dd-2201-4dd7-bf26-863a9b114b62@suse.com>
Date: Wed, 16 Apr 2025 15:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assert in x86_emulate_wrapper triggerable by HVM domain
To: Manuel Andreas <manuel.andreas@tum.de>
References: <e7347061-6dc6-44a3-ad41-270e705db2c5@tum.de>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <e7347061-6dc6-44a3-ad41-270e705db2c5@tum.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.04.2025 23:52, Manuel Andreas wrote:
> my fuzzing infrastructure discovered that an assert in 
> x86_emulate_wrapper is able to be triggered by an HVM domain executing a 
> specially crafted repeating movs instruction.
> 
> Specifically, if the emulation of the rep movs instruction triggers an 
> exception (e.g. by accessing invalid memory after some amount of 
> iterations), the emulation will be halted at that point.
> However, the instruction manual requires that _some_ register state 
> (namely the updated value of rcx) shall be commited, whereas the 
> instruction pointer needs to be rolled back to point to the address of 
> the instruction itself. The assert checks for the latter. Problematic is 
> the fact that for these type of repeating instructions, Xen seems to 
> eventually just commit all register state when it encounters an exception:

If my analysis is correct, none of this matters here; the core emulator
is working correctly. Hence also why the in-tree fuzzer wouldn't have
caught it. Would you please give the patch a try that I just sent, with
Cc to you (sorry, the list archive didn't pick it up yet, hence no link)?

Jan

>     557  #define put_rep_prefix(reps_completed) 
> ({                               \
>     558      if ( rep_prefix() 
> )                                                 \
>     559 { \
>     560          __put_rep_prefix(&_regs, ctxt->regs, ad_bytes, 
> reps_completed); \
>     561          if ( unlikely(rc == X86EMUL_EXCEPTION) 
> )                        \
>     562              goto 
> complete_insn;                                         \
>     563 } \
>     564  })
> 
>    8356   complete_insn: /* Commit shadow register state. */
>    8357      put_fpu(fpu_type, false, state, ctxt, ops);
>    8358      fpu_type = X86EMUL_FPU_none;
>    8359
>    8360      /* Zero the upper 32 bits of %rip if not in 64-bit mode. */
>    8361      if ( !mode_64bit() )
>    8362          _regs.r(ip) = (uint32_t)_regs.r(ip);
>    8363
>    8364      /* Should a singlestep #DB be raised? */
>    8365      if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
>    8366      {
>    8367          ctxt->retire.singlestep = true;
>    8368          ctxt->retire.sti = false;
>    8369      }
>    8370
>    8371      if ( rc != X86EMUL_DONE )
>    8372          *ctxt->regs = _regs; // <- Incorrect RIP is commited
> 
> I've attached an XTF test that should trigger the aforementioned assert 
> on the latest release commit: 3ad5d648cda5add395f49fc3704b2552aae734f7
> 
> Best,
> Manuel


