Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A33B014F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 12:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145804.268169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvdaC-0007AN-Nq; Tue, 22 Jun 2021 10:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145804.268169; Tue, 22 Jun 2021 10:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvdaC-00077a-Ku; Tue, 22 Jun 2021 10:24:40 +0000
Received: by outflank-mailman (input) for mailman id 145804;
 Tue, 22 Jun 2021 10:24:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lvdaB-00077U-Oa
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 10:24:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lvdaA-0000Oo-MH; Tue, 22 Jun 2021 10:24:38 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lvdaA-00033j-DQ; Tue, 22 Jun 2021 10:24:38 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To;
	bh=H4BHrj9tYa11orFuxm3i4mnP3I9EL9nTIjRz1y9m00Y=; b=VNTh95rr2KdfSaQ4SiQBXMCIHn
	BbYAKUXl9rLE3ZGaafm695upeDqf+AfrCoM9tyAZmOo5e36q10kHq/06MFt4wTvnYZq6gMx7r7+PY
	/sVlMN/LmxLz6czFsKEmOrZk2C7HViN3i2CB4fH6mtk+WQYFOOQAa7ceb2Gv/W8yulYo=;
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel@vger.kernel.org, mheyne@amazon.de
From: Julien Grall <julien@xen.org>
Subject: Interrupt for port 19, but apparently not enabled; per-user
 000000004af23acc
Message-ID: <6552fc66-ba19-2c77-7928-b0272d3e1622@xen.org>
Date: Tue, 22 Jun 2021 12:24:36 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

As discussed on IRC yesterday, we noticed a couple of splat in 5.13-rc6 
(and stable 5.4) in the evtchn driver:

[    7.581000] ------------[ cut here ]------------
[    7.581899] Interrupt for port 19, but apparently not enabled; 
per-user 000000004af23acc
[    7.583401] WARNING: CPU: 0 PID: 467 at 
/home/ANT.AMAZON.COM/jgrall/works/oss/linux/drivers/xen/evtchn.c:169 
evtchn_interrupt+0xd5/0x100
[    7.585583] Modules linked in:
[    7.586188] CPU: 0 PID: 467 Comm: xenstore-read Not tainted 
5.13.0-rc6 #240
[    7.587462] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[    7.589462] RIP: e030:evtchn_interrupt+0xd5/0x100
[    7.590361] Code: 48 8d bb d8 01 00 00 ba 01 00 00 00 be 1d 00 00 00 
e8 5f 72 c4 ff eb b2 8b 75 20 48 89 da 48 c7 c7 a8 03 5f 82 e8 6b 2d 96 
ff <0f> 0b e9 4d ff ff ff 41 0f b6 f4 48 c7 c7 80 da a2 82 e8 f0
[    7.593662] RSP: e02b:ffffc90040003e60 EFLAGS: 00010082
[    7.594636] RAX: 0000000000000000 RBX: ffff888102328c00 RCX: 
0000000000000027
[    7.595924] RDX: 0000000000000000 RSI: ffff88817fe18ad0 RDI: 
ffff88817fe18ad8
[    7.597216] RBP: ffff888108ef8140 R08: 0000000000000000 R09: 
0000000000000001
[    7.598522] R10: 0000000000000000 R11: 7075727265746e49 R12: 
0000000000000000
[    7.599810] R13: ffffc90040003ec4 R14: ffff8881001b8000 R15: 
ffff888109b36f80
[    7.601113] FS:  0000000000000000(0000) GS:ffff88817fe00000(0000) 
knlGS:0000000000000000
[    7.602570] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.603700] CR2: 00007f15b390e368 CR3: 000000010bb04000 CR4: 
0000000000050660
[    7.604993] Call Trace:
[    7.605501]  <IRQ>
[    7.605929]  __handle_irq_event_percpu+0x4c/0x330
[    7.606817]  handle_irq_event_percpu+0x32/0xa0
[    7.607670]  handle_irq_event+0x3a/0x60
[    7.608416]  handle_edge_irq+0x9b/0x1f0
[    7.609154]  generic_handle_irq+0x4f/0x60
[    7.609918]  __evtchn_fifo_handle_events+0x195/0x3a0
[    7.610864]  __xen_evtchn_do_upcall+0x66/0xb0
[    7.611693]  __xen_pv_evtchn_do_upcall+0x1d/0x30
[    7.612582]  xen_pv_evtchn_do_upcall+0x9d/0xc0
[    7.613439]  </IRQ>
[    7.613882]  exc_xen_hypervisor_callback+0x8/0x10

This is quite similar to the problem I reported a few months ago (see 
[1]) but this time this is happening with fifo rather than 2L.

I haven't been able to reproduced it reliably so far. But looking at the 
code, I think I have found another potential race after commit

commit b6622798bc50b625a1e62f82c7190df40c1f5b21
Author: Juergen Gross <jgross@suse.com>
Date:   Sat Mar 6 17:18:33 2021 +0100
     xen/events: avoid handling the same event on two cpus at the same time
     When changing the cpu affinity of an event it can happen today that
     (with some unlucky timing) the same event will be handled on the old
     and the new cpu at the same time.
     Avoid that by adding an "event active" flag to the per-event data and
     call the handler only if this flag isn't set.
     Cc: stable@vger.kernel.org
     Reported-by: Julien Grall <julien@xen.org>
     Signed-off-by: Juergen Gross <jgross@suse.com>
     Reviewed-by: Julien Grall <jgrall@amazon.com>
     Link: https://lore.kernel.org/r/20210306161833.4552-4-jgross@suse.com
     Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

The evtchn driver will use the lateeoi handlers. So the code to ack 
looks like:

do_mask(..., EVT_MASK_REASON_EOI_PENDING)
smp_store_release(&info->is_active, 0);
clear_evtchn(info->evtchn);

The code to handle an interrupts look like:

clear_link(...)
if ( evtchn_fifo_is_pending(port) && !evtchn_fifo_is_mask()) {
    if (xchg_acquire(&info->is_active, 1)
      return;
    generic_handle_irq();
}

After changing the affinity, an interrupt may be received once on the 
previous vCPU. So, I think the following can happen:

vCPU0                             | vCPU1
				  |
   Receive event			  |
				  | change affinity to vCPU1
   clear_link()			  |
      				  |
	           /* The interrupt is re-raised */
				  | receive event
    				  |
				  | /* The interrupt is not masked */
   info->is_active = 1		  |
   do_mask(...)			  |
   info->is_active = 0		  |
				  | info->is_active = 1
   clear_evtchn(...)               |
                                   | do_mask(...)
                                   | info->is_active = 0
				  | clear_evtchn(...)

Does this look plausible to you?

Cheers,

[1] https://www.spinics.net/lists/kernel/msg3771782.html



-- 
Julien Grall

