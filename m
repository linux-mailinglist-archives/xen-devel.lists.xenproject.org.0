Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40E64FC33
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 21:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465409.724068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6ddL-0006tB-MO; Sat, 17 Dec 2022 20:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465409.724068; Sat, 17 Dec 2022 20:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6ddL-0006py-Ji; Sat, 17 Dec 2022 20:18:11 +0000
Received: by outflank-mailman (input) for mailman id 465409;
 Sat, 17 Dec 2022 20:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lR+Y=4P=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1p6ddK-0006ps-0W
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 20:18:10 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea7eef6a-7e47-11ed-91b6-6bf2151ebd3b;
 Sat, 17 Dec 2022 21:18:07 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 2BHKHpw7061198
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 17 Dec 2022 15:17:57 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 2BHKHooX061197;
 Sat, 17 Dec 2022 12:17:50 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: ea7eef6a-7e47-11ed-91b6-6bf2151ebd3b
Date: Sat, 17 Dec 2022 12:17:50 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>
Subject: Re: [Patch v1] Bug fix - Integer overflow when cpu frequency > u32
 max value.
Message-ID: <Y54j7mp/fMsaF564@mattapan.m5p.com>
References: <c1535eba0bba6fc1b91f975f434af0929d9d7c96.1671298923.git.git@neowutran.ovh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1535eba0bba6fc1b91f975f434af0929d9d7c96.1671298923.git.git@neowutran.ovh>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Sat, Dec 17, 2022 at 06:42:05PM +0100, Neowutran wrote:
> xen/arch/x86/time.c: Bug fix - Integer overflow when cpu frequency > u32 max value.
> 
> What is was trying to do: I was trying to install QubesOS on my new computer
> (AMD zen4 processor). Guest VM were unusably slow / unusable.
> 
> What is the issue: The cpu frequency reported is wrong for linux guest in HVM
> and PVH mode, and it cause issue with the TSC clocksource (for example).
> 
> Why this patch solved my issue:
> The root cause it that "d->arch.tsc_khz" is a unsigned integer storing
> the cpu frequency in khz. It get multiplied by 1000, so if the cpu frequency
> is over ~4,294 Mhz (u32 max value), then it overflow.
> I am solving the issue by adding an explicit cast to u64 to avoid the overflow.

https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches

You're not matching the instructions.  You need to add a "Signed-off-by"
to indicate *you* wrote this, own the Copyright and are providing this
under the license of the existing files.

Your title line is on the long side.  The discussion is useful for the
message on the xen-devel mailing list, but isn't important for source
code history.  You should put "---" after the commit message and 
discussion below.

I would suggest as a commit message:

--------8<-----------------------------------------------------8<--------
xen/x86: prevent overflow with high frequency TSCs

Promote tsc_khz to a 64-bit type before multiplying by 1000.  Otherwise
just above 4.294GHz the value will overflow.  Processors with clocks
this high are now in production and require this to work correctly.
--------8<-----------------------------------------------------8<--------

Feel free to disagree, though any maintainer is going to want adjustments
to your original commit message.


Note to Xen and Linux distribution maintainers: I suggest this needs a
point release of Xen.  A large processor manufacturer has recently
released such a processor.  A great number of people are going to be
rather unhappy in short order without this fix.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



