Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD62AB0FCA8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 00:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054814.1423448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehst-0001mc-QV; Wed, 23 Jul 2025 22:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054814.1423448; Wed, 23 Jul 2025 22:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehst-0001lZ-N1; Wed, 23 Jul 2025 22:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1054814;
 Wed, 23 Jul 2025 22:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uPCZ=2E=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1uehss-0001kh-3h
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 22:24:22 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c722c98d-6813-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 00:24:21 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 56NMNxcg026016
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 23 Jul 2025 18:24:05 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 56NMNxDL026015;
 Wed, 23 Jul 2025 15:23:59 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c722c98d-6813-11f0-a31e-13f23c93f187
Date: Wed, 23 Jul 2025 15:23:59 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
        xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aIFg_yNVqTvrV6-k@mattapan.m5p.com>
References: <20250715160902.578844-2-anthoine.bourgeois@vates.tech>
 <20250717072951.3bc2122c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717072951.3bc2122c@kernel.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Thu, Jul 17, 2025 at 07:29:51AM -0700, Jakub Kicinski wrote:
> On Tue, 15 Jul 2025 16:11:29 +0000 Anthoine Bourgeois wrote:
> > Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel storms")
> 
> Not entirely sure who you expect to apply this patch, but if networking
> then I wouldn't classify this is a fix. The "regression" happened 4
> years ago. And this patch doesn't seem to be tuning the logic added by
> the cited commit. I think this is an optimization, -next material, and
> therefore there should be no Fixes tag here. You can refer to the commit
> without the tag.

Sometimes the line between bugfix and optimization can be unclear.  To
me this qualifies as a bugfix since it results in non-zero values in
/sys/devices/vif-*/xenbus/spurious_events.  Spurious interrupts should
never occur, as such I would classify this as bug.

I do though think "Fixes: 0d160211965b" is more appropriate since that is
where the bug originates.  Commit b27d47950e48 merely caused the bug to
result in performance loss and trigger bug/attack detection flags.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



