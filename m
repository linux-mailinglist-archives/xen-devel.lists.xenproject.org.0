Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52D4EFCDB
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 00:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297638.507067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naPzh-0000sI-HG; Fri, 01 Apr 2022 22:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297638.507067; Fri, 01 Apr 2022 22:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naPzh-0000q0-E5; Fri, 01 Apr 2022 22:43:49 +0000
Received: by outflank-mailman (input) for mailman id 297638;
 Fri, 01 Apr 2022 22:43:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naPzf-0000pu-8f
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 22:43:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fae72a6-b20d-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 00:43:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06E2961AC4;
 Fri,  1 Apr 2022 22:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A59C340F3;
 Fri,  1 Apr 2022 22:43:43 +0000 (UTC)
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
X-Inumbo-ID: 2fae72a6-b20d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648853023;
	bh=k+RZxHyvOZAl6E9QWvnNayngGp2nt7useuqyNj/G844=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bg6G8dxO/J6ZJnOC9CEhkPZSA/v7/BSHz2tzcCAikbKFO0b0Zga3mo50CcME+5129
	 vQRKoRzq1X7dJYOGZWZbSMtSjANrMU1NzqhsxZOka2SLe1T5tygKKBN1vtnCfqF+09
	 c1h7yBUYwox5kyrrgRw50AC9LdJNMoSKgjc6ABANIF1OW2M0ruzkDXcjWLyc6RWssb
	 XPEReBjKkW6hKSSMNFrH/RrRHWhaXBsVJd/I2nyF1IawhC1anAfZRXmpPnoZVwDbu/
	 WiCF/mGbjHjhV/0LwCZ/RCKugrFzT5GFu5PuI7RHs88CvmNvI8zWRPTE6MSm5dvsPZ
	 PSgkRMdht8LFg==
Date: Fri, 1 Apr 2022 15:43:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rob Herring <robh+dt@kernel.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
    Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] of: of_property_read_string return -ENODATA when
 !length
In-Reply-To: <CAL_JsqJ6Yoc-gq=qUw+cS-34ZOsxtHAA01aa+FjaBySz1vwtuQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204011517450.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311740450.2910984@ubuntu-linux-20-04-desktop> <CAL_Jsq+udUpUK3y7WOeLF2dtGs0=Jz59ed0mu_sgzstB-=TDzA@mail.gmail.com> <alpine.DEB.2.22.394.2204011338140.2910984@ubuntu-linux-20-04-desktop>
 <CAL_JsqJ6Yoc-gq=qUw+cS-34ZOsxtHAA01aa+FjaBySz1vwtuQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Apr 2022, Rob Herring wrote:
> On Fri, Apr 1, 2022 at 3:49 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Fri, 1 Apr 2022, Rob Herring wrote:
> > > On Thu, Mar 31, 2022 at 7:46 PM Stefano Stabellini
> > > <sstabellini@kernel.org> wrote:
> > > >
> > > > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > >
> > > > When the length of the string is zero of_property_read_string should
> > > > return -ENODATA according to the description of the function.
> > >
> > > Perhaps it is a difference of:
> > >
> > > prop;
> > >
> > > vs.
> > >
> > > prop = "";
> > >
> > > Both are 0 length by some definition. The description, '-ENODATA if
> > > property does not have a value', matches the first case.
> > >
> > > >
> > > > However, of_property_read_string doesn't check pp->length. If pp->length
> > > > is zero, return -ENODATA.
> > > >
> > > > Without this patch the following command in u-boot:
> > > >
> > > > fdt set /chosen/node property-name
> > > >
> > > > results in of_property_read_string returning -EILSEQ when attempting to
> > > > read property-name. With this patch, it returns -ENODATA as expected.
> > >
> > > Why do you care? Do you have a user? There could be an in tree user
> > > that doesn't like this change.
> >
> > During review of a Xen patch series (we have libfdt is Xen too, synced
> > with the kernel) Julien noticed a check for -EILSEQ. I added the check
> > so that Xen would behave correctly in cases like the u-boot example in
> > the patch description.
> >
> > Looking more into it, it seemed to be a mismatch between the description
> > of of_property_read_string and the behavior (e.g. -ENODATA would seem to
> > be the right return value, not -EILSEQ.)
> >
> > I added a printk to confirm what was going on when -EILSEQ was returned:
> >
> > printk("DEBUG %s %d value=%s value[0]=%d length=%u len=%lu\n",__func__,__LINE__,(char*)pp->value, *((char*)pp->value),pp->length,
> > strlen(pp->value));
> >
> > This is the output:
> > DEBUG of_property_read_string 205 value= value[0]=0 length=0 len=0
> 
> It turns out that we never set pp->value to NULL when unflattening
> (and libfdt always returns a value). This function is assuming we do.
> >
> > As the description says:
> >
> >  *
> >  * Return: 0 on success, -EINVAL if the property does not exist, -ENODATA if
> >  * property does not have a value, and -EILSEQ if the string is not
> >  * null-terminated within the length of the property data.
> >  *
> >
> > It seems that this case matches "property does not have a value" which
> > is expected to be -ENODATA instead of -EILSEQ. I guess one could also
> > say that length is zero, so the string cannot be null-terminated,
> > thus -EILSEQ?
> >
> > I am happy to go with your interpretation but -ENODATA seems to be the
> > best match in my opinion.
> 
> I agree. I just think empty property should have a NULL value and 0
> length, but we should only have to check one. I don't want check
> length as that could be different for Sparc or non-FDT. So I think we
> need this instead:
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index ec315b060cd5..d6b2b0d49d89 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -165,7 +165,7 @@ static void populate_properties(const void *blob,
> 
>                 pp->name   = (char *)pname;
>                 pp->length = sz;
> -               pp->value  = (__be32 *)val;
> +               pp->value  = sz ? (__be32 *)val : NULL;
>                 *pprev     = pp;
>                 pprev      = &pp->next;
>         }
> 
> 
> It looks like setting 'value' has been like this at least since 2010.

Yep, fixing old bugs nobody cares about, that's me :-)

I made the corresponding change to Xen to check that it fixes the
original issue (I am using Xen only for convenience because I already
have a reproducer setup for it.)

Unfortunately it breaks the boot: the reason is that of_get_property is
implemented as:

  return pp ? pp->value : NULL;

and at least in Xen (maybe in Linux too) there are instances of callers
doing:

        if (!of_get_property(node, "interrupt-controller", NULL))
            continue;

This would now take the wrong code path because value is returned as
NULL.

So, although your patch is technically correct, it comes with higher
risk of breaking existing code. How do you want to proceed?

