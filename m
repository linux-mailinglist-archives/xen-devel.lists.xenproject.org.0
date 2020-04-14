Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC81A7AA4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 14:24:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKbr-0003CK-FF; Tue, 14 Apr 2020 12:24:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7K6O=56=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jOKbp-0003CF-Tn
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 12:24:09 +0000
X-Inumbo-ID: d6f1ed3a-7e4a-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6f1ed3a-7e4a-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586867049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XTSdJFI+eaJ62TaZsEa9sU+zvHGmB2SFfWnbKvCYlR8=;
 b=M8F4YW5tUIq+/NVGwSnERGaYoA+LrN2obPcPJoFuaD9xt9mTywVQ7fO3
 x+5LHbvUlrq31do7quzt1Im27YdW1wTI5wc7n6D7U7+0K2LE4kVdtOB4l
 acBbRnTSRbncPTClBCCU816mo29y0j8TjYUACjdDlQa5fLBDqY67V68m3 w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2hh4Yd+2awe60eudvgslxs37/C+E9diAjiCZFZXGXIelNTHczOcvc+qKLggc0q7NXwNyEcwp3/
 LLx6H9q0AQ7Bw5mv9XijkzWurUT0oGfxkVk9emmoQvmucgHYYHuD++meWe7XzDy2BFyrrY7BXw
 UYcWflUtlgSq+MR5WFLxFSYcCSZowLkGqQlXi8R/bw+R0OoIVi1f91yb4H5qinda9yvqiJtl3R
 wQqmYyl1UIUdD2kktZU8+jrTVJ4VhNpoM4AWRrxQ5zEZPS/L0TLkIQYLWPk5M+hQNRXec/7mT4
 qxw=
X-SBRS: 2.7
X-MesageID: 15652204
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,382,1580792400"; d="scan'208";a="15652204"
Date: Tue, 14 Apr 2020 13:24:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 04/18] xen/build: include include/config/auto.conf
 in main Makefile
Message-ID: <20200414122403.GA4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-5-anthony.perard@citrix.com>
 <caf9aa56-1bc4-b24a-2a88-1c825ca8805e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <caf9aa56-1bc4-b24a-2a88-1c825ca8805e@suse.com>
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

On Wed, Apr 08, 2020 at 01:33:50PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:30, Anthony PERARD wrote:
> > --- a/xen/scripts/Kbuild.include
> > +++ b/xen/scripts/Kbuild.include
> > @@ -32,3 +32,8 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
> >  # Usage:
> >  # $(MAKE) $(clean) dir
> >  clean := -f $(BASEDIR)/scripts/Makefile.clean clean -C
> > +
> > +# Shorthand for kconfig
> > +# Usage:
> > +# $(MAKE) $(kconfig) target
> > +kconfig = -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)"
> 
> Is this going to be needed outside of xen/Makefile? If not, I'd
> like to ask that it be local to xen/Makefile. With the adjustment
> or with a reply clarifying to future plans
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'll move that to xen/Makefile.
Thanks,

-- 
Anthony PERARD

