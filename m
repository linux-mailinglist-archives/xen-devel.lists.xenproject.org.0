Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF222ADC5F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 17:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23540.50341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcWm6-0005AM-U1; Tue, 10 Nov 2020 16:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23540.50341; Tue, 10 Nov 2020 16:45:42 +0000
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
	id 1kcWm6-00059x-Qm; Tue, 10 Nov 2020 16:45:42 +0000
Received: by outflank-mailman (input) for mailman id 23540;
 Tue, 10 Nov 2020 16:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kcWm5-00059s-Il
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 16:45:41 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99d50f3c-ae01-477f-bb11-31fbc2aab6de;
 Tue, 10 Nov 2020 16:45:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id e27so18505263lfn.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 08:45:40 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w4sm1464132ljd.28.2020.11.10.08.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 08:45:38 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BlNO=EQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kcWm5-00059s-Il
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 16:45:41 +0000
X-Inumbo-ID: 99d50f3c-ae01-477f-bb11-31fbc2aab6de
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 99d50f3c-ae01-477f-bb11-31fbc2aab6de;
	Tue, 10 Nov 2020 16:45:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id e27so18505263lfn.7
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 08:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0EakeXW0nW2lxgIyroEMqDbYM47xx3ZrgkBt9RF9HRM=;
        b=UUS9bQTuZXoYxGLo99q3A6eAbyMMpUEER7CDodxzfzpPx6DUr4iQmdfxvO3mZdKGnh
         qU8V0oxmnXhqPexmURckZ3UNDB+zTmI3tJy16r07BRSMHcuAMdHOZKFtJzS/8xXoYMnD
         HjUUTXuUhHKmtHsbrHWEbubXK27cR5eiXNodd9j6OC9atghYHbqT6gtiXvBVhQGsbJxO
         /bPGqr6cvx9f6KhvhEHnRlNPE8oG9fsJWmuPu6HMaZwobmBKhG1YPBgOWUqK3bVhlo0f
         9Q/ufEfB0tbq0XI8ZZfrQoqD5Hn8O37Pj9AaTQOXN+ICypAdIc4y4wW0oileY07TdieA
         F6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0EakeXW0nW2lxgIyroEMqDbYM47xx3ZrgkBt9RF9HRM=;
        b=j+ThfBybIg72VoBsqowxuGg8RtQWFgnDeJlIb3kl4BSFYpI3UNNp2hg9CczrKJ/jq/
         4WhDTxt7vtshfX+m4dYIqk8OMvIyu7pRn9EyoZm3aS7CflyBXzI5lZIo17YoQ3ukacGK
         D0PlLH8vy59/31flWOpDmyRk4TpecPVDTbt72/ybFwDA8WB0R1kGBNBrWWQ/6vekugN5
         rbliFiL0i6p9u5BCQp6rABDFMY3kSN0GQDA+9T66HzXdBzFNeJ042bzcTBv9QEbTsbcB
         EvVCNY3lZ9qPqCMjnOV6AodwXx4lmeVpjatempR46sF457gFaPnHgrKpgPM50qXJTR8j
         aIfQ==
X-Gm-Message-State: AOAM532yswFCVKTJGus637agtbx6a2hXBSP3X6nT0hT0QvfkZHmQS0RO
	P7WLOTOfCGXHcndRHvs5pu8=
X-Google-Smtp-Source: ABdhPJz0Bi4KZoE4J6+oKYmtlbFpxEDmvh3gIm5i+hUi8Rfy30XzO/CHDeEN/RzFte7BRKcifxt32Q==
X-Received: by 2002:a19:7b06:: with SMTP id w6mr8556787lfc.260.1605026739532;
        Tue, 10 Nov 2020 08:45:39 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id w4sm1464132ljd.28.2020.11.10.08.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 08:45:38 -0800 (PST)
Subject: Re: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Tim Deegan' <tim@xen.org>, 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-3-git-send-email-olekstysh@gmail.com>
 <004001d6a6b6$9ffd3ac0$dff7b040$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <436143ea-609f-f6c3-4952-19fcf410fe8f@gmail.com>
Date: Tue, 10 Nov 2020 18:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <004001d6a6b6$9ffd3ac0$dff7b040$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.10.20 10:57, Paul Durrant wrote:

Hi Paul

Sorry for the late response.

>> -----Original Message-----
>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Sent: 15 October 2020 17:44
>> To: xen-devel@lists.xenproject.org
>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> George Dunlap <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Jan Beulich
>> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei
>> Liu <wl@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; Tim Deegan
>> <tim@xen.org>; Julien Grall <julien.grall@arm.com>
>> Subject: [PATCH V2 02/23] xen/ioreq: Make x86's IOREQ feature common
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> moves previously prepared x86/hvm/ioreq.c to the common code.
>>
>> The common IOREQ feature is supposed to be built with IOREQ_SERVER
>> option enabled, which is selected for x86's config HVM for now.
>>
>> In order to avoid having a gigantic patch here, the subsequent
>> patches will update remaining bits in the common code step by step:
>> - Make IOREQ related structs/materials common
>> - Drop the "hvm" prefixes and infixes
> FWIW you could tackle the naming changes in patch #1.
Unfortunately, there are a lot of places that need touching (in order to 
replace/drop hvm prefixes), so I decided to keep that in a separate patch.
 From the review comments on previous series I got that renaming could 
be done before or after the move, but within
a single series, so I chose the latter.

> The 'legacy' mechanism of mapping magic pages for ioreq servers should remain x86 specific I think that aspect of the code needs to remain behind and not get moved into common code. You could do that in arch specific calls in hvm_ioreq_server_enable/disable() and hvm_get_ioreq_server_info().
Well, if legacy mechanism is not going to be used for other arch and 
should remain x86 specific, I will try to investigate what should be 
left in x86 code and rework the series.
As a side note, I am afraid, we won't get a 100% code movement (which I 
managed to achieve here) for the next version of this patch as we need 
arch/x86/hvm/ioreq.c.


-- 
Regards,

Oleksandr Tyshchenko


