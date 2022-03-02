Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C194CA07D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 10:20:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282117.480701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPL8t-0004jZ-Qu; Wed, 02 Mar 2022 09:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282117.480701; Wed, 02 Mar 2022 09:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPL8t-0004gc-NY; Wed, 02 Mar 2022 09:19:31 +0000
Received: by outflank-mailman (input) for mailman id 282117;
 Wed, 02 Mar 2022 09:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0dg=TN=gmail.com=matorola@srs-se1.protection.inumbo.net>)
 id 1nPL83-0004eI-Kf
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 09:18:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be961074-9a09-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 10:18:38 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id kt27so2410887ejb.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Mar 2022 01:18:38 -0800 (PST)
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
X-Inumbo-ID: be961074-9a09-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4LuLQynsRS5ZDdiypHmCRhWOSK0fPQgMoxmBubsA8FA=;
        b=YwA2Tp9/WRHVf+AhpCscraLQ5YZMBIbTnjRD9qXALixvArniZHwws+D5eKFYJ4w9RG
         r5YPECm/lP0oAUKfe9WRJhv6+FML2S+XIXHKeVDBXWzTRzpq8V5VyDtMBBLt+RgC4uif
         rGbJjiYJ+RaebcdTWE+lgavU2sjB3KE2oYMSI2g0SnLEMM8BFRLk6tjS00Xev2qK5BZV
         5Ssf9EZ0tsmaxYSBGN+JYRBhKcBJnRtyUIj9fj+nmKF1+vj7CNwKABPlCEiIkg4HqhVl
         prjve+Nrt6ySEZf00Hzlz9gQ4nrt4ykYynGeggVTPypi2WOB4Q0/x8pbTwKWJmRWzNiw
         F8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4LuLQynsRS5ZDdiypHmCRhWOSK0fPQgMoxmBubsA8FA=;
        b=GFGvPjlOUFn81xPWkrRxENldqejC22oH5+Nut87e/EZM2cQ0YsLtjDGTvdjVW7VIlA
         +k354Ma2Vtia76dtDDjJnchsF3YNj0mts1dm/rrKnpNsuAas/8NvK4xpJf42v5kVSFp9
         dTWYaSJEjKk0SosP9UzQglDrV17xHDGMX30XHC8k/mAMnbNxCmSigXR+G/2v93lUj5JE
         vlW4zFJMO1TBXk44rXBn29OP8TIlGrGZ5xGtPG1W0oOWQZxAZ3mrtHBz370BHxiplWvG
         IKYkXLmHy0VGo2fz+3JNS/mYwaX1WHVQ6Fu5sGmX+jyzb/yCUhhUlni4MwwB+NX3phsr
         BTvw==
X-Gm-Message-State: AOAM532F5s+U+InXC7jogGwIoQIEDEFtezY5Msr3gVYTVxuaM1Y22bwn
	CYNbWXxf+R1cWYg+r6Wf1dDJDOeNMa8UyZPgRzY=
X-Google-Smtp-Source: ABdhPJxefZcxfzkkMgbjOK8FTIKDUrSjhwIhlbq76ukZRP/HPSQoF7TsleylqvSIE+LRhSKcwrjAT6lGtFvgDJjKhNk=
X-Received: by 2002:a17:906:9f06:b0:6ce:36da:8247 with SMTP id
 fy6-20020a1709069f0600b006ce36da8247mr21813101ejc.651.1646212718008; Wed, 02
 Mar 2022 01:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20220227143055.335596-1-hch@lst.de> <20220227143055.335596-8-hch@lst.de>
In-Reply-To: <20220227143055.335596-8-hch@lst.de>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Wed, 2 Mar 2022 12:18:26 +0300
Message-ID: <CADxRZqxrjp4erFNorH+XqubZWLRNjw2E14z7vOW537no1eKnhw@mail.gmail.com>
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org, x86@kernel.org, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, 
	linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390 <linux-s390@vger.kernel.org>, linux-hyperv@vger.kernel.org, 
	tboot-devel@lists.sourceforge.net, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 27, 2022 at 7:31 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The IOMMU table tries to separate the different IOMMUs into different
> backends, but actually requires various cross calls.
>
> Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
> in pci-dma.c and then just call into the IOMMU drivers.
...
> --- a/arch/x86/include/asm/iommu_table.h
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_IOMMU_TABLE_H
> -#define _ASM_X86_IOMMU_TABLE_H
> -
> -#include <asm/swiotlb.h>
> -
> -/*
> - * History lesson:
> - * The execution chain of IOMMUs in 2.6.36 looks as so:
> - *
> - *            [xen-swiotlb]
> - *                 |
> - *         +----[swiotlb *]--+
> - *        /         |         \
> - *       /          |          \
> - *    [GART]     [Calgary]  [Intel VT-d]
> - *     /
> - *    /
> - * [AMD-Vi]
> - *
> - * *: if SWIOTLB detected 'iommu=soft'/'swiotlb=force' it would skip
> - * over the rest of IOMMUs and unconditionally initialize the SWIOTLB.
> - * Also it would surreptitiously initialize set the swiotlb=1 if there were
> - * more than 4GB and if the user did not pass in 'iommu=off'. The swiotlb
> - * flag would be turned off by all IOMMUs except the Calgary one.
> - *
> - * The IOMMU_INIT* macros allow a similar tree (or more complex if desired)
> - * to be built by defining who we depend on.
> - *
> - * And all that needs to be done is to use one of the macros in the IOMMU
> - * and the pci-dma.c will take care of the rest.
> - */

Christoph,

Is it possible to keep documentation comments in source files? Or are
they completely irrelevant now?

Thanks.

