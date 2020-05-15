Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DA1D5022
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 16:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZb5e-0002RQ-GX; Fri, 15 May 2020 14:13:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CqcK=65=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jZb5c-0002RL-Dz
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 14:13:28 +0000
X-Inumbo-ID: 3ecda0c4-96b6-11ea-a570-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ecda0c4-96b6-11ea-a570-12813bfff9fa;
 Fri, 15 May 2020 14:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589552007;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cC1STYRLTf6YUZdMJFzv2MxI8WzpEFWRewwQ81O2R2g=;
 b=CJ/RTGh5szvJwNw/9rC4Mx6/Csl5t4VxFmteIHJoV9R2nzwJPNzcOaHo
 h4RNXRBWnm36jTKJWkGrc0sSWGQ5tgOlDqOcph7AE+eCKes3O/NaieZfK
 SUK2Ce2zrTC3WL82YPrIEqijRW882bkoQQ0IEtC8vjmkm8qVhY37tkJ9k A=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: qk1LzcWYbAtizaKmEL0G23TGS0brcBnTveqpZcsf3P6RTWTF2keiUFQXbg2RNKW5w+Q/2MnY13
 vD91ewXcMzSOSgDe4ZnovpZW6dSDX4FTf+K4zDPBbpHUAVgNRJCL8p2iudyfXcO0aivCsGT+Ov
 baiLzE7k2V8lFX3wVNtTYRmteZAyO9SJatA9xpWaYpvImv6mefl50XoWQX4ariCkU8lFEFOQsn
 OwYXtlVjYUcTWC1B9PSMdniV/eElOEyo5mCWdJh7fqjoy/jZSiWzIYfRs15Vt4NNYj2gdV52Br
 8VI=
X-SBRS: 2.7
X-MesageID: 17902781
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17902781"
Date: Fri, 15 May 2020 15:13:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Subject: Re: [XEN PATCH 1/2] xen/build: fixup path to merge_config.sh
Message-ID: <20200515141305.GJ2116@perard.uk.xensource.com>
References: <20200512175206.20314-1-stewart.hildebrand@dornerworks.com>
 <20200512175206.20314-2-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200512175206.20314-2-stewart.hildebrand@dornerworks.com>
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

On Tue, May 12, 2020 at 01:52:05PM -0400, Stewart Hildebrand wrote:
> This resolves the following observed error:
> 
> /bin/sh: /path/to/xen/xen/../xen/scripts/kconfig/merge_config.sh: No such file or directory
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

