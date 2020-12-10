Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA92D62E9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 18:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49627.87765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPLt-0007uy-Ns; Thu, 10 Dec 2020 17:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49627.87765; Thu, 10 Dec 2020 17:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knPLt-0007uc-Kl; Thu, 10 Dec 2020 17:03:37 +0000
Received: by outflank-mailman (input) for mailman id 49627;
 Thu, 10 Dec 2020 17:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oBdS=FO=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1knPLs-0007uQ-4Z
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 17:03:36 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f1fba60-e35e-4e97-9cb2-02710a4af8a0;
 Thu, 10 Dec 2020 17:03:33 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0BAH3PYb016977
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 18:03:26 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id EA5A42E9383; Thu, 10 Dec 2020 18:03:19 +0100 (MET)
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
X-Inumbo-ID: 6f1fba60-e35e-4e97-9cb2-02710a4af8a0
Date: Thu, 10 Dec 2020 18:03:19 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201210170319.GG455@antioche.eu.org>
References: <20201209135908.GA4269@antioche.eu.org>
 <c612616a-3fcd-be93-7594-20c0c3b71b7a@citrix.com>
 <20201209154431.GA4913@antioche.eu.org>
 <52e1b10d-75d4-63ac-f91e-cb8f0dcca493@citrix.com>
 <20201209163049.GA6158@antioche.eu.org>
 <30a71c9d-3eff-3727-9c61-e387b5bccc95@citrix.com>
 <20201209185714.GS1469@antioche.eu.org>
 <6c06abf1-7efe-f02c-536a-337a2704e265@citrix.com>
 <20201210095139.GA455@antioche.eu.org>
 <4c3bff12-821b-83fb-e054-61b07b97fa70@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c3bff12-821b-83fb-e054-61b07b97fa70@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 10 Dec 2020 18:03:26 +0100 (MET)

On Thu, Dec 10, 2020 at 03:51:46PM +0000, Andrew Cooper wrote:
> > [   7.6617663] cs 0x47  ds 0x23  es 0x23  fs 0000  gs 0000  ss 0x3f
> > [   7.7345663] fsbase 000000000000000000 gsbase 000000000000000000
> >
> > so it looks like something resets %fs to 0 ...
> >
> > Anyway the fault address 0xffffbd800000a040 is in the hypervisor's range,
> > isn't it ?
> 
> No.  Its the kernel's LDT.  From previous debugging:
> > (XEN) %cr2 ffff820000010040, LDT base ffffbd000000a000, limit 0057
> 
> LDT handling in Xen is a bit complicated.  To maintain host safety, we
> must map it into Xen's range, and we explicitly support a PV guest doing
> on-demand mapping of the LDT.  (This pertains to the experimental
> Windows XP PV support which never made it beyond a prototype.  Windows
> can page out the LDT.)  Either way, we lazily map the LDT frames on
> first use.
> 
> So %cr2 is the real hardware faulting address, and is in the Xen range. 
> We spot that it is an LDT access, and try to lazily map the frame (at
> LDT base), but find that the kernel's virtual address mapping
> 0xffffbd000000a000 is not present (the gl1e printk).
> 
> Therefore, we pass #PF to the guest kernel, adjusting vCR2 to what would
> have happened had Xen not mapped the real LDT elsewhere, which is
> expected to cause the guest kernel to do whatever demand mapping is
> necessary to pull the LDT back in.
> 
> 
> I suppose it is worth taking a step back and ascertaining how exactly
> NetBSD handles (or, should be handling) the LDT.
> 
> Do you mind elaborating on how it is supposed to work?

Note that I'm not familiar with this selector stuff; and I usually get
it wrong the first time I go back to it.

AFAIK, in the Xen PV case, a page is allocated an mapped in kernel
space, and registered to Xen with MMUEXT_SET_LDT.
From what I found, in the common case the LDT is the same for all processes.
Does it make sense ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

