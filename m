Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF72A91616
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957056.1350251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KEf-0006xW-6v; Thu, 17 Apr 2025 08:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957056.1350251; Thu, 17 Apr 2025 08:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KEf-0006vW-42; Thu, 17 Apr 2025 08:04:37 +0000
Received: by outflank-mailman (input) for mailman id 957056;
 Thu, 17 Apr 2025 08:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5KEe-0006vQ-1n
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:04:36 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99cdc403-1b62-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 10:04:35 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso280704f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 01:04:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33ef121dsm27363925ad.17.2025.04.17.01.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 01:04:33 -0700 (PDT)
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
X-Inumbo-ID: 99cdc403-1b62-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744877074; x=1745481874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GyoGNtbs8v7rbfSM4kKkxkuhlRl3vlj9mg+iqWK8Y3A=;
        b=XK2VwZ31U+fT+N3JuejaVcHHjC5Mxc1N85lsd/F+H81B76wNU9l3iITxT8cndb64W/
         mbIRROe2/28Pmrk6llmH41yBUi/eegkwyyDSR5i8DXo0erHPFhRRqthXtUe4dGLJEbl4
         172GDfrwUknEK5R31dkoTxdRu3hVYQBqPeBep+vr/6wYGa4oDo7Bt4cE4AAZc2cqcFOg
         YuVgvE/mLH2JqD/ZI6iRTkmhtxPcZASQp/UzGLm6S/92wSw1ZidFka8lHkN2Y09ydRzr
         8kBuknPsOlhuFtYhmh0wwdKCt4q3tzLrkSVqHJ5+GkybvM2eea5jAPUf4rQljIQ0Xmfg
         y/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877074; x=1745481874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyoGNtbs8v7rbfSM4kKkxkuhlRl3vlj9mg+iqWK8Y3A=;
        b=jS2COs38j4sApdbTYa9+dmYPVFeT6V4U40VFXEjY6soQtGMJgKP6QEFzVy9OqhYwdI
         u4WH7UAoFjKSslJoEOeUXjbzgnUnqROhhn28VG8woN1K99mWqXred2q+vBti/+WDmxbi
         AlEB3U9JggtrR6Gr+cRsjfKDzJyXpFoPx7jpRBIktmTBAtIU7qZOgY6AkMUOabNDzHYS
         INdSAlWpO/PuRz0PyHSunmjIIFOvsp1YSwWLuXceMck8A3xsHtb0htXILuNAfIAI22Rz
         9VGnl95MmJQ8KBDk2xOifkS5YqAKnD28iXTkxDc++uyFB2B/U+xyRTY1jsrl3YNbRV8V
         9KFg==
X-Gm-Message-State: AOJu0YzgqZMrckSDXfgXb15skIp1Wz7YspcHIq5ACm21UWzxTZ3AZNp/
	PJKI2g/d+qLLi0OQaWmiNLhiFox9FyxcJeCFbviF6NUwcCzMhNS5fo6Ux9qY1g==
X-Gm-Gg: ASbGnctwb0u4kIlocr+ZN0OUC0IAXLFSUFXHeMsUtPUpG24lyp64hBHHn/0A+W6CIqf
	MZV9c+KrCIDC+oFYJItlq0yIBwIlSMQPK+UG+4cHXvgIkAH85YMD07UMQtNl08dLUXi+dKSlnV3
	eCNG+pg9HjcSkQDNhYcaW3ANSIUnDxORxD2HI/bBa3E7wui806vVo50kM3UO/BG2RNPZbeWqeOQ
	9gRrSWHGhGmsxfto9Dh8q5l+Z8jsp1SwglyQYrLzzRie3JxX+9SXNFgA1s2YBQpPVEjgWzudbfZ
	siU3IdO18AKG4Rl0uZHjTvq9aHmFAccaGSYDfM8zaUZu9JIWUO6svptwyW6Q4BGkyF6FEf2otgP
	njWyIOoRfebF2nXGzdNcrOR+dktEoCZd7aXaD
X-Google-Smtp-Source: AGHT+IEpSAkU1Z8eVmj0NUryj6wdth2U7nfx4deswh9PwS6XhUhCHh0OqM5cch6EFTvicPBytEz1Tw==
X-Received: by 2002:a05:6000:40de:b0:391:487f:282a with SMTP id ffacd0b85a97d-39ee5bb1bd5mr3416048f8f.50.1744877074526;
        Thu, 17 Apr 2025 01:04:34 -0700 (PDT)
Message-ID: <4ee081e6-dbf7-4e30-a17d-9ea27fb6fb17@suse.com>
Date: Thu, 17 Apr 2025 10:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] Avoid crash calling PrintErrMesg from efi_multiboot2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250321103258.37425-1-frediano.ziglio@cloud.com>
 <aABxr9W8_L3sQBHh@mail-itl>
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
In-Reply-To: <aABxr9W8_L3sQBHh@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2025 05:12, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 21, 2025 at 10:32:58AM +0000, Frediano Ziglio wrote:
>> Although code is compiled with -fpic option data is not position
>> independent. This causes data pointer to become invalid if
>> code is not relocated properly which is what happens for
>> efi_multiboot2 which is called by multiboot entry code.
>>
>> Code tested adding
>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
>> in efi_multiboot2 before calling efi_arch_edd (this function
>> can potentially call PrintErrMesg).
>>
>> Before the patch (XenServer installation on Qemu, xen replaced
>> with vanilla xen.gz):
>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
>>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>>   GS   - 0000000000000030, SS  - 0000000000000030
>>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>>   CR4  - 0000000000000668, CR8 - 0000000000000000
>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>>   FXSAVE_STATE - 000000007FF0BDE0
>>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!
>>
>> After the patch:
>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>   Test message: Buffer too small
>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>
>> This partially rollback commit 00d5d5ce23e6.
>>
>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> -no-jump-tables is available since clang 3.9.0 (and since GCC 4.1.0), so
> with upgraded base toolchain requirements it's safe to commit this now.

And is therefore not eligible for backporting, despite the Fixes: tag.

> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Committed.

Jan

