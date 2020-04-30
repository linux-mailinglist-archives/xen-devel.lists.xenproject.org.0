Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551171BF541
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:22:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6Js-0005pE-7K; Thu, 30 Apr 2020 10:21:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gX9=6O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jU6Jr-0005p9-Ds
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:21:27 +0000
X-Inumbo-ID: 58e29ec4-8acc-11ea-9a1c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58e29ec4-8acc-11ea-9a1c-12813bfff9fa;
 Thu, 30 Apr 2020 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588242086;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ggJ/mzOxAnjp3smHakokm7L1fh4d18CLf092ECK0ntk=;
 b=KEFW1kEJby8enjkNxbCaln3EC1Aqt5CPHMLu+I86YP8RqkJBcetg/9LB
 DXNkSut6ZlYkIh56Pp4Wj34aIsln1hZQxKbymrZdKtbdFY7dbnU0NTxzD
 8EprfCt7C0wiHnN7ZRBKHw9y47XJDNw0+SSc2Olu03NT3FasMR21cgawe w=;
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
IronPort-SDR: 5SKjl5jiAYZDwY6PORGaIVkQ9c5POU2fDN0Jr7Su/DnvJ/Nga0hv0Z5lQB1mz2bgX1BP9Gr4y/
 I+dCxo56uY1cujUy+w/HJcnnWgpcYvjvqqMc8ElTLfYAbuxHJ/ZkJcTTTszhQpr7hh6/d6O1B/
 8rDEw5WyfPimsDBOISyp9GMbLisv6veMTPh2RM/a6ha6oJqPWZg6y9nMXSziAxf9h0ga//5FTC
 ShE8krNDfysHnxGOM1p/yJXqx5eHWUYv4mvnsYhQladWqvhqlWqXbZFTPr4NmaR23KIegZ7tT3
 I0o=
X-SBRS: 2.7
X-MesageID: 16509521
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,334,1583211600"; d="scan'208";a="16509521"
Date: Thu, 30 Apr 2020 12:21:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hyperv: stash and use the configured max VP index
Message-ID: <20200430102118.GB28601@Air-de-Roger>
References: <20200429104144.17816-1-liuwe@microsoft.com>
 <20200429114718.zclpy6r6sbxuo6ph@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <20200430101558.GA28601@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200430101558.GA28601@Air-de-Roger>
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 12:15:58PM +0200, Roger Pau Monné wrote:
> On Wed, Apr 29, 2020 at 11:47:18AM +0000, Wei Liu wrote:
> > On Wed, Apr 29, 2020 at 11:41:44AM +0100, Wei Liu wrote:
> > > The value returned from CPUID is the maximum number for virtual
> > > processors supported by Hyper-V. It could be larger than the maximum
> > > number of virtual processors configured.
> > > 
> > > Stash the configured number into a variable and use it in calculations.
> > > 
> > > Signed-off-by: Wei Liu <liuwe@microsoft.com>
> > > ---
> > >  xen/arch/x86/guest/hyperv/hyperv.c  | 4 ++++
> > >  xen/arch/x86/guest/hyperv/private.h | 1 +
> > >  xen/arch/x86/guest/hyperv/tlb.c     | 2 +-
> > >  xen/arch/x86/guest/hyperv/util.c    | 2 +-
> > >  4 files changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> > > index 91a6782cd986..84221b751453 100644
> > > --- a/xen/arch/x86/guest/hyperv/hyperv.c
> > > +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> > > @@ -33,6 +33,7 @@ DEFINE_PER_CPU_READ_MOSTLY(void *, hv_input_page);
> > >  DEFINE_PER_CPU_READ_MOSTLY(void *, hv_vp_assist);
> > >  DEFINE_PER_CPU_READ_MOSTLY(unsigned int, hv_vp_index);
> > >  
> > > +unsigned int __read_mostly hv_max_vp_index;
> > >  static bool __read_mostly hcall_page_ready;
> > >  
> > >  static uint64_t generate_guest_id(void)
> > > @@ -143,6 +144,9 @@ static int setup_hypercall_pcpu_arg(void)
> > >      rdmsrl(HV_X64_MSR_VP_INDEX, vp_index_msr);
> > >      this_cpu(hv_vp_index) = vp_index_msr;
> > >  
> > > +    if ( vp_index_msr > hv_max_vp_index )
> > > +        hv_max_vp_index = vp_index_msr;
> > > +
> > >      return 0;
> > >  }
> > >  
> > > diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
> > > index 354fc7f685a7..fea3e291e944 100644
> > > --- a/xen/arch/x86/guest/hyperv/private.h
> > > +++ b/xen/arch/x86/guest/hyperv/private.h
> > > @@ -28,6 +28,7 @@
> > >  DECLARE_PER_CPU(void *, hv_input_page);
> > >  DECLARE_PER_CPU(void *, hv_vp_assist);
> > >  DECLARE_PER_CPU(unsigned int, hv_vp_index);
> > > +extern unsigned int hv_max_vp_index;
> > >  
> > >  static inline unsigned int hv_vp_index(unsigned int cpu)
> > >  {
> > > diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
> > > index 1d723d6ee679..0a44071481bd 100644
> > > --- a/xen/arch/x86/guest/hyperv/tlb.c
> > > +++ b/xen/arch/x86/guest/hyperv/tlb.c
> > > @@ -166,7 +166,7 @@ int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
> > >          {
> > >              unsigned int vpid = hv_vp_index(cpu);
> > >  
> > > -            if ( vpid >= ms_hyperv.max_vp_index )
> > > +            if ( vpid >= hv_max_vp_index )
> > 
> > I think the >= should be changed to > here.
> 
> I agree. With this fixed:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

FWIW, I think it should also be nice to add an ASSERT_UNREACHABLE in
the if body, as now it shouldn't be possible for vpid to be greater
than hv_max_vp_index unless something has gone really wrong?

Roger.

