Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D01BA15E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 12:33:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT14R-0001h7-Ad; Mon, 27 Apr 2020 10:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jT14P-0001h2-F3
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 10:33:01 +0000
X-Inumbo-ID: 776ffe1a-8872-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 776ffe1a-8872-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587983580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vYnkF0mZ7/2AyhwHdflxwXuELDdcHc50UWwOclnYv28=;
 b=RCcOWayZ4pF3J+7/mLUP09kBN74xg+i664B+tb9z6hQ11zTyGnoqmwLa
 Ahq1LHxDs0RlROYohaWNSH0iL0c5gqD/gc0JqKNJSBoBRnJKOJmkLU34a
 9+sQrAEznwIIRg/KzX+lZ9UT2zz8Nf2S6NgtL4FZnr2MtX3XE/Hjh5jYq k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gqCE6zVTPsc3jCY3aTD9CgysNlsbxYQWFAg5MYacmEFT3nuTtM0eOowMZP9Et1ondLIWFWSYta
 9hmbkcrAs28IBxUDY1ITUr/r1Vgr2MZv7bdgi1hVJg3hS3iVlgwxiQi5An9vyTku8gRWNPdkAh
 T/cHPb2nN17XEFaHaL/USfApmeCNS44aN3wQkQ/GdR1KoL2SzzHOrjWGnFUh9/tXvl+UPgCQm7
 qqyvicH+4TRNH4B2ycAKBTcGFCN6bdDjoAnZ3TKC3GCP1jA+BI6QZCMiC7Em3UxCdQQSD+IHr/
 ec4=
X-SBRS: 2.7
X-MesageID: 16977722
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,323,1583211600"; d="scan'208";a="16977722"
Date: Mon, 27 Apr 2020 12:32:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v11 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200427103252.GO28601@Air-de-Roger>
References: <20200423145611.55378-1-roger.pau@citrix.com>
 <20200423145611.55378-2-roger.pau@citrix.com>
 <59e48d80-8ce1-3f3d-c07e-5117adea272a@suse.com>
 <20200427101235.6xko3lvt3qajo64m@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427101235.6xko3lvt3qajo64m@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 11:12:35AM +0100, Wei Liu wrote:
> On Thu, Apr 23, 2020 at 06:33:49PM +0200, Jan Beulich wrote:
> > On 23.04.2020 16:56, Roger Pau Monne wrote:
> > > Introduce a specific flag to request a HVM guest linear TLB flush,
> > > which is an ASID/VPID tickle that forces a guest linear to guest
> > > physical TLB flush for all HVM guests.
> > > 
> > > This was previously unconditionally done in each pre_flush call, but
> > > that's not required: HVM guests not using shadow don't require linear
> > > TLB flushes as Xen doesn't modify the pages tables the guest runs on
> > > in that case (ie: when using HAP). Note that shadow paging code
> > > already takes care of issuing the necessary flushes when the shadow
> > > page tables are modified.
> > > 
> > > In order to keep the previous behavior modify all shadow code TLB
> > > flushes to also flush the guest linear to physical TLB if the guest is
> > > HVM. I haven't looked at each specific shadow code TLB flush in order
> > > to figure out whether it actually requires a guest TLB flush or not,
> > > so there might be room for improvement in that regard.
> > > 
> > > Also perform ASID/VPID flushes when modifying the p2m tables as it's a
> > > requirement for AMD hardware. Finally keep the flush in
> > > switch_cr3_cr4, as it's not clear whether code could rely on
> > > switch_cr3_cr4 also performing a guest linear TLB flush. A following
> > > patch can remove the ASID/VPID tickle from switch_cr3_cr4 if found to
> > > not be necessary.
> > > 
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> 
> Tim, ICYMI, this patch needs your ack.

Let me put Tim on the To: field, more likely to raise attention.

Roger.

