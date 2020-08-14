Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D34244CBC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 18:31:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6cbi-0006DB-7m; Fri, 14 Aug 2020 16:31:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8KJt=BY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k6cbg-0006CS-EN
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 16:31:04 +0000
X-Inumbo-ID: b7128033-2d44-48f4-a91d-e97cc721f43f
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7128033-2d44-48f4-a91d-e97cc721f43f;
 Fri, 14 Aug 2020 16:31:02 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s9so5124498lfs.4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2020 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VXxIcpF/GqydN/CFyQnBMwws4FY7x4tXtTzeHDcZtRY=;
 b=KCQs6vx1NXpUOyFr4JF8K958V7OmrXcp2EYMH3YXurYlMKj1v/WJ6ERE8xyDnBeGhy
 Ac668oozqwpsNOGJkl7JXj6gq77rKNfQcfECK+jrnMUT2bM9e6lhOVf8CVnsfQ+2d+0z
 6a4Y+YnOzYXQEj69BEIpsnFs0L7CyHGCSTm93S4lVAvtMIMN7wrvTePt/hpcdks68YKV
 7kPeGsWpT+KKy1wd4NGSjX4BHMGDei8dfYZMBQowYOuiGkZUd2uK9h7AkKDkTliB+QpQ
 JgaB/crfzCpYsw7LVNFsQ5tiSn1jghMDIg21GHTdPhOIOAdLYOLWiksQg8dQNYb9IzPv
 tiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VXxIcpF/GqydN/CFyQnBMwws4FY7x4tXtTzeHDcZtRY=;
 b=pWZ6fsJr8mFXvzcB1f4oeVmsKCnP0p946i7aEJvYUqip4C4KLpgQcxVT4PNrhRCKOm
 xjbR4LQpTQxiNTYSoPDpEqYnOLq77TGVaLn8X7MlAgRatv5Z1qHqjlhskZLV4Bzt5UFJ
 G+vn1ql1aBXrXUWG/7H7ImEddOg3Dg7Nlgl9Sw7H6w/al7YgpLag9NlUN7qVQcW3iglL
 1xXxclUroZzmrgMu1Ejj8J0nPVnBPChupyNaG3NFu9hVJct8eRvVKmjtEMmtrx8Qq7da
 JIASfH9XFdM910D7wb2b6zi0A6ZyjfawVvHy2vs/MShdRGMNW9zeD5eqEU+36Mw8Ik+Y
 VbeA==
X-Gm-Message-State: AOAM530dzl3Fc5cHKP5hO4DtvY4KkQAu3Rb+JLnDtGBnUR78Rk9SCQ3r
 wmlfwZPFMquyscBMGuaNRiU=
X-Google-Smtp-Source: ABdhPJz7EFZJ6SY9LE2WnFCWE9bfl0iciYSxdOX4zRH0yfoWgRb+w0g6UAXGGat/kfObBazf+icNdg==
X-Received: by 2002:a05:6512:330c:: with SMTP id
 k12mr1578341lfe.151.1597422661582; 
 Fri, 14 Aug 2020 09:31:01 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n205sm1985255lfd.59.2020.08.14.09.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:31:01 -0700 (PDT)
Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able to run
 emulator in driver domain
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, paul@xen.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-8-git-send-email-olekstysh@gmail.com>
 <4ffa6434-3ad6-04dc-bfde-f75196930fb4@suse.com>
 <005f01d66b47$1c58ccc0$550a6640$@xen.org>
 <a9a8a3fb-10ad-96f7-651b-9bed46310ba2@gmail.com>
 <e8105d18-338f-bd90-39a2-eb37e37345a7@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <17fbc16e-6db8-66e3-967c-85b652df571a@gmail.com>
Date: Fri, 14 Aug 2020 19:30:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8105d18-338f-bd90-39a2-eb37e37345a7@suse.com>
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


Hello all.


>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 05 August 2020 17:20
>>>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant <paul@xen.org>
>>>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew
>>>> Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
>>>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Daniel De Graaf <dgdegra@tycho.nsa.gov>
>>>> Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able to run emulator in driver domain
>>>>
>>>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> Trying to run emulator in driver domain I ran into various issues
>>>>> mostly policy-related. So this patch tries to resolve all them
>>>>> plobably in a hackish way. I would like to get feedback how
>>>>> to implement them properly as having an emulator in driver domain
>>>>> is a completely valid use-case.
>>>>   From going over the comments I can only derive you want to run
>>>> an emulator in a driver domain, which doesn't really make sense
>>>> to me. A driver domain has a different purpose after all. If
>>>> instead you mean it to be run in just some other domain (which
>>>> also isn't the domain controlling the target), then there may
>>>> be more infrastructure changes needed.
>>>>
>>>> Paul - was/is your standalone ioreq server (demu?) able to run
>>>> in other than the domain controlling a guest?
>>>>
>>> Not something I've done yet, but it was always part of the idea so that we could e.g. pass through a device to a dedicated domain and then run multiple demu instances there to virtualize it for many domUs. (I'm thinking here of a device that is not SR-IOV and hence would need some bespoke emulation code to share it out).That dedicated domain would be termed the 'driver domain' simply because it is running the device driver for the h/w that underpins the emulation.
>> I may abuse "driver domain" terminology, but indeed in our use-case we
>> pass through a set of H/W devices to a dedicated domain which is running
>> the device drivers for that H/Ws. Our target system comprises a thin
>> Dom0 (without H/W devices at all), DomD (which owns most of the H/W
>> devices) and DomU which runs on virtual devices. This patch tries to
>> make changes at Xen side to be able run standalone ioreq server
>> (emulator) in that dedicated (driver?) domain.
> Okay, in which case I'm fine with the term. I simply wasn't aware of the
> targeted scenario, sorry.


May I kindly ask to suggest me the pointers how to *properly* resolve 
various policy related issues described in that patch? Without having 
them resolved it wouldn't be able to run standalone IOREQ server in 
driver domain.


-- 
Regards,

Oleksandr Tyshchenko


