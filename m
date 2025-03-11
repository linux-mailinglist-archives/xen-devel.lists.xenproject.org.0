Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F794A5C40B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 15:40:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908240.1315378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0mH-0006Y2-IZ; Tue, 11 Mar 2025 14:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908240.1315378; Tue, 11 Mar 2025 14:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0mH-0006VI-Fo; Tue, 11 Mar 2025 14:40:17 +0000
Received: by outflank-mailman (input) for mailman id 908240;
 Tue, 11 Mar 2025 14:40:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ts0mG-0006V8-59
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 14:40:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea8367e-fe86-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 15:40:15 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso5605715e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 07:40:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cea8076fcsm116075565e9.15.2025.03.11.07.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 07:40:14 -0700 (PDT)
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
X-Inumbo-ID: bea8367e-fe86-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741704014; x=1742308814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C/eDNm3veu2kEtLJaDIeOArNxq9TE3o+DSORQrLAqPs=;
        b=Xr18DbnEEIxOWrJ4ZUlBZxj0i8yG3ypAr+KcM5Zl9J2aRu8sKeQrlTmtZzhOQtflcg
         sKjasrWaGnExfUTm9lo+K4S2QuCKkd6sqpbE7NATYy4B+O6opEBbP+WtG6O0eD7sX9ZZ
         CyJCB9GkT85f5aEHNG75LS6DLiCyBNKH6g9k3BqN1w6NalvdSqIKHj3gOBcGWmkpThwv
         dE4Hw3vfKGCYk2YTdZCdWhIpCtfU5HeMGZyAUHADCQfx6UB4bjEjFN2JJ1h/rCZ52KlB
         V4qgLdwVEfkFrHdY6QMg2bi8MSqOr3q6yPaYwk/w4TZArNUi7LWd6D/k44vd2poRXA1X
         Crrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741704014; x=1742308814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/eDNm3veu2kEtLJaDIeOArNxq9TE3o+DSORQrLAqPs=;
        b=fIAD+UiGeu91L4zDtk4+gUyMFK+7IoHG2KYyxu06EebSuYpEyF8x99X2g6u00diQwc
         0N4M2z9nTJ+9CAYtXvmpME7epD/WjM5ZJeqs0g1j+ec/dFc0EI96WIbLIue9U+i1M7hJ
         k/UH5RyKTJCFYGbsTVC5kxZb0eJgWOOBMISGWnLjhfphTMuSKchMPqugL/lvJ3fk0dev
         bfCy9MvJVuwXvmrTk19hrfAVCIGXfqTDQHD0LaYGeMwIgO8AiXj4I4E7gYdmF+cejsTR
         cQpya/mu1uhHrbPAEWiDApe4pTrVHidO8jSHLxdWnJYbxX0wx57P+ADa53xivJibJHoF
         lbXg==
X-Forwarded-Encrypted: i=1; AJvYcCXCKqQghrAwMXXxwhJO0toMLXk5jMK4nYB7cx5/5GVGTBVFU7LMopGhRwK4yptmN/nNKTdFRgMM8Nk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzhzad7nDpcfHjxy9e8WR1j97lPJtNmv4bUyC01Syh1FJwqWHNG
	8Qcw4vGIM0XCxCpOKzmBSs05B+8kjROmow+0P+9wvIwl88d6MyXgB1UGaT2Btw==
X-Gm-Gg: ASbGncuWjQ1V7Kb5IyxPrw7GE0+3naN+tqdrp0PkKRcEXw97hhOLqueRFqTbyKCSd4Q
	OcPEviFqjYtx+J/CJ252eovbRGkDbevI+zmwKlBx4SAxjWUAYFUOwlr9aIGg/oY8qg0XzfXrTsJ
	hjQG+3iW4uKBfY3e4+81E1lJdAxx/fogy7ZGE4Lx5nBUvy18M0/JqGgK1IeaPx2M1nqAKPC2/yn
	M/wRLX2MAVvxXQMn5IDNjLP+dxZfb9JouNgpQyR5pfaGpPHz5yEOAhcWj4IXEd891gKUH46Nowt
	D59yHSELJraigUd1oxtJRrMYtVjE4VnHXVk9Osr2gbcoOLgkdTr0MUQqDagmD6cAI1pthWG070O
	k8vHJIrvYhGcVMQgKGYPzENKlHSv+hQ==
X-Google-Smtp-Source: AGHT+IGLSojSkH00MXbQ7Dr/vVQ/dWb8LvA1vJfHO2vj0JQfECZ7YPMMZ7416bJSgWSSd3vhLbvvrQ==
X-Received: by 2002:a05:600c:2947:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-43d01cc32fcmr45556375e9.0.1741704014569;
        Tue, 11 Mar 2025 07:40:14 -0700 (PDT)
Message-ID: <704d5246-83ee-4dd8-a0ff-d7bc2cd8d63c@suse.com>
Date: Tue, 11 Mar 2025 15:40:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Improve code generation in elf_core_save_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
Content-Language: en-US
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
In-Reply-To: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 23:45, Andrew Cooper wrote:
> A CALL with 0 displacement is handled specially, and is why this logic
> functions even with CET Shadow Stacks active.  Nevertheless a rip-relative LEA
> is the more normal way of doing this in 64bit code.
> 
> The retrieval of flags modifies the stack pointer so needs to state a
> dependency on the stack pointer.  Despite it's name, ASM_CALL_CONSTRAINT is
> the way to do this.
> 
> read_sreg() forces the answer through a register, causing code generation of
> the form:
> 
>     mov    %gs, %eax
>     mov    %eax, %eax
>     mov    %rax, 0x140(%rsi)
> 
> Encode the reads directly with a memory operand.  This results in a 16bit
> store instead of an 64bit store, but the backing memory is zeroed.
> 
> While cleaning this up, drop one piece of trailing whitespace.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With the plan to ultimately drop read_sreg() altogether:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

