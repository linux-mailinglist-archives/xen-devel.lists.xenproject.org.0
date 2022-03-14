Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E130F4D8F68
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 23:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290477.492636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTt0L-0007tH-NU; Mon, 14 Mar 2022 22:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290477.492636; Mon, 14 Mar 2022 22:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTt0L-0007qU-KO; Mon, 14 Mar 2022 22:17:29 +0000
Received: by outflank-mailman (input) for mailman id 290477;
 Mon, 14 Mar 2022 22:17:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTt0J-0007qO-M6
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 22:17:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTt0I-0006FC-TE; Mon, 14 Mar 2022 22:17:26 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTt0I-0000N1-NB; Mon, 14 Mar 2022 22:17:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=/JMkfVbjvJoUrBVgIkbk7OJ/HowPnJtGt7OZ1kUa3bM=; b=leX+sgX4MgC3Qx+Js6CyHsJzg5
	6gRocbAI2nxjEuZxiTq+GEN95FYnRNmbsPgelh7yAKSboto9mWMAiBvkMlKTWgGPEfADYvkq/ybnM
	FCPFH30/1s7u69U1WyNYsfxaixtAAvI95+zYUKuAKuLIMVlxuVgXYY830Ez5w1BUYSWo=;
Message-ID: <0bba1cf7-dd08-c908-251d-e712eb819a8a@xen.org>
Date: Mon, 14 Mar 2022 22:17:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-36-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 35/36] doc, device-tree: introduce 'colors' property
In-Reply-To: <20220304174701.1453977-36-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:47, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Dom0less uses device tree for DomUs when booting them without using
> Dom0. Add a new device tree property 'colors' that specifies the
> coloring configuration for DomUs when using Dom0less.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

The documentation is small enough that I would prefer if this is folded 
in the patch parsing the property.

> ---
>   docs/misc/arm/device-tree/booting.txt | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index a94125394e..44971bfe60 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -162,6 +162,9 @@ with the following properties:
>   
>       An integer specifying the number of vcpus to allocate to the guest.
>   
> +- colors
> +    A 64 bit bitmask specifying the color configuration for the guest.

Why are we limiting dom0less domUs to 64 colors when Xen can support up 
to 128 colors (potentially more in the future)?

To avoid tie the bindings too much to Xen, I would instead explicitly 
list the colors. Something like:

colors = < 10 20 30 >

This would also help users that manually write the DT to confirm they 
put the correct numbers.

Cheers,

-- 
Julien Grall

