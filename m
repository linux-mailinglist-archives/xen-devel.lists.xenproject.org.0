Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA493BF2DF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 02:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152760.282199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Hxq-0005om-HO; Thu, 08 Jul 2021 00:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152760.282199; Thu, 08 Jul 2021 00:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Hxq-0005mx-Dr; Thu, 08 Jul 2021 00:32:26 +0000
Received: by outflank-mailman (input) for mailman id 152760;
 Thu, 08 Jul 2021 00:32:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X7bE=MA=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1m1Hxo-0005mk-V4
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 00:32:24 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6b8492a-df83-11eb-8542-12813bfff9fa;
 Thu, 08 Jul 2021 00:32:24 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1680WGKk036652
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Wed, 7 Jul 2021 20:32:22 -0400 (EDT)
 (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1680WGJx036651
 for xen-devel@lists.xenproject.org; Wed, 7 Jul 2021 17:32:16 -0700 (PDT)
 (envelope-from ehem)
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
X-Inumbo-ID: f6b8492a-df83-11eb-8542-12813bfff9fa
Date: Wed, 7 Jul 2021 17:32:16 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Subject: Xen/ARM API issue (page size)
Message-ID: <YOZHkGrrl694NrfZ@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Hopefully I'm not about to show the limits of my knowledge...

Quite a few values passed to Xen via hypercalls include a page number.
This makes sense as that maps to the hardware.  Problem is, I cannot help
but notice aarch64 allows for 4KB, 16KB and 64KB pages.

I don't know how flexible aarch64 is.  I don't know whether an aarch64
core can support multiple page sizes.  My tentative reading of
information seemed to suggest a typical aarch64 core /could/ allow
multiple page sizes.

What happens if a system (and Xen) is setup to support 64KB pages, but a
particular domain has been built strictly with 4KB page support?

What if a particular domain wanted to use 64KB pages (4KB being too
granular), but Xen was set to use 4KB pages?

What if a system had two domains which were set for different page sizes,
but the two needed to interact?


Then you have things like VCPUOP_register_vcpu_info.  The structure is
setup as mfn and offset.  With the /actual/ page size being used there,
it is troublesome.  Several places might work better if pure 64-bit
addresses were used, but with alignment requirements specified.

Then there is a question of what happens when we get a core which has
more than 64 physical address bits (seems a few years off, but for a long
time 32 seemed high).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



