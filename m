Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433509086CF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 10:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740449.1147597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI2g4-0006c2-Pp; Fri, 14 Jun 2024 08:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740449.1147597; Fri, 14 Jun 2024 08:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI2g4-0006ZF-LL; Fri, 14 Jun 2024 08:52:56 +0000
Received: by outflank-mailman (input) for mailman id 740449;
 Fri, 14 Jun 2024 07:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oO8k=NQ=cambridgegreys.com=anton.ivanov@srs-se1.protection.inumbo.net>)
 id 1sI1N6-0006sR-8G
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 07:29:16 +0000
Received: from www.kot-begemot.co.uk (ns1.kot-begemot.co.uk [217.160.28.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd3fd67f-2a1f-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 09:29:15 +0200 (CEST)
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1sI1MY-004Axd-Js; Fri, 14 Jun 2024 07:28:42 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.96)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1sI1MU-000Wne-1M; Fri, 14 Jun 2024 08:28:42 +0100
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
X-Inumbo-ID: cd3fd67f-2a1f-11ef-90a3-e314d9c70b13
Message-ID: <b15de345-838b-4cbb-a156-22b527ed03b6@cambridgegreys.com>
Date: Fri, 14 Jun 2024 08:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] ubd: refactor the interrupt handler
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
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
References: <20240531074837.1648501-1-hch@lst.de>
 <20240531074837.1648501-2-hch@lst.de>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
In-Reply-To: <20240531074837.1648501-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett



On 31/05/2024 08:47, Christoph Hellwig wrote:
> Instead of a separate handler function that leaves no work in the
> interrupt hanler itself, split out a per-request end I/O helper and
> clean up the coding style and variable naming while we're at it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>   arch/um/drivers/ubd_kern.c | 49 ++++++++++++++------------------------
>   1 file changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
> index ef805eaa9e013d..0c9542d58c01b7 100644
> --- a/arch/um/drivers/ubd_kern.c
> +++ b/arch/um/drivers/ubd_kern.c
> @@ -447,43 +447,30 @@ static int bulk_req_safe_read(
>   	return n;
>   }
>   
> -/* Called without dev->lock held, and only in interrupt context. */
> -static void ubd_handler(void)
> +static void ubd_end_request(struct io_thread_req *io_req)
>   {
> -	int n;
> -	int count;
> -
> -	while(1){
> -		n = bulk_req_safe_read(
> -			thread_fd,
> -			irq_req_buffer,
> -			&irq_remainder,
> -			&irq_remainder_size,
> -			UBD_REQ_BUFFER_SIZE
> -		);
> -		if (n < 0) {
> -			if(n == -EAGAIN)
> -				break;
> -			printk(KERN_ERR "spurious interrupt in ubd_handler, "
> -			       "err = %d\n", -n);
> -			return;
> -		}
> -		for (count = 0; count < n/sizeof(struct io_thread_req *); count++) {
> -			struct io_thread_req *io_req = (*irq_req_buffer)[count];
> -
> -			if ((io_req->error == BLK_STS_NOTSUPP) && (req_op(io_req->req) == REQ_OP_DISCARD)) {
> -				blk_queue_max_discard_sectors(io_req->req->q, 0);
> -				blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
> -			}
> -			blk_mq_end_request(io_req->req, io_req->error);
> -			kfree(io_req);
> -		}
> +	if (io_req->error == BLK_STS_NOTSUPP &&
> +	    req_op(io_req->req) == REQ_OP_DISCARD) {
> +		blk_queue_max_discard_sectors(io_req->req->q, 0);
> +		blk_queue_max_write_zeroes_sectors(io_req->req->q, 0);
>   	}
> +	blk_mq_end_request(io_req->req, io_req->error);
> +	kfree(io_req);
>   }
>   
>   static irqreturn_t ubd_intr(int irq, void *dev)
>   {
> -	ubd_handler();
> +	int len, i;
> +
> +	while ((len = bulk_req_safe_read(thread_fd, irq_req_buffer,
> +			&irq_remainder, &irq_remainder_size,
> +			UBD_REQ_BUFFER_SIZE)) >= 0) {
> +		for (i = 0; i < len / sizeof(struct io_thread_req *); i++)
> +			ubd_end_request((*irq_req_buffer)[i]);
> +	}
> +
> +	if (len < 0 && len != -EAGAIN)
> +		pr_err("spurious interrupt in %s, err = %d\n", __func__, len);
>   	return IRQ_HANDLED;
>   }
>   
Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>
-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

