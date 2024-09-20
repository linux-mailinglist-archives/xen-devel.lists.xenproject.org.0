Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6597D2CF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 10:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801051.1211080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZ7R-0000Hq-AD; Fri, 20 Sep 2024 08:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801051.1211080; Fri, 20 Sep 2024 08:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZ7R-0000Fg-6P; Fri, 20 Sep 2024 08:36:01 +0000
Received: by outflank-mailman (input) for mailman id 801051;
 Fri, 20 Sep 2024 08:36:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1srZ7Q-0000ED-1v
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 08:36:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srZ7P-0003nC-Hv; Fri, 20 Sep 2024 08:35:59 +0000
Received: from [83.68.141.146] (helo=[10.134.3.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srZ7P-00058q-BX; Fri, 20 Sep 2024 08:35:59 +0000
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
	bh=/o/NqorErGXE0NUplsYaoKcLBsS+tqXT5zgVAVBh6Bo=; b=0WqCJWkCgflg63xmeTkqPAkGFj
	bEQBWBQ1yjHS4xN90LmHFSzoOlWZ+GAE73EpWkwED8sphMSqLJ+k4px7E1i6lPrmwQVMu6WweYvwR
	16idc6eV20EoLj0IDafMyaLZg7Qx6MKyFjtuDj+r0xKPIlrM+Fwwv/TspArPfqKzyxyQ=;
Message-ID: <96c741b6-1938-4fdf-baf6-31c85ef0f323@xen.org>
Date: Fri, 20 Sep 2024 10:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-overlay: Remove ASSERT_UNREACHABLE from
 add_nodes()
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-4-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240919104238.232704-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 19/09/2024 12:42, Michal Orzel wrote:
> The assumption stated in the comment that the code will never get there
> is incorrect. It's enough for the target-path to be incorrect (i.e. user
> error), which will lead to an incorrect overall node path and we will end
> up in this "unreachable" place causing a failure in debug builds.

Looking at the caller, nodes_full_path contain path that was computed 
from the overlay. So I would have assumed the path would be part of the 
new DT. What did I miss?

> 
> Fixes: 0c0facdab6f5 ("xen/arm: Implement device tree node addition functionalities")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/common/dt-overlay.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index 8606b14d1e8e..d18bd12bd38d 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -596,11 +596,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
>           overlay_node = dt_find_node_by_path_from(tr->dt_host_new,
>                                                    nodes_full_path[j]);
>           if ( overlay_node == NULL )
> -        {
> -            /* Sanity check. But code will never come here. */
> -            ASSERT_UNREACHABLE();
>               return -EFAULT;
> -        }
>   
>           /*
>            * Find previous and next node to overlay_node in dt_host_new. We will

Cheers,

-- 
Julien Grall


