Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC323504D77
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 10:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307009.522249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMLV-0006TY-7m; Mon, 18 Apr 2022 08:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307009.522249; Mon, 18 Apr 2022 08:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngMLV-0006Ri-4D; Mon, 18 Apr 2022 08:02:53 +0000
Received: by outflank-mailman (input) for mailman id 307009;
 Mon, 18 Apr 2022 08:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOmA=U4=opensource.wdc.com=prvs=10001294c=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1ngMLT-0006DK-14
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 08:02:51 +0000
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f00750fa-beed-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 10:02:50 +0200 (CEST)
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:02:47 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 00:33:55 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 01:02:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfYg5rsWz1SVp4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 01:02:47 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id F9TQifwSoqxs for <xen-devel@lists.xenproject.org>;
 Mon, 18 Apr 2022 01:02:47 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfYZ5jVFz1Rwrw;
 Mon, 18 Apr 2022 01:02:42 -0700 (PDT)
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
X-Inumbo-ID: f00750fa-beed-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650268969; x=1681804969;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MERTNbn4AhK74X7Db7lDnICPdc+nuPVKeYAvKUf3y7M=;
  b=SOCuxhlZJ7WRjcH9BTWHPdr45UYEoIA6NQ2cvItkmf/HPVhjPHrmwjXb
   pLBPXztjHBW7cGuUVGNHYWZb5CiklBhgcabMUN3MMC1s261WbehzCmgzD
   NOjkFNOlPS8yGpCPaee6FWEIlkbeTG9gcLgvIWmNuu2gWK4Ka64kC4UhL
   M7+v1y092SJRbX825DLoY5ZXTTdRMHDrJN/GL+Q/RWFtM4pLDpGW6Gwda
   ilkqf5Vmkh72q3OedQd+J8W/Jt7RcnzirSt5K1xfWaVBvtD4oS9Jw7xA7
   OozQTuEd2AQJwo9yaDU+9NBB7NcKTir4s7l/wiqoCYlJjR7e1AQXI+3ci
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="302341719"
IronPort-SDR: F6HphDK79lVKdJUEbCpaz0QQdl9N4jHR69ZKiLELdafpiwEuRMXq1uQD7mIGDkOsWFfj41mzZy
 7LAJl96soOLOzMcZh3dWBqGLxaWHUy7jzEq+wYRVZAMxhGOaCVtxI7+tLFat5pGtPnLKUfJcmq
 iH/nuTrHKYaz4pqtkezoqkDxFbX0uM9L2V0D2DEUU4tfezBTXWJYezvPo2K2UxT41srZIxHIvm
 HGOkOTIK4yTKquMb1zC37Atg7imDvIzeHZjivp/kRZtiI6x6T9MFoDbOH9Ibku5U+YPaWOgVlE
 lLQWorfIzdti+TkM4gqFdUG5
IronPort-SDR: ey49updTy2G5R496629lYGShk8E54BdpPbx50jXUcFVqlYiMdYxC38PlcBvu37dUWE2/A1aT45
 NmwLfqkRAMPuflCOPpYdtLB8/HV2ElDeG+uLxM3hV2HJdzBc6P+94S2S7IhVwK5Oo9qzCC2O+0
 3LBJdhDFuRSly8Z6fXvKS5bzUbuT6b1gpacDSw2RlnWFDraczhPwBSlAhetiWJ2SrXb0Cm3/l7
 MeIGTmZARSNWmBeno0sKMzD39UVWEWurEw+2AYkJTn3Hqa/0r22o/Uz6FAsmk7HMvobI7jY5DI
 IMQ=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268967; x=1652860968; bh=MERTNbn4AhK74X7Db7lDnICPdc+nuPVKeYA
	vKUf3y7M=; b=pFSYQHMj6JxZD2nZKoXb0b+2KiMHzSI7kIgL2d9DDoSJwDoyb2V
	Jot0KfiMcXahH+V15PE1aTl0G8AenwSXzG0WI7RDrUfFB7doNcD0BJwPAxrGthTB
	RPQdEZribmuuBdGwDqJzjpAGgGWu5Iv8j9e7smsHQ3EGJ7uUKUVyDKHw0Dwpjb5m
	VKXGaoKFCl61VF680DWPqgyQwWoSspl7DQpeul4qZDKZ8KZf5ni07sUW5KEoQB8R
	LOx5yqrztNmP9PtPKNFGRrWiJVnFNw27cIxXm22F73QFgn/A+fQU8CE1vn6vx4oc
	nzsZRnXmNP6Vi4We3fjaZm/ox3jdWeRsAgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <1cef25df-b00d-4590-5598-555c5d97d1c1@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:02:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 10/11] rnbd-srv: use bdev_discard_alignment
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 xen-devel@lists.xenproject.org, linux-um@lists.infradead.org,
 Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 nbd@other.debian.org, linux-block@vger.kernel.org,
 Stefan Haberland <sth@linux.ibm.com>, linux-raid@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-11-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/22 13:53, Christoph Hellwig wrote:
> Use bdev_discard_alignment to calculate the correct discard alignment
> offset even for partitions instead of just looking at the queue limit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-srv-dev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
> index d080a0de59225..4309e52524691 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.h
> +++ b/drivers/block/rnbd/rnbd-srv-dev.h
> @@ -59,7 +59,7 @@ static inline int rnbd_dev_get_discard_granularity(const struct rnbd_dev *dev)
>  
>  static inline int rnbd_dev_get_discard_alignment(const struct rnbd_dev *dev)
>  {
> -	return bdev_get_queue(dev->bdev)->limits.discard_alignment;
> +	return bdev_discard_alignment(dev->bdev);
>  }
>  
>  #endif /* RNBD_SRV_DEV_H */

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

