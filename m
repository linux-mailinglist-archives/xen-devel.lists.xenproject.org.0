Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AD91B4690
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 15:47:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRFiO-0005uN-Qi; Wed, 22 Apr 2020 13:47:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hTjb=6G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jRFiN-0005uH-86
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 13:46:59 +0000
X-Inumbo-ID: bbf57686-849f-11ea-b4f4-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbf57686-849f-11ea-b4f4-bc764e2007e4;
 Wed, 22 Apr 2020 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587563219;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Atqgb43qTn9s9DbagQG9mt1kaowUF5UzkDPgDS2NtcI=;
 b=A8NpDsqMLrteOoHnFSoyNGW0OOwrXeNe8ofDWGCQoPVm4cDTpiRcmYlV
 fj+uOa/DWKO/iIEsjlW0fMnhBuPHpNgPcmrFmpkbsYIgcA1XbIAnLt+BD
 zD/wXIzJsJilXxLZOnmLHCLUz8oGpOwwn61SRpd79NYqB6q7ogpXbb5jh I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QxiQWHokpSaaCiqOctnrTtRyjd76nCKl3Nvk5RiRQV5du1ZuNpjikMFtRF9gPkAZwq72DGF7CI
 Q54+5/5UWHy/2cEG4uNCMdZTpHbeGARW2BTEUG65v3PnRF1Tt9R7sy6+6uP8hgjll1H1QDHV2U
 Wzd0hEktwYY0gaqd5eygbWmdfQz7Lubann4/3WcsGpky9bPuw7y4uQvVWHGJkCydSu5j3vXb4w
 J0E6lvIWod1W84B/age4dedE4jj5ddbAchUKIrXJjDk6Tm9w1IU7g8qJMqAZAY9I958BUe6HXV
 JIY=
X-SBRS: 2.7
X-MesageID: 16316202
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,414,1580792400"; d="scan'208";a="16316202"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24224.19143.658445.359032@mariner.uk.xensource.com>
Date: Wed, 22 Apr 2020 14:46:47 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] Introduce a description of the Backport and Fixes tags
In-Reply-To: <20200422131736.GD28601@Air-de-Roger>
References: <20200421182946.27337-1-sstabellini@kernel.org>
 <24223.16427.427446.817623@mariner.uk.xensource.com>
 <20200422131736.GD28601@Air-de-Roger>
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("Re: [PATCH] Introduce a description of the Backport and Fixes tags"):
> On Tue, Apr 21, 2020 at 07:49:15PM +0100, Ian Jackson wrote:
> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > 
> > > +When possible, please use the Fixes tag instead (or in addition).
> > 
> > Do we have any code to turn Fixes: into a list of commits to
> > backport to a particular stable branch ?
> 
> I think we should have one of those, I've attempted something like:

Cool :-).

> > If not it might be easier to ask people to add both Backport: and
> > Fixes:.
> 
> I would like to avoid that, a Fixes tag should be enough for us to
> figure out where the patch should be applied.

OK.  Let us start using these tags as defined in Stefano's patch and
we can debug the script when we have some test data :-).

> #!/bin/sh -e

I tried to avoid reading your script but I couldn't help glancing at
the first line and

  #!/bin/sh
  set -e

is better because then

  bash -x script

isn't a bomb.

> The script could also likely be cleaned up and improved, it's quite
> ugly...

We can put it in-tree and then people can send patches...

Ian.

