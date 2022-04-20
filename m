Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BAD50892F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 15:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309235.525286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAJa-00081S-5f; Wed, 20 Apr 2022 13:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309235.525286; Wed, 20 Apr 2022 13:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAJa-0007zb-1Z; Wed, 20 Apr 2022 13:24:14 +0000
Received: by outflank-mailman (input) for mailman id 309235;
 Wed, 20 Apr 2022 13:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1nhAHf-0007y0-5x
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 13:22:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd34d7b4-c0ac-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 15:22:02 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id g13so3544040ejb.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 Apr 2022 06:22:13 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it.
 [79.50.86.254]) by smtp.gmail.com with ESMTPSA id
 w7-20020a1709061f0700b006ec8197e8a4sm6255708ejj.97.2022.04.20.06.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 06:22:11 -0700 (PDT)
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
X-Inumbo-ID: dd34d7b4-c0ac-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ng4rT6I4vcHmv4/7ezO3PQ9fpnN0wzaNSUcZ6IscV4k=;
        b=hisOYUiR4cenD1rp5qPKSBG+WAk64wKCLuwUm8RftXBLSnJNAj+b10FaYqJQ3H8Y9I
         Ll8ySPsAvRZBbFLxQqCxiKgJ0Raz+OKxSEH123P/ID9N4IMOW/8S2ZkWhDmPtn4DAB/m
         CJXmIRJgEXBZ86KiTOsgJKbzAQqulyO6SC+rF1OBjPNBAOlcac+iA0cVT2Zag6WtfN5n
         hByBi+9SfZHZRP99RvjAjR8Z+1Dv2JwgaaEJBwfKpHlGXP9Cqug0aiqIne7waUJcKbUf
         gdKJgXh+ank2b2a3ZSQAavn0rdJK8My3fLILeOefKuQTSWeoq0kT/7SmppbOo6yXDD9L
         H7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ng4rT6I4vcHmv4/7ezO3PQ9fpnN0wzaNSUcZ6IscV4k=;
        b=PeTzsuCEmFpnjYy5lAlsGI/WIEmFpujTyb7oE3Mq4W4bG52OlA/nwWebawMUAp/btE
         1TPWFB3B8uDhX57OlLyKF3l7PhDJqKVYhEo9py17xulxi3f9E9mc4X+lh5LVfY7WvaPZ
         8mUj4RJ0zoatYtTlN8/DY+/5nBzn1CgckHnznJ1SizIxKev/7KW0kUhoL3q4/FZy/Gg3
         9c2n0E728hgcB7q5VnQzjprR/RJy9RW30ECQBYdVzMXx77Pt6L7xYKzgBea04PUqwoHW
         iwiSigjA8RxzT3d2JywzuLOTdVQlgj7gXNaBqiTZMheQXSn+hwWjGRMmUhn3CRtz19sv
         l8Rg==
X-Gm-Message-State: AOAM5320onoTHbXo/cErpyEhtxwlF4ENe5okAQOJ3I8KzJE7hQO7pG++
	LOb/QYXU8rPdj4wxFp8ViT4=
X-Google-Smtp-Source: ABdhPJwU9wCOFteWozSkt5bu3lmUNtDTL6NNULRKJcKJoaUjbAjkFKxtS6lDaecx+VwibuEjcyEeBQ==
X-Received: by 2002:a17:906:60c2:b0:6e7:681e:b4b7 with SMTP id f2-20020a17090660c200b006e7681eb4b7mr18667712ejk.130.1650460932892;
        Wed, 20 Apr 2022 06:22:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>, ira.weiny@intel.com
Cc: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>, outreachy@lists.linux.dev, boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen:  Convert kmap() to kmap_local_page()
Date: Wed, 20 Apr 2022 15:22:10 +0200
Message-ID: <2940450.687JKscXgg@leap>
In-Reply-To: <alpine.DEB.2.22.394.2204200759080.2937@hadrien>
References: <20220419234328.10346-1-eng.alaamohamedsoliman.am@gmail.com> <alpine.DEB.2.22.394.2204200759080.2937@hadrien>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On mercoled=C3=AC 20 aprile 2022 08:03:05 CEST Julia Lawall wrote:
>=20
> On Wed, 20 Apr 2022, Alaa Mohamed wrote:
>=20
> > kmap() is being deprecated and these usages are all local to the thread
> > so there is no reason kmap_local_page() can't be used.
> >
> > Replace kmap() calls with kmap_local_page().
>=20
> OK, so from a Coccinelle point of view, could we do
>=20
> @@
> expression e1,e2,x,f;
> @@
>=20
> e1 =3D
> - kmap
> + kmap_local_page
>     (e2)
> ... when !=3D x =3D e1 // not stored in any location and not passed to=20
another function
>     when !=3D f(...,e1,...)
>     when !=3D x =3D e2
>     when !=3D f(...,e2,...)
> -kunmap(e2)
> +kunmap_local(e1)
>=20
> julia
>=20

I've never spent sufficient time to understand properly the syntax and=20
semantics of expressions of Coccinelle. However, thanks Julia, this code=20
looks good and can be very helpful.

Only a minor objection... it doesn't tell when 'e2' has been allocated=20
within the same function where the kmap() call is.

In the particular case that I cite above, I'd prefer to remove the=20
allocation of the page (say with alloc_page()) and convert kmap() /kunmap()=
=20
to use kmalloc() / kfree().=20

=46ox example, this is done in the following patch:

commit 633b0616cfe0 ("x86/sgx: Remove unnecessary kmap() from=20
sgx_ioc_enclave_init()") from Ira Weiny.

Can Coccinelle catch also those special cases where a page that is passed=20
to kmap() is allocated within that same function (vs. being passed as=20
argument to this function) and, if so, propose a replacement with=20
kmalloc()?

Thanks,

=46abio




