Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53B2B1F23
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 16:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26706.55160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbJE-0001O4-Ad; Fri, 13 Nov 2020 15:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26706.55160; Fri, 13 Nov 2020 15:48:20 +0000
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
	id 1kdbJE-0001Nf-7V; Fri, 13 Nov 2020 15:48:20 +0000
Received: by outflank-mailman (input) for mailman id 26706;
 Fri, 13 Nov 2020 15:48:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdbJC-0001Na-76
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:48:18 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e439676-1b0f-4398-9b76-bb9731d7ef79;
 Fri, 13 Nov 2020 15:48:17 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u18so14440482lfd.9
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 07:48:17 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c1sm1587744lfj.222.2020.11.13.07.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:48:10 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdbJC-0001Na-76
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:48:18 +0000
X-Inumbo-ID: 1e439676-1b0f-4398-9b76-bb9731d7ef79
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1e439676-1b0f-4398-9b76-bb9731d7ef79;
	Fri, 13 Nov 2020 15:48:17 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u18so14440482lfd.9
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 07:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qe6NRoEvp7r9HrfIe0ZWh52c3djO2Sp8mZj0Ag3hr+M=;
        b=qRTWxNsLZjXVUOnqyABB5npTQHVq8XDg5mgm4PK5qOeggMsnrdSEfUk3LZsST7s6Td
         R7ys+29LVEhtp3qu6WLAwJuaHEWlitsZRu8gBrMsc071o/klw0DS+Kxx5c2WtYwO9Zqs
         2G8RIZujmI3CQYfY/2luAtVSO9F1ShfYeE3z8rfa5GRN21+3Q07q9UNvXuj/RB6S9P/X
         xdQQ08cVxSomZz3c5BIeoZnLxXDUn6HfmEQOfHgl9uOvlLwg8VuqLYNNum5FaHSepLBy
         tr3lA7rGYShHxcgj8jofUOB72Avmhp+XS9g30Dq5qxjRuQqjwoFl8iC69NEH2R7Yl/w7
         mQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qe6NRoEvp7r9HrfIe0ZWh52c3djO2Sp8mZj0Ag3hr+M=;
        b=MgVPzZfsmNnnZAoxoatT9iilDF8hLHmNUOVRL0wfj+xtTIcn/Pi6ua47MNcKVeAx8V
         RfV/8/9kH2dThQlF60Tk64b+rNmC0iACJIov8Y5jC6ToUTdlgx0vChvBUaGviI+0TnrH
         TmvXzMKjPKjsXmDQKdOxF9rr+CcF2CU9tZf4m2vAIpwkXlYZZT1aknxYpJ1Mo3ZZkaOI
         owTgGr+LNPilhoxf1z6T/yUACIGEpYB7JNCMWwe7vJK/5kX1emPRIyrW2uxkZl/zSMaR
         CysdD4EEZG7UPTS04d5N4eZUh0XEHp0IznGMVpeeoieHCZxNQ6yjY/hsiYtSy+nBdDdD
         5Bfw==
X-Gm-Message-State: AOAM5334XSr0oHUD+ux+znS5WcXJFzJvUgY2DSXTDkL0DMIx5gpHuvXy
	pyiWi4nVsm8n043SEzfw7qMzEuP8IBC5GQ==
X-Google-Smtp-Source: ABdhPJw19rLv0uqbpJx41Auicvt/NrUcrSAdHrlYl8M3117HEJkrn+AjGMBgW4GxB+GmZregyWop5w==
X-Received: by 2002:a19:3f55:: with SMTP id m82mr1119605lfa.218.1605282491255;
        Fri, 13 Nov 2020 07:48:11 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id c1sm1587744lfj.222.2020.11.13.07.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 07:48:10 -0800 (PST)
Subject: Re: [PATCH V2 14/23] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-15-git-send-email-olekstysh@gmail.com>
 <2c36a380-633b-1e3f-3f99-014bc315e75f@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e9472c29-237b-8096-4d2b-26e08c80f064@gmail.com>
Date: Fri, 13 Nov 2020 17:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c36a380-633b-1e3f-3f99-014bc315e75f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 13:48, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> --- a/xen/common/ioreq.c
>> +++ b/xen/common/ioreq.c
>> @@ -18,6 +18,7 @@
>>   
>>   #include <xen/ctype.h>
>>   #include <xen/domain.h>
>> +#include <xen/domain_page.h>
>>   #include <xen/event.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
> There preferably wouldn't be a need to touch non-Arm code in this
> patch. I suppose the added #include could easily be introduced
> e.g. while moving the file?

ok


-- 
Regards,

Oleksandr Tyshchenko


