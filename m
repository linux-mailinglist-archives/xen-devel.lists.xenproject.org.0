Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B81A361A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:41:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYMn-0006Bz-Iy; Thu, 09 Apr 2020 14:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Z0E=5Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jMYMl-0006Bu-UR
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:41:15 +0000
X-Inumbo-ID: 29b711c8-7a70-11ea-83d8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29b711c8-7a70-11ea-83d8-bc764e2007e4;
 Thu, 09 Apr 2020 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586443275;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=U9nhpmPZ6JuRsqnojv644Dh58/++8b9NG2ayup812Cg=;
 b=ArSJobM7rd7jcny7SKly3yJTkKfY8LzdKQy5KeWEQtCRwVJrOn7Z/onv
 3afAe6wJ7FmHDEXo4oLaNTuxsbEXQYKM3ZSjyU6WdGFWPiAN9gLCve8QS
 9VxYKTr81wJk8YbPJl4u9sxq9WKdOVBShL9ljZCbtpvZav/T3RB/7CnLd 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7C5UzvExn1WPg9tyiDIg9gio6aXGgph42YHQ1TL3eB/Jc7XRRR3Ax+BwuUu5zu6dP8eu0/hnKg
 8Xe6DLz8mzmoqoN6PhM/oO5lYq2521h4tlYiVdscWZxJA4cxhe7teUStV4WYFU6xjaimV219Se
 M85fFEPMcT519YOIR0k5OQ0yvDANJRNd6I+OWpoQ9x/EVJsdDNsGP/kB99IGsC5Kpx67riq/+l
 2/lRRxs/iJaQQyqvh8+gFPIYMkwyomkArHFESG/VCDMeb+lMFi45R8oqtiGz94wuHSnQqf5lPz
 8OQ=
X-SBRS: 2.7
X-MesageID: 15455393
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,363,1580792400"; d="scan'208";a="15455393"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24207.13317.34414.413073@mariner.uk.xensource.com>
Date: Thu, 9 Apr 2020 15:41:09 +0100
To: Wei Liu <wl@xen.org>, "Panyakin, Andrew" <apanyaki@amazon.com>
Subject: Re: [XEN PATCH] libxc/migration: Abort migration on precopy policy
 request [and 1 more messages]
In-Reply-To: <9930fbd5-10f7-5f92-348b-8856ecad3768@amazon.com>,
 <20200409143233.qarpf2vgynqqgrht@debian>
References: <eb85d7fee920b54eea3b4c0e77ab40593613ccc4.1586270820.git.apanyaki@amazon.com>
 <20200407202244.a6isag63njejbshe@debian>
 <9930fbd5-10f7-5f92-348b-8856ecad3768@amazon.com>
 <20200409143233.qarpf2vgynqqgrht@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Panyakin, Andrew writes ("Re: [XEN PATCH] libxc/migration: Abort migration on precopy policy request"):
> On 4/7/20 10:22 PM, Wei Liu wrote:
> > There is no need to have "goto out" here.
> 
> I was considering two more examples of "goto out" in a branch right before the label:
> - send_domain_memory_nonlive,
> - send_domain_memory_live.
> 
> Isn't it done this way to simplify the function extension: you won't need to add "goto out" to previous branch when adding new code?

Quite so.

Wei Liu writes ("Re: [XEN PATCH] libxc/migration: Abort migration on precopy policy request"):
> I'm not too fussed about this. Let's keep goto out.

Good :-).

> Acked-by: Wei Liu <wl@xen.org>
> 
> I will apply this patch shortly.

Thanks,
Ian.

