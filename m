Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66157B891
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 16:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371884.603739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEAjZ-00032V-Mc; Wed, 20 Jul 2022 14:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371884.603739; Wed, 20 Jul 2022 14:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEAjZ-0002zp-J4; Wed, 20 Jul 2022 14:31:29 +0000
Received: by outflank-mailman (input) for mailman id 371884;
 Wed, 20 Jul 2022 14:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgt+=XZ=citrix.com=prvs=193804040=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEAjY-0002ze-2A
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 14:31:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02e128c-0838-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 16:31:26 +0200 (CEST)
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
X-Inumbo-ID: a02e128c-0838-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658327486;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=TJ6DZ2oWI3AF7li+JDEzJLBp+/fJiehqbIJe5gKaBXM=;
  b=PZ2p4vIVsbCrtea3Gh3ZrtaaOSVOBkyx71x7qdS2IZ5X5MWUw0w3ZNAN
   h/xFab8TPe1KrMXfa/YGFXMlRIL+TVafQ5qYj92px1Jo7lJDC++rcDWfi
   cLMwGFsSrwbZVnlZDH35ik7H2XpmgokFxv4WauvIEGFBXJccQgkSJRoIb
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 75525756
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jKAC8aw+BWraU6KP9MR6t+cDxirEfRIJ4+MujC+fZmUNrF6WrkUGy
 WBLCm6Obq6CMWHzcoslPIzn/B9QuZXSx9BmSVQ+riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7/s9JIGjhMsfjb90k35K2aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1vFUUnJJQnyt1YQmFz0
 eIjJTIESiCM0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5FMsjeKwb4eLEjCMbe5bjka35
 U3hxEnoXxA7KIOR0DSY0Uv504cjmgukAdlPRdVU7MVCglKJwXcIIAYLTlb9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+En7gWE0qX8/gOYDWhCQzJcAPQjvdM2RDE3k
 EOAhcngARR3qrqJTnSY/7aQ6zi1PEA9PWIEIDIfQBEey93iu50oyALCSM55F6y4hcGzHiv/q
 w1mtwBn2e9V15RSkfzmoxaX2FpAu6QlUCY0/wHGR3ua3jhWJ46YQ5KT5FrSycZPedPxoka6g
 JQUpySPxLlQUMHXzXbcHLxl8KKBvKjcbmCF6bJ7N9x4rmn2pSb+FWxFyGsmTHqFJProbtMAj
 KX7nQpKrKFeM3KxBUOcS9LgUp96pUQM+DmMaxw1UjatSsIoHON/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlAgeV2m3BmmD6PFfgXKihLNpLHPhaopUotagPSPojVEovfyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3EJTPPriv8pQ/XrPSfWJb9JQJUaC5LUUJJ9M4xMy4V47go
 hmAZ6Ov4AGv2S2WcF7UMiELhXGGdc8XkE/X9BcEZT6As0XPq672t8/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:6J8I4aE7wtVd34pmpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.92,286,1650945600"; 
   d="scan'208";a="75525756"
Date: Wed, 20 Jul 2022 15:31:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
CC: Xen-users <xen-users@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, George Dunlap <dunlapg@umich.edu>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: xen master: xl create hangs
Message-ID: <YtgRpBR0duVAqPZJ@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAbRAAjnRz3aFx_bSck4UDuz2jfsLuEiepSpT3aNvEh0HhRko8ZIKQYb2FWqtqUVJhxG9VzNDz4oTmqNU6HlSeorDeS_JrDns76I4yeHPrY=@protonmail.com>
 <S4N2Wfl4ELkLaDHWDd44TotbqXvtrCzjQ5_gKmiThQxKPdsssI93Hy-et5a4CIULJylIynUpvIRPTLL7Zkm4-4Nw6cNDfR9_Y5NWzIDsy6s=@protonmail.com>

CCing Juergen and xen-devel.

On Mon, Jul 18, 2022 at 06:25:54PM +0000, Mathieu Tarral wrote:
> Using gdb to debug the xl process, I get the following stacktrace:
> 
> (gdb) bt
> #0  __futex_abstimed_wait_common64 (private=128, cancel=true, abstime=0x0, op=265, expected=8652, futex_word=0x7f6debd22a50) at ./nptl/futex-internal.c:57
> #1  __futex_abstimed_wait_common (cancel=true, private=128, abstime=0x0, clockid=0, expected=8652, futex_word=0x7f6debd22a50) at ./nptl/futex-internal.c:87
> #2  __GI___futex_abstimed_wait_cancelable64 (futex_word=futex_word@entry=0x7f6debd22a50, expected=8652, clockid=clockid@entry=0, abstime=abstime@entry=0x0,
>     private=private@entry=128) at ./nptl/futex-internal.c:139
> #3  0x00007f6deba736a4 in __pthread_clockjoin_ex (threadid=140110084581248, thread_return=thread_return@entry=0x0, clockid=clockid@entry=0,
>     abstime=abstime@entry=0x0, block=block@entry=true) at ./nptl/pthread_join_common.c:105
> #4  0x00007f6deba73543 in ___pthread_join (threadid=<optimized out>, thread_return=thread_return@entry=0x0) at ./nptl/pthread_join.c:24
> #5  0x00007f6deb9a144b in xs_daemon_close (h=0x561db3bc5bc0) at xs.c:366
> #6  0x00007f6deb9a145f in xs_close (xsh=<optimized out>) at xs.c:386
> #7  0x00007f6debc43a36 in libxl_ctx_free (ctx=0x561db3bc52e0) at libxl.c:173
> #8  0x0000561db33bf5a3 in xl_ctx_free () at xl.c:370
> #9  0x00007f6deba22495 in __run_exit_handlers (status=0, listp=0x7f6debbf6838 <__exit_funcs>, run_list_atexit=run_list_atexit@entry=true,
>     run_dtors=run_dtors@entry=true) at ./stdlib/exit.c:113
> #10 0x00007f6deba22610 in __GI_exit (status=<optimized out>) at ./stdlib/exit.c:143
> #11 0x00007f6deba06d97 in __libc_start_call_main (main=main@entry=0x561db33c0425 <main>, argc=argc@entry=4, argv=argv@entry=0x7ffeb2f263d8)
>     at ../sysdeps/nptl/libc_start_call_main.h:74
> #12 0x00007f6deba06e40 in __libc_start_main_impl (main=0x561db33c0425 <main>, argc=4, argv=0x7ffeb2f263d8, init=<optimized out>, fini=<optimized out>,
>     rtld_fini=<optimized out>, stack_end=0x7ffeb2f263c8) at ../csu/libc-start.c:392
> #13 0x0000561db33bf425 in _start ()
> 
> Colorized version in a Github Gist:
> https://gist.github.com/Wenzel/4da1e0a025954fac13a0ee57147cc44f
> 
> So looks like xs_daemon_close is waiting on a thread to join:
> https://github.com/xen-project/xen/blob/a5fb66f4513c2c2d222dcc3753163b15690bd003/tools/libs/store/xs.c#L366

On Wed, Jul 20, 2022 at 12:53:29PM +0000, Mathieu Tarral wrote:
> > Verify that things work properly at that commit, then use that as the “good” starting point.
> 
> Turns out that this commit (74a11c43fd7e074b1f77631b446dd2115eacb9e8) was also bad.
> So I used git bisect again, but this time to find the commit which introduced the bug fix
> between 74a11c43fd7e074b1f77631b446dd2115eacb9e8 and RELEASE-4.16.1.
> 
> After a few steps, git bisect identified this commit:
> https://github.com/xen-project/xen/commit/59505f48fabed2e6fa5ad992edaabeb4a1441599
> "Turn off debug by default"
> Surprisingly simple.
> 
> And I confirm that it's one that fixes the issue of xl create hanging.
> 
> I cherry-picked this commit on master:
> https://user-images.githubusercontent.com/964610/179986382-a774c91a-7b68-416b-9dbe-226b8aca0673.png
> 
> recompiled and tested again, my master branch now works as expected, tested with the small config file I already had and the XTF test-pv64-example.
> 
> So it works, but I don't know why this commit fixed it.

$(debug) controls the level of optimisation of the compilation to make
it easier to debug.

So, with debug=y, we have libxenstore having issue with killing the
its reading thread? :-(
Maybe that reading thread is doing something that can't be stopped,
maybe it's waiting for a lock. Could you try to print a back trace of
that thread (or even all thread in `xl`)? ("thread apply all bt full" in gdb)

Thanks,

-- 
Anthony PERARD

