Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF0752BDA1
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 16:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332308.555986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrL5H-0007CG-Ni; Wed, 18 May 2022 14:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332308.555986; Wed, 18 May 2022 14:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrL5H-0007A4-KN; Wed, 18 May 2022 14:55:31 +0000
Received: by outflank-mailman (input) for mailman id 332308;
 Wed, 18 May 2022 14:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ovvv=V2=kernel.org=jarkko@srs-se1.protection.inumbo.net>)
 id 1nrL5G-00079y-3q
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 14:55:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e3b3e0a-d6ba-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 16:55:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83DE061982;
 Wed, 18 May 2022 14:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4268FC385AA;
 Wed, 18 May 2022 14:55:25 +0000 (UTC)
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
X-Inumbo-ID: 8e3b3e0a-d6ba-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652885726;
	bh=y/nVf707/t+pKLmjuo0j1M7q/g28bwWk29Oh1R8DBz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guZ+Xxyh9gOkTE0/y4ptl2ieLoWdWs8y2aB+SXXif8B4B9IuEuRDrUwRsuZXklT3N
	 ul7wcMyOzBlrEmtToMcUWRw6rfipS9zgxXnmXFTpOSCBZ761OnPlfU2BzgzIXwH76q
	 UibMwKzOH1hdVomum7sS+fYiLUEaXUMIn40NKQsVnGERenGbm4F81BOboZHxe7IpVY
	 9jcmA4cH5OZTL2Z0LvDg1fLiu10iBYaPRrKvSxHCASViIEXxHCE5CmrvlRP5WYYOHp
	 DeKdQsmHEOGj7bJ9CnOGrFR1d9SAn9QbK0l0othc6qYTacv6/1dm5sOEVVlGMoSM/b
	 Y7FqFC23QbMUQ==
Date: Wed, 18 May 2022 17:57:07 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 15/21] xen/tpmfront: use xenbus_setup_ring() and
 xenbus_teardown_ring()
Message-ID: <YoUJQ5KQYZyG4gj3@iki.fi>
References: <20220505081640.17425-1-jgross@suse.com>
 <20220505081640.17425-16-jgross@suse.com>
 <YnWh6P7kBtPa2aTA@kernel.org>
 <642471c7-f717-2ef4-1d6d-6fabf57db08f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <642471c7-f717-2ef4-1d6d-6fabf57db08f@suse.com>

On Wed, May 18, 2022 at 11:41:51AM +0200, Juergen Gross wrote:
> On 07.05.22 00:32, Jarkko Sakkinen wrote:
> > On Thu, May 05, 2022 at 10:16:34AM +0200, Juergen Gross wrote:
> > > Simplify tpmfront's ring creation and removal via xenbus_setup_ring()
> > > and xenbus_teardown_ring().
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Please add to the commit message why these provide an equivalent
> > functionality.
> 
> Would you be fine with:
> 
>   Simplify tpmfront's ring creation and removal via xenbus_setup_ring()
>   and xenbus_teardown_ring(), which are provided exactly for the use
>   pattern as seen in this driver.
> 
> 
> Juergen

Looks fine to me!

BR, Jarkko





