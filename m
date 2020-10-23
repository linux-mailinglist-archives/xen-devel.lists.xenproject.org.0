Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0452978CF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 23:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11320.29999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW4YV-0006x6-Tf; Fri, 23 Oct 2020 21:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11320.29999; Fri, 23 Oct 2020 21:24:59 +0000
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
	id 1kW4YV-0006wh-QS; Fri, 23 Oct 2020 21:24:59 +0000
Received: by outflank-mailman (input) for mailman id 11320;
 Fri, 23 Oct 2020 21:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yA4w=D6=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kW4YU-0006wc-Gq
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 21:24:58 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23e5d1e5-4c1c-4676-87cd-242166302ddc;
 Fri, 23 Oct 2020 21:24:57 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09NLOWNS092051
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 23 Oct 2020 17:24:38 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09NLOVdm092050;
 Fri, 23 Oct 2020 14:24:31 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yA4w=D6=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kW4YU-0006wc-Gq
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 21:24:58 +0000
X-Inumbo-ID: 23e5d1e5-4c1c-4676-87cd-242166302ddc
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 23e5d1e5-4c1c-4676-87cd-242166302ddc;
	Fri, 23 Oct 2020 21:24:57 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09NLOWNS092051
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 23 Oct 2020 17:24:38 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09NLOVdm092050;
	Fri, 23 Oct 2020 14:24:31 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 23 Oct 2020 14:24:31 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
        masami.hiramatsu@linaro.org, bertrand.marquis@arm.com,
        andre.przywara@arm.com, Rahul.Singh@arm.com,
        Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/7] xen/arm: Unbreak ACPI
Message-ID: <20201023212431.GB90171@mattapan.m5p.com>
References: <20201023154156.6593-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023154156.6593-1-julien@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Fri, Oct 23, 2020 at 04:41:49PM +0100, Julien Grall wrote:
> Xen on ARM has been broken for quite a while on ACPI systems. This
> series aims to fix it.
> 
> This series also introduced support for ACPI 5.1. This allows Xen to
> boot on QEMU.
> 
> I have only build tested the x86 side so far.

On a Tianocore-utilizing Raspberry PI 4B, this series allows successful
boot (some other distinct issues remain).  As such, for the series on an
ARM device:

Tested-by: Elliott Mitchell <ehem+xen@m5p.com>


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



