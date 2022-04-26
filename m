Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6E50EE1D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 03:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313384.530892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njA7k-0005bD-Jn; Tue, 26 Apr 2022 01:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313384.530892; Tue, 26 Apr 2022 01:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njA7k-0005Z5-Fe; Tue, 26 Apr 2022 01:36:16 +0000
Received: by outflank-mailman (input) for mailman id 313384;
 Tue, 26 Apr 2022 01:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tgZt=VE=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1njA7j-0005Yz-7J
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 01:36:15 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f9e5054-c501-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 03:36:11 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23Q1ZnqI032875
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 25 Apr 2022 21:35:55 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23Q1ZmND032874;
 Mon, 25 Apr 2022 18:35:48 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 3f9e5054-c501-11ec-8fc2-03012f2f19d4
Date: Mon, 25 Apr 2022 18:35:48 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: OS Headers hypercall.h/hypervisor.h
Message-ID: <YmdMdBLbly1ae0l2@mattapan.m5p.com>
References: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
 <alpine.DEB.2.22.394.2203281523230.2910984@ubuntu-linux-20-04-desktop>
 <c999faa3-ded7-64af-7bf1-f6b8e5620425@suse.com>
 <YkUAlWH6imVV9D00@mattapan.m5p.com>
 <701a0bdc-a8d3-06c3-7e40-e741dfa45361@xen.org>
 <e4b554db-5adf-91c3-476f-05721e74c069@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4b554db-5adf-91c3-476f-05721e74c069@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

I dislike the adding yet more junk into the global namespace, so I had
opted for use of inline functions.  The approach of adding underscores
to globals though does generally work.


I took a look at the file arch/x86/include/asm/xen/hypercall.h in the
Linux kernel.  The only explicitly listed author is Keir A Fraser and
has the GPLv2 or MIT license like most of the Xen headers.

Clearly though there was a heavy rewrite by Jeremy Fitzhardinge at
e74359028d54.  Interestingly, the current header doesn't need much
adjustment to work for with Xen/ARM.  The registers have distinct names,
ARM doesn't clobber as many registers and the instruction for the
hypercall is different.  Yet since these are all isolated as distinct
macros, adding ARM support would be easy.


What I really need is advice for the direction the project of getting
FreeBSD operational on Xen/ARM should take.  Should I use
Stefano Stabellini's hypercall.S file?  Should I try to merge headers
together and share the main body of the hypercall.h header?

I like merging things due to less work in the long term, just I'm
concerned there is a trap waiting for me if I go this direction.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



