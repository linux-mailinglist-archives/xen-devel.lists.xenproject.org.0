Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0CD4267BF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 12:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204626.359795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYn4h-0000ec-Pz; Fri, 08 Oct 2021 10:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204626.359795; Fri, 08 Oct 2021 10:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYn4h-0000cJ-Mm; Fri, 08 Oct 2021 10:25:59 +0000
Received: by outflank-mailman (input) for mailman id 204626;
 Fri, 08 Oct 2021 10:25:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ioNN=O4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYn4g-0000cD-Fa
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 10:25:58 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac96b09d-82ab-4d44-920a-9a7adf7de018;
 Fri, 08 Oct 2021 10:25:57 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b8so34472643edk.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Oct 2021 03:25:56 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q14sm752528eji.63.2021.10.08.03.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:25:55 -0700 (PDT)
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
X-Inumbo-ID: ac96b09d-82ab-4d44-920a-9a7adf7de018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Ic7vekBz5aT8agS7JiQ12kPI052ZpnrnGj83kdhfE3M=;
        b=LTCm+HZROR+zElMlres5bXZ/5RZAIz/AontDMbiub2SVLa5F1TwIUKIxm0lGfkeOMR
         v1XKiDND10sU5kBJ+zQyuompNTLJSGpUuAPmtlnvOavNvI5pmmzzG6xM4bxrZn+5oCz0
         92YDy+w+X9VH5/bf2ZugixGcqCfloKp1GAWjznwNDBns65rcwJgBTqu61WjT8jdxrN+9
         p/EYW65XX0UBYsiU7uI05TJkFnmRdVk2n1/v4hbO9F83Ts55kOtDNfsPoyh//FqU257P
         Y4rWXOg4e3Ghu9hYW0HCLOIfNbgNpf2TLXLL7kGaaNS8Qfg7fBQvtAhNNFAOGNvKVX4I
         G8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Ic7vekBz5aT8agS7JiQ12kPI052ZpnrnGj83kdhfE3M=;
        b=D9tDT7PCnP2BU/cW7/tHCr0cKPPYDxPJIlPCWMo0XtadlZQ//sBxdCPlrVZ17cNxWd
         y8L0icxVja077LUOg3aTIZQzkyHTcNBL96ullfx73JufN3y+SIQPM2E/ME3keOU/czEg
         MBEVeKla8p15OZFxgUkeE5W02Wg1VAaG5b++qTp1Mu1ypfY0t4sarzkPLyZeRokk/TGs
         QRrLAkFLSKrFtFvbnM+w6mg9QrrHoTBAtbXMtZknkndkarbEBl9qUc07sYikAqRlM4x7
         mU87b70DUpn8CMrEo5nnCyWvuyCtzqbSiZNPk1e0KyY/vvWdPXK7sGqTfw9LC4m6L6zF
         crdA==
X-Gm-Message-State: AOAM532iMj4CeRh7VzsYaOQfuPkqZsUFU9+9KFUo4wF45Ihq6OE8bQNH
	m3LfGyzr8w6AG2Xq1s+4uzK4gFKMU2U=
X-Google-Smtp-Source: ABdhPJxqXYdK5ELNh0qJ8A7237U87sT02rnCqLr4Kg8oQ0LpepU1JkcLwaMtEWpEvzTZsz3zlfFo0w==
X-Received: by 2002:a05:6402:50cc:: with SMTP id h12mr14200085edb.112.1633688755691;
        Fri, 08 Oct 2021 03:25:55 -0700 (PDT)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b36e5fb7-6ed0-dc7d-5ed3-c3c9c9ae70b5@gmail.com>
Date: Fri, 8 Oct 2021 13:25:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b8e868a2-9af3-de6c-0683-4bb2ff7821f3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 08.10.21 11:13, Jan Beulich wrote:

Hi Jan

> On 07.10.2021 22:23, Stefano Stabellini wrote:
>> On Thu, 7 Oct 2021, Jan Beulich wrote:
>>> On 07.10.2021 15:12, Oleksandr wrote:
>>>> On 07.10.21 15:43, Jan Beulich wrote:
>>>>
>>>> Hi Jan.
>>>>
>>>>> On 07.10.2021 14:30, Oleksandr wrote:
>>>>>> On 07.10.21 10:42, Jan Beulich wrote:
>>>>>>> On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
>>>>>>>> Changes V4 -> V5:
>>>>>>>>       - update patch subject and description
>>>>>>>>       - drop Michal's R-b
>>>>>>>>       - pass gpaddr_bits via createdomain domctl
>>>>>>>>         (struct xen_arch_domainconfig)
>>>>>>> I'm afraid I can't bring this in line with ...
>>>>>>>
>>>>>>>> --- a/xen/include/public/arch-arm.h
>>>>>>>> +++ b/xen/include/public/arch-arm.h
>>>>>>>> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>>>>>>>>          *
>>>>>>>>          */
>>>>>>>>         uint32_t clock_frequency;
>>>>>>>> +    /*
>>>>>>>> +     * OUT
>>>>>>>> +     * Guest physical address space size
>>>>>>>> +     */
>>>>>>>> +    uint8_t gpaddr_bits;
>>>>>>> ... this being an OUT field. Is this really what Andrew had asked for?
>>>>>>> I would have expected the entire struct to be IN (and the comment at
>>>>>>> the top of the containing struct in public/domctl.h also suggests so,
>>>>>>> i.e. your new field renders that comment stale). gic_version being
>>>>>>> IN/OUT is already somewhat in conflict ...
>>>>>> I am sorry but I'm totally confused now, we want the Xen to provide
>>>>>> gpaddr_bits to the toolstack, but not the other way around.
>>>>>> As I understand the main ask was to switch to domctl for which I wanted
>>>>>> to get some clarification on how it would look like... Well, this patch
>>>>>> switches to use
>>>>>> domctl, and I think exactly as it was suggested at [1] in case if a
>>>>>> common one is a difficult to achieve. I have to admit, I felt it was
>>>>>> indeed difficult to achieve.
>>>>> Sadly the mail you reference isn't the one I was referring to. It's not
>>>>> even from Andrew. Unfortunately I also can't seem to be able to locate
>>>>> this, i.e. I'm now wondering whether this was under a different subject.
>>>>> Julien, in any event, confirmed in a recent reply on this thread that
>>>>> there was such a mail (otherwise I would have started wondering whether
>>>>> the request was made on irc). In any case it is _that_ mail that would
>>>>> need going through again.
>>>> I think, this is the email [1] you are referring to.
>>> Well, that's still a mail you sent, not Andrew's. And while I have yours
>>> in my mailbox, I don't have Andrew's for whatever reason.
>>>
>>> Nevertheless there's enough context to be halfway certain that this
>>> wasn't meant as an extension to the create domctl, but rather a separate
>>> new one (merely replacing what you had originally as a sysctl to become
>>> per-domain, to allow returning varying [between domains] values down the
>>> road). I continue to think that if such a field was added to "create",
>>> it would be an input (only).
>> During the Xen Community Call on Tuesday, we briefly spoke about this.
>> Andrew confirmed that what he meant with his original email is to use a
>> domctl. We didn't discuss which domctl specifically.
>>
>> This patch now follows the same pattern of clock_frequency and
>> gic_version (see xen/include/public/arch-arm.h:struct xen_arch_domainconfig).
>> Note that gic_version is an IN/OUT parameter, showing that if in the
>> future we want the ability to set gpaddr_bits (in addition to get
>> gpaddr_bits), it will be possible.
> Well, as said before - I'm not convinced gic_version being IN/OUT is
> appropriate. At the very least a 2nd way to merely retrieve the value
> would seem to be necessary, so that it's not only the party creating
> the guest which would be able to know.
>
> Since here's we're solely after retrieving the value, I don't see
> the point in altering "create". As you say, domctl can be changed,
> and hence at the point this needs to become an input to "create", it
> could easily be added there.
>
> Jan

Just a quick question. What do you think can XEN_DOMCTL_getdomaininfo be 
reused to retrieve gpaddr_bits? I don't see why not at the moment, but 
maybe there are some implications/concerns which are invisible to me.

I see that arch_get_domain_info() is present, so the field will be 
common, and each arch will write a value it considers
appropriate. This could be a good compromise to not add an extra domctl 
and to not alter domain_create.


-- 
Regards,

Oleksandr Tyshchenko


