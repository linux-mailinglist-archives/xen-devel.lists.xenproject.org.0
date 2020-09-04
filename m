Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44525D70D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 13:14:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9fS-0006nY-VH; Fri, 04 Sep 2020 11:14:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+qm=CN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kE9fR-0006nT-3F
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 11:14:05 +0000
X-Inumbo-ID: 2f5aaae3-aefe-4cfe-b1c3-b706b0a2b400
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f5aaae3-aefe-4cfe-b1c3-b706b0a2b400;
 Fri, 04 Sep 2020 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599218044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TeM73/1/+iCP5feLwHzL2ljy6suNbrE0ATh+GzCdLyU=;
 b=JXPsOroa3hdEIAoVUgBds3QUkgl3ahRXNxEIqbRomHiaxj1WIzo1IuNh
 NjAbxB0TBZpvWGvniEmh9OdFvm63sAKraRs9q4STw9PDXd8EFKtxWRLfj
 m/C1eNS+YczBM2H4H8O4XUh5JRXNAaA1GwRN6lGx3F+I6e30BdU3tMeZj s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qRTKGm4wJK9O7z77f+8insDdO+nQ8MduG/5tmFiT+XvA61eVwzEqkT9mnvQ5iHz8Ve2/Kr04N+
 KUf4eqfD2leN0UrmVOC2mM84gPOXWYMxlYlT8Y4zZ4V5a5L0ToqjNhRRJMXu3IpUNdB6XIh3G5
 nYee1gnAUFJwG4UBymQRXIh+XVBT0O40pZxkaTErlbsthcFQ9o6ZuYw6sGdOUuF3ciSMt4kCAj
 zJVHWvtO3okUlLse0uYY8q6laZKqA7c0HR+Fgf0FFIliUEYGl8j1DTQYuDMK0HjKNEJxZ1GrYi
 mVM=
X-SBRS: 2.7
X-MesageID: 26009391
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26009391"
Date: Fri, 4 Sep 2020 13:13:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jun Nakajima
 <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 7/8] x86/hvm: Disallow access to unknown MSRs
Message-ID: <20200904111354.GP753@Air-de-Roger>
References: <20200901105445.22277-1-roger.pau@citrix.com>
 <20200901105445.22277-8-roger.pau@citrix.com>
 <6823183f-90f0-90df-f843-6db2e84dba4a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6823183f-90f0-90df-f843-6db2e84dba4a@suse.com>
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

On Fri, Sep 04, 2020 at 10:53:26AM +0200, Jan Beulich wrote:
> On 01.09.2020 12:54, Roger Pau Monne wrote:
> > @@ -3290,11 +3288,6 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
> >          __vmwrite(GUEST_IA32_DEBUGCTL, msr_content);
> >          break;
> >  
> > -    case MSR_IA32_FEATURE_CONTROL:
> > -    case MSR_IA32_VMX_BASIC ... MSR_IA32_VMX_VMFUNC:
> > -        /* None of these MSRs are writeable. */
> > -        goto gp_fault;
> 
> I understand Andrew did ask for this (and I didn't look closely
> when I saw the comment), but ...
> 
> > @@ -3320,10 +3313,9 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
> >               is_last_branch_msr(msr) )
> >              break;
> >  
> > -        /* Match up with the RDMSR side; ultimately this should go away. */
> > -        if ( rdmsr_safe(msr, msr_content) == 0 )
> > -            break;
> > -
> > +        gdprintk(XENLOG_WARNING,
> > +                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> > +                 msr, msr_content);
> >          goto gp_fault;
> 
> ... above from here is logic that handling of these MSRs now goes
> through. I'm particularly worried about vmx_write_guest_msr(),
> which blindly updates the value of any MSR it can find, i.e. if
> any r/o MSR (from the set above, or even more generally) ever got
> added to this vCPU-specific set, the r/o-ness would no longer be
> maintained.

But those MSRs need to be added to the list explicitly (using
vmx_add_guest_msr) in order for the guest to be able to update them,
and they are supposed to be owned by the guest?

I understand the concern, but AFAICT none of the MSRs handled by
VMX_MSR_GUEST require such handling. Maybe it's worth adding something
like VMX_MSR_GUEST_RO in the future if such need arises?

> Do we perhaps need to white-list MSRs for which
> vmx_write_guest_msr() may get called here?

When such MSRs are added such addition should make sure they are not
allowed write permissions? You would have to do that now anyway
AFAICT.

Roger.

