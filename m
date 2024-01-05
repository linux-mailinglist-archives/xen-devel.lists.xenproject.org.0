Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FD82513A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 10:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662049.1031975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLgsB-0008MP-Ur; Fri, 05 Jan 2024 09:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662049.1031975; Fri, 05 Jan 2024 09:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLgsB-0008KV-SD; Fri, 05 Jan 2024 09:52:15 +0000
Received: by outflank-mailman (input) for mailman id 662049;
 Fri, 05 Jan 2024 09:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Pm0=IP=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1rLgsA-0008KP-KW
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 09:52:14 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk
 (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c3cb3a-abb0-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 10:52:11 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1rLgs7-00C7TE-Dg;
 Fri, 05 Jan 2024 09:52:11 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 3E2D88F7761;
 Fri,  5 Jan 2024 09:52:10 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRi9pq5r9c3B; Fri,  5 Jan 2024 09:52:10 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 1235B8F775E;
 Fri,  5 Jan 2024 09:52:10 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 0070D21C; Fri,  5 Jan 2024 09:52:09 +0000 (GMT)
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
X-Inumbo-ID: 18c3cb3a-abb0-11ee-9b0f-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Fri, 5 Jan 2024 09:52:09 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: James Dingwall <james-xen@dingwall.me.uk>,
	xen-devel@lists.xenproject.org
Subject: Re: XSA-446 relevance on Intel
Message-ID: <ZZfRSU7mXCmmXCXI@dingwall.me.uk>
References: <ZXgrQdVvDuQCbCRP@dingwall.me.uk>
 <f4c7141c-5f37-4366-890c-ab8b86b6f5dd@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4c7141c-5f37-4366-890c-ab8b86b6f5dd@citrix.com>
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

On Tue, Dec 12, 2023 at 10:56:48AM +0000, Andrew Cooper wrote:
> On 12/12/2023 9:43 am, James Dingwall wrote:
> > Hi,
> >
> > We were experiencing a crash during PV domU boot on several different models
> > of hardware but all with Intel CPUs.  The Xen version was based on stable-4.15
> > at 4a4daf6bddbe8a741329df5cc8768f7dec664aed (XSA-444) with some local
> > patches.  Since updating the branch to b918c4cdc7ab2c1c9e9a9b54fa9d9c595913e028
> > (XSA-446) we have not observed the same crash.
> 
> That range covers:
> 
> 1f5f515da0f6 - iommu/amd-vi: use correct level for quarantine domain
> page tables
> b918c4cdc7ab - x86/spec-ctrl: Remove conditional IRQs-on-ness for INT
> $0x80/0x82 paths
> 
> so yeah - not much in the way of change.
> 
> > The occurrence was on 1-2% of boots and we couldn't determine a particular
> > sequence of events that would trigger it.  The kernel is based on Ubuntu's
> > 5.15.0-91 tag but we also observed the same with -85.  Due to the low
> > frequency it is possible that we simply haven't observed it again since
> > updating our Xen build.
> >
> > If I have followed the early startup this is happening shortly after detection
> > of possible CPU vulnerabilities and patching in alternative instructions.  As
> > the RIP was native_irq_return_iret and XSA-446 related to interupt management
> > I wondered if it was possible that despite "Xen is not believed to be vulnerable
> > in default configurations on CPUs from other hardware vendors." there could
> > be some conditions in which an Intel CPU is affected?
> 
> In short, XSA-446 isn't plausibly related.  It's completely internal to
> Xen, with no alteration on guest state.
> 
> It is an error that Linux has ended up in native_irq_return_iret.  Linux
> cannot return to itself with an IRET instruction, and must use
> HYPERCALL_iret instead.
> 
> In recent versions of Linux, this is fixed up as about the earliest
> action a PV kernel takes, but on older versions of Linux, any
> interrupt/exception early enough on boot was fatal in this way.
> 
> 
> This part of the backtrace is odd:
> 
> [    0.398962]  ? native_iret+0x7/0x7
> [    0.398967]  ? insn_decode+0x79/0x100
> [    0.398975]  ? insn_decode+0xcf/0x100
> [    0.398980]  optimize_nops+0x68/0x150
> 
> as it's not clear how we've ended up in a case wanting to return back to
> the kernel to begin with.  However, it's most likely a pagefault, as
> optimize_nops() is making changes in arbitrary locations.
> 
> It is possible that a change in visible features has altered the
> behaviour enough not to crash, but if everything is still the same as
> far as you can tell, then it's likely just chance that you haven't seen
> it again.
> 
> This is definitely a Linux bug, so I suspect something bad has been
> backported into Ubuntu.
> 
> ~Andrew

Thanks for the response.  I had a look at the more recent kernels and managed
to backport "x86/entry,xen: Early rewrite of restore_regs_and_return_to_kernel()"
without too much trouble.  It may still be a coincidence that we haven't
encountered the problem but it seems to have gone away for now. 

Regards,
James

