Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C235A02E8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 22:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392939.631580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQx8y-0006P3-Er; Wed, 24 Aug 2022 20:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392939.631580; Wed, 24 Aug 2022 20:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQx8y-0006Mr-C5; Wed, 24 Aug 2022 20:38:32 +0000
Received: by outflank-mailman (input) for mailman id 392939;
 Wed, 24 Aug 2022 20:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8soK=Y4=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oQx8w-0006Ml-PJ
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 20:38:30 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b58bd674-23ec-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 22:38:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD30BB8268C;
 Wed, 24 Aug 2022 20:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B89C433D6;
 Wed, 24 Aug 2022 20:38:25 +0000 (UTC)
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
X-Inumbo-ID: b58bd674-23ec-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661373506;
	bh=XihCPIS6YrdZnaCle62Bk4g/miGhnfeNX9R5qRWDzpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qs5qomFyR5Ym9AlAg+P3Z/DsfGcWt+oWqmo6cfCHe7sye4MhWIzhxk9IH54SsZu6B
	 K84pURI3OHdRn+Gj5AiXG4BWLDk1Cynp4BtP+AbroeAwAggJ4avQRkbIHYYQAH26e0
	 ZVkKxEcbMl7RgP3HtHwjI+alVXVhSRYUK5VuY7fCXI1tJk8gR2GA4thksr4eHRmEun
	 kmmWp5SrWcv3KSXBA5Ovog9j4L+OZ2Xd5FAutt9eR6HDauCwZ2CGVJ7J60vRwvpEez
	 ohh5mPQo7vxY/GNcfvhL+JrzYqIp+sZW822l/R5DPmK0Ok5LWMOqFP2N4Arlu300zx
	 W+JOgpR2kCzVA==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	roger.pau@citrix.com,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Xen developer discussion" <xen-devel@lists.xenproject.org>,
	"SeongJae Park" <sjpark@amazon.com>,
	"Maximilian Heyne" <mheyne@amazon.de>
Subject: =?UTF-8?q?Re=3A=20=E2=80=9CBackend=20has=20not=20unmapped=20grant=E2=80=9D=20errors?=
Date: Wed, 24 Aug 2022 20:38:23 +0000
Message-Id: <20220824203823.105991-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824174442.105245-1-sj@kernel.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+ Roger

On Wed, 24 Aug 2022 17:44:42 +0000 SeongJae Park <sj@kernel.org> wrote:

> Hello,
> 
> On Wed, 24 Aug 2022 08:02:40 +0200 Juergen Gross <jgross@suse.com> wrote:
> 
> > 
> > [-- Attachment #1.1.1: Type: text/plain, Size: 4312 bytes --]
> > 
> > On 24.08.22 02:20, Marek Marczykowski-Górecki wrote:
> > > FWIW, I hit this issue twice already in this week CI run, while it never
> > > happened before. The difference compared to previous run is Linux
> > > 5.15.57 vs 5.15.61. The latter reports persistent grants disabled. The
> > > only related commits I see there are three commits indeed related to
> > > persistent grants:
> > > 
> > >    c98e956ef489 xen-blkfront: Apply 'feature_persistent' parameter when connect
> > >    ef26b5d530d4 xen-blkback: Apply 'feature_persistent' parameter when connect
> > >    7304be4c985d xen-blkback: fix persistent grants negotiation
> > > 
> > > But none of the commit messages suggests intentional disabling it
> > > without explicit request for doing so. I did not requested disabling it
> > > in toolstack (although I have set backend as "trusted" - XSA-403).
> > > I have confirmed it's the frontend version that matters. Running older
> > > frontend kernel with 5.15.61 backend results in persistent grants
> > > enabled (and both frontend and backend xenstore "feature-persistent"
> > > entries are "1" in this case).
> > 
> > This is a mess.
> > 
> > I think the main problem seems to be that the feature negotiation process
> > isn't specified in a sane way.
> > 
> >  From the blkif.h header:
> > 
> > Backend-side:
> >   * feature-persistent
> >   *      Values:         0/1 (boolean)
> >   *      Default Value:  0
> >   *      Notes: 7
> >   *
> >   *      A value of "1" indicates that the backend can keep the grants used
> >   *      by the frontend driver mapped, so the same set of grants should be
> >   *      used in all transactions. The maximum number of grants the backend
> >   *      can map persistently depends on the implementation, but ideally it
> >   *      should be RING_SIZE * BLKIF_MAX_SEGMENTS_PER_REQUEST. Using this
> >   *      feature the backend doesn't need to unmap each grant, preventing
> >   *      costly TLB flushes. The backend driver should only map grants
> >   *      persistently if the frontend supports it. If a backend driver chooses
> >   *      to use the persistent protocol when the frontend doesn't support it,
> >   *      it will probably hit the maximum number of persistently mapped grants
> >   *      (due to the fact that the frontend won't be reusing the same grants),
> >   *      and fall back to non-persistent mode. Backend implementations may
> >   *      shrink or expand the number of persistently mapped grants without
> >   *      notifying the frontend depending on memory constraints (this might
> >   *      cause a performance degradation).
> > 
> > Frontend-side:
> >   * feature-persistent
> >   *      Values:         0/1 (boolean)
> >   *      Default Value:  0
> >   *      Notes: 7, 8, 9
> >   *
> >   *      A value of "1" indicates that the frontend will reuse the same grants
> >   *      for all transactions, allowing the backend to map them with write
> >   *      access (even when it should be read-only). If the frontend hits the
> >   *      maximum number of allowed persistently mapped grants, it can fallback
> >   *      to non persistent mode. This will cause a performance degradation,
> >   *      since the the backend driver will still try to map those grants
> >   *      persistently. Since the persistent grants protocol is compatible with
> >   *      the previous protocol, a frontend driver can choose to work in
> >   *      persistent mode even when the backend doesn't support it.
> > 
> > Those definitions don't make clear, which side is the one to decide whether
> > the feature should be used or not. In my understanding the related drivers
> > should just advertise their setting (the _ability_ to use the feature), and
> > it should be used only if both sides have written a "1".
> > 
> > With above patches applied, the frontend will set 'feature-persistent' in
> > Xenstore only, if the backend has done so, but the backend will set it
> > only, if the frontend has done it. This results in persistent grants
> > always being disabled.
> 
> Sorry for making the mess, and thank you for the kind report and detailed
> explanation of the problem.
> 
> > 
> > This is wrong, as the value written should not reflect the current state
> > of the interface. That state should be set according to both sides' value,
> > probably a cached one on the blkback side (using a new flag for caching it,
> > not the current state).
> 
> Agreed.  So, I think the issue comes from the fact that we are using one field,
> which was a place for saving only the negotiation result, for yet another
> purpose: caching of the parameter value.  As a result, the advertisement, which
> should follow only the parameter value, becomes inconsistent.
> 
> How about simply adding another field for the caching purpose, so that the
> advertisation could be done regardless of the negotiation?  For example:
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
> +	blkif->vbd.feature_gnt_persistent =
> +		blkif->vbd.feature_gnt_persistent_parm &&
>  		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
>  
>  	blkif->vbd.overflow_max_grants = 0;
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
> +	if (info->feature_persistent_parm)
>  		info->feature_persistent =
>  			!!xenbus_read_unsigned(info->xbdev->otherend,
>  					       "feature-persistent", 0);
> 
> 
> Thanks,
> SJ
> 
> > 
> > The blkif.h comments should be updated to make it clear that the values in
> > Xenstore don't reflect the state of the connection, but the availability of
> > the feature in the related driver.
> > 
> > Comments?
> > 
> > 
> > Juergen

