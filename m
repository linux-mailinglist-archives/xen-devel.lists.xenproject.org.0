Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF9E98754C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 16:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805571.1216703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpJx-0005Xz-5m; Thu, 26 Sep 2024 14:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805571.1216703; Thu, 26 Sep 2024 14:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpJx-0005Vi-37; Thu, 26 Sep 2024 14:18:17 +0000
Received: by outflank-mailman (input) for mailman id 805571;
 Thu, 26 Sep 2024 14:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stpJw-0005VZ-9r
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 14:18:16 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b80275b-7c12-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 16:18:15 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so131534766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 07:18:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bcccsm2297166b.173.2024.09.26.07.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 07:18:14 -0700 (PDT)
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
X-Inumbo-ID: 2b80275b-7c12-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727360295; x=1727965095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8OfibIq/5ee+V0nuhTIcHj8+6/ABNXE4K1yVQC6qVV4=;
        b=MIqIoLoaZiwo4/zPWCea7/zKJfyMql15Em4Xw2VoTkqmo5+KEMD8xyxF/3ebxvE393
         H5siRdhPDmGfy1BBctayQfg4pywNjBnnsSoUkV7xLwn+wv57IzpcsIHe0UdxSkdyFabx
         3rlG8VFQV9ZJoXejlZklieNj+SY9jBZnJ5KCOhMT3i5c8bUKlDhHgsDmceCEVHiGrn87
         GENsS7BbE1ts4wUEILVysN2SA6NDlXd1lbPoO2pMoh7wt1xubtoGFOP09cnLHYAzchja
         /2yRPdRCraLDUv0BgF3xz48q2oLYsHaECSUStnpHU8SwWWkTZgAvMCUpAz8GyzUaqrBp
         ZNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360295; x=1727965095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OfibIq/5ee+V0nuhTIcHj8+6/ABNXE4K1yVQC6qVV4=;
        b=pBoSoQURLOz2tf/wRyKVnOPBws+t+jpfmi2jQ7sGuPE/n5l/x9QIM7rZ7cMk/gpWro
         VR7Qb8rXOmIWDIwEbi5nBhnAP5987k9Bazd6Rdrm0c3AD+PpF6PqjYwO8bPsE/aIcKAY
         6gwgwZ3tgbDFRwtH6UeNOaz5HLGduJx8ycNw/Ym0E+nHienHF8BDAOoseiWEF22DNgGh
         sWd9BDIT8+TNQ23Fc1uOkpwW2APqOBKLTT68Z3CvhuVdEtP09mhCfMaCaydoghEdghk5
         6BFwjtsAxVUqB9I0veNO9Y6mxnrvflxYKKEm00AsqySDm8c8zCf1VXO2+EMFSn2MpJfL
         XV/w==
X-Gm-Message-State: AOJu0YyLgCbfCM3Y7IHcsf3mMmPt/zFoiFyhEf9BIRJylsnjGYj6exX+
	IVsyj8lo5lSr8LZfqAFrn/E6gbx5aUnG7E3I3Q6Gc9eI7azYeflKJ+mvEwROjQ==
X-Google-Smtp-Source: AGHT+IFJ0267b6G1Hs5U0hQ85uzodwpoamvDDTUjUlzLD17kXoLBkJfdvSZSNS1zcPLtxTonjMB/Kw==
X-Received: by 2002:a17:907:7b9f:b0:a8a:7027:c015 with SMTP id a640c23a62f3a-a93a0664dd9mr675727766b.56.1727360294828;
        Thu, 26 Sep 2024 07:18:14 -0700 (PDT)
Message-ID: <09cb0ef1-3969-42cc-aa2b-06a565892925@suse.com>
Date: Thu, 26 Sep 2024 16:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
 <ZvVhIYMTuRU2Erqe@mail-itl> <4fbd5e3e-8dfe-4c7b-9737-50f4a5dd224b@citrix.com>
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
In-Reply-To: <4fbd5e3e-8dfe-4c7b-9737-50f4a5dd224b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.09.2024 16:11, Andrew Cooper wrote:
> On 26/09/2024 2:26 pm, Marek Marczykowski-Górecki wrote:
>> On Mon, Aug 19, 2024 at 03:29:52PM +0100, Frediano Ziglio wrote:
>>> Although code is compiled with -fpic option data is not position
>>> independent. This causes data pointer to become invalid if
>>> code is not relocated properly which is what happens for
>>> efi_multiboot2 which is called by multiboot entry code.
>>>
>>> Code tested adding
>>>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
>>> in efi_multiboot2 before calling efi_arch_edd (this function
>>> can potentially call PrintErrMesg).
>>>
>>> Before the patch (XenServer installation on Qemu, xen replaced
>>> with vanilla xen.gz):
>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>>>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>>>   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 0000000000210246
>>>   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 0000000000000000
>>>   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 0000000000000000
>>>   RSI  - FFFF82D040467A88, RDI - 0000000000000000
>>>   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 0000000000000000
>>>   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA1228
>>>   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
>>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>>>   GS   - 0000000000000030, SS  - 0000000000000030
>>>   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC01000
>>>   CR4  - 0000000000000668, CR8 - 0000000000000000
>>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>>>   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
>>>   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
>>>   FXSAVE_STATE - 000000007EFA0E60
>>>   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=000000007DC28000, EntryPoint=000000007DC2B917) !!!!
>>>
>>> After the patch:
>>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>>   Test message: Buffer too small
>>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>>
>>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> I was hoping it would fix also an issue with xen.efi as the crash is
>> pretty similar
>> (https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2366835136),
>> but it seems to be something different.
>>
>> Anyway, 
>>
>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> While I hate to drag this on further, there's a very relevant observation in
> 
> https://lore.kernel.org/xen-devel/20240925150059.3955569-31-ardb+git@google.com/T/#u
> 
> which was posted yesterday.  Exactly the same is true of the early MB2
> code calling into regular EFI code, and I wonder if it's causing the
> other issue too.
> 
> I suspect following that pattern will be rather more robust.  Thoughts?

That builds upon there being a secondary mapping, which isn't the case here
I'm afraid.

Jan

