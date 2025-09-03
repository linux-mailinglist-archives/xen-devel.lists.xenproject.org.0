Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27984B42795
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 19:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108822.1458829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utqwr-0000Ci-J3; Wed, 03 Sep 2025 17:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108822.1458829; Wed, 03 Sep 2025 17:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utqwr-0000Ae-GK; Wed, 03 Sep 2025 17:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1108822;
 Wed, 03 Sep 2025 17:07:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1utqwp-0000AX-Jq
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 17:07:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1utqwo-004gSd-2c;
 Wed, 03 Sep 2025 17:07:03 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1utqwo-00Eg3l-2P;
 Wed, 03 Sep 2025 17:07:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=gd0Rwck+1TCqFQ/mGpsrNnAR3p3MybsEV3uO/PKxq/4=; b=lEEeQ/0TZWGXTfb4IGKB79CmLB
	NcaKrg9GDQ7BWZixG6Z5thLhw3wisuydkq9/6yQ4dPxpJ645ZK+bCLSotpuy351RsC/mhQIYmFNf2
	BaVAY1CIEr0ML5fIegWZ7P+wZ/wlwqCAtR5N7bFu3lE/Bowmje126WeEumED+QE39GMM=;
Date: Wed, 3 Sep 2025 19:07:00 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jahan Murudi <jahan.murudi.zg@renesas.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v4 0/4]  xentop: add physical CPU usage support
Message-ID: <aLh1tLB0ue379Kwu@l14>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
 <aLhnZ1AsqZoM8nPd@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLhnZ1AsqZoM8nPd@l14>

On Wed, Sep 03, 2025 at 06:06:01PM +0200, Anthony PERARD wrote:
> Hi Jahan,
> 
> On Wed, Sep 03, 2025 at 03:53:19PM +0530, Jahan Murudi wrote:
> > This is v4 of the patch series to add physical CPU monitoring to xentop.
> > 
> > Changes since v3:
> > -   Split the single large patch into a logical series of 3 smaller patches
> >     for easier review.
> 
> The single patch in v3 was fine to review. It didn't really need to be
> cut into several patches. Having one file change per patch is certainly
> the worse possible way to cut one patch into several.
> 
> It might have been possible to separate into several patch in another
> way, but it's a bit too late for that, there's already been several
> reviews. What I like to do when I review a patch series, is to look at
> the difference since the last review I gave, tools like
> `git range-diff` and https://patchew.org/Xen/ can help with that.
> 
> Anyway, squashing back all the patch is the way to go I think.
> 
> I'll have a look at the changes.

So the code looks good, but only if it is a single patch like on v3.
Would you be fine if I merge the change, but squash all patch of v4
together and take the patch description from v3? (or the patch
description of the last patch with "integrate" replace by "introduce".)

If I do the squashing, I'll just ignore the remark to use "unsigned int"
instead of "int".

With all patch squash together, more or less: Reviewed-by: Anthony
PERARD <anthony.perard@vates.tech>

Cheers,

-- 
Anthony PERARD

