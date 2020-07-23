Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D822B55D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 20:05:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyfa1-0003YP-19; Thu, 23 Jul 2020 18:04:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1OPV=BC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyfZz-0003YJ-Bq
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 18:04:27 +0000
X-Inumbo-ID: f17a3b90-cd0e-11ea-a2f7-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f17a3b90-cd0e-11ea-a2f7-12813bfff9fa;
 Thu, 23 Jul 2020 18:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cJf61rxVLo+ii9E89SGksnPeWHNEfiL+W8w2zdwell0=; b=zmz0n+a8FrfRaio3PWidp7ujEj
 4ddBq97a6+QlkwjpV+pqk0tMnQolld77OrWwRggDIElyESVdJFoaeG0lyF61pDEOfwIec/rNiJLFW
 GeCHb8iSGdC473uvWQ+deGly6mo7jRNioMyuGZDQoLd2AZ7lMRFoQeKlafBi/eeHzEtM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyfZx-0006Oz-11; Thu, 23 Jul 2020 18:04:25 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyfZw-0004iw-MB; Thu, 23 Jul 2020 18:04:24 +0000
Subject: Re: Porting Xen to Jetson Nano
To: Srinivas Bangalore <srini@yujala.com>, xen-devel@lists.xenproject.org,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9736680b-1c81-652b-552b-4103341bad50@xen.org>
Date: Thu, 23 Jul 2020 19:04:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002801d66051$90fe2300$b2fa6900$@yujala.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/07/2020 18:57, Srinivas Bangalore wrote:
> Dear Xen experts,

Hello,

> Would greatly appreciate some hints on how to move forward with this one…

 From your first set of original log:

 > Xen version 4.8.5 (srinivas@) (aarch64-linux-gnu-gcc
 > (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0) debug=n  Sun Jul 19 07:44:00
 > PDT 2020

I would recommend to compile Xen with debug enabled (CONFIG_DEBUG=y) as 
it may provide you more information of what's happening.

Also, aside the Tegra series. Do you have any other patches on top?

[...]

> (XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)
> 
> (XEN) Grant table range: 0x000000fec00000-0x000000fec60000
> 
> (XEN) Loading zImage from 00000000e1000000 to 
> 00000000a0080000-00000000a223c808
> 
> (XEN) Allocating PPI 16 for event channel interrupt
> 
> (XEN) Loading dom0 DTB to 0x00000000a8000000-0x00000000a803435c

[...]

> 
> (XEN) *** Dumping CPU0 guest state (d0v0): ***
> 
> (XEN) ----[ Xen-4.8.5  arm64  debug=n   Tainted:  C   ]----
> 
> (XEN) CPU:    0
> 
> (XEN) PC:     00000000a0080000

PC is pointing to the entry point of your kernel...

> 
> (XEN) LR:     0000000000000000
> 
> (XEN) SP_EL0: 0000000000000000
> 
> (XEN) SP_EL1: 0000000000000000
> 
> (XEN) CPSR:   000001c5 MODE:64-bit EL1h (Guest Kernel, handler)
> 
> (XEN)      X0: 00000000a8000000  X1: 0000000000000000  X2: 0000000000000000
> 
> (XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: 0000000000000000
> 
> (XEN)      X6: 0000000000000000  X7: 0000000000000000  X8: 0000000000000000
> 
> (XEN)      X9: 0000000000000000 X10: 0000000000000000 X11: 0000000000000000
> 
> (XEN)     X12: 0000000000000000 X13: 0000000000000000 X14: 0000000000000000
> 
> (XEN)     X15: 0000000000000000 X16: 0000000000000000 X17: 0000000000000000
> 
> (XEN)     X18: 0000000000000000 X19: 0000000000000000 X20: 0000000000000000
> 
> (XEN)     X21: 0000000000000000 X22: 0000000000000000 X23: 0000000000000000
> 
> (XEN)     X24: 0000000000000000 X25: 0000000000000000 X26: 0000000000000000
> 
> (XEN)     X27: 0000000000000000 X28: 0000000000000000  FP: 0000000000000000
> 
> (XEN)
> 
> (XEN)    ELR_EL1: 0000000000000000
> 
> (XEN)    ESR_EL1: 00000000
> 
> (XEN)    FAR_EL1: 0000000000000000
> 
> (XEN)
> 
> (XEN)  SCTLR_EL1: 00c50838
> 
> (XEN)    TCR_EL1: 00000000
> 
> (XEN)  TTBR0_EL1: 0000000000000000
> 
> (XEN)  TTBR1_EL1: 0000000000000000
> 
> (XEN)
> 
> (XEN)   VTCR_EL2: 80043594
> 
> (XEN)  VTTBR_EL2: 000100017f0f9000
> 
> (XEN)
> 
> (XEN)  SCTLR_EL2: 30cd183d
> 
> (XEN)    HCR_EL2: 000000008038663f
> 
> (XEN)  TTBR0_EL2: 00000000fecfc000
> 
> (XEN)
> 
> (XEN)    ESR_EL2: 8200000d

... it looks like we are receiving a trap in EL2 because it can't 
execute the instruction. This is a bit odd as the p2m (stage-2 
page-tables) should be configured to allow execution. It would be useful 
if you can dump the p2m walk here. This following patch should do the 
job (not compiled test):

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index d578a5c598dd..af1834cdf735 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2489,9 +2489,14 @@ static void do_trap_instr_abort_guest(struct 
cpu_user_regs *regs,
           */
          rc = gva_to_ipa(gva, &gpa, GV2M_READ);
          if ( rc == -EFAULT )
+        {
+            printk("Unable to translate 0x%lx\n", gva);
              return; /* Try again */
+        }
      }

+    dump_p2m_walk(current->domain, gpa);
+
      switch ( fsc )
      {
      case FSC_FLT_PERM:


> 
> (XEN)  HPFAR_EL2: 0000000000000000
> 
> (XEN)    FAR_EL2: 00000000a0080000
> 
> (XEN)
> 
> (XEN) Guest stack trace from sp=0:
> 
> (XEN)   Failed to convert stack to physical address

[...]

> It seems the DOM0 kernel did not get added to the task list….

 From a look at the dump, dom0 vCPU0 has been scheduled and running on 
pCPU0.

> 
> Boot args for Xen and Dom0 are here:
> (XEN) Checking for initrd in /chosen
> 
> (XEN) linux,initrd limits invalid: 0000000084100000 >= 0000000084100000
> 
> (XEN) RAM: 0000000080000000 - 00000000fedfffff
> 
> (XEN) RAM: 0000000100000000 - 000000017f1fffff
> 
> (XEN)
> 
> (XEN) MODULE[0]: 00000000fc7f8000 - 00000000fc82d000 Device Tree
> 
> (XEN) MODULE[1]: 00000000e1000000 - 00000000e31bc808 Kernel       
> console=hvc0 earlyprintk=xen earlycon=xen rootfstype=ext4 rw rootwait 
> root=/dev/mmcblk0p1 rdinit=/sbin/init

You want to use earlycon=xenboot here.

> 
> (XEN)  RESVD[0]: 0000000080000000 - 0000000080020000
> 
> (XEN)  RESVD[1]: 00000000e3500000 - 00000000e3535000
> 
> (XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000
> 
> (XEN)
> 
> (XEN) Command line: console=dtuart earlyprintk=xen 
> earlycon=uart8250,mmio32,0x70006000 sync_console dom0_mem=512M 
> log_lvl=all guest_loglvl=all console_to_ring

FWIW, earlyprintk and earlycon are not understood by Xen. They are only 
useful for Dom0.

Best regards,

-- 
Julien Grall

