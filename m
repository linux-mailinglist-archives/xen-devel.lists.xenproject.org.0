Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FDFA6B496
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 07:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923337.1326875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvWAl-0005ED-EC; Fri, 21 Mar 2025 06:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923337.1326875; Fri, 21 Mar 2025 06:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvWAl-0005Co-9N; Fri, 21 Mar 2025 06:48:03 +0000
Received: by outflank-mailman (input) for mailman id 923337;
 Fri, 21 Mar 2025 06:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvWAj-0005CU-41
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 06:48:01 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6de326ee-0620-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 07:48:00 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso10792195e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 23:48:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d440ed786sm68119455e9.38.2025.03.20.23.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 23:47:58 -0700 (PDT)
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
X-Inumbo-ID: 6de326ee-0620-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742539680; x=1743144480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qSpNGjUIZOKJHeo46MPPnnJw/URyrGIiw+c3ioSYQo8=;
        b=V2Lacqg2OSU9rCfCFKXnkizyQ09PjJqh63vMluwdFrx5F9PRRCL0fzG+cKtdTWSG+5
         muk56x6wfXoh5ksBKotuCbP6kb4qLN+3mcn3OhFazIBjk0mhgrk0OoIQTBFwbPiLySq2
         CtgEZ1dLhDZvDJVdgs3uo4DlRidax4d5be0dAxzlxKMfhpflNAeqzV9XTsKS4xuXRWbu
         oC0QVyxOm9m/xabt5D5rfk959Vhan4l877j1ze4mDvPBbyV0yAakTs4AW7KzZcT96B0g
         A0S6oGxJfEfx/xhNe62hrKvDYvJXuQk0Q6aL0H8tqZqamMuZHVCQX6acTFPyaxTG6gzF
         1zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742539680; x=1743144480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSpNGjUIZOKJHeo46MPPnnJw/URyrGIiw+c3ioSYQo8=;
        b=RDRPtmiR68k0ZzbZhd1+r+C4rxOZe86KlGFHs+grjcbUFLp2GfiDARz6xbU92IezDK
         LuStvdCHKWGUxFQwOdlMMP8LvS4vrfQcj5FuxbVpF2O73FD218MDV/I2FpAW9oiDr0Pm
         SIv6+MvWLEXW10ZMxWj4u2zWSgKacPAderoYtn87wOVMppf5ocommdFfRJ1rEbeDn1uG
         nKdAK9tSkgnF/mxAbwykkSj6SHnSBBxq1wQ8etDNVkdGe68kPR4gLnIiFzWnXVGVObYO
         t3jcRiUFOmks9EebKIxQDYDKpR4SOUn+TMgkNm5EXC4xBXt4IZn71Ww7e3dAX5oOSg4I
         t9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVC4R8LHi7xO4hr7npRkGKukaxyr5R8tmoIxExsVbiQ+slKFgKocv8sa0xawc4Hw96pQER854v4ogw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuoCD1nSlcCTHp9u2raGAnPbCSTN1l7RJf7T9uGvs1zUKcJ5XO
	UINPOGrf/lJGDBtNQSjDbYmGvCnMPHOka1kC1nWja/JGxJ6Xd/z6fWW6iLQkWA==
X-Gm-Gg: ASbGncvcf/TZmb7YBKRKzmuS1ORIVvDmFIxOPlk/J9ImmxbpjLT8SoAxE7XxKl937cD
	Siz03MNlS2rDhqGR/MT+0+RMPmnSWyHNuaqj0KWYERyNnOFu1U60GlcX5WJX9WJvSGaW+J5OQdt
	qjhSfToDCWSWrxjfkBLmnnDonAKc6YYY3gu4ngQqVT2G8GTgQchnz0pBClWyXRN8QyywxsoCF+u
	7Lxbc73Jeyl7q06abSnGYV209WUoyxD+YkjpQwTbxdkagIdwlw97t2XUlUkinMA87NqiuXiDYMd
	o242xXzU21oUhLx4D3wFc3Yi/Ww2is6ujMVBIL73TxURF21XSdGU+xbMKpSIESxsjrpu0BNv74S
	X9g7tCC25tXz1Md2AzeAEul/PNzv3qQ==
X-Google-Smtp-Source: AGHT+IH9T7/+vI7NqalVDK0rSPzQFwRpZ1zNOdt9NyXrR/Sx405tpkF26gLLWbDKe/86B+Mck07VzQ==
X-Received: by 2002:a05:600c:83cf:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43d509e6492mr16793275e9.4.1742539679480;
        Thu, 20 Mar 2025 23:47:59 -0700 (PDT)
Message-ID: <56e777aa-ab48-4f3f-bfae-5ef6dcba7486@suse.com>
Date: Fri, 21 Mar 2025 07:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <Z7jf_YojU9tQ1Or7@mail-itl>
 <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
 <Z7xxQHVdSGwig4hb@mail-itl>
 <CACHz=ZgHxvCJQyJe_NJFh3YYcuW0sey+qcOEv0O-XxC8daTo+A@mail.gmail.com>
 <Z79jhZ_BGEC6DYl4@mail-itl> <086f7e05-2cab-4a53-8ecb-dff7421e38bc@suse.com>
 <CACHz=ZjtjMyv5OmUT8dNHAzqrw5c7ij58quo1SuDc2ZBSjQRmw@mail.gmail.com>
 <CACHz=ZjLq8vVLtLL40DjcLV5wwxyatLdy4g3rq1ifSVcnATr8g@mail.gmail.com>
 <cd29d79c-fa6a-48a7-aefe-7e8abba9bf95@suse.com>
 <CACHz=ZjW8_sbHUAZtPXeG+Nc3CdKFgESkg2n3r7MWTqPBcWWBA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjW8_sbHUAZtPXeG+Nc3CdKFgESkg2n3r7MWTqPBcWWBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 21:10, Frediano Ziglio wrote:
> On Thu, Mar 20, 2025 at 3:15 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 20.03.2025 15:33, Frediano Ziglio wrote:
>>> On Thu, Mar 6, 2025 at 3:02 PM Frediano Ziglio
>>> <frediano.ziglio@cloud.com> wrote:
>>>>
>>>> On Thu, Mar 6, 2025 at 2:26 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>> On 26.02.2025 19:54, Marek Marczykowski-Górecki wrote:
>>>>>> On Mon, Feb 24, 2025 at 02:31:00PM +0000, Frediano Ziglio wrote:
>>>>>>> On Mon, Feb 24, 2025 at 1:16 PM Marek Marczykowski-Górecki
>>>>>>> <marmarek@invisiblethingslab.com> wrote:
>>>>>>>>
>>>>>>>> On Mon, Feb 24, 2025 at 12:57:13PM +0000, Frediano Ziglio wrote:
>>>>>>>>> On Fri, Feb 21, 2025 at 8:20 PM Marek Marczykowski-Górecki
>>>>>>>>> <marmarek@invisiblethingslab.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
>>>>>>>>>>> Although code is compiled with -fpic option data is not position
>>>>>>>>>>> independent. This causes data pointer to become invalid if
>>>>>>>>>>> code is not relocated properly which is what happens for
>>>>>>>>>>> efi_multiboot2 which is called by multiboot entry code.
>>>>>>>>>>>
>>>>>>>>>>> Code tested adding
>>>>>>>>>>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
>>>>>>>>>>> in efi_multiboot2 before calling efi_arch_edd (this function
>>>>>>>>>>> can potentially call PrintErrMesg).
>>>>>>>>>>>
>>>>>>>>>>> Before the patch (XenServer installation on Qemu, xen replaced
>>>>>>>>>>> with vanilla xen.gz):
>>>>>>>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>>>>>>>>>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>>>>>>>>>>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>>>>>>>>>>>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
>>>>>>>>>>>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>>>>>>>>>>>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>>>>>>>>>>>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>>>>>>>>>>>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>>>>>>>>>>>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>>>>>>>>>>>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>>>>>>>>>>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>>>>>>>>>>>   GS   - 0000000000000030, SS  - 0000000000000030
>>>>>>>>>>>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>>>>>>>>>>>   CR4  - 0000000000000668, CR8 - 0000000000000000
>>>>>>>>>>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>>>>>>>>>>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>>>>>>>>>>>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>>>>>>>>>>>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>>>>>>>>>>>   FXSAVE_STATE - 000000007FF0BDE0
>>>>>>>>>>>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!
>>>>>>>>>>>
>>>>>>>>>>> After the patch:
>>>>>>>>>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>>>>>>>>>>   Test message: Buffer too small
>>>>>>>>>>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>>>>>>>>>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>>>>>>>>>>
>>>>>>>>>>> This partially rollback commit 00d5d5ce23e6.
>>>>>>>>>>>
>>>>>>>>>>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
>>>>>>>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>>>>>>
>>>>>>>>>> I tried testing this patch, but it seems I cannot reproduce the original
>>>>>>>>>> failure...
>>>>>>>>>>
>>>>>>>>>> I did as the commit message suggests here:
>>>>>>>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d6911c448eb886990f33d4380b5646617a982
>>>>>>>>>>
>>>>>>>>>> With blexit() in PrintErrMesg(), it went back to the bootloader, so I'm
>>>>>>>>>> sure this code path was reached. But with blexit() commented out, Xen
>>>>>>>>>> started correctly both with and without this patch... The branch I used
>>>>>>>>>> is here:
>>>>>>>>>> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-tests?ref_type=heads
>>>>>>>>>>
>>>>>>>>>> Are there some extra condition to reproduce the issue? Maybe it depends
>>>>>>>>>> on the compiler version? I guess I can try also on QEMU, but based on
>>>>>>>>>> the description, I would expect it to crash in any case.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Did you see the correct message in both cases?
>>>>>>>>> Did you use Grub or direct EFI?
>>>>>>>>>
>>>>>>>>> With Grub and without this patch you won't see the message, with grub
>>>>>>>>> with the patch you see the correct message.
>>>>>>>>
>>>>>>>> I did use grub, and I didn't see the message indeed.
>>>>>>>> But in the case it was supposed to crash (with added PrintErrMesg(),
>>>>>>>> commented out blexit and without your patch) it did _not_ crashed and
>>>>>>>> continued to normal boot. Is that #PF non-fatal here?
>>>>>>>>
>>>>>>>
>>>>>>> Hi,
>>>>>>>    I tried again with my test environment.
>>>>>>> Added the PrintErrMesg line before efi_arch_edd call, I got a #PF, in
>>>>>>> my case the system hangs. With the fix patch machine is rebooting and
>>>>>>> I can see the message in the logs.
>>>>>>> I'm trying with Xen starting inside Qemu, EFI firmware, xen.gz
>>>>>>> compiled as ELF file. Host system is an Ubuntu 22.04.5 LTS. Gcc is
>>>>>>> version 11.4.
>>>>>>
>>>>>> My test was wrong, commenting out blexit made "mesg" variable unused.
>>>>>> After fixing that, I can reproduce it on both QEMU and real hardware:
>>>>>> without your patch it crashes and with your patch it works just fine.
>>>>>> While there may be more places with similar issue, this patch clearly
>>>>>> improves the situation, so:
>>>>>>
>>>>>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>>
>>>>> This had to be reverted, for breaking the build with old Clang. See the
>>>>> respective Matrix conversation.
>>>>
>>>> To sum up the failure is:
>>>>
>>>>     clang: error: unknown argument: '-fno-jump-tables'
>>>
>>> Now that the minimum clang version supports this option, can this
>>> change be applied?
>>
>> Not sure. I for one would expect that we actively reject building with
>> too old tool chains then, which is yet to be carried out. Plus I think
>> you'd want to re-submit, with all tags dropped. The change was wrong to
>> go in at that earlier point, and hence any such tags weren't quite
>> accurate.
> 
>   not sure what you intend with "tags" in the above sentence. Git tags ?

Acks and R-b-s.

> Not sure we need to carry on using old tool chains if we decide to
> bump the minimal versions.

I fear I don't understand this remark in this context. In any event,
Andrew meanwhile has sent a patch to the effect of what my comment was
saying.

Jan

