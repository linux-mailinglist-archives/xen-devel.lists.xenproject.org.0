Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523BFAC4392
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 19:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997682.1378499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJc6b-0008GW-CB; Mon, 26 May 2025 17:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997682.1378499; Mon, 26 May 2025 17:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJc6b-0008E7-91; Mon, 26 May 2025 17:59:21 +0000
Received: by outflank-mailman (input) for mailman id 997682;
 Mon, 26 May 2025 17:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RhM=YK=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1uJc6a-0008E1-5x
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 17:59:20 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22209aa1-3a5b-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 19:59:14 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 54QHxCjA008740
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 19:59:13 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 54QHxC4p025064
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 19:59:12 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 18E531038E; Mon, 26 May 2025 19:59:14 +0200 (CEST)
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
X-Inumbo-ID: 22209aa1-3a5b-11f0-b893-0df219b8e170
Date: Mon, 26 May 2025 19:59:14 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: Xen 4.18.5 PV dbregs fail
Message-ID: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Mon, 26 May 2025 19:59:13 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2

Hello,
since I updated to Xen 4.18.5 (from 4.18.4), NetBSD's dbregs-related tests
are failing. Only for PV; PVH and HVM guests are fine. They are
failing for both 32bits and 64bits guests.

I tracked it down to dr6 being 0xffff0ff0 after the trace trap, when at
last one of the lower bits should be 1 (I think it's bit 0, from the code).

I looked at the commit log between 4.18.4 and 4.18.5 but didn't see
anything obvious.

Any idea ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

