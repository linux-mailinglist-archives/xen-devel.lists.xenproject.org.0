Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF91442E010
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 19:29:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209540.366033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb4Wu-00017N-22; Thu, 14 Oct 2021 17:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209540.366033; Thu, 14 Oct 2021 17:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb4Wt-00015a-US; Thu, 14 Oct 2021 17:28:31 +0000
Received: by outflank-mailman (input) for mailman id 209540;
 Thu, 14 Oct 2021 17:28:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gDO=PC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mb4Ws-00015U-Nw
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 17:28:30 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76aef145-c873-46ee-bcc6-0b3b28cdc913;
 Thu, 14 Oct 2021 17:28:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so111308wmg.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Oct 2021 10:28:29 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z5sm10953396wmp.26.2021.10.14.10.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 10:28:28 -0700 (PDT)
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
X-Inumbo-ID: 76aef145-c873-46ee-bcc6-0b3b28cdc913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gAGtEVKf7GWsYXUW7cE1B9HVpmvwdcPM1sZU82VR1og=;
        b=ZK3xIzSKcvHjb4ICgwwzyruswECIF6r5orWOqhAa+JAAi+RKdV/g16WdDBeDDypk0c
         Gzk5U7VtEqIOwmM0Tp7JNBOh7ukGGsYJ8E6Y9JcEWKYk4jLhRXCUsgBRUl9IzI95i4m5
         O8QXM7gWp/dHqmkLLajJsZKR+mIGL4PwHRGCjA72RWwLag93X3eHhUhRrj4Y8i7JWgB9
         5m+WUtQHH4Wub5dkk0uDPYgLM2I5OSkq1TLF+8cnRJi8xwm8fXm/6DUYQAs3c+UVd1vR
         sTZaSlhJnX4a1N1y8ASCR4yK21hpMDvt/Yl18s+Avf2NBJLw+j/GfHWycQdMxK7ABImX
         k4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gAGtEVKf7GWsYXUW7cE1B9HVpmvwdcPM1sZU82VR1og=;
        b=kERH9h/wNfgt3foV3sexvGhPIN4JXZ8BLadpCqUC6Fq33L5D8eEEJHwGYGA5nGqEwl
         voGnonIaxvqdbAZC+AV6CotchYZPnzFH9QC0sxIu8VSoKsuVxa7Zo11NQO6zHTuQMoHn
         GC1PAzltrthSZj6A8EO6JbrmXnQdyBtn9xXhG0gVApfsuB5xFb870J+GIDsoEBmISTcO
         WygXWBPlQ41dIWWbThuyKXV/YS1y5epBMULsA55c+q2nFoWPeOP5cZUFV/eZPb7zg1Ls
         EUti1vuflZ+ZSZ4qdKF3b+kzP8uDpNyOihm7L189NPJhf691fa45Ue/yyagrBkCEIFYD
         90sw==
X-Gm-Message-State: AOAM530JCHpMYHojh2dj3KnFVLHYhfKGtFGyAW4mlwCBLQw+EnOhqz73
	I5il43TzUWNTbe9bPgwG+F0=
X-Google-Smtp-Source: ABdhPJyWSWSNFbtArumOSt9dgz0emAKAqqJP50xQxTIhYXFVlaEfaWJdOQIRJo8STOjuV6oBf7zchg==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr20892891wmk.51.1634232508753;
        Thu, 14 Oct 2021 10:28:28 -0700 (PDT)
Subject: Re: [PATCH V7 0/2] Add handling of extended regions (safe ranges) on
 Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
Message-ID: <52c9dea0-24cb-ae6f-1f74-2a41ca8fc6f2@gmail.com>
Date: Thu, 14 Oct 2021 20:28:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello all


On 14.10.21 14:40, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> You can find an initial discussion at [1]-[7].
>
> The extended region (safe range) is a region of guest physical address space
> which is unused and could be safely used to create grant/foreign mappings instead
> of wasting real RAM pages from the domain memory for establishing these mappings.
>
> The extended regions are chosen at the domain creation time and advertised
> to it via "reg" property under hypervisor node in the guest device-tree
> (the indexes for extended regions are 1...N).
> No device tree bindings update is needed, guest infers the presense of extended
> regions from the number of regions in "reg" property.
> New compatible/property will be needed (but only after this patch [8] or alternative
> goes in) to indicate that "region 0 is safe to use". Until this patch is merged it is
> not safe to use extended regions for the grant table space.
>
> The extended regions are calculated differently for direct mapped Dom0 (with and without
> IOMMU) and non-direct mapped DomUs.
>
> Please note the following limitations:
> - The extended region feature is only supported for 64-bit domain currently.
> - The ACPI case is not covered.
>
> Please note that support for Dom0 was already committed, so these patches are remaining DomU bits.
>
> Xen patch series is also available at [9]. The corresponding Linux patch series is at [10]
> for now (last 4 patches).

So, all Xen changes are already committed (thanks!) and I will start 
trying to push Linux changes. I believe that with your help in review, 
it will be possible to finish this enabling work.


[snip]

-- 
Regards,

Oleksandr Tyshchenko


