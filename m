Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6444F1AC210
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 15:08:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP4FY-0007nz-5i; Thu, 16 Apr 2020 13:08:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IxKm=6A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jP4FW-0007nt-S3
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 13:08:10 +0000
X-Inumbo-ID: 51a6ee6a-7fe3-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51a6ee6a-7fe3-11ea-83d8-bc764e2007e4;
 Thu, 16 Apr 2020 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587042490;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2iMs7/0FW6j7l0gvgLW8KPNy22seGZpviEn+sFj8034=;
 b=FcHKc8lcGel4mjLY/JnAuzE2DsLRSHDmoDaWhYa7umgxeyO+dbj6zdcF
 Z9Rk5BpEoi3fp/y3Gpu5URbm71lW+k+tvI/6EmmMhKyt0vweAMy3ELRqS
 1qpgT1vQWzv2H2lPoWBZ4GnJWWx25E/HYBx7ruv9zCBkMK/+QX1D7/kNK A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VW022pDUzO1NHq++iN3SaZz2f6Ha7JAhJ7l0kPemwRdjL2jwd0rCbmathVSafIW9mxW7QGGcSI
 XkmTnmFdvnRlObf+3iFUvKpnqdu8rHICgdh8GSmysVSOAWcYMr6WEgmrw/SaPe4znP7ZSGcjXV
 rz/Y9KpBGFFP3XmiQ0YnZ57k+GZwDvMHdU0MJiYbltSqEMyDJwZm1ohw3DzyUm8BV1u4XUz9GU
 n+e+zN0lyIPzECpCaQtIgof1MKgKINnSmJbOOm8I7/qAm4+VMrd8thUAOIBpRvTXtDAZ+Ia02U
 suk=
X-SBRS: 2.7
X-MesageID: 16180504
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="16180504"
Date: Thu, 16 Apr 2020 14:07:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 17/18] build, include: rework compat-build-source.py
Message-ID: <20200416130748.GJ4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-18-anthony.perard@citrix.com>
 <57d9630d-d70e-bb20-1d8b-307d2bbc740f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <57d9630d-d70e-bb20-1d8b-307d2bbc740f@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 03:53:01PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:31, Anthony PERARD wrote:
> > Improvement are:
> > - give the path to xlat.lst as argument
> > - include `grep -v` in compat-build-source.py script, we don't need to
> >   write this in several scripted language.
> > - have 'xlat.lst' path as a variable.
> 
> The change looks okay, but I'm unsure whether it's really worthwhile.
> I specifically dislike the last point above, as it makes things less
> easy to read. I might be willing to ack a patch with this part taken
> out again; faod I'm not meaning to nak the patch in its current form,
> but I guess I'm also not going to ack it.

I'll remove the last point from this patch.

Thanks,

-- 
Anthony PERARD

