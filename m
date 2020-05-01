Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7981C0BA9
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 03:26:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUKQs-0000K9-09; Fri, 01 May 2020 01:25:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7As=6P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jUKQq-0000K4-IC
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 01:25:36 +0000
X-Inumbo-ID: a846b0da-8b4a-11ea-9ad8-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a846b0da-8b4a-11ea-9ad8-12813bfff9fa;
 Fri, 01 May 2020 01:25:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F10582073E;
 Fri,  1 May 2020 01:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588296335;
 bh=UtEHAzTyJf+XEKD4qLwN0fzppM5kmHavBolwyS80XTU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=L47ogOAB1wLYBjttxrzBeGB580Q21RGt2vnd9fXiXrdM0gAvsPynzUpOnd4yNYVeF
 CxooeLBPIuL66jWBQKTK5cIDkav/flZl9GCooAP+cUmeteOHwM3AJf525aybA37Flz
 afyUN+gkcCIpCEqysZjKrupIsDKhVvjq9S7VuSCc=
Date: Thu, 30 Apr 2020 18:25:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 11/12] xen/arm: if xen_force don't try to setup the IOMMU
In-Reply-To: <b60d6ae3-e300-04a1-a884-e73d01a108d5@xen.org>
Message-ID: <alpine.DEB.2.21.2004301249490.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-11-sstabellini@kernel.org>
 <4b4263ba-bf6f-e578-037d-edb8add52aad@xen.org>
 <alpine.DEB.2.21.2004291400340.28941@sstabellini-ThinkPad-T480s>
 <b60d6ae3-e300-04a1-a884-e73d01a108d5@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 30 Apr 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 29/04/2020 22:55, Stefano Stabellini wrote:
> > On Wed, 15 Apr 2020, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 15/04/2020 02:02, Stefano Stabellini wrote:
> > > > If xen_force (which means xen,force-assign-without-iommu was requested)
> > > > don't try to add the device to the IOMMU. Return early instead.
> > > 
> > > 
> > > Could you explain why this is an issue to call xen_force after
> > > iommu_add_dt_device()?
> > 
> > There are two issues. I should add info about both of them to the commit
> > message.
> > 
> > 
> > The first issue is that an error returned by iommu_add_dt_device (for
> > any reason) would cause handle_passthrough_prop to stop and return error
> > right away. But actually the iommu is not needed for that device if
> > xen_force is set.
> 
> During boot, Xen will configure the IOMMUs to fault on any DMA transactions
> that are not valid. So if you don't call iommu_assign_dt_device(), then your
> device will be unusable.
> 
> Without your patch, the user will know directly something went wrong. With
> your patch, the fault may occur much later and be more difficult to
> diagnostics.
> 
> > (In fact, one of the reasons why a user might want to set
> > force-assign-without-iommu is because there are iommu issues with a
> > device.)
> This would not work because of the reasons I explained above. The only way
> would be to configure the IOMMU in bypass mode for that device.
> 
> So you would still need to call the IOMMU subsystem.

What you wrote makes sense and also matches my understanding. But some
of my testing results confused me. I am going to go back and look at
this closely again, but I am thinking of dropping this patch and
avoiding interfering with IOMMU settings.

