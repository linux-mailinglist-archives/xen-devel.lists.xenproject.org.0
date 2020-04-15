Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E11AAC5B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 17:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOkMx-0001wt-Ox; Wed, 15 Apr 2020 15:54:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fIs=57=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOkMv-0001wb-AG
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 15:54:29 +0000
X-Inumbo-ID: 62b3de0a-7f31-11ea-83d8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62b3de0a-7f31-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586966069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jTRiDiTZG+Xjp4Q1/LnZ0t/bRUj29uNdc4m9+KUPg6o=;
 b=VB0WN5UyuEC0MFp6taYrSAgO/mO5T4A3FBHynsPMH1wXtaYTGyjvEJJo
 PYZ2TY6XOdSmcYbUYIygm0gE5Di2cBFa5vnk4rKK4ZtSm+7tRXIY7+w/s
 mZ/lfNiICJeDGlJo0FzjMMOYniF3qYb/ovUo+jjSP37c1Ja88AVJtlEEY Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RGstGHMeJaXOIaBlOkgO6k10OXUyQDBTfmZZpMMDIgnWeK5DSLnXiugAoa3l4lvPaxoSmca7Zz
 iYuEhQDi7gDQkg1JiWEha6mpQ+I3WKO7I5h+w1aPghYQYX5p8H1A++fj5rzD5e0BK16Jqw/xCN
 J96tpWj5aSDUlCj+9G9h5JzcxtTvcCAcr6FrUMt95ibKJMC+ul34uAbhDtz9oRfcDmADJQjLUc
 fE9SXEZInDo3NJxNQ+KNenKWKKD3h3BTEto8uxjDz0PBw8UsVCKPd6qaPyfhB86ZKOTjk5Vkq/
 8kA=
X-SBRS: 2.7
X-MesageID: 15739722
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="15739722"
Date: Wed, 15 Apr 2020 17:54:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200415155420.GN28601@Air-de-Roger>
References: <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
 <20200414111911.GI28601@Air-de-Roger>
 <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
 <20200414145337.GJ28601@Air-de-Roger>
 <fbc0dd00-6973-4003-ad34-591561b695c9@suse.com>
 <20200415144908.GM28601@Air-de-Roger>
 <93d41cd3-b24c-9b51-b15e-3b1e538bba5a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93d41cd3-b24c-9b51-b15e-3b1e538bba5a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 15, 2020 at 05:42:20PM +0200, Jan Beulich wrote:
> On 15.04.2020 16:49, Roger Pau Monné wrote:
> > On Tue, Apr 14, 2020 at 05:06:23PM +0200, Jan Beulich wrote:
> >> On 14.04.2020 16:53, Roger Pau Monné wrote:
> >>> On Tue, Apr 14, 2020 at 03:50:15PM +0200, Jan Beulich wrote:
> >>>> On 14.04.2020 13:19, Roger Pau Monné wrote:
> >>>>> On Tue, Apr 14, 2020 at 12:13:04PM +0200, Jan Beulich wrote:
> >>>>>> On 14.04.2020 12:02, Roger Pau Monné wrote:
> >>>>>>> That seems nice, we would have to be careful however as reducing the
> >>>>>>> number of ASID/VPID flushes could uncover issues in the existing code.
> >>>>>>> I guess you mean something like:
> >>>>>>>
> >>>>>>> static inline void guest_flush_tlb_mask(const struct domain *d,
> >>>>>>>                                         const cpumask_t *mask)
> >>>>>>> {
> >>>>>>>     flush_mask(mask, (is_pv_domain(d) || shadow_mode_enabled(d) ? FLUSH_TLB
> >>>>>>>                                                                 : 0) |
> >>>>>>>     		     (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> >>>>>>> 		                                      : 0));
> >>>>>>> }
> >>>>>>
> >>>>>> Almost - is_hvm_domain(d) && cpu_has_svm seems to wide for me. I'd
> >>>>>> rather use hap_enabled() && cpu_has_svm, which effectively means NPT.
> >>>>>> Or am I overlooking a need to do ASID flushes also in shadow mode?
> >>>>>
> >>>>> I think so, I've used is_hvm_domain in order to cover for HVM domains
> >>>>> running in shadow mode on AMD hardware, I think those also need the
> >>>>> ASID flushes.
> >>>>
> >>>> I'm unconvinced: The entire section "TLB Management" in the PM gives
> >>>> the impression that "ordinary" TLB flushing covers all ASIDs anyway.
> >>>> It's not stated anywhere (I could find) explicitly though.
> >>>
> >>> Hm, I don't think so. XenRT found a myriad of issues with NPT when p2m
> >>> code wasn't modified to do ASID flushes instead of plain TLB flushes.
> >>
> >> Well, that's clear from e.g. p2m_pt_set_entry() not doing any
> >> flushing itself.
> >>
> >>> Even if it's just to stay on the safe side I would perform ASID
> >>> flushes for HVM guests with shadow running on AMD.
> >>
> >> Tim, any chance you could voice your thoughts here? To me it seems
> >> odd to do an all-ASIDs flush followed by an ASID one.
> > 
> > I've been reading a bit more into this, and section 15.16.1 states:
> > 
> > "TLB flush operations must not be assumed to affect all ASIDs."
> 
> That's the section talking about the tlb_control VMCB field. It is
> in this context that the sentence needs to be interpreted, imo.

It explicitly mentions move-to-cr3 and move-to-cr4 before that phrase:

"TLB flush operations function identically whether or not SVM is
enabled (e.g., MOV-TO-CR3 flushes non-global mappings, whereas
MOV-TO-CR4 flushes global and non-global mappings). TLB flush
operations must not be assumed to affect all ASIDs."

So my reading is that normal flush operations not involving
tlb_control VMCB field should not assume to flush all ASIDs. Again
this is of course my interpretation of the text in the PM. I will go
with my suggested approach, which is safer and should cause no
functional issues AFAICT. The only downside is the maybe redundant
flush, but that's safe.

Thanks, Roger.

