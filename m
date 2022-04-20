Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3490D508A19
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309274.525357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAze-0007av-2f; Wed, 20 Apr 2022 14:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309274.525357; Wed, 20 Apr 2022 14:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhAzd-0007Y8-Vm; Wed, 20 Apr 2022 14:07:41 +0000
Received: by outflank-mailman (input) for mailman id 309274;
 Wed, 20 Apr 2022 14:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1nhAzc-0007Y1-Ei
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:07:40 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c9b2008-c0b3-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 16:07:39 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id s18so3894422ejr.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Apr 2022 07:07:39 -0700 (PDT)
Received: from leap.localnet (host-79-50-86-254.retail.telecomitalia.it.
 [79.50.86.254]) by smtp.gmail.com with ESMTPSA id
 au9-20020a170907092900b006e8985cc68asm6703151ejc.1.2022.04.20.07.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 07:07:37 -0700 (PDT)
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
X-Inumbo-ID: 3c9b2008-c0b3-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=axtU0b8TtpVbp0s/mbZjWqvA94Dr9I508ZNrAg+bBn0=;
        b=h3ip9pqn1Te/4FB3H+4SHiAbA6baF/wjith2bzY2njubpPrbXH4SFJAnu8cJNj6/UK
         9HFHH3DpzxOPKbG+JhKptMmqnimupMF5acHMST/auHETQ7IXtI8oLiXzopiADk6Xvj+G
         C+uMkITomXf82mlJjY28A1Qwx4BudvCvgJ1RrHhCiHyBwvdNwBsktj2N82QxuHlJ2qY6
         A5ppVf0HcXwng/AJ50Z3JkMX+BIyeJSclRVNNIxSeuhV0kmicV+m33kBimktN/XAZHu0
         lnksAl27sz/nFPLLWRtLinxEZQwto3wwwhH8Z8jHyQEWM7nZtP1hdljsDO9Keod1r5az
         5AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=axtU0b8TtpVbp0s/mbZjWqvA94Dr9I508ZNrAg+bBn0=;
        b=flK4A0i8dIn5DYQmdDMtdZ7uPfPz859doWDE2I5fpGsm9xoc9eRUG7LCnmLS6rnMrv
         xfWhvKZSiJrHbtpKevnAiMKaddkeHw3jGr3JQViYmgaOsu5cifGwjrVPDwyXNacWsnKY
         VWnqtpSlLVdzM7ORmBpCogES0Kn8JFXgoWydH9Iw2v3OztCwtMEvkB56oZlvSn5C0fKU
         N9CR6UFSezyTInc0ZIv3hOF1DMkIprWUqhCzrCBAxtrW8o923PrQwkGRpLLXCb4g/iUO
         Su1bUXgxjndu2OTihyP5NZAwNu0NNOK98WpcRbbnjgXX0fzFqfPflkmha6Rb2IvyeN1T
         mwxA==
X-Gm-Message-State: AOAM532oGCUbeMJ9dm86nouPHgwcKAxblqxYDxHySgfEA3um/neFQw+S
	EN7dWUn7lr55niBaKLHmDXQ=
X-Google-Smtp-Source: ABdhPJzx++INwh/binOtJF6UHoLInnaW20QfquRf+Me/PgiY/eme4g+R8VUQweTxq86X6SxppLyFcQ==
X-Received: by 2002:a17:906:2e8d:b0:6e4:b5fc:e8e6 with SMTP id o13-20020a1709062e8d00b006e4b5fce8e6mr6678249eji.215.1650463658445;
        Wed, 20 Apr 2022 07:07:38 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Julia Lawall <julia.lawall@inria.fr>, ira.weiny@intel.com, Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>, outreachy@lists.linux.dev, boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen:  Convert kmap() to kmap_local_page()
Date: Wed, 20 Apr 2022 16:07:36 +0200
Message-ID: <2538961.9Mp67QZiUf@leap>
In-Reply-To: <alpine.DEB.2.22.394.2204201556330.2937@hadrien>
References: <20220419234328.10346-1-eng.alaamohamedsoliman.am@gmail.com> <3990312.6PsWsQAL7t@leap> <alpine.DEB.2.22.394.2204201556330.2937@hadrien>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On mercoled=C3=AC 20 aprile 2022 15:57:14 CEST Julia Lawall wrote:
>=20
> On Wed, 20 Apr 2022, Fabio M. De Francesco wrote:
>=20
> > On mercoled=C3=AC 20 aprile 2022 15:40:10 CEST Julia Lawall wrote:
> > >
> > > On Wed, 20 Apr 2022, Fabio M. De Francesco wrote:
> > >
> > > > On mercoled=C3=AC 20 aprile 2022 08:03:05 CEST Julia Lawall wrote:
> > > > >
> > > > > On Wed, 20 Apr 2022, Alaa Mohamed wrote:
> > > > >
> > > > > > kmap() is being deprecated and these usages are all local to=20
the
> > thread
> > > > > > so there is no reason kmap_local_page() can't be used.
> > > > > >
> > > > > > Replace kmap() calls with kmap_local_page().
> > > > >
> > > > > OK, so from a Coccinelle point of view, could we do
> > > > >
> > > > > @@
> > > > > expression e1,e2,x,f;
> > > > > @@
> > > > >
> > > > > e1 =3D
> > > > > - kmap
> > > > > + kmap_local_page
> > > > >     (e2)
> > > > > ... when !=3D x =3D e1 // not stored in any location and not pass=
ed=20
to
> > > > another function
> > > > >     when !=3D f(...,e1,...)
> > > > >     when !=3D x =3D e2
> > > > >     when !=3D f(...,e2,...)
> > > > > -kunmap(e2)
> > > > > +kunmap_local(e1)
> > > > >
> > > > > julia
> > > > >
> > > >
> > > > I've never spent sufficient time to understand properly the syntax=
=20
and
> > > > semantics of expressions of Coccinelle. However, thanks Julia, this
> > code
> > > > looks good and can be very helpful.
> > > >
> > > > Only a minor objection... it doesn't tell when 'e2' has been=20
allocated
> > > > within the same function where the kmap() call is.
> > > >
> > > > In the particular case that I cite above, I'd prefer to remove the
> > > > allocation of the page (say with alloc_page()) and convert kmap() /
> > kunmap()
> > > > to use kmalloc() / kfree().
> > > >
> > > > Fox example, this is done in the following patch:
> > > >
> > > > commit 633b0616cfe0 ("x86/sgx: Remove unnecessary kmap() from
> > > > sgx_ioc_enclave_init()") from Ira Weiny.
> > > >
> > > > Can Coccinelle catch also those special cases where a page that is
> > passed
> > > > to kmap() is allocated within that same function (vs. being passed=
=20
as
> > > > argument to this function) and, if so, propose a replacement with
> > > > kmalloc()?
> > >
> > > It looks complex in this case, because the allocation is in another
> > > function, and it is passed to another function.
> >
> > This is not the special case I was talking about. In this case your=20
code
> > for Coccinelle tells the right proposal and it is exactly what Alaa did=
=20
in
> > her patch (which is good!).
> >
> > I'm talking about other special cases like the one I pointed to with=20
the
> > link I provided. I'm sorry if my bad English made you think that Alaa's
> > patch was one of those cases where the page is allocated within the=20
same
> > function where kmap() is.
> >
> > I hope that now I've been clearer :)
>=20
> Ah, sorry for the misunderstanding.  If you have an example, I can take a
> look and propose something for this special case.
>=20
> julia

Yes, I have the example that you are asking for. It's that commit=20
633b0616cfe0 from Ira Weiny.

Let me copy and paste it here for your convenience...

diff --git a/arch/x86/kernel/cpu/sgx/ioctl.c b/arch/x86/kernel/cpu/sgx/
ioctl.c
index 90a5caf76939..2e10367ea66c 100644
=2D-- a/arch/x86/kernel/cpu/sgx/ioctl.c
+++ b/arch/x86/kernel/cpu/sgx/ioctl.c
@@ -604,7 +604,6 @@ static long sgx_ioc_enclave_init(struct sgx_encl *encl,=
=20
void __user *arg)
 {
        struct sgx_sigstruct *sigstruct;
        struct sgx_enclave_init init_arg;
=2D       struct page *initp_page;
        void *token;
        int ret;
=20
@@ -615,11 +614,15 @@ static long sgx_ioc_enclave_init(struct sgx_encl=20
*encl, void __user *arg)
        if (copy_from_user(&init_arg, arg, sizeof(init_arg)))
                return -EFAULT;
=20
=2D       initp_page =3D alloc_page(GFP_KERNEL);
=2D       if (!initp_page)
+       /*
+        * 'sigstruct' must be on a page boundary and 'token' on a 512 byte
+        * boundary.  kmalloc() will give this alignment when allocating
+        * PAGE_SIZE bytes.
+        */
+       sigstruct =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
+       if (!sigstruct)
                return -ENOMEM;
=20
=2D       sigstruct =3D kmap(initp_page);
        token =3D (void *)((unsigned long)sigstruct + PAGE_SIZE / 2);
        memset(token, 0, SGX_LAUNCH_TOKEN_SIZE);
=20
@@ -645,8 +648,7 @@ static long sgx_ioc_enclave_init(struct sgx_encl *encl,=
=20
void __user *arg)
        ret =3D sgx_encl_init(encl, sigstruct, token);
=20
 out:
=2D       kunmap(initp_page);
=2D       __free_page(initp_page);
+       kfree(sigstruct);
        return ret;
 }

I think that Coccinelle might understand that "initp_page" is allocated in=
=20
the same function where later it is kmap()'ed. But I'm not able to write a=
=20
Coccinelle check to find out these kinds of special cases. In these cases=20
the correct solution is not to use kmap_local_page(). Instead delete the=20
alloc_page() and use kmalloc().

Thanks,

=46abio




