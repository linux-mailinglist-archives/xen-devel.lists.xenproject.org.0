Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C475A825C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 17:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395809.635684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ2K-0005uM-RV; Wed, 31 Aug 2022 15:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395809.635684; Wed, 31 Aug 2022 15:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ2K-0005rf-O6; Wed, 31 Aug 2022 15:53:52 +0000
Received: by outflank-mailman (input) for mailman id 395809;
 Wed, 31 Aug 2022 15:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruj9=ZD=amazon.com=prvs=235f00a87=ptyadav@srs-se1.protection.inumbo.net>)
 id 1oTQ1Y-0005in-RX
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 15:53:04 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe29f6e8-2944-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 17:53:03 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-0bfdb89e.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 15:50:53 +0000
Received: from EX13D08EUB002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-0bfdb89e.us-east-1.amazon.com (Postfix) with
 ESMTPS id C7B80E00BA; Wed, 31 Aug 2022 15:50:49 +0000 (UTC)
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D08EUB002.ant.amazon.com (10.43.166.232) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Wed, 31 Aug 2022 15:50:48 +0000
Received: from dev-dsk-ptyadav-1c-613f0921.eu-west-1.amazon.com (10.15.8.155)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1497.38 via Frontend Transport; Wed, 31 Aug 2022 15:50:47 +0000
Received: by dev-dsk-ptyadav-1c-613f0921.eu-west-1.amazon.com (Postfix,
 from userid 23027615)
 id 0804D25976; Wed, 31 Aug 2022 15:50:45 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: fe29f6e8-2944-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1661961183; x=1693497183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vyta+/0lDuDRefxlgv1vkaHwbgOICyXw1l+oC05BEd8=;
  b=q1isutIcOKn8EcK0xpFjC1+iZ290KGaGDgtZO3dCRQWWJmCUc4wJ4f1Z
   SUOHbFdzHN6xZZ+Syo+khfvLM3Eb8cb5hthpcOJypF0cfyiks2mtoQVxW
   CRgH/0okpm085tGg0okxcWY28gJ5H0o1ZPJ1eR4XoUd9m0lZ2kaDBsu4p
   c=;
X-IronPort-AV: E=Sophos;i="5.93,278,1654560000"; 
   d="scan'208";a="125407135"
Date: Wed, 31 Aug 2022 15:50:45 +0000
From: Pratyush Yadav <ptyadav@amazon.de>
To: SeongJae Park <sj@kernel.org>
CC: <jgross@suse.com>, <roger.pau@citrix.com>,
	<marmarek@invisiblethingslab.com>, <mheyne@amazon.de>,
	<xen-devel@lists.xenproject.org>, <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] xen-blkfront: Advertise feature-persistent as user
 requested
Message-ID: <20220831155045.kxopdchlc67fmi5n@yadavpratyush.com>
References: <20220825161511.94922-1-sj@kernel.org>
 <20220825161511.94922-3-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220825161511.94922-3-sj@kernel.org>
Precedence: Bulk

On 25/08/22 04:15PM, SeongJae Park wrote:
> Commit e94c6101e151 ("xen-blkback: Apply 'feature_persistent' parameter
> when connect") made blkback to advertise its support of the persistent
> grants feature only if the user sets the 'feature_persistent' parameter
> of the driver and the frontend advertised its support of the feature.
> However, following commit 402c43ea6b34 ("xen-blkfront: Apply
> 'feature_persistent' parameter when connect") made the blkfront to work
> in the same way.  That is, blkfront also advertises its support of the
> persistent grants feature only if the user sets the 'feature_persistent'
> parameter of the driver and the backend advertised its support of the
> feature.
> 
> Hence blkback and blkfront will never advertise their support of the
> feature but wait until the other advertises the support, even though
> users set the 'feature_persistent' parameters of the drivers.  As a
> result, the persistent grants feature is disabled always regardless of
> the 'feature_persistent' values[1].
> 
> The problem comes from the misuse of the semantic of the advertisement
> of the feature.  The advertisement of the feature should means only
> availability of the feature not the decision for using the feature.
> However, current behavior is working in the wrong way.
> 
> This commit fixes the issue by making the blkfront advertises its
> support of the feature as user requested via 'feature_persistent'
> parameter regardless of the otherend's support of the feature.
> 
> [1] https://lore.kernel.org/xen-devel/bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com/
> 
> Fixes: 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter when connect")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Suggested-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  drivers/block/xen-blkfront.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 8e56e69fb4c4..dfae08115450 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -213,6 +213,9 @@ struct blkfront_info
>  	unsigned int feature_fua:1;
>  	unsigned int feature_discard:1;
>  	unsigned int feature_secdiscard:1;
> +	/* Connect-time cached feature_persistent parameter */
> +	unsigned int feature_persistent_parm:1;
> +	/* Persistent grants feature negotiation result */
>  	unsigned int feature_persistent:1;
>  	unsigned int bounce:1;
>  	unsigned int discard_granularity;
> @@ -1848,7 +1851,7 @@ static int talk_to_blkback(struct xenbus_device *dev,
>  		goto abort_transaction;
>  	}
>  	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> -			info->feature_persistent);
> +			info->feature_persistent_parm);
>  	if (err)
>  		dev_warn(&dev->dev,
>  			 "writing persistent grants feature to xenbus");
> @@ -2281,7 +2284,8 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
>  	if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard", 0))
>  		blkfront_setup_discard(info);
>  
> -	if (feature_persistent)
> +	info->feature_persistent_parm = feature_persistent;

Same question as before. Why not just use feature_persistent directly?

> +	if (info->feature_persistent_parm)
>  		info->feature_persistent =
>  			!!xenbus_read_unsigned(info->xbdev->otherend,
>  					       "feature-persistent", 0);

Aside: IMO this would look nicer as below:

	info->feature_persistent = feature_persistent && !!xenbus_read_unsigned();

