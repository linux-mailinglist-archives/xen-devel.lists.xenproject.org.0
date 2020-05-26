Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B021E23AE
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 16:07:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdaDg-0005jB-77; Tue, 26 May 2020 14:06:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdaDe-0005j6-Ly
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 14:06:14 +0000
X-Inumbo-ID: 0e31e4a1-9f5a-11ea-a64b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e31e4a1-9f5a-11ea-a64b-12813bfff9fa;
 Tue, 26 May 2020 14:06:13 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NzXzWeVY9LrJHh/AvpJpANxVDPhB3QGgrhdeI9O0SjnVKY/CguAusOHcWxuWJFZY7vxNN1EAs+
 WoG51D0zCnljLEJAy3ZkugXWbMc3dfbmnlWauCxgDuUkTa8dYDJtPkNisPHd5EQ+I8lShm/qEq
 RdJg+kyN5X+lVPTlA65in2U5DzsiIuIS3Rk9tNbDAwVjFdji+GXQ3UNY4y130TiSZtvMexcFJR
 O2o3ROfsmNl0XnhN5srRF383xhk11p4BDOYdXfUh1xkL/hfYm2AXxL/eJMCdEdmDiKiPNSGltS
 Csk=
X-SBRS: None
X-MesageID: 18800847
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-URL-LookUp-ScanningError: 1
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24269.8019.97048.52370@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 14:53:23 +0100
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/5] libxl: Generate golang bindings in libxl Makefile
In-Reply-To: <20200522161240.3748320-4-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-4-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("[PATCH 3/5] libxl: Generate golang bindings in libxl Makefile"):
> +.PHONY: idl-external
> +idl-external:
> +	$(MAKE) -C $(XEN_ROOT)/tools/golang/xenlight idl-gen

Unfortunately this kind of thing is forbidden.  At least, without a
rigorous proof that this isn't a concurrency hazard.

The problem is that with parallel make, the concurrency correctness
principles are as follows:
(1) different targets use nonoverlapping temporary and output files
    (makefile authors' responsibiliy)
(2) one invocation of make won't make the same target twice at the
    same time (fundamental principle of operation for make)
(3) the same makefile (or different makefiles with overlapping
    targets) may not be entered multiple times in parallel
    (build system authors' responsibility; preclucdes most use of
    make -C to sibling directories rather than to children)

A correctness proof to make an exception would involve demonstrating
that the tools/golang directories never touch this file when invoked
as part of a recursive build.  NB, consider the clean targets too.

Alternatively, move the generated golang files to tools/libxl maybe,
and perhaps leave symlinks behind.

Or convert the whole (of tools/, maybe) to nonrecursive make using eg
subdirmk :-).  https://diziet.dreamwidth.org/5763.html

Sorry,
Ian.

