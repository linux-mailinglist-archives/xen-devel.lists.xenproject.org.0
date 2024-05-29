Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951B8D3109
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731649.1137276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEaq-0003YA-ME; Wed, 29 May 2024 08:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731649.1137276; Wed, 29 May 2024 08:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEaq-0003VR-JM; Wed, 29 May 2024 08:23:32 +0000
Received: by outflank-mailman (input) for mailman id 731649;
 Wed, 29 May 2024 08:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEao-0003VL-Sa
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:23:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba48e395-1d94-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 10:23:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6A932626B5;
 Wed, 29 May 2024 08:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C398C2BD10;
 Wed, 29 May 2024 08:23:25 +0000 (UTC)
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
X-Inumbo-ID: ba48e395-1d94-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716971008;
	bh=UnLzeIpjO2H8DXobwx0iVT/QPf6bQElmv5UNVtEUT0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O6oJdroelTELWIStQcjdZBa8C9t0BA8C42VKn5vNrwvO9ZdR3rUrwH3ZLwjFFK0Oe
	 HhiPBOH2XVUERxnnGQ6s891sk9q1DG/PnFL0LkBDnOMmP+BS9Xidu7ZeyiJobkI7Mc
	 aurytkNHgMhSMIO6KEtPbr+B/Lm3Ypkam7hGJBLyD18GZpSe9Cj5EF1Kb2puX7kRs5
	 KKnc0fqXHQGePuNkSVkdaId1TdYlGbhhiavhXQgTW+r4g12/5y6OeB3rzT9MZESuNJ
	 vPo1fpxXY6E38PJ/CvZgo2QxoMoClT9dhzC5WZl2dJPLzL0U0DaPQ4DmDMx98s5JET
	 LA3uCxbs7kWag==
Message-ID: <5e23755e-2473-46e3-98c4-1a1e3fb8bfdb@kernel.org>
Date: Wed, 29 May 2024 17:23:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] sd: convert to the atomic queue limits API
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
 <20240529050507.1392041-10-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Assign all queue limits through a local queue_limits variable and
> queue_limits_commit_update so that we can't race updating them from
> multiple places, and free the queue when updating them so that

s/free/freeze

> in-progress I/O submissions don't see half-updated limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

With the above fixed, looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


