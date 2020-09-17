Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4426CFEA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 02:25:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIhie-0005nJ-Mg; Thu, 17 Sep 2020 00:24:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kIhid-0005nE-5x
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 00:24:11 +0000
X-Inumbo-ID: ab50fc1d-83d3-4d26-80d8-924f1098359a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab50fc1d-83d3-4d26-80d8-924f1098359a;
 Thu, 17 Sep 2020 00:24:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14F1220684;
 Thu, 17 Sep 2020 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600302248;
 bh=mAF6yQ/gJBNcsENQFn+Sng5/rlwgwqV2LyIfj+HP6xI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=inzOHgK+hGB5uiF8XQPJpCMfKX5X3tKAwAXZUgkjTXqywFEuiuQae/piml0Jt0hoN
 U09cI5Semo+fUfdu0U+mxQZNaZMMhhemLrD7gLViohhvmEJSn9c5DI8NhffU3yKMev
 iu/CQ+V5tx1LH4YsUWo0lLNAjjbqCI8Rrgn2qh7g=
Date: Wed, 16 Sep 2020 17:24:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] SUPPORT.md: Mark Renesas IPMMU-VMSA (Arm) as supported
In-Reply-To: <6c16083d-27c2-b325-99eb-1e8ff326ac03@xen.org>
Message-ID: <alpine.DEB.2.21.2009161718270.27508@sstabellini-ThinkPad-T480s>
References: <1600112240-31726-1-git-send-email-olekstysh@gmail.com>
 <6c16083d-27c2-b325-99eb-1e8ff326ac03@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 16 Sep 2020, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 14/09/2020 20:37, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > And remove dependencies on CONFIG_EXPERT.
> 
> In order to help to make the decision, can you provide the following
> information:
>    - Is it functionally complete?
>    - Can it work on all known platforms with IPMMU VMSA?
>    - Is there any plan to smoke (manually or automatically) test the driver?
> 
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > ---
> >   SUPPORT.md                      | 2 +-
> >   xen/arch/arm/platforms/Kconfig  | 2 +-
> >   xen/drivers/passthrough/Kconfig | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 1479055..5a96a12 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -64,7 +64,7 @@ supported in this document.
> >       Status, Intel VT-d: Supported
> >       Status, ARM SMMUv1: Supported
> >       Status, ARM SMMUv2: Supported
> > -    Status, Renesas IPMMU-VMSA: Tech Preview
> > +    Status, Renesas IPMMU-VMSA: Supported
> 
> Not entirely directed to the IPMMU-VMSA. Passthrough is not security supported
> on Arm today, so it is a bit odd to make the IOMMU drivers security supported.
> 
> I am thinking to downgrade the ARM SMMUv{1, 2} to "supported, not security
> supported" to avoid any confusion if a potential security issue arise.
> 
> Stefano, what do you think?

Yes, I agree.

