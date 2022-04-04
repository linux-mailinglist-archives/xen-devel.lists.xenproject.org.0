Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7524F185D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 17:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298411.508356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOco-000802-Rv; Mon, 04 Apr 2022 15:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298411.508356; Mon, 04 Apr 2022 15:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbOco-0007xr-Od; Mon, 04 Apr 2022 15:28:14 +0000
Received: by outflank-mailman (input) for mailman id 298411;
 Mon, 04 Apr 2022 15:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7PNb=UO=gmail.com=robherring2@srs-se1.protection.inumbo.net>)
 id 1nbOco-0007xl-6b
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 15:28:14 +0000
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6c0539f-b42b-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 17:28:13 +0200 (CEST)
Received: by mail-oi1-f181.google.com with SMTP id q129so10429711oif.4
 for <xen-devel@lists.xenproject.org>; Mon, 04 Apr 2022 08:28:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a17-20020a4ae931000000b0032933be7230sm3078785ooe.4.2022.04.04.08.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:28:11 -0700 (PDT)
Received: (nullmailer pid 1366199 invoked by uid 1000);
 Mon, 04 Apr 2022 15:28:10 -0000
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
X-Inumbo-ID: d6c0539f-b42b-11ec-a405-831a346695d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CMAZDlHZgNwtz0roIoFrFkP5I0hM5Ka8PZuGrF8daIM=;
        b=X4TI70WCKzCJeRLkxDFkAn6phA7lTykwNd35meL2IxBjZj24BOWBo8/u/YUyFcvXli
         3cmSkRX7e7nlZqTKJvCEIHGxQzcfPgTeA9jF7aFdsbImHNAzdcLJQFAv6BBiwUiX5BdC
         pz+UoT2DR/xNMwQofrV94dpDCJ9U3VAsOGD+5BN7rUT41BVgc8vTDkEfq3mY/cvMB4+N
         +2FfaWEgFxlXBylznc+lDNJe++a5b0DHYFVl2UzMfskbZzlB3qvneM4ZnsqBv8wkVAHn
         kWDpx814XS50GaEheY3XzlmUM6rtuFMsDtAQUbRLr06EnptGNt3Y8ku3Xi9JV9+OY7MP
         lJtA==
X-Gm-Message-State: AOAM53325XzpLBin0MU11B5vn4ph05dL5aq2iSAZg9OqdVFF5UGHOIMR
	5kwQxnFc4AbxzrfPEr+VyA==
X-Google-Smtp-Source: ABdhPJzwy0WY7B/N5LU4Fdra5RjMT/BpunQ/E9y8mWRkIFdFoRh+aK0icUktrwTy8x8OLe22r5Us7Q==
X-Received: by 2002:aca:5941:0:b0:2f7:5c90:ad61 with SMTP id n62-20020aca5941000000b002f75c90ad61mr10111767oib.190.1649086091538;
        Mon, 04 Apr 2022 08:28:11 -0700 (PDT)
Date: Mon, 4 Apr 2022 10:28:10 -0500
From: Rob Herring <robh@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] of: of_property_read_string return -ENODATA when !length
Message-ID: <YksOipbvQh8N1C+V@robh.at.kernel.org>
References: <alpine.DEB.2.22.394.2203311740450.2910984@ubuntu-linux-20-04-desktop>
 <CAL_Jsq+udUpUK3y7WOeLF2dtGs0=Jz59ed0mu_sgzstB-=TDzA@mail.gmail.com>
 <alpine.DEB.2.22.394.2204011338140.2910984@ubuntu-linux-20-04-desktop>
 <CAL_JsqJ6Yoc-gq=qUw+cS-34ZOsxtHAA01aa+FjaBySz1vwtuQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2204011517450.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204011517450.2910984@ubuntu-linux-20-04-desktop>

On Fri, Apr 01, 2022 at 03:43:42PM -0700, Stefano Stabellini wrote:
> On Fri, 1 Apr 2022, Rob Herring wrote:
> > On Fri, Apr 1, 2022 at 3:49 PM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > On Fri, 1 Apr 2022, Rob Herring wrote:
> > > > On Thu, Mar 31, 2022 at 7:46 PM Stefano Stabellini
> > > > <sstabellini@kernel.org> wrote:
> > > > >
> > > > > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > >
> > > > > When the length of the string is zero of_property_read_string should
> > > > > return -ENODATA according to the description of the function.
> > > >
> > > > Perhaps it is a difference of:
> > > >
> > > > prop;
> > > >
> > > > vs.
> > > >
> > > > prop = "";
> > > >
> > > > Both are 0 length by some definition. The description, '-ENODATA if
> > > > property does not have a value', matches the first case.
> > > >
> > > > >
> > > > > However, of_property_read_string doesn't check pp->length. If pp->length
> > > > > is zero, return -ENODATA.
> > > > >
> > > > > Without this patch the following command in u-boot:
> > > > >
> > > > > fdt set /chosen/node property-name
> > > > >
> > > > > results in of_property_read_string returning -EILSEQ when attempting to
> > > > > read property-name. With this patch, it returns -ENODATA as expected.
> > > >
> > > > Why do you care? Do you have a user? There could be an in tree user
> > > > that doesn't like this change.
> > >
> > > During review of a Xen patch series (we have libfdt is Xen too, synced
> > > with the kernel) Julien noticed a check for -EILSEQ. I added the check
> > > so that Xen would behave correctly in cases like the u-boot example in
> > > the patch description.
> > >
> > > Looking more into it, it seemed to be a mismatch between the description
> > > of of_property_read_string and the behavior (e.g. -ENODATA would seem to
> > > be the right return value, not -EILSEQ.)
> > >
> > > I added a printk to confirm what was going on when -EILSEQ was returned:
> > >
> > > printk("DEBUG %s %d value=%s value[0]=%d length=%u len=%lu\n",__func__,__LINE__,(char*)pp->value, *((char*)pp->value),pp->length,
> > > strlen(pp->value));
> > >
> > > This is the output:
> > > DEBUG of_property_read_string 205 value= value[0]=0 length=0 len=0
> > 
> > It turns out that we never set pp->value to NULL when unflattening
> > (and libfdt always returns a value). This function is assuming we do.
> > >
> > > As the description says:
> > >
> > >  *
> > >  * Return: 0 on success, -EINVAL if the property does not exist, -ENODATA if
> > >  * property does not have a value, and -EILSEQ if the string is not
> > >  * null-terminated within the length of the property data.
> > >  *
> > >
> > > It seems that this case matches "property does not have a value" which
> > > is expected to be -ENODATA instead of -EILSEQ. I guess one could also
> > > say that length is zero, so the string cannot be null-terminated,
> > > thus -EILSEQ?
> > >
> > > I am happy to go with your interpretation but -ENODATA seems to be the
> > > best match in my opinion.
> > 
> > I agree. I just think empty property should have a NULL value and 0
> > length, but we should only have to check one. I don't want check
> > length as that could be different for Sparc or non-FDT. So I think we
> > need this instead:
> > 
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index ec315b060cd5..d6b2b0d49d89 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -165,7 +165,7 @@ static void populate_properties(const void *blob,
> > 
> >                 pp->name   = (char *)pname;
> >                 pp->length = sz;
> > -               pp->value  = (__be32 *)val;
> > +               pp->value  = sz ? (__be32 *)val : NULL;
> >                 *pprev     = pp;
> >                 pprev      = &pp->next;
> >         }
> > 
> > 
> > It looks like setting 'value' has been like this at least since 2010.
> 
> Yep, fixing old bugs nobody cares about, that's me :-)

:)


> I made the corresponding change to Xen to check that it fixes the
> original issue (I am using Xen only for convenience because I already
> have a reproducer setup for it.)
> 
> Unfortunately it breaks the boot: the reason is that of_get_property is
> implemented as:
> 
>   return pp ? pp->value : NULL;
> 
> and at least in Xen (maybe in Linux too) there are instances of callers
> doing:
> 
>         if (!of_get_property(node, "interrupt-controller", NULL))
>             continue;
> 
> This would now take the wrong code path because value is returned as
> NULL.
> 
> So, although your patch is technically correct, it comes with higher
> risk of breaking existing code. How do you want to proceed?

We should just check 'length' is 0 and drop the !value part.

Rob

