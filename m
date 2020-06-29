Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE220D02E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 18:31:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpwg1-0006kx-2w; Mon, 29 Jun 2020 16:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDMo=AK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jpwfz-0006ks-Ay
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 16:30:35 +0000
X-Inumbo-ID: dac22ff8-ba25-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dac22ff8-ba25-11ea-8496-bc764e2007e4;
 Mon, 29 Jun 2020 16:30:34 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +ca87G5nQzXjBgntDua5wuz/qXSNgB2xWerTUwT5wd9htlNDZKzCaCpXkpW+nwvfdt8z2ZXe6W
 8obzO21ykElma7LwgMf8A8BGT1aS/8yARGIgQL+PlQnh424gQKS2AhC96reOZkr0SLbgoOVtM4
 j2UCIEmaHCmu1iJE3dwdpYoiys9TuPZgaHW0pv3Yt/NNXVN7cZTJNdoAO428R7WDS7rmH/N5tW
 efYn23cwUb3HuW/I1uytI+/KCa6WgbC17YnEmUGFrvQ4RX4ziMhHeqXPDbBD9NyzT4ehu6r4Qm
 Coo=
X-SBRS: 2.7
X-MesageID: 21504044
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,295,1589256000"; d="scan'208";a="21504044"
Date: Mon, 29 Jun 2020 17:30:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] build: tweak variable exporting for make 3.82
Message-ID: <20200629163027.GA2030@perard.uk.xensource.com>
References: <0677fe2a-9ea1-7b3c-e212-4a2478537459@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0677fe2a-9ea1-7b3c-e212-4a2478537459@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 05:02:30PM +0200, Jan Beulich wrote:
> While I've been running into an issue here only because of an additional
> local change I'm carrying, to be able to override just the compiler in
> $(XEN_ROOT)/.config (rather than the whole tool chain), in
> config/StdGNU.mk:
> 
> ifeq ($(filter-out default undefined,$(origin CC)),)
> 
> I'd like to propose to nevertheless correct the underlying issue:
> Exporting an unset variable changes its origin from "undefined" to
> "file". This comes into effect because of our adding of -rR to
> MAKEFLAGS, which make 3.82 wrongly applies also upon re-invoking itself
> after having updated auto.conf{,.cmd}.
> 
> Move the export statement past $(XEN_ROOT)/config/$(XEN_OS).mk inclusion
> such that the variables already have their designated values at that
> point, while retaining their initial origin up to the point they get
> defined.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -17,8 +17,6 @@ export XEN_BUILD_HOST	?= $(shell hostnam
>  PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
>  export PYTHON		?= $(PYTHON_INTERPRETER)
>  
> -export CC CXX LD
> -
>  export BASEDIR := $(CURDIR)
>  export XEN_ROOT := $(BASEDIR)/..
>  
> @@ -42,6 +40,8 @@ export TARGET_ARCH     := $(shell echo $
>  # Allow someone to change their config file
>  export KCONFIG_CONFIG ?= .config
>  
> +export CC CXX LD
> +
>  .PHONY: default
>  default: build

That patch is fine and it is probably better to export a variable that
has a value rather than before the variable is set.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

