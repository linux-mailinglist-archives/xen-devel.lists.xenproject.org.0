Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD82274676
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKl1g-0003ac-89; Tue, 22 Sep 2020 16:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKl1e-0003Zo-NG
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:20:18 +0000
X-Inumbo-ID: dde7282c-9eda-488e-b544-c63c002777e5
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dde7282c-9eda-488e-b544-c63c002777e5;
 Tue, 22 Sep 2020 16:20:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z19so18717643lfr.4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vUG+4egFZa9L9c1cc4fAG03CyLvSl6HIM+RxsLFDips=;
 b=Km+lt5vjjm3Qx9HiTh/XStaNgymj/nltnncZlmmemnUVykieCzSUIEFkFo2O0k/p2Q
 kT9YXAyEhDIZXnkxu3/s/silczyX47DAVfQOkKzXRuj8STz/Urv3VwojLHi7JXpwemL2
 6UzWQ82vWZsUmO7WKyEb+AcCsiED7159NZUrjagMritq1uzWD6h7yO566uwazFLWfQKq
 MzZOnEVYLPyZJdXcIsFII/cDZnNnPThqV3rUKxZd1Jrec6KGgIvujafQiLJCOwj0JNIm
 yB8Ch1v5d4aAd7elA2whhHNnIogq0F/e/EPf7fEDB5evGf2+8qQrHwD5xEhP3nFznQWa
 rosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vUG+4egFZa9L9c1cc4fAG03CyLvSl6HIM+RxsLFDips=;
 b=MRo67ElCT5o/yvMH3GCCmyTDNb/AnFA5wSkS5T9hNr9SED4sN+xudSQnJFG4Nxwe+V
 crOrNkQjl9xC1/y0rEKdQRg4Aa3lfNEkQXqAGY3YmEUmRXAe2lj2nkgW4g+9YrGm+9al
 93AiLEs+cggx3FEY+ZvkdvZwII+LWU6HUMw8nnkagQc3V9jZB5zqQ4vknBIASyELFA6n
 JWP06LUXwWREKHPr/9HDx1F35xh/BQkjvGOUYGjZp+hN5k5Mox0B6cSR0lm8vG+dYupC
 hoLPsnieEKop4rDOxZnOPdx/SdztGy4Md7uixyCjKL5kWDNFP9Qxlh0+ejiCWHa20T1x
 8fsg==
X-Gm-Message-State: AOAM532bpF/1sJfgp7jri2FKZZMtfvDfV6/YNqc4UPPP8QLxuLKpYKaa
 UbHPxqGKj0HZDOyiIyul9iM=
X-Google-Smtp-Source: ABdhPJz6qasgUG6sgX0JR4CtRq4XuMjgNLO+9XG897c22e7c9fEYm1uPI8PIZgrsNJWPKSA/DotqOQ==
X-Received: by 2002:a19:614b:: with SMTP id m11mr2155002lfk.6.1600791616993;
 Tue, 22 Sep 2020 09:20:16 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e2sm3668239lfb.275.2020.09.22.09.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 09:20:16 -0700 (PDT)
Subject: Re: [PATCH V1 04/16] xen/ioreq: Provide alias for the handle_mmio()
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-5-git-send-email-olekstysh@gmail.com>
 <6b3fc5ef-b13b-26c0-17dc-10e6a51c59a3@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <71a69e49-0887-c00c-e542-4919ea5da24f@gmail.com>
Date: Tue, 22 Sep 2020 19:20:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b3fc5ef-b13b-26c0-17dc-10e6a51c59a3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 14.09.20 18:10, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -189,7 +189,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
>>           break;
>>   
>>       case HVMIO_mmio_completion:
>> -        return handle_mmio();
>> +        return ioreq_handle_complete_mmio();
> Again the question: Any particular reason to have "handle" in here?

"Handle" has been already discussed in previous patches). Will remove.


> With the abstraction simply named ioreq_complete_mmio() feel free
> to add
> Acked-by: Jan Beulich <jbeulich@suse.com>


Thank you.

-- 
Regards,

Oleksandr Tyshchenko


