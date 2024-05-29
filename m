Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676F8D307A
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731625.1137236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCERO-0006E1-6D; Wed, 29 May 2024 08:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731625.1137236; Wed, 29 May 2024 08:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCERO-0006CU-3Y; Wed, 29 May 2024 08:13:46 +0000
Received: by outflank-mailman (input) for mailman id 731625;
 Wed, 29 May 2024 08:13:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCERM-0006Ay-D8
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:13:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c25a63b-1d93-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:13:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C0E662064;
 Wed, 29 May 2024 08:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D31C2BD10;
 Wed, 29 May 2024 08:13:38 +0000 (UTC)
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
X-Inumbo-ID: 5c25a63b-1d93-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970420;
	bh=QIo4uCV5OL7C/0lr7uj7aSJrY6ALOm2KSU2WDuE+n9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vs/JsUarWt+IojFVJmO8nf1xEFuiF80vD56DlthacWxH/uEfpxVkJo1Nrcs6QZxxq
	 Pmn0gMPmiWSbKF+Fz7knbH+rHcLuGSe7ESzyXmY7MGFw0ToZ2p3ayTMoQggCPIYWWr
	 MbIzeTTCJHYhB2LGdxbLZD0TC+R1ByZ434lytDh+Xyz5Ge0KqL5crvujQZtunoVYKi
	 Ams3qK54YyXYWj2unBULezBx87cSmwZtQ1w7qW3/AqQIfpG9VhjpHgpg/JcGjxTlgB
	 qC8UPDqbQ6kQNgqB5asVxdm9rrmo7slKA3lDydzmgHK3fffKyb9ERgIY/7/ky4cbSE
	 bwm1JTmXJj9Eg==
Message-ID: <5248688e-4832-4243-b0d3-04ef6f459aa4@kernel.org>
Date: Wed, 29 May 2024 17:13:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] sd: simplify the disable case in sd_config_discard
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240529050507.1392041-1-hch@lst.de>
 <20240529050507.1392041-7-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Fall through to the main call to blk_queue_max_discard_sectors given that
> max_blocks has been initialized to zero above instead of duplicating the
> call.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


