Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED531BF2CA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 10:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU4Yx-0003vC-Dj; Thu, 30 Apr 2020 08:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gX9=6O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jU4Yw-0003v7-KS
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 08:28:54 +0000
X-Inumbo-ID: a01f4bee-8abc-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a01f4bee-8abc-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588235333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zlmJPOZCYWIUpubzos1hzhtSRn6gIoLTRbJuO70c0rE=;
 b=Y9RtkVo4qSXEVNepDHSS1MSQMYJy5z9oMUG5dBoVALDx9qvH8xogK6/O
 4wh+onDx4uZmhcxDA1skt4Z/mnLdRUshuTLrRvo7G1UKVfQ4VvRhgrizC
 DmMLgSmUZ021cD2lx3zOznPP5rq5YESqcr8DmEiO+hIleEbnhPog4II6V E=;
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
IronPort-SDR: eWKkNHgFWKOXqnJV6HMQGDt5c31msB0u2EpxFbbFRBtcoyKOp/oNADGEbEBg1weYpLDG/lb+51
 af7SydN3vPw5f4QyK795XAaMbTWUq4MQOAQGVfsxy+5qXSpWvE42iPczplnZEM/8dnHj98pjN3
 xRhj+8yCAdHIy/KIur+g5ALyXQ5uD7qww51jPsgruJyRelqFK9DBrf1qGvCwrpnRsMM3sea7XO
 mU6FkDKkbUZMTgwkB01yVWLHNCBAzvS1VwgCkN723ZI5cqUU5+xgE1MJPG1EKOq4Cml9/pBMLB
 f+M=
X-SBRS: 2.7
X-MesageID: 16891367
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,334,1583211600"; d="scan'208";a="16891367"
Date: Thu, 30 Apr 2020 10:28:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/hap: be more selective with assisted TLB flush
Message-ID: <20200430082844.GZ28601@Air-de-Roger>
References: <20200429173601.77605-1-roger.pau@citrix.com>
 <4257a323-d37f-4af0-bdc6-a3f65c19438a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4257a323-d37f-4af0-bdc6-a3f65c19438a@suse.com>
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 09:20:58AM +0200, Jan Beulich wrote:
> On 29.04.2020 19:36, Roger Pau Monne wrote:
> > When doing an assisted flush on HAP the purpose of the
> > on_selected_cpus is just to trigger a vmexit on remote CPUs that are
> > in guest context, and hence just using is_vcpu_dirty_cpu is too lax,
> > also check that the vCPU is running.
> 
> Am I right to understand that the change is relevant only to
> cover the period of time between ->is_running becoming false
> and ->dirty_cpu becoming VCPU_CPU_CLEAN? I.e. ...
> 
> > --- a/xen/arch/x86/mm/hap/hap.c
> > +++ b/xen/arch/x86/mm/hap/hap.c
> > @@ -719,7 +719,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
> >          hvm_asid_flush_vcpu(v);
> >  
> >          cpu = read_atomic(&v->dirty_cpu);
> > -        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) )
> > +        if ( cpu != this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running )
> 
> ... the previous logic would have suitably covered the switch-to
> path, but doesn't properly cover the switch-from one, due to our
> lazy context switch approach?

Yes. Also __context_switch is not called from context_switch when
switching to the idle vcpu, and hence dirty_cpu is not cleared.

> If so, I agree with the change:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> It might be worth mentioning this detail in the description then,
> though.

Would you mind adding to the commit message if you agree:

"Due to the lazy context switching done by Xen dirty_cpu won't always be
cleared when the guest vCPU is not running, and hence relying on
is_running allows more fine grained control of whether the vCPU is
actually running."

Thanks, Roger.

