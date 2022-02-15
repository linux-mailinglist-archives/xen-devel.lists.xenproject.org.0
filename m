Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A899E4B7509
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 21:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273540.468768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4Pe-00039x-Do; Tue, 15 Feb 2022 20:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273540.468768; Tue, 15 Feb 2022 20:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4Pe-000373-AG; Tue, 15 Feb 2022 20:27:02 +0000
Received: by outflank-mailman (input) for mailman id 273540;
 Tue, 15 Feb 2022 20:27:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nK4Pd-00036t-4s
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 20:27:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4Pd-0001RP-1Q; Tue, 15 Feb 2022 20:27:01 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[192.168.8.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4Pc-0002f3-SQ; Tue, 15 Feb 2022 20:27:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=oqfpihFNn+BLrt42di9PuxzkmDDvafbpeo3tQfeK3QA=; b=aLiYcwoz7afy7Y4Tlcq52yv++X
	Y6fqNdUZRh+/WtwqauBvpCGpBpI1GC5bwe4nE7PShQT61y9/T+Hb6ykyXlgKhcC8RbvJzVi2mLW42
	35jcoj3+Tb+TtI8bTAeivrCJ8rfTtR+mU6+UvnsCCaYOMfch18t9Bg6BC/FGCbVolhJ0=;
Message-ID: <1df77480-bb6b-4ac8-dfa2-f167bce51ffb@xen.org>
Date: Tue, 15 Feb 2022 20:26:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v6 03/11] xen/arm: Allow device-passthrough even the IOMMU
 is off
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220214031956.3726764-1-penny.zheng@arm.com>
 <20220214031956.3726764-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220214031956.3726764-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/02/2022 03:19, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> At the moment, we are only supporting device-passthrough when Xen has
> enabled the IOMMU. There are some use cases where it is not possible to
> use the IOMMU (e.g. doesn't exist, hardware limitation, performance) yet
> it would be OK to assign a device to trusted domain so long they are
> direct-mapped or the device doesn't do DMA.
> 
> Note that when the IOMMU is disabled, it will be necessary to add
> xen,force-assign-without-iommu for every device that needs to be assigned.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

