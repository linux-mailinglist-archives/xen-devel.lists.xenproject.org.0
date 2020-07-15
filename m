Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0559221313
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 19:00:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvklO-0007Id-N2; Wed, 15 Jul 2020 17:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pvp=A2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jvklN-0007IY-4g
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:00:09 +0000
X-Inumbo-ID: a2bddc4e-c6bc-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2bddc4e-c6bc-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594832409;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zkz+mz662VvK3ybS1BY7w6MMW+kanXb3XebXrtv5YAQ=;
 b=aHv4UZE+zql1drRZKp2Hko11+t91Eey/M1s/L97ISs5gl1fkA2eVx/kn
 wiU/+Oh5KJpqHvM7qsivpz+/eZgUTTJcGp7a56hZ4eaAdAVTxTCqLFfFw
 6BeQaVpm+SJhFK5/h9PWxshN8X56VC/X7bYnRzSteCANZyZVnsJqqYyEI 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: z2poUUt8oWRQ/JwDI0gFZuklBUQ7DxRSVUsV9KYfu9wO2q0nOVRzU9B8L07TfK1h1YRGb7kFtg
 p2al74z8XInMoI1lx7jjGGBCawW+ToHeSZ1OpTzc5GOnFs0x/24VoVfjcYHwPUzAU81qdJ3Mgw
 nVZJTov4FabtcIWiqweNS8BPXBZ4fq84f2e0RyV08TTJJH4oNk1xAz42qP8liyK+jhNAhxeuR4
 16kk+5zn6+BlngL7mUAyvA5EZpDKOPtbY2z/YX07RqL/PjmwHXba0wk6BhLza5I4F2aXFlsNZp
 hbo=
X-SBRS: 2.7
X-MesageID: 22775239
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22775239"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24335.13844.281994.447792@mariner.uk.xensource.com>
Date: Wed, 15 Jul 2020 18:00:04 +0100
To: "incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com"
 <incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/12] tools/misc: don't use libxenctrl internals from misc
 tools
In-Reply-To: <20200715162511.5941-8-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-8-ian.jackson@eu.citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("[PATCH 06/12] tools/misc: don't use libxenctrl internals from misc tools"):
> From: Juergen Gross <jgross@suse.com>
> 
> xen-hptool and xen-mfndump are using internals from libxenctrl e.g. by
> including private headers. Fix that by using either the correct
> official headers or use other means.
...
> -        ERROR("Failed to get the maximum mfn");
> +        fprintf(stderr, "Failed to get the maximum mfn");
>          return -1;

I think this is definitely worse than providing a duplicate definition of
ERROR.

Also patches like this are much easier to read if the different kinds
of change are split up.  Do you think you can break it up further ?

Thanks,
Ian.

