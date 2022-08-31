Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF6A5A8301
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 18:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395864.635777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQSN-0005fw-Ux; Wed, 31 Aug 2022 16:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395864.635777; Wed, 31 Aug 2022 16:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQSN-0005dd-Rn; Wed, 31 Aug 2022 16:20:47 +0000
Received: by outflank-mailman (input) for mailman id 395864;
 Wed, 31 Aug 2022 16:20:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aVYg=ZD=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oTQSL-0005ci-Iu
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 16:20:45 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd09417e-2948-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 18:20:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E15E8B821ED;
 Wed, 31 Aug 2022 16:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB391C433D7;
 Wed, 31 Aug 2022 16:20:40 +0000 (UTC)
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
X-Inumbo-ID: dd09417e-2948-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661962841;
	bh=mP7bY6kuZc9xANg6iW41oQkce9SwkX/s/4sydwbPcjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mKAxncKKgrqPf9z1NEdnLQx6+7HIVT5B0iodsnbqAMy7uSqLjxRVvUlHuv2+g/tgA
	 vNAFgnSnFnD7Or+FIfXuNZjhTAfdcyrkLZqH3tHat5GOE0Lf0UZiD/Cb8u7YgxHTyb
	 r964TWGMQIQOc1E45665y19axjm+NpDqURdotluc+O26NNGLYsjneXBMo6688Hu3hm
	 2BcnxJov8rKlO1LGghjrCnbJCFVdT6zgeQ5N8sQ79esQwraE7gCBWkM2h3GGundUAP
	 vQV9BSsGD9xn+0VnudTKDVEeZ823m+c5eBEuXtefj5A4OmUxpeHZKrR7lgU4RbwpM9
	 7IS1mhda/JgaA==
From: SeongJae Park <sj@kernel.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: SeongJae Park <sj@kernel.org>,
	jgross@suse.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	axboe@kernel.dk,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xen-blkfront: Advertise feature-persistent as user requested
Date: Wed, 31 Aug 2022 16:20:36 +0000
Message-Id: <20220831162036.93966-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831155045.kxopdchlc67fmi5n@yadavpratyush.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pratyush,

On Wed, 31 Aug 2022 15:50:45 +0000 Pratyush Yadav <ptyadav@amazon.de> wrote:

> On 25/08/22 04:15PM, SeongJae Park wrote:
> > Commit e94c6101e151 ("xen-blkback: Apply 'feature_persistent' parameter
> > when connect") made blkback to advertise its support of the persistent
> > grants feature only if the user sets the 'feature_persistent' parameter
> > of the driver and the frontend advertised its support of the feature.
> > However, following commit 402c43ea6b34 ("xen-blkfront: Apply
> > 'feature_persistent' parameter when connect") made the blkfront to work
> > in the same way.  That is, blkfront also advertises its support of the
> > persistent grants feature only if the user sets the 'feature_persistent'
> > parameter of the driver and the backend advertised its support of the
> > feature.
> > 
> > Hence blkback and blkfront will never advertise their support of the
> > feature but wait until the other advertises the support, even though
> > users set the 'feature_persistent' parameters of the drivers.  As a
> > result, the persistent grants feature is disabled always regardless of
> > the 'feature_persistent' values[1].
> > 
> > The problem comes from the misuse of the semantic of the advertisement
> > of the feature.  The advertisement of the feature should means only
> > availability of the feature not the decision for using the feature.
> > However, current behavior is working in the wrong way.
> > 
> > This commit fixes the issue by making the blkfront advertises its
> > support of the feature as user requested via 'feature_persistent'
> > parameter regardless of the otherend's support of the feature.
> > 
> > [1] https://lore.kernel.org/xen-devel/bd818aba-4857-bc07-dc8a-e9b2f8c5f7cd@suse.com/
> > 
> > Fixes: 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter when connect")
> > Cc: <stable@vger.kernel.org> # 5.10.x
> > Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > Suggested-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> > ---
> >  drivers/block/xen-blkfront.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > index 8e56e69fb4c4..dfae08115450 100644
> > --- a/drivers/block/xen-blkfront.c
> > +++ b/drivers/block/xen-blkfront.c
> > @@ -213,6 +213,9 @@ struct blkfront_info
> >  	unsigned int feature_fua:1;
> >  	unsigned int feature_discard:1;
> >  	unsigned int feature_secdiscard:1;
> > +	/* Connect-time cached feature_persistent parameter */
> > +	unsigned int feature_persistent_parm:1;
> > +	/* Persistent grants feature negotiation result */
> >  	unsigned int feature_persistent:1;
> >  	unsigned int bounce:1;
> >  	unsigned int discard_granularity;
> > @@ -1848,7 +1851,7 @@ static int talk_to_blkback(struct xenbus_device *dev,
> >  		goto abort_transaction;
> >  	}
> >  	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> > -			info->feature_persistent);
> > +			info->feature_persistent_parm);
> >  	if (err)
> >  		dev_warn(&dev->dev,
> >  			 "writing persistent grants feature to xenbus");
> > @@ -2281,7 +2284,8 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
> >  	if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard", 0))
> >  		blkfront_setup_discard(info);
> >  
> > -	if (feature_persistent)
> > +	info->feature_persistent_parm = feature_persistent;
> 
> Same question as before. Why not just use feature_persistent directly?

Same answer as before, due to the possible race[1].

[1] https://lore.kernel.org/linux-block/20200922111259.GJ19254@Air-de-Roger/

> 
> > +	if (info->feature_persistent_parm)
> >  		info->feature_persistent =
> >  			!!xenbus_read_unsigned(info->xbdev->otherend,
> >  					       "feature-persistent", 0);
> 
> Aside: IMO this would look nicer as below:
> 
> 	info->feature_persistent = feature_persistent && !!xenbus_read_unsigned();

Agreed, that would also make the code more consistent with the blkback side
code.

I would make the change in the next version of this patchset.


Thanks,
SJ

