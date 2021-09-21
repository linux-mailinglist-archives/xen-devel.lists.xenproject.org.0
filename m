Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D364413E17
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 01:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191977.342165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpLn-0005PC-SY; Tue, 21 Sep 2021 23:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191977.342165; Tue, 21 Sep 2021 23:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpLn-0005MZ-Of; Tue, 21 Sep 2021 23:38:59 +0000
Received: by outflank-mailman (input) for mailman id 191977;
 Tue, 21 Sep 2021 23:38:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvEq=OL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mSpLm-0005MT-4i
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 23:38:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 167ed822-1b35-11ec-b940-12813bfff9fa;
 Tue, 21 Sep 2021 23:38:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D08F604DC;
 Tue, 21 Sep 2021 23:38:56 +0000 (UTC)
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
X-Inumbo-ID: 167ed822-1b35-11ec-b940-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632267536;
	bh=ReO7nx50rtBUa/cH2PmFCMlKCCW4WPJ6VzwFL0qZO5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fZJH1mLEt/VHB5Pwp1iMuPDmdW4Lghk9yLUjQca7v24Y4DToHXzvl4ouUwe6zJC4V
	 EbakIoG/LSIQw5fPdn86g0AhhFPiBCon2MbDqALxwu7Ek5Ydu7AXaZdDk9xbR+87An
	 ufcm4dp3rhHbjc2ax2m5qEyQ/eeYkhqHmEGys2SJWHWR8ModLIgBX/VsXrfDospDE5
	 Dz6+26bFvYuK792G5X/jVqHLitjrtqYtUezwDjMMpXMb1YLmxvjFrLx5I5flBHR6p2
	 DwxGRW8YsXICZ6cGTnB6o0pDsyra8aiu5Pz4LdptbvBx6oA2P08paN0pimF4NlAMbT
	 fDBv2gaD7WonQ==
Date: Tue, 21 Sep 2021 16:38:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    dpsmith@apertussolutions.com, sstabellini@kernel.org
Subject: Re: [xen-unstable test] 164996: regressions - FAIL
In-Reply-To: <24904.44119.940679.241639@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2109211631330.17979@sstabellini-ThinkPad-T480s>
References: <osstest-164996-mainreport@xen.org> <d049ba60-db81-aaa4-1769-54c6964cfd06@suse.com> <24904.44119.940679.241639@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Sep 2021, Ian Jackson wrote:
> Jan Beulich writes ("Re: [xen-unstable test] 164996: regressions - FAIL"):
> > As per
> > 
> > Sep 15 14:44:55.502598 [ 1613.322585] Mem-Info:
> > Sep 15 14:44:55.502643 [ 1613.324918] active_anon:5639 inactive_anon:15857 isolated_anon:0
> > Sep 15 14:44:55.514480 [ 1613.324918]  active_file:13286 inactive_file:11182 isolated_file:0
> > Sep 15 14:44:55.514545 [ 1613.324918]  unevictable:0 dirty:30 writeback:0 unstable:0
> > Sep 15 14:44:55.526477 [ 1613.324918]  slab_reclaimable:10922 slab_unreclaimable:30234
> > Sep 15 14:44:55.526540 [ 1613.324918]  mapped:11277 shmem:10975 pagetables:401 bounce:0
> > Sep 15 14:44:55.538474 [ 1613.324918]  free:8364 free_pcp:100 free_cma:1650
> > 
> > the system doesn't look to really be out of memory; as per
> > 
> > Sep 15 14:44:55.598538 [ 1613.419061] DMA32: 2788*4kB (UMEC) 890*8kB (UMEC) 497*16kB (UMEC) 36*32kB (UMC) 1*64kB (C) 1*128kB (C) 9*256kB (C) 7*512kB (C) 0*1024kB 0*2048kB 0*4096kB = 33456kB
> > 
> > there even look to be a number of higher order pages available (albeit
> > without digging I can't tell what "(C)" means). Nevertheless order-4
> > allocations aren't really nice.
> 
> The host history suggests this may possibly be related to a qemu update.
> 
> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.html
> 
> > What I can't see is why this may have started triggering recently. Was
> > the kernel updated in osstest? Is 512Mb of memory perhaps a bit too
> > small for a Dom0 on this system (with 96 CPUs)? Going through the log
> > I haven't been able to find crucial information like how much memory
> > the host has or what the hypervisor command line was.
> 
> Logs from last host examination, including a dmesg:
> 
> http://logs.test-lab.xenproject.org/osstest/results/host/rochester0.examine/
> 
> Re the command line, does Xen not print it ?
> 
> The bootloader output seems garbled in the serial log.
> 
> Anyway, I think Xen is being booted EFI judging by the grub cfg:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/165002/test-arm64-arm64-libvirt-raw/rochester0--grub.cfg.1
> 
> which means that it is probaly reading this:
> 
> http://logs.test-lab.xenproject.org/osstest/logs/165002/test-arm64-arm64-libvirt-raw/rochester0--xen.cfg
> 
> which gives this specification of the command line:
> 
>   options=placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  
> 
> The grub cfg has this:
> 
>  multiboot /xen placeholder conswitch=x watchdog noreboot async-show-all console=dtuart dom0_mem=512M,max:512M ucode=scan  ${xen_rm_opts}
> 
> It's not clear to me whether xen_rm_opts is "" or "no-real-mode edd=off".

I definitely recommend to increase dom0 memory, especially as I guess
the box is going to have a significant amount, far more than 4GB. I
would set it to 2GB. Also the syntax on ARM is simpler, so it should be
just: dom0_mem=2G

In addition, I also did some investigation just in case there is
actually a bug in the code and it is not a simple OOM problem.

Looking at the recent OSSTests results, the first failure is:
https://marc.info/?l=xen-devel&m=163145323631047
http://logs.test-lab.xenproject.org/osstest/logs/164951/

Indeed, the failure is the same test-arm64-arm64-libvirt-raw which is
still failing in more recent tests:
http://logs.test-lab.xenproject.org/osstest/logs/164951/test-arm64-arm64-libvirt-raw/info.html

But if we look at the commit id of flight 164951, it is
6d45368a0a89e01a3a01d156af61fea565db96cc "xsm: drop dubious xsm_op_t
type" by Daniel P. Smith (CCed).

It is interesting because:
- it is *before* all the recent ARM patch series
- it is only 4 commits after master


The 4 commits are:

2021-09-10 16:12 Daniel P. Smith   o xsm: drop dubious xsm_op_t type
2021-09-10 16:12 Daniel P. Smith   o xsm: remove remnants of xsm_memtype hook
2021-09-10 16:12 Daniel P. Smith   o xsm: remove the ability to disable flask
2021-09-10 16:12 Andrew Cooper     o xen: Implement xen/alternative-call.h for use in common code


Looking at them in details:

- "xen: Implement xen/alternative-call.h for use in common code" shouldn'
It shouldn't affect ARM at all

- "xsm: remove the ability to disable flask"
It would only affect the test case if libvirt directly or via libxl
calls FLASK_DISABLE.

- "xsm: remove remnants of xsm_memtype hook"
Shouldn't have any effects

- "xsm: drop dubious xsm_op_t type"
It doesn't look like it should have any runtime effect, only build time


So among these four, only "xsm: remove the ability to disable flask"
seems to have the potential to break a libvirt guest start test. Even
that, it is far fetched and the lack of an explicit XSM-related error
message in the logs would really point in the direction of an OOM.


