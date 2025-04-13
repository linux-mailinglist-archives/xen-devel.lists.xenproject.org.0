Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED1A8742D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 00:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949019.1345683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u45Va-0006GP-C1; Sun, 13 Apr 2025 22:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949019.1345683; Sun, 13 Apr 2025 22:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u45Va-0006Ez-5t; Sun, 13 Apr 2025 22:08:58 +0000
Received: by outflank-mailman (input) for mailman id 949019;
 Sun, 13 Apr 2025 22:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=seIn=W7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1u45VY-0006Er-Fd
 for xen-devel@lists.xenproject.org; Sun, 13 Apr 2025 22:08:56 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1f83374-18b3-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 00:08:53 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 53DM8hFY066692
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 13 Apr 2025 18:08:48 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 53DM8gZb066691;
 Sun, 13 Apr 2025 15:08:42 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: e1f83374-18b3-11f0-9eae-5ba50f476ded
Date: Sun, 13 Apr 2025 15:08:42 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Serious AMD-Vi issue
Message-ID: <Z_w16tOkcg4_tpg2@mattapan.m5p.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <Z5OkQgjd4Lt_rtr0@macbook.local>
 <Z5QFf5Ipk3GHd27H@mattapan.m5p.com>
 <Z5dVgd3aF_n9Q3hZ@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5dVgd3aF_n9Q3hZ@macbook.local>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Mon, Jan 27, 2025 at 10:44:33AM +0100, Roger Pau Monné wrote:
> On Fri, Jan 24, 2025 at 01:26:23PM -0800, Elliott Mitchell wrote:
> > 
> > In fact what seems a likely reproduction on Intel hardware is the Intel
> > sound card issue.  I notice that issue occurs when sound *starts*
> > playing.  When a sound device starts, its buffers would be empty and the
> > first DMA request would be turned around with minimal latency.  In such
> > case this matches the Samsung SATA devices handling DMA with low
> > latency.
> 
> Can you reproduce the data loss issue without using RAID in Linux?
> You can use fio with verify or similar to stress test it.

This seems rather unlikely.  The first reportter tried without software
RAID and didn't observe the issue.  If the problem occurred without
software RAID, there would be massive numbers of data loss reports.

> Can you reproduce if dom0 is PVH instead of PV?

Haven't gotten Domain 0 PVH to work yet.  I was planning to try again
when Debian updates to 4.20, but until then this isn't working.

> Can you reproduce with dom0-iommu=strict mode in the Xen command line?

Alas, this is now a definite "yes".  Took a bunch of waiting, but now
confirmed to occur with "dom0-iommu=strict".


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



