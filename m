Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69022AEAE6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24344.51527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclH7-0001Uv-Dg; Wed, 11 Nov 2020 08:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24344.51527; Wed, 11 Nov 2020 08:14:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclH7-0001UW-AF; Wed, 11 Nov 2020 08:14:41 +0000
Received: by outflank-mailman (input) for mailman id 24344;
 Wed, 11 Nov 2020 08:14:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kclH6-0001UR-94
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:14:40 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27034e53-888e-4918-8821-4e374cac7470;
 Wed, 11 Nov 2020 08:14:39 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b17so1036895ljf.12
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 00:14:39 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f2sm150899ljc.118.2020.11.11.00.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 00:14:37 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kclH6-0001UR-94
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:14:40 +0000
X-Inumbo-ID: 27034e53-888e-4918-8821-4e374cac7470
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27034e53-888e-4918-8821-4e374cac7470;
	Wed, 11 Nov 2020 08:14:39 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b17so1036895ljf.12
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 00:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zqxgfoKuAyK4lLVvrlnmm4wF+ekwP0LtLglPa8tjDF8=;
        b=tW0RfZtQ6wRSIsm9wDUnGUx8zx4VuUyeqYoP9adR+sVni0E1/yhfFtrYf/Olt7aDKY
         vdHFgdWWFj0XTUdTh8TpATO/aMCOQsyVnFnHmEbMttx9NNZ1CLr7YOXWTaRXgBXL9Lo9
         qzaTUufjgdIrQZ/e3/NAtKUAImWczKWrf1IXt4RM2iCgWc91aBX9EoSsYp0WPhLMMZob
         L9biI3eaJJdwqCGUprOB3P9lRuMC7TkWqTWa9+VVWqSLGdjJs+QekiFH00RYxQ8XVrJl
         msfar9l2rrysqlzSsrR08qnsQchoR/KHT9u4UeH0SrUU9djNZsOFl+h6JvaXNxwuokgj
         q6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zqxgfoKuAyK4lLVvrlnmm4wF+ekwP0LtLglPa8tjDF8=;
        b=jOB4MHG5MmGtwSTCXLY4TWwtR0ifqs38FJHHJnuV3jh0Zei7n2RFvFxFSSksn0MMEi
         IgVSSZ76lUemB64scMwk4Rt+LFGHwgDLNn7mouhisgfToFamvM6YMzxoYPhqjp2pBfxk
         um6qj6anIJo/DLb1eeOEA37FLc//sOfnN5kLchdkbzldsBKJeQEnkW8RN/czBVu4fP0z
         MiS8BxNcQIFMlTGSeOsU/WE0QgQd97ZEKzhpJhpR+tQWUgDTb1wKjkW4Tu9A+fxsnqgV
         NGa3po43KMVF/2W/Wjj51j8fQfn4ADvN6491KMNbk7g9vPA5LBtA1e80HNvIKlVDMXwE
         t+4Q==
X-Gm-Message-State: AOAM5309i9knU3Keiv/aT2tL2Zdndtr1/FW/FEWItdXK3XHxUm4RbSGV
	lRFIN4zoHmgLoixcGDfckST+ss4bI/tpGA==
X-Google-Smtp-Source: ABdhPJzj/FaQLNO4vt6jZCmRSqQlNdaHCCuYMJVdFWKSCVJcuQJYe3Vlk25s9Syk4SlCxJyW134xAw==
X-Received: by 2002:a2e:5450:: with SMTP id y16mr10579585ljd.288.1605082478044;
        Wed, 11 Nov 2020 00:14:38 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id f2sm150899ljc.118.2020.11.11.00.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 00:14:37 -0800 (PST)
Subject: Re: [PATCH V2 11/23] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-12-git-send-email-olekstysh@gmail.com>
 <0582af84-6c2c-9f3d-e056-2f828dd8666a@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bae3cd0e-f949-f29e-05f7-a2f13b78c8b2@gmail.com>
Date: Wed, 11 Nov 2020 10:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0582af84-6c2c-9f3d-e056-2f828dd8666a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11.11.20 10:04, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -143,6 +143,19 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
>>   
>>   struct waitqueue_vcpu;
>>   
>> +enum io_completion {
>> +    IO_no_completion,
>> +    IO_mmio_completion,
>> +    IO_pio_completion,
>> +    IO_realmode_completion
>> +};
> May I suggest wrapping at least the last one in #ifdef CONFIG_X86?
>
> Also please add a trailing comma.

Yes, will do.


-- 
Regards,

Oleksandr Tyshchenko


