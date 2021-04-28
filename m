Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B836D2FB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 09:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119044.225362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbeUN-0005gV-TO; Wed, 28 Apr 2021 07:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119044.225362; Wed, 28 Apr 2021 07:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbeUN-0005fD-QB; Wed, 28 Apr 2021 07:20:03 +0000
Received: by outflank-mailman (input) for mailman id 119044;
 Wed, 28 Apr 2021 07:20:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uJE=JZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lbeUM-0005Wf-7i
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 07:20:02 +0000
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a2386d2-c7dc-428e-9722-5ed356ce97e0;
 Wed, 28 Apr 2021 07:20:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n127so21288002wmb.5
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 00:20:01 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id h63sm2810018wmh.13.2021.04.28.00.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 00:19:59 -0700 (PDT)
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
X-Inumbo-ID: 4a2386d2-c7dc-428e-9722-5ed356ce97e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r5xGVk7hzGDeqe6D9siNjnGXs4m1MYAh6B0t/kk7rXk=;
        b=XbiCyyaQk0Sd1WHxBa9jRmZuW5f3v5+D4/DNHkRdgkjXIHmb4lEg0TgiCKv8iNX6eh
         8510ZbTTR097+zBBiwAOQt5PgDhrb/VD2NI1BUDqZnnJbRKYDTO46wH4d15ve543cTsE
         hA5/HZ8Dtu9yzq3BIbV4IDVL0pWz/hYwr/fhsQzxwhcnHmdjTCQ2UW7/+SaiapELuddf
         yz8/+m8ICAbjbB6x3djqCkNLnN3uTMr7tu5jFrMaM6mYU3h7SCZFznRb7qQjBVXbSHQf
         XwzEdxPOthpH+h062SQazOKgdveCQWtVhgTNSbt+9QK/+nryat8eknq8p2PfFdshYUlj
         yyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=r5xGVk7hzGDeqe6D9siNjnGXs4m1MYAh6B0t/kk7rXk=;
        b=Gd/KSVRmeNAobuFUCmnba0lJG7c0HESyyr6jupWglZuu6hrnSHMKVfz/OGxblKMPZs
         GbbxfBq+GDr5OEOz64c6omZ9/R4m2cLT7mp82cZ2U3ve8la9lnWIPc+yjahMT4/4FZig
         z8kP4ijU/2ntZSPZZxrsfTZFyJcHSBmO06ImjbnOE0c6Q4y5diNGklJyq1CdrRbRjXbH
         J/4Kqu7aHrLS2raTy+9ACUySaJdqzVCjwh2xDBLc5AnNlYc3hLT2yMeT+sW0dkZNSll4
         DBoMS66xGhhUKtb8sCTzxNAcKl2JzYFVqSiVlSucxmdkRMqg1FckqsP2L132xbDuDATe
         UD1A==
X-Gm-Message-State: AOAM533UzkWtwtooTrXBsm6bWCU83vVF+Kvarx083o75IoqYLkCaqD3v
	PkaByUtf3kg6TpehYlpCfdg74urmXX0=
X-Google-Smtp-Source: ABdhPJzreyOhtk6E+heq9UbzAYTMnkmac6Ad/iNc402Ol4Zc5ovemv2y9Pw7wtZENnX58SytF9L9bw==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr2789584wmj.150.1619594400378;
        Wed, 28 Apr 2021 00:20:00 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
To: Jan Beulich <jbeulich@suse.com>, Scott Davis <scott.davis@starlab.io>,
 Scott Davis <scottwd@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
 <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
 <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
Message-ID: <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
Date: Wed, 28 Apr 2021 08:19:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28/04/2021 07:15, Jan Beulich wrote:
> On 28.04.2021 00:00, Scott Davis wrote:
>> On 4/27/21, 2:56 AM, Jan Beulich wrote:
>>> On 26.04.2021 19:25, Scott Davis wrote:
>>>> This patch modifies Xen's behavior when making devices assignable while the
>>>> iommu=no-quarantine command line option is in effect. Currently this option
>>>> only affects device deassignment, causing devices to get immediately assigned
>>>> back to Dom0 instead of to the quarantine dom_io domain. This patch extends
>>>> no-quarantine to device assignment as well, preventing devices from being
>>>> assigned to dom_io when they are made assignable while no-quarantine is in
>>>> effect.
>>>
>>> Well, the term "quarantine" to me means a safety action taken _after_
>>> possible exposure to something "bad". Therefore I see this being specific
>>> to device de-assignment as the logical thing. Hence if a mode like what
>>> you describe was wanted, I don't think it should be the result of
>>> "iommu=no-quarantine".
>>
>> Sorry I'm a bit confused by this. Correct me if wrong, but my understanding is
>> that the purpose of assigning a device to dom_io on de-assignment is to protect
>> Dom0 from the effects of in-flight DMA operations initiated by a DomU. I assumed
>> that the purpose of (temporarily) assigning to dom_io on assignment was the same
>> but in reverse: protecting a DomU from Dom0-initiated ops. Is this not the case?
> 
> Well, no, not really. Dom0 is considered fully trusted for a variety of
> reasons.
> 
>> Also, documentation and code already refer to the operation in question as a
>> "quarantine" (see xl command line docs and libxl__device_pci_assignable_add)
>> and to devices that have undergone it as being "quarantined" (see assign_device
>> in xen/drivers/passthrough/pci.c). So if that is not the correct term, there may
>> be some additional changes needed for consistency. Is there another name that
>> would be more appropriate?
> 
> I don't see what's wrong with the term for how things are currently. If
> you talk about an adjustment to terminology to accompany your proposed
> change - not sure.
> 
>> I would also point out that, currently, there does not appear to be a way for an
>> xl user to opt out of quarantine functionality in either direction other than by
>> manually making devices assignable. There is no xl command line flag to disable
>> it and iommu=no-quarantine will have no effect because any device that xl itself
>> makes assignable will have the struct pci_dev.quarantine flag set, which
>> overrides iommu=no-quarantine. Is that intentional?
> 
> Not sure here either: It may also have been that it was assumed to not
> be of interest. Paul?
> 

TBH I'm not sure. When I implemented quarantining it was non-optional 
for good reason and no-quarantine came along later (and somewhat 
hurriedly IIRC).

>> If I misunderstood and your objection is simply that "quarantine-on-assignment"
>> and "quarantine-on-deassignment" should be controllable by separate iommu
>> options, that's an easy enough change to make.
> 
> Yes, effectively it's that what I think things would want to be, if
> "quarantine-on-assignment" is really something that we think is needed.
> It would default to off imo.
> 
>> Although I think that might also
>> negate the need for/effect of struct pci_dev.quarantine as described above. If
>> that's what is desired, any thoughts on what the new option(s) should be called?
> 
> Following the extension to the command line option I'm putting in place
> in "IOMMU: make DMA containment of quarantined devices optional" (which
> I still need to get around to address review feedback for and resubmit),
> I'd be inclined to suggest "iommu=quarantine=always" or
> "iommu=quarantine=on-assign". Unless of course we'd prefer to have the
> caller of the assignment operation have full control over the behavior
> here anyway (in which case a command line option control simply is not
> necessary).
> 

I'm still not entirely sure why not quarantining on is a problem, other 
than it triggering an as-yet undiagnosed issue in QEMU, but I agree that 
that the expectation of 'no-quarantine' meaning just that (i.e. the old 
dom0->domU and domU->dom0 transitions are re-instated) is reasonable. Do 
we really want yet more command line options?

   Paul

