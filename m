Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26003B08F61
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 16:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046941.1417334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPcT-0001jo-R0; Thu, 17 Jul 2025 14:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046941.1417334; Thu, 17 Jul 2025 14:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPcT-0001hn-Nj; Thu, 17 Jul 2025 14:29:57 +0000
Received: by outflank-mailman (input) for mailman id 1046941;
 Thu, 17 Jul 2025 14:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYrA=Z6=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1ucPcS-0001hh-Ox
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 14:29:56 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 817bb840-631a-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 16:29:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F77A60203;
 Thu, 17 Jul 2025 14:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C995EC4CEE3;
 Thu, 17 Jul 2025 14:29:52 +0000 (UTC)
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
X-Inumbo-ID: 817bb840-631a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752762593;
	bh=MQ/V5O4gwMWWZiiQWgLcEa/uMk6GSBagVIe6VFDIR+0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IJMdgrzdPS6k5SSgLA/r1SRqj1i6h5d7PqoiQUFITVAd3zPcn9PJIRhansB5qZM7O
	 XhGSOQmmvOPVBf5+y+ZEzB4jAs8q8mBWeSWxPfTjCB9Vt+1+G0zolH13b8ud0Mpzym
	 ZoV0ogSgcCMfmE/QF0nUDyckbpJeOyZI6HGuyzr0wmy8UaED6TXgi1QuGtvKN6r0gW
	 6/P7Gunt4DRCpp3pZ89PZNX8NR+orine35v7uFeqg4kM4a+Gw6kdHDEXOh01TPc4KB
	 EJMQocNLv7PaKhxPCsRIe+Nh95dItvNJ4rZQvaPS4LohIos9L4XyNaHJByyBZJXrEg
	 4Ce6yRvOPyZPw==
Date: Thu, 17 Jul 2025 07:29:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
Cc: "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Oleksandr Tyshchenko"
 <oleksandr_tyshchenko@epam.com>, "Wei Liu" <wei.liu@kernel.org>, "Paul
 Durrant" <paul@xen.org>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, "Elliott Mitchell" <ehem+xen@m5p.com>
Subject: Re: [PATCH v2] xen/netfront: Fix TX response spurious interrupts
Message-ID: <20250717072951.3bc2122c@kernel.org>
In-Reply-To: <20250715160902.578844-2-anthoine.bourgeois@vates.tech>
References: <20250715160902.578844-2-anthoine.bourgeois@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Jul 2025 16:11:29 +0000 Anthoine Bourgeois wrote:
> Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel storms")

Not entirely sure who you expect to apply this patch, but if networking
then I wouldn't classify this is a fix. The "regression" happened 4
years ago. And this patch doesn't seem to be tuning the logic added by
the cited commit. I think this is an optimization, -next material, and
therefore there should be no Fixes tag here. You can refer to the commit
without the tag.

> @@ -849,9 +847,6 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
>  	tx_stats->packets++;
>  	u64_stats_update_end(&tx_stats->syncp);
>  
> -	/* Note: It is not safe to access skb after xennet_tx_buf_gc()! */
> -	xennet_tx_buf_gc(queue);
> -
>  	if (!netfront_tx_slot_available(queue))
>  		netif_tx_stop_queue(netdev_get_tx_queue(dev, queue->id));

I thought normally reaping completions from the Tx path is done
to prevent the queue from filling up, when the device-generated
completions are slow or the queue is short. I say "normally" but
this is relatively a uncommon thing to do in networking.
Maybe it's my lack of Xen knowledge but it would be good to add to
the commit message why these calls where here in the first place.
-- 
pw-bot: cr

