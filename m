Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AD910B65
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 18:09:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744837.1151962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKKLr-0005Fe-Gr; Thu, 20 Jun 2024 16:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744837.1151962; Thu, 20 Jun 2024 16:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKKLr-0005E9-E3; Thu, 20 Jun 2024 16:09:31 +0000
Received: by outflank-mailman (input) for mailman id 744837;
 Thu, 20 Jun 2024 16:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCyn=NW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKKLp-0005Dt-SB
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 16:09:29 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e954b4-2f1f-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 18:09:28 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7955dfce860so71640685a.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 09:09:28 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc0385asm705981585a.78.2024.06.20.09.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 09:09:25 -0700 (PDT)
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
X-Inumbo-ID: 77e954b4-2f1f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718899767; x=1719504567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+6+fH4A4Ln3v5AqgVzgQYLuAu4mEm4UFrPxU4D4twZM=;
        b=px3ypPvG475gNdMWSU49WcaoPLMs3SMMA/ViowlW/Dh8PB4ozR7TPBOuja4jbJcRh1
         RBEd0Am5t6Pp2ZWlDLxp5L9ISxX7Z3dRarNx4rNgeuAF2pZVPjKqcTLZgYj4B501sPIE
         ZzflNAJUyKLljSb6VFpdy/hmK13oslqyXrjK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718899767; x=1719504567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6+fH4A4Ln3v5AqgVzgQYLuAu4mEm4UFrPxU4D4twZM=;
        b=naZTy72FIxIjITnVWTeer8C0cciG/by4GnLmC7HrjxZ786RvTQ+od/eoMQEz2aUBue
         cPFwUpqO/F43p4D+WOryR1kTZ2yanoQSBojIH8xZtokbl3aFYUvRIqGPLq6aJCTrT8J4
         9x13KJjld2/PP/u5jiG1ZJgiT0ugLs5KPARrp4gVNBFc+QDVP2iqJmFSQRCElH6DviD+
         5C3YyTddtZ/dRbe7D7ZG5U/hptG+DEuYO2zYDLS6mW6NHCA6p5xZ1WqIzItuHN6K69SL
         qDKlK66vBak4Wgx7wDWLC9pquWV4gwu5MYeXQ67Kw6lDtOiTBMvQ1dBAuq+x9dT56RSk
         bcdA==
X-Forwarded-Encrypted: i=1; AJvYcCWDyAzURRkHOo/IDrtKekDBD9MKFnLGt6si2nKBdf8kacslxEab6+ZOSmZXXFWELEx+89MQIk1DO0Wpa186Dfdqorz/YxyNXRLbqPIYdIQ=
X-Gm-Message-State: AOJu0Yy7zwuhtdOjP7HGSNf1nnJ6e3FMTgk0qMrq/ZoGNUV+d5FF0BKB
	s5DoMlMQe7o8NTzBRYzZvfAreNLsO4kGZw8rAYguIYnvo8zSx5xvsWZ3QYyMoAg=
X-Google-Smtp-Source: AGHT+IFQDIcd8TOE2hHPR7mxsnptymEKf5RPTE5+f3PsWDXAhNUC0hyjg6ZDC2RUvaf+R2ehvdLVAw==
X-Received: by 2002:a05:620a:3184:b0:795:5c3e:eb4a with SMTP id af79cd13be357-79bb3e2f459mr704549785a.26.1718899766749;
        Thu, 20 Jun 2024 09:09:26 -0700 (PDT)
Message-ID: <282cefa2-b07c-421f-9dc2-045206a1f894@citrix.com>
Date: Thu, 20 Jun 2024 17:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.19? v2] x86/apic: Fix signed shift in io_apic.c
To: Jan Beulich <jbeulich@suse.com>, Matthew Barnes <matthew.barnes@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <d71b732050d4fff3208205b3117ac5164f889a63.1718897157.git.matthew.barnes@cloud.com>
 <fd1f5348-ab90-45ec-a363-2adccfb4feda@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <fd1f5348-ab90-45ec-a363-2adccfb4feda@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2024 4:40 pm, Jan Beulich wrote:
> On 20.06.2024 17:36, Matthew Barnes wrote:
>> There exists bitshifts in the IOAPIC code where signed integers are
>> shifted to the left by up to 31 bits, which is undefined behaviour.
>>
>> This patch fixes this by changing the integers from signed to unsigned.
>>
>> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Only almost, ...
>
>> ---
>> Changes in v2:
>> - Correct signed shifting in mask_and_ack_level_ioapic_irq()
>> - Adjust bracket spacing to uphold Xen style
> ... as that was only half of what I had asked for. The other half was ...
>
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -1692,7 +1692,7 @@ static void cf_check mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
>>         !io_apic_level_ack_pending(desc->irq))
>>          move_masked_irq(desc);
>>  
>> -    if ( !(v & (1 << (i & 0x1f))) ) {
>> +    if ( !(v & (1U << (i & 0x1f))) ) {
>>          spin_lock(&ioapic_lock);
>>          __edge_IO_APIC_irq(desc->irq);
>>          __level_IO_APIC_irq(desc->irq);
>> @@ -1756,7 +1756,7 @@ static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
>>           !io_apic_level_ack_pending(desc->irq) )
>>          move_native_irq(desc);
>>  
>> -    if (!(v & (1 << (i & 0x1f)))) {
>> +    if ( !(v & (1U << (i & 0x1f))) ) {
>>          spin_lock(&ioapic_lock);
>>          __mask_IO_APIC_irq(desc->irq);
>>          __edge_IO_APIC_irq(desc->irq);
> ... to put each opening figure brace on their own line. I guess Andrew or
> I will do that while committing then.

Yeah.  That can be fixed on commit.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

