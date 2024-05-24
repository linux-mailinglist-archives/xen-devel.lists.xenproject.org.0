Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F38CDF7D
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729025.1134150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKgT-000121-Kr; Fri, 24 May 2024 02:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729025.1134150; Fri, 24 May 2024 02:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKgT-0000xU-Fx; Fri, 24 May 2024 02:29:29 +0000
Received: by outflank-mailman (input) for mailman id 729025;
 Fri, 24 May 2024 02:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAKWv-0004I4-Nw
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:19:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102fbd00-1974-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 04:19:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BABEE62F9E;
 Fri, 24 May 2024 02:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A481BC2BD10;
 Fri, 24 May 2024 02:19:33 +0000 (UTC)
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
X-Inumbo-ID: 102fbd00-1974-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716517174;
	bh=UmGN7YKj+VvapXY7aISIsBXEob+KUsS793EdeP09GtI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sSpRa2gdRPXttpB+r/Suk18d4Ffvc40hZUhJBIDjtVhmQK4QBLChm0EyV6w844JBn
	 LtYH/JLrSHiA+2tHorqt5qmi0WjjDv0jQIBSvey1RXxlVtlKvWfI5I19K0hWI+yWx7
	 30IUZ4L8Eje47IxMBICJQuE/GiFGn2FxS8zVaogEKDGY4Zyu4fbTBQVxhuPxSynx5E
	 mjpcmNz2TDXbhsf0sxeFwh5bu8Q3rCcJlp+HTvjaDvVqbG9MQC7IE9BN4mm8bsGGCm
	 jnhe3RgvsGROeDcHRqS5y/tw5Bv9XiMYjl9vLHCXesEr7yxfIpMzqQ2fJT5zL1K/vf
	 Z9nJY8uKbHQ5A==
Date: Thu, 23 May 2024 19:19:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 8/9] tools: Introduce the "xl dt-overlay {attach,detach}"
 commands
In-Reply-To: <fc2ff110-0af7-439b-a220-2cb21c63c54e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405231822540.2557291@ubuntu-linux-20-04-desktop>
References: <20240523074040.1611264-1-xin.wang2@amd.com> <20240523074040.1611264-9-xin.wang2@amd.com> <fc2ff110-0af7-439b-a220-2cb21c63c54e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Julien Grall wrote:
> Hi Henry,
> 
> On 23/05/2024 08:40, Henry Wang wrote:
> > With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
> > attach/detach devices from the provided DT overlay to domains.
> > Support this by introducing a new set of "xl dt-overlay" commands and
> > related documentation, i.e. "xl dt-overlay {attach,detach}". Slightly
> > rework the command option parsing logic.
> > 
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > v4:
> > - Add Jason's Reviewed-by tag.
> > v3:
> > - Introduce new API libxl_dt_overlay_domain() and co., instead of
> >    reusing existing API libxl_dt_overlay().
> > - Add in-code comments for the LIBXL_DT_OVERLAY_* macros.
> > - Use find_domain() to avoid getting domain_id from strtol().
> > v2:
> > - New patch.
> > ---
> >   tools/include/libxl.h               | 10 +++++++
> >   tools/include/xenctrl.h             |  3 +++
> >   tools/libs/ctrl/xc_dt_overlay.c     | 31 +++++++++++++++++++++
> >   tools/libs/light/libxl_dt_overlay.c | 28 +++++++++++++++++++
> >   tools/xl/xl_cmdtable.c              |  4 +--
> >   tools/xl/xl_vmcontrol.c             | 42 ++++++++++++++++++++---------
> >   6 files changed, 104 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> > index 62cb07dea6..6cc6d6bf6a 100644
> > --- a/tools/include/libxl.h
> > +++ b/tools/include/libxl.h
> 
> I think you also need to introduce LIBXL_HAVE_...

Added

I have removed the LIBXL_DT_OVERLAY_DOMAIN_DETACH and the relate
mentions. I kept Jasons' ack.

