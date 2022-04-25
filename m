Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CBB50E482
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 17:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313102.530570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj0jw-0001Tm-Gd; Mon, 25 Apr 2022 15:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313102.530570; Mon, 25 Apr 2022 15:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj0jw-0001QY-Cy; Mon, 25 Apr 2022 15:35:04 +0000
Received: by outflank-mailman (input) for mailman id 313102;
 Mon, 25 Apr 2022 15:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qlrd=VD=inria.fr=julia.lawall@srs-se1.protection.inumbo.net>)
 id 1nj0jv-0001QS-4o
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 15:35:03 +0000
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4501050a-c4ad-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 17:35:01 +0200 (CEST)
Received: from ip-214.net-89-2-7.rev.numericable.fr (HELO hadrien)
 ([89.2.7.214]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 17:35:00 +0200
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
X-Inumbo-ID: 4501050a-c4ad-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2BAVYOzHyLn6mrUTsnozcnawOl0hxdkWwXi8fyQF4Ik=;
  b=LbaA6wKuIm3B3fXzADjns8BtJVZsRwYNKdhnolZfvhz3lF127+ipZpoM
   yr+P61xyB7QYhdNgJOGf6TzE9Q8/eU5hniKcHFWqNiI3av3jnsb6sTpEv
   miliijm9jLUO0TLCtzgB/hGEwEr1YdVJdkTbpsPBj5C/hSVtM25LMyVFg
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,288,1643670000"; 
   d="scan'208";a="12375271"
Date: Mon, 25 Apr 2022 17:34:59 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Ira Weiny <ira.weiny@intel.com>
cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
    Julia Lawall <julia.lawall@inria.fr>, 
    Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>, 
    outreachy@lists.linux.dev, boris.ostrovsky@oracle.com, jgross@suse.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen:  Convert kmap() to kmap_local_page()
In-Reply-To: <Yma9zvvuZGyAeRBG@iweiny-desk3>
Message-ID: <alpine.DEB.2.22.394.2204251733420.2718@hadrien>
References: <20220419234328.10346-1-eng.alaamohamedsoliman.am@gmail.com> <3990312.6PsWsQAL7t@leap> <alpine.DEB.2.22.394.2204201556330.2937@hadrien> <2538961.9Mp67QZiUf@leap> <Yma9zvvuZGyAeRBG@iweiny-desk3>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1172987651-1650900900=:2718"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1172987651-1650900900=:2718
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



On Mon, 25 Apr 2022, Ira Weiny wrote:

> On Wed, Apr 20, 2022 at 04:07:36PM +0200, Fabio M. De Francesco wrote:
> > On mercoledì 20 aprile 2022 15:57:14 CEST Julia Lawall wrote:
> > >
> > > On Wed, 20 Apr 2022, Fabio M. De Francesco wrote:
> > >
> > > > On mercoledì 20 aprile 2022 15:40:10 CEST Julia Lawall wrote:
> > > > >
> > > > > On Wed, 20 Apr 2022, Fabio M. De Francesco wrote:
> > > > >
> > > > > > On mercoledì 20 aprile 2022 08:03:05 CEST Julia Lawall wrote:
> > > > > > >
> > > > > > > On Wed, 20 Apr 2022, Alaa Mohamed wrote:
> > > > > > >
> > > > > > > > kmap() is being deprecated and these usages are all local to
> > the
> > > > thread
> > > > > > > > so there is no reason kmap_local_page() can't be used.
> > > > > > > >
> > > > > > > > Replace kmap() calls with kmap_local_page().
> > > > > > >
> > > > > > > OK, so from a Coccinelle point of view, could we do
> > > > > > >
> > > > > > > @@
> > > > > > > expression e1,e2,x,f;
> > > > > > > @@
> > > > > > >
> > > > > > > e1 =
> > > > > > > - kmap
> > > > > > > + kmap_local_page
> > > > > > >     (e2)
> > > > > > > ... when != x = e1 // not stored in any location and not passed
> > to
> > > > > > another function
> > > > > > >     when != f(...,e1,...)
> > > > > > >     when != x = e2
> > > > > > >     when != f(...,e2,...)
> > > > > > > -kunmap(e2)
> > > > > > > +kunmap_local(e1)
> > > > > > >
> > > > > > > julia
> > > > > > >
> > > > > >
> > > > > > I've never spent sufficient time to understand properly the syntax
> > and
> > > > > > semantics of expressions of Coccinelle. However, thanks Julia, this
> > > > code
> > > > > > looks good and can be very helpful.
> > > > > >
> > > > > > Only a minor objection... it doesn't tell when 'e2' has been
> > allocated
> > > > > > within the same function where the kmap() call is.
> > > > > >
> > > > > > In the particular case that I cite above, I'd prefer to remove the
> > > > > > allocation of the page (say with alloc_page()) and convert kmap() /
> > > > kunmap()
> > > > > > to use kmalloc() / kfree().
> > > > > >
> > > > > > Fox example, this is done in the following patch:
> > > > > >
> > > > > > commit 633b0616cfe0 ("x86/sgx: Remove unnecessary kmap() from
> > > > > > sgx_ioc_enclave_init()") from Ira Weiny.
> > > > > >
> > > > > > Can Coccinelle catch also those special cases where a page that is
> > > > passed
> > > > > > to kmap() is allocated within that same function (vs. being passed
> > as
> > > > > > argument to this function) and, if so, propose a replacement with
> > > > > > kmalloc()?
> > > > >
> > > > > It looks complex in this case, because the allocation is in another
> > > > > function, and it is passed to another function.
> > > >
> > > > This is not the special case I was talking about. In this case your
> > code
> > > > for Coccinelle tells the right proposal and it is exactly what Alaa did
> > in
> > > > her patch (which is good!).
> > > >
> > > > I'm talking about other special cases like the one I pointed to with
> > the
> > > > link I provided. I'm sorry if my bad English made you think that Alaa's
> > > > patch was one of those cases where the page is allocated within the
> > same
> > > > function where kmap() is.
> > > >
> > > > I hope that now I've been clearer :)
> > >
> > > Ah, sorry for the misunderstanding.  If you have an example, I can take a
> > > look and propose something for this special case.
> > >
> > > julia
> >
> > Yes, I have the example that you are asking for. It's that commit
> > 633b0616cfe0 from Ira Weiny.
> >
> > Let me copy and paste it here for your convenience...
> >
> > diff --git a/arch/x86/kernel/cpu/sgx/ioctl.c b/arch/x86/kernel/cpu/sgx/
> > ioctl.c
> > index 90a5caf76939..2e10367ea66c 100644
> > --- a/arch/x86/kernel/cpu/sgx/ioctl.c
> > +++ b/arch/x86/kernel/cpu/sgx/ioctl.c
> > @@ -604,7 +604,6 @@ static long sgx_ioc_enclave_init(struct sgx_encl *encl,
> > void __user *arg)
> >  {
> >         struct sgx_sigstruct *sigstruct;
> >         struct sgx_enclave_init init_arg;
> > -       struct page *initp_page;
> >         void *token;
> >         int ret;
> >
> > @@ -615,11 +614,15 @@ static long sgx_ioc_enclave_init(struct sgx_encl
> > *encl, void __user *arg)
> >         if (copy_from_user(&init_arg, arg, sizeof(init_arg)))
> >                 return -EFAULT;
> >
> > -       initp_page = alloc_page(GFP_KERNEL);
> > -       if (!initp_page)
> > +       /*
> > +        * 'sigstruct' must be on a page boundary and 'token' on a 512 byte
> > +        * boundary.  kmalloc() will give this alignment when allocating
> > +        * PAGE_SIZE bytes.
> > +        */
> > +       sigstruct = kmalloc(PAGE_SIZE, GFP_KERNEL);
> > +       if (!sigstruct)
> >                 return -ENOMEM;
> >
> > -       sigstruct = kmap(initp_page);
> >         token = (void *)((unsigned long)sigstruct + PAGE_SIZE / 2);
> >         memset(token, 0, SGX_LAUNCH_TOKEN_SIZE);
> >
> > @@ -645,8 +648,7 @@ static long sgx_ioc_enclave_init(struct sgx_encl *encl,
> > void __user *arg)
> >         ret = sgx_encl_init(encl, sigstruct, token);
> >
> >  out:
> > -       kunmap(initp_page);
> > -       __free_page(initp_page);
> > +       kfree(sigstruct);
> >         return ret;
> >  }
> >
> > I think that Coccinelle might understand that "initp_page" is allocated in
> > the same function where later it is kmap()'ed. But I'm not able to write a
> > Coccinelle check to find out these kinds of special cases. In these cases
> > the correct solution is not to use kmap_local_page(). Instead delete the
> > alloc_page() and use kmalloc().
> >
>
> Sorry about missing this thread last week...
>
> I've lost the Coccinelle scripts I wrote before but the ones which helped were
> documented in patches I submitted when Coccinelle was used.
>
> I think Coccinelle can help a lot.  And probably a lot more than I know since
> I'm not an expert in the language either.
>
> However, In addition to the example Fabio shows above here are a few other
> things to look out for when writing Coccinelle scripts.
>
> 1) The addition of mem*_page() functions means sometimes the entire kmap/kunmap
>    can be removed.  Check out the Coccinelle script for that.[1]
>
> 2) kunmap_local() has ordering rules which often requires some manual
>    review.[2]
>
> 3) kmap/kunmap is often wrapped in other subsystem helper functions.  I was not
>    sure how to deal with that in Coccinelle.  Julia is this easy in
>    Coccinelle?[3]


Thanks for the pointers.

[3] would depend on how much risk you are willing to take.  The arguments
are the same, except for the array index, for example.  But one may prefer
to be sure that nothing complex happens between the two calls.

julia

>
>
> Ira
>
>
> [1]
> https://lore.kernel.org/lkml/20210205232304.1670522-3-ira.weiny@intel.com/
> https://lore.kernel.org/lkml/20210205232304.1670522-5-ira.weiny@intel.com/
>
> [2]
> https://lore.kernel.org/lkml/20210217024826.3466046-3-ira.weiny@intel.com/
> https://lore.kernel.org/lkml/20210217024826.3466046-4-ira.weiny@intel.com/
>
> [3]
> https://lore.kernel.org/lkml/20210217024826.3466046-5-ira.weiny@intel.com/
>
> >
> > Thanks,
> >
> > Fabio
> >
> >
> >
>
>
--8323329-1172987651-1650900900=:2718--

