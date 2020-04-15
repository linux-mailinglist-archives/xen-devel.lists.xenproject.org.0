Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BFB1A9DCD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 13:49:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOgXq-0002Aq-M4; Wed, 15 Apr 2020 11:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2fIs=57=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jOgXp-0002Al-N0
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 11:49:29 +0000
X-Inumbo-ID: 2934846c-7f0f-11ea-83d8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2934846c-7f0f-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586951369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bnnGwWvmiSqRtzZpSXaQ1DkHlTJdVm2N1krGMVkIJY8=;
 b=QiLsLT8A++INlZplXLeJaJF/YJ8qANUuASdihSD1yKkJ9WTsTvkMqbA5
 Awu9FaVA9s2Kap1vVU7hSizq/UYWF3nToUh5ubWoWZF7PMDxlcIOVRWwp
 /d8dPaU1c9VWWmA1prR0+g3Q5IFzb58+My/PtljZr40fmkQQ3wvc0gk98 o=;
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
IronPort-SDR: /1ceEh5bI3PXMVqF4djXaKN23q1nefiRPYRZ+BM5X1tRH+XvBUXF3Rgb2kHg+JSlvQ5NtUxikP
 97cswQXeSh5klDTWzm7rKAD6lHtLSuI91DSMvE6DMMiDAxnG+BbsatCS8ccGlxcflY6S0su6U7
 Xsi9vXcUb+pwk6YhX9RhEhePsoc30CkI7oPwZMVcYAH1pfy1hVgwruDw0jPMrb2+YdQJIJsY6t
 qy2Qi6kipnuuY0RN1GLbEVHw/c5YElC/oUpVZIXBiIQRWpIgEC4k6jn3SRnhL1vMaIzZdj7kaU
 ApU=
X-SBRS: 2.7
X-MesageID: 15946342
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="15946342"
Date: Wed, 15 Apr 2020 13:49:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v9 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200415114918.GK28601@Air-de-Roger>
References: <20200406105703.79201-2-roger.pau@citrix.com>
 <30062a0c-6587-a16e-2b31-de0dd6bf4c9a@suse.com>
 <20200414075245.GC28601@Air-de-Roger>
 <92a4ff05-9dcf-1d50-b9b2-bde39c4e3e8d@suse.com>
 <20200414100213.GH28601@Air-de-Roger>
 <389afe02-1747-1583-e642-6e4025b402aa@suse.com>
 <20200414111911.GI28601@Air-de-Roger>
 <073512c9-6500-054c-c72c-1f468da6464c@suse.com>
 <20200414145337.GJ28601@Air-de-Roger>
 <fbc0dd00-6973-4003-ad34-591561b695c9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc0dd00-6973-4003-ad34-591561b695c9@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Tue, Apr 14, 2020 at 05:06:23PM +0200, Jan Beulich wrote:
> On 14.04.2020 16:53, Roger Pau Monné wrote:
> > On Tue, Apr 14, 2020 at 03:50:15PM +0200, Jan Beulich wrote:
> >> On 14.04.2020 13:19, Roger Pau Monné wrote:
> >>>>> I think this should work, but I would rather do it in a separate
> >>>>> patch.
> >>>>
> >>>> Yes, just like the originally (wrongly, as you validly say) suggested
> >>>> full removal of them, putting this in a separate patch would indeed
> >>>> seem better.
> >>>
> >>> Would you like me to resend with the requested fix to
> >>> paging_log_dirty_range (ie: drop the FLUSH_TLB and only call
> >>> flush_mask for HAP guests running on AMD) then?
> >>
> >> Well, ideally I'd see that function also make use of the intended
> >> new helper function, if at all possible (and suitable).
> > 
> > Oh, OK. Just to make sure I understand what you are asking for, you
> > would like me to resend introducing the new guest_flush_tlb_mask
> > helper and use it in the flush_tlb_mask callers modified by this
> > patch?
> 
> Yes (and I now realize it may not make sense to split it off into a
> separate change).

I could do a pre-patch that introduces guest_flush_tlb_mask as a
simple wrapper around flush_tlb_mask and replace the callers that I
modify in this patch. Then this patch would only introduce
FLUSH_HVM_ASID_CORE and modify guest_flush_tlb_mask to use it when
required.

It might make it more complicated to see which callers require the
ASID flush, but if you think it's better I can arrange the patches in
that way.

Thanks, Roger.

