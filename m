Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063B28CFDB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6239.16598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKyi-0007vD-NL; Tue, 13 Oct 2020 14:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6239.16598; Tue, 13 Oct 2020 14:08:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKyi-0007un-JW; Tue, 13 Oct 2020 14:08:36 +0000
Received: by outflank-mailman (input) for mailman id 6239;
 Tue, 13 Oct 2020 14:08:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COa4=DU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kSKyh-0007ui-36
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:08:35 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb0dd6db-a82e-4a17-9ed5-2c0541fbb029;
 Tue, 13 Oct 2020 14:08:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=COa4=DU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kSKyh-0007ui-36
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:08:35 +0000
X-Inumbo-ID: eb0dd6db-a82e-4a17-9ed5-2c0541fbb029
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb0dd6db-a82e-4a17-9ed5-2c0541fbb029;
	Tue, 13 Oct 2020 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602598112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iHh7wiC4B2V5XZ/fLiC+j0dCB49+U0P5NCnatMvWJYg=;
  b=V6QjKksHcEy2Br1Er2GjukL1eHYqmnnp3iZnG47YMvfUsgPCu2b73njX
   mersdAUI2aBzTvlQxl/O6AUc1Gpi7xREJqVF5Hr9KbYYmuWXs136XssYg
   ioi38nJV5C9/sMj11qYMJX4XFBDnywd6fRrG3sZXY9rCDxBFK2cwlrGA5
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9rgqLsVmHgfwkpjldBx0kGqaR1UHeCtVL1Zg8Z8XKV5FVgkcRTGIm5gz4IyAl+77bM55hegEMr
 JuuCb46Rv3YrTgDWsPWq5H0+3N9e9n/M1YzwfQaQY5bHKkSyIIvdgNeeJajPQa8NCeZHtEY5tD
 nNI7DjjEoKk9nqX8avbxtRqdfr9LDkLHxQXQfP7D9P5jh+irT6uOG4vOBrQ8SicUcf1dEq2kkP
 4pTNzKjT3m9vUr+Jb4rvEPEbrzZtgFkdmWfXHiHVq+aakfmvA2+R7+284AzKEyOmiEyQXMQmSA
 Ogo=
X-SBRS: 2.5
X-MesageID: 28894422
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,371,1596513600"; 
   d="scan'208";a="28894422"
Date: Tue, 13 Oct 2020 16:08:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <pdurrant@amazon.com>
Subject: Re: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
Message-ID: <20201013140820.GP19254@Air-de-Roger>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-2-roger.pau@citrix.com>
 <bafcd30e-f75b-79c8-2424-6a63cb0b96d4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <bafcd30e-f75b-79c8-2424-6a63cb0b96d4@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Fri, Oct 02, 2020 at 10:48:07AM +0200, Jan Beulich wrote:
> On 30.09.2020 12:40, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
> >  
> >  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
> >  {
> > -    struct vcpu *v = vlapic_vcpu(vlapic);
> > -    struct domain *d = v->domain;
> > -
> >      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> > -        vioapic_update_EOI(d, vector);
> > +        vioapic_update_EOI(vector);
> >  
> > -    hvm_dpci_msi_eoi(d, vector);
> > +    hvm_dpci_msi_eoi(vector);
> >  }
> 
> What about viridian_synic_wrmsr() -> vlapic_EOI_set() ->
> vlapic_handle_EOI()? You'd probably have noticed this if you
> had tried to (consistently) drop the respective parameters from
> the intermediate functions as well.
> 
> Question of course is in how far viridian_synic_wrmsr() for
> HV_X64_MSR_EOI makes much sense when v != current. Paul, Wei?

There's already an assert at the top of viridian_synic_wrmsr of v ==
current, which I assume is why I thought this change was fine. I can
purge the passing of v (current) further, but it wasn't really needed
for the rest of the series.

> A secondary question of course is whether passing around the
> pointers isn't really cheaper than the obtaining of 'current'.

Well, while there's indeed a performance aspect here, I think
using current is much clearer than passing a vcpu around. I could
rename the parameter to curr or some such, but I think using
current and not passing a vcpu parameter is clearer.

Thanks, Roger.

