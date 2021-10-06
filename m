Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84523423DBB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 14:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202887.357902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY61w-0002ub-In; Wed, 06 Oct 2021 12:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202887.357902; Wed, 06 Oct 2021 12:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY61w-0002rS-FD; Wed, 06 Oct 2021 12:28:16 +0000
Received: by outflank-mailman (input) for mailman id 202887;
 Wed, 06 Oct 2021 12:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY61v-0002rM-IZ
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 12:28:15 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a97713ad-9cd5-4091-8be2-12cd754e4748;
 Wed, 06 Oct 2021 12:28:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id z11so1581364lfj.4
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 05:28:14 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n19sm155140ljc.17.2021.10.06.05.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 05:28:13 -0700 (PDT)
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
X-Inumbo-ID: a97713ad-9cd5-4091-8be2-12cd754e4748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aFZKv6XjaT2IKFT3rDwvRVqqHJLtengvMplwha1lUF4=;
        b=pOkdNqaN4XaGZg1z8YJtFSoslyBTfKLL3jTM/pURSyBPue3X4Nh4fBAdMe1CfS332M
         x+JWKc2X3IG8T1gwfGO3YfUhy4loYvesqfT4KAFw38pAR9nd6ZB9dNrIU9d8hgAKYa+2
         oxCxGFx4P0xG9EVyaS/pNXWIPdjXzCm4UcxEJH354ZSL4JaaLVRRWLgTmZ/tR5FRpgyH
         0AX/BYn+0HBwtw9Wb5PFgFPZCm+gm/oue63T/IqJ21bzKFzcfYRrwE8rLcdDHButj9F3
         YCWJrypdCkZCI58/iBugcbzExwTXnjb7OiXa2xz1yLxK4ZU0L1gm2dSrazlpRqmZeW5m
         x4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aFZKv6XjaT2IKFT3rDwvRVqqHJLtengvMplwha1lUF4=;
        b=nEEalHHtosNiSdF5pc6T3KEdxWQauxNwG2SPXpaVGfb18DqS8Krz/qey+rhvhVPYME
         ApxLCxxp1+t1qXjkuj2XxDkm/ura3GJRg9t0m3RTBi6Gj+jGJn5M2SuCtYZupSARHf4N
         Ddpf9xKwfD31RwwfWnzAgVi7294IIstJcSoAy6S+oIopE6oADweWtioTRGvPsoaIsYTF
         eGg5KmqZEbZ0TlZAyGwmWoY+6E9JaBWguH+9L5InOglaPMUAPLYgxyPwxFCemF7qkItX
         Uw5NYAsKZpyP28MH4C+lwbpurff7rs5cfBhFAgAFuZR4YRXk43HMJuF6/1HGjk9J1eUY
         EuGA==
X-Gm-Message-State: AOAM532OyQscZZAgPuZqScC/LXoTgZKiG5dqKcE+cC8WjI58Xv7vCxyU
	9HTrZk8mZ0pZnKtrVNczVdU=
X-Google-Smtp-Source: ABdhPJxoy7mlhNGvbG0ddyBsyayoEzvt8NL0ylBO+8G1aEpOINDfmGwtuHFbGRhUSUTP3d6FQUJ33w==
X-Received: by 2002:a2e:a803:: with SMTP id l3mr2684304ljq.74.1633523293670;
        Wed, 06 Oct 2021 05:28:13 -0700 (PDT)
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for
 DomU
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-3-git-send-email-olekstysh@gmail.com>
 <24925.35278.762786.539238@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <224ed316-aac0-3ad4-22a1-efc592e717e2@gmail.com>
Date: Wed, 6 Oct 2021 15:28:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24925.35278.762786.539238@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 06.10.21 14:34, Ian Jackson wrote:

Hi Ian

> Oleksandr Tyshchenko writes ("[PATCH V5 2/3] libxl/arm: Add handling of extended regions for DomU"):
>> The extended region (safe range) is a region of guest physical
>> address space which is unused and could be safely used to create
>> grant/foreign mappings instead of wasting real RAM pages from
>> the domain memory for establishing these mappings.
> Please forgive me for asking this question now, but: why is this
> ARM-specific ?


Sorry, I can't say for sure which x86 mode also suffers from that. I 
might be wrong, but as I understand that x86 in PVH (and HVM?) mode uses 
unpopulated memory ranges (which are unused from Linux PoV, actually 
everything not yet allocated or reserved from "iomem_resource") to 
create foreign/grant mappings. So the real RAM pages are not ballooned 
out to get an physical address space to create these mappings. The 
problem is that we cannot follow Linux advise which memory ranges are 
unused on Arm for several reasons, this is why this patch series makes 
the hypervisor to start allocating and exposing these ranges.

>
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


