Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA32D4993
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48661.86073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4eX-0005mv-8z; Wed, 09 Dec 2020 18:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48661.86073; Wed, 09 Dec 2020 18:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4eX-0005mW-5M; Wed, 09 Dec 2020 18:57:29 +0000
Received: by outflank-mailman (input) for mailman id 48661;
 Wed, 09 Dec 2020 18:57:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdhY=FN=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kn4eV-0005mR-RC
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 18:57:27 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47a305cb-98f8-44d9-9b34-ad0dc326ae89;
 Wed, 09 Dec 2020 18:57:25 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0B9IvJl1009568
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 19:57:20 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 2FC9C2E946C; Wed,  9 Dec 2020 19:57:14 +0100 (MET)
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
X-Inumbo-ID: 47a305cb-98f8-44d9-9b34-ad0dc326ae89
Date: Wed, 9 Dec 2020 19:57:14 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201209185714.GS1469@antioche.eu.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
 <20201209101512.GA1299@antioche.eu.org>
 <3f7e50bb-24ad-1e32-9ea1-ba87007d3796@citrix.com>
 <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 09 Dec 2020 19:57:20 +0100 (MET)

On Wed, Dec 09, 2020 at 06:08:53PM +0000, Andrew Cooper wrote:
> On 09/12/2020 16:30, Manuel Bouyer wrote:
> > On Wed, Dec 09, 2020 at 04:00:02PM +0000, Andrew Cooper wrote:
> >> [...]
> >>>> I wonder if the LDT is set up correctly.
> >>> I guess it is, otherwise it wouldn't boot with a Xen 4.13 kernel, isn't it ?
> >> Well - you said you always saw it once on 4.13, which clearly shows that
> >> something was wonky, but it managed to unblock itself.
> >>
> >>>> How about this incremental delta?
> >>> Here's the output
> >>> (XEN) IRET fault: #PF[0000]                                                    
> >>> (XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
> >>> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
> >>> (XEN) IRET fault: #PF[0000]                                                    
> >>> (XEN) %cr2 ffff820000010040, LDT base ffffc4800000a000, limit 0057             
> >>> (XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  
> >>> (XEN) IRET fault: #PF[0000]                                                 
> >> Ok, so the promotion definitely fails, but we don't get as far as
> >> inspecting the content of the LDT frame.  This probably means it failed
> >> to change the page type, which probably means there are still
> >> outstanding writeable references.
> >>
> >> I'm expecting the final printk to be the one which triggers.
> > It's not. 
> > Here's the output:
> > (XEN) IRET fault: #PF[0000]
> > (XEN) %cr2 ffff820000010040, LDT base ffffbd000000a000, limit 0057
> > (XEN) *** LDT: gl1e 0000000000000000 not present
> > (XEN) *** pv_map_ldt_shadow_page(0x40) failed
> > (XEN) IRET fault: #PF[0000]
> > (XEN) %cr2 ffff820000010040, LDT base ffffbd000000a000, limit 0057
> > (XEN) *** LDT: gl1e 0000000000000000 not present
> > (XEN) *** pv_map_ldt_shadow_page(0x40) failed
> 
> Ok.  So the mapping registered for the LDT is not yet present.  Xen
> should be raising #PF with the guest, and would be in every case other
> than the weird context on IRET, where we've confused bad guest state
> with bad hypervisor state.

Unfortunably it doesn't fix the problem. I'm now getting a loop of
(XEN) *** LDT: gl1e 0000000000000000 not present                               
(XEN) *** pv_map_ldt_shadow_page(0x40) failed                                  

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

