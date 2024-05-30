Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECB8D52E7
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 22:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733082.1139198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCm5W-0000yD-7f; Thu, 30 May 2024 20:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733082.1139198; Thu, 30 May 2024 20:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCm5W-0000vE-4a; Thu, 30 May 2024 20:09:26 +0000
Received: by outflank-mailman (input) for mailman id 733082;
 Thu, 30 May 2024 20:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CNF=NB=acm.org=bvanassche@srs-se1.protection.inumbo.net>)
 id 1sCm5V-0000v8-1D
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 20:09:25 +0000
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c01328-1ec0-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 22:09:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by 009.lax.mailroute.net (Postfix) with ESMTP id 4Vqy5F1Q97zlgMVW;
 Thu, 30 May 2024 20:09:21 +0000 (UTC)
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AYBsZ1kn-wfP; Thu, 30 May 2024 20:09:17 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: bvanassche@acm.org)
 by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Vqy5720mhzlgMVV;
 Thu, 30 May 2024 20:09:14 +0000 (UTC)
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
X-Inumbo-ID: 80c01328-1ec0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1717099757; x=1719691758; bh=72TYEp9qG+JFxDJOhc8vL98i
	94kXdGccHRpnAQFkti8=; b=nQibsLkJj+e718qU89zq/w3b+Xj7bZcJX1t4S5Ib
	6Y2TqQaSrn/m9KkYDg8nG47BrzEZi5y6e/fkqJH0jKclSqaBOiW4YJTNeGb1Sp0q
	ZkAl4cqRGtJ9BhVg3y0q9c8DIYnTeW34UN3c12ZZq8UlXTpwStkplQ+/oORhUCu1
	CTLLln6gMBNxvppMEcu/G6wtlrVMp25vVLoBMfI4CsCDWdrrCAO59XEhKrT6cbhE
	Cef818A+XIhDPVWZrIoeq54kVP/vsyNbked97rhR5i8C7RP7qmtB77Ne3Id9P9eD
	p014OI2YgEP5j/ozLgrC3mtdb8oHumiTveZFFAH+BafSnw==
X-Virus-Scanned: by MailRoute
Message-ID: <12bdbf52-d97c-4c47-8e8b-bfc10bbdc985@acm.org>
Date: Thu, 30 May 2024 13:09:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] block: add special APIs for run-time disabling of
 discard and friends
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
 <20240529050507.1392041-13-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240529050507.1392041-13-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 22:04, Christoph Hellwig wrote:
> A few drivers optimistically try to support discard, write zeroes and
> secure erase and disable the features from the I/O completion handler
> if the hardware can't support them.  This disable can't be done using
> the atomic queue limits API because the I/O completion handlers can't
> take sleeping locks or freezer the queue.  Keep the existing clearing
> of the relevant field to zero, but replace the old blk_queue_max_*
> APIs with new disable APIs that force the value to 0.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


