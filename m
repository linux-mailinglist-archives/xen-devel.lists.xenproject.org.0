Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A1A416798
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 23:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194597.346689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTWQK-0003RS-Sd; Thu, 23 Sep 2021 21:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194597.346689; Thu, 23 Sep 2021 21:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTWQK-0003PO-Oc; Thu, 23 Sep 2021 21:38:32 +0000
Received: by outflank-mailman (input) for mailman id 194597;
 Thu, 23 Sep 2021 21:38:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTWQJ-0003OX-7q
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 21:38:31 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 490fe06e-ce2c-4b0f-b9a9-9d8e847a960d;
 Thu, 23 Sep 2021 21:38:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i25so32055073lfg.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 14:38:29 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h13sm559447lfl.205.2021.09.23.14.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 14:38:28 -0700 (PDT)
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
X-Inumbo-ID: 490fe06e-ce2c-4b0f-b9a9-9d8e847a960d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bT1O7aoUpv2ZOCFLemyoGNNPhvAYsQhrb5a1N4i9tCo=;
        b=nn+jFQUwNcEybu/mxRKn4Rp94Vz54efjQq3YHit2A65BFFTeLulu2OuqnwxbINpwSr
         7KyOCzh7nHgFADRnvKy59gTQlP3emr3fZ0O/OCV/kDao4RLhoIL0zWSJzZADbHqQNszE
         V/gEGCcd8VpV/DFn6wBZQYorOfIjzvWIiNxoGbStP6MFClQGqIgfwlLyHWaJJabLF61S
         bn4aJxekge4Z0HGW2yLw0FWbdEzntxgdeDvZHhyuPwsTaEOor7TOy59tC1BD9K36ak4t
         tItbn12tiHCxVSBL8L9EuITAefsFvid7m61HwX4e85V/3fvRKQWOYH5/5p2g2Du2upZd
         qDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bT1O7aoUpv2ZOCFLemyoGNNPhvAYsQhrb5a1N4i9tCo=;
        b=E6MbU97zIPlp9L+OavLo5mYBd3Eat3wxUaSeQQy9dvXPlr+Ozfu07kK7KzrxMUFyxV
         fcbF6d4yjS7tR2+QleM6//GDxdKDrIeqjR1NTdA/RPehFMAGqPlYftJQgjdTwDf7bFw/
         xB4JIiwekvPt5Eu5BuuxrYQcRRLkBSdeJgGgv4qf91mmsrJMXNpsHdBuwzIt5x66/fQ4
         /iCLe6w1zRRHuoH+1+fY17kOxIDeHNeCEMa/gEodre3LBrqP6UYgidCpuheWPvcAati9
         7vP2WYYBJ3ns/AxJJVSe6hdjsF5WYToIfOQu3PSKGl5WboAGO3n/h+nLc08CR20VBpEA
         mDGQ==
X-Gm-Message-State: AOAM531XWAnSt6Uu0qvMDaYkXSJH1TvuhZYHGpjKZgmgYJQ4YgKbIUXk
	9juTYdrxu3S6SbWeCCkQ1yc=
X-Google-Smtp-Source: ABdhPJxxWGo1dhU0aXwhW8MRLzyH3KEkUV3tr8VWWTuAsiuhT3rQ/BjwjoGnr9f6Rlo5e4DIoBf2tg==
X-Received: by 2002:a05:6512:39cd:: with SMTP id k13mr6244469lfu.289.1632433108696;
        Thu, 23 Sep 2021 14:38:28 -0700 (PDT)
Subject: Re: [future abi] [RFC PATCH V3] xen/gnttab: Store frame GFN in struct
 page_info on Arm
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632425551-18910-1-git-send-email-olekstysh@gmail.com>
 <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1f825e6f-e93f-9332-077d-3fabca718156@gmail.com>
Date: Fri, 24 Sep 2021 00:38:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <de92ab24-a9f0-8f3b-e721-e0465e4dc065@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.09.21 23:59, Andrew Cooper wrote:

Hi Andrew.

> On 23/09/2021 20:32, Oleksandr Tyshchenko wrote:
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>> You can find the related discussions at:
>> https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/
>> https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/
>> https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/
>>
>> ! Please note, there is still unresolved locking question here for which
>> I failed to find a suitable solution. So, it is still an RFC !
> Just FYI, I thought I'd share some of the plans for ABI v2.  Obviously
> these plans are future work and don't solve the current problem.
>
> Guests mapping Xen pages is backwards.  There are reasons why it was
> used for x86 PV guests, but the entire interface should have been design
> differently for x86 HVM.
>
> In particular, Xen should be mapping guest RAM, rather than the guest
> manipulating the 2nd stage tables to map Xen RAM.  Amongst other things,
> its far far lower overhead.
>
>
> A much better design is one where the grant table looks like an MMIO
> device.  The domain builder decides the ABI (v1 vs v2 - none of this
> dynamic switch at runtime nonsense), and picks a block of guest physical
> addresses, which are registered with Xen.  This forms the grant table,
> status table (v2 only), and holes to map into.  Details can be conveyed
> via ACPI table or DT, as applicable
>
> Xen maps the RAM (which is now accounted to the guest, an improvement
> over today) forming the grant and status tables, and grant map/unmap
> hypercalls simplify massively to just {src domid, gref, flags} => slot,
> which also solves the "is the same grant mapped elsewhere?" problem.
>
> There is never a need for HVM guests to map the same grant twice (as it
> controls the first stage tables and can create whatever alias it
> desires), but there's also no need to allow the guest to pick where the
> mapping occurs.  This vastly simplifies both the Xen and guest kernel
> implementations.

That's interesting. Thank you for detailed explanation. I think, I got 
the high level idea.


>
> ~Andrew
>
-- 
Regards,

Oleksandr Tyshchenko


