Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24BB98170
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 04:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128784.1469005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1FUj-00072q-Cb; Wed, 24 Sep 2025 02:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128784.1469005; Wed, 24 Sep 2025 02:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1FUj-00071O-8q; Wed, 24 Sep 2025 02:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1128784;
 Wed, 24 Sep 2025 02:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NfBW=4D=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1v1FUi-00071I-8y
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 02:44:36 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6546c396-98f0-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 04:44:32 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 58O2i9W5051387
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 23 Sep 2025 22:44:14 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 58O2i7Pf051386;
 Tue, 23 Sep 2025 19:44:07 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 6546c396-98f0-11f0-9809-7dc792cee155
Date: Tue, 23 Sep 2025 19:44:07 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: irt: [PATCH v2] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aNNa98WwzqmlCig3@mattapan.m5p.com>
References: <20250715160902.578844-2-anthoine.bourgeois@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715160902.578844-2-anthoine.bourgeois@vates.tech>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

Trimming Cc list a bit since this follow-up topic doesn't need quite as
wide distribution.

On Tue, Jul 15, 2025 at 04:11:29PM +0000, Anthoine Bourgeois wrote:
> We found at Vates that there are lot of spurious interrupts when
> benchmarking the PV drivers of Xen. This issue appeared with a patch
> that addresses security issue XSA-391 (see Fixes below). On an iperf
> benchmark, spurious interrupts can represent up to 50% of the
> interrupts.

<snip>

> Moreover, this problem is amplifyed by the penalty imposed by a spurious
> interrupt. When an interrupt is found spurious the interrupt chip will
> delay the EOI to slowdown the backend. This delay will allow more
> responses to be handled by the request path and then there will be more
> chance the next interrupt will not find any work to do, creating a new
> spurious interrupt.

When this was first discovered the problem was reported as being more
severe on systems with AMD processors and less severe on systems with
Intel processors.

Have you been able to look deeper to analyze the reason for this?

I wonder whether that difference might point to some deeper issue.
Latency in interrupt handling/propogation causing problems?  There are a
few other bugs which could be explained by issues with interrupts.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



