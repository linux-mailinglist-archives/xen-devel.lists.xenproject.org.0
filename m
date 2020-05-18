Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C121D744D
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 11:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jacK0-0004L0-Av; Mon, 18 May 2020 09:44:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjRX=7A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jacJy-0004Kv-QT
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 09:44:30 +0000
X-Inumbo-ID: 2b4065cc-98ec-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b4065cc-98ec-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 09:44:29 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lXYajm9kXJcAINKOW5xAwAaU9x4ej7e+NuolY1beqoZYRnqe/mZXg7dE1Im2MNKdAK7AfxZZhU
 jQojjL5CSOFyn54+uVJaac72yXvHcPqt/VK4TZyB+TWl88v5UA15cFG2jUveR8EYkMnl0i6qYo
 ZxAXte3B1nTgmb8A4ZU4iTxU8FIEOrKpz84l2obmRuODKSj/CsW/MHdbTAFQ1/bxJIfHtvKMW9
 +HlusUmOmy+8mS5poPzQ6pCkGTpc8K8zAb8pj5PQOD22zBPH3HshlIACVmFl7+PvzTHnPyYPTF
 cik=
X-SBRS: 2.7
X-MesageID: 18463980
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,406,1583211600"; d="scan'208";a="18463980"
Date: Mon, 18 May 2020 10:44:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Subject: Re: [XEN PATCH v2] xen/build: use the correct kconfig makefile
Message-ID: <20200518094426.GN2116@perard.uk.xensource.com>
References: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
 <20200515182509.5476-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200515182509.5476-1-stewart.hildebrand@dornerworks.com>
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 15, 2020 at 02:25:09PM -0400, Stewart Hildebrand wrote:
> This resolves the following observed error during config merge:
> 
> /bin/sh /path/to/xen/xen/../xen/tools/kconfig/merge_config.sh -m .config /path/to/xen/xen/../xen/arch/arm/configs/custom.config
> Using .config as base
> Merging /path/to/xen/xen/../xen/arch/arm/configs/custom.config
> #
> # merged configuration written to .config (needs make)
> #
> make -f /path/to/xen/xen/../xen/Makefile olddefconfig
> make[2]: Entering directory '/path/to/xen/xen'
> make[2]: *** No rule to make target 'olddefconfig'.  Stop.
> make[2]: Leaving directory '/path/to/xen/xen'
> tools/kconfig/Makefile:95: recipe for target 'custom.config' failed
> 
> The build was invoked by first doing a defconfig (which succeeded):
> 
> $ make -C xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
> 
> Followed by the config fragment merge command (which failed before this patch)
> 
> $ cat > xen/arch/arm/configs/custom.config <<EOF
> CONFIG_DEBUG=y
> CONFIG_EARLY_PRINTK_ZYNQMP=y
> EOF
> $ make -C xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- custom.config
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> 
> ---
> v2: updated commit message

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

