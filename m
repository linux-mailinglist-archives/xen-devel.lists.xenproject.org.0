Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A37E2A8A80
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 00:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20254.45990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaoOw-0005mX-Mw; Thu, 05 Nov 2020 23:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20254.45990; Thu, 05 Nov 2020 23:10:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaoOw-0005m8-Jh; Thu, 05 Nov 2020 23:10:42 +0000
Received: by outflank-mailman (input) for mailman id 20254;
 Thu, 05 Nov 2020 23:10:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ooO=EL=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kaoOv-0005m3-25
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 23:10:41 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18093f64-49b3-484a-bf39-9423097a5fcc;
 Thu, 05 Nov 2020 23:10:39 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0A5NAOLn011400
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 5 Nov 2020 18:10:29 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0A5NAN9x011399;
 Thu, 5 Nov 2020 15:10:23 -0800 (PST) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5ooO=EL=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kaoOv-0005m3-25
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 23:10:41 +0000
X-Inumbo-ID: 18093f64-49b3-484a-bf39-9423097a5fcc
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 18093f64-49b3-484a-bf39-9423097a5fcc;
	Thu, 05 Nov 2020 23:10:39 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0A5NAOLn011400
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 5 Nov 2020 18:10:29 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 0A5NAN9x011399;
	Thu, 5 Nov 2020 15:10:23 -0800 (PST)
	(envelope-from ehem)
Date: Thu, 5 Nov 2020 15:10:23 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: Don't panic when receiving an unknown
 debug trap
Message-ID: <20201105231023.GA9312@mattapan.m5p.com>
References: <20201105223106.22517-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105223106.22517-1-julien@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Nov 05, 2020 at 10:31:06PM +0000, Julien Grall wrote:
> Even if debug trap are only meant for debugging purpose, it is quite
> harsh to crash Xen if one of the trap sent by the guest is not handled.
> 
> So switch from a panic() to a printk().

Might this qualify as security due to potential DoS?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



