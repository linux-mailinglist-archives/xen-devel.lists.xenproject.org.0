Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2253157A0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 21:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83410.155173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZVu-0005SL-6n; Tue, 09 Feb 2021 20:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83410.155173; Tue, 09 Feb 2021 20:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZVu-0005Rv-3I; Tue, 09 Feb 2021 20:21:34 +0000
Received: by outflank-mailman (input) for mailman id 83410;
 Tue, 09 Feb 2021 20:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9ZVs-0005Rq-IF
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 20:21:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd45748c-46c7-4b81-a4fb-069acfbdb8c9;
 Tue, 09 Feb 2021 20:21:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2166C64E7E;
 Tue,  9 Feb 2021 20:21:30 +0000 (UTC)
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
X-Inumbo-ID: bd45748c-46c7-4b81-a4fb-069acfbdb8c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612902090;
	bh=a9TA/DE8lGcJsKiZKDbb6+lH/9UqAUlv/Zis0qEg+08=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bIDoohiMlUoU44IvHBOSpKkH0TGMbfaouxcBZOWxzq1FCZvX+J6uzh4FpA5V1WzBt
	 VpCpodHkRPX2hXT8mb+OmfusWdS/dR+qHBFTEzs9f7GlFejOpAEDzVs+pqSN8dgr+f
	 zPG67Jp1S00sJ8wDqhZpiS+0vl2V8jgBFFxHpmaK54GtF5o3X+8Vl2EhodDos+coMe
	 MWyvERVR6Ggwj7l835YxabmZcLODbp1cZidTAYHl4kGwIh0akmr8cTHM/VrD6r5P1F
	 ClJYmR70WvQrLDL1VjOoKTyL5QpaUkmctXOmWUZus5c5Ntwr85eOWdvVsk47VDH1hi
	 cYIvw+hIG3vvA==
Date: Tue, 9 Feb 2021 12:21:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    ehem+xen@m5p.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen: workaround missing device_type property in
 pci/pcie nodes
In-Reply-To: <e2a807fd-a027-fa7d-315a-f64db8c56e1c@citrix.com>
Message-ID: <alpine.DEB.2.21.2102091221090.8948@sstabellini-ThinkPad-T480s>
References: <20210209195334.21206-1-sstabellini@kernel.org> <e2a807fd-a027-fa7d-315a-f64db8c56e1c@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Feb 2021, Andrew Cooper wrote:
> On 09/02/2021 19:53, Stefano Stabellini wrote:
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index 18825e333e..f1a96a3b90 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
> >   * PCI bus specific translator
> >   */
> >  
> > +static bool_t dt_node_is_pci(const struct dt_device_node *np)
> > +{
> > +    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
> > +
> > +    if (is_pci)
> 
> bool on the function, and spaces here, which I'm sure you can fix while
> committing :)

Oops, thanks Andrew

