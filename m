Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A041FF3A7
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 15:49:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jluuS-0005Ww-HV; Thu, 18 Jun 2020 13:48:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jluuQ-0005Wr-TI
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 13:48:50 +0000
X-Inumbo-ID: 6fe14b9c-b16a-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fe14b9c-b16a-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 13:48:49 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eXVrxiEZY1DNXvLGo3rlCYCDtQny+I3gKjdm4UkjXcR468D+HNe87PXVRpSVYmasUNYbNRhAJT
 YSLiSBcJyBpGBhozGgbXbCNZ4ovZ7YKmLiczsKd/sVHDOVF85O6ex502EqLPdEktsDvigFD9Wx
 bM2pOi4+e5bUqaSppZj/gGVc5SnrblMdnax50kdz5CJBI8wnUqkCokYst0IIjZMSHzY03H/i6A
 oxEVskuE9plik12RbD3ql01VRssoVDpxjRD4ZRrZXwoKUEjeta/Pfc9nD9ctj69K7ATiBkHPMS
 3hw=
X-SBRS: 2.7
X-MesageID: 20372001
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20372001"
Date: Thu, 18 Jun 2020 15:48:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 2/8] x86/hvm: don't force vCPU 0 for IRQ 0 when
 using fixed destination mode
Message-ID: <20200618134841.GQ735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-3-roger.pau@citrix.com>
 <ac179f79-3b40-9ff3-9437-16a30e019813@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac179f79-3b40-9ff3-9437-16a30e019813@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 03:43:00PM +0200, Jan Beulich wrote:
> On 12.06.2020 17:56, Roger Pau Monne wrote:
> > When the IO APIC pin mapped to the ISA IRQ 0 has been configured to
> > use fixed delivery mode do not forcefully route interrupts to vCPU 0,
> > as the OS might have setup those interrupts to be injected to a
> > different vCPU, and injecting to vCPU 0 can cause the OS to miss such
> > interrupts or errors to happen due to unexpected vectors being
> > injected on vCPU 0.
> > 
> > In order to fix remove such handling altogether for fixed destination
> > mode pins and just inject them according to the data setup in the
> > IO-APIC entry.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Technically
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I wonder though why this was done in the first place - it very much
> feels like a workaround for certain guest behavior, and hence
> getting rid of it may mean a certain risk of regressions. Not a
> very good point in time to make risky changes ...

We can defer to after the release I guess, but I will still ask for
the changes to be backported.

What we currently do is broken, up to the point that FreeBSD cannot
use the PIT because it will likely route the interrupt to a vCPU != 0
in fixed mode, and then it will just get stuck because the vector is
delivered to vCPU 0 where it's not even configured.

Roger.

