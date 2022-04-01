Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2436E4EFBD7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 22:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297582.507000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naODM-0003ZB-2r; Fri, 01 Apr 2022 20:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297582.507000; Fri, 01 Apr 2022 20:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naODL-0003WD-Vm; Fri, 01 Apr 2022 20:49:47 +0000
Received: by outflank-mailman (input) for mailman id 297582;
 Fri, 01 Apr 2022 20:49:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naODJ-0003W7-W3
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 20:49:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 425130d7-b1fd-11ec-a405-831a346695d4;
 Fri, 01 Apr 2022 22:49:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B8CDB8256E;
 Fri,  1 Apr 2022 20:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE41DC340EC;
 Fri,  1 Apr 2022 20:49:41 +0000 (UTC)
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
X-Inumbo-ID: 425130d7-b1fd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648846182;
	bh=jEtgBQpJcj+wCxPvue6be/xKRiBRj0GT+qxovqCEaqo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LTfgALa3U/tHu2xtmMckDdSMs/1yq3O2zKb4JzcLKTKRCQhWmSCNBeuoATvlJ5JQ+
	 +Zi13iuTmyLy8K9GtziArRRlrQ52fXnuS/diQoVZPbegkRcVIa2dva/Nt1dS42zXqM
	 SHkH+J6o5NHgo/oW5WYrWcbHTPFJvSMc4UnSvud8Jarqop001WiBP6CM7lnudXomh6
	 dqx0gxfi5le4QOz4rakaZUVGXvfYQhYF+kS3cp3RzddukBRFNEvI4O0Nmq8mbSWwQo
	 AfjeZr+ilqug4MbzlEiVY8Leq1VlgCFQwzgFWv2PPJ69asql26L8kx/srR4RdU1RNU
	 eetfk5nbyV7HQ==
Date: Fri, 1 Apr 2022 13:49:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rob Herring <robh+dt@kernel.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
    Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] of: of_property_read_string return -ENODATA when
 !length
In-Reply-To: <CAL_Jsq+udUpUK3y7WOeLF2dtGs0=Jz59ed0mu_sgzstB-=TDzA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204011338140.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311740450.2910984@ubuntu-linux-20-04-desktop> <CAL_Jsq+udUpUK3y7WOeLF2dtGs0=Jz59ed0mu_sgzstB-=TDzA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Apr 2022, Rob Herring wrote:
> On Thu, Mar 31, 2022 at 7:46 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >
> > When the length of the string is zero of_property_read_string should
> > return -ENODATA according to the description of the function.
> 
> Perhaps it is a difference of:
> 
> prop;
> 
> vs.
> 
> prop = "";
> 
> Both are 0 length by some definition. The description, '-ENODATA if
> property does not have a value', matches the first case.
> 
> >
> > However, of_property_read_string doesn't check pp->length. If pp->length
> > is zero, return -ENODATA.
> >
> > Without this patch the following command in u-boot:
> >
> > fdt set /chosen/node property-name
> >
> > results in of_property_read_string returning -EILSEQ when attempting to
> > read property-name. With this patch, it returns -ENODATA as expected.
> 
> Why do you care? Do you have a user? There could be an in tree user
> that doesn't like this change.

During review of a Xen patch series (we have libfdt is Xen too, synced
with the kernel) Julien noticed a check for -EILSEQ. I added the check
so that Xen would behave correctly in cases like the u-boot example in
the patch description.

Looking more into it, it seemed to be a mismatch between the description
of of_property_read_string and the behavior (e.g. -ENODATA would seem to
be the right return value, not -EILSEQ.)

I added a printk to confirm what was going on when -EILSEQ was returned:

printk("DEBUG %s %d value=%s value[0]=%d length=%u len=%lu\n",__func__,__LINE__,(char*)pp->value, *((char*)pp->value),pp->length,
strlen(pp->value));
 
This is the output:
DEBUG of_property_read_string 205 value= value[0]=0 length=0 len=0

As the description says:

 *
 * Return: 0 on success, -EINVAL if the property does not exist, -ENODATA if
 * property does not have a value, and -EILSEQ if the string is not
 * null-terminated within the length of the property data.
 *

It seems that this case matches "property does not have a value" which
is expected to be -ENODATA instead of -EILSEQ. I guess one could also
say that length is zero, so the string cannot be null-terminated,
thus -EILSEQ?

I am happy to go with your interpretation but -ENODATA seems to be the
best match in my opinion.


> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 8e90071de6ed..da0f02c98bb2 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -439,7 +439,7 @@ int of_property_read_string(const struct device_node *np, const char *propname,
> >         const struct property *prop = of_find_property(np, propname, NULL);
> >         if (!prop)
> >                 return -EINVAL;
> > -       if (!prop->value)
> > +       if (!prop->value || !pp->length)
> >                 return -ENODATA;
> >         if (strnlen(prop->value, prop->length) >= prop->length)
> >                 return -EILSEQ;
> 

