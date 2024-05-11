Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264738C2F78
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 06:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720203.1123290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5e3r-0003Yu-UZ; Sat, 11 May 2024 04:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720203.1123290; Sat, 11 May 2024 04:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5e3r-0003WM-Rc; Sat, 11 May 2024 04:10:15 +0000
Received: by outflank-mailman (input) for mailman id 720203;
 Sat, 11 May 2024 04:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElH0=MO=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1s5e3p-0003WG-Ty
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 04:10:13 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b39f051-0f4c-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 06:10:10 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.17.1) with ESMTPS id 44B49s3g016991
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 11 May 2024 00:10:00 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 44B49s11016990;
 Fri, 10 May 2024 21:09:54 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 5b39f051-0f4c-11ef-b4bb-af5377834399
Date: Fri, 10 May 2024 21:09:54 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
References: <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
 <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
 <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Thu, Apr 18, 2024 at 09:33:31PM -0700, Elliott Mitchell wrote:
> 
> I suspect this is a case of there is some step which is missing from
> Xen's IOMMU handling.  Perhaps something which Linux does during an early
> DMA setup stage, but the current Xen implementation does lazily?
> Alternatively some flag setting or missing step?
> 
> I should be able to do another test approach in a few weeks, but I would
> love if something could be found sooner.

Turned out to be disturbingly easy to get the first entry when it
happened.  Didn't even need `dbench`, it simply showed once the OS was
fully loaded.  I did get some additional data points.

Appears this requires an AMD IOMMUv2.  A test system with known
functioning AMD IOMMUv1 didn't display the issue at all.

(XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr fffffffdf8000000 flags 0x8 I
(XEN) DDDD:bb:dd.f root @ 83b5f5 (3 levels) dfn=fffffffdf8000
(XEN)   L3[1f7] = 0 np

I find it surprising this required "iommu=debug" to get this level of
detail.  This amount of output seems more appropriate for "verbose".

I strongly prefer to provide snippets.  There is a fair bit of output,
I'm unsure which portion is most pertinent.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



