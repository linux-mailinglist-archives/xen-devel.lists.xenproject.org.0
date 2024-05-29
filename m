Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621568D311C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731652.1137285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEcd-0004SE-0Y; Wed, 29 May 2024 08:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731652.1137285; Wed, 29 May 2024 08:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEcc-0004Pi-Tr; Wed, 29 May 2024 08:25:22 +0000
Received: by outflank-mailman (input) for mailman id 731652;
 Wed, 29 May 2024 08:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEcb-0004PY-At
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:25:21 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa224c6c-1d94-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:25:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ED81CCE1185;
 Wed, 29 May 2024 08:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34391C2BD10;
 Wed, 29 May 2024 08:25:10 +0000 (UTC)
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
X-Inumbo-ID: fa224c6c-1d94-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716971112;
	bh=68h8q5F+j4pjKEcxNZSHuDAUqZpgnW57uKiQqJYjvXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cqyEaNLJFYd4VgaxK4xOgO1fLB7/V2NkEYcZNMj3ccG2Mzvpp61LRxO5H4wNFOXas
	 9i9P5vApYqzNiVftsPqH6+3ivxqZDbQQpXB9SIohRK0TdnoPp833Z44jgkjFhNZuhY
	 BGPG5IuhLO8Vo39srFS1asTLrRf87QTWOJrOiQEM6H9VY7vVFKAL0M8AaZGrySb+3e
	 wtua7SU6aKnlakSQaBr/SFZqCqkbfJyWm4sHhHK/vx2ZqIcj/ebCP9P4hluFoJ78kb
	 xa2RVmjSw0F9dLWXjsdQcxM1ZvFiEoX8BWzuuviifbIpZoK74eW2DiuDsdsaVYZzqk
	 NPfPYWCoLxCZw==
Message-ID: <1048ffa4-36bb-4d72-9abf-a8e2dfc874c2@kernel.org>
Date: Wed, 29 May 2024 17:25:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] sr: convert to the atomic queue limits API
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
 <20240529050507.1392041-11-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Assign all queue limits through a local queue_limits variable and
> queue_limits_commit_update so that we can't race updating them from
> multiple places, and free the queue when updating them so that
> in-progress I/O submissions don't see half-updated limits.
> 
> Also use the chance to clean up variable names to standard ones.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


