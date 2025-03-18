Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD37A6775E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919274.1323767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYcf-0004As-M8; Tue, 18 Mar 2025 15:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919274.1323767; Tue, 18 Mar 2025 15:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYcf-00048J-IS; Tue, 18 Mar 2025 15:12:53 +0000
Received: by outflank-mailman (input) for mailman id 919274;
 Tue, 18 Mar 2025 15:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuYce-00048D-H0
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:12:52 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75708359-040b-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:12:51 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54954fa61c8so5767042e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:12:51 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864ec9sm1725804e87.110.2025.03.18.08.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:12:50 -0700 (PDT)
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
X-Inumbo-ID: 75708359-040b-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742310770; x=1742915570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ivSsb+ebG5REk+cRPdcLdQsujENabwZW0W6nVNr3UYE=;
        b=FOa7bM3uo6/9dYAj9+mny36AzYwKZwEI/QlaBAe7in/62Yb8Cqvz5JCxGvrJBaWu0b
         kjv2TncBLm3W0HDVT9OtdnhfpOz9qdgaxGFlmXIRcVMxIfTRQ1BCMB59cKl8rPOg+Ray
         R7wpz272lUC/oghV0tJdZRNkfUhsDhwP+n4mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310770; x=1742915570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivSsb+ebG5REk+cRPdcLdQsujENabwZW0W6nVNr3UYE=;
        b=O8VDYNFlEsg3dUU6QqOnl/ZQvpQKZqLRrRqPPAvDDwX2mbbyr07V1kFZxcTPpnA+l7
         DQdSfupOX+ewxXepoTkHN4DjB05I0IKP/pvUO0yPvawqfdzx+h6w8xvf7sjc4fM9afaR
         Vx/NajLqlynA/6M+hi/h2+zlKlLOrRWVQTT35mLcBnRm+wJnlSUsD0XaNo2akbCQmPJN
         LbrNAKVLKokNGe8Hs5EpYbp4jmLlfneuv4xeW3RZPJk8hQwUA2YDQLBIy1hC/fA51sLh
         oozfz/JCBIyOpos9oZN4hbtmee1rbyaFblqmqeGLmI2/lFK+15fI0ztIrB+XkmaoyjQB
         bPUA==
X-Forwarded-Encrypted: i=1; AJvYcCXkcecfVWxiVxqRsGyX4zXHps6gf1yuE5D0WOlFAnvouyAVbB47vTGOWVfqDnNsBpoBQMdXRe1KVA0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq3f9tFfzgj6Xd+8vw16C8Pu8G/5vE9+rmUdMVAvh/t75bA3n1
	Aj+MMa/vwSXgyoAIF58O341/Fw6htk36R67Du6tZ/sIM1KOyaLQZJXJ++SxMWR8=
X-Gm-Gg: ASbGncub1oL2MhrL6jDI0zxfNLkL7aAkXDUCbzIWaqsqknDGv7H7iEVfhqny9sXRrw1
	YU+F4NI8o/M/Q7t/yHPnqYP0TzaemvmX43LV68N0bAdFgQ6fmoHjrKElS4GtlYJJMPSi4FhkrwO
	Qm2KMDCvpG5VmbbieWFk1jSsWm/svxjkKvyxvXVXNMX7DxaAGttVCHxxOa3sGTNpXjcSueCKdJv
	Gn2WepMHES1gmByLXdKaas3mu0EBQfiKq54jpz1dUJh0fkx+DVutaVRHnZOw7Lk5nO7QrNnjGKg
	leaQNOwnL5gLSqnf9I0kNO7LhpTHfoqRg1cpu3+b+hCquE9BtvWRtSHT0VGuWpaNddCZz4U7t0Z
	OvFrOgX9b
X-Google-Smtp-Source: AGHT+IGNGy09z3VlTf57pGpTiD8wHu4LpiPgdDJ1bi/B5YVcSIHqCc4n8XRAoPLy49FHXxzNtTYn9A==
X-Received: by 2002:ac2:4e04:0:b0:549:39d8:51ef with SMTP id 2adb3069b0e04-549c38cf317mr9141904e87.6.1742310770498;
        Tue, 18 Mar 2025 08:12:50 -0700 (PDT)
Message-ID: <833aaef8-f270-4330-96d6-573594ad50fc@citrix.com>
Date: Tue, 18 Mar 2025 15:12:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/traps: Move percpu_traps_init() into
 traps-setup.c
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-3-andrew.cooper3@citrix.com>
 <29d2d036-1e4f-44b9-a3a9-843f572f3f2e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <29d2d036-1e4f-44b9-a3a9-843f572f3f2e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 3:04 pm, Jan Beulich wrote:
> On 17.03.2025 20:20, Andrew Cooper wrote:
>> Move the declaration from asm/system.h into asm/traps.h.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/traps-setup.c
>> +++ b/xen/arch/x86/traps-setup.c
>> @@ -3,5 +3,20 @@
>>   * Configuration of event handling for all CPUs.
>>   */
>>  #include <asm/idt.h>
>> +#include <asm/msr.h>
>> +#include <asm/system.h>
>> +#include <asm/traps.h>
>>  
>>  DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
>> +
>> +/*
>> + * Set up per-CPU linkage registers for exception, interrupt and syscall
>> + * handling.
>> + */
>> +void percpu_traps_init(void)
>> +{
>> +    subarch_percpu_traps_init();
> At some point this may then want expanding into here, seeing that we don't
> have any subarch anymore, and don't expect to re-gain one any time soon?

I have folded it later in the FRED series. 

This, and load_system_tables() need non-trivial alterations to support
FRED, and I haven't got that part of the work cleaned up suitable to
post yet.

~Andrew

