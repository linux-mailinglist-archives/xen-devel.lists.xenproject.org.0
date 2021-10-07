Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C60424B1B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 02:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203231.358310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYHEo-0006c1-Kp; Thu, 07 Oct 2021 00:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203231.358310; Thu, 07 Oct 2021 00:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYHEo-0006Yy-HJ; Thu, 07 Oct 2021 00:26:18 +0000
Received: by outflank-mailman (input) for mailman id 203231;
 Thu, 07 Oct 2021 00:26:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYHEm-0006Ys-Q6
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 00:26:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7ac35cd-a01a-4944-bae6-e0a9b92699ea;
 Thu, 07 Oct 2021 00:26:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA24061177;
 Thu,  7 Oct 2021 00:26:13 +0000 (UTC)
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
X-Inumbo-ID: d7ac35cd-a01a-4944-bae6-e0a9b92699ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633566374;
	bh=ug17NFCBcwJJwFzw1jUciyoluhIvLcYdMz4E9Tg5xug=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bTSDPLNrz1yw748Mmabrm7zki5q7aeOn4gWmUBYR4QymwP91fzDh3EFfiSQ52fh0P
	 LhGs6lBg+5drexuaB3GlZmk4gffsveuWdj+aiiFy8pGipBPixb/sn2CujMXFhUx+9Q
	 ju0+EuPyFI7FBli093/EPpSqq8ce2zG+oUw+iQ0tYFq71bi4Kt3vmgyRi6OxA3XX1E
	 /sZvGh2D6BRn0raN4TAnK6ZxgPZvU4fK9sKpablnAmNKWiyEiw8rtviZ3v6Yb4+Sl5
	 RbnjyEQtthohL5bG6GDVh41Rgr661YtP7x+vtzpmdZtSjcxb8gA0wX0ShH27NvGu8R
	 2bCm7B/4ol+Gw==
Date: Wed, 6 Oct 2021 17:26:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>, iwj@xenproject.org
cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, Andre.Przywara@arm.com, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
Message-ID: <alpine.DEB.2.21.2110061708500.3209@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com> <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Julien Grall wrote:
> Hi Rahul,
> 
> On 06/10/2021 19:40, Rahul Singh wrote:
> > diff --git a/tools/libs/light/libxl_types.idl
> > b/tools/libs/light/libxl_types.idl
> > index 3f9fff653a..78b1ddf0b8 100644
> > --- a/tools/libs/light/libxl_types.idl
> > +++ b/tools/libs/light/libxl_types.idl
> > @@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
> >         ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
> >                                  ("vuart", libxl_vuart_type),
> > +                               ("vpci", libxl_defbool),
> 
> I have posted some comments regarding the field in v4. To summarize, AFAICT,
> this option is meant to be only set by libxl but you still let the toolstack
> (e.g. xl, libvirt) to set it.
> 
> If you still want to expose to the toolstack, then I think the option should
> be outside of arch_arm. Otherwise, this should be moved in an internal
> structure (Ian, do you have any suggestion?).


First let me premise that the patch is much better already and Rahul
addessed my request well. However, Julien's point about not wanting to
make a potentially breaking ABI change in libxl is a good one. FYI we
had a few libvirt breakages due to this kind of changes in the past and
I would certainly be happier if we didn't cause another one. And in
general, it is better to avoid changes to the libxl ABI if we can.

I think in this case we can: I looked at the patch and
b_info.arch_arm.vpci is only used within tools/libs/light/libxl_arm.c.
Also, we don't need b_info.arch_arm.vpci if we can access
d_config->num_pcidevs given that the check is just based on
d_config->num_pcidevs.

So the only issue is how to check on d_config->num_pcidevs in
libxl__prepare_dtb. libxl__prepare_dtb takes libxl_domain_build_info as
parameter but with container_of we can retrieve libxl_domain_config and
from there check on num_pcidevs.

Something like the appended (untested). It doesn't need any libxl struct
changes but it requires the introduction of container_of (which is a
simple macro). Alternatively, it would be just as simple to change
libxl__arch_domain_init_hw_description and libxl__prepare_dtb to take a
libxl_domain_config *d_config parameter instead of a
libxl_domain_build_info *info parameter.

Ian, any thoughts?


diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 2be208b99b..ee1176519c 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -102,10 +102,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     }
 
     /* Enable VPCI support. */
-    if (d_config->num_pcidevs) {
+    if (d_config->num_pcidevs)
         config->flags |= XEN_DOMCTL_CDF_vpci;
-        libxl_defbool_set(&d_config->b_info.arch_arm.vpci, true);
-    }
 
     return 0;
 }
@@ -976,6 +974,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_build_info *info,
 
     const libxl_version_info *vers;
     const struct arch_info *ainfo;
+    libxl_domain_config *d_config = container_of(info, libxl_domain_config, b_info);
 
     vers = libxl_get_version_info(CTX);
     if (vers == NULL) return ERROR_FAIL;
@@ -1076,7 +1075,7 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
-        if (libxl_defbool_val(info->arch_arm.vpci))
+        if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
         if (pfdt)

