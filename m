Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF14EE566
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 02:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297140.506056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Em-0005yF-AN; Fri, 01 Apr 2022 00:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297140.506056; Fri, 01 Apr 2022 00:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na5Em-0005v7-78; Fri, 01 Apr 2022 00:34:00 +0000
Received: by outflank-mailman (input) for mailman id 297140;
 Fri, 01 Apr 2022 00:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1na5El-0005v1-8U
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 00:33:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a309a66-b153-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 02:33:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C32876187D;
 Fri,  1 Apr 2022 00:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70F7C340EE;
 Fri,  1 Apr 2022 00:33:54 +0000 (UTC)
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
X-Inumbo-ID: 6a309a66-b153-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648773235;
	bh=vfmf2C08q6OsbwZcbUBkq57f0KXC7iAFpbtu/pP9fUo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J4OrLCNNFip75Tonb0PtChnVw2Bc5Xx/pJMGogkIh4NaTselluXmfbBZrZ3aOHkr1
	 w9qrf5akO5znt65ogonHseHJX0mVqPZm9gtQm0vczZ2vWyQPYuuXIAbeGj849SUZil
	 OoeNFyW00SBt0ridWw5qrPvPIctu5VFV/sefQ6BhzcvmyOo2GRGxwsVlv8W4HlvJ8P
	 YLEqBUHbltqjvDWuKbE5A833VeSte6DvDnDbi+Kd2SaBaMLyolsEzWmVEPuATXjKHm
	 VJPZotEraSjsxr+jFiJM+p8Hhw/OhFIlNa4rGf7j4n66fS1X36qpPocb2yr49BaMp8
	 /np2NZ/dKBj6g==
Date: Thu, 31 Mar 2022 17:33:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 1/5] xen: introduce xen,enhanced dom0less property
In-Reply-To: <5c2cc1dd-d070-a88c-0e49-bca9ba56900c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203311703070.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-1-sstabellini@kernel.org> <3a00dff8-c213-616e-48b0-6e2b6f30dbce@xen.org> <alpine.DEB.2.22.394.2203221653230.2910984@ubuntu-linux-20-04-desktop>
 <5c2cc1dd-d070-a88c-0e49-bca9ba56900c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Mar 2022, Julien Grall wrote:
> On 23/03/2022 00:08, Stefano Stabellini wrote:
> > On Sat, 29 Jan 2022, Julien Grall wrote:
> > > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > > index 6931c022a2..9144d6c0b6 100644
> > > > --- a/xen/arch/arm/domain_build.c
> > > > +++ b/xen/arch/arm/domain_build.c
> > > > @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
> > > >                                     const struct dt_device_node *node)
> > > >    {
> > > >        struct kernel_info kinfo = {};
> > > > +    const char *dom0less_enhanced;
> > > >        int rc;
> > > >        u64 mem;
> > > >    @@ -2978,6 +2979,12 @@ static int __init construct_domU(struct domain
> > > > *d,
> > > >          kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
> > > >    +    rc = dt_property_read_string(node, "xen,enhanced",
> > > > &dom0less_enhanced);
> > > > +    if ( rc == -EILSEQ ||
> > > 
> > > I think the use an -EILSEQ wants an explanation. In a previous version,
> > > you
> > > wrote that the value would be returned when:
> > > 
> > > fdt set /chosen/domU0 xen,enhanced
> > > 
> > > But it is not clear why. Can you print pp->value, pp->length, strnlen(..)
> > > when
> > > this happens?
> > 
> > I added in dt_property_read_string:
> > 
> > printk("DEBUG %s %d value=%s value[0]=%d length=%u
> > len=%lu\n",__func__,__LINE__,(char*)pp->value,
> > *((char*)pp->value),pp->length, strlen(pp->value));
> > 
> > This is the output:
> > (XEN) DEBUG dt_property_read_string 205 value= value[0]=0 length=0 len=0
> 
> Thanks posting the log!
> 
> For convenience, I am copying the comment on top of dt_property_read_string()
> prototype:
> 
>  * Search for a property in a device tree node and retrieve a null
>  * terminated string value (pointer to data, not a copy). Returns 0 on
>  * success, -EINVAL if the property does not exist, -ENODATA if property
>  * doest not have value, and -EILSEQ if the string is not
>  * null-terminated with the length of the property data.
> 
> Per your log, the length is NULL so I would have assumed -ENODATA would be
> returned. Looking at the implementation:
> 
>     const struct dt_property *pp = dt_find_property(np, propname, NULL);
> 
>     if ( !pp )
>         return -EINVAL;
>     if ( !pp->value )
>         return -ENODATA;
>     if ( strnlen(pp->value, pp->length) >= pp->length )
>         return -EILSEQ;
> 
> We consider that the property when pp->value is NULL. However, AFAICT, we
> never set pp->value to NULL (see unflatten_dt_node()).
> 
> So I think there is a bug in the implementation. I would keep the check
> !pp->value (for hardening purpose) and also return -ENODATA when !pp->length.
> 
> Most of our device-tree code is from Linux. Looking at v5.17, the bug seems to
> be present there too. This would want to be fixed there too.

I have added a patch to fix dt_property_read_string. I am about to send
it out as patch of v4 of the series. I'll also follow-up on Linux.

I am thinking of keeping the -EILSEQ in domain_build.c for hardening
purposes.

