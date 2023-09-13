Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A891679F06F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 19:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601510.937520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgTk7-0006qg-7m; Wed, 13 Sep 2023 17:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601510.937520; Wed, 13 Sep 2023 17:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgTk7-0006nI-4p; Wed, 13 Sep 2023 17:33:35 +0000
Received: by outflank-mailman (input) for mailman id 601510;
 Wed, 13 Sep 2023 17:33:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgTk5-0006nC-Kl
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 17:33:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgTk5-0004KM-7T; Wed, 13 Sep 2023 17:33:33 +0000
Received: from [15.248.2.159] (helo=[10.24.67.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgTk5-00077m-0t; Wed, 13 Sep 2023 17:33:33 +0000
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
	bh=7C2MIXPy49yL0+TdNYtdpn9CK3qOX0WWILjKFe6pbuQ=; b=vfYbhSS8UV+CiWZ8dccgojs9iW
	dGim5qBik9ZRJV9MQtV5/cf8ZL3mQxPsDNgNgaXZwmOmx1fxSUVixrdd3W1LKZnYTOlQxZ6b6Mhea
	Z6Ig2ORbsL2UWINKX8S91+QXvQfZwMA9XWXQwN4lcG0AowLRK6AwyhtWScHu+c6rhNBI=;
Message-ID: <b761c7eb-342b-4dba-b521-44b03f8e5fdf@xen.org>
Date: Wed, 13 Sep 2023 18:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Skip Xen specific nodes/properties from hwdom
 /chosen node
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230912105341.16687-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230912105341.16687-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 12/09/2023 11:53, Michal Orzel wrote:
> Skip the following Xen specific host device tree nodes/properties
> from being included into hardware domain /chosen node:
>   - xen,static-heap: this property informs Xen about memory regions
>     reserved exclusively as static heap,
>   - xen,domain-shared-memory-v1: node with this compatible informs Xen
>     about static shared memory region for a domain. Xen exposes a different
>     node (under /reserved-memory with compatible "xen,shared-memory-v1") to
>     let domain know about the shared region,
>   - xen,evtchn-v1: node with this compatible informs Xen about static
>     event channel configuration for a domain. Xen does not expose
>     information about static event channels to domUs and dom0 case was
>     overlooked (by default nodes from host dt are copied to dom0 fdt unless
>     explicitly marked to be skipped), since the author's idea was not to
>     expose it (refer docs/misc/arm/device-tree/booting.txt, "Static Event
>     Channel"). Even if we wanted to expose the static event channel
>     information, the current node is in the wrong format (i.e. contains
>     phandle to domU node not visible by dom0). Lastly, this feature is
>     marked as tech-preview and there is no Linux dt binding in place.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

