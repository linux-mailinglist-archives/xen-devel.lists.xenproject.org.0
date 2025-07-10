Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02565B00C6F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 22:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039819.1411442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZxWu-0000Ms-9M; Thu, 10 Jul 2025 20:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039819.1411442; Thu, 10 Jul 2025 20:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZxWu-0000KX-6S; Thu, 10 Jul 2025 20:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1039819;
 Thu, 10 Jul 2025 20:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5bes=ZX=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1uZxWs-0000KR-QX
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 20:06:02 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ae125e4-5dc9-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 22:05:58 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 56AK5nw2012478
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 10 Jul 2025 16:05:55 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 56AK5mGJ012477;
 Thu, 10 Jul 2025 13:05:48 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 4ae125e4-5dc9-11f0-b894-0df219b8e170
Date: Thu, 10 Jul 2025 13:05:47 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Andrei Semenov <andrei.semenov@vates.tech>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aHAdG-vhZqdLeOpg@mattapan.m5p.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Thu, Jul 10, 2025 at 04:11:15PM +0000, Anthoine Bourgeois wrote:
> We found at Vates that there are lot of spurious interrupts when
> benchmarking the PV drivers of Xen. This issue appeared with a patch
> that addresses security issue XSA-391 (see Fixes below). On an iperf
> benchmark, spurious interrupts can represent up to 50% of the
> interrupts.

If this is the correct fix, near-identical fixes are needed for *all*
of the Xen front-ends.  Xen virtual block-devices and Xen PCI-passthrough
devices are also effected by a similar issue.

Thanks for finding a candidate fix, this effects many other people who
have been troubled by this performance issue.

FreeBSD will also need a similar fix.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



