Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69C504D70
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 10:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307004.522238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngML3-0005tu-SW; Mon, 18 Apr 2022 08:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307004.522238; Mon, 18 Apr 2022 08:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngML3-0005rA-On; Mon, 18 Apr 2022 08:02:25 +0000
Received: by outflank-mailman (input) for mailman id 307004;
 Mon, 18 Apr 2022 08:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOmA=U4=opensource.wdc.com=prvs=10001294c=damien.lemoal@srs-se1.protection.inumbo.net>)
 id 1ngML2-0005qu-AY
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 08:02:24 +0000
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df89e3fb-beed-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 10:02:22 +0200 (CEST)
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Apr 2022 16:02:18 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 00:33:27 -0700
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 01:02:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KhfY7613Cz1SVp2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 01:02:19 -0700 (PDT)
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id VxOvw3OKk_Vi for <xen-devel@lists.xenproject.org>;
 Mon, 18 Apr 2022 01:02:19 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KhfY24GYPz1Rvlx;
 Mon, 18 Apr 2022 01:02:14 -0700 (PDT)
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
X-Inumbo-ID: df89e3fb-beed-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650268940; x=1681804940;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OmPuKz2YWA8zfnI8UisdXu/UB5gIbMI/eeJtu4mrOgE=;
  b=UAYpmOe1Ga9rpGWf/oYIVNxr6xHWAv9DodQoZP6Vp7+zyCHy7LzEWMe9
   SlupvqE/I8Ukh5gj/uKzwQSYQ5NhKgSLAajoKsjyy1Gey3E80RAeD+3oM
   6DfkUXvDs/jKzfQBhKTcpOvdl2ez91iEt54/BxjiXVhGCOOBbqlh7UEjU
   69iu5MUEkLAzYoZyHk9h782ySIAc69FIn7g2sa375uIfjDMNXZu+tWX1y
   j10OzbgBHscqmSqknpJF82S+o+qQAHZ9AyF+XYVSUh4wCurLXaKdh76oL
   2icwJC8WZOWNbPgL6fSfVzuLH+HaE0+zh8yR9+gx5WkmaMcsscw9FgEVS
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,269,1643644800"; 
   d="scan'208";a="310120099"
IronPort-SDR: NPz6pUrKH+IKjih5Eho4MX5TsnfwsKckpV2Oio4YneRCdHk5SNkKmAiwCmWJRgxHaXafiubSPw
 fWvKkvZOO6HpvHcrY/YWaX5RquicpR8u4gKy6q1b/UxZ34MkBs5OH733NOkxPTIj+2bppS9Yzl
 /bESb4xU/zWCqnZkE4MDapay06cfqXjSGbEIRa2oiXMRv0rfB/yR1HAZ96UtIMIwIbcI6CE2k4
 2/P83vsy1BE3LGapVO1r8xoKJZnXNm8ayA+eO9IXkvHh0mjOSMp3YAk7omG/ncMaBDpJWWOl4z
 XUUYfWfmlCh+fAffjGgOMhOG
IronPort-SDR: 1sk8GsPnvxngwDfq5I2X1GlngP5rHoTjXQOzOMa65Ii3FtjJvR4KGeNBfR1TFCih9IzaYzVVW0
 GppzRVt0av45coByGUj3xSLrgO0TvV5O/Npw+YwuIQ+gESGb7Gqc9EKi0+tlrtRWS5Y/6E1Fw/
 K8zpyI9imErcRPx+fsR7CkLEoLbXyAU3AfWsg/tgeOc0GVKKSDycQDP2w2VfjjLmdbXVfh/VvX
 ehu8zL8verrWCGyQgDsEpVHFSbHp1zw9CDgFZlUa1FtuSWGbQELdRZM9bcJmSubcLW2jTKY0wm
 74M=
WDCIronportException: Internal
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1650268939; x=1652860940; bh=OmPuKz2YWA8zfnI8UisdXu/UB5gIbMI/eeJ
	tu4mrOgE=; b=k+ny4hyvVfxtH5oBMEu00VLv8LgxeeF+SRrMURWYyg8tMFDxkwO
	b45mao7rScufOtmSeeirU8HISQWEsqx4Z0+6Fp4WqP+u1N3fE8V/YIR6F2X+HeuX
	iefLcNmsD6ccKAg8s1APjkVBBM5TxNfPxViHr0PfOhnQWubPOFyhCNR52v6EBzYf
	mQuACDthuVg7XI9wnY368QOgdxnn4zmZyGLPUy6JsbIKZRxqrCxMqlH7F33rlWbN
	zGaLtX1DYo/0fZe2l+XJY/ItU0InrXWf+SYpSLJmCouyQlCkf2fR+ljgMe6ZYxxb
	dtxP5RP+Z16XgALOx7aLuUc4/TgwOGCLLXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Message-ID: <cd77bfd9-e133-1929-2d61-73822ad95366@opensource.wdc.com>
Date: Mon, 18 Apr 2022 17:02:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [dm-devel] [PATCH 09/11] nvme: remove a spurious clear of
 discard_alignment
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
 <20220418045314.360785-10-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220418045314.360785-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/22 13:53, Christoph Hellwig wrote:
> The nvme driver never sets a discard_alignment, so it also doens't need
> to clear it to zero.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/nvme/host/core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index b9b0fbde97c80..76a9ccd5d064a 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1628,7 +1628,6 @@ static void nvme_config_discard(struct gendisk *disk, struct nvme_ns *ns)
>  	BUILD_BUG_ON(PAGE_SIZE / sizeof(struct nvme_dsm_range) <
>  			NVME_DSM_MAX_RANGES);
>  
> -	queue->limits.discard_alignment = 0;
>  	queue->limits.discard_granularity = size;
>  
>  	/* If discard is already enabled, don't reset queue limits */

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

