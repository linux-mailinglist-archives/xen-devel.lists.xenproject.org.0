Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEE31BC50C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 18:22:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSzh-0003Qj-RB; Tue, 28 Apr 2020 16:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0bN=6M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jTSzg-0003QD-5o
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 16:22:00 +0000
X-Inumbo-ID: 622fa5c8-896c-11ea-9887-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 622fa5c8-896c-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588090919;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YEIR6lkiB/vvWUrTM9RuT9UpmhODMwm7qcp3z1l7Syg=;
 b=hf87GNqTcslMklKW547o2sY8noFIlPYHGMqPncqxaR9G6XZZT9FEZHYr
 zoEu+/zNN1RMMywmYn7UriK5+/JjWkByn/dNL5f/cLFlpcRlOD90pAvJH
 neddLK7Whxx/lblGEIiwbXriOsn/5Gohji1uLT7KAwZMf0AH6KXzJ+cuQ I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bwZcZLAWlNU4h0n7xoZC2L0JEoUdNnKIQDhL+bt+JH63mXf6EQZ3oCGzI1jYRm9Fgpp6ZtGRMb
 eaCf80bHkgFYU1zfJhwrPdrA0/j/CzKjucwaDxG8khv9hENPBwtal69vZ9ai+3KNQSffZlKv/1
 Lky6HJd30dwLknxI9o+XqKaRECxVsZEXjrw1qGT4IcO6DfYCmJFaHhecpWHVTFHV6CE81kwx/b
 UvP1fC0GsG4nF7iutPv4PQLHRgfZ2lpkgtll6KsZgwRHLwKQitmIzlAfhdo7LQRRRX5DcVhFgP
 YU4=
X-SBRS: 2.7
X-MesageID: 16637665
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,328,1583211600"; d="scan'208";a="16637665"
Date: Tue, 28 Apr 2020 18:21:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Subject: Re: Xen network domain performance for 10Gb NIC
Message-ID: <20200428162152.GV28601@Air-de-Roger>
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
 <1359850718.562651.1587928713792@mail.yahoo.com>
 <20200427070317.GL28601@Air-de-Roger>
 <1693679742.27711.1588051435928@mail.yahoo.com>
 <20200428070724.GS28601@Air-de-Roger>
 <986397088.1609373.1588090088941@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <986397088.1609373.1588090088941@mail.yahoo.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 04:08:08PM +0000, tosher 1 wrote:
> > Do you get the expected performance from the driver domain when not
> > using it as a backend? Ie: running the iperf benchmarks directly on
> > the driver domain and not on the guest.
> 
> 
> Yes, the bandwidth between the driver domain and the client machine is close to 10Gbits/sec.

Also note that doing grant map / unmap operations from HVM domains is
much more expensive than doing them from PV domains, even without an
IOMMU. Xen needs to modify the domain p2m and issue a flush, and then
the guest (usually) needs to map the newly populated memory in it's
page tables in order to access it.

This and the addition of the IOMMU TLB flush could well explain why
you are seeing such a degraded performance. I'm afraid the only way to
figure out exactly what is causing the bottleneck will be to time the
different operations in Xen. You can compare against a PV dom0 in
order to get an idea.

Roger.

