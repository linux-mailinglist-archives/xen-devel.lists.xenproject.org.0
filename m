Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75B4E56EC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 17:49:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293964.499592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX49s-0007tV-DX; Wed, 23 Mar 2022 16:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293964.499592; Wed, 23 Mar 2022 16:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX49s-0007rP-AE; Wed, 23 Mar 2022 16:48:28 +0000
Received: by outflank-mailman (input) for mailman id 293964;
 Wed, 23 Mar 2022 16:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TXoM=UC=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nX49r-0007rJ-Af
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 16:48:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d9a2a9f-aac9-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 17:48:24 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 22NGUsfg024825
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 23 Mar 2022 12:31:00 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 22NGUsfg024824;
 Wed, 23 Mar 2022 09:30:54 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 0d9a2a9f-aac9-11ec-a405-831a346695d4
Date: Wed, 23 Mar 2022 09:30:54 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau Monn?? <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: Questions about Cx and Px state uploading from dom0
Message-ID: <YjtLPvd8trF+h8j4@mattapan.m5p.com>
References: <YjrgQOYbsaYOV08H@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjrgQOYbsaYOV08H@Air-de-Roger>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Wed, Mar 23, 2022 at 09:54:24AM +0100, Roger Pau Monn?? wrote:
> 
> 2. When uploading Px states, what's the meaning of the shared_type
> field in xen_processor_performance?  I've looked at the usage of the
> field by Xen, and first of all it seems to be a layering violation
> because the values set in the field (CPUFREQ_SHARED_TYPE_*) are not
> exposed as part of the public interface.  This all works for Linux
> because the same values are used by Xen and the Linux kernel.
> Secondly, this is not part of the data fetched from ACPI AFAICT, so
> I'm unsure how the value should be calculated.  I also wonder whether
> this couldn't be done by Xen itself from the uploaded Px data (but
> without knowing exactly how the value should be calculated it's hard
> to tell).

This would account for some of the behavior with Xen and Linux.  The
Xen C-state support doesn't seem to be in a stable state.  I've seen the
level of functionality vary by version of Xen and Linux.

In particular C-states appear to be a problem.  Enabling C-states besides
C0 appears to require a corresponding Domain 0 vCPU.  If Domain 0 has
fewer vCPUs than physical cores, C2 will be unavailable on some cores.
Also, C2 is only available with some combinations of Xen and Linux.

This isn't an issue for datacenters where idle processors are wasted
money, but for smaller systems reduced power consumption is a good thing.
Hypervisors are moving onto smaller and smaller systems, so power
consumption is a bigger issue now.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



