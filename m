Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2A9B466C3
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 00:43:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112557.1460768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuf9N-0002OT-C2; Fri, 05 Sep 2025 22:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112557.1460768; Fri, 05 Sep 2025 22:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuf9N-0002Lw-8h; Fri, 05 Sep 2025 22:43:21 +0000
Received: by outflank-mailman (input) for mailman id 1112557;
 Fri, 05 Sep 2025 22:43:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uuf9L-0002Lq-VK
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 22:43:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uuf9K-0089HM-2I;
 Fri, 05 Sep 2025 22:43:18 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uuf9K-00038z-29;
 Fri, 05 Sep 2025 22:43:18 +0000
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
	:Subject:Cc:To:Date:From; bh=dlW4ptRpskViitNkkthGRQ+k4S21ADWUgDwEaKKdZmw=; b=
	ELuWVtp9uGzqaOT0Qf4KEy9KVyhvfw0osl+QBCoGTlMqZYKy8ntb4yfng3aRxkk3iOAefWRn1yk5a
	abij5LCSeiXDHeCW8hTnjWCu9kcHeBukGDid9shQ6Y5SAQd4A0DDkbiE0R1EzxIxu0RL3tCbKxRhp
	T2NrzXTjJdGCvzhjY=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 15:43:17 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v5 14/15] xen/domain: allocate d->irq_caps before
 arch-specific initialization
Message-ID: <aLtnhVoP2/jX0b8z@kraken>
References: <20250828235409.2835815-1-dmukhin@ford.com>
 <20250828235409.2835815-15-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2508291445300.341243@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508291445300.341243@ubuntu-linux-20-04-desktop>

On Fri, Aug 29, 2025 at 02:46:29PM -0700, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
[..]
> >  
> > +    /* Disallow sharing physical IRQ */
> > +    rc = irq_deny_access(d, info->irq);
> > +    if ( rc )
> > +    {
> > +        ns16x50_err(info, "virtual IRQ#%d: conflict w/ physical IRQ: %d\n",
> > +                    info->irq, rc);
> > +        return rc;
> > +    }
> 
> Also this one I wonder if it could be in hvm_domain_initialise, it would
> make more sense to keep the irq_deny_access there, compared to here
> which is supposed to be a generic emulator

I think it is better to have all vuart initialization in one place, at least
until MMIO-based variant is not available. Current code is x86-specific (port
handlers and IRQ emulation), there will be some changes to make code a generic
NS16550 emulator.

