Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAECD4E84A1
	for <lists+xen-devel@lfdr.de>; Sun, 27 Mar 2022 00:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.295093.502080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYFdS-0007k5-3F; Sat, 26 Mar 2022 23:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295093.502080; Sat, 26 Mar 2022 23:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYFdR-0007i1-Vr; Sat, 26 Mar 2022 23:15:53 +0000
Received: by outflank-mailman (input) for mailman id 295093;
 Sat, 26 Mar 2022 23:15:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HP1u=UF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nYFdQ-0007hv-Ck
 for xen-devel@lists.xenproject.org; Sat, 26 Mar 2022 23:15:52 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab573789-ad5a-11ec-8fbc-03012f2f19d4;
 Sun, 27 Mar 2022 00:15:49 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 22QNFTci046373
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 26 Mar 2022 19:15:35 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 22QNFTOq046372;
 Sat, 26 Mar 2022 16:15:29 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: ab573789-ad5a-11ec-8fbc-03012f2f19d4
Date: Sat, 26 Mar 2022 16:15:29 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: OS Headers hypercall.h/hypervisor.h
Message-ID: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

The hypercalls implementation for Linux and FreeBSD have two key headers,
hypercall.h and hypervisor.h.  I'm curious why the implementations for
x86 and ARM* are so distinct.

I found it fairly straightforward to implement ARM* versions of the x86
_hypercall#() macros.  Once that is done, most of the wrappers in the x86
hypercall.h can be moved to a shared hypervisor.h header.

Why does Xen/ARM on Linux still have hypercall.S when merging the
headers should reduce maintainance?

Was GCC extended inline assembly language for ARM* thought too awful?

I'm also curious why these headers are part of the Linux kernel, instead
of being maintained by the Xen Project?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



