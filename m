Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88CA44492
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 16:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895870.1304534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmx2c-00075o-TV; Tue, 25 Feb 2025 15:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895870.1304534; Tue, 25 Feb 2025 15:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmx2c-000747-QN; Tue, 25 Feb 2025 15:40:14 +0000
Received: by outflank-mailman (input) for mailman id 895870;
 Tue, 25 Feb 2025 15:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmx2b-000740-Hb
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 15:40:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccecda13-f38e-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 16:40:12 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4399ca9d338so35558315e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 07:40:12 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8838bfsm2711873f8f.58.2025.02.25.07.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 07:40:11 -0800 (PST)
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
X-Inumbo-ID: ccecda13-f38e-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740498011; x=1741102811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=29xnCmm7FiFsbYPebOCTyU47dkFQZqR9WL6KlOZVxDs=;
        b=sdgShioa1MC0IuMm4tMH4ee5tFnWNtIyEKUNT1OrwIpGYAWcCNb3gZrUm8/0LkJtU+
         NmVW1hmwQ/LV5Lk8H3l02w+KY3KujHPD7BR6SgJQV9yZMQII5lOuslva74VKIj32uOS/
         sWRSwX4htYdQ8Aj6PC8hiwttyM8taV29QMiMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740498011; x=1741102811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29xnCmm7FiFsbYPebOCTyU47dkFQZqR9WL6KlOZVxDs=;
        b=tDnSUPQtFSQDR7dA56OvmvibG8cY8nblZXOHlqSxjiWv55mvl5faFDSPRWAiFEw0L/
         98ulIsZ3CqIK39w62NyeOZ6kUGz4HSlBR4yN5oECWYa+v44ls20L0XQeiFXEpvI4Ctjf
         NROW+kVKzPm3OyQZ6m0Yibb1esac0RbfDy7rGP/ijZRu6vXWKiOOusc9EscT0qFNZzLx
         iNj6Mc5kmUsc/hKI+qln8YZZi0hfDRCN7w6BB3UCG5b1Zj0yIDoZYgWU/jadOA36V3+W
         KojJAovlC6YXGp2V0KN3sqU9iqNQ0OHpOtgHfVPPZiZrq03tK0I73/b1qzxl/X0/8cCP
         FSJg==
X-Forwarded-Encrypted: i=1; AJvYcCUI5TcCZ6etWbOJT8/L1QaFJW8zcwQKKoIeKdWVHo1ae4IAfcRg8zrznEjqP00/9gEXeIxIFT98PoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdtoMqJ4SisepiT5QUqXfoJFBfQ+em/ucrSlO1WiG4csln/Z6p
	y7eeLmpJHRPBQd26fiibPfdFQ4NSZwhfJ5CnawhUyGXmuEaY299gjGJVFtjmXJM=
X-Gm-Gg: ASbGnct7EYROaLOkC62JHAWjo8Vp0LeKkP+Pd3ksnrtWRgoaCmOeTXk8Q9drrZOO447
	Zl+vYrBwSepER8Ss+m7F3DC/YgOobIgsFjViQ61cVzCBn8IOVDaM+pNj/AgzFWg3VeYpwCjR/m5
	RdU/WEZ2e+tzXCZk1CbCGf15uo7ILe1UQ2NjQahPdTQyBkvjsj7qu9xYeLrPglzCtlULfE6rn6k
	c/r249jshcy/tjB+1QWuUKvk9jb/Yu02otdwmGNbsChxWRcmpqp9x2vrluPmubWB7q/462CqhsU
	zH4Lbn9wmSa3hlMB2itPZL8UjFUXFQBR3muxPFDSjhuBFDRm9Vt4BNeqd0aeNU3V+g==
X-Google-Smtp-Source: AGHT+IF999ZWjnJIxs6ndi4FAOLzMI8RtbOmPHCUCuUf6U+F7l+YK0pSTaIo8aj9XMdbyg6z6wJ2xw==
X-Received: by 2002:a05:600c:4e8b:b0:439:9eba:939a with SMTP id 5b1f17b1804b1-43ab0f8b68bmr33099015e9.26.1740498011657;
        Tue, 25 Feb 2025 07:40:11 -0800 (PST)
Message-ID: <6d81b7b7-5317-4e49-8b39-1e3810d244d7@citrix.com>
Date: Tue, 25 Feb 2025 15:40:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/IDT: Make idt_tables[] be per_cpu(idt)
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-6-andrew.cooper3@citrix.com>
 <59e8952f-d49b-46de-ab57-07536a1028c0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <59e8952f-d49b-46de-ab57-07536a1028c0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2025 9:07 am, Jan Beulich wrote:
> On 24.02.2025 17:05, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -819,6 +819,7 @@ void load_system_tables(void)
>>  	 * support using ARRAY_SIZE against per-cpu variables.
>>  	 */
>>  	struct tss_page *tss_page = &this_cpu(tss_page);
>> +        idt_entry_t *idt = this_cpu(idt);
> Nit: Tab indentation here.

Yeah, I noticed that only after sending the email.  Other parts of the
FRED series vastly changes this function.

>
>> @@ -830,7 +831,7 @@ void load_system_tables(void)
>>  		.limit = LAST_RESERVED_GDT_BYTE,
>>  	};
>>  	const struct desc_ptr idtr = {
>> -		.base = (unsigned long)idt_tables[cpu],
>> +		.base = (unsigned long)idt,
>>  		.limit = sizeof(bsp_idt) - 1,
>>  	};
> Coming back to the comment on the earlier patch: Now that you touch all
> of the idt_tables[] uses anyway, ...
>
>> @@ -30,7 +31,7 @@ typedef union {
>>  } idt_entry_t;
>>  
>>  extern idt_entry_t bsp_idt[X86_IDT_VECTORS];
>> -extern idt_entry_t *idt_tables[];
>> +DECLARE_PER_CPU(idt_entry_t *, idt);
> ... this probably really ought to become
>
> DECLARE_PER_CPU(idt_entry_t (*)[X86_IDT_VECTORS], idt);
>
> ?

I'm afraid this doesn't compile.

arch/x86/crash.c:66:17: error: passing argument 1 of ‘set_ist’ from
incompatible pointer type [-Werror=incompatible-pointer-types]
...
note: expected ‘volatile idt_entry_t *’ but argument is of type
‘idt_entry_t (*)[256]’

Similarly {en,dis}able_each_ist() and _set_gate_lower().

~Andrew

