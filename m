Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F07272A50
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 17:36:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKNrF-0005po-Cl; Mon, 21 Sep 2020 15:36:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSXE=C6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKNrD-0005pi-Lx
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 15:35:59 +0000
X-Inumbo-ID: 3bad452f-595c-4430-a279-4a7a117fc6be
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bad452f-595c-4430-a279-4a7a117fc6be;
 Mon, 21 Sep 2020 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600702555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3wMcflPgctskZ+axprx0uNI+7BPpV60RCOCNgtnGUQM=;
 b=CTj1iXVQ38VVK+MInILVHByRj8Yc7IORAoNwQ9E9YC867HbntaSeT3QX
 z9VJFdMaephBTVJo75qwH/9j9M4ZiQ5Gy/MgERcVXbuGBYO2vbh09nNId
 NOQAz8aA8HaB1FjjckxhsRdDIs2qCRsKpOSFlGbz7k7W5sLKssjxwGn07 c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PjDxfgdOqiiwW/W5/ilTahMUC++PYG1jumO3UAxMgymF9Zph+74t1/gx9MUweu2zrJg69Zs3ud
 GIdOwY33NPEUM7vaU/tqirarXE76UhUThyW4ZLPCQaY2svtiFnhHD4WDPuiCVhAzHwq9ivFwKL
 v03FvoWLcGWMWTeBcYufCo/mTgbjRMK5PZLjrSARPCuxyVcYbI9IqEsR+MaC4v8YphrDj8YH34
 oG2+KGWSivGB0iZCC1oCfunFQhBl5NV6F317KaIYtNRsWWRYdkL5jttgAdxwJfThuOgY+z/02R
 5w8=
X-SBRS: 2.7
X-MesageID: 27148439
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,286,1596513600"; d="scan'208";a="27148439"
Date: Mon, 21 Sep 2020 17:35:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
Message-ID: <20200921153545.GG19254@Air-de-Roger>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <3b61c04e-b2ef-a9c6-c3c4-e1d8624e7115@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3b61c04e-b2ef-a9c6-c3c4-e1d8624e7115@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 21, 2020 at 04:22:26PM +0200, Jan Beulich wrote:
> On 10.09.2020 15:35, Roger Pau Monne wrote:
> > arch_init_memory will treat all the gaps on the physical memory map
> > between RAM regions as MMIO and use share_xen_page_with_guest in order
> > to assign them to dom_io. This has the side effect of setting the Xen
> > heap flag on such pages, and thus is_special_page would then return
> > true which is an issue in epte_get_entry_emt because such pages will
> > be forced to use write-back cache attributes.
> > 
> > Fix this by introducing a new helper to assign the MMIO regions to
> > dom_io without setting the Xen heap flag on the pages, so that
> > is_special_page will return false and the pages won't be forced to use
> > write-back cache attributes.
> > 
> > Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> 
> Is this really the correct commit? I had this queued for backport,
> and ended up discarding it from the queue based on this tag, just
> to then noticing that I remembered correctly that I did backport
> ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages") to
> the stable trees already. Isn't it _this_ commit which the change
> here fixes?

My bisection pointed to that exact commit as the one that broke my PVH
dom0 setup, so yes, I'm quite sure that's the commit at least on the
box that I've bisected it.

ca24b2ffdbd9 was still fine because previous to the is_special_page
check loop there was still the `if ( direct_mmio ) ...` handling,
which made all MMIO regions except for the APIC access page forcefully
have it's cache attributes set to UC.

Roger.

