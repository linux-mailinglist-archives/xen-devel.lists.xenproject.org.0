Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD81ED356
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:29:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgVKW-0001Fr-NP; Wed, 03 Jun 2020 15:29:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TSeS=7Q=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jgVKV-0001Fm-Ik
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:29:23 +0000
X-Inumbo-ID: 000b88f8-a5af-11ea-9947-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 000b88f8-a5af-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 15:29:22 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id x202so2137752oix.11
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xnAZW8Hcs0EBvLh2XT6BI1/B/SOSnuCqGjNo31qBRqA=;
 b=uhAsCM5DRqzK2H/ZlNZUANO5IObmtrlHcQROWLCswPX1jqb9/ZcOwYRaJoZRqWsGu3
 6ozscz+GREokNWqZbcVphFTrCITCvdZOEvA7i33umvUfDLAJVoD4FW4oUktRbq/NF8e4
 tJLfz59DnS4UwMigVJU1qHATwpmKbdLbByjRZ3WUTQGTGJdDi1WGxMZAiusKIWAvFALN
 IWQb71k80iPkcKWWUTNH6tU+w2NlFSZhcZGCXtingOU+ov7wZRfLUQ6/9r5Ashbu2Pbm
 /c4+wrIsOEnFpObMGC5Gn31OHqT0BzoTryzB96HyTK5KzfoZXz4/1MFIl1q16fOny9Ul
 Z/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=xnAZW8Hcs0EBvLh2XT6BI1/B/SOSnuCqGjNo31qBRqA=;
 b=mZT8kI668gUcdGFHQt/VFKD9Fne1h34ZXUBhg8txICTJc1rzJG3YkFeRCGFCIiuAdo
 1kqydR7ESOJPbab6HYvUk+ad3uZieN/NNj5GsndB3yb33JDTfPXdr9aqc6yRthlQvfjP
 Ait5+coHBUwJ6U/VPBhU7YKplI30n9pD1MHhf87AEETDD/mKCx4I0osjhydczj2LDKET
 v8EBeXAuuIrX6DtbPpkQOArYpHSjRGRZcOLJQDCXlfQh2B+0AG4WftwPKdd9vy3bUprC
 1orOUJV+cQZdL/rZlJiZCtphOM++a2lB4Sg4Q13R9id9GrHVmWcSTireidqEKQzlxfHB
 697w==
X-Gm-Message-State: AOAM53302aMyelXgD+j5pSFI22U0nTdtA08EY+dEeq2tjY/qVCivbwbb
 Lh6NvZmgV0cnLeksqw48Zg==
X-Google-Smtp-Source: ABdhPJwLU6Qm0QCv6BTBhGtToMQLZFTYPnXO+ZOcILCHQRthbTlo+szYAQmpggIZ8Qgkx+YBu39KAQ==
X-Received: by 2002:aca:210a:: with SMTP id 10mr152772oiz.153.1591198157511;
 Wed, 03 Jun 2020 08:29:17 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
 by smtp.gmail.com with ESMTPSA id v14sm264062oie.20.2020.06.03.08.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 08:29:16 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:38b2:c4d3:8035:d79b])
 by serve.minyard.net (Postfix) with ESMTPSA id 85184180044;
 Wed,  3 Jun 2020 15:29:15 +0000 (UTC)
Date: Wed, 3 Jun 2020 10:29:14 -0500
From: Corey Minyard <minyard@acm.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200603152914.GJ2880@minyard.net>
References: <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
 <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
 <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
 <20200602183420.GE2880@minyard.net>
 <alpine.DEB.2.21.2006021222490.6774@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2006021222490.6774@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: minyard@acm.org
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, Julien Grall <julien@xen.org>,
 roman@zededa.com,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 12:24:05PM -0700, Stefano Stabellini wrote:
> On Tue, 2 Jun 2020, Corey Minyard wrote:
> > Snip
> > 
> > > > > > > whether
> > > > > > > this was already done:
> > > > > > >      1) Does the kernel boot on baremetal (i.e without Xen)? This should
> > > > > > > help
> > > > > > > to confirm whether the bug is Xen is related.
> > > > > > 
> > > > > > Yes it boots
> > > > > > 
> > > > > > >      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did
> > > > > > > you try
> > > > > > > to disable it? This should help to confirm whether swiotlb is the
> > > > > > > problem or
> > > > > > > not.
> > > > > > 
> > > > > > It boots disabling swiotlb-xen
> > > > > 
> > > > > Thank you for the answer! swiotlb-xen should basically be a NOP for dom0. So
> > > > > this suggests swiotlb is doing some transformation on the DMA address.
> > > > > 
> > > > > I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to assume
> > > > > the DMA address space and CPU address space is the same. Is RPI using the
> > > > > same address space?
> > > > 
> > > > Another question, is the DMA request bounced? If so, are we sure the bounce
> > > > buffer is in the first GB?
> > > 
> > > Yes, it is. This is actually where we spent the last few days, and I
> > > found another little related bug in the initialization of the
> > > swiotlb-xen but now I am sure the memory is under 1GB (0x34000000-0x38000000)
> > 
> > Was anything ever resolved on this issue?  It just kind of ended for me,
> > and I looked in the main kernel and didn't find anything that looked
> > related.
> 
> Yes, we have a patch series on the list for the Linux kernel to fix this
> issue but it hasn't been merged yet:
> 
> https://marc.info/?l=linux-kernel&m=159001831406263&w=2

Just FYI, I pulled the changes on top of
  https://github.com/raspberrypi/linux.git rpi-5.4.y
Along with change
  56e35f9c5b87ec dma-mapping: drop the dev argument to arch_sync_dma_for_*
before the series so it applies on 5.4, and I was able to boot and
create a domU.  So:

Tested-by: Corey Minyard <cminyard@mvista.com>

At least on 5.4.  If you think it would be valuable, I can test on
rpi-5.7.y.  I'll be integrating this in with our Pi Xen yocto layer at
https://github.com/MontaVista-OpenSourceTechnology/meta-raspberrypi-xen

Thanks again,

-corey

