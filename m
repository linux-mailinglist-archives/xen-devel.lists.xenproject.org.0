Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2166044E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 17:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472807.733179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDpdw-0000ot-UO; Fri, 06 Jan 2023 16:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472807.733179; Fri, 06 Jan 2023 16:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDpdw-0000mX-R2; Fri, 06 Jan 2023 16:32:32 +0000
Received: by outflank-mailman (input) for mailman id 472807;
 Fri, 06 Jan 2023 16:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6IK=5D=citrix.com=prvs=36316be06=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pDpdu-0000mR-Rz
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 16:32:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3f7364a-8ddf-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 17:32:28 +0100 (CET)
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
X-Inumbo-ID: b3f7364a-8ddf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673022748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eavG7+hkgdUhfacVrhQ5HxWN5atkNNEzN09mWvS484E=;
  b=P/1rdWPpa2r4tjboEGibWw9MNNY16enMNewFQC+7X0+9eoEJnD/A7O9i
   hC+Dxx9E8nR7eYvdbbB+/7BcQ4K93U53KwVzEcn6cDmikOh075qIIOQxe
   OZCuRniiy6FSLCdcIMIeJv8nCGazurSbHqTgv3w/X/ex2amesnSIMkZ5d
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91538047
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8gv5T6+4bAVqRDvTvzLcDrUDHn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jQfWWDTbPqMN2akLdB/admy8RkPuJ/UmIAySgFpryA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AdmPKgV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkf7
 uECcmFSZSualsu/ybK2d7Rnn98aeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQMwx3I/
 j6Zl4j/KhUbHYGvmRydzjW1n+7QrR/KSIkDO5Tto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ8/jclqKk5/02sZtb4Vhy85nWDu3Y0XtNKGOp88waJy6fO4i6cB24JVCBIc8098tM7TjxC/
 l2GhdTyHhR0raaYD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65vX+ECv0x
 HaMqy43m7I7iM8N2r+l9EvWmHSwq5PJJiY84AnNU2vj5ApieImjZqSt6F7W9+hJN5eCCEWMt
 3hss82X9usJS4qKkC2AWuQlAbeo4vGfPXvdnTZS84IJrmr3vST5JMYJvW84dBwB3ts4lSHBM
 VTOo1kAu5RoJWqDZKZ3br/sAN0x9P21fTj6bcz8Yt1La5l3UQaI+iByeEKdt1zQfFgQfbIXY
 snCL5v1ZZoOIeE+lWftGb9BuVM+7npmrV4/U6wX2PhOPVC2QHeOAYkIP1KVBgzSxPPV+V6Fm
 zqz2ibj9vm+bAEcSnOMmWLwBQpQRZTeOXwRg5I/SwJ7ClA6cFzN8teIqV/bR6Rrnr5OisDD9
 WynV0lTxTLX3COYc1TWMS0zOe++DP6TSE7X2wR2bT5EPFB6OO6SAFo3LcNrLdHLCsQ5pRKLc
 xX1U5rZWakeItg20z8ccYP8vORfSfhfvirXZ3DNSGFmL/Zdq/nhpoeMkv3HqHNfUUJadKIW/
 9Wd6+8sacBbH148VJ6MOK7HIpHYlSF1pd+elnDgerF7EHgAOqAwQ8Atppfb+/0xFCg=
IronPort-HdrOrdr: A9a23:u9b666wS0thNwpKMtpuMKrPwFr1zdoMgy1knxilNoEpuA6ulfq
 eV7ZcmPH7P6Ar5N0tKpTntAsO9qBDnlKKdg7N/AV74ZniDhILAFugL0WKF+VDd8kbFmNK1u5
 0NT0DQYueAa2STIazBkWuF+3dL+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="91538047"
Date: Fri, 6 Jan 2023 16:32:15 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: <xen-devel@lists.xenproject.org>, <marco.solieri@unimore.it>,
	<andrea.bastoni@minervasys.tech>, <lucmiccio@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Marco Solieri
	<marco.solieri@minervasys.tech>
Subject: Re: [PATCH v3 4/9] tools/xl: add support for cache coloring
 configuration
Message-ID: <Y7hND1jfB/sKUzA7@perard.uk.xensource.com>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-5-carlo.nonato@minervasys.tech>
 <Y3+MDElm8YQ7/2nS@perard.uk.xensource.com>
 <CAG+AhRUfdnwCYkXw3TR=XrQOWQFt4FTdEsGvcE5kyAmwEyAaeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAG+AhRUfdnwCYkXw3TR=XrQOWQFt4FTdEsGvcE5kyAmwEyAaeg@mail.gmail.com>

On Thu, Dec 22, 2022 at 04:28:56PM +0100, Carlo Nonato wrote:
> > Could you invent a name that is more specific? Maybe "cache_colors" or
> > something, or "vcpu_cache_colors".
> 
> What about llc_colors? LLC stands for Last Level Cache and I'm trying to use
> it everywhere else since it's what is really implemented (not any cache is
> colored, just the last level) and it's shorter than cache_colors.

"llc_colors" sounds good.

Cheers,


-- 
Anthony PERARD

