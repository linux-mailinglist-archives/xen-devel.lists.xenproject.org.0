Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A726DAC4494
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 22:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997808.1378626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJess-0002Hj-7i; Mon, 26 May 2025 20:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997808.1378626; Mon, 26 May 2025 20:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJess-0002GI-4z; Mon, 26 May 2025 20:57:22 +0000
Received: by outflank-mailman (input) for mailman id 997808;
 Mon, 26 May 2025 20:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RhM=YK=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1uJesq-0002GC-Sv
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 20:57:20 +0000
Received: from chassiron.antioche.eu.org (chassiron.antioche.eu.org
 [2001:41d0:fc2c:4d01::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02df9a39-3a74-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 22:57:19 +0200 (CEST)
Received: from rochebonne.antioche.eu.org
 ([IPv6:2001:41d0:fc2c:4d00:96de:80ff:fe21:bec0])
 by chassiron.antioche.eu.org (8.18.1/8.16.1) with ESMTP id 54QKvGBN014557;
 Mon, 26 May 2025 22:57:16 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 470451A4D0; Mon, 26 May 2025 22:56:41 +0200 (CEST)
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
X-Inumbo-ID: 02df9a39-3a74-11f0-b893-0df219b8e170
Date: Mon, 26 May 2025 22:56:41 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen 4.18.5 PV dbregs fail
Message-ID: <aDTVicaEm30HWHF6@antioche.eu.org>
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
 <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
 <aDS27G05bJvSyd5o@antioche.eu.org>
 <0733f3dc-9f01-4e15-98ab-d7fd7c3e303d@citrix.com>
 <aDTLdL4irrkTLxje@antioche.eu.org>
 <ec1fa3bd-303a-49d2-95cb-2f873c66a7b1@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec1fa3bd-303a-49d2-95cb-2f873c66a7b1@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (chassiron.antioche.eu.org [IPv6:2001:41d0:fc2c:4d01:0:0:0:1]); Mon, 26 May 2025 22:57:16 +0200 (MEST)

On Mon, May 26, 2025 at 09:30:53PM +0100, Andrew Cooper wrote:
> On 26/05/2025 9:13 pm, Manuel Bouyer wrote:
> > On Mon, May 26, 2025 at 07:50:14PM +0100, Andrew Cooper wrote:
> >> [...]
> >> Well, that range does include the aforementioned commit.
> >>
> >> Can you bisect around d32c77f471fb8400b6512c171a14cdd58f04f0a3 which is
> >> the backport of ^ in 4.18 ?
> > Sure,
> > with 0d5f15e and d32c77f the test pass, with cecee35 it fails.
> >
> 
> Oh interesting, so the basic forwarding of #DB back into a guest
> (d32c77f) works fine, but the changes to emulated debug exceptions
> (cecee35) break.
> 
> Anyway, I think I've spotted a logical error.  We do indeed end up
> calling x86_merge_dr6() twice, because of the TODO just out of context. 
> Does this help?

Yes, it works for cecee35; now testing with 4.18.5

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

