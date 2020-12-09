Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A42D3FB3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 11:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48089.85073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmwVI-0005t6-U6; Wed, 09 Dec 2020 10:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48089.85073; Wed, 09 Dec 2020 10:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmwVI-0005sh-RD; Wed, 09 Dec 2020 10:15:24 +0000
Received: by outflank-mailman (input) for mailman id 48089;
 Wed, 09 Dec 2020 10:15:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdhY=FN=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kmwVH-0005sc-Rn
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 10:15:23 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a19bfb3-1449-46c5-abf3-6a32558b0c5f;
 Wed, 09 Dec 2020 10:15:22 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0B9AFHiF026674
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 11:15:18 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id A99752E93A2; Wed,  9 Dec 2020 11:15:12 +0100 (MET)
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
X-Inumbo-ID: 9a19bfb3-1449-46c5-abf3-6a32558b0c5f
Date: Wed, 9 Dec 2020 11:15:12 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PV looping on search_pre_exception_table()
Message-ID: <20201209101512.GA1299@antioche.eu.org>
References: <20201208175738.GA3390@antioche.eu.org>
 <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e73cc71d-c1a6-87c8-1b82-5d70d4f52eaa@citrix.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 09 Dec 2020 11:15:18 +0100 (MET)

On Tue, Dec 08, 2020 at 06:13:46PM +0000, Andrew Cooper wrote:
> On 08/12/2020 17:57, Manuel Bouyer wrote:
> > Hello,
> > for the first time I tried to boot a xen kernel from devel with
> > a NetBSD PV dom0. The kernel boots, but when the first userland prcess
> > is launched, it seems to enter a loop involving search_pre_exception_table()
> > (I see an endless stream from the dprintk() at arch/x86/extable.c:202)
> >
> > With xen 4.13 I see it, but exactly once:
> > (XEN) extable.c:202: Pre-exception: ffff82d08038c304 -> ffff82d08038c8c8
> >
> > with devel:
> > (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> > (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> > (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> > (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> > (XEN) extable.c:202: Pre-exception: ffff82d040393309 -> ffff82d0403938c8        
> > [...]
> >
> > the dom0 kernel is the same.
> >
> > At first glance it looks like a fault in the guest is not handled at it should,
> > and the userland process keeps faulting on the same address.
> >
> > Any idea what to look at ?
> 
> That is a reoccurring fault on IRET back to guest context, and is
> probably caused by some unwise-in-hindsight cleanup which doesn't
> escalate the failure to the failsafe callback.
> 
> This ought to give something useful to debug with:

thanks, I got:
(XEN) IRET fault: #PF[0000]                                                 
(XEN) domain_crash called from extable.c:209                                
(XEN) Domain 0 (vcpu#0) crashed on cpu#0:                                   
(XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----       
(XEN) CPU:    0                                                             
(XEN) RIP:    0047:[<00007f7e184007d0>]                                     
(XEN) RFLAGS: 0000000000000202   EM: 0   CONTEXT: pv guest (d0v0)           
(XEN) rax: ffff82d04038c309   rbx: 0000000000000000   rcx: 000000000000e008 
(XEN) rdx: 0000000000010086   rsi: ffff83007fcb7f78   rdi: 000000000000e010 
(XEN) rbp: 0000000000000000   rsp: 00007f7fff53e3e0   r8:  0000000e00000000 
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000 
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000 
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000002660 
(XEN) cr3: 0000000079cdb000   cr2: 00007f7fff53e3e0                         
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: ffffffff80cf2dc0    
(XEN) ds: 0023   es: 0023   fs: 0000   gs: 0000   ss: 003f   cs: 0047       
(XEN) Guest stack trace from rsp=00007f7fff53e3e0:          
(XEN)    0000000000000001 00007f7fff53e8f8 0000000000000000 0000000000000000
(XEN)    0000000000000003 000000004b600040 0000000000000004 0000000000000038
(XEN)    0000000000000005 0000000000000008 0000000000000006 0000000000001000
(XEN)    0000000000000007 00007f7e18400000 0000000000000008 0000000000000000
(XEN)    0000000000000009 000000004b601cd0 00000000000007d0 0000000000000000
(XEN)    00000000000007d1 0000000000000000 00000000000007d2 0000000000000000
(XEN)    00000000000007d3 0000000000000000 000000000000000d 00007f7fff53f000
(XEN)    00000000000007de 00007f7fff53e4e0 0000000000000000 0000000000000000
(XEN)    6e692f6e6962732f 0000000000007469 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

