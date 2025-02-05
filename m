Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F80A287E3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 11:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882081.1292257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcaT-0006Q9-Vh; Wed, 05 Feb 2025 10:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882081.1292257; Wed, 05 Feb 2025 10:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcaT-0006OI-T1; Wed, 05 Feb 2025 10:24:53 +0000
Received: by outflank-mailman (input) for mailman id 882081;
 Wed, 05 Feb 2025 10:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnKU=U4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tfcaS-0006OC-PF
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 10:24:52 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e756f7e-e3ab-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 11:24:50 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso1388638a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 02:24:50 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a5a26bsm1070862666b.183.2025.02.05.02.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:24:49 -0800 (PST)
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
X-Inumbo-ID: 6e756f7e-e3ab-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738751090; x=1739355890; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KLeuVEVFXkBnwrVVWHEZJXQGU90Hf4BCsU9AgcjzyU=;
        b=XNTQSHrUtw2xQXz3fUbxmG59OLRS0KWaBm1mZdXj7KmW/WYwP6St3eRDhudKvqnvbp
         efRPDDwPSESeuXYz7nu9BYtYeNtng2xsiD+2wMJtA+3hXPBS6Ue+xDMIM/LUTWttI+Tk
         /p4Q3I1aRrs+UyLv5Hqmpbh+I07NXJU0XNzuAwwr1Al11k1Y+JMOYzXalNk9nkB21eox
         ag4amibVIMwFwiitHYIKAt603Dag57d+Nk14eeJH4uCuNX4jIAxXEwXgadwOspE21Mj/
         Hk15xj2mOvr1dL9XiOFsHUX7opCwYVz1uIIgCKyVSxIPVwmLL7iYSMBT6Sn1MZIJ9SEs
         Dpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751090; x=1739355890;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/KLeuVEVFXkBnwrVVWHEZJXQGU90Hf4BCsU9AgcjzyU=;
        b=kSu9bD8Ckkl1lSmYvQc2K04nflLas9P98f8nPSBZ0sv+Qt0hmg8fgh8U6ywokoSmlI
         5wUqT3CXjr9hpwFpcVKVMa1sIjLYi1toFQPmFm466gEs+xACSUj8KvAA2PbqwqEt0sHb
         MloI9aczw4QQGb9mBzh1s3DCQ/QRmA4HaK8F3Qzx7yYZwfL+2caX6h8k0slndd3vdkCv
         QvQkoh4FMu1ZHseuj2zP5SUVPQSxbQmq3tx/ejKWmrZMkJd/JQ1YpA7dVVvoxtDxfwRI
         jRxHtHKnXiw6Ss17mRVwFNppAh2MUalPs+rKWsf24E5FESz4cyqksXKVFaf4PWNZ+/tT
         BkZA==
X-Gm-Message-State: AOJu0YywyYFpLYwtGBo9Gc2Agxs4xkik2AiMsoTKBzeXmzo8rQu0/u3j
	Sukpl9exTibO5yv3Y6wC4NF+ZEbAlKILIm0IFZ53M+0YDZFW5ZU4
X-Gm-Gg: ASbGncspKLKkuy3VJvM/y9BV47K85ZxWa/KDw9QFsISEH0LT1wMMXS/mmbo9jExhXLL
	J+RCLod16zQvVXUewk6/smgi34iwErAwj+sHnbFItU4OWlvpr4MemHvV0KPOrMgZv9dmlrZHcc8
	cobUCNrBWFBCGLFStOoyYsm1XF8zv/YoCFb7xsT+/+F9Pz/rc50pLUm761/hDPYg0TrrRKhBOkk
	PnyL4liA+2SA7cGI1RTvDVAsxJLxEdVTVGPcu0bUnLaELNPP6aJoBNHixn9pEpGuwdVrJJ0HfBT
	/cpOnfiTNArWhhCSuS3kaeVpOYtq
X-Google-Smtp-Source: AGHT+IEE9SyJVGtKMUV8oftz/JCQvj46spRDLlHFJTcd44pyLIp+n2YfLSBH9d19v5cOec0eKUNErA==
X-Received: by 2002:a17:907:3f86:b0:ab6:f4eb:91aa with SMTP id a640c23a62f3a-ab7483faee0mr885474966b.10.1738751089585;
        Wed, 05 Feb 2025 02:24:49 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------acMyzx8xKOmOQL7gzEv1lEMU"
Message-ID: <5c9ab6a7-2095-4f7c-8e5b-1942ad54420d@gmail.com>
Date: Wed, 5 Feb 2025 11:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 v5] Avoid crash calling PrintErrMesg from
 efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20250122101407.52282-1-frediano.ziglio@cloud.com>
 <9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com>

This is a multi-part message in MIME format.
--------------acMyzx8xKOmOQL7gzEv1lEMU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/4/25 2:07 PM, Jan Beulich wrote:
> On 22.01.2025 11:14, Frediano Ziglio wrote:
>> Although code is compiled with -fpic option data is not position
>> independent. This causes data pointer to become invalid if
>> code is not relocated properly which is what happens for
>> efi_multiboot2 which is called by multiboot entry code.
>>
>> Code tested adding
>>     PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
>> in efi_multiboot2 before calling efi_arch_edd (this function
>> can potentially call PrintErrMesg).
>>
>> Before the patch (XenServer installation on Qemu, xen replaced
>> with vanilla xen.gz):
>>    Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>    Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
>>    ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>>    RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
>>    RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>>    RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>>    RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>>    R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>>    R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>>    R14  - 000000007EA33328, R15 - 000000007EA332D8
>>    DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>>    GS   - 0000000000000030, SS  - 0000000000000030
>>    CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>>    CR4  - 0000000000000668, CR8 - 0000000000000000
>>    DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>>    DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>>    GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>>    IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>>    FXSAVE_STATE - 000000007FF0BDE0
>>    !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!
>>
>> After the patch:
>>    Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>>    Test message: Buffer too small
>>    BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>    BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>>
>> This partially rollback commit 00d5d5ce23e6.
>>
>> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
>> Signed-off-by: Frediano Ziglio<frediano.ziglio@cloud.com>
> I expect we want this in before the release. Oleksii? Maintainers?

Interesting it is a fix for a ~3 years old bug ( if to look at when9180f5365524 is introduced ) so it seems it happens not often. Anyway, I 
agree that we want this fix before the release: R-Acked-by: Oleksii 
Kurochko <oleksii.kurochko@gmail.com> Thanks. ~ Oleksii

>
> Jan
--------------acMyzx8xKOmOQL7gzEv1lEMU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/4/25 2:07 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com">
      <pre wrap="" class="moz-quote-pre">On 22.01.2025 11:14, Frediano Ziglio wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Although code is compiled with -fpic option data is not position
independent. This causes data pointer to become invalid if
code is not relocated properly which is what happens for
efi_multiboot2 which is called by multiboot entry code.

Code tested adding
   PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
in efi_multiboot2 before calling efi_arch_edd (this function
can potentially call PrintErrMesg).

Before the patch (XenServer installation on Qemu, xen replaced
with vanilla xen.gz):
  Booting `XenServer (Serial)'Booting `XenServer (Serial)'
  Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
  ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
  RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210246
  RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
  RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
  RSI  - FFFF82D040467CE8, RDI - 0000000000000000
  R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
  R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
  R14  - 000000007EA33328, R15 - 000000007EA332D8
  DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
  GS   - 0000000000000030, SS  - 0000000000000030
  CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
  CR4  - 0000000000000668, CR8 - 0000000000000000
  DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
  DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
  GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
  IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
  FXSAVE_STATE - 000000007FF0BDE0
  !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=000000007EE20000, EntryPoint=000000007EE23935) !!!!

After the patch:
  Booting `XenServer (Serial)'Booting `XenServer (Serial)'
  Test message: Buffer too small
  BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
  BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)

This partially rollback commit 00d5d5ce23e6.

Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platforms")
Signed-off-by: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I expect we want this in before the release. Oleksii? Maintainers?</pre>
    </blockquote>
    <pre>Interesting it is a fix for a ~3 years old bug ( if to look at when <span
    style="white-space: pre-wrap">9180f5365524 is introduced ) so it seems it happens not often.
Anyway, I agree that we want this fix before the release:
R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</span></pre>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:9d7b6706-7415-43d5-a66e-650eb67437fa@suse.com">
      <pre wrap="" class="moz-quote-pre">

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------acMyzx8xKOmOQL7gzEv1lEMU--

