Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC546B34D2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 04:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508382.783025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paTNz-0006r8-Hc; Fri, 10 Mar 2023 03:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508382.783025; Fri, 10 Mar 2023 03:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paTNz-0006oG-Er; Fri, 10 Mar 2023 03:25:39 +0000
Received: by outflank-mailman (input) for mailman id 508382;
 Fri, 10 Mar 2023 03:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c5EL=7C=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1paTNy-0006oA-G2
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 03:25:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3799ee8f-bef3-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 04:25:35 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32A3PNoN011962
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 9 Mar 2023 22:25:29 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32A3PNF1011961;
 Thu, 9 Mar 2023 19:25:23 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 3799ee8f-bef3-11ed-87f5-c1b5be75604c
Date: Thu, 9 Mar 2023 19:25:23 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZAqjIwnFtXS80vHQ@mattapan.m5p.com>
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
> On 09.03.2023 00:08, Elliott Mitchell wrote:
> > 
> > As such I'm less than certain the problem is still in HEAD, though
> > Neowutran and Co working with 4.16 and the commit log being quiet
> > suggests there is a good chance.
> > 
> > More detail, pretty well most things are broken for Domain 0 without
> > "x2apic=false".  Trying to boot with a 6.1.12 a USB keyboard was
> > completely unresponsive, on screen the initial ramdisk script output was
> > indicating problems interacting with storage devices.  Those two together
> > suggested an interrupt issue and adding "x2apic=false" caused domain 0 to
> > successfully boot.
> > A 5.10 kernel similarly requires "x2apic=false" to successfully boot.
> > 
> > So could be a commit after 4.16 fixed x2apic for current AMD hardware,
> > but may still be broken.
> 
> If Dom0 boot is affected, trying a newer hypervisor shouldn't be a problem.
> You won't need any of the toolstack to match just to see whether Dom0 boots.
> 
> In any event you will want to collect a serial log at maximum verbosity.
> It would also be of interest to know whether turning off the IOMMU avoids
> the issue as well (on the assumption that your system has less than 255
> CPUs).

Well, I can now state "x2apic=false" IS required for Xen 4.17.  Since the
last x2apic commit was about a year ago, I believe this matches HEAD.  I
missed the logs since the USB-serial adapter decided to bugger when the
machine rebooted.

Is it just me or is https://wiki.xenproject.org/wiki/Xen_Serial_Console
out of date?

Last time I used serial debugging I recall the options being different.
Due to stress level this time I'm not so favorable to looking things up
in Git (this system is crucial in my development workflow, so being in a
problematic state is trouble).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



