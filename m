Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5BB1D4A2E
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 11:58:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZX6P-0001n9-Lj; Fri, 15 May 2020 09:58:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZX6O-0001n4-6O
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 09:58:00 +0000
X-Inumbo-ID: 8e85f446-9692-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e85f446-9692-11ea-ae69-bc764e2007e4;
 Fri, 15 May 2020 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589536679;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6Gp7i5DjV3oxSWhQxLmNtP5FHypocaX1vX1FkyxMkVw=;
 b=SeAbJZ6LAvL6SgVgm0nsiL1BwQHFhMwjBoppX7E87b0vhbJln8m6xfuE
 12xtr1f6yOnq9sDDRASiIY53MMY8g9GEgdBDe7UPcY1omq3wQDKFxonhr
 o8gvCpvz6RXu2RdDTCf+YQXO3kFqhfbY8IROHpXxtgjn3HwYkdZWhlBic E=;
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
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: ExsvqBbEXZcuBESytKX4nm5MgKwDl4An5ML9+wAyzhTOSc0UeedbpqK/XqWk/0P36YZIi/vvF5
 pAppqro+Lr8Ca185uz/cXzEdHYT1QmOufZvcRp9wHdi4b+TMB2rKdI80W8rkAqgICJ8BAByfMM
 DRGhmx65C5buG/hcmkWwZKW9rJXEiJKSfCrQNWPQ5cKX/H4ZRRGpD7kTr5fRdTwHLC3f+XQ76h
 RNm4gCtx8Zci4ts+l76a6yEWgaEOzQQsLSKrHb6Npe3aTummXlw6n6QId762L1Q/zVtJa/OWpO
 et4=
X-SBRS: 2.7
X-MesageID: 17970664
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,394,1583211600"; d="scan'208";a="17970664"
Date: Fri, 15 May 2020 11:57:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Error during update_runstate_area with KPTI activated
Message-ID: <20200515095751.GQ54375@Air-de-Roger>
References: <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
 <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
 <20200515091018.GO54375@Air-de-Roger>
 <3813cfa2-c881-3fa5-bdf8-a2e874584a9f@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3813cfa2-c881-3fa5-bdf8-a2e874584a9f@xen.org>
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
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 15, 2020 at 10:23:16AM +0100, Julien Grall wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> 
> On 15/05/2020 10:10, Roger Pau Monné wrote:
> > On Fri, May 15, 2020 at 09:53:54AM +0100, Julien Grall wrote:
> > > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> > > 
> > > Hi,
> > > 
> > > On 15/05/2020 09:38, Roger Pau Monné wrote:
> > > > On Fri, May 15, 2020 at 07:39:16AM +0000, Bertrand Marquis wrote:
> > > > > 
> > > > > 
> > > > > On 14 May 2020, at 20:13, Julien Grall <julien.grall.oss@gmail.com<mailto:julien.grall.oss@gmail.com>> wrote:
> > > > > "I'd love to do this, but we cant.  Older Linux used to have a virtual
> > > > > buffer spanning a page boundary.  Changing the behaviour under that will
> > > > > cause older setups to explode."
> > > > 
> > > > Sorry this was long time ago, and details have faded. IIRC there was
> > > > even a proposal (or patch set) that took that into account and allowed
> > > > buffers to span across a page boundary by taking a reference to two
> > > > different pages in that case.
> > > 
> > > I am not aware of a patch set. Juergen suggested a per-domain mapping but
> > > there was no details how this could be done (my e-mail was left unanswered
> > > [1]).
> > > 
> > > If we were using the vmap() then we would need up 1MB per domain (assuming
> > > 128 vCPUs). This sounds quite a bit and I think we need to agree whether it
> > > would be an acceptable solution (this was also left unanswered [1]).
> > 
> > Could we map/unmap the runtime area on domain switch at a per-cpu
> > based linear space area? There's no reason to have all the runtime
> > areas mapped all the time, you just care about the one from the
> > running vcpu.
> 
> AFAICT, this is only used during context switching. This is a bit surprising
> because I would expect it to be updated when the vCPU is running.
> 
> So maybe we could just use map_domain_page() and take care manually about
> cross-page boundary.
> 
> > 
> > Maybe the overhead of that mapping and unmapping would be
> > too high? But seeing that we are aiming at a secret-free Xen we would
> > have to eventually go that route anyway.
> 
> The overhead is likely to be higher with the existing code as you have to
> walk the guest page-tables and the p2m everytime in order to translate the
> guest virtual address to a host physical address.

Maybe I'm getting confused, but you actually want to avoid the guest
page table walk, as the guest might be running with user-space page
tables that don't have the linear address of the runtime area mapped,
and hence you would like to do the walk only once (at hypercall
registration time) and keep a reference to the page(s)?

I assumed the whole point of this was to avoid doing the page table
walk when you need to update the runstate info area.

Roger.

