Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6A3E08A2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 21:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163984.300162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBMPm-0000c1-Oc; Wed, 04 Aug 2021 19:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163984.300162; Wed, 04 Aug 2021 19:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBMPm-0000ZL-LP; Wed, 04 Aug 2021 19:18:54 +0000
Received: by outflank-mailman (input) for mailman id 163984;
 Wed, 04 Aug 2021 19:18:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2HM=M3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mBMPl-0000ZD-Cm
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 19:18:53 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ad15ec5-788a-4b77-a6f3-aefe965975dd;
 Wed, 04 Aug 2021 19:18:52 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x9so1839518ljj.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 12:18:52 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t30sm224980ljo.124.2021.08.04.12.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 12:18:51 -0700 (PDT)
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
X-Inumbo-ID: 8ad15ec5-788a-4b77-a6f3-aefe965975dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/U30BlgpbARkoUUN/4dr64eDUPin30IaR78x8FCP+/o=;
        b=Zy5vRju14EHQBEwlRWrlarKexLhDyySw5VoTd0ryQAit81CiMT4VMfDir7hVwAxdYs
         pE92l+1uf3QwchjX3NyBmhIE3SmZV4mHY7tuNeeToBzg6BR/ukvj0cWhlIKkH4AzPyw4
         Zl3gohBrjWlbvlGOh5CdmfJIekVqfSxCVboJF7tGPsrHx8r3AVv+G6nyXt9h9757vhs0
         QNwowatA3Siyn9I9xotb2ZoJyaGDFYKGq3bNwW37SsepJKC5b1RXza4gVYgtim+6cwYE
         37g/pKh6FlEiHsckwcklhg5okeqYbJmSYKowCSwQMlXDuPtACgcrGziGEZ06xDN2pZ3x
         V9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/U30BlgpbARkoUUN/4dr64eDUPin30IaR78x8FCP+/o=;
        b=f3rt+ruaezwEDTeKYzSTgGXbXWsHcQ7+q5i9IZuGRSXlERIkE7nE8o/DRJvsx+9kQb
         /d3Pco+q1Kv7Db3uDBhmvXvZ7dMmxQmOGsdP131bZwx9Yn8m00nJoL0EyHk7ohaatcoo
         FFEFE2ZXdm3E70GlQreG4x63fSYdAcsiTXsHoTO+049IE+TV44XmeSkVw0u5C31bghuT
         pj7bc9vb3utTguLSwSVlhvLcSRN0hzHNqEOXZOScot6wg6sIAN1Dec0IxPNtS+Ao8vxk
         JzFVKqH96V2TzVA6UxbteS43hT9dtrvsBiTemyecyNVrTickv2ou52Mt6F9z4o28iGwA
         QUbA==
X-Gm-Message-State: AOAM531M62ALaSupSjbWphkFa1kbbDzNALJbBqhKZQ8TJePs22VdnKPN
	NbTIPMBUFVpbeqAd4g4030o=
X-Google-Smtp-Source: ABdhPJyOq4sBf6N7kKsPdYsSKao/hHQOatfQ5qtkAMQWEHRmb1Z6nbJ8VPBv1Ii4Am/nugMdSxiQ7A==
X-Received: by 2002:a2e:581a:: with SMTP id m26mr561589ljb.401.1628104731429;
        Wed, 04 Aug 2021 12:18:51 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <7d79a197-a126-2eed-3198-c20e63c1eece@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <090ffc19-92fd-5ef9-99d5-affcfdc28ad2@gmail.com>
Date: Wed, 4 Aug 2021 22:18:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d79a197-a126-2eed-3198-c20e63c1eece@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 03.08.21 15:53, Jan Beulich wrote:

Hi, Jan

Thank you for the input.

> On 30.07.2021 18:13, Oleksandr wrote:
>> Well, if new hypercall and, what is more, "the querying hypervisor at
>> runtime to find unused space" model itself is not welcome, I am ok,
>> let's try to create a working system,
>> may we please find a common ground to move this forward (at least on Arm
>> for now, the foreign mapping is the most important question).
>>
>> I got the proposed idea in general, but I haven't connected all dots
>> yet, some points need clarification.
>>
>> 1. The safe range must be defined/allocated in advance and must remain
>> const during the runtime. The safe range must be chosen by the toolstack.
>> [For the initial implementation we can start with some large value
>> (128GB) as discussed above]
>>
>> Questions:
>>
>> - Do we need to inform Xen about that range (via domain_create
>> hypercall, etc)?
>> - What will be in charge of guaranteeing the safety of that range at
>> runtime (reject new mapping requests with possible overlaps, etc), Xen,
>> toolstack or both?
> Well, what other entity than Xen could enforce this? (By implication,
> the answer to the earlier question can imo only be "yes", unless it's
> Xen itself to establish the region.)

Indeed, agree.


>
>> - Where that range should be located in guest address space, should that
>> range be the same for all domains (how GUEST_GNTTAB_BASE(SIZE) for example)
>> or it should be calculated based on actual guest_ram_base(size) for a
>> particular domain?
> The default size may well be fixed or amount-of-memory-dependent, but
> I think there will need to be a way to enlarge the region for guests
> with particular needs.
Well, but why we couldn't just make a large chunk by default which would
satisfy all guests, as it was mentioned earlier in this thread "as it 
doesn't consume resource when not being used"
to avoid an extra configuration option, etc?


>
>> - What about a safe range the Dom0 can use itself? Xen should choose it
>> for Dom0 the same way how toolstack chooses it for other domains, correct?
>>
>> 2. The safe range must be provided to domain using the firmware table.
>> [We can start with the DTB and leave ACPI unimplemented for now,
>> assuming we will be able to solve open questions as discussed above]
>>
>> Questions:
>>
>> - Do we need distinguish between foreign and grant mappings at the
>> domain side at all? Can the same safe range be used for all types of
>> mapping?
> Like Stefano I don't think so.

Agree.

-- 
Regards,

Oleksandr Tyshchenko


