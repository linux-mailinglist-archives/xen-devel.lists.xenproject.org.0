Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82A98752D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 16:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805564.1216694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpDT-0004ZL-HL; Thu, 26 Sep 2024 14:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805564.1216694; Thu, 26 Sep 2024 14:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpDT-0004X8-Ds; Thu, 26 Sep 2024 14:11:35 +0000
Received: by outflank-mailman (input) for mailman id 805564;
 Thu, 26 Sep 2024 14:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvAu=QY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stpDS-0004X2-BW
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 14:11:34 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0914b2-7c11-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 16:11:32 +0200 (CEST)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so130946766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 07:11:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947fdfsm1742266b.102.2024.09.26.07.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 07:11:29 -0700 (PDT)
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
X-Inumbo-ID: 3b0914b2-7c11-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727359891; x=1727964691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tfKPX+9uqUPoSc6iGlbBro5CfIpuQ4Ck2KqWwMp+nFY=;
        b=X1Qcnm+5Xp9d/nhJgH1WcNt6dn7KN9/kWZv+M+QyPkJU6KLdF96AgflD7ozKWH7p/p
         TcmMa2sB8KttVu9DY1hDeJ8AozwlGsmMbryI+K+8BnjEkaywbH/V2MIrjN0XCO2ULAgP
         yXnxQAbeGjHGTmBcBVHfuVLi0veEzzkf7II20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727359891; x=1727964691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfKPX+9uqUPoSc6iGlbBro5CfIpuQ4Ck2KqWwMp+nFY=;
        b=pL24wdVg/APZGAgz1KEs/xi0GnygKj40tsuH3k0Rch9ZVcbyGKwtODDkAc8cJJOJZo
         rr+qQtlGI3acJ+tgCXApzuvX7XUBkpLclf2qZpSieeIWCw16LUhlT8SSxDHJI0RC9RcF
         QBaQhBLxBwGCStkcgrG/aGHNPa8vOsDB82+NIAmWCKNIwhqfIxMMEy7BYVGp2eQegdz3
         tlx5pplQbwI9UWWbGdSMTB++sG3FdXqdvkg1tM8MIGiqvm1pw6qTWnbD4PuiZP7Bwh8d
         wKlVFRdPHdZa+xCxq/OLVakFHs8oL8/jjiBylDA9D3R0QM0pZQ/GPgGTQ2jzER1tsOXE
         gXUg==
X-Gm-Message-State: AOJu0YzBvfHJ9teKfVbZkwrDbSOpfuRuFHsJnAZSCsPe9rIKZnmIFGsC
	JH03RHzdm2h2ydD9ZPykE2gItZQ9YgrdcFRWx0UVKLONHucM0gVBhv+FSzetFsbiW4iX5AYv8GL
	bgfv8Nw==
X-Google-Smtp-Source: AGHT+IE+Ms8ySvIVstqQsBanWm4bmnI4GDwYSo62UlXPa0N0BEuFU8MuYGIrH6hC5Af6OWTspFvduw==
X-Received: by 2002:a17:907:7f94:b0:a8b:6ee7:ba12 with SMTP id a640c23a62f3a-a93a03c5fe6mr646260666b.27.1727359891302;
        Thu, 26 Sep 2024 07:11:31 -0700 (PDT)
Message-ID: <4fbd5e3e-8dfe-4c7b-9737-50f4a5dd224b@citrix.com>
Date: Thu, 26 Sep 2024 15:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
 <ZvVhIYMTuRU2Erqe@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZvVhIYMTuRU2Erqe@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/09/2024 2:26 pm, Marek Marczykowski-Górecki wrote:
> On Mon, Aug 19, 2024 at 03:29:52PM +0100, Frediano Ziglio wrote:
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
>>   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 0000000000210246
>>   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 0000000000000000
>>   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 0000000000000000
>>   RSI  - FFFF82D040467A88, RDI - 0000000000000000
>>   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 0000000000000000
>>   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA1228
>>   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
>>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>>   GS   - 0000000000000030, SS  - 0000000000000030
>>   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC01000
>>   CR4  - 0000000000000668, CR8 - 0000000000000000
>>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>>   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
>>   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
>>   FXSAVE_STATE - 000000007EFA0E60
>>   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=000000007DC28000, EntryPoint=000000007DC2B917) !!!!
>>
>> After the patch:
>>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>   Test message: Buffer too small
>>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>
>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> I was hoping it would fix also an issue with xen.efi as the crash is
> pretty similar
> (https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2366835136),
> but it seems to be something different.
>
> Anyway, 
>
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

While I hate to drag this on further, there's a very relevant observation in

https://lore.kernel.org/xen-devel/20240925150059.3955569-31-ardb+git@google.com/T/#u

which was posted yesterday.  Exactly the same is true of the early MB2
code calling into regular EFI code, and I wonder if it's causing the
other issue too.

I suspect following that pattern will be rather more robust.  Thoughts?

~Andrew

