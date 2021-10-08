Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D63A426B99
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 15:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204729.359893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYpoC-0005SP-7i; Fri, 08 Oct 2021 13:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204729.359893; Fri, 08 Oct 2021 13:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYpoC-0005Q0-4O; Fri, 08 Oct 2021 13:21:08 +0000
Received: by outflank-mailman (input) for mailman id 204729;
 Fri, 08 Oct 2021 13:21:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ioNN=O4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYpoA-0005Pu-ED
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 13:21:06 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ede6adc-a05f-4dfb-8d7a-faa6058767f3;
 Fri, 08 Oct 2021 13:21:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g8so36419759edt.7
 for <xen-devel@lists.xenproject.org>; Fri, 08 Oct 2021 06:21:05 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q18sm915408ejc.84.2021.10.08.06.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:21:02 -0700 (PDT)
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
X-Inumbo-ID: 1ede6adc-a05f-4dfb-8d7a-faa6058767f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HImk4itwCVYEvOpDrBtzEhuEI4WM1KqqfELDSsaj/wo=;
        b=qCS6yeQq9ZLr9ZcvR0Zt0XrotUFqvo0/HafLmgCbIZbozJR9kU/kQtc7GxXWCFf38q
         7wImhooSbNFa5fs8r6DXwjikAdCNbPw7mb+zKZnjVT6RCULevvMHXib/P1tIy/No6rBx
         KesLyf0G8nMkdrq09lFHcRoz73O8VvoNnJXmSe7F5tDTL0FeKVurhPcKJSRHRbKzr43V
         KmjyLYrqJC0qG5ZREdeom9G3pr06b+lJKExu06O4Q26wQD3zzgZwhd/KJzskyC9RdKbA
         STrFiCAsMXCj/KxYt00C2mtlgLGr6S4DHeqWt6J1g4NRlSYmMHA7ZGa7OxlmHuy7dVpl
         Jn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HImk4itwCVYEvOpDrBtzEhuEI4WM1KqqfELDSsaj/wo=;
        b=CVPkuyQ3yWlJzuS3SzkZnacSyD0kE4tIqwHROvndPLzxIQqC+HMqyr7aPsMSacABmF
         gplsGI2R02N8jgBUYdd1WLumh2ujvGa86vuteYDdPm3gCZzHTcwhgSLwwBV2EiBZzH5n
         T17Zj3RawdbO/EhjSV59oDTwOuB0TZZsd3gqDNWsXrirrppVbeOKyt0/9/lOivXneYtA
         /T3A0gbd7783JrnuCU7l37nM5KUrOOCLsLu8axk4ZpjpvILNsgaaqzmhWrKl1ytq/DKy
         hXM7QSrmQfAdw6K129psU9H3EALs3N4QcqCZLi4dnhkkqz6IZ30Z7Qxj5Fzm92mm2pnB
         AhFg==
X-Gm-Message-State: AOAM531u9XfoGayDd42rCLDWZsA0Fm6bJ4Jkl9CETcdVaBfEzuxXKPWK
	KlP88ahfq5D6beQ9TVfSX1VkQtH1UwQ=
X-Google-Smtp-Source: ABdhPJwX1hbPNKvfOyvD46mgN2jkFlJNEsrdzVhEYv66HWz/6C3+q6M+uuI6SgPknHWywyAKCa8Kjg==
X-Received: by 2002:a17:906:2f16:: with SMTP id v22mr4038222eji.126.1633699262706;
        Fri, 08 Oct 2021 06:21:02 -0700 (PDT)
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
 <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
 <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
 <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com>
 <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com>
 <alpine.DEB.2.21.2110071311450.414@sstabellini-ThinkPad-T480s>
 <b8e868a2-9af3-de6c-0683-4bb2ff7821f3@suse.com>
 <b36e5fb7-6ed0-dc7d-5ed3-c3c9c9ae70b5@gmail.com>
 <ff760c65-1041-aac6-40ed-981f0b900678@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2fcb101c-28b0-67c5-0f4d-e3d75b9f4d33@gmail.com>
Date: Fri, 8 Oct 2021 16:21:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ff760c65-1041-aac6-40ed-981f0b900678@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.10.21 15:36, Jan Beulich wrote:

Hi Jan

> On 08.10.2021 12:25, Oleksandr wrote:
>> Just a quick question. What do you think can XEN_DOMCTL_getdomaininfo be
>> reused to retrieve gpaddr_bits? I don't see why not at the moment, but
>> maybe there are some implications/concerns which are invisible to me.
>>
>> I see that arch_get_domain_info() is present, so the field will be
>> common, and each arch will write a value it considers
>> appropriate. This could be a good compromise to not add an extra domctl
>> and to not alter domain_create.
> Technically I think it could be reused. What I'm less certain of is
> whether the specific piece of information is a good fit there.

ok, thank you for your answer.

I am also not 100% sure whether it is a *good* fit there, but I cannot 
say it is not fit at all for being there. I might mistake, but it is 
almost the same piece of information describing the whole domain as 
other existing fields in that structure.



>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


