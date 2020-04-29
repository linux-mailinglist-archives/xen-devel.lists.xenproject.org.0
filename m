Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F991BEA99
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 23:56:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTugI-0002da-Cp; Wed, 29 Apr 2020 21:55:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWzR=6N=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTugH-0002dV-FR
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 21:55:49 +0000
X-Inumbo-ID: 2f784d94-8a64-11ea-99c8-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f784d94-8a64-11ea-99c8-12813bfff9fa;
 Wed, 29 Apr 2020 21:55:49 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E0F520757;
 Wed, 29 Apr 2020 21:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588197348;
 bh=diUTY46+qY1IsVc/mNZYrPbo+l09ZUWCWIW8EicgNEY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rmnWq5Sgtw/6VswTwO4tNgtEhHlfx+ZAPpplH7c42S8BmouIEac2pL/+Ya5pYzPkI
 Cmx2JE+Jz4rsGhw1RIoUSIOxdrIrrqEBJUu8f4cQ2uqrPJ22OOGuzOD7RMIsc+3m5C
 gtZ2EZD/G+MC3c+Rv2GAH/7f1Zj23OyZ9XJ7Rtvc=
Date: Wed, 29 Apr 2020 14:55:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 11/12] xen/arm: if xen_force don't try to setup the IOMMU
In-Reply-To: <4b4263ba-bf6f-e578-037d-edb8add52aad@xen.org>
Message-ID: <alpine.DEB.2.21.2004291400340.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-11-sstabellini@kernel.org>
 <4b4263ba-bf6f-e578-037d-edb8add52aad@xen.org>
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

On Wed, 15 Apr 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 15/04/2020 02:02, Stefano Stabellini wrote:
> > If xen_force (which means xen,force-assign-without-iommu was requested)
> > don't try to add the device to the IOMMU. Return early instead.
> 
> 
> Could you explain why this is an issue to call xen_force after
> iommu_add_dt_device()?

There are two issues. I should add info about both of them to the commit
message.


The first issue is that an error returned by iommu_add_dt_device (for
any reason) would cause handle_passthrough_prop to stop and return error
right away. But actually the iommu is not needed for that device if
xen_force is set.

(In fact, one of the reasons why a user might want to set
force-assign-without-iommu is because there are iommu issues with a
device.)


The second issue is about the usage of "xen,force-assign-without-iommu":
it would be useful to let the user set "xen,force-assign-without-iommu"
for devices that are described as behind a SMMU in device tree, but
the SMMU can't actually be used for some reason. Of course, the user
could always manually edit the device tree to make it look like as if
the device is not behind an IOMMU. That would work OK. However, I think
it would be better to avoid making that a requirement.

If we want to allow "xen,force-assign-without-iommu" for a device behind
a SMMU then we need this patch, otherwise this would happen:

    res = iommu_add_dt_device(node); // succeeds
    if ( xen_force && !dt_device_is_protected(node) ) // fails because the device is protected
        return 0;
    return iommu_assign_dt_device(kinfo->d, node); // fails because !is_iommu_enabled(d) which is fine but then handle_prop_pfdt returns error too



All in all, I thought it would make sense to avoid any iommu settings
and potential iommu errors altogether if xen_force is set and return
early.

