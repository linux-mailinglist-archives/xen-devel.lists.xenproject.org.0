Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F271DCA72
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 11:48:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbhnS-0005qU-8C; Thu, 21 May 2020 09:47:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6UB=7D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbhnQ-0005qO-UV
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 09:47:24 +0000
X-Inumbo-ID: 11949196-9b48-11ea-aaec-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11949196-9b48-11ea-aaec-12813bfff9fa;
 Thu, 21 May 2020 09:47:23 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: T9lQX/REEirGqbQZzQ6/9OzM3tXUks4W10u7PepyFJvggWXvRcoOoh1wMySRTWkhBmiKJ2yxg3
 m6HYmkDseFUzaMYVFDk3pTIwzgl9V4x6jCed+u3oE5BH2Tn0vfOPjWMbYbYPcRqK+iqdxRTGqK
 T/N3dKWEiF2YJr6g7m5aPo+iJI4Fe1ysuF5JxzefxARj++NNuN431aYB/fd5oM5lwYRZ52u+HB
 yRxeTh9ZfkrcScqmZqQ411VTOITFh9v0+jGuOLBZ3BnH0HEeo3/TFz8ORvHLtNmkX9kTbQYmdC
 Q3I=
X-SBRS: 2.7
X-MesageID: 18062843
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18062843"
Date: Thu, 21 May 2020 11:47:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5] x86: clear RDRAND CPUID bit on AMD family 15h/16h
Message-ID: <20200521094717.GQ54375@Air-de-Roger>
References: <4f76749b-54bd-7c39-6c90-279ce25cb57c@suse.com>
 <e2cf9d9e-492d-fa24-0e9c-bf62b6704b34@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2cf9d9e-492d-fa24-0e9c-bf62b6704b34@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 11:17:25PM +0100, Andrew Cooper wrote:
> On 18/05/2020 14:19, Jan Beulich wrote:
> > Inspired by Linux commit c49a0a80137c7ca7d6ced4c812c9e07a949f6f24:
> >
> >     There have been reports of RDRAND issues after resuming from suspend on
> >     some AMD family 15h and family 16h systems. This issue stems from a BIOS
> >     not performing the proper steps during resume to ensure RDRAND continues
> >     to function properly.
> >
> >     Update the CPU initialization to clear the RDRAND CPUID bit for any family
> >     15h and 16h processor that supports RDRAND. If it is known that the family
> >     15h or family 16h system does not have an RDRAND resume issue or that the
> >     system will not be placed in suspend, the "cpuid=rdrand" kernel parameter
> >     can be used to stop the clearing of the RDRAND CPUID bit.
> >
> >     Note, that clearing the RDRAND CPUID bit does not prevent a processor
> >     that normally supports the RDRAND instruction from executing it. So any
> >     code that determined the support based on family and model won't #UD.
> >
> > Warn if no explicit choice was given on affected hardware.
> >
> > Check RDRAND functions at boot as well as after S3 resume (the retry
> > limit chosen is entirely arbitrary).
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > ---
> > Still slightly RFC, and still in particular because of the change to
> > parse_xen_cpuid(): Alternative approach suggestions are welcome. But now
> > also because with many CPUs there may now be a lot of warnings in case
> > of issues.
> 
> It would still be nice if we could find a better way of determining
> whether S3 is supported on the platform, which would at least let us
> sort server and client platforms.
> 
> A straight string search for _S3 in the DSDT does look to be effective,
> on a sample of 5 boxes I've tried.

Hm, that's an interesting idea. There's also the _S3D device method
that could give a false positive? (ie: a device having a _S3D method
even when the DSDT doesn't have the _S3 method)

Roger.

