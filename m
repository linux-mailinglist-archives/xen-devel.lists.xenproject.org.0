Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BD449EBD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 23:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223638.386414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkDOG-0005hv-M9; Mon, 08 Nov 2021 22:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223638.386414; Mon, 08 Nov 2021 22:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkDOG-0005ez-IK; Mon, 08 Nov 2021 22:45:24 +0000
Received: by outflank-mailman (input) for mailman id 223638;
 Mon, 08 Nov 2021 22:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1ns=P3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkDOF-0005et-5d
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 22:45:23 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cadea44-40e5-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 23:45:20 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A32AF6134F;
 Mon,  8 Nov 2021 22:45:18 +0000 (UTC)
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
X-Inumbo-ID: 8cadea44-40e5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636411518;
	bh=Sc4Vwh2z9w7lDhAvPas9sVQajxYW+o46Zs2uLyTkWhw=;
	h=Date:From:To:cc:Subject:From;
	b=gBQsoQJ/9soxvB44qvg1zk/JRzgSZ5CuhHsmLBc9NhxGtIt03YdGFkW2LqBrYeZDz
	 GgsrhMAFgaRtx0nSNGJrMY1c9ez2J3/kfS6f+W7HhxY4JQqEVhzmUwWORl+PfyucmU
	 RyshnVcqPxf6bR4luogM9AOQUz7ZfDpPSzSwxh/LEFS4duVMpXNB5maIz8+C02edVy
	 Cwx6snOiNvL6I2HOXW4F2qGrq4SyxCKvjMKy3S30PJM4eKT+yg4BLkYkbHIFW2SL4N
	 S4Jdxy0WA044jgLazf3gZTo0yhaRc/a5bSkQt27YX/3vGe+0NBjEQxULZANYvfdQF+
	 YWowoVz3c1K4w==
Date: Mon, 8 Nov 2021 14:45:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: oleksandr_tyshchenko@epam.com
cc: sstabellini@kernel.org, julien@xen.org, iwj@xenproject.org, 
    Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org
Subject: ASSERT in rangeset_remove_range
Message-ID: <alpine.DEB.2.22.394.2111081430090.3317@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksandr, Julien,

I discovered a bug caused by the recent changes to introduce extended
regions in make_hypervisor_node (more logs appended):


(XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)
(XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)
(XEN) DEBUG find_unallocated_memory 994 s=40000000 e=7e7fffff
(XEN) DEBUG find_unallocated_memory 994 s=200000000 e=1ffffffff
(XEN) Assertion 's <= e' failed at rangeset.c:189


When a bank of memory is zero in size, then rangeset_remove_range is
called with end < start, triggering an ASSERT in rangeset_remove_range.

One solution is to avoid creating 0 size banks. The following change
does that:


diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 49b4eb2b13..3efe542d0f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -459,9 +459,12 @@ static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
         goto fail;
 
     bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
-    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
+    if ( bank_size > 0 )
+    {
+        if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
                                bank_size) )
-        goto fail;
+            goto fail;
+    }
 
     if ( kinfo->unassigned_mem )
         goto fail;



We have a couple of other options too:

- remove the ASSERT in rangeset_remove_range
There is an argument that we should simply return error
fromrangeset_remove_range, rather than a full assert.

- add a if (end > start) check before calling rangeset_remove_range
We could check that end > start before calling rangeset_remove_range at
all the call sites in domain_build.c. There are 5 call sites at the
moment.

Any other ideas or suggestions?

Cheers,

Stefano



(XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
(XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
(XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
(XEN) DEBUG find_memory_holes 1126 s=ff990000 e=ff990fff
(XEN) DEBUG find_memory_holes 1126 s=f9010000 e=f901ffff
(XEN) DEBUG find_memory_holes 1126 s=f9020000 e=f903ffff
(XEN) DEBUG find_memory_holes 1126 s=f9040000 e=f905ffff
(XEN) DEBUG find_memory_holes 1126 s=f9060000 e=f907ffff
(XEN) DEBUG find_memory_holes 1126 s=fd800000 e=fd81ffff
(XEN) DEBUG find_memory_holes 1126 s=ff060000 e=ff060fff
(XEN) DEBUG find_memory_holes 1126 s=ff070000 e=ff070fff
(XEN) DEBUG find_memory_holes 1126 s=fd6e0000 e=fd6e8fff
(XEN) DEBUG find_memory_holes 1126 s=fd6e9000 e=fd6edfff
(XEN) DEBUG find_memory_holes 1126 s=fd500000 e=fd500fff
(XEN) DEBUG find_memory_holes 1126 s=fd510000 e=fd510fff
(XEN) DEBUG find_memory_holes 1126 s=fd520000 e=fd520fff
(XEN) DEBUG find_memory_holes 1126 s=fd530000 e=fd530fff
(XEN) DEBUG find_memory_holes 1126 s=fd540000 e=fd540fff
(XEN) DEBUG find_memory_holes 1126 s=fd550000 e=fd550fff
(XEN) DEBUG find_memory_holes 1126 s=fd560000 e=fd560fff
(XEN) DEBUG find_memory_holes 1126 s=fd570000 e=fd570fff
(XEN) DEBUG find_memory_holes 1126 s=fd4b0000 e=fd4bffff
(XEN) DEBUG find_memory_holes 1126 s=ffa80000 e=ffa80fff
(XEN) DEBUG find_memory_holes 1126 s=ffa90000 e=ffa90fff
(XEN) DEBUG find_memory_holes 1126 s=ffaa0000 e=ffaa0fff
(XEN) DEBUG find_memory_holes 1126 s=ffab0000 e=ffab0fff
(XEN) DEBUG find_memory_holes 1126 s=ffac0000 e=ffac0fff
(XEN) DEBUG find_memory_holes 1126 s=ffad0000 e=ffad0fff
(XEN) DEBUG find_memory_holes 1126 s=ffae0000 e=ffae0fff
(XEN) DEBUG find_memory_holes 1126 s=ffaf0000 e=ffaf0fff
(XEN) DEBUG find_memory_holes 1126 s=fd070000 e=fd09ffff
(XEN) DEBUG find_memory_holes 1126 s=ff100000 e=ff100fff
(XEN) DEBUG find_memory_holes 1126 s=ff0b0000 e=ff0b0fff
(XEN) DEBUG find_memory_holes 1126 s=ff0c0000 e=ff0c0fff
(XEN) DEBUG find_memory_holes 1126 s=ff0d0000 e=ff0d0fff
(XEN) DEBUG find_memory_holes 1126 s=ff0e0000 e=ff0e0fff
(XEN) DEBUG find_memory_holes 1126 s=ff0a0000 e=ff0a0fff
(XEN) DEBUG find_memory_holes 1126 s=ff020000 e=ff020fff
(XEN) DEBUG find_memory_holes 1126 s=ff030000 e=ff030fff
(XEN) DEBUG find_memory_holes 1126 s=ff960000 e=ff960fff
(XEN) DEBUG find_memory_holes 1126 s=ffa00000 e=ffa0ffff
(XEN) DEBUG find_memory_holes 1126 s=fd0b0000 e=fd0bffff
(XEN) DEBUG find_memory_holes 1126 s=fd490000 e=fd49ffff
(XEN) DEBUG find_memory_holes 1126 s=ffa10000 e=ffa1ffff
(XEN) DEBUG find_memory_holes 1126 s=fd0e0000 e=fd0e0fff
(XEN) DEBUG find_memory_holes 1126 s=fd480000 e=fd480fff
(XEN) DEBUG find_memory_holes 1126 s=8000000000 e=8000ffffff
(XEN) DEBUG handle_pci_range 1056 s=e0000000 e=efffffff
(XEN) DEBUG handle_pci_range 1056 s=600000000 e=7ffffffff
(XEN) DEBUG find_memory_holes 1126 s=ff0f0000 e=ff0f0fff
(XEN) DEBUG find_memory_holes 1126 s=c0000000 e=c7ffffff
(XEN) DEBUG find_memory_holes 1126 s=ffa60000 e=ffa60fff
(XEN) DEBUG find_memory_holes 1126 s=fd400000 e=fd43ffff
(XEN) DEBUG find_memory_holes 1126 s=fd3d0000 e=fd3d0fff
(XEN) DEBUG find_memory_holes 1126 s=fd0c0000 e=fd0c1fff
(XEN) DEBUG find_memory_holes 1126 s=ff160000 e=ff160fff
(XEN) DEBUG find_memory_holes 1126 s=ff170000 e=ff170fff
(XEN) DEBUG find_memory_holes 1126 s=ff040000 e=ff040fff
(XEN) DEBUG find_memory_holes 1126 s=ff050000 e=ff050fff
(XEN) DEBUG find_memory_holes 1126 s=ff110000 e=ff110fff
(XEN) DEBUG find_memory_holes 1126 s=ff120000 e=ff120fff
(XEN) DEBUG find_memory_holes 1126 s=ff130000 e=ff130fff
(XEN) DEBUG find_memory_holes 1126 s=ff140000 e=ff140fff
(XEN) DEBUG find_memory_holes 1126 s=ff000000 e=ff000fff
(XEN) DEBUG find_memory_holes 1126 s=ff010000 e=ff010fff
(XEN) DEBUG find_memory_holes 1126 s=ff9d0000 e=ff9d0fff
(XEN) DEBUG find_memory_holes 1126 s=fe200000 e=fe23ffff
(XEN) DEBUG find_memory_holes 1126 s=ff9e0000 e=ff9e0fff
(XEN) DEBUG find_memory_holes 1126 s=fe300000 e=fe33ffff
(XEN) DEBUG find_memory_holes 1126 s=fd4d0000 e=fd4d0fff
(XEN) DEBUG find_memory_holes 1126 s=ff150000 e=ff150fff
(XEN) DEBUG find_memory_holes 1126 s=ffa50000 e=ffa50fff
(XEN) DEBUG find_memory_holes 1126 s=ffa50000 e=ffa50fff
(XEN) DEBUG find_memory_holes 1126 s=ffa50000 e=ffa50fff
(XEN) DEBUG find_memory_holes 1126 s=fd4c0000 e=fd4c0fff
(XEN) DEBUG find_memory_holes 1126 s=fd4a0000 e=fd4a0fff
(XEN) DEBUG find_memory_holes 1126 s=fd4aa000 e=fd4aafff
(XEN) DEBUG find_memory_holes 1126 s=fd4ab000 e=fd4abfff
(XEN) DEBUG find_memory_holes 1126 s=fd4ac000 e=fd4acfff
(XEN) DEBUG find_memory_holes 1126 s=0 e=7fefffff
(XEN) DEBUG find_memory_holes 1126 s=800000000 e=87fffffff
(XEN) Extended region 0: 0x80000000->0xc0000000
(XEN) Extended region 1: 0xc8000000->0xe0000000
(XEN) Extended region 2: 0xf0000000->0xf9000000
(XEN) Extended region 3: 0xffc00000->0x600000000
(XEN) Extended region 4: 0x880000000->0x8000000000
(XEN) Extended region 5: 0x8001000000->0x10000000000
(XEN) Loading zImage from 0000000000e00000 to 0000000020000000-0000000021367a00
(XEN) Loading d0 initrd from 0000000002200000 to 0x0000000028200000-0x00000000293f936d
(XEN) Loading d0 DTB to 0x0000000028000000-0x0000000028009604
(XEN) *** LOADING DOMU cpus=1 memory=fa000KB ***
(XEN) Loading d1 kernel from boot module @ 0000000003400000
(XEN) Loading ramdisk from boot module @ 0000000004800000
(XEN) Allocating mappings totalling 1000MB for d1:
(XEN) d1 BANK[0] 0x00000040000000-0x0000007e800000 (1000MB)
(XEN) d1 BANK[1] 0x00000200000000-0x00000200000000 (0MB)
(XEN) DEBUG find_unallocated_memory 994 s=40000000 e=7e7fffff
(XEN) DEBUG find_unallocated_memory 994 s=200000000 e=1ffffffff
(XEN) Assertion 's <= e' failed at rangeset.c:189
(XEN) ----[ Xen-4.16-rc  arm64  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     0000000000220e6c rangeset_remove_range+0xbc/0x2bc
(XEN) LR:     00000000002cd508
(XEN) SP:     0000000000306f60
(XEN) CPSR:   0000000020000249 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 00008000fbf61e70  X1: 0000000200000000  X2: 00000001ffffffff
(XEN)      X3: 0000000000000005  X4: 0000000000000000  X5: 0000000000000028
(XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f
(XEN)      X9: 717164616f726051 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
(XEN)     X12: 0000000000000008 X13: 0000000000000009 X14: 0000000000306cb8
(XEN)     X15: 0000000000000020 X16: 000000000028c5a8 X17: 0000000000000000
(XEN)     X18: 0180000000000000 X19: 00000001ffffffff X20: 0000000000000001
(XEN)     X21: 0000000200000000 X22: 0000000200000000 X23: 0000000000000002
(XEN)     X24: 0000000000000002 X25: 00000000003070e0 X26: 00000000002d9e68
(XEN)     X27: 00000000002d8d18 X28: 00008000fbf40000  FP: 0000000000306f60
(XEN) 
(XEN)   VTCR_EL2: 0000000080023558
(XEN)  VTTBR_EL2: 0000000000000000
(XEN) 
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 0000000000000038
(XEN)  TTBR0_EL2: 0000000004b45000
(XEN) 
(XEN)    ESR_EL2: 00000000f2000001
(XEN)  HPFAR_EL2: 0000000000000000
(XEN)    FAR_EL2: 0000000000000000
(XEN) 
(XEN) Xen stack trace from sp=0000000000306f60:
(XEN)    0000000000307040 00000000002cf2a8 00008000fbf5a000 0000000000000000
(XEN)    00008000fbf40000 00000000003070a8 0000000000307de4 00000000002aa078
(XEN)    0000000880000000 0000000000000002 00000000002e8d08 00000000000fff00
(XEN)    00008000fbf61e70 00008000fbf5a000 00008000fbf61220 0000000000000000
(XEN)    0000000000307040 00000000002cf288 00008000fbf5a000 0000000000000000
(XEN)    00008000fbf40000 00000000003070a8 0000000000307de4 65782c32766e6578
(XEN)    000000000030006e 2d6e65782c6e6578 6e65780036312e34 000000006e65782c
(XEN)    0000000000307d80 00000000002d0440 00008000fbfd95a0 0000000000307dc8
(XEN)    00000000002d99b8 00000000002da338 0000000000307de4 00000000002aa078
(XEN)    000000000000000f 0000000000307110 0000000000000001 00c2010000000002
(XEN)    00000000003070c8 0000000000000000 6d933f29040f0000 0000002200000000
(XEN)    0010000000000000 0020000300000000 0020000000000000 00000000000fa000
(XEN)    0000000000000001 00008000fbf5a000 00008000fbf40000 0000000000000000
(XEN)    0000000000000002 0000000040000000 000000003e800000 0000000000000000
(XEN)    0000000200000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<0000000000220e6c>] rangeset_remove_range+0xbc/0x2bc (PC)
(XEN)    [<00000000002cd508>] domain_build.c#make_hypervisor_node+0x258/0x7f4 (LR)
(XEN)    [<00000000002cf2a8>] domain_build.c#construct_domU+0x9cc/0xa8c
(XEN)    [<00000000002d0440>] create_domUs+0xe8/0x224
(XEN)    [<00000000002d4988>] start_xen+0xafc/0xbf0
(XEN)    [<00000000002001a0>] arm64/head.o#primary_switched+0xc/0x1c
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 's <= e' failed at rangeset.c:189
(XEN) ****************************************

