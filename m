Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C101846B75
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 10:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674868.1050022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVpQi-0007yK-V0; Fri, 02 Feb 2024 09:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674868.1050022; Fri, 02 Feb 2024 09:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVpQi-0007va-Rw; Fri, 02 Feb 2024 09:01:48 +0000
Received: by outflank-mailman (input) for mailman id 674868;
 Fri, 02 Feb 2024 09:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JhER=JL=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rVpQh-0007vO-Cq
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 09:01:47 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09de6a1-c1a9-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 10:01:45 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-511207d62b6so2811759e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 01:01:45 -0800 (PST)
Received: from [192.168.12.38] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c45cf00b0040e3635ca65sm6854679wmo.2.2024.02.02.01.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 01:01:44 -0800 (PST)
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
X-Inumbo-ID: b09de6a1-c1a9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706864505; x=1707469305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXErrdCa6Tr/iUNLljuNLnYOqYVTtO+yEzmXtzl8oAg=;
        b=QSpWPwS7NJBl7jNg6qP/NIhIEulmG2TNCdo6uCZ4Hu2JBNZ7zWtiBupLYs5G/uTmY/
         o5QMrBL1dvWjIxcA5u2pOHtGYJtE0Iqr+V0ZgKglyQvbzYfuZcb4IautqKtupxQQFj/R
         DzrvKisECCdHj3lPh5mr9ja7+9/VD1I2Mo8S5F/IZryGB+BKiQbAplGj9SKtyTNApbf4
         BvzlSKvZWy9SwzcX5oQcK3wTTUZiqfcYTSa7wHCrac+bMcn4ofGuhLtyxAdqu1iAHAnw
         Y3MJxITNGUt5fKx6gtjSnBhcYfObUjG09V6vnRW3EeP84LjMs5RveG9XzhE+Bp1QFdi0
         JzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706864505; x=1707469305;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXErrdCa6Tr/iUNLljuNLnYOqYVTtO+yEzmXtzl8oAg=;
        b=tvRVfxtZIOps90/ikguS94RVXhcp3ltFo2Vy2kCjkPtomE7/l1qAqJee1an5XC8zxA
         G22mxBlAN9ibXSxSCbrKsFiE4FMVPssUzatxz9uSbbEBcd/hht1dTfLxHakpCprKK/W9
         pdd1Cwcrm16bH1naKMy7j6rF8GBVaWhsPtzrY8rhA5Qv4WPb8PwMgJtwambBcpiLto34
         hv62ryXd2OmFL1Pv98VgzUB2yJG+vdVDWUN4+AmqHQKmVlCNdbp91KgJrbF+t1xXQQ+2
         u9wmC2ZCnwgScq4KjeL//FJIhZZsLipVG94RTVeOoBY+hTNB7TtHanBZzpuMe/HEwyzK
         lgkA==
X-Gm-Message-State: AOJu0YxxjFlkcTV2TylB6PKPUrN+WJ0zjqPo+kdgux3yRr4CxpLvGXv1
	GvTM6PLILZffph2MJfquAXZcqTxucBAbyPQiNVQG+CkfVcwI2U2Y
X-Google-Smtp-Source: AGHT+IFbw8InomjsHPmQ7NoKN1mFYFTZy5xPgK4K6WBP0JxM925vC6kFs5ZDi6dJPHmMSPEYDNDBbw==
X-Received: by 2002:a05:6512:2ea:b0:510:c2a:290e with SMTP id m10-20020a05651202ea00b005100c2a290emr3101188lfq.3.1706864504495;
        Fri, 02 Feb 2024 01:01:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV+rHd1vBTlUhXmMIrCW2ZbJAsHc9otguFV2eS0cIHs6LDMRH5ZblyXmVfHscvNscY29hvkr9BDC3/WPcnjhf/WPB5oadNNsYSN7dk35nQr8hC1mrJd9TIZwHLN+GYsZJCAqVYZ7VKMTpAeLcfWiXtK
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c64deb80-d01c-4c8d-89a6-5b0d37f25bf6@xen.org>
Date: Fri, 2 Feb 2024 09:01:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: Ping: [PATCH] x86/guest: finish conversion to altcall
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65fb766e-ab5a-49ab-a904-01ee9711d42d@suse.com>
 <578a6845-6046-4d15-88a8-8a34936095a7@suse.com>
Organization: Xen Project
In-Reply-To: <578a6845-6046-4d15-88a8-8a34936095a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2024 07:08, Jan Beulich wrote:
> On 17.01.2024 10:31, Jan Beulich wrote:
>> While .setup() and .e820_fixup() don't need fiddling with for being run
>> only very early, both .ap_setup() and .resume() want converting too:
>> This way both pre-filled struct hypervisor_ops instances can become
>> __initconst_cf_clobber, thus allowing to eliminate up to 5 more ENDBR
>> (configuration dependent) during the 2nd phase of alternatives patching.
>>
>> While fiddling with section annotations here, also move "ops" itself to
>> .data.ro_after_init.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> May I ask for an ack (or otherwise)?
> 
> Thanks, Jan
> 

Yes, no objections.

Acked-by: Paul Durrant <paul@xen.org>

>> --- a/xen/arch/x86/guest/hyperv/hyperv.c
>> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
>> @@ -207,7 +207,7 @@ static int cf_check flush_tlb(
>>       return hyperv_flush_tlb(mask, va, flags);
>>   }
>>   
>> -static const struct hypervisor_ops __initconstrel ops = {
>> +static const struct hypervisor_ops __initconst_cf_clobber ops = {
>>       .name = "Hyper-V",
>>       .setup = setup,
>>       .ap_setup = ap_setup,
>> --- a/xen/arch/x86/guest/hypervisor.c
>> +++ b/xen/arch/x86/guest/hypervisor.c
>> @@ -13,7 +13,7 @@
>>   #include <asm/cache.h>
>>   #include <asm/guest.h>
>>   
>> -static struct hypervisor_ops __read_mostly ops;
>> +static struct hypervisor_ops __ro_after_init ops;
>>   
>>   const char *__init hypervisor_probe(void)
>>   {
>> @@ -49,7 +49,7 @@ void __init hypervisor_setup(void)
>>   int hypervisor_ap_setup(void)
>>   {
>>       if ( ops.ap_setup )
>> -        return ops.ap_setup();
>> +        return alternative_call(ops.ap_setup);
>>   
>>       return 0;
>>   }
>> @@ -57,7 +57,7 @@ int hypervisor_ap_setup(void)
>>   void hypervisor_resume(void)
>>   {
>>       if ( ops.resume )
>> -        ops.resume();
>> +        alternative_vcall(ops.resume);
>>   }
>>   
>>   void __init hypervisor_e820_fixup(void)
>> --- a/xen/arch/x86/guest/xen/xen.c
>> +++ b/xen/arch/x86/guest/xen/xen.c
>> @@ -318,7 +318,7 @@ static int cf_check flush_tlb(
>>       return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
>>   }
>>   
>> -static const struct hypervisor_ops __initconstrel ops = {
>> +static const struct hypervisor_ops __initconst_cf_clobber ops = {
>>       .name = "Xen",
>>       .setup = setup,
>>       .ap_setup = ap_setup,
> 


