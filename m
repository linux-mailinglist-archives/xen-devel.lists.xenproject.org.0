Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D2CF78F6
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 10:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195944.1513821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3Vl-0002Rp-GZ; Tue, 06 Jan 2026 09:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195944.1513821; Tue, 06 Jan 2026 09:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3Vl-0002PB-DK; Tue, 06 Jan 2026 09:37:57 +0000
Received: by outflank-mailman (input) for mailman id 1195944;
 Tue, 06 Jan 2026 09:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8PS=7L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vd3Vk-00024N-Ov
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 09:37:56 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 609d1fa4-eae3-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 10:37:54 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b728a43e410so135348366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 01:37:54 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d31e7sm182307666b.42.2026.01.06.01.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 01:37:53 -0800 (PST)
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
X-Inumbo-ID: 609d1fa4-eae3-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767692274; x=1768297074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxL8KR51DQ0oQopH+6Hbg+17A0zcRfk1vzTAao2LITM=;
        b=Ix7/Xgxh05Y0srr8BgPmNcOWICb3DUgmEq4Nyz4i8J4q7rUoL/MQqpa+BGSv9aoBFP
         CgnOW87mYl+yHFJUYEsWvKIW9fz+O+r6nben1QBrxdVWrYIpU9C/K7arAKg31eVYvn5Z
         StrjSM8BMA5BuyJRrCFytN208czRm57dlOGMLr5NrLAcMZQ7ailA6zSPP/nLuyZIM8PD
         4VDk74SF+pzGPzPBtfK69bHIS2oUbBx68Rhes5M74g8g9qqcZ5EmPZU29NjcGx+M6vTv
         N9mmVJXQWBLD43ISIjee28NC6HR2TVrin1RQjMSjRwFYvDAO0qVPEZ5veV2g48CuuDfi
         JGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692274; x=1768297074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxL8KR51DQ0oQopH+6Hbg+17A0zcRfk1vzTAao2LITM=;
        b=evidT/STiMJelsTkpHGVmCdzRSoWqMZsd+HnGK40dMRoupMzZbTMSaQtE0lBDvbzh6
         pq3q5JB78ZNT3WVfTI9NxPBipP819yjvnhHhEqFepkqajcSP6laETn/9aWT5xuRTqElD
         jW7KPoqg5sYbpFXFumgDVNrHMbPy6xsnN6uSDLoAwhz6Bc8DErV/SS70fovU/k+hDBku
         G4KATLoT5emys397M8zoJZ6ERZRcc/UVmFVPGKWj/PbEksbPFtyJKZHZcuR6T7w4/yiG
         p4mn4Ls+Yz/gGtWMCwxWKT4d1ZQnc1qA49ZOnwEl9bhz4zpNsl81K1wZXjGWuT+gSZgU
         krFw==
X-Forwarded-Encrypted: i=1; AJvYcCWx/riF+rvr9xLvAJ8MPmkZRd3WfSc/nHDT90cyPcCFsPAcf0mRNHG8NeF8T+Fejie2v9PiswZqMJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgtK2pPk1+hX2p3K/afUGut3Rhgkhsf0EqIuk1lR+L7zQ2e3z5
	vwlodxyug9iUSxiIqfn4bCb8rZFP45E9weH3zsFmLTjzGJPwcBAtq/s1
X-Gm-Gg: AY/fxX75nIKaU6RVlPwr/dB6jnDKQdhX5vMxxXQxN/uilQNY/f5JJNtzww85tWO6FOX
	BxsACG6Sxb9YjFf/twxMNsqOuG1Frw0qtmG4BH8hO0NPXgqW6/mJm4omxdgzkvtjEGTX0ktWq8i
	qT29EISDCyu2tnZRgjhn2mhdvDMADafMfe20XIGABYAsrvSkUoESfUuqlRXPe+gq9DW2a16HNlt
	taXS3LYOYPiMdYVxkbSmDNLSsYbQNXRQ/f3yfgtCQIjYeXucFEa5exWEgp4XS5PhVIm0Wjn8Gfx
	7ohwWGuYenA169GZI8iRJ8DxB9Ba1ayYnODwpIO4ZbSd3GBvZrqnrA5P9oByWO77ypsoVt1VD33
	hIuv2i2AhYGa505xReuyqXxnn8MSjwDwC0K9DWhRUcj2BhoXAqywySAaD1fpE3SObbDXYhjaxIG
	WtTSlm2n/A+9p65aPWkEKUmhaXzJAFT9R9lX1JMKHq3NZiVmvQ7GIAMG15Ny3/EiQ=
X-Google-Smtp-Source: AGHT+IHy7gB7FInof//tCEI+P/oCC7nIrId1JGSsJUOGQYF+fyUl78GcF9XI/ZSqUr2uiDm8vrCGjA==
X-Received: by 2002:a17:907:3f96:b0:b83:3770:a0e4 with SMTP id a640c23a62f3a-b8426be68f7mr249627266b.34.1767692274213;
        Tue, 06 Jan 2026 01:37:54 -0800 (PST)
Message-ID: <10a38a49-c19a-4bca-8616-1490c3ef6a57@gmail.com>
Date: Tue, 6 Jan 2026 10:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
 <724e78ef-b6ed-40db-a5c0-bd6473b6fe16@gmail.com>
 <8561e1dd-492b-4d51-bf10-0a4523c941a8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8561e1dd-492b-4d51-bf10-0a4523c941a8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/26 9:53 AM, Jan Beulich wrote:
> On 06.01.2026 09:43, Oleksii Kurochko wrote:
>> On 1/5/26 8:57 PM, Andrew Cooper wrote:
>>> The most recent xenoprof change was 300ef0cb4fde ("x86: Add Xenoprofile
>>> support for AMD Family16h") in 2013, despite there being 42 changes worth of
>>> other cleanup/rearranging since then.
>>>
>>> Oprofile themselves dropped Xen support in commit 0c142c3a096d ("Remove
>>> opcontrol and the GUI and processor models dependent on it") in 2014, as part
>>> of releasing version 1.0 and switching over to using operf based on the Linux
>>> perf_event subsystem.  Linux's version of this patch was merged in commit
>>> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
>>>
>>> Drop xenoprof and all supporting infrastructure, including the hypercall, the
>>> XSM hook and flask vectors which lose their only caller, and even shrinks
>>> struct domain by one pointer which wasn't properly excluded in
>>> !CONFIG_XENOPROF builds.
>>>
>>> Retain the public xenoprof.h header as it is ABI, but note that the
>>> functionality is removed.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Michal Orzel <michal.orzel@amd.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>
>>> Despite appearing to be architecture neutral, the internals of Xenoprof were
>>> entirely x86-specific.  Another curiosity is that only the VMX MSR hooks
>>> called passive_domain_do_{rd,wr}msr(), and I can't see how this was correct
>>> for SVM.
>>>
>>> The real reason for finally getting around to this is the number of MISRA
>>> violations reported by the eclair-x86_64-allcode job that I don't feel like
>>> fixing.
>>> ---
>>>    CHANGELOG.md                            |   3 +
>>>    docs/misc/xen-command-line.pandoc       |   6 -
>>>    tools/flask/policy/modules/dom0.te      |   2 -
>>>    xen/arch/x86/Makefile                   |   1 -
>>>    xen/arch/x86/cpu/vpmu_amd.c             |   7 -
>>>    xen/arch/x86/cpu/vpmu_intel.c           |   6 -
>>>    xen/arch/x86/hvm/svm/entry.S            |   1 -
>>>    xen/arch/x86/hvm/svm/svm.c              |   2 -
>>>    xen/arch/x86/hvm/vmx/vmx.c              |   9 -
>>>    xen/arch/x86/include/asm/xenoprof.h     |  95 ---
>>>    xen/arch/x86/oprofile/Makefile          |   6 -
>>>    xen/arch/x86/oprofile/backtrace.c       | 145 ----
>>>    xen/arch/x86/oprofile/nmi_int.c         | 485 ------------
>>>    xen/arch/x86/oprofile/op_counter.h      |  41 -
>>>    xen/arch/x86/oprofile/op_model_athlon.c | 547 -------------
>>>    xen/arch/x86/oprofile/op_model_p4.c     | 721 -----------------
>>>    xen/arch/x86/oprofile/op_model_ppro.c   | 348 ---------
>>>    xen/arch/x86/oprofile/op_x86_model.h    |  58 --
>>>    xen/arch/x86/oprofile/xenoprof.c        | 106 ---
>>>    xen/arch/x86/traps.c                    |   4 -
>>>    xen/common/Kconfig                      |  11 -
>>>    xen/common/Makefile                     |   1 -
>>>    xen/common/compat/xenoprof.c            |  42 -
>>>    xen/common/domain.c                     |   6 -
>>>    xen/common/xenoprof.c                   | 977 ------------------------
>>>    xen/include/Makefile                    |   1 -
>>>    xen/include/hypercall-defs.c            |   6 -
>>>    xen/include/public/xen.h                |   2 +-
>>>    xen/include/public/xenoprof.h           |   2 +-
>>>    xen/include/xen/sched.h                 |   3 -
>>>    xen/include/xen/xenoprof.h              |  49 --
>>>    xen/include/xsm/dummy.h                 |   7 -
>>>    xen/include/xsm/xsm.h                   |   7 -
>>>    xen/xsm/dummy.c                         |   2 -
>>>    xen/xsm/flask/hooks.c                   |  35 -
>>>    xen/xsm/flask/policy/access_vectors     |   4 -
>>>    36 files changed, 5 insertions(+), 3743 deletions(-)
>>>    delete mode 100644 xen/arch/x86/include/asm/xenoprof.h
>>>    delete mode 100644 xen/arch/x86/oprofile/Makefile
>>>    delete mode 100644 xen/arch/x86/oprofile/backtrace.c
>>>    delete mode 100644 xen/arch/x86/oprofile/nmi_int.c
>>>    delete mode 100644 xen/arch/x86/oprofile/op_counter.h
>>>    delete mode 100644 xen/arch/x86/oprofile/op_model_athlon.c
>>>    delete mode 100644 xen/arch/x86/oprofile/op_model_p4.c
>>>    delete mode 100644 xen/arch/x86/oprofile/op_model_ppro.c
>>>    delete mode 100644 xen/arch/x86/oprofile/op_x86_model.h
>>>    delete mode 100644 xen/arch/x86/oprofile/xenoprof.c
>>>    delete mode 100644 xen/common/compat/xenoprof.c
>>>    delete mode 100644 xen/common/xenoprof.c
>>>    delete mode 100644 xen/include/xen/xenoprof.h
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 3aaf5986231c..1663f6878ef2 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -15,6 +15,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>       - The cpuid_mask_* command line options for legacy AMD CPUs.  These were
>>>         deprecated in Xen 4.7 and noted not to work correctly with AMD CPUs from
>>>         2011 onwards.
>>> +   - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
>>> +     prior to the version 1.0 release, and there has been no development since
>>> +     before then in Xen.
>> LGTM:
>> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md
>>
>> Nit: It is necessary to drop the extra space before "  Oprofile themselves...".
> Why would that be? See the other bullet point in context, which also uses a
> two blanks after the inner full stop. This is deliberate.

I just missed that a similar case was mentioned above. If this is deliberate,
then I’m fine with it. It’s just not obvious (at least, for me) where it’s
acceptable and where it isn’t to have extra spaces.

~ Oleksii


