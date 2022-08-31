Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F15A83FF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 19:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395972.635882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTRCV-0005sQ-Dq; Wed, 31 Aug 2022 17:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395972.635882; Wed, 31 Aug 2022 17:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTRCV-0005ps-At; Wed, 31 Aug 2022 17:08:27 +0000
Received: by outflank-mailman (input) for mailman id 395972;
 Wed, 31 Aug 2022 17:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aVYg=ZD=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oTRCU-0005pm-Au
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 17:08:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f6f0f2-294f-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 19:08:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2114619BA;
 Wed, 31 Aug 2022 17:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE5BC433D6;
 Wed, 31 Aug 2022 17:08:22 +0000 (UTC)
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
X-Inumbo-ID: 85f6f0f2-294f-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661965703;
	bh=UgczS3CJgouUMMsWYePVZ/hPuMBwGBtTIr3bjSAh0Ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YWJyW3sh7T1cOTQqwZqkWiji5c1It00lZmPr0kflwtbxXUkkfAk0Nn8YLulEyUs8t
	 iWSD0pOPwEvreZ6d5mxLeBmjEuzTFEczMKbtP+g/r2wQx4f1oSLMNGiQokJ0l1dPRd
	 PzibDTtdduuGVrjdn4t8vyHqQ3qwLu/CgGy8SlNEKjupJSjRRAPAQp6XSYCUQ6Ez9s
	 yY3XZvFFNTpktOnv/RKrfupktmijgAJQnItX2geXMFMlNgo6rbFUNZQixWpqL6/F8J
	 57bkOX4qNkfrbMTdbQ0IxkhZdAinzhTWTZjay8rFMMnuXt3uMZlreXshNETmXqzNCV
	 bIawp3fAwmZtg==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: jgross@suse.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	axboe@kernel.dk,
	ptyadav@amazon.de,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] xen-blk{front,back}: Fix the broken semantic and flow of feature-persistent
Date: Wed, 31 Aug 2022 17:08:17 +0000
Message-Id: <20220831170817.94903-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831165824.94815-1-sj@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 31 Aug 2022 16:58:21 +0000 SeongJae Park <sj@kernel.org> wrote:

> Changes from v1
> (https://lore.kernel.org/xen-devel/20220825161511.94922-1-sj@kernel.org/)
> - Fix the wrong feature_persistent caching position of blkfront
> - Set blkfront's feature_persistent field setting with simple '&&'
>   instead of 'if' (Pratyush Yadav)
> 
> This patchset fixes misuse of the 'feature-persistent' advertisement
> semantic (patches 1 and 2), and the wrong timing of the
> 'feature_persistent' value caching, which made persistent grants feature
> always disabled.

Please note that I have some problem in my test setup and therefore was unable
to fully test this patchset.  I am posting this though, as the impact of the
bug is not trivial (always disabling persistent grants), and to make testing of
my proposed fix from others easier.  Hope to get someone's test results or code
review of this patchset even before I fix my test setup problem.

Juergen, I didn't add your 'Reviewed-by:'s to the first two patches of this
series because I changed some of the description for making it clear which bug
and commit it is really fixing.  Specifically, I wordsmithed the working and
changed 'Fixed:' tag.  Code change is almost same, though.


Thanks,
SJ

> 
> SeongJae Park (3):
>   xen-blkback: Advertise feature-persistent as user requested
>   xen-blkfront: Advertise feature-persistent as user requested
>   xen-blkfront: Cache feature_persistent value before advertisement
> 
>  drivers/block/xen-blkback/common.h |  3 +++
>  drivers/block/xen-blkback/xenbus.c |  6 ++++--
>  drivers/block/xen-blkfront.c       | 20 ++++++++++++--------
>  3 files changed, 19 insertions(+), 10 deletions(-)
> 
> -- 
> 2.25.1
> 

