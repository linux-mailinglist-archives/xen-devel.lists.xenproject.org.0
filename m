Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FD8309F77
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 00:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79475.144637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6MDR-0005YL-6K; Sun, 31 Jan 2021 23:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79475.144637; Sun, 31 Jan 2021 23:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6MDR-0005Xv-1o; Sun, 31 Jan 2021 23:33:13 +0000
Received: by outflank-mailman (input) for mailman id 79475;
 Sun, 31 Jan 2021 23:33:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WW3a=HC=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l6MDP-0005Xq-NT
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 23:33:11 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be95ff53-de59-4479-8eff-2bd023a5451b;
 Sun, 31 Jan 2021 23:33:10 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10VNWojD010966
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 31 Jan 2021 18:32:55 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10VNWnT2010965;
 Sun, 31 Jan 2021 15:32:49 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: be95ff53-de59-4479-8eff-2bd023a5451b
Date: Sun, 31 Jan 2021 15:32:49 -0800
From: Elliott Mitchell <ehem+undef@m5p.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
Message-ID: <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com>
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Sun, Jan 31, 2021 at 02:06:17PM -0500, Tamas K Lengyel wrote:
> (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> (XEN) Device tree generation failed (-22).

> Does anyone have an idea what might be going wrong here? I tried
> building the dtb without using the dtb overlay but it didn't seem to
> do anything.

If you go to line 1412 of the file xen/arch/arm/domain_build.c and
replace the "return res;" with "continue;" that will bypass the issue.
The 3 people I'm copying on this message though may wish to ask questions
about the state of your build tree.

Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
point to that last being touched last year.  Their tree is at
cc39f1c9f82f6fe5a437836811d906c709e0661c.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



