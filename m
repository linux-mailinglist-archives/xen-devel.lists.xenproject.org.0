Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE2474886
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 17:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246911.425832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxB1H-0008Vy-Vg; Tue, 14 Dec 2021 16:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246911.425832; Tue, 14 Dec 2021 16:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxB1H-0008T6-Rx; Tue, 14 Dec 2021 16:51:15 +0000
Received: by outflank-mailman (input) for mailman id 246911;
 Tue, 14 Dec 2021 16:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KYVb=Q7=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxB1G-0008T0-U1
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 16:51:15 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 084e911a-5cfe-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 17:51:07 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id i63so29251764lji.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Dec 2021 08:51:13 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s15sm40278lfb.216.2021.12.14.08.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 08:51:12 -0800 (PST)
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
X-Inumbo-ID: 084e911a-5cfe-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OiNxOwpxiOMNu2w7h9qWcHz9qxeoJCMQlCzPYcP/iUc=;
        b=Ubkj2k/iuYEKMqZEbka2uXDBKzgqLXzvUhlKYdO0BjUeFmJbjgmYNtPW2bpXIQsaIP
         RuRvoJNSVaRRBKJjaMd2TqyKvVlnVC8jj3oU7akcr7lS1O2nFeEZD2fXW1CpRK9fTZQF
         8pNMNYYk2WPsMyL5um2ywPm4gj0gKMvtxQBUq1wrSPy49NrU+ZI2K7B+FrXfFjUGHVn8
         pU6lxnGc1jY8tT1hEDAKlhNjbQBgaghV8TzZZBOHACA2WxQKyj8QgGi/N0cnIA9/u5zn
         SBpk8po6hypk4Z/MEQMVcSSctLQIUpOyDgwpYPLvUKR3D6ZQzNzjA9dzA1+epNIkXJqo
         ws+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OiNxOwpxiOMNu2w7h9qWcHz9qxeoJCMQlCzPYcP/iUc=;
        b=i1YLvclZkRqVoo0+5g/9OVMLA3rzWZH+mgsSL9z6zIoYdPag3nl5eYEC/apae959bQ
         zm7Pb0WlH1FI2phyUVBPYSUcfMazE95nYAAYb7VsSAKf456UoaY/iNvm9HsGv0xZr162
         cq/2zHICOF0Unk5P5PRFUcyQQ1TazW1Av7lZLdF23SgPsYXhBKlIHD5jqi8/mIJk7+f5
         O7bfNPU4hH1uMjr7I3wlnnAuiOCWmCMIHLHD7cA/FtmpXybPlR1QDby3DAa8C7dPxnVN
         yQvBc/i1Z0JK0FMadgdmyuwHPjrM4GdehPlwW5U5/TgnqqXMoLBTSKgrUPFqY2F0KNYq
         CR3w==
X-Gm-Message-State: AOAM532aWWBvmLr6ck2KFx4qDyqGPcRFf54px8QvElGdUCxlg2I0HBXi
	al4O2n5+o5RFDlS3DssNChM=
X-Google-Smtp-Source: ABdhPJwEAQ/1c+e41U+3CAiWRvKmRPG91vpYWU+BgmGyUW5ullZ0xLel8WvJkw/R2hCZUVeYOsyQDg==
X-Received: by 2002:a2e:a594:: with SMTP id m20mr5640187ljp.332.1639500673341;
        Tue, 14 Dec 2021 08:51:13 -0800 (PST)
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <12f4e7fb-2908-99ae-eaf7-22861aa37484@gmail.com>
Date: Tue, 14 Dec 2021 18:51:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 14.12.21 18:45, Jan Beulich wrote:

Hi Jan.

> On 14.12.2021 17:26, Oleksandr wrote:
>> On 14.12.21 15:37, Jan Beulich wrote:
>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>>>    
>>>>    void free_xenheap_pages(void *v, unsigned int order)
>>>>    {
>>>> +    struct page_info *pg;
>>>> +    unsigned int i;
>>>> +
>>>>        ASSERT(!in_irq());
>>>>    
>>>>        if ( v == NULL )
>>>>            return;
>>>>    
>>>> +    pg = virt_to_page(v);
>>>> +
>>>>        memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>> ... this really want to (logically) move into the new arch hooks.
>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>> notice there's some dead code there on x86, which I guess I'll make
>>> a patch to clean up). But first of all this suggests that you want
>>> to call the hooks with base page and order, putting the loops there.
>> I see your point and agree ... However I see the on-list patches that
>> remove common memguard_* invocations and x86 bits.
>> So I assume, this request is not actual anymore, or I still need to pass
>> an order to new arch hooks? Please clarify.
> Well, that patch (really just the Arm one) effectively takes care of
> part of what I did say above. Irrespective I continue to think that
> the hook should take a (page,order) tuple instead of getting invoked
> once for every order-0 page. And the hook invocations should be placed
> such that they could fulfill the (being removed) memguard function
> (iirc that was already the case, at least mostly).

ok, thank you for the clarification, will do.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


