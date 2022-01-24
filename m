Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D38498CAA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 20:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259966.448843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC4yv-0000qD-Vu; Mon, 24 Jan 2022 19:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259966.448843; Mon, 24 Jan 2022 19:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC4yv-0000nT-Se; Mon, 24 Jan 2022 19:26:25 +0000
Received: by outflank-mailman (input) for mailman id 259966;
 Mon, 24 Jan 2022 19:26:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nC4yu-0000nN-8x
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 19:26:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nC4yt-00008S-Ry; Mon, 24 Jan 2022 19:26:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[10.85.42.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nC4yt-0006JS-Lm; Mon, 24 Jan 2022 19:26:23 +0000
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
	bh=Y4sj3Ee8XXTMGIS8CxtGx64+5EBOb+lIpJfzTGEL9sM=; b=X900d7a4X2vQYF1jNROXwTclGn
	E6F7L9yXu8UWVugBsGOhQyEOABJLXQCvGZye7SOb520IBgHr4Q9aiY7kNy98kSHa1qzoJGLnyeaai
	2cvW2B52RhTj6QBp3AXOKb7TCYIZz8U7+WNbTL+Htlplx/lSVCJlAR6FFQE8sOr99CiQ=;
Message-ID: <d5c84296-79a6-5698-802d-4d9ba60dbf24@xen.org>
Date: Mon, 24 Jan 2022 19:26:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211221200305.GA2460476@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112211310000.2060010@ubuntu-linux-20-04-desktop>
 <20211222110414.GA2883815@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2112221627190.2060010@ubuntu-linux-20-04-desktop>
 <20220119120400.GA3779126@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201191644400.19362@ubuntu-linux-20-04-desktop>
 <20220120102147.GA4153317@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201201230480.27308@ubuntu-linux-20-04-desktop>
 <20220121150753.GA898010@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201211236060.27308@ubuntu-linux-20-04-desktop>
 <20220124182249.GA2485483@EPUAKYIW015D>
 <alpine.DEB.2.22.394.2201241056290.27308@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201241056290.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/01/2022 19:06, Stefano Stabellini wrote:
> It looks like XEN_DOMCTL_host_node_by_path and
> XEN_DOMCTL_find_host_compatible_node would also solve the problem but I
> think that a single hypercall that retrieves the entire host DTB would
> be easier to implement

DOMCTL should only be used to handle per-domain information. If we want 
to create a new sub-hypercall of either __HYPERVISOR_platform_op or 
__HYPERVISOR_sysctl_op (not sure which one).

AFAICT, both are versioned.

> and more robust in the long term. >
> hypfs has the advantage that it would create an interface more similar
> to the one people are already used to on Linux systems
> (/proc/device-tree). xl/libxl would have to scan the whole hypfs tree,
> which intuitively I think it would be slower.

Even if you have the binary blob, you would still have to scan the 
device-tree. That said, it is probably going to be potentially a bit 
faster because you have less hypercall.

However, here this is a trade-off between memory use and speed. If you 
want speed, then you may have to transfer up to 2MB every time. So the 
question is do we care more about speed or memory usage?

> Also the feature might be
> harder to implement but I am not sure.
> 
> I don't have a strong preference and this is not a stable interface (we
> don't have to be extra paranoid about forward and backward
> compatibility). So I am fine either way. Let's see what the others think
> as well.

My preference would be to use hypfs as this is cleaner than exposing a blob.

However, are we sure we can simply copy the content of the host 
Device-Tree to the guest Device-Tree for SCMI? For instance, I know that 
for device passthrough there are some property that needs to be altered 
for some devices. Hence, why it is not present. Although, I vaguely 
recalled to have written a PoC, not sure if it was posted on the ML.

Cheeers,

-- 
Julien Grall

