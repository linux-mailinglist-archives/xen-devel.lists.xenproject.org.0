Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F11B0ECDA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 10:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053493.1422279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUYe-0005Rb-EO; Wed, 23 Jul 2025 08:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053493.1422279; Wed, 23 Jul 2025 08:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUYe-0005OT-BX; Wed, 23 Jul 2025 08:10:36 +0000
Received: by outflank-mailman (input) for mailman id 1053493;
 Wed, 23 Jul 2025 08:10:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueUYc-0005ON-CT
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 08:10:34 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 818ed6f7-679c-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 10:10:33 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so63203125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 01:10:33 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458691b2adesm14770015e9.32.2025.07.23.01.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 01:10:32 -0700 (PDT)
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
X-Inumbo-ID: 818ed6f7-679c-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753258233; x=1753863033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sJQQjdWbS2Q24b/D49sDL6EYBvW4UCjoZlow+StcrOs=;
        b=Ynr6Dhd/SEUEP1cMcT6UQqL22iuAGxNFOiVFU/RECfj07TSYacCYqUU2GF6wNvfUQr
         2OOlFhdAsZ09EFpQj2XIQPtsLk8MPxDDyiG5qqnZB2SggNH4EwmkQCEtEV7fnSeHp9yt
         Pla0JOkhlx5Kd2lmqF0mEvuFsrsmEFvZ+NZ4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258233; x=1753863033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJQQjdWbS2Q24b/D49sDL6EYBvW4UCjoZlow+StcrOs=;
        b=alCMSZdafXmotoW/Xls5sw7CfxUPh+FQuq+y/YACfBxvvthBc3i4xdP9yCxyl322d9
         3/k7YFeNQuw3CfvVr96P+p5xl6/4WI+AMEvHEIWG00aU1Xelmn9Z5t8ZRkzoDvSxsKeh
         qKunu78dJh9DMOQf8amSDSFoUlQQQegjtZa5Gtc8tA3lEN66CkgOZISCwx8AZQUMUIIr
         NlPjOI7QB0UbMigEdEHyvJxkZgQ9/Rdb+KMfntAADsRzT3IO0AZ+A7D6EpYGmZUC6tw+
         EUj9ie8bXlxyFhmHZ/631N+P+wVq2qS9Sy6VU03V2L5CQfOQ6hXOyYLhLIbtR/2yPG6T
         W79w==
X-Forwarded-Encrypted: i=1; AJvYcCVbyuSO7piBU9yF01cwKmadumyg6CpUG+DoMzxGDOLflvo+nuqngAGoePYz2Z/j784zN6PMy6vHrLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy54Do2CEwNtYOjFQQ5Cba/XVOgVrFV6dUV6BePTA8w4z/QZUbg
	WIC5TUq5gPLJ14zVvLol6m+qyF/lPXfNoPtB1VsNMbo2gYloIQ6+jhBpcMERGEydNS4=
X-Gm-Gg: ASbGncs1iC3fB9hPF3xihDNm2RdiefR0hoiZ7oRjojYEJs9ApWgdxf8IEeN3RFuNclu
	B20eutyIiHixCx29w2mhu5IYo/x/toVIg9Cmq5JR9J82ugiclqpc0TAgn9gf7xIag0oTfeHGb4m
	j1gvnLaS1IrjD1//KkkTkez2ScAdSNjqvzq5hqVHCf7TJaELNWJlAul28ky7TqvUceMAT2uC+cs
	/IDsskbpGaBNAfcRxewNv5JiwSMif9mzDJbVFNozDDPv/y/HgYpvkTb7yscA3KcER4siBcj3JwR
	QFER08LS/EwmUBT4mBlvRpj8rX6sXPOviIv2/oB5JlJG0jitWCetHhxQjZEU8hD7ofyKM2IBh9g
	K5gMDwrTVwatlgh/TFx9G2Wgdg0gmg8jLYeX3ExX3O4Avy2VKwGE98alCwqMbD058tAMlHsosEm
	vaiUc=
X-Google-Smtp-Source: AGHT+IH6jbeAx1IjGYN/Td1bdhW3fFeNfoqkINaw2dQifBhx7LakJTtb3N5tzl/CnyjnkaHBI7IVnA==
X-Received: by 2002:a05:600c:1d16:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-45868c751famr13297855e9.6.1753258232919;
        Wed, 23 Jul 2025 01:10:32 -0700 (PDT)
Message-ID: <bcec11f1-b7be-421a-9edc-9abf0a9f94c7@citrix.com>
Date: Wed, 23 Jul 2025 09:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Replace do_sched_op calls with their underlying
 logic
To: Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <94a424a73476c3f2b044d61685a5fa5cbc541be0.1753207469.git.teddy.astie@vates.tech>
 <1e820d53-e440-4939-b6da-8203157d4e68@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1e820d53-e440-4939-b6da-8203157d4e68@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/07/2025 1:05 pm, Jason Andryuk wrote:
> On 2025-07-22 14:07, Teddy Astie wrote:
>> do_sched_op(SCHEDOP_yield) just calls vcpu_yield(). Remove the
>> indirection
>> through the hypercall handler and use the function directly.
>>
>> Perform the same for SCHEDOP_block.
>>
>> Not a functional change.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>>   xen/arch/x86/hvm/hvm.c               | 3 ++-
>>   xen/arch/x86/hvm/svm/svm.c           | 2 +-
>>   xen/arch/x86/hvm/viridian/viridian.c | 2 +-
>>   xen/arch/x86/hvm/vmx/vmx.c           | 2 +-
>>   4 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 4cb2e13046..5c3e9ad72e 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -1736,7 +1736,8 @@ void hvm_hlt(unsigned int eflags)
>>       if ( unlikely(!(eflags & X86_EFLAGS_IF)) )
>>           return hvm_vcpu_down(curr);
>>   -    do_sched_op(SCHEDOP_block, guest_handle_from_ptr(NULL, void));
>> +    local_event_delivery_enable();
>> +    vcpu_block();
>
> I think it would be better to export and call
> vcpu_block_enable_events().  This ensures they stay in-sync.
>
> The vcpu_vield() conversion looks good to me.

Agreed on both points.

~Andrew

