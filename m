Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B44E49F4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 01:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293701.499031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWoXs-0005cU-5V; Wed, 23 Mar 2022 00:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293701.499031; Wed, 23 Mar 2022 00:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWoXs-0005Zh-2V; Wed, 23 Mar 2022 00:08:12 +0000
Received: by outflank-mailman (input) for mailman id 293701;
 Wed, 23 Mar 2022 00:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWoXq-0005Zb-IM
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 00:08:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5131aa02-aa3d-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 01:08:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C85E5612D2;
 Wed, 23 Mar 2022 00:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE3BC340EC;
 Wed, 23 Mar 2022 00:08:05 +0000 (UTC)
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
X-Inumbo-ID: 5131aa02-aa3d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647994086;
	bh=N7iDlJF01CUUgAbqniay20AhN/tFtDX3Q8xXXUt3DBo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LJ/vAp+BywJx7zWQEss24xrfrmJl04OiVyjxK/sWX8eVwQmPAkm2KXGN4LRqLEUsY
	 +PQfQyocQMWTbs2kvXxikkkv8sjhoNq9oTcTII+EHdCHRRGojsXSgUR+uzrg+d0t7F
	 AqT44+g64oc38pzs4hB9yGobxzQmnBdBJF15GkmaaLGPpgHl47GkChomJErhAyFIO2
	 Pb0YRO4gLHYrT5mEMZGYdvScnE+7y+fy+YhsMgdM5biU32hX9We9B3Y3BsWgrfC85W
	 9x22k/Jb+Fhu3EKU9jz5DR1lJQO7T9s2RZr8+fwroPcNo1sVFW/24QVJHlEC8/8mj6
	 qMfvKudLtZ6zg==
Date: Tue, 22 Mar 2022 17:08:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 1/5] xen: introduce xen,enhanced dom0less property
In-Reply-To: <3a00dff8-c213-616e-48b0-6e2b6f30dbce@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203221653230.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-1-sstabellini@kernel.org> <3a00dff8-c213-616e-48b0-6e2b6f30dbce@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 29 Jan 2022, Julien Grall wrote:
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 6931c022a2..9144d6c0b6 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
> >                                    const struct dt_device_node *node)
> >   {
> >       struct kernel_info kinfo = {};
> > +    const char *dom0less_enhanced;
> >       int rc;
> >       u64 mem;
> >   @@ -2978,6 +2979,12 @@ static int __init construct_domU(struct domain *d,
> >         kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
> >   +    rc = dt_property_read_string(node, "xen,enhanced",
> > &dom0less_enhanced);
> > +    if ( rc == -EILSEQ ||
> 
> I think the use an -EILSEQ wants an explanation. In a previous version, you
> wrote that the value would be returned when:
> 
> fdt set /chosen/domU0 xen,enhanced
> 
> But it is not clear why. Can you print pp->value, pp->length, strnlen(..) when
> this happens?

I added in dt_property_read_string:

printk("DEBUG %s %d value=%s value[0]=%d length=%u len=%lu\n",__func__,__LINE__,(char*)pp->value, *((char*)pp->value),pp->length, strlen(pp->value));

This is the output:
(XEN) DEBUG dt_property_read_string 205 value= value[0]=0 length=0 len=0


