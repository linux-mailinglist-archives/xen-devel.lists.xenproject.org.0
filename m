Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89A5089E0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 15:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309256.525322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAo0-0004c0-8q; Wed, 20 Apr 2022 13:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309256.525322; Wed, 20 Apr 2022 13:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAo0-0004Z2-5E; Wed, 20 Apr 2022 13:55:40 +0000
Received: by outflank-mailman (input) for mailman id 309256;
 Wed, 20 Apr 2022 13:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1nhAny-0004Yw-Dq
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 13:55:38 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e4f24eb-c0b1-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 15:55:37 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id k23so3749096ejd.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Apr 2022 06:55:37 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it.
 [79.50.86.254]) by smtp.gmail.com with ESMTPSA id
 x19-20020a05640226d300b004228faf83desm8275806edd.12.2022.04.20.06.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 06:55:35 -0700 (PDT)
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
X-Inumbo-ID: 8e4f24eb-c0b1-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lWkDf0wNceWcaf4i2M1FdHierloyPBoW31t9T2JLGrs=;
        b=MMLAf5NoGw56Pzvcxrd5pY9+RhqwItSeA0OHHxL1ivLiEGGdjUaxH+oPSJccQLbtkn
         jqSvrv0+NgCPeCx1Tq8ErwuVVY+ZEe431Iz58dHu7LSBisKz0idcCiHGFmTSZ0KXHI5S
         zsSQrw9kn5p8BtVCZe7iVkRyOUB+/9/e4nx9Cd2mH6A6kKMpXdkONZKiEhcx/kanQ/Zb
         7/WKktk6Mxp4M53vfXEfzUFgnxt5gi5ePPpqMQjIYdY3uOf5q9+5sWqb0a3adab0WOQu
         5iswm3+ZIIUtQqotZWENSzvIV1k4O52iky9KWA24KAdVQlCwa+33sDpfS990ze9syLqL
         cTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lWkDf0wNceWcaf4i2M1FdHierloyPBoW31t9T2JLGrs=;
        b=n7CBt/UTFOKE97hy4JM/c/LiaoO1IjiWURXm1DfTMQ3uVmSKbtKOccxdtxRsEG9b9C
         4mknXzghsI1cLBWFETNd+gh1K4ws165Ulfi9uVAl9ZhGUvvzzFUfVE9fMLia7VC4MwNI
         0dTRyFyyl9jOHysXxUH8B2zfotAuKUj0EqUN8V+uELO4uP//kD+6D5FUv25XQoVc3aIH
         UAjH+o3cfd4cYgH9DGgrVlOFuqm5gxfjCwDIii4ftpO+OpczBCnb1crpZWpHMUTAbLuD
         tqRLbP4OZaP+2/96u8GTD0OCYCjiMdfiKoYxf+rJ6qlkRwkgHRFJ6i6CAZIOkZSko9IR
         jcIA==
X-Gm-Message-State: AOAM531A2JukpJsxMsDhC3/3d8Sn34ItZf3JCoC5DqMdU1AcyFKrGLE7
	HDFC+UG6zQN4xROlbM/jrUg=
X-Google-Smtp-Source: ABdhPJz0c2WM3jXMhp3SbAHw3bgGqgx8hp0cdYVR6eNckJU3LJwiBiMvAH6WyMFGZfERJkze9g8T4Q==
X-Received: by 2002:a17:907:6d23:b0:6d9:ac9d:222 with SMTP id sa35-20020a1709076d2300b006d9ac9d0222mr18765799ejc.595.1650462936798;
        Wed, 20 Apr 2022 06:55:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>, ira.weiny@intel.com
Cc: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>, outreachy@lists.linux.dev, boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen:  Convert kmap() to kmap_local_page()
Date: Wed, 20 Apr 2022 15:55:34 +0200
Message-ID: <3990312.6PsWsQAL7t@leap>
In-Reply-To: <alpine.DEB.2.22.394.2204201538560.2937@hadrien>
References: <20220419234328.10346-1-eng.alaamohamedsoliman.am@gmail.com> <2940450.687JKscXgg@leap> <alpine.DEB.2.22.394.2204201538560.2937@hadrien>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On mercoled=C3=AC 20 aprile 2022 15:40:10 CEST Julia Lawall wrote:
>=20
> On Wed, 20 Apr 2022, Fabio M. De Francesco wrote:
>=20
> > On mercoled=C3=AC 20 aprile 2022 08:03:05 CEST Julia Lawall wrote:
> > >
> > > On Wed, 20 Apr 2022, Alaa Mohamed wrote:
> > >
> > > > kmap() is being deprecated and these usages are all local to the=20
thread
> > > > so there is no reason kmap_local_page() can't be used.
> > > >
> > > > Replace kmap() calls with kmap_local_page().
> > >
> > > OK, so from a Coccinelle point of view, could we do
> > >
> > > @@
> > > expression e1,e2,x,f;
> > > @@
> > >
> > > e1 =3D
> > > - kmap
> > > + kmap_local_page
> > >     (e2)
> > > ... when !=3D x =3D e1 // not stored in any location and not passed to
> > another function
> > >     when !=3D f(...,e1,...)
> > >     when !=3D x =3D e2
> > >     when !=3D f(...,e2,...)
> > > -kunmap(e2)
> > > +kunmap_local(e1)
> > >
> > > julia
> > >
> >
> > I've never spent sufficient time to understand properly the syntax and
> > semantics of expressions of Coccinelle. However, thanks Julia, this=20
code
> > looks good and can be very helpful.
> >
> > Only a minor objection... it doesn't tell when 'e2' has been allocated
> > within the same function where the kmap() call is.
> >
> > In the particular case that I cite above, I'd prefer to remove the
> > allocation of the page (say with alloc_page()) and convert kmap() /
kunmap()
> > to use kmalloc() / kfree().
> >
> > Fox example, this is done in the following patch:
> >
> > commit 633b0616cfe0 ("x86/sgx: Remove unnecessary kmap() from
> > sgx_ioc_enclave_init()") from Ira Weiny.
> >
> > Can Coccinelle catch also those special cases where a page that is=20
passed
> > to kmap() is allocated within that same function (vs. being passed as
> > argument to this function) and, if so, propose a replacement with
> > kmalloc()?
>=20
> It looks complex in this case, because the allocation is in another
> function, and it is passed to another function.

This is not the special case I was talking about. In this case your code=20
for Coccinelle tells the right proposal and it is exactly what Alaa did in=
=20
her patch (which is good!).

I'm talking about other special cases like the one I pointed to with the=20
link I provided. I'm sorry if my bad English made you think that Alaa's=20
patch was one of those cases where the page is allocated within the same=20
function where kmap() is.

I hope that now I've been clearer :)

Thanks,

=46abio



