Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7319DBA86
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 16:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845525.1260900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGgUV-0007vr-4G; Thu, 28 Nov 2024 15:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845525.1260900; Thu, 28 Nov 2024 15:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGgUU-0007tQ-WA; Thu, 28 Nov 2024 15:31:38 +0000
Received: by outflank-mailman (input) for mailman id 845525;
 Thu, 28 Nov 2024 15:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JzN0=SX=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1tGgUT-0007tK-Ff
 for xen-devel@lists.xen.org; Thu, 28 Nov 2024 15:31:37 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6e3d53b-ad9d-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 16:31:32 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1tGgUE-00Alk6-Oe
 for xen-devel@lists.xen.org; Thu, 28 Nov 2024 15:31:29 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id F33CBB4C38E
 for <xen-devel@lists.xen.org>; Thu, 28 Nov 2024 15:31:31 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id BK3O6FKUE447 for <xen-devel@lists.xen.org>;
 Thu, 28 Nov 2024 15:31:31 +0000 (GMT)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk [192.168.1.5])
 by dingwall.me.uk (Postfix) with ESMTP id C5BB0B4C38B
 for <xen-devel@lists.xen.org>; Thu, 28 Nov 2024 15:31:31 +0000 (GMT)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id A9E64ED87A7; Thu, 28 Nov 2024 15:31:16 +0000 (GMT)
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
X-Inumbo-ID: d6e3d53b-ad9d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxMi4yMy4xLjUiLCJoZWxvIjoic21hcnRob3N0MDFjLnNicC5tYWlsLnplbi5uZXQudWsifQ==
X-Custom-Transaction: eyJpZCI6ImQ2ZTNkNTNiLWFkOWQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODA3ODkyLjExOTYyOCwic2VuZGVyIjoiamFtZXNAZGluZ3dhbGwubWUudWsiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZyJ9
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Thu, 28 Nov 2024 15:31:16 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xen.org
Subject: stable-4.18: reliably crash network driver domain by squeezing
 free_memory
Message-ID: <Z0iMxP2gah9Ky4Pl@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


Hi,

We have reproducible issue with the current HEAD of the stable-4.18 branch
which crashes a network driver domain and on some hardware subsequently
results in a dom0 crash.

`xl info` reports: free_memory : 39961, configuring a guest with
memory = 39800 and starting it gives the log as below.  This is intel
hardware so if I've followed the code correctly I think this leads through
to intel_iommu_map_page() from drivers/passthrough/vtd/iommu.c.

The expectation is that we can safely allocate up to free_memory for a
guest without any issue.  Is there any extra logging we could enable to
gain more information?

Thanks,
James


(XEN) d2: IOMMU mapping dfn afdf79 to mfn afdf79 failed: -12
(XEN) domain_crash called from drivers/passthrough/iommu.c:366
(XEN) Domain 2 (vcpu#1) crashed on cpu#3:
(XEN) ----[ Xen-4.18.4-pre  x86_64  debug=y  Not tainted ]----
(XEN) CPU:    3
(XEN) RIP:    e033:[<ffffffff8220128c>]
(XEN) RFLAGS: 0000000000000282   EM: 0   CONTEXT: pv guest (d2v1)
(XEN) rax: 0000000000000014   rbx: ffffc90041361000   rcx: ffffffff8220128c
(XEN) rdx: 0000000000000001   rsi: ffffc9004136b018   rdi: 0000000000000000
(XEN) rbp: ffffc900400e0e18   rsp: ffffc900400e0dc8   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000282
(XEN) r12: 0000000000000001   r13: ffffc9004136b018   r14: ffffc90041361000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003526e0
(XEN) cr3: 0000000cb07c6000   cr2: 00005dc9ed4f6710
(XEN) fsb: 000073436e0b9400   gsb: ffff888023100000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=ffffc900400e0dc8:
(XEN)    0000000000000000 0000000000000001 ffffffff81a94320 0000000000000000
(XEN)    ffffc9004136e818 ffffc90041361000 0000000000000000 0000000000000001
(XEN)    ffffc90041361000 0000000000000000 ffffc900400e0e58 ffffffffc0542f35
(XEN)    0000000100000001 1332c17936eda000 ffffc90041361030 0000000000000000
(XEN)    0000000000000040 ffffc90041361000 ffffc900400e0e88 ffffffffc05464ae
(XEN)    ffffc90041361030 0000000000000000 ffffc900400e0eef 0000000000000040
(XEN)    ffffc900400e0ec0 ffffffff81edef70 ffff888023135e40 000000000000012c
(XEN)    ffffc900400e0ef8 ffffc90041361030 0000000000000000 ffffc900400e0f48
(XEN)    ffffffff81edf551 ffffffff811b5c7f ffff888023136100 0000000100566b96
(XEN)    0000000000000007 ffff888023131b60 ffffc900400e0ef8 ffffc900400e0ef8
(XEN)    ffffc900400e0f08 ffffc900400e0f08 1332c17936eda000 0000000080000100
(XEN)    0000000000000003 0000000000000008 0000000000000004 ffffffff834060d8
(XEN)    ffffc900400e0fb8 ffffffff8110a198 ffff888023134200 0040010000000001
(XEN)    ffff888004798000 0000000100566b96 000000000000000a ffffc90000000003
(XEN)    ffffffff81a9f77e ffffc9004000b788 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffffc900400e0fd8 ffffffff8110a4e9
(XEN)    ffffc9004000b788 0000000000000000 ffffc900400e0fe8 ffffffff8110a84e
(XEN)    ffffc9004000b778 ffffffff821ffd0a ffffc9004000b760
(XEN)     Fault while accessing guest memory.
(XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
...repeated
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (3 of 4)
(XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
...repeated




decoding the symbols from the crashed driver domain:

vcpu0:
rip: ffffffff8220128c
flags: 00001282 i s nz
rsp: ffffc90040003dc8
rax: 0000000000000000 rcx: ffffffff8220128c rdx: deadbeefdeadf00d
rbx: ffffc90040358680 rsi: deadbeefdeadf00d rdi: deadbeefdeadf00d
rbp: ffffc90040003e18 r8: 0000000000000000 r9: 0000000000000000
r10: 0000000000000000 r11: 0000000000000282 r12: 0000000000000001
r13: ffffc90040362698 r14: ffffc90040358680 r15: 0000000000000000
cs: e033 ss: e02b ds: 0000 es: 0000
fs: 0000 @ 0000000000000000
gs: 0000 @ ffff888103c00000/0000000000000000
Code (instr addr ffffffff8220128c)
cc cc cc cc cc cc cc cc cc 51 41 53 48 c7 c0 14 00 00 00 0f 05 <41> 5b 59 c3 cc cc cc cc cc cc cc


Stack:
0000000000000000 0000000000000001 ffffffff81a942a0 0000000000000000
ffffc90040365e98 ffffc90040358680 0000000000000000 0000000000000001
ffffc90040358680 0000000000000000 ffffc90040003e58 ffffffffc05a6f35
0000000200000001 2acc1e6e51961900 ffffc900403586b0 0000000000000000
0000000000000040 ffffc90040358680 ffffc90040003e88 ffffffffc05aa4ae

Call Trace:
[<ffffffff8220128c>] <--  xen_hypercall_grant_table_op+0xc
ffffc90040003dd8: [<ffffffff81a942a0>]  gnttab_map_refs+0x30
ffffc90040003e20: [<ffffffffc05a6f35>]  
ffffc90040003e60: [<ffffffffc05aa4ae>]  
ffffc90040003e90: [<ffffffff81edede0>]  __napi_poll+0x30
ffffc90040003ec8: [<ffffffff81edf3c1>]  net_rx_action+0x181
ffffc90040003ed0: [<ffffffff811b5c7f>]  generic_handle_irq+0x1f
ffffc90040003f40: [<ffffffff834060d8>]  
ffffc90040003f50: [<ffffffff8110a198>]  handle_softirqs+0xd8
ffffc90040003f68: [<ffffffff8340fcc0>]  
ffffc90040003f88: [<ffffffff81a9f6fe>]  evtchn_fifo_handle_events+0xe
ffffc90040003f90: [<ffffffff83403cc8>]  
ffffc90040003fc0: [<ffffffff8110a4e9>]  __irq_exit_rcu+0xd9
ffffc90040003fc8: [<ffffffff83403cc8>]  
ffffc90040003fe0: [<ffffffff8110a84e>]  irq_exit_rcu+0xe
ffffc90040003fe8: [<ffffffff83403cb8>]  
ffffc90040003ff0: [<ffffffff821ffd0a>]  xen_pv_evtchn_do_upcall+0xaa
ffffc90040003ff8: [<ffffffff83403ca0>]  

vcpu1:
rip: ffffffff822013ac
flags: 00001246 i z p
rsp: ffffc900400a3e60
rax: 0000000000000000 rcx: ffffffff822013ac rdx: 0000000000000000
rbx: 0000000000000000 rsi: deadbeefdeadf00d rdi: deadbeefdeadf00d
rbp: ffffc900400a3e78 r8: 0000000000000000 r9: 0000000000000000
r10: 0000000000000000 r11: 0000000000000246 r12: ffff8881003b8000
r13: 0000000000000000 r14: 0000000000000000 r15: 0000000000000000
cs: e033 ss: e02b ds: 002b es: 002b
fs: 0000 @ 0000000000000000
gs: 0000 @ ffff888103d00000/0000000000000000
Code (instr addr ffffffff822013ac)
cc cc cc cc cc cc cc cc cc 51 41 53 48 c7 c0 1d 00 00 00 0f 05 <41> 5b 59 c3 cc cc cc cc cc cc cc


Stack:
0000000000000000 0000000000000000 ffffffff82200060 ffffc900400a3e88
ffffffff82209629 ffffc900400a3e98 ffffffff822096f9 ffffc900400a3ea8
ffffffff822099cc ffffc900400a3ee8 ffffffff8117bf53 0000000000000001
ac54db278c0d3c00 0000000000000001 ffff8881003b8000 0000000000000001
0000000000000000 ffffc900400a3f08 ffffffff8117c027 000000000000008f

Call Trace:
[<ffffffff822013ac>] <--  xen_hypercall_sched_op+0xc
ffffc900400a3e70: [<ffffffff82200060>]  xen_safe_halt+0x10
ffffc900400a3e80: [<ffffffff82209629>]  default_idle+0x9
ffffc900400a3e90: [<ffffffff822096f9>]  arch_cpu_idle+0x9
ffffc900400a3ea0: [<ffffffff822099cc>]  default_idle_call+0x2c
ffffc900400a3eb0: [<ffffffff8117bf53>]  cpuidle_idle_call+0x153
ffffc900400a3ef0: [<ffffffff8117c027>]  do_idle+0x87
ffffc900400a3f10: [<ffffffff8117c2ba>]  cpu_startup_entry+0x2a
ffffc900400a3f28: [<ffffffff8104bb51>]  cpu_bringup_and_idle+0xa1
ffffc900400a3f50: [<ffffffff81052565>]  asm_cpu_bringup_and_idle+0x5


