Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A007B7D8905
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 21:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623963.972299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw6A3-0003ZJ-Id; Thu, 26 Oct 2023 19:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623963.972299; Thu, 26 Oct 2023 19:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw6A3-0003Ww-FD; Thu, 26 Oct 2023 19:36:55 +0000
Received: by outflank-mailman (input) for mailman id 623963;
 Thu, 26 Oct 2023 19:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qw6A1-0003Wq-DN
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 19:36:53 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027040ca-7437-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 21:36:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0ED9CB83832;
 Thu, 26 Oct 2023 19:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B60C433C8;
 Thu, 26 Oct 2023 19:36:48 +0000 (UTC)
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
X-Inumbo-ID: 027040ca-7437-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698349009;
	bh=LHGFDugZG0VF1N85m7hYH9Iz75l4znIKUwSWhMyOVXw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IgmjxWn3MYhlz9E9LYhSOkr6qRb7LQFHFuab/V6AH7a+OZqj71/Q7vYSNVsSFGl1n
	 inFzAOKICVA21k1wlgliS/uhcrekRyQJXXnEC90UNUaL5v3UdEwMRctyZj9iZ0uciT
	 W9+yxaiF8Rm0PqzPfF5xI0aUbGp4Rs5/3reNgMu/SBih9mfBPKGRIR3X9tVTkzgF2F
	 DV/neo+RUgS3v2s5QAF4b4X8gBaLb/SySvuG/EhuGIKPplZ3cXUkSARIV2iVSKZcvK
	 XfcdRnRbUT87AQ/m792DYIMWqld/ZQQ0vmHdMzKAzbBmvg9Hpv+s/q6O+j7r6ZKgnD
	 VZokPPShng4KA==
Date: Thu, 26 Oct 2023 12:36:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [for-4.19 PATCH 2/2] exclude-list: generalise exclude-list
In-Reply-To: <20231026103243.2077516-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310261236380.271731@ubuntu-linux-20-04-desktop>
References: <20231026103243.2077516-1-luca.fancellu@arm.com> <20231026103243.2077516-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Oct 2023, Luca Fancellu wrote:
> Currently exclude-list.json is used by the xen-analysis tool to
> remove from the report (cppcheck for now) violations from the
> files listed in it, however that list can be used by different
> users that might want to exclude some of the files from their
> computation for many reasons.
> 
> So add a new field that can be part of each entry to link
> the tool supposed to consider that exclusion.
> 
> Update exclusion_file_list.py to implement the logic and update
> the documentation to reflect this change.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

