Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524808D2F0B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731588.1137175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEEo-0001Et-0p; Wed, 29 May 2024 08:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731588.1137175; Wed, 29 May 2024 08:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEEn-0001Cq-UR; Wed, 29 May 2024 08:00:45 +0000
Received: by outflank-mailman (input) for mailman id 731588;
 Wed, 29 May 2024 08:00:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZuD=NA=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sCEEm-0001Au-JC
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:00:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a98e8d9-1d91-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 10:00:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8C2D6CE1676;
 Wed, 29 May 2024 08:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1365C2BD10;
 Wed, 29 May 2024 08:00:35 +0000 (UTC)
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
X-Inumbo-ID: 8a98e8d9-1d91-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716969637;
	bh=G8ukn4/ipULjaA61nZoKSh0N7cnsV0YBmRdlGxpAHeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SuVzllmYSRfquuJcDcRWnc0GHSPtFNyp26AyBluVbJ0up4tbRtITWjDNuKs1XeKsj
	 9unRV1rYyOv2gxNp3rc+jY9sEkrRoqVZBHFucwYGOw+cZtDcO5G4HtfEKacdVyOA5g
	 6mlURbCvBUcRD04eBHxPfjMS/Igzp8+knm7PD62kn5RYL66jlTq5s1KxPqTq4ABeHL
	 J7gn1nDulWyl0ZYRxhgciUY+N6bzgokG2U4wmuyIXgq6xnWCSKMrB/TqQkHYeFuDg7
	 CGmud4af4+/jP58GUdbsQFpcZukByzTLb1+jCTWsClYve1yVdsTgRE9/fLAmqjluGl
	 t4JqpvDKBOzCw==
Message-ID: <8878dcb7-5f18-4e34-b917-ee5e1ee15cff@kernel.org>
Date: Wed, 29 May 2024 17:00:34 +0900
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
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240529050507.1392041-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 14:04, Christoph Hellwig wrote:
> Discard and Write Zeroes are different operation and implemented
> by different fallocate opcodes for ubd.  If one fails the other one
> can work and vice versa.
> 
> Split the code to disable the operations in ubd_handler to only
> disable the operation that actually failed.
> 
> Fixes: 50109b5a03b4 ("um: Add support for DISCARD in the UBD Driver")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/um/drivers/ubd_kern.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index ef805eaa9e013d..a79a3b7c33a647 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -471,9 +471,14 @@ static void ubd_handler(void)
>  		for (count = 0; count < n/sizeof(struct io_thread_req *); count++) {
>  			struct io_thread_req *io_req = (*irq_req_buffer)[count];
>  
> -			if ((io_req->error == BLK_STS_NOTSUPP) && (req_op(io_req->req) == REQ_OP_DISCARD)) {
> -				blk_queue_max_discard_sectors(io_req->req->q, 0);
> -				blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
> +			if (io_req->error == BLK_STS_NOTSUPP) {
> +				struct request_queue *q = io_req->req->q;
> +
> +				if (req_op(io_req->req) == REQ_OP_DISCARD)
> +					blk_queue_max_discard_sectors(q, 0);
> +				if (req_op(io_req->req) == REQ_OP_WRITE_ZEROES)

Nit: this can be an "else if".

Otherwise, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> +					blk_queue_max_write_zeroes_sectors(q,
> +							0);
>  			}
>  			blk_mq_end_request(io_req->req, io_req->error);
>  			kfree(io_req);

-- 
Damien Le Moal
Western Digital Research


