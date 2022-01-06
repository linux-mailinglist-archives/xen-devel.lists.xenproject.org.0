Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A478E4862C9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 11:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253882.435173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5PpS-0003ED-DU; Thu, 06 Jan 2022 10:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253882.435173; Thu, 06 Jan 2022 10:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5PpS-0003BD-9Z; Thu, 06 Jan 2022 10:17:06 +0000
Received: by outflank-mailman (input) for mailman id 253882;
 Thu, 06 Jan 2022 10:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2x37=RW=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1n5Pki-00036k-Eq
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 10:12:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ae8e8f7-6ed9-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 11:12:11 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF134B81FEA;
 Thu,  6 Jan 2022 10:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902D9C36AE5;
 Thu,  6 Jan 2022 10:12:05 +0000 (UTC)
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
X-Inumbo-ID: 1ae8e8f7-6ed9-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641463926;
	bh=bXBGt8cu8ZIBsgJuNGhQMZB9C4N3I6uB9QRkqbs23Kw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=MWXR9JrIaAhMnuFEPyru/cJYqBm+CCqeNemZK2Pz2vIyyCOBoT4oIEiqPlwK7fKA+
	 ipwcPYDu0qEu38h4jri77+5iEVHvkeAtX90peIqw8Ehx1TUeBy+2YujAP5j9tMeeg+
	 xPAUr300T9H7xa41fOMPhEWbiV+2Es0ZQmvH/ZJVEJQg7seYmlecQlSKr+M6d+V0hC
	 e2XDEHSw3MO9VY+JIjTDFLhZIEb0SxvPsQnSP/Gz38YWYhQtZY1+nx8r62d/rmBkab
	 yJKyRCP9cAMrGvqwrw8tuWhoThpY+Q96dOjVYNxPmRtWrls2hT2EnjW9tXmg1xFmrA
	 5ss1Wf6Nr2Gvw==
From: SeongJae Park <sj@kernel.org>
To: Maximilian Heyne <mheyne@amazon.de>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Jens Axboe" <axboe@kernel.dk>,
	"Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
	"Anthony Liguori" <aliguori@amazon.com>,
	"SeongJae Park" <sjpark@amazon.de>,
	"Juergen Gross" <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] xen, blkback: fix persistent grants negotiation
Date: Thu,  6 Jan 2022 10:11:56 +0000
Message-Id: <20220106101156.16362-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220106091013.126076-1-mheyne@amazon.de>

From: SeongJae Park <sjpark@amazon.de>

On Thu, 6 Jan 2022 09:10:13 +0000 Maximilian Heyne <mheyne@amazon.de> wrote:

> Given dom0 supports persistent grants but the guest does not.
> Then, when attaching a block device during runtime of the guest, dom0
> will enable persistent grants for this newly attached block device:
> 
>   $ xenstore-ls -f | grep 20674 | grep persistent
>   /local/domain/0/backend/vbd/20674/768/feature-persistent = "0"
>   /local/domain/0/backend/vbd/20674/51792/feature-persistent = "1"
> 
> Here disk 768 was attached during guest creation while 51792 was
> attached at runtime. If the guest would have advertised the persistent
> grant feature, there would be a xenstore entry like:
> 
>   /local/domain/20674/device/vbd/51792/feature-persistent = "1"
> 
> Persistent grants are also used when the guest tries to access the disk
> which can be seen when enabling log stats:
> 
>   $ echo 1 > /sys/module/xen_blkback/parameters/log_stats
>   $ dmesg
>   xen-blkback: (20674.xvdf-0): oo   0  |  rd    0  |  wr    0  |  f    0 |  ds    0 | pg:    1/1056
> 
> The "pg: 1/1056" shows that one persistent grant is used.
> 
> Before commit aac8a70db24b ("xen-blkback: add a parameter for disabling
> of persistent grants") vbd->feature_gnt_persistent was set in
> connect_ring. After the commit it was intended to be initialized in
> xen_vbd_create and then set according to the guest feature availability
> in connect_ring. However, with a running guest, connect_ring might be
> called before xen_vbd_create and vbd->feature_gnt_persistent will be
> incorrectly initialized. xen_vbd_create will overwrite it with the value
> of feature_persistent regardless whether the guest actually supports
> persistent grants.
> 
> With this commit, vbd->feature_gnt_persistent is set only in
> connect_ring and this is the only use of the module parameter
> feature_persistent. This avoids races when the module parameter changes
> during the block attachment process.
> 
> Note that vbd->feature_gnt_persistent doesn't need to be initialized in
> xen_vbd_create. It's next use is in connect which can only be called
> once connect_ring has initialized the rings. xen_update_blkif_status is
> checking for this.
> 
> Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>

Thank you for this patch!

Reviewed-by: SeongJae Park <sjpark@amazon.de>

Also, I guess this tag is needed?

Cc: <stable@vger.kernel.org> # 5.10.x


Thanks,
SJ

> ---
>  drivers/block/xen-blkback/xenbus.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index 914587aabca0c..51b6ec0380ca4 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -522,8 +522,6 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
>  	if (q && blk_queue_secure_erase(q))
>  		vbd->discard_secure = true;
>  
> -	vbd->feature_gnt_persistent = feature_persistent;
> -
>  	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
>  		handle, blkif->domid);
>  	return 0;
> @@ -1090,10 +1088,9 @@ static int connect_ring(struct backend_info *be)
>  		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
>  		return -ENOSYS;
>  	}
> -	if (blkif->vbd.feature_gnt_persistent)
> -		blkif->vbd.feature_gnt_persistent =
> -			xenbus_read_unsigned(dev->otherend,
> -					"feature-persistent", 0);
> +
> +	blkif->vbd.feature_gnt_persistent = feature_persistent &&
> +		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
>  
>  	blkif->vbd.overflow_max_grants = 0;
>  
> -- 
> 2.32.0
> 
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 

