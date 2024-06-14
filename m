Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068ED9086D0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 10:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740452.1147603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI2g5-0006hF-1H; Fri, 14 Jun 2024 08:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740452.1147603; Fri, 14 Jun 2024 08:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI2g4-0006bQ-T5; Fri, 14 Jun 2024 08:52:56 +0000
Received: by outflank-mailman (input) for mailman id 740452;
 Fri, 14 Jun 2024 07:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oO8k=NQ=cambridgegreys.com=anton.ivanov@srs-se1.protection.inumbo.net>)
 id 1sI1OG-0007oa-VP
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 07:30:28 +0000
Received: from www.kot-begemot.co.uk (ns1.kot-begemot.co.uk [217.160.28.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7b6474e-2a1f-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 09:30:26 +0200 (CEST)
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1sI1NW-004AyG-4w; Fri, 14 Jun 2024 07:29:42 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.96)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1sI1NT-000Wne-0I; Fri, 14 Jun 2024 08:29:41 +0100
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
X-Inumbo-ID: f7b6474e-2a1f-11ef-b4bb-af5377834399
Message-ID: <b9909e61-7fc2-4d10-8000-d23b7def93de@cambridgegreys.com>
Date: Fri, 14 Jun 2024 08:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] ubd: untagle discard vs write zeroes not support
 handling
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 Bart Van Assche <bvanassche@acm.org>, Damien Le Moal <dlemoal@kernel.org>
References: <20240531074837.1648501-1-hch@lst.de>
 <20240531074837.1648501-3-hch@lst.de>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
In-Reply-To: <20240531074837.1648501-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett



On 31/05/2024 08:47, Christoph Hellwig wrote:
> Discard and Write Zeroes are different operation and implemented
> by different fallocate opcodes for ubd.  If one fails the other one
> can work and vice versa.
> 
> Split the code to disable the operations in ubd_handler to only
> disable the operation that actually failed.
> 
> Fixes: 50109b5a03b4 ("um: Add support for DISCARD in the UBD Driver")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>   arch/um/drivers/ubd_kern.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index 0c9542d58c01b7..093c87879d08ba 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -449,10 +449,11 @@ static int bulk_req_safe_read(
>   
>   static void ubd_end_request(struct io_thread_req *io_req)
>   {
> -	if (io_req->error == BLK_STS_NOTSUPP &&
> -	    req_op(io_req->req) == REQ_OP_DISCARD) {
> -		blk_queue_max_discard_sectors(io_req->req->q, 0);
> -		blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
> +	if (io_req->error == BLK_STS_NOTSUPP) {
> +		if (req_op(io_req->req) == REQ_OP_DISCARD)
> +			blk_queue_max_discard_sectors(io_req->req->q, 0);
> +		else if (req_op(io_req->req) == REQ_OP_WRITE_ZEROES)
> +			blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
>   	}
>   	blk_mq_end_request(io_req->req, io_req->error);
>   	kfree(io_req);
Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>
-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

