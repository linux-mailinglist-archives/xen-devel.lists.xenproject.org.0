Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FA956BAF
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 15:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779711.1189413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg2IS-0008Mu-DE; Mon, 19 Aug 2024 13:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779711.1189413; Mon, 19 Aug 2024 13:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg2IS-0008Jl-A6; Mon, 19 Aug 2024 13:19:44 +0000
Received: by outflank-mailman (input) for mailman id 779711;
 Mon, 19 Aug 2024 13:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg2IQ-0008Jf-4N
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 13:19:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0789bb5-5e2d-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 15:19:40 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8385f38fcdso401167666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 06:19:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839464d1sm640226866b.173.2024.08.19.06.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 06:19:39 -0700 (PDT)
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
X-Inumbo-ID: b0789bb5-5e2d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724073580; x=1724678380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cXf3HcKYavlt8ny05uxT/Q4xIvF4t/X2PVpEonyuAeo=;
        b=TDQaSR/j7eizFzAInmDB7bvh4pqagoC4jBRPysuG3NFX6Uy4wx7Yj1NQTrWxKJf77p
         nGGsJGF0QrhygiWkd3kUzpOQVmeLbo+y9IMbFfe65f17ptHVAhbjv15HdJAaHjwqNLK1
         9pytoynfuH2EUVU5rLBQLgFNO5VjIXCW/KGMdFlzKJ5MuRzI16pqYRYJ+GwNd90fhLxJ
         dDwbYqOaKgPL8tkj760k936SLYkzsuBp6lpCGJtJ7Ijv6BMDjYkk6pYVYe4hUGry0MWs
         78aW9jYuZyhCCbjpEZc51eqss47LpCa0h1Veg1AMgZ3n9k1B8aM7s3MGbELVpztgRvfb
         o8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724073580; x=1724678380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXf3HcKYavlt8ny05uxT/Q4xIvF4t/X2PVpEonyuAeo=;
        b=evB9gf026pKEp7qs+aTwvW1VfhSV+/eGAT7gq3SuXz08/8WOzj6aAMsfJsv5sK27h9
         fG6IiyXNTLch2NJXhEf14fE/0PPT7yEn/+KRe7xemGTRx8anwoxTR3zWF7tNO/mrmi/f
         oaUVqjXYLOblku4pmSM9Io99+dy+N4sOsshgWPvIWXl218SeoM533pM64HCyVol2YRuw
         8U/2J5rImZsWgH9EZw6zaRJiwssL7pMke11doa8Rqq2Uu84VhSJL3z2XAXSTFV5CFYop
         LX9eUm92XUCzVU5RvG991kvHQiwnkpeF9S/UXo98UIMPuW+gPCD2uHckRU99/xb/pYU/
         oFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/9qYZEc7wnkuhwtxMWNQ01a1KFWroRlOCMyS/I03zk8RXyHl2sITodRzak5EdCF4AZV3pbf+XwSHmVO6+dNYOFoCHZaZRmvtWTznCo9w=
X-Gm-Message-State: AOJu0YzzrC/UIqgP0VkY8eeH6CAHPk3l+r6sBmwX4GMfvK5nmn79AQiL
	ofWRPq30XkobUN+6F4+vLi0Y18YkixPRIh6qZ3hF5jF3dPqeQDX/r02vvMvjrg==
X-Google-Smtp-Source: AGHT+IF2KZFQdRXYacJp729VuZw2RW9qwVdWmHZE7aKZhzQKnHVphb7xdItgSq0eI/NT0rWa3fx6CQ==
X-Received: by 2002:a17:906:d54e:b0:a77:aa6d:e0c7 with SMTP id a640c23a62f3a-a839293e973mr830396566b.30.1724073579475;
        Mon, 19 Aug 2024 06:19:39 -0700 (PDT)
Message-ID: <edbf5a9d-2a13-4755-80f4-5bab93cb8053@suse.com>
Date: Mon, 19 Aug 2024 15:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240819125401.218931-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240819125401.218931-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2024 14:54, Frediano Ziglio wrote:
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
>   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 0000000000210246
>   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 0000000000000000
>   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 0000000000000000
>   RSI  - FFFF82D040467A88, RDI - 0000000000000000
>   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 0000000000000000
>   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA1228
>   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007EFA0E60
>   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=000000007DC28000, EntryPoint=000000007DC2B917) !!!!
> 
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> 
> Fixes: 00d5d5ce23e6 ("work around Clang generating .data.rel.ro section for init-only files")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 14 deletions(-)
> ---
> Changes since v1:
> - added "Fixes:" tag;
> - fixed cast style change.
> 
> Changes since v2:
> - wrap long line.

And what about the Fixes: tag?

Jan

