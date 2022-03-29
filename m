Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D34EAB39
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 12:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295758.503415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ95K-00061H-AC; Tue, 29 Mar 2022 10:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295758.503415; Tue, 29 Mar 2022 10:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ95K-0005z5-6j; Tue, 29 Mar 2022 10:28:22 +0000
Received: by outflank-mailman (input) for mailman id 295758;
 Tue, 29 Mar 2022 10:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5tu=UI=citrix.com=prvs=0800c0c14=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nZ95I-0005yz-MN
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 10:28:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f26ec7d6-af4a-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 12:28:18 +0200 (CEST)
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
X-Inumbo-ID: f26ec7d6-af4a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648549698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SCyTW+zY0eX8uV2diNAysr1b/nswO8kPY7bPEqwG4K4=;
  b=MxyYp2mfEsltXAo2xWc9/3V1asBbXCHPAdN9wvxr8t2nAx3TYjPlpVZW
   KI0DzO7qdf07oRWGMY+0p3IJzf9oP671C0dJNPDKJTCc7GHqyHfVWXj19
   W3IKg3r6fcdMsl9YIAkxpbOqAUWAcQyJrXSahc0a6AieQhqPhFUqDYiMk
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66859741
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N4tfdKLdjPoQJrJLFE+R85UlxSXFcZb7ZxGr2PjKsXjdYENS0GEPy
 GAWUGuCbKzcYmX9fdB0OYvj9ksEsZKAydBmQAtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dQ52YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NxUtp+1Vxp3BZLBvckHU0NhDwQuL5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6iOO
 ptGNWMHgBLoRUZXJk4HB7EEp9ihiFncKx5Bjwqbuv9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqzgsffkCW9X5gdfJW66/prjVu71mEVThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9QGue9bKKsG2JBiUwAHUCPxYYaFsX2oy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGCH6bKMN8N4n9hIx5JFVdoKiN2ZDB01WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMooSOscrLlHconEGiausM4bFyhJEfUYXY
 8rzTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9y76Qp
 yrnCxYCoLc97FWeQTi3hrlYQOuHdf5CQbgTZETA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:hUoyl6PATKCs18BcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.90,220,1643691600"; 
   d="scan'208";a="66859741"
Date: Tue, 29 Mar 2022 11:28:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: generic top-level rule to build individual files
Message-ID: <YkLfPZCFIIqKypmI@perard.uk.xensource.com>
References: <49190e22-c802-3830-9d4c-8e6100132687@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <49190e22-c802-3830-9d4c-8e6100132687@suse.com>

On Mon, Mar 28, 2022 at 09:41:26AM +0200, Jan Beulich wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -75,6 +75,13 @@ ifeq (x86_64,$(XEN_TARGET_ARCH))
>  	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub-if-enabled
>  endif
>  
> +define do-subtree
> +$(1)/%: FORCE
> +	$$(MAKE) -C $(1) $$*
> +endef
> +
> +$(foreach m,$(wildcard */Makefile),$(eval $(call do-subtree,$(patsubst %/Makefile,%,$(m)))))

Any reason to not use $(SUBSYSTEMS) instead of $(wildcard ) ? Or maybe
you would rather been able to run `make xen/foo/bar.o` even after
running `./configure --disable-xen`.

> +
>  .PHONY: build-docs
>  build-docs:
>  	$(MAKE) -C docs build
> @@ -334,3 +341,6 @@ uninstall: uninstall-tools-public-header
>  .PHONY: xenversion
>  xenversion:
>  	@$(MAKE) --no-print-directory -C xen xenversion
> +
> +PHONY += FORCE

That's a Kbuild construct which will not work here. You need to write
".PHONY: FORCE" instead.

In Kbuild, there's a ".PHONY: $(PHONY)", and various macros needs to
know what's .PHONY.


With at least the .PHONY business taking care of: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

