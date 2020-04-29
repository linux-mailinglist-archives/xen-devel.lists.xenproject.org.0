Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A811BD73F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:26:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTi33-0002Z0-U5; Wed, 29 Apr 2020 08:26:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUw1=6N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jTi31-0002Yo-Sr
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:26:27 +0000
X-Inumbo-ID: 1cc10112-89f3-11ea-991b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cc10112-89f3-11ea-991b-12813bfff9fa;
 Wed, 29 Apr 2020 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588148784;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bpJFR9uAOQ0x077VV4diKS8R0/Zg4CNCJAVOa/uFOzM=;
 b=aLLFp9UaajnAOq1hNrEIwIp9+Bps04bEWEQw3UyRCZQVws+D3/aC8axl
 pawvPNr7fvSmXLY3N0w8FWZJ6GQuNPylG19i7/9Uvptu94Te+tUg6P5R2
 ufLJOhlQd18Q2+5uy4uZFu1y6qCTtZZGQ9Ly/cJJyR6Odr5HnAVWfDreT Y=;
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
IronPort-SDR: rIaHzzxQD/ESbr87uXYRZPe2i4L18R/d/Jr5rvSs4APZ68kPopx2tHdyTSMDR205+bd1tCj8t1
 ZYV2Y6CooYCjoJoqQWQ3+1kMd2+y3tApBDba+g87BWYFnaUgTxFTAEB++tf/lb1x/w2vx0ZBUQ
 p8GR7GT/+qVuMmUPe596jmCYQXJlSUTAvbtw14aVzMiZlW0fJE2ynl+GouwHb3BQowWlkA5ELp
 9Sg4lIuBeFfAm6EwHKiibQePwRygSv1FpjMQGSoGxAFktBNOw47glIeQNBS60iJU+GDA/EDlMu
 rvg=
X-SBRS: 2.7
X-MesageID: 16822264
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,330,1583211600"; d="scan'208";a="16822264"
Date: Wed, 29 Apr 2020 10:26:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/pass-through: avoid double IRQ unbind during domain
 cleanup
Message-ID: <20200429082616.GX28601@Air-de-Roger>
References: <6fddc420-b582-cb2f-92ce-b3e067c420c4@suse.com>
 <20200428161412.GU28601@Air-de-Roger>
 <c0f222dc-2b7a-be54-29a1-75bcc5686dde@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0f222dc-2b7a-be54-29a1-75bcc5686dde@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Varad Gautam <vrd@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 29, 2020 at 09:37:11AM +0200, Jan Beulich wrote:
> On 28.04.2020 18:14, Roger Pau Monné wrote:
> > On Tue, Apr 28, 2020 at 02:21:48PM +0200, Jan Beulich wrote:
> >> XEN_DOMCTL_destroydomain creates a continuation if domain_kill -ERESTARTs.
> >> In that scenario, it is possible to receive multiple _pirq_guest_unbind
> >> calls for the same pirq from domain_kill, if the pirq has not yet been
> >> removed from the domain's pirq_tree, as:
> >>   domain_kill()
> >>     -> domain_relinquish_resources()
> >>       -> pci_release_devices()
> >>         -> pci_clean_dpci_irq()
> >>           -> pirq_guest_unbind()
> >>             -> __pirq_guest_unbind()
> >>
> >> Avoid recurring invocations of pirq_guest_unbind() by removing the pIRQ
> >> from the tree being iterated after the first call there. In case such a
> >> removed entry still has a softirq outstanding, record it and re-check
> >> upon re-invocation.
> >>
> >> Reported-by: Varad Gautam <vrd@amazon.de>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Tested-by: Varad Gautam <vrd@amazon.de>
> >>
> >> --- a/xen/arch/x86/irq.c
> >> +++ b/xen/arch/x86/irq.c
> >> @@ -1323,7 +1323,7 @@ void (pirq_cleanup_check)(struct pirq *p
> >>      }
> >>  
> >>      if ( radix_tree_delete(&d->pirq_tree, pirq->pirq) != pirq )
> >> -        BUG();
> >> +        BUG_ON(!d->is_dying);
> > 
> > I think to keep the previous behavior this should be:
> > 
> > BUG_ON(!is_hvm_domain(d) || !d->is_dying);
> > 
> > Since the pirqs will only be removed elsewhere if the domain is HVM?
> 
> pirq_cleanup_check() is a generic hook, and hence I consider it more
> correct to not have it behave differently in this regard for different
> types of guests. IOW while it _may_ (didn't check) not be the case
> today that this can be called multiple times even for PV guests, I'd
> view this as legitimate behavior.

Previous to this patch pirq_cleanup_check couldn't be called multiple
times, as it would result in the BUG triggering, that was true for
both PV and HVM. Now that the removal of PIRQs from the tree is done
elsewhere for HVM when the domain is dying the check needs to be
relaxed for HVM at least. I would prefer if it was kept as-is for PV
(since there's been no change in behavior for PV that could allow for
multiple calls to pirq_cleanup_check), or else a small comment in the
commit message would help clarify this is done on purpose.

Thanks, Roger.

