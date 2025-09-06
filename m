Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC1B468F1
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 06:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113115.1461175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uukNa-0006ct-VO; Sat, 06 Sep 2025 04:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113115.1461175; Sat, 06 Sep 2025 04:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uukNa-0006aS-Sa; Sat, 06 Sep 2025 04:18:22 +0000
Received: by outflank-mailman (input) for mailman id 1113115;
 Sat, 06 Sep 2025 04:18:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uukNZ-0006aM-7j
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 04:18:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uukNX-009RfV-1W;
 Sat, 06 Sep 2025 04:18:19 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uukNX-000JQ0-1C;
 Sat, 06 Sep 2025 04:18:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=FFHTHv+ciDFyK8pkM0/CoPbfpYr0LBC0kpQLqatYuNY=; b=
	IWrlr0MQLmmD2KYQ1A6qbR23VAIodfM7Uj5HvGz9JofSIuUd9I00XnxebQf0RSdIYqHS9uuVjKu2V
	C7FUaI2F1uCRnrn6jFyhXc0MFpPGD2Q2v8GKYSSKNnzp1BYzCVHpninw6gjUuMFX1t26diguZMjB3
	a7pXMgEPqFgWTzfXc=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 21:18:18 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v6 03/15] emul/ns16x50: implement emulator stub
Message-ID: <aLu2Cj1vi+LvnY3L@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-4-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2509051902510.1405870@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2509051902510.1405870@ubuntu-linux-20-04-desktop>

On Fri, Sep 05, 2025 at 07:03:19PM -0700, Stefano Stabellini wrote:
> On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
[..]
> > --- a/xen/common/emul/vuart/Kconfig
> > +++ b/xen/common/emul/vuart/Kconfig
> > @@ -3,4 +3,23 @@ config VUART_FRAMEWORK
> >  
> >  menu "UART Emulation"
> >  
> > +config VUART_NS16X50
> > +	bool "NS16550-compatible UART Emulator" if EXPERT
> > +	depends on X86 && HVM
> > +	select VUART_FRAMEWORK
> > +	default n
> > +	help
> > +	  In-hypervisor NS16x50 UART emulation.
> > +
> > +	  Only legacy PC COM2 port is emulated.
> > +
> > +	  This is strictly for testing purposes (such as early HVM guest console),
> > +	  and not appropriate for use in production.
> > +
> > +config VUART_NS16X50_DEBUG
> > +	bool "NS16550-compatible UART Emulator Debugging"
> > +	depends on VUART_NS16X50 && DEBUG
> > +	help
> > +	  Enable development debugging.
> 
> There is a question about adding the kconfig option early in the series.
> I think it would be best to add it as last patch

Will do.

