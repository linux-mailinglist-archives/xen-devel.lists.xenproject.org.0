Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60B4405FFB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 01:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183703.331997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTLE-0003Ke-Sb; Thu, 09 Sep 2021 23:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183703.331997; Thu, 09 Sep 2021 23:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOTLE-0003Hu-OV; Thu, 09 Sep 2021 23:20:24 +0000
Received: by outflank-mailman (input) for mailman id 183703;
 Thu, 09 Sep 2021 23:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+xv=N7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mOTLE-0003Ho-0m
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 23:20:24 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecdb650c-acbe-44d2-b7b7-3024e35dd7eb;
 Thu, 09 Sep 2021 23:20:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id k4so166976lfj.7
 for <xen-devel@lists.xenproject.org>; Thu, 09 Sep 2021 16:20:22 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f21sm340577lfe.108.2021.09.09.16.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 16:20:21 -0700 (PDT)
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
X-Inumbo-ID: ecdb650c-acbe-44d2-b7b7-3024e35dd7eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tJhxMGD54i/lcUR8ooXibQA/tFAz+ffZMN72C3xDPZ8=;
        b=cRedJeJCVhg6CK2ip7s9irCSticVQ4lQtg0VEp1+nYmTLj77h9dxTzUl59dEU6qmfN
         FrsFZs7XUU/KfIkpFnAv3v9lW57ynII5Mj+PMdCMnadYuhDir+aw3jO7o5xDn8NBxu94
         Dij1rrY312ibGsvChlT3iq6+i6B3uCZw22ykTSXxXgC6kvlTiAntvEfYFR8BvKjU80W9
         kOkWGx+huaN6s8JzPZY9CHY6qr9kLQ2zvy7suWD4hqjHg45lcGOkHdqQoSCzYQz3f2HF
         ezkn68BnD/OnDH+Aopf7TH2WRye9IdXQHlJmP8maQon++IxEA5b3/+Z3cA3BqMDMpH4U
         QQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tJhxMGD54i/lcUR8ooXibQA/tFAz+ffZMN72C3xDPZ8=;
        b=U7SDbN3yp5fuW0+EzwjKsOVCJRALWbeF5p6dhfyN8uMMnjFIsHKAu6kvIOQd6Tpzsl
         8Yv2Edc+dtfu8r+MV7n3Tjva/4VH70mcmI6G92McIqQvvLAMADpwxCJGbJ2AP4d43Xzx
         KiVrN6bkqMRtGxGV5k41NjDgmczCYyHBJY0z3BW27P202aFXKhIvaQVQvNCWidc8kLsu
         yHRtBmUqR4NwLVa7ZkToCK7ocYD55FIvDoazSHWWQg6COC/jOItIUOozheOvnOuJKAOw
         r7cidwmQNF4o/6ebv35KJpDWgNL4lP05td/jqDIVKCjtYwClkv8C4N3d7kNLBbnje9tA
         qA9g==
X-Gm-Message-State: AOAM530mi30HXe/26XBsdJVGQWJijbwXOndAjrvfB2t3QPH0sAryzIQn
	bapi2QVHCAuHxaQcIz1xYe8=
X-Google-Smtp-Source: ABdhPJwSmkvui2HtTzArosTJLrwloPgqM/dcU7oZQfjufeFkbe5/QTTYOv7USoAF7bTpklUsB+5cXA==
X-Received: by 2002:ac2:5c46:: with SMTP id s6mr1631266lfp.78.1631229621519;
        Thu, 09 Sep 2021 16:20:21 -0700 (PDT)
Subject: Re: [RFC PATCH 0/3] Add handling of extended regions (safe ranges) on
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
Message-ID: <6b2bea7a-63dc-bb42-9e0b-fb49b05e310a@gmail.com>
Date: Fri, 10 Sep 2021 02:20:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello all

On 07.09.21 20:09, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> You can find an initial discussion at [1].
>
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.
>
> The extended regions are chosen at the domain creation time and
> advertised to it via "reg" property under hypervisor node in
> the guest device-tree.
>
> The extended regions are calculated differently for direct mapped
> Dom0 (with and without IOMMU) and non-direct mapped DomUs.
>
> Please note the following limitations:
> - The extended region feature is only supported for 64-bit domain.
> - The ACPI case is not covered.
>
> Also please note that we haven't figured out yet how to properly
> extend the Xen hypervisor device-tree bindings on Arm (either via new
> compatible or via new property). I decided to go with new property
> for now, but this can be changed. This uncertainty is the main reason
> why this series is marked as RFC.

Sorry, I messed up the device tree binding's purpose here.

New DT property "extended-region" (to inform guest about the presence of 
additional regions in "reg" property) is not really needed. Guest can 
simply infer that from the number of regions
in "reg" property (region 0 - reserved for grant table space, regions 
1...n - extended regions).
Instead, new compatible/property will be needed (but only after this 
patch [1] or alternative goes in) to indicate that "region 0 is safe to 
use". Until this patch is merged it is
not safe to use extended regions for the grant table space.

Thanks to Julien for clarifying these bits.

I am going to remove the advertisement of unneeded "extended-region" 
property in the code and send new version soon.

[1] 
https://lore.kernel.org/xen-devel/1631228688-30347-1-git-send-email-olekstysh@gmail.com/


>
> Patch series is also available at [2].
>
> The corresponding Linux changes is not in a good shape now (require
> some cleanup and refactoring), I will publish them once put them
> in order (I hope, it will be in a few days).
>
> [1] https://lore.kernel.org/xen-devel/1627489110-25633-1-git-send-email-olekstysh@gmail.com/
> [2] https://github.com/otyshchenko1/xen/commits/map_opt_ml2
>
> Oleksandr Tyshchenko (3):
>    xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
>    xen/arm: Add handling of extended regions for Dom0
>    toolstack/arm: Add handling of extended regions for DomU
>
>   tools/include/libxl.h            |   7 ++
>   tools/libs/light/libxl.c         |   2 +
>   tools/libs/light/libxl_arm.c     |  92 +++++++++++++++-
>   tools/libs/light/libxl_types.idl |   2 +
>   xen/arch/arm/domain_build.c      | 233 ++++++++++++++++++++++++++++++++++++++-
>   xen/arch/arm/sysctl.c            |   2 +
>   xen/arch/x86/sysctl.c            |   2 +
>   xen/include/public/sysctl.h      |   3 +-
>   8 files changed, 338 insertions(+), 5 deletions(-)
>
-- 
Regards,

Oleksandr Tyshchenko


