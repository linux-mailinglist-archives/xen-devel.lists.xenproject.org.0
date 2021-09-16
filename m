Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B440DF09
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 18:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188609.337830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQttW-0001b5-1o; Thu, 16 Sep 2021 16:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188609.337830; Thu, 16 Sep 2021 16:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQttV-0001ZI-Ut; Thu, 16 Sep 2021 16:05:49 +0000
Received: by outflank-mailman (input) for mailman id 188609;
 Thu, 16 Sep 2021 16:05:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Js+i=OG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mQttU-0001ZB-Hu
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 16:05:48 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af57f8b5-cff0-40a6-9a27-7610c4913a39;
 Thu, 16 Sep 2021 16:05:47 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i4so20481166lfv.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 09:05:47 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f15sm392299ljn.120.2021.09.16.09.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 09:05:45 -0700 (PDT)
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
X-Inumbo-ID: af57f8b5-cff0-40a6-9a27-7610c4913a39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xBjKlDPRl5dWJIkl+qH7qFtKoxaKH7EY5tDc1AdHm4c=;
        b=LAUKRoNvFJCZ72IK2MKIoEMZAUasws5WqxOBsjKp3Mpr6DKPiE+Eizw00ONZpw9TQF
         wYhjvwDQ0JHB2x2dXY1b5KdMG0EFD77GxH6GnkZcMTkJiX/ykQebfDMG7t+7wvq4bZux
         RIUIDhDqJoni5nWK9T+Jny7QcV864J9fpZ2FUSZ1cXZ8IVJH+jBoVZ6I4na2N2IjX4hi
         6AuzGhvUBD1KG4PEKzkUQ2kOpvD2/nf4FuRlMg19rZLUtIk1L4KaOs13Uv691R+NFO0p
         P3FmwmmOttEWV91eIgJ+4tXGxzfg/rEIU30v0eUXA9qMA0sSp6XOtOgIsQcW68EUxDAx
         rWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xBjKlDPRl5dWJIkl+qH7qFtKoxaKH7EY5tDc1AdHm4c=;
        b=XjqiyRcx8CIvwpIyMl/2JgMLv6tS7f0kaJGrh5MhVPzj3ezzIsWIgg1GOsJcIJTZU4
         UICCt2FhgHAsi5tLdmqejtFmZNn+JNVtyNdD7XSeu+cEwJ0aSCi0JnCLX6vnNxKFcbGJ
         u3ldC7Wj5RLIyoDdodk2ZkincQ66a7GB7C3vboBHcLjGtQ/xoUx2kQgaXhwa3lWYkwBw
         Hdss+RGXJY1TGzhhq+d1cl3OL6L7TUz2tNmrX6NFA9wR1+eGRV/FuoaIx36vhlMc/soC
         B/DR7FyJ7FFISyHN/ASh0awAYXi+/bzRGR/YPoXIVrg863LnRt6H1uJ9/oImbbnKashY
         OJrw==
X-Gm-Message-State: AOAM531DT5tcKBZWn39yy+J5LopOnnNVfE5iZzt5Y9hCpLThskKucHvL
	YRZAkW9d6ptU2l2/Jl+yg6+nFiYZg4yBklIu
X-Google-Smtp-Source: ABdhPJycwtJPpL5SzvY/Gftt9tiQyXvMjich9Cr8mp1cHyDN1G0xBEoW651qjPS1mqZaYakWji9EaA==
X-Received: by 2002:a05:651c:1b3:: with SMTP id c19mr5672590ljn.16.1631808346058;
        Thu, 16 Sep 2021 09:05:46 -0700 (PDT)
Subject: Re: [PATCH V2 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-2-git-send-email-olekstysh@gmail.com>
 <03b1a1bd-2630-0ee7-b995-114632f527aa@suse.com>
 <6b1c715f-e71e-718e-3cde-b298a5a38807@gmail.com>
 <ebb05297-b9ae-c475-b2f2-4c06e986f99e@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5fa4ab4a-682b-cd2f-9388-8f99a9c4d57d@gmail.com>
Date: Thu, 16 Sep 2021 19:05:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ebb05297-b9ae-c475-b2f2-4c06e986f99e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 16.09.21 18:47, Jan Beulich wrote:

Hi Jan

> On 16.09.2021 17:43, Oleksandr wrote:
>> On 16.09.21 17:49, Jan Beulich wrote:
>>> On 10.09.2021 20:18, Oleksandr Tyshchenko wrote:
>>>> @@ -120,6 +120,7 @@ struct xen_sysctl_physinfo {
>>>>        uint64_aligned_t outstanding_pages;
>>>>        uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
>>>>        uint32_t hw_cap[8];
>>>> +    uint32_t gpaddr_bits;
>>>>    };
>>> Please make trailing padding explicit. I wonder whether this needs
>>> to be a 32-bit field: I expect we would need a full new ABI by the
>>> time we might reach 256 address bits. Otoh e.g. threads_per_core is
>>> pretty certainly oversized as well ...
>> I take it, this is a suggestion to make the field uint8_t and add
>> uint8_t pad[7] after?
> I view this as a viable option at least.

I got it, sounds reasonable.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


