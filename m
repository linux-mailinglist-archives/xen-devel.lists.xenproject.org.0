Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDE7241141
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 21:59:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5DwS-0003gW-Qk; Mon, 10 Aug 2020 19:58:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWL+=BU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5DwQ-0003gR-Vf
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 19:58:43 +0000
X-Inumbo-ID: 24964a00-df77-414f-a720-671093d12bc3
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24964a00-df77-414f-a720-671093d12bc3;
 Mon, 10 Aug 2020 19:58:41 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m22so10908097ljj.5
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 12:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Wg6R239/TK4XmUBof9QhqJaWi5XLLO9Eo+nnF7br/6c=;
 b=VpeNb1/oydOvdrHOyc26PqpFkDVPGjTqEg9GxRX6YDO3yYcmUWXNdu+BawQkdZWSf8
 C987833IHBFVXN+iV/0igmYBmggCDugEkjGv/THoYBS9Prw1fLiGA1yLZCUI4CElN3zM
 VOj0XnZbDVaYIFboJSTDRtpKqlV4bByiPKCaMFfm6sNCIgOEk/99gk4Hbj7VcgCO2Dz/
 2K7ZPGMmPYSSXugIhEg7NzhrKxdIC45vhKXwJU+PiII58KrzEzSUnbuFPiBnubHQ+ow6
 yDGazYMCtmCEMES6X+iqCuXG2tX6uREpLCPpe8K78Xlr4iFwCO7/1iMFHCr7JcgzyzKp
 LWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Wg6R239/TK4XmUBof9QhqJaWi5XLLO9Eo+nnF7br/6c=;
 b=PiHudjIl8YceCY9Gpu2RhWL0cgIkzXQWTZSMb3nTLpGqpBFx6F9VbPG/251i2/vZlJ
 wboEljTN0NKOlVOnkvVQFxa2/9R3Z7Id0exzraEAiK+eIDEjwPmP/NMh0Hky/2IPXbZk
 95i4zIdBIEZu1lUop7WpQn5HC/zHRlO5r8Fga+iDNHuSrX+mYXm7s2CmpWV03WPnAVVW
 PZc0Er+8dzQ3t87PpEBG2WQM447Wr3MWFmlTM2rN/Z0u/RjU9qoKTIIi9HQM8LCRJ6Il
 3HLWUkq6B98K/+kdXgxsrd9n9nDS6W4LSJMh/fWpakKY1PBwcUk2/RXUDNn9Ov/FfXne
 6rGg==
X-Gm-Message-State: AOAM530Ge5KzXwYnYRLKHiFtrvYmwTaGpX5OO9tXLdxspx9Hui1eBvI+
 eWBe0H8sinS5MoqVWSO8XOY=
X-Google-Smtp-Source: ABdhPJyMBP5aRLQ5DGnwa9VBPVDzbp0psVJ2QUC2v7udl0oXAhyUx+8NZrbUKM6sUemxfvufGoxl5g==
X-Received: by 2002:a2e:80d8:: with SMTP id r24mr1255384ljg.305.1597089520692; 
 Mon, 10 Aug 2020 12:58:40 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b81sm11050828lfg.60.2020.08.10.12.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 12:58:39 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
 <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
 <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
 <952392d9-22cc-af66-c1af-f82360b75cf4@gmail.com>
 <31914fc1-9a00-ef1c-2935-20ced2a2b574@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <19ecf924-1b34-1582-97ad-83c47741109f@gmail.com>
Date: Mon, 10 Aug 2020 22:58:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <31914fc1-9a00-ef1c-2935-20ced2a2b574@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 10.08.20 21:25, Julien Grall wrote:

Hi Julien

>
>>>
>>> Do you mind to provide more details?
>> Previous patch "xen/mm: Make x86's XENMEM_resource_ioreq_server 
>> handling common" breaks build on Arm as it includes xen/hvm/ioreq.h 
>> which requires arch header
>> to be present (asm/hvm/ioreq.h). But the missing arch header together 
>> with other arch specific bits are introduced here in current patch. 
>
> I understand that both Arm and x86 now implement the asm/hvm/ioreq.h.
> However, please keep in mind that there might be other architectures 
> in the future.
>
> With your change here, you would impose a new arch to implement 
> asm/hvm/ioreq.h even if the developper have no plan to use the feature.
>
>> Probably I should have rearranged
>> changes in a way to not introduce #ifdef and then remove it...
>
> Ideally we want to avoid #ifdef in the common code. But if this can't 
> be done in an header, then the #ifdef here would be fine.

Got it.


>
>>>>> I understand that the x86 version is more complex as it check 
>>>>> p->df. However, aside reducing the complexity, I am not sure why 
>>>>> we would want to diverge it.
>>>>>
>>>>> After all, IOREQ is now meant to be a common feature.
>>>> Well, no objections at all.
>>>> Could you please clarify how could 'df' (Direction Flag?) be 
>>>> handled/used on Arm?
>>>
>>> On x86, this is used by 'rep' instruction to tell the direction to 
>>> iterate (forward or backward).
>>>
>>> On Arm, all the accesses to MMIO region will do a single memory 
>>> access. So for now, we can safely always set to 0.
>>>
>>>> I see that try_fwd_ioserv() always sets it 0. Or I need to just 
>>>> reuse x86's helpers as is,
>>>> which (together with count = df = 0) will result in what we 
>>>> actually have here?
>>> AFAIU, both count and df should be 0 on Arm.
>>
>> Thanks for the explanation. The only one question remains where to 
>> put common helpers hvm_mmio_first_byte/hvm_mmio_last_byte (common 
>> io.h?)?
>
> It feels to me it should be part of the common ioreq.h.

ok, will move.


-- 
Regards,

Oleksandr Tyshchenko


