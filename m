Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461622528A2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 09:50:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqCK-0001uy-FD; Wed, 26 Aug 2020 07:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TrzI=CE=leiner.me=simon@srs-us1.protection.inumbo.net>)
 id 1kAqCJ-0001ur-3P
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 07:50:19 +0000
X-Inumbo-ID: e6c6e78e-4f85-48ff-88da-a55631dbce41
Received: from mx2.mailbox.org (unknown [80.241.60.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6c6e78e-4f85-48ff-88da-a55631dbce41;
 Wed, 26 Aug 2020 07:50:17 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 1BEC6A1B5C;
 Wed, 26 Aug 2020 09:50:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id Pb6gPgEUzjGS; Wed, 26 Aug 2020 09:50:12 +0200 (CEST)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, julien@xen.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <374f42a0-b618-8b90-71b5-0a865ea1ddbb@suse.com>
 <alpine.DEB.2.21.2008251647100.24407@sstabellini-ThinkPad-T480s>
 <00bdd0ee-8f18-4580-01c7-01c95f3a6184@suse.com>
From: Simon Leiner <simon@leiner.me>
Message-ID: <d5db3e9a-2d5e-ef20-2516-c014d25e9e1c@leiner.me>
Date: Wed, 26 Aug 2020 09:50:10 +0200
MIME-Version: 1.0
In-Reply-To: <00bdd0ee-8f18-4580-01c7-01c95f3a6184@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.19 / 15.00 / 15.00
X-Rspamd-Queue-Id: 6D47C17B2
X-Rspamd-UID: 5230ab
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.08.20 08:20, Jan Beulich wrote:
> Hmm, to me __phys_to_virt() and __virt_to_phys_nodebug() give
> the impression that they're just linear transformations of the
> address, which would seem to suggest there's a pre-determined
> address range used for the direct map.

From eyeballing the kernel code, it seems like __is_lm_address() is
suitable for such a check, especially since it is also used in
__virt_to_phys() (the one in arch/arm64/mm/physaddr.c).

Greetings,
Simon



