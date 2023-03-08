Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFBE6B0C8C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 16:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508079.782341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvdi-0000SG-US; Wed, 08 Mar 2023 15:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508079.782341; Wed, 08 Mar 2023 15:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZvdi-0000QT-RJ; Wed, 08 Mar 2023 15:23:38 +0000
Received: by outflank-mailman (input) for mailman id 508079;
 Wed, 08 Mar 2023 15:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lEal=7A=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pZvdh-0000QN-H7
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 15:23:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30651028-bdc5-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 16:23:35 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 328FNQgi002927
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Wed, 8 Mar 2023 10:23:31 -0500 (EST)
 (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 328FNQ0X002926
 for xen-devel@lists.xenproject.org; Wed, 8 Mar 2023 07:23:26 -0800 (PST)
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
X-Inumbo-ID: 30651028-bdc5-11ed-87f5-c1b5be75604c
Date: Wed, 8 Mar 2023 07:23:26 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Subject: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Mostly SSIA.  As originally identified by "Neowutran", appears Xen's
x2apic wrapper implementation fails with current generation AMD hardware
(Ryzen 7xxx/Zen 4).  This can be worked around by passing "x2apic=false"
on Xen's command-line, though I'm wondering about the performance impact.

There hasn't been much activity on xen-devel WRT x2apic, so a patch which
fixed this may have flown under the radar.  Most testing has also been
somewhat removed from HEAD.

Thanks to "Neowutran" for falling on this grenade and making it easier
for the followers.  Pointer to first report:
https://forum.qubes-os.org/t/ryzen-7000-serie/14538


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



