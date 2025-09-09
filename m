Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B10B5094E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 01:37:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117437.1463532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw7tl-0008UL-9y; Tue, 09 Sep 2025 23:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117437.1463532; Tue, 09 Sep 2025 23:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw7tl-0008SA-7E; Tue, 09 Sep 2025 23:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1117437;
 Tue, 09 Sep 2025 23:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO0K=3U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uw7tk-0008S2-5E
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 23:37:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9aad34a-8dd5-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 01:37:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 64E1660230;
 Tue,  9 Sep 2025 23:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCA9C4CEF4;
 Tue,  9 Sep 2025 23:37:12 +0000 (UTC)
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
X-Inumbo-ID: e9aad34a-8dd5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757461033;
	bh=E/bJOLuTUuvAlsRWZrQ9ioldXV4lYDFfEuTtWo/f1XI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SbKH+VAdS2ptZAMIiWCfd0foRNhTAGz8KEx+2siyeBQ8GssjCVjsJQziXPjbvTNRw
	 Ow6jFnBpf9thpMQfnklGXmKPumqVmI1C9Yw5yi45vF4orO2OdChwGfqrh0KiynqjNo
	 HTmxr62T9JWUi5YBs7ihZQL6zPzrxT8bjzU98CCjb3PEvKb1QDYNUyWGmGcidfjwW+
	 orZIUPQXxMHYCOm5cl4+rOC+Su6EhbPf7yD5xNhkPKS0fxCRNOMMPpr1zkZ/yo0bCV
	 LGhQ+06CrgiFlYj4giEObCJcq3RKXpxroEwtYIm88r2386E07ua3FVCVOOeXmpvSsZ
	 0nzAobHJSVpqQ==
Date: Tue, 9 Sep 2025 16:37:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] CI: Create initrd fragments explicitly as root
In-Reply-To: <aMB+370CnYTctHNU@kraken>
Message-ID: <alpine.DEB.2.22.394.2509091637010.1405870@ubuntu-linux-20-04-desktop>
References: <20250909171527.1813097-1-andrew.cooper3@citrix.com> <aMB+370CnYTctHNU@kraken>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Sep 2025, dmukhin@xen.org wrote:
> On Tue, Sep 09, 2025 at 06:15:27PM +0100, Andrew Cooper wrote:
> > We have a mix of root and non-root containers, and are trying to become
> > rootless.  This can cause the local CPIO fragements to end up being user:user
> > in the test environment.
> > 
> > Nothing seems to go wrong so far, but it's a trap waiting to happen.
> > 
> > Make everything consistently root for the initrds, irrespective of the
> > rootness of the container the test is running in.
> > 
> > No practical change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> 
> Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

