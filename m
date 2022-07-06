Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01519568C7A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362317.592308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o96mr-0004lO-H2; Wed, 06 Jul 2022 15:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362317.592308; Wed, 06 Jul 2022 15:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o96mr-0004hz-DL; Wed, 06 Jul 2022 15:17:57 +0000
Received: by outflank-mailman (input) for mailman id 362317;
 Wed, 06 Jul 2022 15:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lo2B=XL=citrix.com=prvs=179813542=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o96mq-0004ht-3E
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:17:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdec6f4c-fd3e-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 17:17:54 +0200 (CEST)
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
X-Inumbo-ID: cdec6f4c-fd3e-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657120674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h8ds19eScE8j3L+YzqslAKx1TfX5HX9CLCVB/Da1hOY=;
  b=MHQMvOucpvNPns3N0/grzOpfJzFXHlSGzNlHN7j63QNciCkEU3tmboap
   IskdRoQW0w3UtFZCT5YGvbO3mwUgErPFEEVAOaKQLVaOg3TSVwIXXzo0E
   5lR0+svOwNwdl1yRPHmwLOBqGAfJrVV1IV3i06TozvGCnlHDU+rnwV/95
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75228734
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aoZqA6ua8+bNB2hQLLUxVWqbPOfnVC5eMUV32f8akzHdYApBsoF/q
 tZmKWnTa/eMZWH1f9wjbIrg/EJS7Z7RydJmT1Y9rXoxHi4b+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW1zV5
 4uoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi80MJWXur0TVyMATQFYZqRgp6fLcVyW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWUyNk6QPEYTUrsRIIgcvsqh1l+8SB13mWm8pIhp0WXp0AMkhdABN/KKI4fXFK25hH2wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTR4Y6BLC+sPlwjzW7xHEXCRAQfUu2p7++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhS68AXM3dGEGX3dabS1e6v+8uI1jqjuaG76PD5WJYs3J9SDYm
 m7X83Fm3+VO16bnxI3gowmZ3mvESozhC1dsu16JBj/NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N702wcH82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYib1NfMpOdjqUpp6pUQFKTgCfqmNBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZznEgWnDqLLbiilkjP+efPPxa9FOZaWGZim8hktctoVi2Oq
 4YBXyZLoj0CONDDjt7/rddMcwtbcCNkVPgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:jWhyJq5YyJfCPGOhWQPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.92,250,1650945600"; 
   d="scan'208";a="75228734"
Date: Wed, 6 Jul 2022 16:17:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
Message-ID: <YsWnnMZYwB7UGuv6@perard.uk.xensource.com>
References: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>

On Thu, Jun 09, 2022 at 05:52:45PM +0200, Jan Beulich wrote:
> With debug info retained, xen.efi can be quite large. Unlike for xen.gz
> there's no intermediate step (mkelf32 there) involved which would strip
> debug info kind of as a side effect. While the installing of xen.efi on
> the EFI partition is an optional step (intended to be a courtesy to the
> developer), adjust it also for the purpose of documenting what distros
> would be expected to do during boot loader configuration (which is what
> would normally put xen.efi into the EFI partition).
> 
> Model the control over stripping after Linux'es module installation,
> except that the stripped executable is constructed in the build area
> instead of in the destination location. This is to conserve on space
> used there - EFI partitions tend to be only a few hundred Mb in size.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> GNU strip 2.38 appears to have issues when acting on a PE binary:
> - file name symbols are also stripped; while there is a separate
>   --keep-file-symbols option (which I would have thought to be on by
>   default anyway), its use so far makes no difference,
> - the string table grows in size, when one would expect it to retain its
>   size (or shrink),
> - linker version is changed in and timestamp zapped from the header.
> Older GNU strip (observed with 2.35.1) doesn't work at all ("Data
> Directory size (1c) exceeds space left in section (8)").
> 
> Future GNU strip is going to honor --keep-file-symbols (and will also
> have the other issues fixed). Question is whether we should use that
> option (for the symbol table as a whole to make sense), or whether
> instead we should (by default) strip the symbol table as well.

I guess trying to keep those symbol might be useful, if it's not too
big, to help debugging system in production.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -465,6 +465,22 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  
> +# Strip
> +#
> +# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
> +# is installed. If INSTALL_EFI_STRIP is '1', then the default option
> +# --strip-debug will be used. Otherwise, INSTALL_EFI_STRIP value will be used
> +# as the option(s) to the strip command.

It would be useful to also document INSTALL_EFI_STRIP in ./INSTALL or in
./docs/misc/efi.pandoc (efi.pandoc is where EFI_VENDOR is documented for
example, so probably a better place for the doc of the new option).

> +ifdef INSTALL_EFI_STRIP
> +
> +ifeq ($(INSTALL_EFI_STRIP),1)
> +efi-strip-opt := --strip-debug
> +else
> +efi-strip-opt := $(INSTALL_EFI_STRIP)
> +endif
> +
> +endif
> +
>  .PHONY: _install
>  _install: D=$(DESTDIR)
>  _install: T=$(notdir $(TARGET))
> @@ -489,6 +505,9 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>  		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> +			$(if $(efi-strip-opt), \
> +			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
> +			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \

This optional part of the script that ends with "||" means that if
`strip` or `install` fails, we would install the non stripped binary. Is
this something that's acceptable? (Plus of doing that is avoiding
changing the next line, and avoiding a longer $(if ,).

>  			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>  		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
>  			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \

An other thing, the "*.efi.stripped" file is I think going to be left
over and not removed during `make clean`.

Cheers,

-- 
Anthony PERARD

