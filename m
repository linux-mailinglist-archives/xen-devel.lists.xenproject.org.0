Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81EDA2726D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 14:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881434.1291572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIeb-0006aQ-M6; Tue, 04 Feb 2025 13:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881434.1291572; Tue, 04 Feb 2025 13:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfIeb-0006YN-JV; Tue, 04 Feb 2025 13:07:49 +0000
Received: by outflank-mailman (input) for mailman id 881434;
 Tue, 04 Feb 2025 13:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfIeZ-0006YH-Gs
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 13:07:47 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0709703f-e2f9-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 14:07:46 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dccc90a4f1so894110a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 05:07:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723d0d2asm9409838a12.7.2025.02.04.05.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:07:45 -0800 (PST)
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
X-Inumbo-ID: 0709703f-e2f9-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738674466; x=1739279266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/pfIIxEt/kea+g6WpuobvhtVrbusTaSQJ3Juo/PO2Ek=;
        b=NQXsMXFmErHQ6lx1ecPHaMx5Bfkh6jlKskhkjE+FfWZfJd7CZuDBXwUJWUObLI6BDr
         1J6jl09uSm8JkVP92Uk7xZrFgchDSy3K2ddCgv8MWskXQTFdgynzGNnUdc04+YCwRrXq
         jPS/YgkM+xX2QHwP5lDkkDBfc/ozNG/xUTyLQI+q44whT6KbrpBgnraQ0MM1wcG11WiZ
         AHJGLYjhBZ5ar8BUsYZ2T8Vvs15NBTyt/ZLcDoGNNEVq90NSHAwcTXQRCVfHsHWLcXqk
         8u6GGYtWKb3cW1CzP2MWFBffn5sJB+KbQfk97JfW7D1SLGSAjtEJsp4asqM9w1P44g6S
         69Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674466; x=1739279266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pfIIxEt/kea+g6WpuobvhtVrbusTaSQJ3Juo/PO2Ek=;
        b=u6+N8RR4Fi2grqmiYyeQAR5LaQzs7T+qmcQaVeSjuvuvNQZZDBl+yYwnem7YABflZG
         TScC5E/J3gL1/0smO0qfaN2aMXzWXbba3qsuWmDQ0Q5WTfAb+1Bkdmks4TcAq0VcUsNJ
         IkeAAbum0lzStdQraL3Ze/X+guFFYKBEjVLjRQo6o5sWbE47ifUCYf08+IgF9xeUQG6o
         HrMTqgQ2oe5xldDt1EV2/KJK4cZKOr39QvlSB39Zw6MGBAXe3OZ1LVf3Cj7T812x1NgX
         KKTGHJ3v7wY3j8CIFbo3HfR2SSovnQGSbpHHQ4xhkv7kXbAlp2saLbh6G1yQoyJ6ezl9
         x+oQ==
X-Gm-Message-State: AOJu0YxQyhCGahUBQhltorBx5Ki9dMvY5KikIlyZcfdhK74RISG36XHT
	8fbELglw9zVqHhXIPr1709xDFFtLe+8dAAS6CphFp4Z6Cp5lTaM8hO0rxsVYsA==
X-Gm-Gg: ASbGncs9m6pW7gkzrzAxuAaSD4LWVbAMT242P1++PIYvIKfdbdV9X5I0mk5ENl9nCTd
	ZVGuNgIugC/IFKyh5SUqkrxLS6E60FKgtvxsMPMgmEqFY/DcYFq3R0g9yAQkH+kvVeBJnoWXGN5
	ty/Zkfwu0JK7AQmoGXcCY8hmkQ81Q48I2Ur7rY6lmMOpr7EYGd732RH8Y0FMfQxuZIV1/MB+36M
	Si35OlMlg7wN5gLHE+AN+ofLqoBXkT8Lm/Ioh+0lb+7V/HfsmaheHZOnX1d69ZsqzPTFpbRfjKR
	PfB/bYnrrv6De10byJ9xnOAIuOLnYEh489W7wXPU+86RW7Wj6vwr2hJGrxw98yqXHia2lK0KFsd
	f
X-Google-Smtp-Source: AGHT+IE3pJqEsARY+n7sZ9hX+jMZSfq9wlKt0is81mA62aSiHNhW4t7szpBrFKSGAJAx9qUWuAgdjA==
X-Received: by 2002:a05:6402:2816:b0:5dc:1395:1d3a with SMTP id 4fb4d7f45d1cf-5dc5efa2e79mr28731496a12.1.1738674466000;
        Tue, 04 Feb 2025 05:07:46 -0800 (PST)
Message-ID: <9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com>
Date: Tue, 4 Feb 2025 14:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v5] Avoid crash calling PrintErrMesg from
 efi_multiboot2
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20250122101407.52282-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250122101407.52282-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2025 11:14, Frediano Ziglio wrote:
> Although code is compiled with -fpic option data is not position
> independent. This causes data pointer to become invalid if
> code is not relocated properly which is what happens for
> efi_multiboot2 which is called by multiboot entry code.
> 
> Code tested adding
>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> in efi_multiboot2 before calling efi_arch_edd (this function
> can potentially call PrintErrMesg).
> 
> Before the patch (XenServer installation on Qemu, xen replaced
> with vanilla xen.gz):
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007FF0BDE0
>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!
> 
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> 
> This partially rollback commit 00d5d5ce23e6.
> 
> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

I expect we want this in before the release. Oleksii? Maintainers?

Jan

