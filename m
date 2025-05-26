Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7117AC43EB
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 20:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997746.1378563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcqS-0000zW-14; Mon, 26 May 2025 18:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997746.1378563; Mon, 26 May 2025 18:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJcqR-0000y4-UN; Mon, 26 May 2025 18:46:43 +0000
Received: by outflank-mailman (input) for mailman id 997746;
 Mon, 26 May 2025 18:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RhM=YK=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1uJcqQ-0000xh-7p
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 18:46:42 +0000
Received: from chassiron.antioche.eu.org (chassiron.antioche.eu.org
 [2001:41d0:fc2c:4d01::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c27e8e8c-3a61-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 20:46:40 +0200 (CEST)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.18.1/8.16.1) with ESMTP id 54QIkcGX017645;
 Mon, 26 May 2025 20:46:38 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 3E33D1A4D0; Mon, 26 May 2025 20:46:04 +0200 (CEST)
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
X-Inumbo-ID: c27e8e8c-3a61-11f0-b893-0df219b8e170
Date: Mon, 26 May 2025 20:46:04 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen 4.18.5 PV dbregs fail
Message-ID: <aDS27G05bJvSyd5o@antioche.eu.org>
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
 <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (chassiron.antioche.eu.org [109.190.99.82]); Mon, 26 May 2025 20:46:39 +0200 (MEST)

On Mon, May 26, 2025 at 07:17:13PM +0100, Andrew Cooper wrote:
> On 26/05/2025 7:06 pm, Andrew Cooper wrote:
> > On 26/05/2025 6:59 pm, Manuel Bouyer wrote:
> >> Hello,
> >> since I updated to Xen 4.18.5 (from 4.18.4), NetBSD's dbregs-related tests
> >> are failing. Only for PV; PVH and HVM guests are fine. They are
> >> failing for both 32bits and 64bits guests.
> >>
> >> I tracked it down to dr6 being 0xffff0ff0 after the trace trap, when at
> >> last one of the lower bits should be 1 (I think it's bit 0, from the code).
> >>
> >> I looked at the commit log between 4.18.4 and 4.18.5 but didn't see
> >> anything obvious.
> >>
> >> Any idea ?
> >>
> > Have you got a link to the test in question?
> >
> > We've had a couple of bugfixes in this area, although debug handling
> > isn't helped by the fact that both the SDM and APM are factually
> > incorrect on how to write a #DB handler (and the vendors are moving at a
> > glacial pace to correct them).
> 
> But yes, having looked between 4.18.4 and 4.18.5, I can't see anything
> relevant to debug handling either.
> 
> Judging from your description, it looks like a breakpoint is going missing.
> 
> The relevant recent change for that is
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=54ef601a66e8d812a6a6a308f02524e81201825e
> although it's a bit older than 4.18.4.

Well, my previous xen-debug.gz kernel is from Oct, 3 so it can't be
4.18.4, it's 4.18.3_20240909 which points to commit
bd51e573a730efc569646379cd59ccba967cde97

looks like I forgot to update this server. So I need to looks deeper in
the commit logs

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

