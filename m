Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D218CEBEB
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 23:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729865.1135163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAcq8-0003Dh-2Z; Fri, 24 May 2024 21:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729865.1135163; Fri, 24 May 2024 21:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAcq7-0003BM-Ve; Fri, 24 May 2024 21:52:39 +0000
Received: by outflank-mailman (input) for mailman id 729865;
 Fri, 24 May 2024 21:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAcq6-0002dr-FQ
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 21:52:38 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed779019-1a17-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 23:52:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1B1B3CE17F2;
 Fri, 24 May 2024 21:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028EFC2BBFC;
 Fri, 24 May 2024 21:52:30 +0000 (UTC)
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
X-Inumbo-ID: ed779019-1a17-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716587552;
	bh=lqg/FdrrZfv0OltkAYJZheRT6+j3ucts1UtyGs8yhb4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VMDchUYTgJe4oHNMuUk6+D59xfuadjX3ZAB4oN+Idh1x1Ya93HSJftS6sdrVKoPSC
	 Z5RI6gZ2Kph6Yw5pErEh1Hye9Ypvv2j85GeS1HEAhwYzyEwvyqhRkIin6SbB2lFFLf
	 rT7wq5jtYKFMgbMOvnr+hmlT/6BcBdde6fZKV8uUqyqgu42QthIuFe7stb6YWW2oWZ
	 OipfV/ObC38ml6aq6eQjiUHmk3QoPO6wrlwL3Ul/jYbGeqw/pQAImrAK5XM2WhOa1j
	 aV3uHFVMFkY8315tZHdygc83H6v3uEuzOD3zuVHd+geBtBzholFxFdqPQRrEoXsPQ4
	 are12XJ6YjLzg==
Date: Fri, 24 May 2024 14:52:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, anthony@xenproject.org, 
    sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com, 
    Volodymyr_Babchuk@epam.com, Henry Wang <xin.wang2@amd.com>, 
    Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v5 6/7] tools: Introduce the "xl dt-overlay attach"
 command
In-Reply-To: <59607ca9-3d78-4f8e-ad02-22df89cd9161@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405241452240.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop> <20240524021814.2666257-6-stefano.stabellini@amd.com> <59607ca9-3d78-4f8e-ad02-22df89cd9161@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 24/05/2024 03:18, Stefano Stabellini wrote:
> > From: Henry Wang <xin.wang2@amd.com>
> > 
> > With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
> > attach (in the future also detach) devices from the provided DT overlay
> > to domains. Support this by introducing a new "xl dt-overlay" command
> > and related documentation, i.e. "xl dt-overlay attach. Slightly rework
> > the command option parsing logic.
> > 
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >   tools/include/libxl.h               | 15 +++++++++++
> >   tools/include/xenctrl.h             |  3 +++
> >   tools/libs/ctrl/xc_dt_overlay.c     | 31 +++++++++++++++++++++++
> >   tools/libs/light/libxl_dt_overlay.c | 28 +++++++++++++++++++++
> >   tools/xl/xl_cmdtable.c              |  4 +--
> >   tools/xl/xl_vmcontrol.c             | 39 ++++++++++++++++++++---------
> >   6 files changed, 106 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> > index 3b5c18b48b..f2e19ec592 100644
> > --- a/tools/include/libxl.h
> > +++ b/tools/include/libxl.h
> > @@ -643,6 +643,12 @@
> >    */
> >   #define LIBXL_HAVE_NR_SPIS 1
> >   +/*
> > + * LIBXL_HAVE_OVERLAY_DOMAIN indicates the presence of
> > + * libxl_dt_overlay_domain.
> > + */
> > +#define LIBXL_HAVE_OVERLAY_DOMAIN 1
> I think this wants to gain DT_ just before OVERLAY. So from the name it is
> clearer we are talking about the Device-Tree overlay and not filesystem (or
> anything else where overlays are involved).

Done

