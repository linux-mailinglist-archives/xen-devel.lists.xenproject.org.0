Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507E11D5280
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 16:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZbgt-0006VI-6R; Fri, 15 May 2020 14:51:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CqcK=65=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jZbgr-0006VB-DT
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 14:51:57 +0000
X-Inumbo-ID: 9ef4a632-96bb-11ea-a581-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ef4a632-96bb-11ea-a581-12813bfff9fa;
 Fri, 15 May 2020 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589554316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tXozS/7HhGffTeLEnjbw45EYd6Z1LV9w9ZXlgf+C5lw=;
 b=Vx6ae0CKqh0F1L8iAzQABGTPGyq4oUreD9XBf64i21JRKu/Xlesl9FRT
 VfaYX1cX1D34YkbcmAZGRLqh1a1nzE6b7zWETVFE5ws+d+eyNcQPAkqhJ
 HI9nIeeNi/TeUuj4U2vwF8vP7I0sjR51Ds+UrF4Up+wlG/Lh6d5YUJG/a Y=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: bZ1NkMZLB4UHhB5ve1Ln8dfMSqKtKNoWZ4U5AoJCA5HOqjdqZYjKaBY+cEpMdCgj/sHfA2zTpS
 e2W82+/7vM7yQVvjgL/gJafeezdiWJmRvtp7cO1eEEUc3V/aDo7zXaGHvO3Ww1Noz+psNiMy4K
 bQ3A6BuWSW9m+FRIB4a9t8Gk5C3uN8b4vv3kDI6rwtXJAVmxtRdSglvQmJlWTPi4uGUjWnTWfk
 LNeUYn1QJqhVFtjg5DRO/d3ggjcuzH3Pemz3LXufyfZ9ilhMqV/1VCix8L3OIFauCNwTm4WW6R
 IKM=
X-SBRS: 2.7
X-MesageID: 17629650
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17629650"
Date: Fri, 15 May 2020 15:51:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Subject: Re: [XEN PATCH 2/2] xen/build: use the correct kconfig makefile
Message-ID: <20200515145150.GL2116@perard.uk.xensource.com>
References: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
 <20200512175206.20314-3-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200512175206.20314-3-stewart.hildebrand@dornerworks.com>
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

On Tue, May 12, 2020 at 01:52:06PM -0400, Stewart Hildebrand wrote:
> This resolves the following observed error:
> 
> #
> # merged configuration written to .config (needs make)
> #
> make -f /path/to/xen/xen/../xen/Makefile olddefconfig
> make[2]: Entering directory '/path/to/xen/xen'
> make[2]: *** No rule to make target 'olddefconfig'.  Stop.
> make[2]: Leaving directory '/path/to/xen/xen'
> tools/kconfig/Makefile:95: recipe for target 'custom.config' failed

That commit message is kind of misleading, as the command run which
lead to the error isn't written. Could you expand the commit message to
include the problematic command ran? Something like:
    Running `make custom.config` fails with:
    ...

> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> 
> ---
> It's possible there are other places where the Makefile path will need
> to be changed. This just happened to be the one that failed for me.

The two other locations that calls back on the main Makefile aren't
usable by Xen, they would lead to another error anyway. So fixing the
only %.config is good enough.

> ---
>  xen/tools/kconfig/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/tools/kconfig/Makefile b/xen/tools/kconfig/Makefile
> index fd37f4386a..f39521a0ed 100644
> --- a/xen/tools/kconfig/Makefile
> +++ b/xen/tools/kconfig/Makefile
> @@ -94,7 +94,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
>  %.config: $(obj)/conf
>  	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
>  	$(Q)$(CONFIG_SHELL) $(srctree)/tools/kconfig/merge_config.sh -m .config $(configfiles)
> -	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> +	$(Q)$(MAKE) -f $(srctree)/tools/kconfig/Makefile.kconfig olddefconfig

Well, the issue would be with $(srctree)/Makefile, but I don't think
that can be fixed right now. So that change is good for now.


With the commit message adjusted:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

