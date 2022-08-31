Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCB5A825B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 17:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395794.635679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ2K-0005rr-Kd; Wed, 31 Aug 2022 15:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395794.635679; Wed, 31 Aug 2022 15:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ2K-0005oj-H3; Wed, 31 Aug 2022 15:53:52 +0000
Received: by outflank-mailman (input) for mailman id 395794;
 Wed, 31 Aug 2022 15:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruj9=ZD=amazon.com=prvs=235f00a87=ptyadav@srs-se1.protection.inumbo.net>)
 id 1oTPws-0003jR-IE
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 15:48:15 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 511dbeca-2944-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 17:48:13 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-5bed4ba5.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 15:47:53 +0000
Received: from EX13D08EUC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-5bed4ba5.us-west-2.amazon.com (Postfix) with
 ESMTPS id CC52E8E23E; Wed, 31 Aug 2022 15:47:52 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08EUC001.ant.amazon.com (10.43.164.184) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Wed, 31 Aug 2022 15:47:51 +0000
Received: from dev-dsk-ptyadav-1c-613f0921.eu-west-1.amazon.com (10.15.8.155)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.38 via Frontend Transport; Wed, 31 Aug 2022 15:47:50 +0000
Received: by dev-dsk-ptyadav-1c-613f0921.eu-west-1.amazon.com (Postfix,
 from userid 23027615)
 id 8E5ED25976; Wed, 31 Aug 2022 15:47:50 +0000 (UTC)
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
X-Inumbo-ID: 511dbeca-2944-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1661960893; x=1693496893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y+fkgIc9fvNBrkNoyidj8kDyZUg8P/MCawXruROBWFs=;
  b=RY23Mzp5cAnWjcJexJDWqstlhBbGxkxltWK6o6rUnn882YnJy0Va3HYd
   hS5F3CAR1IuBPRtOSrm44uR066XUaVUjd5MM2bG0UtAmiKit3GNX7DG0Y
   Jmx8P0288RrJSSqhDhGer47hsIJLzJOv7EpfqUws7yrBKiPeBu7Uq+4Gc
   M=;
X-IronPort-AV: E=Sophos;i="5.93,278,1654560000"; 
   d="scan'208";a="1049979248"
Date: Wed, 31 Aug 2022 15:47:50 +0000
From: Pratyush Yadav <ptyadav@amazon.de>
To: SeongJae Park <sj@kernel.org>
CC: <jgross@suse.com>, <roger.pau@citrix.com>,
	<marmarek@invisiblethingslab.com>, <mheyne@amazon.de>,
	<xen-devel@lists.xenproject.org>, <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] xen-blkback: Advertise feature-persistent as user
 requested
Message-ID: <20220831153259.fzdkgbi76hmxa67a@yadavpratyush.com>
References: <20220825161511.94922-1-sj@kernel.org>
 <20220825161511.94922-2-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220825161511.94922-2-sj@kernel.org>
Precedence: Bulk

Hi,

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
> This commit fixes the issue by making the blkback advertises its support
> of the feature as user requested via 'feature_persistent' parameter
> regardless of the otherend's support of the feature.
> 
> [1] https://lore.kernel.org/xen-devel/bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com/
> 
> Fixes: e94c6101e151 ("xen-blkback: Apply 'feature_persistent' parameter when connect")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Suggested-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  drivers/block/xen-blkback/common.h | 3 +++
>  drivers/block/xen-blkback/xenbus.c | 6 ++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
> index bda5c815e441..a28473470e66 100644
> --- a/drivers/block/xen-blkback/common.h
> +++ b/drivers/block/xen-blkback/common.h
> @@ -226,6 +226,9 @@ struct xen_vbd {
>  	sector_t		size;
>  	unsigned int		flush_support:1;
>  	unsigned int		discard_secure:1;
> +	/* Connect-time cached feature_persistent parameter value */
> +	unsigned int		feature_gnt_persistent_parm:1;
> +	/* Persistent grants feature negotiation result */
>  	unsigned int		feature_gnt_persistent:1;
>  	unsigned int		overflow_max_grants:1;
>  };
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index ee7ad2fb432d..c0227dfa4688 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -907,7 +907,7 @@ static void connect(struct backend_info *be)
>  	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
>  
>  	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> -			be->blkif->vbd.feature_gnt_persistent);
> +			be->blkif->vbd.feature_gnt_persistent_parm);
>  	if (err) {
>  		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
>  				 dev->nodename);
> @@ -1085,7 +1085,9 @@ static int connect_ring(struct backend_info *be)
>  		return -ENOSYS;
>  	}
>  
> -	blkif->vbd.feature_gnt_persistent = feature_persistent &&
> +	blkif->vbd.feature_gnt_persistent_parm = feature_persistent;

If feature_gnt_persistent_parm is always going to be equal to 
feature_persistent, then why introduce it at all? Why not just use 
feature_persistent directly? This way you avoid adding an extra flag 
whose purpose is not immediately clear, and you also avoid all the mess 
with setting this flag at the right time.

> +	blkif->vbd.feature_gnt_persistent =
> +		blkif->vbd.feature_gnt_persistent_parm &&
>  		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
>  
>  	blkif->vbd.overflow_max_grants = 0;
> -- 
> 2.25.1
> 
> 

