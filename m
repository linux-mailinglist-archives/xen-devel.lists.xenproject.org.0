Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20875B1BDF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:49:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403222.645282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWG2V-0003fx-Cg; Thu, 08 Sep 2022 11:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403222.645282; Thu, 08 Sep 2022 11:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWG2V-0003dV-9s; Thu, 08 Sep 2022 11:49:47 +0000
Received: by outflank-mailman (input) for mailman id 403222;
 Thu, 08 Sep 2022 11:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHYG=ZL=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oWG2U-0003XP-5z
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:49:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54748d2a-2f6c-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 13:49:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57B4561CB8;
 Thu,  8 Sep 2022 11:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF07C433C1;
 Thu,  8 Sep 2022 11:49:41 +0000 (UTC)
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
X-Inumbo-ID: 54748d2a-2f6c-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662637782;
	bh=g4qAFqq0hkSEXU7h41NwOrSRebV9g97WbblautAhiGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvlluBFgH6xIjm3hHG8D1G1s3TD1tETbo6RehWyIp5CurslvAK3zSZSQj2VMFgsb+
	 cZ+kO+ytLc0o6rN57jAmkto7PHUoxc4p3YCxH8sw4SBnPqzwtABiRu4Qa47mr4c7AZ
	 SGNgc85z35csPsyuu3zfWjSsddZHWGnJWCqmdMDk=
Date: Thu, 8 Sep 2022 13:50:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: SeongJae Park <sj@kernel.org>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-stable-5.10.y] xen-blkfront: Cache feature_persistent
 value before advertisement
Message-ID: <YxnW7P7TYBu4ZCXS@kroah.com>
References: <20220906162414.105452-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906162414.105452-1-sj@kernel.org>

On Tue, Sep 06, 2022 at 04:24:14PM +0000, SeongJae Park wrote:
> commit fe8f65b018effbf473f53af3538d0c1878b8b329 upstream.
> 
> Xen blkfront advertises its support of the persistent grants feature
> when it first setting up and when resuming in 'talk_to_blkback()'.
> Then, blkback reads the advertised value when it connects with blkfront
> and decides if it will use the persistent grants feature or not, and
> advertises its decision to blkfront.  Blkfront reads the blkback's
> decision and it also makes the decision for the use of the feature.
> 
> Commit 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter
> when connect"), however, made the blkfront's read of the parameter for
> disabling the advertisement, namely 'feature_persistent', to be done
> when it negotiate, not when advertise.  Therefore blkfront advertises
> without reading the parameter.  As the field for caching the parameter
> value is zero-initialized, it always advertises as the feature is
> disabled, so that the persistent grants feature becomes always disabled.
> 
> This commit fixes the issue by making the blkfront does parmeter caching
> just before the advertisement.
> 
> Fixes: 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter when connect")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Link: https://lore.kernel.org/r/20220831165824.94815-4-sj@kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> 
> This patch is a manual backport of the upstream commit on the 5.10.y
> kernel.  Please note that this patch can be applied on the latest 5.10.y
> only after the preceding patch[1] is applied.
> 
> [1] https://lore.kernel.org/stable/20220906132819.016040100@linuxfoundation.org/

Now queued up, thanks.

greg k-h

