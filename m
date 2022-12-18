Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D742F6504DB
	for <lists+xen-devel@lfdr.de>; Sun, 18 Dec 2022 22:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465703.724494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p71Vw-0000oB-0P; Sun, 18 Dec 2022 21:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465703.724494; Sun, 18 Dec 2022 21:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p71Vv-0000lB-TD; Sun, 18 Dec 2022 21:48:07 +0000
Received: by outflank-mailman (input) for mailman id 465703;
 Sun, 18 Dec 2022 21:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kHhH=4Q=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1p71Vu-0000ke-4H
 for xen-devel@lists.xenproject.org; Sun, 18 Dec 2022 21:48:06 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4f1e13a-7f1d-11ed-8fd4-01056ac49cbb;
 Sun, 18 Dec 2022 22:48:03 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2BILllPq066332
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 18 Dec 2022 16:47:53 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2BILli7o066331;
 Sun, 18 Dec 2022 13:47:44 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: a4f1e13a-7f1d-11ed-8fd4-01056ac49cbb
Date: Sun, 18 Dec 2022 13:47:44 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Message-ID: <Y5+KgBxxmlYfq7e2@mattapan.m5p.com>
References: <d018f50f439c4d8dff8add022d28698a2af3c320.1671365645.git.xen@neowutran.ovh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d018f50f439c4d8dff8add022d28698a2af3c320.1671365645.git.xen@neowutran.ovh>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Sun, Dec 18, 2022 at 01:14:07PM +0100, Neowutran wrote:
> xen/x86: prevent overflow with high frequency TSCs
> 
> Promote tsc_khz to a 64-bit type before multiplying by 1000 to avoid a
> 'overflow before widen' bug.
> Otherwise just above 4.294GHz the value will overflow.
> Processors with clocks this high are now in production and require this to work
> correctly.
> 
> Signed-off-by: Neowutran <xen@neowutran.ovh>

Needing a bit of word-wrapping, but that can be adjusted during commit to
the Xen tree.

This strikes me as urgent for an updated Xen release.  In the past 3
months, both large manufacturers of desktop processors have released
processors with sufficient clock speed to require this patch.  This WILL
trigger *massive* numbers of bug reports very soon.

Similarly I suggest all Linux distributions which distribute Xen will
want to issue updates urgently.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



