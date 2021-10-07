Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B74253D2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 15:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203576.358718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTCH-0003pJ-Of; Thu, 07 Oct 2021 13:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203576.358718; Thu, 07 Oct 2021 13:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTCH-0003mV-L4; Thu, 07 Oct 2021 13:12:29 +0000
Received: by outflank-mailman (input) for mailman id 203576;
 Thu, 07 Oct 2021 13:12:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYTCF-0003mP-Hg
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 13:12:27 +0000
Received: from mail-ed1-x535.google.com (unknown [2a00:1450:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2c6fe1c-9027-4008-ad81-94b36ebc5dcd;
 Thu, 07 Oct 2021 13:12:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z20so22827854edc.13
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 06:12:26 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id rv25sm7337064ejb.21.2021.10.07.06.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:12:20 -0700 (PDT)
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
X-Inumbo-ID: b2c6fe1c-9027-4008-ad81-94b36ebc5dcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7lwzSOCbz2WcgE9NMs6IB7xW1wTKSVbMRQ1hnSd/qCM=;
        b=g2gAhL0fnFj8beommIiTbogswBYgxvTSy0ehvdZC+POUfiO+xeFYs6ab2TOCxVcrCu
         DqB+J+JJtFaakv7IsWDkg+EAdGTX9O0PniQqD/MNaictADlZo66UhFwx2pLmFx91i1+d
         ypVyRmsd6iNMf2+/q2+sAYpU1urpFPl9g/HOuU3vZzpSuEmbQluhsnkQqFNwhT3Uqnrw
         yVVNxIZzsL0O5l56lrGS+N14avnW3RkRgqFeWyyiEfRghqJOu1lzLr2KejH8/efZe5XJ
         3ayZ5Kha6w/kLoOVEyBgZIPkvASEUxKoJ1G0NMsvIABZ2ikg4ndowzKDuxDB9XLpKvWo
         /Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7lwzSOCbz2WcgE9NMs6IB7xW1wTKSVbMRQ1hnSd/qCM=;
        b=erqqEY+rmYTc4z+snqjIssbQbcPEeYYzzu6Efn9P+gNfyY/K9nPMPLnWiqR0fV1Sqx
         4ZfBsJyenTWbWrRINt4NKrhZ9D5p/vLtX8vKxqx+15Pokn6tD/bwZJVHa4Vk0X0qlRxH
         fgI+i5lwuP3/2/9/mUQjoMiA+6Rj7r3iJas0NM+HxtlSNXwuYK+rS6OH2iDXT2AJJd/o
         Uihh15VraiqwruVzUhexmd+Zkf5mHyKRyMbrxy6+2O5WvW1Xh3EyQbnfJKOSPqIEyG1T
         kMKUmS7A2KXzWN+FxbHVOcFKhPLkcg66h2CdOC57QhkcpsNKeshX1UnbK/NSs7Aeq5Nn
         VldA==
X-Gm-Message-State: AOAM532AAPS90hxLn5qQgfFlrgPGZA4r+FegAUtZi0dxpsBm/vnhw4lu
	N+8Gml0rMmGwvfftyYtxwYCcxRd4aUI=
X-Google-Smtp-Source: ABdhPJxU+HWQeT9unXP/ti1F9VkKE6OUqwxbeNtt/hMdY1Wfq60GyuIQcVPa7Iw2QY1qcVwQGwib/w==
X-Received: by 2002:a17:906:2e85:: with SMTP id o5mr5416897eji.543.1633612341231;
        Thu, 07 Oct 2021 06:12:21 -0700 (PDT)
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
 <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
 <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com>
Date: Thu, 7 Oct 2021 16:12:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.10.21 15:43, Jan Beulich wrote:

Hi Jan.

> On 07.10.2021 14:30, Oleksandr wrote:
>> On 07.10.21 10:42, Jan Beulich wrote:
>>> On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
>>>> Changes V4 -> V5:
>>>>      - update patch subject and description
>>>>      - drop Michal's R-b
>>>>      - pass gpaddr_bits via createdomain domctl
>>>>        (struct xen_arch_domainconfig)
>>> I'm afraid I can't bring this in line with ...
>>>
>>>> --- a/xen/include/public/arch-arm.h
>>>> +++ b/xen/include/public/arch-arm.h
>>>> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>>>>         *
>>>>         */
>>>>        uint32_t clock_frequency;
>>>> +    /*
>>>> +     * OUT
>>>> +     * Guest physical address space size
>>>> +     */
>>>> +    uint8_t gpaddr_bits;
>>> ... this being an OUT field. Is this really what Andrew had asked for?
>>> I would have expected the entire struct to be IN (and the comment at
>>> the top of the containing struct in public/domctl.h also suggests so,
>>> i.e. your new field renders that comment stale). gic_version being
>>> IN/OUT is already somewhat in conflict ...
>> I am sorry but I'm totally confused now, we want the Xen to provide
>> gpaddr_bits to the toolstack, but not the other way around.
>> As I understand the main ask was to switch to domctl for which I wanted
>> to get some clarification on how it would look like... Well, this patch
>> switches to use
>> domctl, and I think exactly as it was suggested at [1] in case if a
>> common one is a difficult to achieve. I have to admit, I felt it was
>> indeed difficult to achieve.
> Sadly the mail you reference isn't the one I was referring to. It's not
> even from Andrew. Unfortunately I also can't seem to be able to locate
> this, i.e. I'm now wondering whether this was under a different subject.
> Julien, in any event, confirmed in a recent reply on this thread that
> there was such a mail (otherwise I would have started wondering whether
> the request was made on irc). In any case it is _that_ mail that would
> need going through again.

I think, this is the email [1] you are referring to. The subject was changed
to reflect changes in the particular version. This is the third 
proposition of this patch
(the first two were with arch and common field in sysctl).


>> I thought that a comment for struct xen_domctl_createdomain in
>> public/domctl.h was rather related to the struct fields described in the
>> public header than to the arch sub-struct internals described elsewhere.
>> But if my assumption is incorrect, then yes the comment got stale and
>> probably not by changes in current patch, but after adding
>> clock_frequency field (OUT). If so we can add a comment on top of arch
>> field clarifying that internal fields *might* be OUT.
>>
>>
>>> One of the problems with
>>> _any_ of the fields being OUT is that then it is unclear how the output
>>> is intended to be propagated to consumers other than the entity
>>> creating the domain.
>> If I *properly* understood your concern, we could hide that field in
>> struct libxl__domain_build_state and not expose it to struct
>> libxl_domain_build_info. Shall I?
> I'm afraid I'm lost: I didn't talk about the tool stack at all. While
> "consumer" generally means the tool stack, the remark was of more
> abstract nature.
>
> Jan
>
>> [1]
>> https://lore.kernel.org/xen-devel/093bc1d5-bf6a-da0a-78b5-7a8dd471a063@gmail.com/
>>
>>
[1] 
https://lore.kernel.org/xen-devel/6a2a183d-c9d8-df2a-41aa-b25283fab197@gmail.com/


-- 
Regards,

Oleksandr Tyshchenko


