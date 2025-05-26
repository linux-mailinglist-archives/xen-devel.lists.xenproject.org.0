Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA385AC44CB
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 23:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997834.1378657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJfPr-0008NB-0Z; Mon, 26 May 2025 21:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997834.1378657; Mon, 26 May 2025 21:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJfPq-0008Lk-U2; Mon, 26 May 2025 21:31:26 +0000
Received: by outflank-mailman (input) for mailman id 997834;
 Mon, 26 May 2025 21:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RhM=YK=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1uJfPo-0008Le-LA
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 21:31:24 +0000
Received: from chassiron.antioche.eu.org (chassiron.antioche.eu.org
 [2001:41d0:fc2c:4d01::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c54ff169-3a78-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 23:31:23 +0200 (CEST)
Received: from rochebonne.antioche.eu.org
 ([IPv6:2001:41d0:fc2c:4d00:96de:80ff:fe21:bec0])
 by chassiron.antioche.eu.org (8.18.1/8.16.1) with ESMTP id 54QLV8Rn013208;
 Mon, 26 May 2025 23:31:08 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id D42BF1A4D0; Mon, 26 May 2025 23:30:33 +0200 (CEST)
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
X-Inumbo-ID: c54ff169-3a78-11f0-a2fb-13f23c93f187
Date: Mon, 26 May 2025 23:30:33 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen 4.18.5 PV dbregs fail
Message-ID: <aDTdeWV-hbIp4b-H@antioche.eu.org>
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
 <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
 <aDS27G05bJvSyd5o@antioche.eu.org>
 <0733f3dc-9f01-4e15-98ab-d7fd7c3e303d@citrix.com>
 <aDTLdL4irrkTLxje@antioche.eu.org>
 <ec1fa3bd-303a-49d2-95cb-2f873c66a7b1@citrix.com>
 <aDTVicaEm30HWHF6@antioche.eu.org>
 <aDTY0haMmVi497sh@antioche.eu.org>
 <11ea8686-ac41-44b5-8271-408c775c776a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11ea8686-ac41-44b5-8271-408c775c776a@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (chassiron.antioche.eu.org [IPv6:2001:41d0:fc2c:4d00:a00:20ff:fe1c:276e]); Mon, 26 May 2025 23:31:08 +0200 (MEST)

On Mon, May 26, 2025 at 10:17:06PM +0100, Andrew Cooper wrote:
> On 26/05/2025 10:10 pm, Manuel Bouyer wrote:
> > On Mon, May 26, 2025 at 10:56:41PM +0200, Manuel Bouyer wrote:
> >> On Mon, May 26, 2025 at 09:30:53PM +0100, Andrew Cooper wrote:
> >>> On 26/05/2025 9:13 pm, Manuel Bouyer wrote:
> >>>> On Mon, May 26, 2025 at 07:50:14PM +0100, Andrew Cooper wrote:
> >>>>> [...]
> >>>>> Well, that range does include the aforementioned commit.
> >>>>>
> >>>>> Can you bisect around d32c77f471fb8400b6512c171a14cdd58f04f0a3 which is
> >>>>> the backport of ^ in 4.18 ?
> >>>> Sure,
> >>>> with 0d5f15e and d32c77f the test pass, with cecee35 it fails.
> >>>>
> >>> Oh interesting, so the basic forwarding of #DB back into a guest
> >>> (d32c77f) works fine, but the changes to emulated debug exceptions
> >>> (cecee35) break.
> >>>
> >>> Anyway, I think I've spotted a logical error.  We do indeed end up
> >>> calling x86_merge_dr6() twice, because of the TODO just out of context. 
> >>> Does this help?
> >> Yes, it works for cecee35; now testing with 4.18.5
> > yes, it works with 4.18.5 too. All dbreg-related tests now pass again
> > thanks !
> >
> 
> Sorry I screwed it up so badly, and apparently also my own testing...
> 
> May I take that as a Tested-by tag on the patch then?

Sure

> 
> I'll get the fix merged once it's been reviewed, but 4.18 is in
> security-only support right now and is unlikely to get this as a backport.
> 
> Are you able to take the patch logically for NetBSD?

Yes, I can add it to pkgsrc, no problem.

I need to package 4.20 too ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

