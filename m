Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FCBA2B67A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 00:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883200.1293261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB5H-00077e-OA; Thu, 06 Feb 2025 23:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883200.1293261; Thu, 06 Feb 2025 23:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB5H-00075z-LV; Thu, 06 Feb 2025 23:14:59 +0000
Received: by outflank-mailman (input) for mailman id 883200;
 Thu, 06 Feb 2025 23:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ypua=U5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tgB5F-0006Xt-Vn
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 23:14:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2de2fd58-e4e0-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 00:14:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CB685C48FA;
 Thu,  6 Feb 2025 23:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6DAC4CEDD;
 Thu,  6 Feb 2025 23:14:54 +0000 (UTC)
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
X-Inumbo-ID: 2de2fd58-e4e0-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738883695;
	bh=lJuXrqiCTdYqazKx2ZN9YYSK/WeYF5PcbvuKDEAto1s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R/8NAUxsPOpbP6HWbD6i0zRPNAOqOaqKRlfEYYY4Ni3fLHI/LqeXXBmZR4ii4oGEI
	 V7YuUDhC9AJZJjL5hfWJ2v7PUv+4SgeDFItCUi633gHsRUWEBLvUIguA6EmGTJIQxp
	 Xs+NZRJgt+KUDqxX5gK3IKOKQhJPXJ+tRMHV105fDGAtHmM6zSFZYf3DZVtFx0PbdV
	 WxNIHKnfMc6IsA58gNVdhkPkcud1dg12isEVpi7M+BclUQUaCmxl3KTAoYCS2Nam5Z
	 i2cGcomxZ5V3CqqaR2ZDzl6MSm9MKQUh/7p75DU64+Y05vqJ6Vb6/bseoTP1Wk/pXJ
	 IXw5VffG4oaAw==
Date: Thu, 6 Feb 2025 15:14:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, julien@xen.org, michal.orzel@amd.com, 
    Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 7/9] init-dom0less: allocate xenstore page is not
 already allocated
In-Reply-To: <c7788ba7-dccd-4c34-ae75-6159c9dbaeef@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502061514470.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop> <20250206010843.618280-7-stefano.stabellini@amd.com> <c7788ba7-dccd-4c34-ae75-6159c9dbaeef@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Jan Beulich wrote:
> On 06.02.2025 02:08, Stefano Stabellini wrote:
> > --- a/tools/helpers/init-dom0less.c
> > +++ b/tools/helpers/init-dom0less.c
> > @@ -16,8 +16,35 @@
> >  
> >  #include "init-dom-json.h"
> >  
> > +#define XENSTORE_PFN_OFFSET 1
> >  #define STR_MAX_LENGTH 128
> >  
> > +
> > +static int alloc_xs_page(struct xc_interface_core *xch,
> 
> While this isn't my area of maintainership, may I nevertheless ask that you
> please avoid introducing double blank lines?

Sure, thanks Jan

