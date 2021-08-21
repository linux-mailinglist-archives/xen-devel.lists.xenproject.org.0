Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C13F3B6B
	for <lists+xen-devel@lfdr.de>; Sat, 21 Aug 2021 18:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169823.310161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHToN-00034v-Ur; Sat, 21 Aug 2021 16:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169823.310161; Sat, 21 Aug 2021 16:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mHToN-00032P-QJ; Sat, 21 Aug 2021 16:25:35 +0000
Received: by outflank-mailman (input) for mailman id 169823;
 Sat, 21 Aug 2021 16:25:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL8J=NM=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mHToM-00032J-CL
 for xen-devel@lists.xenproject.org; Sat, 21 Aug 2021 16:25:34 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93a21043-8756-4b0a-b426-0f22b338665a;
 Sat, 21 Aug 2021 16:25:33 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 17LGPORH068327
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 21 Aug 2021 12:25:30 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 17LGPOJJ068326;
 Sat, 21 Aug 2021 09:25:24 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 93a21043-8756-4b0a-b426-0f22b338665a
Date: Sat, 21 Aug 2021 09:25:24 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: Xen C-state Issues
Message-ID: <YSEo9Box2AFnmdLZ@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

ACPI C-state support might not see too much use, but it does see some.

With Xen 4.11 and Linux kernel 4.19, I found higher C-states only got
enabled for physical cores for which Domain 0 had a corresponding vCPU.
On a machine where Domain 0 has 5 vCPUs, but 8 reported cores, the
additional C-states would only be enabled on cores 0-4.

This can be worked around by giving Domain 0 vCPUs equal to cores, but
then offlining the extra vCPUs.  I'm guessing this is a bug with the
Linux 4.19 xen_acpi_processor module.



Appears Xen 4.14 doesn't work at all with Linux kernel 4.19's ACPI
C-state support.  This combination is unable to enable higher C-states
on any core.  Since Xen 4.14 and Linux 4.19 are *both* *presently*
supported it seems patch(es) are needed somewhere for this combination.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



