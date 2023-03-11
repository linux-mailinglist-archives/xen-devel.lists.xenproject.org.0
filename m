Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777356B5635
	for <lists+xen-devel@lfdr.de>; Sat, 11 Mar 2023 01:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508622.783471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pamo5-00042o-1r; Sat, 11 Mar 2023 00:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508622.783471; Sat, 11 Mar 2023 00:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pamo4-0003zj-VG; Sat, 11 Mar 2023 00:09:52 +0000
Received: by outflank-mailman (input) for mailman id 508622;
 Sat, 11 Mar 2023 00:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KbTL=7D=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pamo3-0003zd-A5
 for xen-devel@lists.xenproject.org; Sat, 11 Mar 2023 00:09:51 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 070e3d2f-bfa1-11ed-956e-85ef70e17bfa;
 Sat, 11 Mar 2023 01:09:47 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32B09Yqq017349
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 10 Mar 2023 19:09:40 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32B09YGB017348;
 Fri, 10 Mar 2023 16:09:34 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 070e3d2f-bfa1-11ed-956e-85ef70e17bfa
Date: Fri, 10 Mar 2023 16:09:34 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZAvGvokloPf+ltr9@mattapan.m5p.com>
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
> 
> In any event you will want to collect a serial log at maximum verbosity.
> It would also be of interest to know whether turning off the IOMMU avoids
> the issue as well (on the assumption that your system has less than 255
> CPUs).

I think I might have figured out the situation in a different fashion.

I was taking a look at the BIOS manual for this motherboard and noticed
a mention of a "Local APIC Mode" setting.  Four values are listed
"Compatibility", "xAPIC", "x2APIC", and "Auto".

That is the sort of setting I likely left at "Auto" and that may well
result in x2 functionality being disabled.  Perhaps the x2APIC
functionality on AMD is detecting whether the hardware is present, and
failing to test whether it has been enabled?  (could be useful to output
a message suggesting enabling the hardware feature)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



