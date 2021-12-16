Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3284767BF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 03:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247686.427094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxgEW-0004F2-1e; Thu, 16 Dec 2021 02:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247686.427094; Thu, 16 Dec 2021 02:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxgEV-0004DF-UY; Thu, 16 Dec 2021 02:10:59 +0000
Received: by outflank-mailman (input) for mailman id 247686;
 Thu, 16 Dec 2021 02:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyNJ=RB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mxgET-0004D9-QN
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 02:10:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66ead2cb-5e15-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 03:10:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4917DB81ECE;
 Thu, 16 Dec 2021 02:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9044BC36AE0;
 Thu, 16 Dec 2021 02:10:53 +0000 (UTC)
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
X-Inumbo-ID: 66ead2cb-5e15-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639620654;
	bh=y5Ec8S/n/WE66K67y3922wUWtJSDkKPWi0sFUJg8h+A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=on4vKIpR0OsAKsnlUUt01No+4hrQnJwqjsFHQx/tCbtrrW6gTgv2DE9flIeheJiYi
	 SWGkxr2W85x8ivCRF6z+tYiIOgIU/Sq2oSrdZbsTvsoIYzF8/bOxwIkQwRKFOMvWl6
	 iC5rbid0Nu0yGDxkxHM1Gr5ktd17HVtRR5NTW0U7Ri/Nma62EL8vVLvj2lfikxRFmi
	 hIYccVUWlhwYT7xygtrOJyta/cQcOQBUOb5LakZ8QGxEZdV9NVGyeylCtites0PRU1
	 vrORkqLIhKgUnGcgwt6k1gJ1WlKQP9Tl+UaGB8ecrwcP4IyA1LeASMdBbis4fM0YLP
	 PHFaH/sG8Y5Pw==
Date: Wed, 15 Dec 2021 18:10:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
In-Reply-To: <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
References: <20211208155606.20029-1-jgross@suse.com> <20211208155606.20029-3-jgross@suse.com> <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org> <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Dec 2021, Juergen Gross wrote:
> On 14.12.21 18:36, Julien Grall wrote:
> > Hi,
> > 
> > On 08/12/2021 15:55, Juergen Gross wrote:
> > > Today most hypercall handlers have a return type of long, while the
> > > compat ones return an int. There are a few exceptions from that rule,
> > > however.
> > 
> > So on Arm64, I don't think you can make use of the full 64-bit because a
> > 32-bit domain would not be able to see the top 32-bit.
> > 
> > In fact, this could potentially cause us some trouble (see [1]) in Xen.
> > So it feels like the hypercalls should always return a 32-bit signed value
> > on Arm.
> 
> This would break hypercalls like XENMEM_maximum_ram_page which are able
> to return larger values, right?
> 
> > The other advantage is it would be clear that the top 32-bit are not
> > usuable. Stefano, what do you think?
> 
> Wouldn't it make more sense to check the return value to be a sign
> extended 32-bit value for 32-bit guests in do_trap_hypercall() instead?
> 
> The question is what to return if this is not the case. -EDOM?


I can see where Julien is coming from: we have been trying to keep the
arm32 and arm64 ABIs identical since the beginning of the project. So,
like Julien, my preference would be to always return 32-bit on ARM, both
aarch32 and aarch64. It would make things simple.

The case of XENMEM_maximum_ram_page is interesting but it is not a
problem in reality because the max physical address size is only 40-bit
for aarch32 guests, so 32-bit are always enough to return the highest
page in memory for 32-bit guests.

So XENMEM_maximum_ram_page could be the exception and return "long"
which is 4 bytes on aarch32 and 8 bytes on aarch64, and it is exactly
what we need.

