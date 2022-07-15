Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEC7576694
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 20:12:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368466.599764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPnl-0003qY-8w; Fri, 15 Jul 2022 18:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368466.599764; Fri, 15 Jul 2022 18:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPnl-0003nP-5H; Fri, 15 Jul 2022 18:12:33 +0000
Received: by outflank-mailman (input) for mailman id 368466;
 Fri, 15 Jul 2022 18:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCPnk-0003nJ-1f
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:12:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ac4c94-0469-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 20:12:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9D0F62314;
 Fri, 15 Jul 2022 18:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24257C3411E;
 Fri, 15 Jul 2022 18:12:28 +0000 (UTC)
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
X-Inumbo-ID: b0ac4c94-0469-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657908749;
	bh=zv88e6V2bOYszh5xZ5YFkXFxU2Be44JHufVZU7uo7YY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lOXj38MUE4WmuKeKIPlNexwIs7d8j8Mz4uoK2G7zN/dZp+RTkb2v8L75BR+FVb2zH
	 NmLEm83eUNRwIqIcI9wL5Q7Y/K5KaSXYAggo90eNZJreO3MwD6YLDAVtSqrhawd220
	 FfTrGX7RzR5bYdQfxpxddrFbFuFVbOAP84mKTE5tFRcQ9vpdfUvihzKC280u33p+nf
	 sgh91eVFS1/df/x4i5S5Y3xGZfhkxUDSNLG//qoPSaN62QmkmLK3zEnf05TyCfYrGC
	 o42ruHmQt/OmwMwUVYrktc9irgZcBlYavqVg1mrCYYtvemdz22qgg797b5wCsDY7Xe
	 fosRk69rVR62A==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: roger.pau@citrix.com,
	axboe@kernel.dk,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	olekstysh@gmail.com,
	andrii.chepurnyi82@gmail.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix persistent grants negotiation with a behavior change
Date: Fri, 15 Jul 2022 18:12:26 +0000
Message-Id: <20220715181226.126714-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715175521.126649-1-sj@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

On Fri, 15 Jul 2022 17:55:19 +0000 SeongJae Park <sj@kernel.org> wrote:

> The first patch of this patchset fixes 'feature_persistent' parameter
> handling in 'blkback' to respect the frontend's persistent grants
> support always.  The fix makes a behavioral change, so the second patch
> makes the counterpart of 'blkfront' to consistently follow the behavior
> change.

I made the behavior change as requested by Andrii[1].  I therefore made similar
behavior change to blkfront and Cc-ed stable for the second change, too.

To make the change history clear and reduce the stable side overhead, however,
it might be better to apply the v2, which don't make behavior change but only
fix the issue, Cc stable@ for it, make the behavior change commits for both
blkback and blkfront, update the documents, and don't Cc stable@ for the
behavior change and documents update commits.

One downside of that would be that it will make a behavioral difference in
pre-5.19.x and post-5.19.x.

I think both downsides are not critical, so posted this patchset in this shape.
If anyone prefer some changes, please let me know, though.

[1] https://lore.kernel.org/xen-devel/CAJwUmVB6H3iTs-C+U=v-pwJB7-_ZRHPxHzKRJZ22xEPW7z8a=g@mail.gmail.com/


Thanks,
SJ

> 
> Changes from v2
> (https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/)
> - Keep the behavioral change of v1
> - Update blkfront's counterpart to follow the changed behavior
> - Update documents for the changed behavior
> 
> Changes from v1
> (https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/)
> - Avoid the behavioral change
>   (https://lore.kernel.org/xen-devel/20220121102309.27802-1-sj@kernel.org/)
> - Rebase on latest xen/tip/linux-next
> - Re-work by SeongJae Park <sj@kernel.org>
> - Cc stable@
> 
> 
> 
> Maximilian Heyne (1):
>   xen, blkback: fix persistent grants negotiation
> 
> SeongJae Park (1):
>   xen-blkfront: Apply 'feature_persistent' parameter when connect
> 
>  Documentation/ABI/testing/sysfs-driver-xen-blkback  | 2 +-
>  Documentation/ABI/testing/sysfs-driver-xen-blkfront | 2 +-
>  drivers/block/xen-blkback/xenbus.c                  | 9 +++------
>  drivers/block/xen-blkfront.c                        | 4 +---
>  4 files changed, 6 insertions(+), 11 deletions(-)
> 
> -- 
> 2.25.1

