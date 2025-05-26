Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28EDAC43E4
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 20:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997725.1378542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJclp-0008Ga-65; Mon, 26 May 2025 18:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997725.1378542; Mon, 26 May 2025 18:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJclp-0008EW-3A; Mon, 26 May 2025 18:41:57 +0000
Received: by outflank-mailman (input) for mailman id 997725;
 Mon, 26 May 2025 18:41:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RhM=YK=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1uJclo-0008EO-BI
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 18:41:56 +0000
Received: from chassiron.antioche.eu.org (chassiron.antioche.eu.org
 [2001:41d0:fc2c:4d01::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 173484b9-3a61-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 20:41:53 +0200 (CEST)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.18.1/8.16.1) with ESMTP id 54QIfpR1004279;
 Mon, 26 May 2025 20:41:51 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 4BDD31A4D0; Mon, 26 May 2025 20:41:16 +0200 (CEST)
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
X-Inumbo-ID: 173484b9-3a61-11f0-a2fb-13f23c93f187
Date: Mon, 26 May 2025 20:41:16 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen 4.18.5 PV dbregs fail
Message-ID: <aDS1zFVsbHTgEZ50@antioche.eu.org>
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (chassiron.antioche.eu.org [109.190.99.82]); Mon, 26 May 2025 20:41:51 +0200 (MEST)

On Mon, May 26, 2025 at 07:06:04PM +0100, Andrew Cooper wrote:
> On 26/05/2025 6:59 pm, Manuel Bouyer wrote:
> > Hello,
> > since I updated to Xen 4.18.5 (from 4.18.4), NetBSD's dbregs-related tests
> > are failing. Only for PV; PVH and HVM guests are fine. They are
> > failing for both 32bits and 64bits guests.
> >
> > I tracked it down to dr6 being 0xffff0ff0 after the trace trap, when at
> > last one of the lower bits should be 1 (I think it's bit 0, from the code).
> >
> > I looked at the commit log between 4.18.4 and 4.18.5 but didn't see
> > anything obvious.
> >
> > Any idea ?
> >
> 
> Have you got a link to the test in question?

For example, dbregs_dr0_trap_code in 
https://cvsweb.netbsd.org/bsdweb.cgi/src/tests/lib/libc/sys/t_ptrace_x86_wait.h?rev=1.33;content-type=text%2Fplain

What's failing is
	ATF_REQUIRE_EQ(info.psi_siginfo.si_code, TRAP_DBREG);

I added printfs in the kernel to show the debug registers when
the process traps, this is where the 0xffff0ff0 value comes from.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

