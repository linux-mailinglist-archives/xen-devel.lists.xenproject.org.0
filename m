Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114F1B59C5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:58:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZYJ-0004hj-S8; Thu, 23 Apr 2020 10:57:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oa1P=6H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRZYI-0004he-H4
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:57:54 +0000
X-Inumbo-ID: 47cbd554-8551-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47cbd554-8551-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587639473;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2dV6oCmTP1BPgAeCpT8Uwm/lIwISJyokbfndx7DIjWE=;
 b=eErJUeyZnBBi1UZ5UaIvYV9nCaDVpAgmxWmbmNlf5gCmcgdBlkCr57SI
 FEzWrok/wNIdKdl9dh8+ZPKoDn5dbw9c03rz6sIcEFlYufm1pd6JdBxbs
 M8kzPUtyNLmqcEoBUQ4XmgMjHEugSKr8TSkOI2rbRbickyxgZBEnvJX/q Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5UOOmCQV4vYuRjbI42h9g2PDLZyEvMlvKeaQpqJCzgvf+oEScb5PSfpYG+c0AIpszCRIR/D/9t
 zov/n5UMH5mQkfSCjTSKr+ADIUBgz2APt1n057+porY1qjtsL+L0QgWKuQkXQ6Uab/O1T710na
 1XLzzGj46gApX5fC+Og9Cf/oEt9w44jEErWp8LohPcCqBywqoQ6zAR6pmmYZdWfapwrGq4Vn1Z
 Fmd56CYHknf65zmxPi24j2BACwz/srP4PskAlNdl6yJQwiqgzkWAsJObjomIn0c+RwCUGqlr07
 Oxk=
X-SBRS: 2.7
X-MesageID: 16521631
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16521631"
Date: Thu, 23 Apr 2020 12:57:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200423105744.GG28601@Air-de-Roger>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
 <20200422163338.GF28601@Air-de-Roger>
 <20200423103019.a43rnmub5jdszjhc@debian>
 <0a03deaa-5842-626a-b173-b9569f69f86c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a03deaa-5842-626a-b173-b9569f69f86c@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Tim
 Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 12:41:49PM +0200, Jan Beulich wrote:
> On 23.04.2020 12:30, Wei Liu wrote:
> > On Wed, Apr 22, 2020 at 06:33:38PM +0200, Roger Pau Monné wrote:
> >> On Thu, Apr 16, 2020 at 03:59:07PM +0200, Roger Pau Monne wrote:
> >>> @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
> >>>  
> >>>      return flags;
> >>>  }
> >>> +
> >>> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
> >>> +{
> >>> +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
> >>> +                                                                   : 0) |
> >>> +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> >>> +                                                          : 0);
> >>
> >> Maybe I'm getting confused, but I think the above is wrong and ASID
> >> should _always_ be flushed when running a HVM domain in shadow mode
> >> regardless of whether the underlying hw is Intel or AMD, ie:
> >>
> >> bool shadow = paging_mode_shadow(d);
> >> unsigned int flags = (shadow ? FLUSH_TLB : 0) |
> >>                      (is_hvm_domain(d) &&
> >>                       (cpu_has_svm || shadow) ? FLUSH_HVM_ASID_CORE : 0);
> > 
> > This sort of long expression is prone to error. See XSA-316.
> 
> To be honest I consider it quite fine. XSA-316 was in particular
> because of successive closing parentheses, of which there are
> none here. (This isn't to say I would strictly mind splitting,
> but I fear this would result in (multiple?) single use local
> variables.)

Right now it's exactly (including the indentation):

    bool shadow = paging_mode_shadow(d);

    return (shadow ? FLUSH_TLB : 0) |
           (is_hvm_domain(d) && (cpu_has_svm || shadow) ? FLUSH_HVM_ASID_CORE
                                                        : 0);

I could change it to:

    bool shadow = paging_mode_shadow(d);
    bool asid = is_hvm_domain(d) && (cpu_has_svm || shadow);

    return (shadow ? FLUSH_TLB : 0) | (asid ? FLUSH_HVM_ASID_CORE : 0);

But would result in a single use asid local variable.

I think XSA-316 was slightly different because the issue arose from
assigning and comparing a variable inside of an if condition, which is
not the case here. I however don't mind changing it if it's regarded
as potentially insecure, or hard to read.

Thanks, Roger.

