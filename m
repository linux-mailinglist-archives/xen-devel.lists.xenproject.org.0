Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CFC241EF8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 19:11:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5XmN-0000z8-IU; Tue, 11 Aug 2020 17:09:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWDt=BV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k5XmL-0000z2-AF
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 17:09:37 +0000
X-Inumbo-ID: cd4b5a62-77fd-4f86-b376-22386475a761
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd4b5a62-77fd-4f86-b376-22386475a761;
 Tue, 11 Aug 2020 17:09:35 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id t6so14362913ljk.9
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2020 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9CcF5tHbKiZI0Z+gJaQJaHgogDyIgZQAVS6fg4BKJlI=;
 b=Pdw+DJSfy7fowF1bX45oTfJ+WWAmN8Y/huWvJbWToFEdh+oAPqpiPadPMHcV6IxXDL
 UcorgQRLuY/TsrS40RnJx6YTgLubsi8EPkhccw+0kwd66ylowWqFwN2fn6xf5ssHh5M/
 Ii4pcvHib8t6qeYQYg4VCRv/43ewnvcGhFj6gjX8rFW0hEoZUIdhbdeqw7gW+XxuMwx7
 CImVXXsnz6Ui8dB0Fwh1NpQ7eEX0N7vzi5AOBlGXcRKp0lQvcfXVTRhqBS8yCkEGgL1K
 0uexumb2IkQrJbEDTiluwj6tsk+YvcDA1UNEGdaYosw7uVjURZ8BZDiQgiNMDjQrN+w7
 yIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9CcF5tHbKiZI0Z+gJaQJaHgogDyIgZQAVS6fg4BKJlI=;
 b=YeKQl6Z6aEu04EuHw+Yed4YBdmWrXlxjotlmZAwa0aVCXjET+pcTVuzhYGr1R3KMH/
 YRkCusDLR7+Xo5V1IECK+pLC8HjQ8rYk32WhTpDLSrz/opSn66hMSL8cRibYyZDPUUb6
 ifX98Lv76YoaYbPnrsyGLbmV4iHP3TfKnahS4DDTAByUdI2zRmxqQzV/+8//5TfJR5MM
 KzZV+W8QZ65LxqvEdFkmitMxP3wtDrd8hbqjYvPi0bPxH3MApSId34mSbWRaLrjPhVp6
 HI+fjhIXYDpPYd2SDdkV5TXD3hrBhPdZzjkjgyqPCDLzHl+uQYWuo7B6aVz5qJZ6CdxP
 CaKw==
X-Gm-Message-State: AOAM530NbaVH8PD9E9NZe7mJlq+bgM+2T/7yQVnsAWyscIoI8eLjohRn
 +M/gdA6W256XL+o4bIM0FP4=
X-Google-Smtp-Source: ABdhPJyWvDGzMWq0WKI05TtZGVb6EyRdreoyH/EKKXTJdx7zBT7lhzaMOshsFn6KmkV/3Oo0PA3JPA==
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr3684362ljg.395.1597165774726; 
 Tue, 11 Aug 2020 10:09:34 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q29sm11784666lfb.94.2020.08.11.10.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2020 10:09:34 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <02f6a5cf-46c3-c216-ad52-707e3409f156@gmail.com>
Date: Tue, 11 Aug 2020 20:09:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 12:32, Julien Grall wrote:

Hi Julien, Stefano

>
>>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
>>> index 5fdb6e8..5823f11 100644
>>> --- a/xen/include/asm-arm/p2m.h
>>> +++ b/xen/include/asm-arm/p2m.h
>>> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct 
>>> domain *d, unsigned long gfn,
>>>                                           mfn_t mfn)
>>>   {
>>>       /*
>>> -     * NOTE: If this is implemented then proper reference counting of
>>> -     *       foreign entries will need to be implemented.
>>> +     * XXX: handle properly reference. It looks like the page may 
>>> not always
>>> +     * belong to d.
>>
>> Just as a reference, and without taking away anything from the comment,
>> I think that QEMU is doing its own internal reference counting for these
>> mappings.
>
> I am not sure how this matters here? We can't really trust the DM to 
> do the right thing if it is not running in dom0.
>
> But, IIRC, the problem is some of the pages doesn't belong to do a 
> domain, so it is not possible to treat them as foreign mapping (e.g. 
> you wouldn't be able to grab a reference). This investigation was done 
> a couple of years ago, so this may have changed in recent Xen.

Well, emulator is going to be used in driver domain, so this TODO must 
be resolved. I suspect that the check for a hardware domain in 
acquire_resource() which I skipped in a hackish way [1] could be simply 
removed once proper reference counting is implemented in Xen, correct?

Could you please provide some pointers on that problem? Maybe some 
questions need to be investigated again? Unfortunately, it is not 
completely clear to me the direction to follow...

***
I am wondering whether the similar problem exists on x86 as well? The 
FIXME tag (before checking for a hardware domain in acquire_resource()) 
in the common code makes me think it is a common issue. From other side 
x86's
implementation of set_foreign_p2m_entry() is exists unlike Arm's one 
(which returned -EOPNOTSUPP so far). Or these are unrelated?
***

[1] https://lists.xen.org/archives/html/xen-devel/2020-08/msg00075.html



-- 
Regards,

Oleksandr Tyshchenko


