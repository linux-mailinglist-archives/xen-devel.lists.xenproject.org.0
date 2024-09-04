Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822796B89C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790080.1199788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnIn-0000RH-Bx; Wed, 04 Sep 2024 10:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790080.1199788; Wed, 04 Sep 2024 10:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnIn-0000PZ-8z; Wed, 04 Sep 2024 10:31:53 +0000
Received: by outflank-mailman (input) for mailman id 790080;
 Wed, 04 Sep 2024 10:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slnIl-0008TN-WF
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:31:52 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5aa13d8-6aa8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 12:31:51 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c0aa376e15so3588433a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:31:51 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c2502f86ebsm4471735a12.77.2024.09.04.03.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:31:49 -0700 (PDT)
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
X-Inumbo-ID: e5aa13d8-6aa8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725445911; x=1726050711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tW0GRSJ/AMS0Ap+d0y5OzUxR8qxGxbeCpUowf9qf6Ds=;
        b=YoKgbgRcJqQtR2d/WNUjoejrYYetqN7gCgjNv2COZaCuW18qwq1CS02UdzmZb2GfDW
         6mVX+njIJuPyftKamNQav7ibAY8LXN6dP/t1b3zRrwIbX66/BihaW3utSU94QUbsb9me
         dn3AxnrD9EYjbR4mbzbCYrdasasB6T6wb2NDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445911; x=1726050711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW0GRSJ/AMS0Ap+d0y5OzUxR8qxGxbeCpUowf9qf6Ds=;
        b=i/itVzPG0cy6o1azcihDUfbcgalpDQm97qQ9ArBz329mcoehSulxZLZ/LsVR5iDuoj
         SQimVLob/016pn5fW0H9naqUq6aqyh6XEu7Z4lQwpdOeNgcUvKuN5HBzhE9olP8uE0lX
         8rjxRQbQUKU0sqyl98rpIoMlOmllhygU+8hdhc+E9L0cpeQPbeHrdnpU8VnO4zvS8GQY
         FonToBNdm4wQpCmVVPEq0FJ3COtsvJEdUQY4ZUHZ6GmeBnVXcZ+ObhfhXXE+3D23wrYz
         8ktDcmIYqnpWcCWhnrPZPrub33npm7o9wpM8mMS6T5bgq2QIRgyNGs5K4ZwYcHOoMD6A
         2n5A==
X-Forwarded-Encrypted: i=1; AJvYcCWBzfVJ7rjOueN5z8lsyGVwoVn08AHOVgb2aiqEUGQFl4xCGXp3KlsQXvZjhbMsSh7rVVEx18SVHZs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQEaeyALf8t1OqzSLbxhjv+vWbm3MZFccoAioPmyXETCmBVGFX
	zRI29rw5E/YsZs6A4WqQsy64SgBzJHxhUebegAV0+EretIOmfgeuYjCh6xYV0a8=
X-Google-Smtp-Source: AGHT+IH/8sQ+t6HrTzjYPyhhD/Gb/bHhQ8mgk9jss67p1czgQ2jB5GUA4lNuWR8TmAe0CrZGm6l8Yg==
X-Received: by 2002:a05:6402:510d:b0:5c2:6e61:fa87 with SMTP id 4fb4d7f45d1cf-5c26e61fbe7mr3865380a12.23.1725445910160;
        Wed, 04 Sep 2024 03:31:50 -0700 (PDT)
Message-ID: <4cd314fa-9a4f-4656-98f0-bc696a082913@citrix.com>
Date: Wed, 4 Sep 2024 11:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
To: oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <4b62d7e3faa24f6070430607262a3aed1bbf1861.1725295716.git.oleksii.kurochko@gmail.com>
 <577dea81-06a7-4ca3-9a22-e76c966b5dcf@citrix.com>
 <c6e42423d925e26942f2cfd0dafba09e0ed5b78a.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c6e42423d925e26942f2cfd0dafba09e0ed5b78a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 11:27 am, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-03 at 15:21 +0100, Andrew Cooper wrote:
>> On 02/09/2024 6:01 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/riscv/include/asm/atomic.h
>>> b/xen/arch/riscv/include/asm/atomic.h
>>> index 31b91a79c8..3c6bd86406 100644
>>> --- a/xen/arch/riscv/include/asm/atomic.h
>>> +++ b/xen/arch/riscv/include/asm/atomic.h
>>> @@ -31,21 +31,17 @@
>>>  
>>>  void __bad_atomic_size(void);
>>>  
>>> -/*
>>> - * Legacy from Linux kernel. For some reason they wanted to have
>>> ordered
>>> - * read/write access. Thereby read* is used instead of read*_cpu()
>>> - */
>>>  static always_inline void read_atomic_size(const volatile void *p,
>>>                                             void *res,
>>>                                             unsigned int size)
>>>  {
>>>      switch ( size )
>>>      {
>>> -    case 1: *(uint8_t *)res = readb(p); break;
>>> -    case 2: *(uint16_t *)res = readw(p); break;
>>> -    case 4: *(uint32_t *)res = readl(p); break;
>>> +    case 1: *(uint8_t *)res = readb_cpu(p); break;
>>> +    case 2: *(uint16_t *)res = readw_cpu(p); break;
>>> +    case 4: *(uint32_t *)res = readl_cpu(p); break;
>>>  #ifndef CONFIG_RISCV_32
>>> -    case 8: *(uint32_t *)res = readq(p); break;
>>> +    case 8: *(uint32_t *)res = readq_cpu(p); break;
>> This cast looks suspiciously like it's wrong already in staging...
> Thanks for noticing that, it should be really uint64_t. I'll update
> that in the next patch version.

This bug is in 4.19.

I know RISC-V is experimental, but this is the kind of thing that Jan
might consider for backporting.

Whether it gets backported or not, it wants to be in a standalone
bugfix, not as a part of "rewrite the accessors used".

~Andrew

