Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF391BF8B8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 15:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU8ow-00040I-Sl; Thu, 30 Apr 2020 13:01:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jU8ov-00040B-Dn
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 13:01:41 +0000
X-Inumbo-ID: bb57e79d-8ae2-11ea-9a44-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb57e79d-8ae2-11ea-9a44-12813bfff9fa;
 Thu, 30 Apr 2020 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lIURlg8nYfs0ZUyF0+k0do0WTwB1qNS01kZoRIe5i3Q=; b=OijnRJ2q1Sb6GsHDVJb012sN6r
 Qt46Rz1cIKm3Trsw1StgPMP2H3BliSDGMSdz/qY5RfIt8f/G19F3G1ccirWKmwMW1BInu4nJYad38
 dPeaBhjwSAhQ0IVrvUl75hl78eONbhqjW18cp45qeEm6MwwfSxz08v9UjSgW77cke7Yk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jU8os-0003Er-FB; Thu, 30 Apr 2020 13:01:38 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jU8os-0002sS-6s; Thu, 30 Apr 2020 13:01:38 +0000
Subject: Re: [PATCH 12/12] xen/arm: call iomem_permit_access for passthrough
 devices
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-12-sstabellini@kernel.org>
 <521c8e55-73e8-950f-2d94-70b0c664bd3d@xen.org>
 <alpine.DEB.2.21.2004291318270.28941@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <f7f01eca-2415-e102-318f-0c58606fda96@xen.org>
Date: Thu, 30 Apr 2020 14:01:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004291318270.28941@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 29/04/2020 21:47, Stefano Stabellini wrote:
> On Wed, 15 Apr 2020, Julien Grall wrote: 
> But doesn't it make sense to give domU permission if it is going to get
> the memory mapped? But admittedly I can't think of something that would
> break because of the lack of the iomem_permit_access call in this code
> path.

On Arm, the permissions are only useful if you plan you DomU to delegate 
the regions to another domain. As your domain is not even aware it is 
running on Xen (we don't expose 'xen' node in the DT), it makes little 
sense to add the permission.

Even today, you can map IOMEM to a DomU and then revert the permission 
right after. They IOMEM will still be mapped in the guest and it will 
act normaly.

Cheers,

-- 
Julien Grall

