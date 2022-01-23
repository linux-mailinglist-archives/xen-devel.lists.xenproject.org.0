Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0C497107
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jan 2022 12:04:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259672.448133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBaeA-0005XO-NN; Sun, 23 Jan 2022 11:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259672.448133; Sun, 23 Jan 2022 11:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBaeA-0005Ul-JJ; Sun, 23 Jan 2022 11:02:58 +0000
Received: by outflank-mailman (input) for mailman id 259672;
 Sun, 23 Jan 2022 11:02:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nBae9-0005Uf-H0
 for xen-devel@lists.xenproject.org; Sun, 23 Jan 2022 11:02:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nBae8-0002dP-SQ; Sun, 23 Jan 2022 11:02:56 +0000
Received: from [54.239.6.188] (helo=[192.168.0.182])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nBae8-0001tz-IS; Sun, 23 Jan 2022 11:02:56 +0000
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
	bh=3xo31hFLo88gu0F/rhfk1iEvaCfl1IX4gCDrvt9ZAds=; b=sZHuNrtNtkvaQYCAcP7BKieskd
	20xfjkon7iBla5Xa6gIQPWqF4xETJOxRNLBPkNUFwnCWvQ+Dhw8d8PVZaMQ9cYcBGuI62zU0b1QaV
	fFHqOYpsrR5et5egQLqAtlh2xYThK5VLEv+9fxTwHI9PGcLXCwZesosKoyInmUez6aSY=;
Message-ID: <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
Date: Sun, 23 Jan 2022 15:02:52 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220113005855.1180101-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/01/2022 04:58, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> get_free_port will soon be used to allocate the xenstore event channel
> for dom0less domains.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>   xen/common/event_channel.c | 2 +-
>   xen/include/xen/event.h    | 3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index da88ad141a..5b0bcaaad4 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
>       return 0;
>   }
>   
> -static int get_free_port(struct domain *d)
> +int get_free_port(struct domain *d)

I dislike the idea to expose get_free_port() (or whichever name we 
decide) because this can be easily misused.

In fact looking at your next patch (#3), you are misusing it as it is 
meant to be called with d->event_lock. I know this doesn't much matter
in your situation because this is done at boot with no other domains 
running (or potentially any event channel allocation). However, I still 
think we should get the API right.

I am also not entirely happy of open-coding the allocation in 
domain_build.c. Instead, I would prefer if we provide a new helper to 
allocate an unbound event channel. This would be similar to your v1 (I 
still need to review the patch though).

Cheers,

-- 
Julien Grall

