Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2A8D52C4
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 22:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733064.1139167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClyd-00075C-2F; Thu, 30 May 2024 20:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733064.1139167; Thu, 30 May 2024 20:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClyc-00072V-Vx; Thu, 30 May 2024 20:02:18 +0000
Received: by outflank-mailman (input) for mailman id 733064;
 Thu, 30 May 2024 20:02:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sClya-00072P-W6
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 20:02:17 +0000
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 809cc256-1ebf-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 22:02:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 008.lax.mailroute.net (Postfix) with ESMTP id 4Vqxwz1Qt3z6Cnk9T;
 Thu, 30 May 2024 20:02:11 +0000 (UTC)
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id TbhOJyciqa7X; Thu, 30 May 2024 20:02:06 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqxwr3ZGLz6Cnk9F;
 Thu, 30 May 2024 20:02:04 +0000 (UTC)
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
X-Inumbo-ID: 809cc256-1ebf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717099326; x=1719691327; bh=mbOtu3q9zjV5nBmJEGmUM2Ch
	lXZYTtjXht6IjdlxuYo=; b=F/EUZ7ZoluH2NApSjB6LS4U+IseVIwCjj1+dB0GQ
	Hzd/jksY/Fw5Zro8gliSKkstCF1FjokCnbsfexxZKJdkTxEAEPIYDNL8Qr6xEnV9
	rJ7hsYcQWK7x55L8pxb/1Sxg7HUnHdJTyGXoCBAKmGZJnKsfm9hEfmMr40tWPhVi
	H6OveqevfRhZsr+gmDFCxlYpIB9o9xQP2SQ9BKfuKoYQ2KM6iZ+h17N6LqEDIWcJ
	VpoHnGJGnHY0dmLgFjDoWjP/wCgsZwF0k5CVqOvxoLdxfHwd8lS4d6WQoZn/kYPz
	/dr2Nfj8gmo+hFuTTKGCcdGS7oOPWkNQF2/83ZmILBkUCA==
X-Virus-Scanned: by MailRoute
Message-ID: <6d52dd83-0cad-448e-8a22-b6f0e1bcac46@acm.org>
Date: Thu, 30 May 2024 13:02:02 -0700
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
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> Fall through to the main call to blk_queue_max_discard_sectors given that
> max_blocks has been initialized to zero above instead of duplicating the
> call.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


