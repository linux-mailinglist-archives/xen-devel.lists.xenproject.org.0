Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81978C051D
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 21:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718931.1121485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4n2a-00006G-Cj; Wed, 08 May 2024 19:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718931.1121485; Wed, 08 May 2024 19:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4n2a-0008W0-9P; Wed, 08 May 2024 19:33:24 +0000
Received: by outflank-mailman (input) for mailman id 718931;
 Wed, 08 May 2024 19:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGkX=ML=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1s4n2Y-0008Vd-9o
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 19:33:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d269f0ef-0d71-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 21:33:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45AD7CE1A2E;
 Wed,  8 May 2024 19:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D5DC113CC;
 Wed,  8 May 2024 19:33:13 +0000 (UTC)
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
X-Inumbo-ID: d269f0ef-0d71-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715196794;
	bh=BqASjYSExQ+D7Yd+cxznVTfXPxXorUXWvTG6AeWlH3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQa1tWWSpnsQOi3dp5NKMdGe3cMEdHHphY+y/2nUymWnqqf/e8+UIEkdtLg5yPur6
	 0W4BBrcZkwt1SgmHsROH0hNeDsAJ+7hNCBDtKfr7OUUBtL1AeockbogA93jl4TBVpT
	 fIT8X+LXl2gz0CttL5Ciwzs3L6an8JFQKIIgmAmE=
Date: Wed, 8 May 2024 20:33:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: cve@kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
	netdev@vger.kernel.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, wei.liu@kernel.org,
	paul@xen.org, Jakub Kicinski <kuba@kernel.org>, kirjanov@gmail.com,
	dkirjanov@suse.de, kernel-team@cloudflare.com,
	security@xenproject.org, xen-devel@lists.xenproject.org,
	George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
Message-ID: <2024050802-playful-brick-0c67@gregkh>
References: <171154167446.2671062.9127105384591237363.stgit@firesoul>
 <CALUcmU=xOR1j9Asdv0Ny7x=o4Ckz80mDjbuEnJC0Z_Aepu0Zzw@mail.gmail.com>
 <CALUcmUkvpnq+CKSCn=cuAfxXOGU22fkBx4QD4u2nZYGM16DD6A@mail.gmail.com>
 <CALUcmUn0__izGAS-8gDL2h2Ceg9mdkFnLmdOgvAfO7sqxXK1-Q@mail.gmail.com>
 <CAFLBxZaLKGgrZRUDMQ+kCAYKD7ypzsjO55mWvkZHtMTBxdw51A@mail.gmail.com>
 <2024042544-jockstrap-cycle-ed93@gregkh>
 <9a2018c6-4efb-4bfe-b90f-531a072f0ef8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a2018c6-4efb-4bfe-b90f-531a072f0ef8@citrix.com>

On Tue, May 07, 2024 at 02:57:08PM +0100, Andrew Cooper wrote:
> Hello,
> 
> Please could we request a CVE for "xen-netfront: Add missing
> skb_mark_for_recycle" which is 037965402a010898d34f4e35327d22c0a95cd51f
> in Linus' tree.
> 
> This is a kernel memory leak trigger-able from unprivileged userspace.
> 
> I can't see any evidence of this fix having been assigned a CVE thus far
> on the linux-cve-annouce mailing list.

CVE-2024-27393 is now created for this, thanks.

greg k-h

