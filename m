Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A445BD663
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 23:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408984.651811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaOL8-0000zQ-2y; Mon, 19 Sep 2022 21:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408984.651811; Mon, 19 Sep 2022 21:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaOL7-0000uT-VS; Mon, 19 Sep 2022 21:30:05 +0000
Received: by outflank-mailman (input) for mailman id 408984;
 Mon, 19 Sep 2022 21:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JXlt=ZW=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1oaOL7-0000lQ-75
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 21:30:05 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37e223c7-3862-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 23:30:02 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 28JKl0ox092890
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Sep 2022 16:47:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 28JKkxYl092889;
 Mon, 19 Sep 2022 13:46:59 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 37e223c7-3862-11ed-9647-05401a9f4f97
Date: Mon, 19 Sep 2022 13:46:59 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
        netdev@vger.kernel.org
Subject: Re: Layer 3 (point-to-point) netfront and netback drivers
Message-ID: <YyjVQxmIujBMzME3@mattapan.m5p.com>
References: <YycSD/wJ9pL0VsFD@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YycSD/wJ9pL0VsFD@itl-email>
X-Spam-Status: No, score=-0.0 required=10.0 tests=KHOP_HELO_FCRDNS,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Sun, Sep 18, 2022 at 08:41:25AM -0400, Demi Marie Obenour wrote:
> How difficult would it be to provide layer 3 (point-to-point) versions
> of the existing netfront and netback drivers?  Ideally, these would
> share almost all of the code with the existing drivers, with the only
> difference being how they are registered with the kernel.  Advantages
> compared to the existing drivers include less attack surface (since the
> peer is no longer network-adjacent), slightly better performance, and no
> need for ARP or NDP traffic.

I've actually been wondering about a similar idea.  How about breaking
the entire network stack off and placing /that/ in a separate VM?

One use for this is a VM could be constrained to *exclusively* have
network access via Tor.  This would allow a better hidden service as it
would have no network topology knowledge.

The other use is network cards which are increasingly able to handle more
of the network stack.  The Linux network team have been resistant to
allowing more offloading, so perhaps it is time to break *everything*
off.

I'm unsure the benefits would justify the effort, but I keep thinking of
this as the solution to some interesting issues.  Filtering becomes more
interesting, but BPF could work across VMs.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



