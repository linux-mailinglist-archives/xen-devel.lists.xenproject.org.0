Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAF1DE440
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4qC-0003Jr-PT; Fri, 22 May 2020 10:23:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc4qB-0003Jm-9p
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:23:47 +0000
X-Inumbo-ID: 51a499ea-9c16-11ea-abac-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51a499ea-9c16-11ea-abac-12813bfff9fa;
 Fri, 22 May 2020 10:23:46 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: s/bgTSOTcEaJVbv6mKIF/XXCZ9sFNoWnbzQnvccLWj08Gw8huL5npkPCnARoqQ8wcd4r8jiH5/
 tWbJD8Zkn8L9RBacqZeDrY555faKVNtKW1fkW8V+Wv8+TcVm3Zg3zRcoqBt2I3Obm4NMG++Hwk
 L1wBekOd7kORuGTgoSHYFmdS4bd6ab3B/g6KepU+LoCbs/i+gL7SM3e//1zvoJIagZt+VijCdZ
 nx+byZCBFRfhwdEh5l/o1hvPzKsys50g+YR/vrjIz8cR/Vg8CVDIekN3+SHvYotSvvhvo8jXTu
 ixU=
X-SBRS: 2.7
X-MesageID: 18161341
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18161341"
Date: Fri, 22 May 2020 12:23:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
Message-ID: <20200522102339.GX54375@Air-de-Roger>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <20200522100846.GV54375@Air-de-Roger>
 <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 11:14:24AM +0100, Igor Druzhinin wrote:
> On 22/05/2020 11:08, Roger Pau Monné wrote:
> > On Thu, May 21, 2020 at 10:43:58PM +0100, Igor Druzhinin wrote:
> >> If a recalculation NPT fault hasn't been handled explicitly in
> >> hvm_hap_nested_page_fault() then it's potentially safe to retry -
> >> US bit has been re-instated in PTE and any real fault would be correctly
> >> re-raised next time.
> >>
> >> This covers a specific case of migration with vGPU assigned on AMD:
> >> global log-dirty is enabled and causes immediate recalculation NPT
> >> fault in MMIO area upon access. This type of fault isn't described
> >> explicitly in hvm_hap_nested_page_fault (this isn't called on
> >> EPT misconfig exit on Intel) which results in domain crash.
> > 
> > Couldn't direct MMIO regions be handled like other types of memory for
> > the purposes of logdiry mode?
> > 
> > I assume there's already a path here used for other memory types when
> > logdirty is turned on, and hence would seem better to just make direct
> > MMIO regions also use that path?
> 
> The proble of handling only MMIO case is that the issue still stays.
> It will be hit with some other memory type since it's not MMIO specific.
> The issue is that if global recalculation is called, the next hit to
> this type will cause a transient fault which will not be handled
> correctly after a due fixup by neither of our handlers.

I admit I should go look at the code, but for example RAM p2m types
don't require this fix, so I assume there's some different path taken
in that case that avoids all this?

Ie: when global logdirty is enabled you will start to get nested page
faults for every access, yet only direct MMIO types require this fix?

Thanks, Roger

