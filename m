Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E38197865
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 12:09:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIrJ5-00071P-Aj; Mon, 30 Mar 2020 10:06:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vI0s=5P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jIrJ3-00071K-S1
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:06:09 +0000
X-Inumbo-ID: 134440a0-726e-11ea-b9ba-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 134440a0-726e-11ea-b9ba-12813bfff9fa;
 Mon, 30 Mar 2020 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585562768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+q8h6KPGuofQV8JSCvWcm2WsT7DWI+i5jOb6k/E2qLg=;
 b=TmXIg/1EaKSHo0WpQv1yARZ1C2/Wk4JSc8gcQLneJd6aj7RmAIhse86x
 YJGs05sL/WZblUA7gNY9EVdPkyuC0MIaCZjTCzpwiDhIIP4YCd8z85Pi1
 T8QEpYC2+hhpES7Ct+HqdVNAC75IZ9BOMwsaFhDHVSgQ9ZZxA9l+HV0LM k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4GxmY2e1iR3d3z7E4aYyutrfdwcs+iDBklp8r6O9c9+9ohAl3IU9RAUggbbI0lJmMHosnZ+pGq
 zdmInfLXaH4dsWsW2ExCJ+GnQEO1gaOwGYtzVXiTiNd3D5IYGuoFAJ3ilGj7lGte1q71Qf1ufq
 8rP4EeC/9ruFcHne0QYGc5Y1usynhtOnHNJlFkJQ96bqlUG7uTWayeU1PaDl9ao5p/wP/lG4oU
 1P/B9c8wNYEtIKV47QGZF8FzE3kSJj/+fmd0N+/bn0WE47eFHzTqlLLcsPHp2Y+jtnHmEL5kC8
 5oY=
X-SBRS: 2.7
X-MesageID: 15176174
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,323,1580792400"; d="scan'208";a="15176174"
Date: Mon, 30 Mar 2020 12:05:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200330100559.GO28601@Air-de-Roger>
References: <20200329045512.GA28203@simran-Inspiron-5558>
 <20200329133651.yra3nesdqrwwgbte@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200329133651.yra3nesdqrwwgbte@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
 pointer
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org, Simran Singhal <singhalsimran0@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Mar 29, 2020 at 02:36:51PM +0100, Wei Liu wrote:
> On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:
> > Assignment to a typed pointer is sufficient in C.
> > No cast is needed.
> > 
> > Also, changed some u64/u32 to uint64_t/uint32_t.
> > 
> > Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
> > ---
> > Changes in v2:
> > 	- Took the chance to change some uintX to uintX_t.
> > 
> >  xen/arch/x86/acpi/cpufreq/powernow.c |  2 +-
> >  xen/arch/x86/cpu/vpmu.c              |  2 +-
> >  xen/arch/x86/hpet.c                  |  2 +-
> >  xen/arch/x86/hvm/save.c              |  2 +-
> >  xen/arch/x86/hvm/vmx/vvmx.c          | 12 ++++++------
> >  5 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
> > index 3cf9c6cd05..f620bebc7e 100644
> > --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> > +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> > @@ -58,7 +58,7 @@ static void transition_pstate(void *pstate)
> >  
> >  static void update_cpb(void *data)
> >  {
> > -    struct cpufreq_policy *policy = (struct cpufreq_policy *)data;
> > +    struct cpufreq_policy *policy = data;
> >  
> >      if (policy->turbo != CPUFREQ_TURBO_UNSUPPORTED) {
> >          uint64_t msr_content;
> > diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> > index e50d478d23..1ed39ef03f 100644
> > --- a/xen/arch/x86/cpu/vpmu.c
> > +++ b/xen/arch/x86/cpu/vpmu.c
> > @@ -337,7 +337,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
> >  
> >  static void vpmu_save_force(void *arg)
> >  {
> > -    struct vcpu *v = (struct vcpu *)arg;
> > +    struct vcpu *v = arg;
> >      struct vpmu_struct *vpmu = vcpu_vpmu(v);
> >  
> >      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
> > diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> > index 86929b9ba1..c46e7cf4ee 100644
> > --- a/xen/arch/x86/hpet.c
> > +++ b/xen/arch/x86/hpet.c
> > @@ -215,7 +215,7 @@ again:
> >  static void hpet_interrupt_handler(int irq, void *data,
> >          struct cpu_user_regs *regs)
> >  {
> > -    struct hpet_event_channel *ch = (struct hpet_event_channel *)data;
> > +    struct hpet_event_channel *ch = data;
> >  
> >      this_cpu(irq_count)--;
> >  
> > diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
> > index 0fc59d3487..a2c56fbc1e 100644
> > --- a/xen/arch/x86/hvm/save.c
> > +++ b/xen/arch/x86/hvm/save.c
> > @@ -417,7 +417,7 @@ void _hvm_read_entry(struct hvm_domain_context *h, void *dest,
> >      memcpy(dest, &h->data[h->cur], d->length);
> >  
> >      if ( d->length < dest_len )
> > -        memset((char *)dest + d->length, 0, dest_len - d->length);
> > +        memset(dest + d->length, 0, dest_len - d->length);
> 
> I believe you shouldn't drop the cast here either because dest is of
> type void*.
> 
> Although the calculation in the end is the same (void* considered of
> size 1), I would still keep the cast such that the semantics is correct.

IMO dropping the case here is fine, as dest is of type void * the
calculation is correct and the cast just obfuscates it.

I usually cast things to void * instead of char * or uint8_t * in
order to do pointer additions with size 1.

Thanks, Roger.

