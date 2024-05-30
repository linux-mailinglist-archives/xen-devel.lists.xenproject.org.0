Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F371D8D528D
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733003.1139087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClhq-0008Bq-0H; Thu, 30 May 2024 19:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733003.1139087; Thu, 30 May 2024 19:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClhp-00089X-Tn; Thu, 30 May 2024 19:44:57 +0000
Received: by outflank-mailman (input) for mailman id 733003;
 Thu, 30 May 2024 19:44:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sClhp-0007hJ-15
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:44:57 +0000
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15b3a2a2-1ebd-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 21:44:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4VqxY061N4zlgMVV;
 Thu, 30 May 2024 19:44:52 +0000 (UTC)
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id XhrHqHFE5lIy; Thu, 30 May 2024 19:44:48 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VqxXv0mMXzlgMVR;
 Thu, 30 May 2024 19:44:46 +0000 (UTC)
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
X-Inumbo-ID: 15b3a2a2-1ebd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717098288; x=1719690289; bh=1qawYRnNtHLyKkfk2KIuL7Vw
	Fij1fGlSBD1rE6Kec4k=; b=O+dyHa1DO+LxwuvN37caN3rc79Al5B59aVt872Yy
	myvPBRd3qJOpB/ssbZf9DD6jeQwG3oky5nPyGHmKtOjLfDnHlE+e3wVIfqzpWjOs
	6hfPZNndbOYIdhdiprqYgfQpwZxp2KIDZmAsJBYG5LuLkM6flrrsn+Z7CP3aCzDV
	pwN4+gbFQD4bp6z4s36qcFNV+1waUaRjvrfL+xtNhs1hivVR8LlUKLXvQ4CEJ/sF
	RymJznQ8+fPT5LcsiI4IQupBmhHjJpPce8ad1C01w5LQVIcRKBZRcPzwxcXH/hff
	wu+Gqo4QOptIYFBfw/rmjL36jeH02rPcp9YADbGYnOeaDg==
X-Virus-Scanned: by MailRoute
Message-ID: <2384c3c9-5629-4438-a87b-0e05e1b6f5cc@acm.org>
Date: Thu, 30 May 2024 12:44:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] ubd: untagle discard vs write zeroes not support
 handling
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
 <20240529050507.1392041-2-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Discard and Write Zeroes are different operation and implemented
> by different fallocate opcodes for ubd.  If one fails the other one
> can work and vice versa.
> 
> Split the code to disable the operations in ubd_handler to only
> disable the operation that actually failed.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


