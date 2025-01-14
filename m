Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF67A107C9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 14:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871341.1282362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXgxv-0001fK-FY; Tue, 14 Jan 2025 13:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871341.1282362; Tue, 14 Jan 2025 13:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXgxv-0001d9-Cu; Tue, 14 Jan 2025 13:28:19 +0000
Received: by outflank-mailman (input) for mailman id 871341;
 Tue, 14 Jan 2025 13:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXgxu-0001d3-MQ
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 13:28:18 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69a22987-d27b-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 14:28:17 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaf60d85238so1008750666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 05:28:17 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90dc570sm641574866b.51.2025.01.14.05.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 05:28:14 -0800 (PST)
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
X-Inumbo-ID: 69a22987-d27b-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736861296; x=1737466096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TdGSJ3nvs9AExuCaeWP4D+eIKVCjs6NC8KhswNZjixo=;
        b=PUZS1qW/CXZNECCpb3DLKFQta1U4M8JDGFlsauekIilG3VcN90q76DSGMq7Esctuwg
         z1dImelM6820ynBeMS/DpYhDKFlh9caVlP9BP2GaNwd04mQx4LGJLbRn7Pvw+ngHZt6L
         zj8skvpFyRFIVZxyE4VmEDbZ9e++uv2ATBsNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736861296; x=1737466096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdGSJ3nvs9AExuCaeWP4D+eIKVCjs6NC8KhswNZjixo=;
        b=mBSSTc2LYF6FW315VEmTezu88a2syLLk/D7vnVd0z/bFHU+t9HfuBFMfKkSuPaWOjH
         LWou/FQBxDNjjxY2qpL5iW+IUab0MS131c0pFBR1wbMlHQzGmNwwD2S+lfVB9hliOFQJ
         cyOnotJRcyd5hV76Od3AX9RkHOa4YPAc4iO6HbOyDWN9MWjF2XPVp+L5ixdtXnc5ZkW3
         wxYywfQz96hx4fbmuXQ6DjOqyfEp4NMIKaKYQbAAXBTGsO3C8lJOKKUwYx2BfN+sEWlb
         pYtmvDAuOIJ9lWwSWcXOeuTDYxOstnvc5nXe8bWY33SAC75m6Lqnr0KN5gEwum1DKYIN
         XGRg==
X-Forwarded-Encrypted: i=1; AJvYcCXnxe5eoGUxmn5zQ9WI6VZLpLKiUSxKaGfPIs9o/scz3ZVWEbtkA1RduTKvHgbLeoK0T8Q4czuXNes=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgGBQfKbJ3/xAVK3hg/z3UwzSicZTR7yQ/202djRIWTMnFX72V
	weV02eY9JRrCgBEB0pe4sZT+apBtNZGLZOC/fPv35vyawVNKgPQ2NzTfw+WZTiQ=
X-Gm-Gg: ASbGnctnsrItqGmps+6ujuBGOfV6oM7oJU7gFNfM8+bZ43Z38MUkBiNmT8Ka7IOW9pK
	dajkNp8GNsplqmXtALvSVkdQJWTeE5qjMFaPyEXZY/O/fI2fBMW70fCj+4xqewl6KgJfzicHoGg
	tcp368T/WsvzaJvOTD145PXTyIyP1jpL7stKn0jo86xwZCMzOd8qc+Y4Qzkrc0SdVVo2ewbZeiM
	5xW+I5Nlxcu7V+XjNRcN7aClPvV/yKnHU+PfMXbQGMGvUvv5TujrrFtUBA9m6rcI3o=
X-Google-Smtp-Source: AGHT+IHblNCyJzcVr+qSmb8sUGK7d68ZO4vSBf1AQReLWYJ1HjnoH/e8eyDT72HOnmJFMDwP8L5FoQ==
X-Received: by 2002:a17:907:368c:b0:aa6:9624:78fd with SMTP id a640c23a62f3a-ab2abc78a71mr2476651466b.48.1736861294638;
        Tue, 14 Jan 2025 05:28:14 -0800 (PST)
Message-ID: <1622f144-e872-4e3c-8522-2e692f63e8eb@citrix.com>
Date: Tue, 14 Jan 2025 13:28:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
 <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
 <c8ed49b1-ffa3-4a40-a006-ee6e01b64367@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c8ed49b1-ffa3-4a40-a006-ee6e01b64367@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2025 1:22 pm, Jan Beulich wrote:
> On 12.12.2024 02:17, Andrew Cooper wrote:
>> On 12/12/2024 12:13 am, Volodymyr Babchuk wrote:
>>> Hello Jan,
>>>
>>> Jan Beulich <jbeulich@suse.com> writes:
>>>
>>>> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>>>>> Both GCC and Clang support -fstack-protector feature, which add stack
>>>>> canaries to functions where stack corruption is possible. This series
>>>>> makes possible to use this feature in Xen. I tested this on ARM64 and
>>>>> it is working as intended. Tested both with GCC and Clang.
>>>>>
>>>>> It is hard to enable this feature on x86, as GCC stores stack canary
>>>>> in %fs:40 by default, but Xen can't use %fs for various reasons. It is
>>>>> possibly to change stack canary location new newer GCC versions, but
>>>>> this will change minimal GCC requirement, which is also hard due to
>>>>> various reasons. So, this series focus mostly on ARM and RISCV.
>>>> Why exactly would it not be possible to offer the feature when new enough
>>>> gcc is in use?
>>> It is possible to use this feature with a modern enough GCC, yes. Are
>>> you suggesting to make HAS_STACK_PROTECTOR dependent on GCC_VERSION for
>>> x86 platform?
>> (With the knowledge that this is a disputed Kconfig pattern, and will
>> need rebasing), the way I want this to work is simply:
>>
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 0de0101fd0bf..5d0a88fb3c3f 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -434,6 +434,9 @@ endif
>>  
>>  ifeq ($(CONFIG_STACK_PROTECTOR),y)
>>  CFLAGS += -fstack-protector
>> +ifeq ($(CONFIG_X86),y)
>> +CFLAGS += -mstack-protector-guard=global
>> +endif
>>  else
>>  CFLAGS += -fno-stack-protector
>>  endif
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 9cdd04721afa..7951ca908b36 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -28,6 +28,7 @@ config X86
>>         select HAS_PCI_MSI
>>         select HAS_PIRQ
>>         select HAS_SCHED_GRANULARITY
>> +       select HAS_STACK_PROTECTOR if
>> $(cc-option,-mstack-protector-guard=global)
>>         select HAS_UBSAN
>>         select HAS_VMAP
>>         select HAS_VPCI if HVM
>>
>>
>>
>> Sadly, it doesn't build.  I get a handful of:
>>
>> prelink.o: in function `cmdline_parse':
>> /home/andrew/xen.git/xen/common/kernel.c:216:(.init.text+0x20f2): failed
>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>> --no-relax
>> /home/andrew/xen.git/xen/common/kernel.c:230:(.init.text+0x246f): failed
>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>> --no-relax
>>
>> which is more toolchain-whispering than I feel like doing tonight.
> For reference:
> https://sourceware.org/pipermail/binutils/2025-January/138631.html
>
> You didn't enter a gcc bug report yet, did you?

No, not yet.  I'm afraid I've not had the time.

~Andrew

