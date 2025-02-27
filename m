Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04722A476E8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897887.1306513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYj2-0007ka-D0; Thu, 27 Feb 2025 07:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897887.1306513; Thu, 27 Feb 2025 07:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYj2-0007jA-AG; Thu, 27 Feb 2025 07:54:32 +0000
Received: by outflank-mailman (input) for mailman id 897887;
 Thu, 27 Feb 2025 07:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnYj1-0007j4-Ea
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:54:31 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e86459-f4e0-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 08:54:30 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390dc0a7605so320434f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 23:54:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485d906sm1182282f8f.90.2025.02.26.23.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 23:54:28 -0800 (PST)
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
X-Inumbo-ID: 12e86459-f4e0-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740642869; x=1741247669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pC9tj0kCEzPxSrhOcqsNC1b/uhTXtG8oQEDuaSBV5IE=;
        b=L1bhOzvp43z9Ege2o9r7B6fO+OYhZG0Scy//FkAyOMvgogNdhJTR9F9gpJ2hxZO+fU
         ibOSNHQQfoUA+LJqWE3pEfH9P0yz12qQpy4B6oFng3gojguMAtDsUB18VDnOxOKv1CmM
         whKXGatgYQdEnV3SYmjOvoo4tYhtxRuMU9HksS2bfC4EMeM8McMUZCSukn8bTfWTdS3i
         zngnbbPwrjMdD78SYgC32BTpFtKI9tquyfENy8+9EWMCHLt9RGvhmna1AGpGojUzjVwe
         wti1ZgNlD9bMAvNHqtsyH9mrIabMjdj38lucOTjOi3h+ttjQ0OfnPnG0fzoGWmgx5hL5
         NPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642869; x=1741247669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pC9tj0kCEzPxSrhOcqsNC1b/uhTXtG8oQEDuaSBV5IE=;
        b=TEpw+y7xoZKSvljuZdgvE1P2zQMqytT0VIWRDuRG6wIvf/L0dr6Vt2oR7bZww0w1VH
         eRZKx4qP2vX+6Cw793jpYwZ4wCRN7JPxldTdZYnNfiHIFpmjr1tm6MGCj5HFot3u/kxT
         zsa1YycDVjJPJXQQ+YY6ZtaDZRl749blSdFKDeM+b6kNrZt0uQlB2YhDMhumPQnJ+oz6
         MAz+5CB6pmYkYnzY8djIMIV9qMbV71M3mn7jfji0Ti1f5yiaQvgyb5U0WRIVWI2WadoH
         9r9pdjqdfxHiCDJK6dBQeO7GiYrU6Qp83K6kqSfK0KeVnnWlf5yZu71y0rj0bKWaEb/h
         P1lA==
X-Gm-Message-State: AOJu0YzJQY1fVgEyDpcqWBQ8Z5HRvP3dF2yHoVI3NfOIRdGHCma8JV0L
	lBLXtoJQ2UijR78+bhjkIdapwhdxh6G5pZz4zpvKF3RLvzV5W/uZrqouxDfH4g==
X-Gm-Gg: ASbGncvi2pUWTkUNGcWkwW/1rtxG/j3NTJjEq2p4BI76XQ1+Q6Pgaisd3pKj6DUITN8
	VX5r2hbxZXNEIVidjze7HqWcounNEP4EJ1yd5lL7ZutzyIEy+RmfQIv4hs8iDb0jW1nZAd+ACAE
	pjlV5i6fXPPIOm9UkRaEdzJ5R2StIZATbv7L7LmhBYPHP/fDgTG4RnKgL+FpxQMUdJ8+bjDreIP
	rTlsUpRFfbHfKLE3SkP50RBeIFWcriV2pQ7SESNAPmGZHWniPm9Irymfzexd8EyYJVFdqvFYc7n
	Bcg8MyGnjjYnkZUB6Xyv8s7JkbNTleUSKLjBPufircpoyQhhvLwJ8Ylj9OdYa9TBu9ZRmm+znO/
	1M5ag+jLfNTI=
X-Google-Smtp-Source: AGHT+IEChshOKAU4LON8sEkFApfX4PF2F3+qEwhKRKIe7OMUHEFVpjlXOZgO1CR3OSaj5YU5NMGDiQ==
X-Received: by 2002:a5d:6d09:0:b0:38f:48ee:ddb1 with SMTP id ffacd0b85a97d-390cc605103mr9382359f8f.18.1740642869396;
        Wed, 26 Feb 2025 23:54:29 -0800 (PST)
Message-ID: <fa738207-e66d-4241-bf13-0cefb5eb55eb@suse.com>
Date: Thu, 27 Feb 2025 08:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl>
 <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
 <Z7xxQHVdSGwig4hb@mail-itl>
 <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>
 <Z79jhZ_BGEC6DYl4@mail-itl>
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
In-Reply-To: <Z79jhZ_BGEC6DYl4@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 19:54, Marek Marczykowski-Górecki wrote:
> On Mon, Feb 24, 2025 at 02:31:00PM +0000, Frediano Ziglio wrote:
>> On Mon, Feb 24, 2025 at 1:16 PM Marek Marczykowski-Górecki
>> <marmarek@invisiblethingslab.com> wrote:
>>>
>>> On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
>>>> On Fri, Feb 21, 2025 at 8:20 PM Marek Marczykowski-Górecki
>>>> <marmarek@invisiblethingslab.com> wrote:
>>>>>
>>>>> On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
>>>>>> Although code is compiled with -fpic option data is not position
>>>>>> independent. This causes data pointer to become invalid if
>>>>>> code is not relocated properly which is what happens for
>>>>>> efi_multiboot2 which is called by multiboot entry code.
>>>>>>
>>>>>> Code tested adding
>>>>>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
>>>>>> in efi_multiboot2 before calling efi_arch_edd (this function
>>>>>> can potentially call PrintErrMesg).
>>>>>>
>>>>>> Before the patch (XenServer installation on Qemu, xen replaced
>>>>>> with vanilla xen.gz):
>>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>>>>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>>>>>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>>>>>>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
>>>>>>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>>>>>>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>>>>>>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>>>>>>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>>>>>>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>>>>>>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>>>>>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>>>>>>   GS   - 0000000000000030, SS  - 0000000000000030
>>>>>>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>>>>>>   CR4  - 0000000000000668, CR8 - 0000000000000000
>>>>>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>>>>>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>>>>>>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>>>>>>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>>>>>>   FXSAVE_STATE - 000000007FF0BDE0
>>>>>>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!
>>>>>>
>>>>>> After the patch:
>>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>>>>>   Test message: Buffer too small
>>>>>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>>>>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>>>>>
>>>>>> This partially rollback commit 00d5d5ce23e6.
>>>>>>
>>>>>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
>>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>
>>>>> I tried testing this patch, but it seems I cannot reproduce the original
>>>>> failure...
>>>>>
>>>>> I did as the commit message suggests here:
>>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d6911c448eb886990f33d4380b5646617a982
>>>>>
>>>>> With blexit() in PrintErrMesg(), it went back to the bootloader, so I'm
>>>>> sure this code path was reached. But with blexit() commented out, Xen
>>>>> started correctly both with and without this patch... The branch I used
>>>>> is here:
>>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-tests?ref_type=heads
>>>>>
>>>>> Are there some extra condition to reproduce the issue? Maybe it depends
>>>>> on the compiler version? I guess I can try also on QEMU, but based on
>>>>> the description, I would expect it to crash in any case.
>>>>>
>>>>
>>>> Did you see the correct message in both cases?
>>>> Did you use Grub or direct EFI?
>>>>
>>>> With Grub and without this patch you won't see the message, with grub
>>>> with the patch you see the correct message.
>>>
>>> I did use grub, and I didn't see the message indeed.
>>> But in the case it was supposed to crash (with added PrintErrMesg(),
>>> commented out blexit and without your patch) it did _not_ crashed and
>>> continued to normal boot. Is that #PF non-fatal here?
>>>
>>
>> Hi,
>>    I tried again with my test environment.
>> Added the PrintErrMesg line before efi_arch_edd call, I got a #PF, in
>> my case the system hangs. With the fix patch machine is rebooting and
>> I can see the message in the logs.
>> I'm trying with Xen starting inside Qemu, EFI firmware, xen.gz
>> compiled as ELF file. Host system is an Ubuntu 22.04.5 LTS. Gcc is
>> version 11.4.
> 
> My test was wrong, commenting out blexit made "mesg" variable unused.
> After fixing that, I can reproduce it on both QEMU and real hardware:
> without your patch it crashes and with your patch it works just fine.
> While there may be more places with similar issue, this patch clearly
> improves the situation, so:
> 
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

While I would have preferred my comment to be addressed, I'll accept the
maintainer ack to have the patch go in as-is. Andrew, what about your
comment? Can you accept "this is an improvement" as enough of a reason
for it to go in despite not fully addressing the underlying issue? (In
case of no reply until after my upcoming vacation, I'll take this as
silent agreement and put the patch in.)

Jan

