Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F751D503F
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 16:20:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZbBz-00034M-KZ; Fri, 15 May 2020 14:20:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CqcK=65=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jZbBx-0002sR-T7
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 14:20:01 +0000
X-Inumbo-ID: 2956f118-96b7-11ea-b9cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2956f118-96b7-11ea-b9cf-bc764e2007e4;
 Fri, 15 May 2020 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589552400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XGeb1kddEGhTLReRlY0YSXI1kO0qFDqExmEgxUFSibw=;
 b=DD/7NzmdHkrjWxYYwRP6zQk6HlXy7n8SXm8W0ScigLeomDEtBUorlSB6
 sLzRMMBX8Xyvwe/lTxOW2Zv4deVnHQ7idrQWH3bfUzmXSDNlZnHdkIlx/
 cuzkz3s+dLChrVEsM1V93KAcjqynp/ZrOzYPktCAmQESlzvCkiVEs/PTh w=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: n8VlNHnaIBotNw/RGV1qIF5f7sliBuIx+HPVkAkNfXr29C7Aew35OeT4xh56DUIV9s+EbuTGud
 9XtMmG6wbZxfcpfjJRu1w4RIuUxiyI9ojlWD1TNRF4n1J7W7UDVnaek9b6gUhK6kCncwFR6gtA
 1pf9uq61vfOs+HFiXq1ei/y1MzYclbJN42SFA0RGlV2DykQ8aKhjbV46RMQZbAFQEl4jyN2Ffb
 uayjheupNXh60OAGl1TcMCFkvyC/Q//X3YObURaaWLt1bJ4HZSHM0CSm1BvkKom4Rh+DBdAWZB
 9FE=
X-SBRS: 2.7
X-MesageID: 18327950
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="18327950"
Date: Fri, 15 May 2020 15:19:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Subject: Re: [XEN PATCH 0/2] xen/build: fix kconfig errors during config merge
Message-ID: <20200515141957.GK2116@perard.uk.xensource.com>
References: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
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

On Tue, May 12, 2020 at 01:52:04PM -0400, Stewart Hildebrand wrote:
> This series fixes a couple of kconfig errors that I observed while
> invoking a build with a defconfig and config fragment.
> 
> I invoked the build as follows:
> 
> cat > xen/arch/arm/configs/custom.config <<EOF
> CONFIG_DEBUG=y
> CONFIG_SCHED_ARINC653=y
> CONFIG_EARLY_PRINTK_ZYNQMP=y
> EOF
> make -C xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig custom.config

Thanks for the patches.

FYI, `make defconfig custom.config` doesn't work as expected with the Xen
build system, it doesn't deal with this use case like Linux's one does.
There is no guaranty that "defconfig" will be made before "custom.config".
It would be better to run `make defconfig && make custom.config`, or
maybe use -j1, until this is properly handled. That's what is done by
kbuild.

Cheers,

-- 
Anthony PERARD

