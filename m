Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1508583F54
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 14:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376775.609766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH32X-00050K-Te; Thu, 28 Jul 2022 12:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376775.609766; Thu, 28 Jul 2022 12:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH32X-0004xU-Q4; Thu, 28 Jul 2022 12:54:57 +0000
Received: by outflank-mailman (input) for mailman id 376775;
 Thu, 28 Jul 2022 12:54:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfiA=YB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oH32W-0004uo-02
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 12:54:56 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a775d95-0e74-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 14:54:55 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id o13so2105659edc.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jul 2022 05:54:55 -0700 (PDT)
Received: from [192.168.1.93] (adsl-69.109.242.233.tellas.gr. [109.242.233.69])
 by smtp.gmail.com with ESMTPSA id
 r15-20020aa7d58f000000b0043cc1611581sm629027edq.85.2022.07.28.05.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 05:54:54 -0700 (PDT)
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
X-Inumbo-ID: 7a775d95-0e74-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x0LXF7PM4Q0j1gUk4V6+jfW2368b3X14IEK5LIspfOk=;
        b=E0riyxrVLkc+roCiHi5ouTTA8ghMCs/AGens+hxc3W+6l8Lh8LatFVI2WokoYkd88Y
         pYtOmUNh7oFihFcy5+HAzaixXZrM6+ViwYDbuex1sVaaFywfQLgftWwyU0nAPG8JPHzE
         KhgNw6yvefy18dCS/eSzdOlul0CFFDfUK/WkVVnW1+0HJzaVncH9OJkZT8d2LG9WuFJ4
         88risnOBAyCTmpnSqpHxWVxxwtBbw85ENzVMV9jAZfOC3TStFX3m0HfXLQiN3jlM06ns
         EV18nSlPmi6pNo8FQ1vczdg1Kc3YwLVGbqgp0N32+OvyyPz5CJbocE/Ns+Lg0/044Vy8
         8ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x0LXF7PM4Q0j1gUk4V6+jfW2368b3X14IEK5LIspfOk=;
        b=K1Q6X9C7BG+KYy7YVdkdDRfUWj7p0ePa187y6xLqGOUlifn1H9RTxrck0nwgVyBVYx
         NKBIhj2D5zESUo0cCX+8wWC1zXFDuPKTBDoOXyxqN1S1r47UOJeD+xMjiywDun0XLdpP
         zvqUPOARV6yMduSQ+h1rACojusIKM4ggg36SB7YdjRu9605WbWZOqF7zTQOvp4BePSpg
         zoVQuUdCzRajn7MzfMJFNeBKOlYt+X6LTxbvUX+KWWn4pfQJaWxIVVSbsx8cpBRYgMPi
         YcfElitm8XKaWFGKB/62zP2opdXUfYdtMpH2P3WzvMtVLDP5yKQ9TLZSaRcZ2xFmc3SL
         u8tw==
X-Gm-Message-State: AJIora+e0101VHqWbVJDBOeZKcGq2Y7fGGm0S/9ywJCeBemoMAM8AuCd
	hmmHdIrdnU01/P1s8K33bPg=
X-Google-Smtp-Source: AGRyM1sAoREU39SNHdZjGj04VlT27SvRvX8uLh9wkRDLg/FddfpMgHhqSRxdUMumSv9ciBre+EDgVw==
X-Received: by 2002:a05:6402:1859:b0:43c:b0db:3f9a with SMTP id v25-20020a056402185900b0043cb0db3f9amr8097267edy.120.1659012894789;
        Thu, 28 Jul 2022 05:54:54 -0700 (PDT)
Message-ID: <3942ab28-95ef-b7ca-fa81-9243572dca9c@gmail.com>
Date: Thu, 28 Jul 2022 15:54:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728075709.1175445-1-burzalodowa@gmail.com>
 <8d2bbddf-f871-5c64-6f95-f6f34edfb730@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <8d2bbddf-f871-5c64-6f95-f6f34edfb730@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 7/28/22 12:26, Jan Beulich wrote:
> On 28.07.2022 09:57, Xenia Ragiadakou wrote:
>> --- a/xen/arch/arm/include/asm/current.h
>> +++ b/xen/arch/arm/include/asm/current.h
>> @@ -44,8 +44,11 @@ static inline struct cpu_info *get_cpu_info(void)
>>   
>>   #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
>>   
>> +extern void return_to_new_vcpu32(void);
>> +extern void return_to_new_vcpu64(void);
> 
> While ultimately it's the Arm maintainers to judge, may I suggest that
> these be put in arm/domain.c to limit visibility?

I agree with you. Will fix and resend.

-- 
Xenia

