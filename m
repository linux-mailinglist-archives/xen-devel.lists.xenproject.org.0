Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D71F5508
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:41:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj02J-0004Wo-E7; Wed, 10 Jun 2020 12:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jj02I-0004We-8f
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:40:54 +0000
X-Inumbo-ID: 9f2abe1e-ab17-11ea-8496-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f2abe1e-ab17-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 12:40:53 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nNU+aj6yplQrqlTAqeK4CfMv+rI/KyzFg+pXfgzkQnX5EWIp934YHUa4GCOE003PI7fC5sz7dx
 Fe+eHPRYZd7cTGWfITkTezmZf67kvYbCl24OzIKFYI324xS3lIshY/m3FpjQ7axbalgFGbvcCi
 khmYnTYAAWOx/T910Fnfmcx0D9OPpX1Y6bOCqxmkivZy9KuCFuvItBb2DETWE0yb9DrG1nkQvG
 eA3Yva/xaoPSOy5Ha+tkCAcp4CR6OJnTRWIFPcxmb0DiPl5AEFLGvORS+OREGzMTBmT2JJ+x8n
 pQU=
X-SBRS: 2.7
X-MesageID: 19695224
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="19695224"
Date: Wed, 10 Jun 2020 14:40:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
Subject: Re: [PATCH for-4.14 1/2] x86/passthrough: do not assert edge
 triggered GSIs for PVH dom0
Message-ID: <20200610124043.GA4920@Air-de-Roger>
References: <20200610115103.7592-1-roger.pau@citrix.com>
 <20200610115103.7592-2-roger.pau@citrix.com>
 <00e301d63f23$63c83a00$2b58ae00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00e301d63f23$63c83a00$2b58ae00$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 10, 2020 at 01:33:46PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 10 June 2020 12:51
> > To: xen-devel@lists.xenproject.org
> > Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew
> > Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> > Subject: [PATCH for-4.14 1/2] x86/passthrough: do not assert edge triggered GSIs for PVH dom0
> > 
> > Edge triggered interrupts do not assert the line, so the handling done
> > in Xen should also avoid asserting it. Asserting the line prevents
> > further edge triggered interrupts on the same vIO-APIC pin from being
> > delivered, since the line is not de-asserted.
> > 
> > One case of such kind of interrupt is the RTC timer, which is edge
> > triggered and available to a PVH dom0. Note this should not affect
> > domUs, as it only modifies the behavior of IDENTITY_GSI kind of passed
> > through interrupts.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/irq.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> > index 9c8adbc495..9a56543c1b 100644
> > --- a/xen/arch/x86/hvm/irq.c
> > +++ b/xen/arch/x86/hvm/irq.c
> > @@ -169,9 +169,10 @@ void hvm_pci_intx_deassert(
> > 
> >  void hvm_gsi_assert(struct domain *d, unsigned int gsi)
> >  {
> > +    int level = vioapic_get_trigger_mode(d, gsi);
> >      struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> > 
> > -    if ( gsi >= hvm_irq->nr_gsis )
> > +    if ( gsi >= hvm_irq->nr_gsis || level < 0 )
> >      {
> >          ASSERT_UNREACHABLE();
> >          return;
> > @@ -186,9 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
> >       * to know if the GSI is pending or not.
> >       */
> >      spin_lock(&d->arch.hvm.irq_lock);
> > -    if ( !hvm_irq->gsi_assert_count[gsi] )
> > +    if ( !level || !hvm_irq->gsi_assert_count[gsi] )
> 
> We have definitions of VIOAPIC_EDGE_TRIG and VIOAPIC_LEVEL_TRIG. It seems odd not to use them here.

Urg, completely forgot about those. I think there are many places
where the triggering is treated as a boolean. I will rename the local
variable to 'trig' and compare against VIOAPIC_EDGE_TRIG.

Thanks, Roger.

