Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4ED51E489
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 07:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323453.545329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnDP6-0007xh-I4; Sat, 07 May 2022 05:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323453.545329; Sat, 07 May 2022 05:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnDP6-0007vq-ED; Sat, 07 May 2022 05:54:56 +0000
Received: by outflank-mailman (input) for mailman id 323453;
 Fri, 06 May 2022 22:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWTp=VO=kernel.org=jarkko@srs-se1.protection.inumbo.net>)
 id 1nn6T8-0006wS-AF
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 22:30:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25e36b85-cd8c-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 00:30:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E99FB60B28;
 Fri,  6 May 2022 22:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA910C385A8;
 Fri,  6 May 2022 22:30:33 +0000 (UTC)
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
X-Inumbo-ID: 25e36b85-cd8c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651876234;
	bh=sxTU7PppLMUUauXKN/Szps48K3+Yp2KuJRpingZK3pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDBkPEfCg1pTGI8Srn8739MyPkk2qMvSwV5sgShyDnzwm2lTu+dc0YamxXpUd+wDB
	 kQej8guNE45PJAKhANDPCD6M2I4/LJ6fWESpOBSJWaVip8jbACe5/ga4LBByuK1YpK
	 AkA//mqxjAC19szynaJE4BOdiKcR5dJRdP20m/z89Xetfoy9/QHLLoGPEcA8dhdJRl
	 QHnws7EP1tPtJMFxLJyPzZzlukTQpemzHiWMBmJH0EYpwV6nae3L38HZu1twa4HhPm
	 2FYcfdXI14oxzvGIIlBpMyRbIBw8gIRil/yEq9nphSPTscJeQdv5AoP7tRldrWfj7x
	 4IJ1vYhpVH4gA==
Date: Sat, 7 May 2022 01:32:08 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 15/21] xen/tpmfront: use xenbus_setup_ring() and
 xenbus_teardown_ring()
Message-ID: <YnWh6P7kBtPa2aTA@kernel.org>
References: <20220505081640.17425-1-jgross@suse.com>
 <20220505081640.17425-16-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505081640.17425-16-jgross@suse.com>

On Thu, May 05, 2022 at 10:16:34AM +0200, Juergen Gross wrote:
> Simplify tpmfront's ring creation and removal via xenbus_setup_ring()
> and xenbus_teardown_ring().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Please add to the commit message why these provide an equivalent
functionality.

BR, Jarkko

