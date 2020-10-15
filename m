Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4D28F0AD
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 13:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7270.18960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT189-0000pp-7V; Thu, 15 Oct 2020 11:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7270.18960; Thu, 15 Oct 2020 11:09:09 +0000
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
	id 1kT189-0000pU-4U; Thu, 15 Oct 2020 11:09:09 +0000
Received: by outflank-mailman (input) for mailman id 7270;
 Thu, 15 Oct 2020 11:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT187-0000pP-D8
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 11:09:07 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b9ab786-98cb-4ec4-bd16-c2df515ec375;
 Thu, 15 Oct 2020 11:09:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT187-0000pP-D8
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 11:09:07 +0000
X-Inumbo-ID: 1b9ab786-98cb-4ec4-bd16-c2df515ec375
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1b9ab786-98cb-4ec4-bd16-c2df515ec375;
	Thu, 15 Oct 2020 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602760145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qb/JYNgkIUuqBKtbKYSFf0NW8wtcCFfcuRBYldFJnOM=;
  b=Z665HW78ZN966JuFm8lhv72cgkhFuQCdB2YzkgGOEuy7qweahq5Qyck3
   WO9G/5syCtDSmhZozKJK2RcF3eAGpRMvFFgxgoUHeQcAqB8JiyxZliPHT
   X58sPUPIsE4CzK+ApTPyMDZ+YunS97w8Md0ApTgf2td7WtL/yA9onqa9N
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SF8DQ8roVFA1JEZRIUkOaBBj7ruw/HnVxSo7hJJpchqbQxrDLtBMVVk2VeuSJCz/bmRFgHwZtD
 J8fyO+S5JviaBlplwc4cAKCEcXK5iXffZve5nYFk2eJN2dIr4mFr4gzwDR8wxBQwlwwUa9jnrC
 WRiM0+RHPoy+m+jTk1rIU57wcjXC5aO9PWVXZtgLe88YK4YGzb7ruIXLa7x78Fd/HhdehmnzJZ
 lFr9ZRZ8TRGut61o+xmxv1h6Mw0uLXprRWnOg2Lr8qwYeGhPjlRiKpv7SBpjzL9Omvxlx93CSI
 a9o=
X-SBRS: 2.5
X-MesageID: 30105623
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,378,1596513600"; 
   d="scan'208";a="30105623"
Date: Thu, 15 Oct 2020 13:08:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/msr: handle IA32_THERM_STATUS
Message-ID: <20201015110857.GC67506@Air-de-Roger>
References: <20201007102032.98565-1-roger.pau@citrix.com>
 <1e694350-4665-a1e7-20a4-f68cbee34dd1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1e694350-4665-a1e7-20a4-f68cbee34dd1@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 14, 2020 at 02:17:15PM +0200, Jan Beulich wrote:
> On 07.10.2020 12:20, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -253,6 +253,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >              break;
> >          goto gp_fault;
> >  
> > +    case MSR_IA32_THERM_STATUS:
> > +        if ( cp->x86_vendor != X86_VENDOR_INTEL )
> > +            goto gp_fault;
> > +        *val = 0;
> > +        break;
> 
> I've been puzzled while applying this: The upper patch context doesn't
> match what's been in master for about the last month, and hence I
> wonder what version of the tree you created this patch against. In any
> event please double check that I didn't screw it up.

I had this applied on top of:

https://lore.kernel.org/xen-devel/20201006162327.93055-1-roger.pau@citrix.com/

Which I will reply to now because I'm not sure how to proceed there.

Thanks for fixing the context and applied.

Roger.

