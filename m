Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD8D746DBC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 11:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558200.872076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcTk-0002Pc-Dw; Tue, 04 Jul 2023 09:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558200.872076; Tue, 04 Jul 2023 09:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcTk-0002NM-BD; Tue, 04 Jul 2023 09:37:48 +0000
Received: by outflank-mailman (input) for mailman id 558200;
 Tue, 04 Jul 2023 09:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3Yz=CW=citrix.com=prvs=5427c2329=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qGcTi-0002NG-ND
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 09:37:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cafa7d8-1a4e-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 11:37:44 +0200 (CEST)
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
X-Inumbo-ID: 6cafa7d8-1a4e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688463464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/0yM5i/MfkpAusvz4raS8zb7nUWfMXgPEhK7n7D3RcY=;
  b=AHPO4DecT9oG/gaTwaYXtu40/XH2+2s9ddnW8SJVWG05Et/LZflvZ8RJ
   K8mGRpStnImHM0tG0ISTTY/XA9+pTXTD1UenMu7oi5XYxKoU85R1EVEhW
   2lklnSveEoIfnLmsfrAzFik5rxsems7xVd+Ob6pmErItZoSKOIkmlDSpG
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115110777
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:eV13K6rt8pNipSmBiEi2M4foXN9eBmIAZRIvgKrLsJaIsI4StFCzt
 garIBnTOqyCMTDyfYp1PoXi8BkD65HcyoAwTgI4rSo3HiwU9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzyVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC4qcg/biO2M+auEFONc2sY/dfKoYLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufoj2gWk5Fa7RzzxK7132Tq7+VkxnVAr4fD6Wo+KNRoQyckzl75Bo+CgLg/KjRZlSFc9BVJ
 lEQ+yEuhbMv70HtRd74NzWhrXuZ+xIRRddUO+s97g6L1+zT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8pCu/IyEPIUceZCUPSk0O5NyLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0NqtIUj6q0x2nevGymlsTLUlcOpVnuCzfNAhxCWGK1W2C5wQGFvaYcct/EHwnpU
 GsswJbHsr1XZX2ZvGnUGbhWQun0jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOUS9jrYyjS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9va
 cvDIJz1UypGWMyLKQZaoM9EgNcWKt0WnzuPFfgXMTz6uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivBnFSnCPq+Y7dAlaRUXX8Liq86S7gMbfeFs5cIzgYteNqY4cl3tNxPsFzruRp
 i7hASe1CjPX3BX6FOlDUVg7AJuHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:TwgqKaj8SvSygiAvUawlSS/6C3BQXtwji2hC6mlwRA09TySZ//
 rBoB0+726RtN93YgBGpTngAtjkfZqyz/NICOUqUYtKGTOW3ldAT7sSj7cKoQeBJ8SWzIc0vs
 1dmupFeb7N5DBB/L/HCWKDcurIruPpzJyV
X-Talos-CUID: 9a23:jOj4Om+dqaFWS7ed3quVv1AzBt99fXLn9W7vfUWIVWR1EYbWFWbFrQ==
X-Talos-MUID: 9a23:yNPueQaJ6zCK0eBTiRrjuxwybslSzf6SBVsVgZtbgOjVOnkl
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="115110777"
Date: Tue, 4 Jul 2023 10:37:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, <qemu-devel@nongnu.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: QEMU assert (was: [xen-unstable test] 181558: regressions - FAIL)
Message-ID: <947da45d-f336-4034-bf51-fb190420506b@perard>
References: <osstest-181558-mainreport@xen.org>
 <ZJwoK50FcnTSfFZ8@MacBook-Air-de-Roger.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZJwoK50FcnTSfFZ8@MacBook-Air-de-Roger.local>

On Wed, Jun 28, 2023 at 02:31:39PM +0200, Roger Pau Monné wrote:
> On Fri, Jun 23, 2023 at 03:04:21PM +0000, osstest service owner wrote:
> > flight 181558 xen-unstable real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/181558/
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 181545
> 
> The test failing here is hitting the assert in qemu_cond_signal() as
> called by worker_thread():
> 
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007ffff740b535 in __GI_abort () at abort.c:79
> #2  0x00007ffff740b40f in __assert_fail_base (fmt=0x7ffff756cef0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x55555614abcb "cond->initialized",
>     file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198, function=<optimized out>) at assert.c:92
> #3  0x00007ffff74191a2 in __GI___assert_fail (assertion=0x55555614abcb "cond->initialized", file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198,
>     function=0x55555614ad80 <__PRETTY_FUNCTION__.17104> "qemu_cond_signal") at assert.c:101
> #4  0x0000555555f1c8d2 in qemu_cond_signal (cond=0x7fffb800db30) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:198
> #5  0x0000555555f36973 in worker_thread (opaque=0x7fffb800dab0) at ../qemu-xen-dir-remote/util/thread-pool.c:129
> #6  0x0000555555f1d1d2 in qemu_thread_start (args=0x7fffb8000b20) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:505
> #7  0x00007ffff75b0fa3 in start_thread (arg=<optimized out>) at pthread_create.c:486
> #8  0x00007ffff74e206f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> 
> I've been trying to figure out how it can get in such state, but so
> far I had no luck.  I'm not a QEMU expert, so it's probably better if
> someone else could handle this.
> 
> In the failures I've seen, and the reproduction I have, the assert
> triggers in the QEMU dom0 instance responsible for locally-attaching
> the disk to dom0 in order to run pygrub.
> 
> This is also with QEMU 7.2, as testing with upstream QEMU is blocked
> ATM, so there's a chance it has already been fixed upstream.
> 
> Thanks, Roger.

So, I've run a test with the latest QEMU and I can still reproduce the
issue. The test also fails with QEMU 7.1.0.

But, QEMU 7.0 seems to pass the test, even with a start-stop loop of 200
iteration. So I'll try to find out if something change in that range.
Or try to find out why would the thread pool be not initialised
properly.

Cheers,

-- 
Anthony PERARD

