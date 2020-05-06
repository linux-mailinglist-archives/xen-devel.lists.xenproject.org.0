Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281AE1C6D13
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:37:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGUw-0007eW-P3; Wed, 06 May 2020 09:37:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jP1D=6U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jWGUu-0007eJ-Oj
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:37:48 +0000
X-Inumbo-ID: 3f51dbe0-8f7d-11ea-9e29-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f51dbe0-8f7d-11ea-9e29-12813bfff9fa;
 Wed, 06 May 2020 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AiuIkPHt3//36IVZTKF7/3+gbZ6ov+Qa2jsC3AwA2hA=; b=ljaSZaEWRBJ7gqe4JfVcfMe6j9
 guPjBgeZrrxnVC4blPUKfxmcwOV7hkYOk/idRCcKewjpACaAbEigAfErkEwMUgQFXs97dJjQdn2+A
 SKSvifHsjknlPRs7GhIYwL56fRMoUcktEO/TxAaYTNpZ2MaNA2RwcahX69U7fz5MJUgY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jWGUs-0000mz-MC; Wed, 06 May 2020 09:37:46 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jWGUs-0008PF-Db; Wed, 06 May 2020 09:37:46 +0000
Date: Wed, 6 May 2020 10:37:43 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/hyperv: stash and use the configured max VP index
Message-ID: <20200506093743.ztkvh5fwv2c4hw2r@debian>
References: <20200429104144.17816-1-liuwe@microsoft.com>
 <20200429114718.zclpy6r6sbxuo6ph@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <20200430101558.GA28601@Air-de-Roger>
 <20200430102118.GB28601@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200430102118.GB28601@Air-de-Roger>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 12:21:18PM +0200, Roger Pau Monné wrote:
> On Thu, Apr 30, 2020 at 12:15:58PM +0200, Roger Pau Monné wrote:
> > On Wed, Apr 29, 2020 at 11:47:18AM +0000, Wei Liu wrote:
> > > On Wed, Apr 29, 2020 at 11:41:44AM +0100, Wei Liu wrote:
> > > > The value returned from CPUID is the maximum number for virtual
> > > > processors supported by Hyper-V. It could be larger than the maximum
> > > > number of virtual processors configured.
> > > > 
> > > > Stash the configured number into a variable and use it in calculations.
> > > > 
> > > > Signed-off-by: Wei Liu <liuwe@microsoft.com>
> > > > ---
> > > >  xen/arch/x86/guest/hyperv/hyperv.c  | 4 ++++
> > > >  xen/arch/x86/guest/hyperv/private.h | 1 +
> > > >  xen/arch/x86/guest/hyperv/tlb.c     | 2 +-
> > > >  xen/arch/x86/guest/hyperv/util.c    | 2 +-
> > > >  4 files changed, 7 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> > > > index 91a6782cd986..84221b751453 100644
> > > > --- a/xen/arch/x86/guest/hyperv/hyperv.c
> > > > +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> > > > @@ -33,6 +33,7 @@ DEFINE_PER_CPU_READ_MOSTLY(void *, hv_input_page);
> > > >  DEFINE_PER_CPU_READ_MOSTLY(void *, hv_vp_assist);
> > > >  DEFINE_PER_CPU_READ_MOSTLY(unsigned int, hv_vp_index);
> > > >  
> > > > +unsigned int __read_mostly hv_max_vp_index;
> > > >  static bool __read_mostly hcall_page_ready;
> > > >  
> > > >  static uint64_t generate_guest_id(void)
> > > > @@ -143,6 +144,9 @@ static int setup_hypercall_pcpu_arg(void)
> > > >      rdmsrl(HV_X64_MSR_VP_INDEX, vp_index_msr);
> > > >      this_cpu(hv_vp_index) = vp_index_msr;
> > > >  
> > > > +    if ( vp_index_msr > hv_max_vp_index )
> > > > +        hv_max_vp_index = vp_index_msr;
> > > > +
> > > >      return 0;
> > > >  }
> > > >  
> > > > diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
> > > > index 354fc7f685a7..fea3e291e944 100644
> > > > --- a/xen/arch/x86/guest/hyperv/private.h
> > > > +++ b/xen/arch/x86/guest/hyperv/private.h
> > > > @@ -28,6 +28,7 @@
> > > >  DECLARE_PER_CPU(void *, hv_input_page);
> > > >  DECLARE_PER_CPU(void *, hv_vp_assist);
> > > >  DECLARE_PER_CPU(unsigned int, hv_vp_index);
> > > > +extern unsigned int hv_max_vp_index;
> > > >  
> > > >  static inline unsigned int hv_vp_index(unsigned int cpu)
> > > >  {
> > > > diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
> > > > index 1d723d6ee679..0a44071481bd 100644
> > > > --- a/xen/arch/x86/guest/hyperv/tlb.c
> > > > +++ b/xen/arch/x86/guest/hyperv/tlb.c
> > > > @@ -166,7 +166,7 @@ int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
> > > >          {
> > > >              unsigned int vpid = hv_vp_index(cpu);
> > > >  
> > > > -            if ( vpid >= ms_hyperv.max_vp_index )
> > > > +            if ( vpid >= hv_max_vp_index )
> > > 
> > > I think the >= should be changed to > here.
> > 
> > I agree. With this fixed:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> FWIW, I think it should also be nice to add an ASSERT_UNREACHABLE in
> the if body, as now it shouldn't be possible for vpid to be greater
> than hv_max_vp_index unless something has gone really wrong?

At some point I will initialise vpid to (uint32_t)-1 so it could go over
hv_max_vp_index if there is a bug in code.

Wei.

> 
> Roger.

