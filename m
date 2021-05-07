Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8405376D45
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 01:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124171.234363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf9xe-0002VD-G8; Fri, 07 May 2021 23:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124171.234363; Fri, 07 May 2021 23:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf9xe-0002TA-BX; Fri, 07 May 2021 23:32:46 +0000
Received: by outflank-mailman (input) for mailman id 124171;
 Fri, 07 May 2021 23:32:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lf9xd-0002T4-IM
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 23:32:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lf9xY-00029m-JG; Fri, 07 May 2021 23:32:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lf9xY-0000jH-8c; Fri, 07 May 2021 23:32:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:Cc:From:References:To:Subject;
	bh=RRKPR/aWrJ7LwPgDINzUrTMu5xyvpg8DPEZFvEJ00bY=; b=tMgCoUBHv9LaUWdllsRF+TRoZy
	oid+05c/Ar0UzQlYqI9V/H490UIzJySws7JJ8FKk+yqjLQqoMVKzkEqwQkybFEelgdCb6kaEtLCtn
	Ev5VYOjYO6dwhkYB8voarwgJbpHK7FkE4Kyl9eFYxow6bf69DLDjCH38dUyVEjyufvqc=;
Subject: Regression when booting 5.15 as dom0 on arm64 (WAS: Re: [linux-linus
 test] 161829: regressions - FAIL)
To: f.fainelli@gmail.com, Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-161829-mainreport@xen.org>
From: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel@vger.kernel.org,
 osstest service owner <osstest-admin@xenproject.org>, hch@lst.de,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Message-ID: <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org>
Date: Sat, 8 May 2021 00:32:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <osstest-161829-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi all,

On 07/05/2021 22:00, osstest service owner wrote:
> flight 161829 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/161829/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:

[...]

>   test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 152332
>   test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 152332
>   test-arm64-arm64-xl-credit2   8 xen-boot                 fail REGR. vs. 152332
>   test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 152332
>   test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 152332
>   test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 152332
>   test-amd64-amd64-amd64-pvgrub 20 guest-stop              fail REGR. vs. 152332
>   test-amd64-amd64-i386-pvgrub 20 guest-stop               fail REGR. vs. 152332
>   test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 152332
>   test-amd64-amd64-xl-qcow2    13 guest-start              fail REGR. vs. 152332
>   test-amd64-amd64-libvirt-vhd 13 guest-start              fail REGR. vs. 152332
>   test-amd64-amd64-examine      4 memdisk-try-append       fail REGR. vs. 152332
>   test-arm64-arm64-xl-seattle   8 xen-boot                 fail REGR. vs. 152332
>   test-armhf-armhf-xl-vhd      13 guest-start              fail REGR. vs. 152332

Osstest reported dom0 boot failure on all the arm64 platform we have. 
The stack trace is similar everywhere:

[   18.101077] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000008
[   18.101441] Mem abort info:
[   18.101625]   ESR = 0x96000004
[   18.101839]   EC = 0x25: DABT (current EL), IL = 32 bits
[   18.102111]   SET = 0, FnV = 0
[   18.102327]   EA = 0, S1PTW = 0
[   18.102544] Data abort info:
[   18.102747]   ISV = 0, ISS = 0x00000004
[   18.102968]   CM = 0, WnR = 0
[   18.103183] [0000000000000008] user address but active_mm is swapper
[   18.103476] Internal error: Oops: 96000004 [#1] SMP
[   18.103689] Modules linked in:
[   18.103881] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc3+ #126
[   18.104172] Hardware name: Foundation-v8A (DT)
[   18.104376] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[   18.104653] pc : xen_swiotlb_dma_supported+0x30/0xc8
[   18.104893] lr : dma_supported+0x38/0x68
[   18.105118] sp : ffff80001295bac0
[   18.105289] x29: ffff80001295bac0 x28: ffff8000114f44c0
[   18.105600] x27: 0000000000000007 x26: ffff8000113a1000
[   18.105906] x25: 0000000000000000 x24: ffff800011d2e910
[   18.106213] x23: ffff800011d4d000 x22: ffff000012fad810
[   18.106525] x21: ffffffffffffffff x20: ffffffffffffffff
[   18.106837] x19: ffff000012fad810 x18: 00000000ffffffeb
[   18.107146] x17: 0000000000000000 x16: 00000000493f1445
[   18.107450] x15: ffff80001132d000 x14: 000000001c131000
[   18.107759] x13: 00000000498d0616 x12: ffff8000129f7000
[   18.108068] x11: ffff000012c08710 x10: ffff800011a91000
[   18.108380] x9 : 0000000000003000 x8 : ffff00001ffff000
[   18.108722] x7 : ffff800011a90a88 x6 : ffff800010a7275c
[   18.109031] x5 : 0000000000000000 x4 : 0000000000000001
[   18.109331] x3 : 2cd8f9dc91b3df00 x2 : ffff8000109c7578
[   18.109640] x1 : 0000000000000000 x0 : 0000000000000000
[   18.109940] Call trace:
[   18.110079]  xen_swiotlb_dma_supported+0x30/0xc8
[   18.110319]  dma_supported+0x38/0x68
[   18.110543]  dma_set_mask+0x30/0x58
[   18.110765]  virtio_mmio_probe+0x1c8/0x238
[   18.110979]  platform_probe+0x6c/0x108
[   18.111188]  really_probe+0xfc/0x3c8
[   18.111413]  driver_probe_device+0x68/0xe8
[   18.111647]  device_driver_attach+0x74/0x98
[   18.111883]  __driver_attach+0x98/0xe0
[   18.112111]  bus_for_each_dev+0x84/0xd8
[   18.112334]  driver_attach+0x30/0x40
[   18.112557]  bus_add_driver+0x168/0x228
[   18.112784]  driver_register+0x64/0x110
[   18.113016]  __platform_driver_register+0x34/0x40
[   18.113257]  virtio_mmio_init+0x20/0x28
[   18.113480]  do_one_initcall+0x90/0x470
[   18.113694]  kernel_init_freeable+0x3ec/0x440
[   18.113950]  kernel_init+0x1c/0x138
[   18.114158]  ret_from_fork+0x10/0x18
[   18.114409] Code: f000f641 f000a200 f944e821 f9410400 (f9400434)
[   18.114718] ---[ end trace d39406719f25d228 ]---
[   18.115044] Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b
[   18.115339] SMP: stopping secondary CPUs
[   18.115584] Kernel Offset: disabled
[   18.115743] CPU features: 0x00240000,61802000
[   18.115954] Memory Limit: none
[   18.116173] ---[ end Kernel panic - not syncing: Attempted to kill 
init! exitcode=0x0000000b ]---

I have bisected manually and pinpoint the following commit:

commit 2726bf3ff2520dba61fafc90a055640f7ad54e05 (refs/bisect/bad)
Author: Florian Fainelli <f.fainelli@gmail.com>
Date:   Mon Mar 22 18:53:49 2021 -0700

     swiotlb: Make SWIOTLB_NO_FORCE perform no allocation

     When SWIOTLB_NO_FORCE is used, there should really be no allocations of
     default_nslabs to occur since we are not going to use those slabs. If a
     platform was somehow setting swiotlb_no_force and a later call to
     swiotlb_init() was to be made we would still be proceeding with
     allocating the default SWIOTLB size (64MB), whereas if swiotlb=noforce
     was set on the kernel command line we would have only allocated 2KB.

     This would be inconsistent and the point of initializing default_nslabs
     to 1, was intended to allocate the minimum amount of memory 
possible, so
     simply remove that minimal allocation period.

     Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
     Reviewed-by: Christoph Hellwig <hch@lst.de>
     Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

The pointer dereferenced seems to suggest that the swiotlb hasn't been 
allocated. From what I can tell, this may be because swiotlb_force is 
set to SWIOTLB_NO_FORCE, we will still enable the swiotlb when running 
on top of Xen.

I am not entirely sure what would be the correct fix. Any opinions?

Cheers,

> 
> Regressions which are regarded as allowable (not blocking):
>   test-amd64-amd64-xl-rtds     20 guest-localmigrate/x10   fail REGR. vs. 152332
> 
> Tests which did not succeed, but are not blocking:
>   test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 152332
>   test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 152332
>   test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 152332
>   test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 152332
>   test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 152332
>   test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 152332
>   test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 152332
>   test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
>   test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
>   test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
>   test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
>   test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
>   test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
>   test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
>   test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
>   test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
>   test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
>   test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
>   test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
>   test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
>   test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
> 
> version targeted for testing:
>   linux                e48661230cc35b3d0f4367eddfc19f86463ab917
> baseline version:
>   linux                deacdb3e3979979016fcd0ffd518c320a62ad166
> 
> Last test of basis   152332  2020-07-31 19:41:23 Z  280 days
> Failing since        152366  2020-08-01 20:49:34 Z  279 days  465 attempts
> Testing same since   161829  2021-05-07 05:12:46 Z    0 days    1 attempts
> 
> ------------------------------------------------------------
> 5992 people touched revisions under test,
> not listing them all
> 
> jobs:
>   build-amd64-xsm                                              pass
>   build-arm64-xsm                                              pass
>   build-i386-xsm                                               pass
>   build-amd64                                                  pass
>   build-arm64                                                  pass
>   build-armhf                                                  pass
>   build-i386                                                   pass
>   build-amd64-libvirt                                          pass
>   build-arm64-libvirt                                          pass
>   build-armhf-libvirt                                          pass
>   build-i386-libvirt                                           pass
>   build-amd64-pvops                                            pass
>   build-arm64-pvops                                            pass
>   build-armhf-pvops                                            pass
>   build-i386-pvops                                             pass
>   test-amd64-amd64-xl                                          pass
>   test-amd64-coresched-amd64-xl                                pass
>   test-arm64-arm64-xl                                          fail
>   test-armhf-armhf-xl                                          pass
>   test-amd64-i386-xl                                           fail
>   test-amd64-coresched-i386-xl                                 fail
>   test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass
>   test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            fail
>   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass
>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         fail
>   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass
>   test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  fail
>   test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass
>   test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  fail
>   test-amd64-amd64-libvirt-xsm                                 pass
>   test-arm64-arm64-libvirt-xsm                                 fail
>   test-amd64-i386-libvirt-xsm                                  fail
>   test-amd64-amd64-xl-xsm                                      pass
>   test-arm64-arm64-xl-xsm                                      fail
>   test-amd64-i386-xl-xsm                                       fail
>   test-amd64-amd64-qemuu-nested-amd                            fail
>   test-amd64-amd64-xl-pvhv2-amd                                pass
>   test-amd64-i386-qemut-rhel6hvm-amd                           fail
>   test-amd64-i386-qemuu-rhel6hvm-amd                           fail
>   test-amd64-amd64-dom0pvh-xl-amd                              pass
>   test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass
>   test-amd64-i386-xl-qemut-debianhvm-amd64                     fail
>   test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass
>   test-amd64-i386-xl-qemuu-debianhvm-amd64                     fail
>   test-amd64-i386-freebsd10-amd64                              fail
>   test-amd64-amd64-qemuu-freebsd11-amd64                       pass
>   test-amd64-amd64-qemuu-freebsd12-amd64                       pass
>   test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass
>   test-amd64-i386-xl-qemuu-ovmf-amd64                          fail
>   test-amd64-amd64-xl-qemut-win7-amd64                         fail
>   test-amd64-i386-xl-qemut-win7-amd64                          fail
>   test-amd64-amd64-xl-qemuu-win7-amd64                         fail
>   test-amd64-i386-xl-qemuu-win7-amd64                          fail
>   test-amd64-amd64-xl-qemut-ws16-amd64                         fail
>   test-amd64-i386-xl-qemut-ws16-amd64                          fail
>   test-amd64-amd64-xl-qemuu-ws16-amd64                         fail
>   test-amd64-i386-xl-qemuu-ws16-amd64                          fail
>   test-armhf-armhf-xl-arndale                                  pass
>   test-amd64-amd64-xl-credit1                                  pass
>   test-arm64-arm64-xl-credit1                                  fail
>   test-armhf-armhf-xl-credit1                                  pass
>   test-amd64-amd64-xl-credit2                                  pass
>   test-arm64-arm64-xl-credit2                                  fail
>   test-armhf-armhf-xl-credit2                                  pass
>   test-armhf-armhf-xl-cubietruck                               pass
>   test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass
>   test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         fail
>   test-amd64-amd64-examine                                     pass
>   test-arm64-arm64-examine                                     fail
>   test-armhf-armhf-examine                                     pass
>   test-amd64-i386-examine                                      fail
>   test-amd64-i386-freebsd10-i386                               fail
>   test-amd64-amd64-qemuu-nested-intel                          pass
>   test-amd64-amd64-xl-pvhv2-intel                              pass
>   test-amd64-i386-qemut-rhel6hvm-intel                         fail
>   test-amd64-i386-qemuu-rhel6hvm-intel                         fail
>   test-amd64-amd64-dom0pvh-xl-intel                            pass
>   test-amd64-amd64-libvirt                                     pass
>   test-armhf-armhf-libvirt                                     pass
>   test-amd64-i386-libvirt                                      fail
>   test-amd64-amd64-xl-multivcpu                                pass
>   test-armhf-armhf-xl-multivcpu                                pass
>   test-amd64-amd64-pair                                        pass
>   test-amd64-i386-pair                                         fail
>   test-amd64-amd64-libvirt-pair                                pass
>   test-amd64-i386-libvirt-pair                                 fail
>   test-amd64-amd64-amd64-pvgrub                                fail
>   test-amd64-amd64-i386-pvgrub                                 fail
>   test-amd64-amd64-xl-pvshim                                   pass
>   test-amd64-i386-xl-pvshim                                    fail
>   test-amd64-amd64-pygrub                                      pass
>   test-amd64-amd64-xl-qcow2                                    fail
>   test-armhf-armhf-libvirt-raw                                 pass
>   test-amd64-i386-xl-raw                                       fail
>   test-amd64-amd64-xl-rtds                                     fail
>   test-armhf-armhf-xl-rtds                                     pass
>   test-arm64-arm64-xl-seattle                                  fail
>   test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass
>   test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              fail
>   test-amd64-amd64-xl-shadow                                   pass
>   test-amd64-i386-xl-shadow                                    fail
>   test-arm64-arm64-xl-thunderx                                 fail
>   test-amd64-amd64-libvirt-vhd                                 fail
>   test-armhf-armhf-xl-vhd                                      fail
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>      http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>      http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>      http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>      http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 
> 
> Not pushing.
> 
> (No revision log; it would be 1625261 lines long.)
> 

-- 
Julien Grall

