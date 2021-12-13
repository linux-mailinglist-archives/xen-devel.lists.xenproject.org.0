Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356E4727AB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 11:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245925.424215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwiDa-0000Zv-LO; Mon, 13 Dec 2021 10:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245925.424215; Mon, 13 Dec 2021 10:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwiDa-0000XT-HZ; Mon, 13 Dec 2021 10:06:02 +0000
Received: by outflank-mailman (input) for mailman id 245925;
 Mon, 13 Dec 2021 10:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EN0M=Q6=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mwiDZ-0000XN-Nh
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 10:06:01 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 460f7c74-5bfc-11ec-a74f-db008197e53d;
 Mon, 13 Dec 2021 11:06:00 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id 207so22858025ljf.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Dec 2021 02:06:00 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v7sm1429635ljj.45.2021.12.13.02.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:05:59 -0800 (PST)
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
X-Inumbo-ID: 460f7c74-5bfc-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3+p/K/dPqEKET7hL3b9ZcXy0P4HrOlPZH162dHBl3b0=;
        b=HuvFh5OaK+Y0d9sQOEx2eg6TGSr5/5JYqu4mG/k3LSNNhxyz1tG0hZ369xcj7xEDKp
         V1coL8VfJv9IXpB+Fq3HIBbR534MpTB9zYRkRibQnCURkpbOiYdaLxI8EA/lTT9MW9GF
         IW8OLQyRLN1n+hr3VCHnPx3p0cruz6cpz9CLoQTs+iM0G0FkdmdYkihBzETMHguXksUD
         QGjZNVSCz5KUyNQGwPOj+d1UMWtFmY5FeG4ajKaOMIHEE2C/LDJ4Q1W6WCHK2npgiTpA
         jc54uozqC19dMtdhdzuidr8lknLk4nUEkq4DuHAjnjcSzyD0hM8umOGWHrLjZ++zEkjA
         opQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3+p/K/dPqEKET7hL3b9ZcXy0P4HrOlPZH162dHBl3b0=;
        b=0pWPDcesIDJ/SQ5NzFEYUN+u1+gD945nbK1NJw4zxxcuUfnslCorSUY1xCLz8BXPDM
         iyEPOMCSG2XYDdsCQ/UWszUOnaHpk46jSD4EYUSEKT0/E8UxZefom1ot/5P9ctUm1tQD
         5gPN8kXvOMt1cnryrqg+FZcLF4OkVN92Zp4ks2D7rk6rt/rPsJ2kRnfzFzXtJm4wKEc6
         9qg+cIVaTx92017o47X6xNN3viQ0HgZ3rPFmJtwsIaYVqxor1Ih0Y5Tbc6e57ndlipd9
         fhcRFTKezd26ms/lY+wMicuJ+iMWvk99NBT2JAzcqG6tlsokysy/lp7/dIirWiJTYhxT
         TG2g==
X-Gm-Message-State: AOAM531jbHJd2UdTF+SZr2vpFh1FPpTxR8k9aDsk2EBPp4t6Dlv5hLY6
	zMXKkjt0F/97PggQnC4RVAw=
X-Google-Smtp-Source: ABdhPJzFzJtbi8+V0qC6wLsHwWcrVtsavuBz4caLCxxdKOOceWdugE0hZ3Jmu5ed1+EZgQ0OAjhCsg==
X-Received: by 2002:a2e:a696:: with SMTP id q22mr27693493lje.423.1639389960237;
        Mon, 13 Dec 2021 02:06:00 -0800 (PST)
Subject: Re: [PATCH 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
Message-ID: <3c3c8641-05f5-56b6-b7b1-6942d6bb5a3d@gmail.com>
Date: Mon, 13 Dec 2021 12:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.11.21 19:51, Oleksandr Tyshchenko wrote:


Hello all.

Gentle reminder.

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The R-Car S4 is an automotive System-on-Chip (SoC) for Car Server/Communication
> Gateway and is one of the first products in Renesas’ 4th-generation R-Car Family.
>
> The integrated IOMMU HW is also VMSA-compatible and supports stage 2 translation
> table format, therefore can be used with current R-Car Gen3 driver with slight
> modifications.
>
> In the context of Xen driver the main differences between Gen3 and S4 are
> the following:
>   - HW capacity was enlarged to support up to 16 IPMMU contexts (sets of page table)
>     and up to 64 micro-TLBs per IPMMU device
>   - the memory mapped registers have different bases and offset
>
> The first part (commits #1-6) is a non-verbatim port of Linux upstream commits
> needed to add support for S4 series easily (prereq work).
> The second part (commits #7-8) is based on the code from the Renesas BSP and
> actually introduces support for R-Car S4 IPMMU.
> The third part (commits #9-10) is misc changes I have locally.
>
> The patch series is based on 4.16.0-rc4 branch and also available at [1].
>
> Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and Renesas Spider
> board with S4 SoC.
>
> [1] https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml1
>
> Oleksandr Tyshchenko (10):
>    iommu/ipmmu-vmsa: Remove all unused register definitions
>    iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
>    iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
>    iommu/ipmmu-vmsa: Add light version of Linux's ipmmu_features
>    iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
>      macro
>    iommu/ipmmu-vmsa: Add utlb_offset_base
>    iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
>    iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
>    iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
>    iommu/arm: Remove code duplication in all IOMMU drivers
>
>   xen/drivers/passthrough/Kconfig          |   6 +-
>   xen/drivers/passthrough/arm/iommu.c      |   7 +
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 278 +++++++++++++++++++------------
>   xen/drivers/passthrough/arm/smmu-v3.c    |  10 --
>   xen/drivers/passthrough/arm/smmu.c       |  10 --
>   5 files changed, 178 insertions(+), 133 deletions(-)
>
-- 
Regards,

Oleksandr Tyshchenko


