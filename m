Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400DB3D93F9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 19:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161744.296839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8n1D-0002KY-Hy; Wed, 28 Jul 2021 17:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161744.296839; Wed, 28 Jul 2021 17:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8n1D-0002Ig-En; Wed, 28 Jul 2021 17:06:55 +0000
Received: by outflank-mailman (input) for mailman id 161744;
 Wed, 28 Jul 2021 17:06:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdfR=MU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m8n1C-0002Ia-2X
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 17:06:54 +0000
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7969ac77-9e8f-41ae-ac7c-abf6d45ef359;
 Wed, 28 Jul 2021 17:06:53 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id e5so3910350ljp.6
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 10:06:52 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id bp40sm50255lfb.221.2021.07.28.10.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 10:06:49 -0700 (PDT)
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
X-Inumbo-ID: 7969ac77-9e8f-41ae-ac7c-abf6d45ef359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/w6CnodQNYyr8bk2hPtGusk9dQaQPBkwwGTVBwgfUHw=;
        b=bWqZu7N6rTn5txCFmpkiSdr9gOtPjvuQ1O9WIurTulfPOvXYa/YoQ/VhrLI41AIs8Q
         MntOi2azZvgd2aDBdZo2VSd5/HP64owM/Lb0l0SgVWViagJbv5cgNKJNWfzxeTQVgo4l
         XiXXom7V3ztjjbsySaypeSf1zSL00GD6mxNSy89x9lJz0QB+w3lzyEyMP72HybskwCld
         gNcbEyEacbu/pFZVxQjFptqSibIbaq99iFiiIq3HUYGaqppxHQ03qLoBUmbizbP8fMaD
         kTbZ/iSihRvzvEsd1AhUbL/3d6z3xUEVB2FRDbeQ6GHp2Oedm3w4g/+pcac8HTC7B7xD
         hhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/w6CnodQNYyr8bk2hPtGusk9dQaQPBkwwGTVBwgfUHw=;
        b=jQkNrk+A0fUkuD9a840+96d27kGm0LIWf11OCE90QO/zvhHCA/6/U/hwGiDyjyXyFs
         bAtoigC10sZHrkLpO3F1RpUnABCq7WW6mqcUrVoS6YYqxbVxi24hWft3GYgHwxbti3TH
         D2v1X40HrtV+2PP9aJkKJM/E3/MAV6KTUjwxwKqI+qHzMGpNQWnavfU0CqDoctNffp+p
         LBvAVfzo4V0Qy6Fw9w12iMqew7VZGk0SB7u8lB1pGoXeDEJHw7DOG5ICsCazgG9wzm4H
         6szrxxpeTEWFgGC85/GUG3Wi4VpouF5tG7DqSWHbpG1yEqqn6xjy88vhEoCECDO2J9w8
         HBzw==
X-Gm-Message-State: AOAM530Hl9rDK26Xu22RDzD45o17MoqbI3MTXFtVV06IQJUURuR0JjmE
	5G8V/o5x9VJ12zKBgiiLZTA=
X-Google-Smtp-Source: ABdhPJxfRDnTIlTVyaTRUgQSB0q/932p84jfL5SKBucII8OQisU7aCyhBJx/J4pfI7ZQF6AETod+Og==
X-Received: by 2002:a2e:b5c8:: with SMTP id g8mr487574ljn.254.1627492009453;
        Wed, 28 Jul 2021 10:06:49 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
Message-ID: <df8588c3-9e2c-682b-641c-633d66602429@gmail.com>
Date: Wed, 28 Jul 2021 20:06:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello all


On 28.07.21 19:18, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Add XENMEM_get_unallocated_space hypercall which purpose is to
> query hypervisor to find regions of guest physical address space
> which are unused and can be used to create grant/foreign mappings
> instead of wasting real pages from the domain memory for
> establishing these mappings. The problem with the current Linux
> on Xen on Arm behaviour is if we want to map some guest memory
> regions in advance or to perform cache mappings in the backend
> we might run out of memory in the host (see XSA-300).
> This of course, depends on the both host and guest memory sizes.
>
> The "unallocated space" can't be figured out precisely by
> the domain on Arm without hypervisor involvement:
> - not all device I/O regions are known by the time domain starts
>    creating grant/foreign mappings
> - the Dom0 is not aware of memory regions used for the identity
>    mappings needed for the PV drivers to work
> In both cases we might end up re-using these regions by
> a mistake. So, the hypervisor which maintains the P2M for the domain
> is in the best position to provide "unallocated space".
>
> The arch code is in charge of finding these regions and filling
> in corresponding array in new helper arch_get_unallocated_space().
>
> This patch implements common and Arm parts, the x86 specific bits
> are left uniplemented for now.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Current patch is based on the latest staging branch:
> 73c932d tools/libxc: use uint32_t for pirq in xc_domain_irq_permission
> and also available at:
> https://github.com/otyshchenko1/xen/commits/map_opt_ml1
>
> The corresponding Linux changes you can find at:
> https://github.com/otyshchenko1/linux/commits/map_opt_ml1
> I am going to publish them soon.

The Linux changes are already pushed. You can find them at:

1. Small prereq patch

https://lore.kernel.org/lkml/1627490656-1267-1-git-send-email-olekstysh@gmail.com/

2. Main patch

https://lore.kernel.org/lkml/1627490656-1267-2-git-send-email-olekstysh@gmail.com/

-- 
Regards,

Oleksandr Tyshchenko


