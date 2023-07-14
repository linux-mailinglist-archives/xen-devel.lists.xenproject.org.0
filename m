Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484A753F0E
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 17:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563696.881099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKKop-0007cv-P3; Fri, 14 Jul 2023 15:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563696.881099; Fri, 14 Jul 2023 15:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKKop-0007ao-Lr; Fri, 14 Jul 2023 15:34:55 +0000
Received: by outflank-mailman (input) for mailman id 563696;
 Fri, 14 Jul 2023 15:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7XGI=DA=citrix.com=prvs=5525cada8=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qKKoo-0007ai-0o
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 15:34:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f74c3c2b-225b-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 17:34:49 +0200 (CEST)
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
X-Inumbo-ID: f74c3c2b-225b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689348889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rrn18Px0Jy/Mwd4sqh2vtawJA0bH2EjjTmHrhss+9vA=;
  b=HHX4beel6xYDcH+l6P9WXIj550Tz09pCmNeQclvpC21obgo1N0EPon2M
   ykacOBexykLzpWkuKNT1y6b6EGbPX96jQTIkP5vs0uxhbMv96vD7fPi1o
   SUiqjKNmJO8fg7oSw53KJ2Yrwfu+fzEVkZJeXunHG2zCzCksb8fDH3eyl
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118837742
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:StIIc60BRf6ne2drvfbD5fVxkn2cJEfYwER7XKvMYLTBsI5bpzdRn
 2ceDW/XOK7YZWP3eNx+PI7j9RxU65aHnYBlSlZlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNnOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfL1x03
 98hIWE0RB2YmsmxnpGlVfJ2v5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwFzh3H+
 T6cl4j/KhoHNpuU6mWmy1P2jNTLvCbLf8EPFqLto5aGh3XMnzdOWXX6T2CTo/O0l0q/UNJ3M
 FEP92wlqq1a3FWmS8S4UxCmrXqsuBkaVNxNVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWcUX+H/62YhS+zMyMSa2QFYEc5oRAtuoe55ttp11SWE4glSfTu5jHoJd3u6
 x63lgIdvrxCtOQGzLiQ+g7knS23vKGcG2bZ+T7rsnKZAhJRPdD1NtfysQiDsp6sP67CEADf4
 SFsd9y2qblXUMrTzHHlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCHx7ZiHCgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTC8yhd3yf5jZ
 8rLGSpJMZr8If48pNZRb75NuYLHOwhknT+DLXwF50nPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPToyizpNbWO3GNmaZKdABiEJTOLcyuwyChXrLZc1UO9aBII6O5/I7NjKQ8wf8Kyb+Wo
 S7hMqKaoXKm7UD6xcyxQigLQNvSsVxX9xrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:JN6vLaoJYz1jrJi0acr68KQaV5oReYIsimQD101hICG9JPbo8P
 xG+85rtiMc6QxwZJhOo7u90cW7K080lqQV3WByB9iftVLdyQ+VxehZhOPfKlvbdhEWndQy6U
 4PScRD4HKbNykdsS5XijPIcerJYbO8gcWVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AKm+p7mtWdU0CoztEZfuK2bD36IsLT0f3707Zcna?=
 =?us-ascii?q?SBH10Y7rLakGP47ldxp8=3D?=
X-Talos-MUID: 9a23:BY3Zngp6Xy7dj2U4/MYezzp/NoBjwPuNMWFXm64Cmsy0Em9tOSjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,205,1684814400"; 
   d="scan'208";a="118837742"
Date: Fri, 14 Jul 2023 16:34:29 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, <qemu-devel@nongnu.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: QEMU assert (was: [xen-unstable test] 181558: regressions - FAIL)
Message-ID: <a58f5bef-0543-4913-9a70-edb77c269a29@perard>
References: <osstest-181558-mainreport@xen.org>
 <ZJwoK50FcnTSfFZ8@MacBook-Air-de-Roger.local>
 <947da45d-f336-4034-bf51-fb190420506b@perard>
 <ZKPs5r3wen4PymqX@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZKPs5r3wen4PymqX@MacBook-Air-de-Roger.local>

On Tue, Jul 04, 2023 at 11:56:54AM +0200, Roger Pau Monné wrote:
> On Tue, Jul 04, 2023 at 10:37:38AM +0100, Anthony PERARD wrote:
> > On Wed, Jun 28, 2023 at 02:31:39PM +0200, Roger Pau Monné wrote:
> > > On Fri, Jun 23, 2023 at 03:04:21PM +0000, osstest service owner wrote:
> > > > flight 181558 xen-unstable real [real]
> > > > http://logs.test-lab.xenproject.org/osstest/logs/181558/
> > > > 
> > > > Regressions :-(
> > > > 
> > > > Tests which did not succeed and are blocking,
> > > > including tests which could not be run:
> > > >  test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 181545
> > > 
> > > The test failing here is hitting the assert in qemu_cond_signal() as
> > > called by worker_thread():
> > > 
> > > #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > > #1  0x00007ffff740b535 in __GI_abort () at abort.c:79
> > > #2  0x00007ffff740b40f in __assert_fail_base (fmt=0x7ffff756cef0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x55555614abcb "cond->initialized",
> > >     file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198, function=<optimized out>) at assert.c:92
> > > #3  0x00007ffff74191a2 in __GI___assert_fail (assertion=0x55555614abcb "cond->initialized", file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198,
> > >     function=0x55555614ad80 <__PRETTY_FUNCTION__.17104> "qemu_cond_signal") at assert.c:101
> > > #4  0x0000555555f1c8d2 in qemu_cond_signal (cond=0x7fffb800db30) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:198
> > > #5  0x0000555555f36973 in worker_thread (opaque=0x7fffb800dab0) at ../qemu-xen-dir-remote/util/thread-pool.c:129
> > > #6  0x0000555555f1d1d2 in qemu_thread_start (args=0x7fffb8000b20) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:505
> > > #7  0x00007ffff75b0fa3 in start_thread (arg=<optimized out>) at pthread_create.c:486
> > > #8  0x00007ffff74e206f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> > > 
> > > I've been trying to figure out how it can get in such state, but so
> > > far I had no luck.  I'm not a QEMU expert, so it's probably better if
> > > someone else could handle this.
> > > 
> > > In the failures I've seen, and the reproduction I have, the assert
> > > triggers in the QEMU dom0 instance responsible for locally-attaching
> > > the disk to dom0 in order to run pygrub.
> > > 
> > > This is also with QEMU 7.2, as testing with upstream QEMU is blocked
> > > ATM, so there's a chance it has already been fixed upstream.
> > > 
> > > Thanks, Roger.
> > 
> > So, I've run a test with the latest QEMU and I can still reproduce the
> > issue. The test also fails with QEMU 7.1.0.
> > 
> > But, QEMU 7.0 seems to pass the test, even with a start-stop loop of 200
> > iteration. So I'll try to find out if something change in that range.
> > Or try to find out why would the thread pool be not initialised
> > properly.
> 
> Thanks for looking into this.
> 
> There are a set of changes from Paolo Bonzini:
> 
> 232e9255478f thread-pool: remove stopping variable
> 900fa208f506 thread-pool: replace semaphore with condition variable
> 3c7b72ddca9c thread-pool: optimize scheduling of completion bottom half
> 
> That landed in 7.1 that seem like possible candidates.

I think I've figured out the issue. I've sent a patch:
https://lore.kernel.org/qemu-devel/20230714152720.5077-1-anthony.perard@citrix.com/

I did run osstest with this patch, and 200 iteration of stop/start, no
more issue of qemu for dom0 disapearing. The issue I've found is osstest
not able to ssh to the guest, which seems to be started. And qemu for
dom0 is still running.

While the report exist:
    http://logs.test-lab.xenproject.org/osstest/logs/181785/

Cheers,

-- 
Anthony PERARD

