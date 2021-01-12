Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11B2F3C47
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 23:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66169.117429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzS4Z-0008GG-QI; Tue, 12 Jan 2021 22:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66169.117429; Tue, 12 Jan 2021 22:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzS4Z-0008Fp-L5; Tue, 12 Jan 2021 22:23:31 +0000
Received: by outflank-mailman (input) for mailman id 66169;
 Tue, 12 Jan 2021 22:23:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzS4X-0008Fk-Fu
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 22:23:29 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d60577c6-a1b5-4951-85c6-9ee4d4ba5832;
 Tue, 12 Jan 2021 22:23:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g8so3282746wme.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 14:23:28 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n3sm6904166wrw.61.2021.01.12.14.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:23:26 -0800 (PST)
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
X-Inumbo-ID: d60577c6-a1b5-4951-85c6-9ee4d4ba5832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4tLhNFY5eM/BdsleL4+JFzAGJ97N80D9JBWUDFZUx1k=;
        b=YIqCMg+PtU77zwu9Oj4PfuUZfd1/eAN10u9bs5DZzps6AaYmYgt6orL44wWfwHL4dY
         ThnDRy2EsgMK/N0ELNjRO6cdGQkuiQFsnSENecbvHRYsMnvvVTtsvAS5b31Pb/vfer7w
         dWINzUSwTerD+UwxopOJ4VsBWpjGX5HC7it/W6qQks/g3ziwGbQ/j070lHfUVWLiqQek
         8Uz5e2zzuX4Ubvrt3i6Fqx/2o35iZiBnQXbMCfNEtoCSSazQ1zU1CpXH5/kCJqB7wQVo
         9qKaDx7CpXk6uScDBRBey3RtcxMate/+AtHSIPPHG9CrgmoV7+doGFGkWsQ4egTvcnl7
         s2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4tLhNFY5eM/BdsleL4+JFzAGJ97N80D9JBWUDFZUx1k=;
        b=Ryw1LSHysutICx+3z1sw59BVJLpn1x4WAuX4RnJ8iSs1dRDHyEP/fXbP/G5LfydHrP
         2ChraZvXP7o0hBvtpW2NQrDh+6lfUzUf0Q9tssHeR85ftt+vJGUP9UI2Ti6AlsCZP/IX
         W10ZeE/Mp/yjSHbxuD1cJDAZ6v0rmkBlP9PnBUjSqBhHNVwky7mmA1Slc4jtJTpr+1U/
         CozdBkFKSh5i2279AKh+Q5miVPH02y7y+uLlXBwvdbxDFxFiBfheH+DlclrP35r70bdv
         rvOal/78xKLKkr4z4dUaWbrSntYP0IzcEMA3Kw45cOoMNbiFe3BDFddUUar7nztJLhT1
         AHng==
X-Gm-Message-State: AOAM531AD8qdxSHOEkXRqHoSuIGTNxvalrJeUrLwq9M+vPTEO6k72R7D
	6vyoKHphPNS2X3JUu/JbdIxhVJU2SFB27w==
X-Google-Smtp-Source: ABdhPJzTC6/gfblUOTbiqvijeafYrWS4uD9j91I5Xm/KC+hqKqRtz8CI6dSFUPz6Jo4J+xz6LXKYMw==
X-Received: by 2002:a1c:4489:: with SMTP id r131mr1282834wma.24.1610490207146;
        Tue, 12 Jan 2021 14:23:27 -0800 (PST)
Subject: Re: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
 <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
 <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
 <7c985117-2bb4-dd5b-53cf-e217e25b2e8e@suse.com>
 <f7d06c56-7f76-9ba7-6797-ebd9cf133479@gmail.com>
 <94c20a50-9363-c8d1-11aa-7a35f97a03a6@gmail.com>
 <318580a5-d02f-9663-cc58-dfad8a4f7836@suse.com>
 <7ca63ab6-85c8-2b5a-2be9-dcb4aaed7ac3@gmail.com>
Message-ID: <87036ec1-0bb4-43a4-60c1-25ced6ac0a97@gmail.com>
Date: Wed, 13 Jan 2021 00:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7ca63ab6-85c8-2b5a-2be9-dcb4aaed7ac3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Jan.


On 07.01.21 18:49, Oleksandr wrote:
>
> On 07.01.21 17:01, Jan Beulich wrote:
>
> Hi Jan, all
>
>> On 07.01.2021 15:38, Oleksandr wrote:
>>>>> Well, on v2 you replied you didn't consider the alternative. I would
>>>>> have expected that you would at least go through this consideration
>>>>> process, and see whether there are better reasons to stick with the
>>>>> apparently backwards arrangement than to change to the more
>>>>> conventional one. If there are such reasons, I would expect them to
>>>>> be called out in reply and perhaps also in the commit message; the
>>>>> latter because down the road more people may wonder why the more
>>>>> narrow / special set of cases gets handled at a higher layer than
>>>>> the wider set of remaining ones, and they would then be able to find
>>>>> an explanation without having to resort to searching through list
>>>>> archives.
>>>> Ah, will investigate. Sorry for not paying enough attention to it.
>>>> Yes, IOREQ (I mean "common") ops are 7 out of 18 right now. The
>>>> subsequent patch is adding one more DM op - XEN_DMOP_set_irq_level.
>>>> There are several PCI related ops which might want to be common in the
>>>> future (but I am not sure).
>>> I think, I can say that I have considered the alternative (doing it the
>>> other way around), of course if I got your suggestion for V2 correctly.
>>> Agree, the alternative is more natural, also compat_dm_op() was left in
>>> x86 code. For me the downside is in code duplication. With the
>>> alternative both arches have to duplicate do_dm_op() and "common" part
>>> of dm_op()
>>> (only "switch ( op.op )" is unique).
>> Yes, this duplication is the main downside.
>>
>>> Now the question is which approach to take ("current" or "alternative")
>>> for me to prepare for V4. Personally, I would be OK with the both (with
>>> a little preference for "alternative").
>> Same here. I don't think I've seen anyone else voice an opinion.
>
> Well, let's wait a bit for other opinions... @Julien, @Paul what do 
> you think on that?
>
>
>>
>>> Also, If we decide to go with the alternative, should the common files
>>> still be named dm.*?
>> I think this should live in ioreq.c, just like e.g.
>> iommu_do_pci_domctl() lives in passthrough/pci.c. This would then
>> allow quite a few things to become static in that file, I believe.
>
> I got it. It seems yes, at least the following could became static:
>
> ioreq_server_create
> ioreq_server_get_info
> ioreq_server_map_io_range
> ioreq_server_unmap_io_range
> ioreq_server_set_state
> ioreq_server_destroy


Well, I have already pushed V4 with this "alternative" approach, let's 
discuss there [1].


[1] 
https://lore.kernel.org/xen-devel/1610488352-18494-10-git-send-email-olekstysh@gmail.com/T/#mb08f75657f43df869596c5c9c30e2395a9e35c7a


-- 
Regards,

Oleksandr Tyshchenko


