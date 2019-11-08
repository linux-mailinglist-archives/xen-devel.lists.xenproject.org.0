Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C025F5181
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 17:48:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT7Ne-0005UN-6M; Fri, 08 Nov 2019 16:45:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2CaC=ZA=gmail.com=florijanh@srs-us1.protection.inumbo.net>)
 id 1iT7Il-0004oz-L4
 for xen-devel@lists.xen.org; Fri, 08 Nov 2019 16:39:59 +0000
X-Inumbo-ID: 65a69264-0246-11ea-adbe-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65a69264-0246-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 16:39:56 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id u13so5734423ote.0
 for <xen-devel@lists.xen.org>; Fri, 08 Nov 2019 08:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Bl2Ly+brlDENZ5zd+AWZk770hpgsafR9qkO/nkqFv+E=;
 b=uJRkK/NVawN+O1FTmlYgFq3lBRAu1MTWATOkAPm07dteKep8KDiaYfBKD6z2wlnzw7
 B8oVvTrn8Ka2HN2HVzUvveSRZYXp00qTYw75iPuX9/p7klBoJGwAi2pmfAjgRCASnqed
 jpjcX7eMygfWTqTq0lEz/BmbL6Jys1d5fL28Atthz+yKx70uLe67fdzhb5oDfI//yCtR
 b58oN22LPBLFuRNPjR6NnCZRL/eVx2qCW5+t+DszQdIFuKgfvCGjbOAetMBk0c9sYtVQ
 BECdz1UL+6qlVQq7cyH8AFvEvJHWDrCPAa/HbKCQhxoEqkvUbuSGNKmNPsO6lmozOE+x
 JiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Bl2Ly+brlDENZ5zd+AWZk770hpgsafR9qkO/nkqFv+E=;
 b=AVU7IwAocNcdO4hNA6v9gIPmm9f9qTUpM5BfRyMsA2Wzjt6cmYOyJG/YtNM26VQDQj
 D9reX1jrKhoiUBPpNCBUQkKrRpcFAZ1DcV1P7kn0aOH50mIkfCda5xtVgvz6OYDA9tzy
 m920BaoBQp7SVQjAbIGE8+ANkZkyejWdmZe0BIDgyfz8BmspBCMQPzZTM1UnxeRyFk/K
 f5NUEiLBI7kQMAh1/ys1ni2kEYTtk7QHwiiYGLeIhbIh5h1q4Dg6EZ+uUgXsXzZ+eYt1
 5mVPFwRpN3sKnLbHET5rZ7qc8Q3Vz5VuQ1uOUyRaBO8Xvu6yZgJeYHJVltEXh5kOcNJF
 bCYg==
X-Gm-Message-State: APjAAAXG5T33Y4AH0+g3nA6Gv64sKp6q3I0/xopMiA8IaARIHn7FU8V6
 oudMKU1eCUOph+Oh4JXryneiNo+Hm3y1Lz6bsgKRoPwshkM=
X-Google-Smtp-Source: APXvYqzQ3r+CwtImNKhEzsbsK4HFw90Gb1/0oDdlSsVhjw6UPKW8LGgHgNerINm88kQPBQYqhWkXp8nJxv2q/6stAJc=
X-Received: by 2002:a05:6830:1115:: with SMTP id
 w21mr1036331otq.89.1573231195317; 
 Fri, 08 Nov 2019 08:39:55 -0800 (PST)
MIME-Version: 1.0
From: Florijan Hamzic <florijanh@gmail.com>
Date: Fri, 8 Nov 2019 17:39:44 +0100
Message-ID: <CAOhq9FydFPJBvJ_uPZFjDfpjZ0tLBV6tRamTdVupVFHRPFFm1A@mail.gmail.com>
To: xen-devel@lists.xen.org
X-Mailman-Approved-At: Fri, 08 Nov 2019 16:45:01 +0000
Subject: [Xen-devel] Issue with 5.3.8 kernel in a ArchLinux guest
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1758253315028346007=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1758253315028346007==
Content-Type: multipart/alternative; boundary="0000000000008bea750596d86e3a"

--0000000000008bea750596d86e3a
Content-Type: text/plain; charset="UTF-8"

Hi,

my machine recently crashes randomly. I found this thing in my logs before
the crash happened:

Linux vserver1592 5.3.8-arch1-1 #1 SMP PREEMPT @1572357769 x86_64 GNU/Linux

Nov 08 06:32:34 vserver1592 kernel: ------------[ cut here ]------------
Nov 08 06:32:34 vserver1592 kernel: WARNING: CPU: 0 PID: 1131590 at
arch/x86/xen/multicalls.c:102 xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat
xt_tcpudp xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user
xfrm_algo xt_addrtype iptable_filter iptable_nat nf_nat br_netfilter
bridge stp llc overlay nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log
nft_limit nft_ct nf_conntrack nf_defrag_ipv6>
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc
Tainted: G        W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Code: 02 0f 84 74 fe ff ff 0f 0b
e8 16 2c fe ff eb 8c 48 c7 45 18 ea ff ff ff 41 bd 01 00 00 00 48 c7
c7 30 d2 0a 82 e8 e8 bc 0d 00 <0f> 0b e8 23 d7 42 00 8b 55 00 44 89 ee
48 c7 c7 60 ff 0a 82 89 c1
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7a88 EFLAGS: 00010046
Nov 08 06:32:34 vserver1592 kernel: RAX: 0000000000000024 RBX:
ffff8881f5c15300 RCX: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI:
ffff8881f5c17708 RDI: 00000000ffffffff
Nov 08 06:32:34 vserver1592 kernel: RBP: ffff8881f5c15300 R08:
00000000000087bb R09: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11:
0000000000000001 R12: 000000008000000e
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000013 R14:
0000000000000018 R15: 0000000000000020
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000)
GS:ffff8881f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  10000e030 DS: 0000 ES: 0000
CR0: 0000000080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: 00007f0470000010 CR3:
000000000220a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  __xen_mc_entry+0x136/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  xen_extend_mmuext_op+0x5c/0xf0
Nov 08 06:32:34 vserver1592 kernel:  xen_do_pin+0x59/0x90
Nov 08 06:32:34 vserver1592 kernel:  xen_unpin_page+0x169/0x180
Nov 08 06:32:34 vserver1592 kernel:  ? xen_dup_mmap+0x10/0x10
Nov 08 06:32:34 vserver1592 kernel:  __xen_pgd_walk+0x230/0x300
Nov 08 06:32:34 vserver1592 kernel:  ? xen_dup_mmap+0x10/0x10
Nov 08 06:32:34 vserver1592 kernel:  __xen_pgd_unpin+0xf7/0x270
Nov 08 06:32:34 vserver1592 kernel:  xen_exit_mmap+0x150/0x170
Nov 08 06:32:34 vserver1592 kernel:  exit_mmap+0x77/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  mmput+0x49/0x100
Nov 08 06:32:34 vserver1592 kernel:  do_exit+0x2ad/0xb00
Nov 08 06:32:34 vserver1592 kernel:  do_group_exit+0x33/0xa0
Nov 08 06:32:34 vserver1592 kernel:  get_signal+0x136/0x8d0
Nov 08 06:32:34 vserver1592 kernel:  do_signal+0x43/0x680
Nov 08 06:32:34 vserver1592 kernel:  ? do_nanosleep+0xb7/0x180
Nov 08 06:32:34 vserver1592 kernel:  exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  do_syscall_64+0x189/0x1c0
Nov 08 06:32:34 vserver1592 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Nov 08 06:32:34 vserver1592 kernel: RIP: 0033:0x561579d38023
Nov 08 06:32:34 vserver1592 kernel: Code: Bad RIP value.
Nov 08 06:32:34 vserver1592 kernel: RSP: 002b:00007f0479f0cca0 EFLAGS:
00000286 ORIG_RAX: 00000000000000ca
Nov 08 06:32:34 vserver1592 kernel: RAX: fffffffffffffe00 RBX:
000000c000036a80 RCX: 0000561579d38023
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI:
0000000000000080 RDI: 000000c000036bc8
Nov 08 06:32:34 vserver1592 kernel: RBP: 00007f0479f0cce8 R08:
0000000000000000 R09: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11:
0000000000000286 R12: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000000 R14:
000056157a0745fe R15: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: ---[ end trace aa1a39e6c9d34ccd ]---
Nov 08 06:32:34 vserver1592 kernel: 19 of 32 multicall(s) failed: cpu 0
Nov 08 06:32:34 vserver1592 kernel:   call  2: op=14
arg=[ffff888066f22000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  3: op=14
arg=[ffff8880ff5dd000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  4: op=14
arg=[ffff888003b19000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  6: op=14
arg=[ffff8880ff5c1000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  7: op=14
arg=[ffff8880ff691000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  8: op=14
arg=[ffff888066f6d000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 10: op=14
arg=[ffff888003a0b000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 12: op=14
arg=[ffff888066f46000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 14: op=14
arg=[ffff8880f8a7b000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 16: op=14
arg=[ffff8880ff447000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 18: op=14
arg=[ffff8880abdda000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 20: op=14
arg=[ffff8880bbb14000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 22: op=14
arg=[ffff8880f88da000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 23: op=14
arg=[ffff8880f8982000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 24: op=14
arg=[ffff8880f8b54000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 26: op=14
arg=[ffff8880f8872000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 28: op=14
arg=[ffff8880f8be7000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 30: op=14
arg=[ffff8880bb9ff000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 32: op=14
arg=[ffff888003bc2000] result=-16
Nov 08 06:32:34 vserver1592 kernel: ------------[ cut here ]------------
Nov 08 06:32:34 vserver1592 kernel: WARNING: CPU: 0 PID: 1131590 at
arch/x86/xen/multicalls.c:102 xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat
xt_tcpudp xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user
xfrm_algo xt_addrtype iptable_filter iptable_nat nf_nat br_netfilter
bridge stp llc overlay nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log
nft_limit nft_ct nf_conntrack nf_defrag_ipv6>
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc
Tainted: G        W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Code: 02 0f 84 74 fe ff ff 0f 0b
e8 16 2c fe ff eb 8c 48 c7 45 18 ea ff ff ff 41 bd 01 00 00 00 48 c7
c7 30 d2 0a 82 e8 e8 bc 0d 00 <0f> 0b e8 23 d7 42 00 8b 55 00 44 89 ee
48 c7 c7 60 ff 0a 82 89 c1
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7bb8 EFLAGS: 00010046
Nov 08 06:32:34 vserver1592 kernel: RAX: 0000000000000024 RBX:
ffffea00019bc880 RCX: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI:
000000008000000c RDI: 00000000ffffffff
Nov 08 06:32:34 vserver1592 kernel: RBP: ffff8881f5c15300 R08:
00000000000087fb R09: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11:
0000000000000001 R12: 000000008000000b
Nov 08 06:32:34 vserver1592 kernel: R13: 000000000000000d R14:
0000000000000000 R15: 0000000000000017
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000)
GS:ffff8881f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  10000e030 DS: 0000 ES: 0000
CR0: 0000000080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: 0000561579d37ff9 CR3:
000000000220a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  __xen_pgd_unpin+0x106/0x270
Nov 08 06:32:34 vserver1592 kernel:  xen_exit_mmap+0x150/0x170
Nov 08 06:32:34 vserver1592 kernel:  exit_mmap+0x77/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  mmput+0x49/0x100
Nov 08 06:32:34 vserver1592 kernel:  do_exit+0x2ad/0xb00
Nov 08 06:32:34 vserver1592 kernel:  do_group_exit+0x33/0xa0
Nov 08 06:32:34 vserver1592 kernel:  get_signal+0x136/0x8d0
Nov 08 06:32:34 vserver1592 kernel:  do_signal+0x43/0x680
Nov 08 06:32:34 vserver1592 kernel:  ? do_nanosleep+0xb7/0x180
Nov 08 06:32:34 vserver1592 kernel:  exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  do_syscall_64+0x189/0x1c0
Nov 08 06:32:34 vserver1592 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Nov 08 06:32:34 vserver1592 kernel: RIP: 0033:0x561579d38023
Nov 08 06:32:34 vserver1592 kernel: Code: Bad RIP value.
Nov 08 06:32:34 vserver1592 kernel: RSP: 002b:00007f0479f0cca0 EFLAGS:
00000286 ORIG_RAX: 00000000000000ca
Nov 08 06:32:34 vserver1592 kernel: RAX: fffffffffffffe00 RBX:
000000c000036a80 RCX: 0000561579d38023
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI:
0000000000000080 RDI: 000000c000036bc8
Nov 08 06:32:34 vserver1592 kernel: RBP: 00007f0479f0cce8 R08:
0000000000000000 R09: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11:
0000000000000286 R12: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000000 R14:
000056157a0745fe R15: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: ---[ end trace aa1a39e6c9d34cce ]---
Nov 08 06:32:34 vserver1592 kernel: 13 of 23 multicall(s) failed: cpu 0
Nov 08 06:32:34 vserver1592 kernel:   call  2: op=14
arg=[ffff8880ff7f9000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  4: op=14
arg=[ffff8880f890a000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  6: op=14
arg=[ffff8880f8ae9000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call  8: op=14
arg=[ffff8880bb8c5000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 10: op=14
arg=[ffff8880ff709000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 12: op=14
arg=[ffff888066f60000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 14: op=14
arg=[ffff888003afb000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 16: op=14
arg=[ffff8880abdcb000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 18: op=14
arg=[ffff8880f88f1000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 19: op=14
arg=[ffff8880f8b46000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 20: op=14
arg=[ffff8880f8b8b000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 22: op=14
arg=[ffff8880f8b3f000] result=-16
Nov 08 06:32:34 vserver1592 kernel:   call 23: op=14
arg=[ffff88800395e000] result=-16
Nov 08 06:32:34 vserver1592 kernel: BUG: unable to handle page fault
for address: ffff8880ff5c1918
Nov 08 06:32:34 vserver1592 kernel: #PF: supervisor write access in kernel mode
Nov 08 06:32:34 vserver1592 kernel: #PF: error_code(0x0003) -
permissions violation
Nov 08 06:32:34 vserver1592 kernel: PGD 220c067 P4D 220c067 PUD
1ff930067 PMD 1ff735067 PTE 80100000ff5c1065
Nov 08 06:32:34 vserver1592 kernel: Oops: 0003 [#1] PREEMPT SMP NOPTI
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc
Tainted: G        W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:unmap_page_range+0x5db/0xc60
Nov 08 06:32:34 vserver1592 kernel: Code: 2b f8 ff ff 48 83 7c 24 10
00 4c 89 2c 24 49 89 c6 74 09 48 85 c0 0f 85 10 05 00 00 41 f6 47 20
01 0f 84 7a 02 00 00 4c 8b 23 <48> c7 03 00 00 00 00 49 39 6f 10 48 89
e8 49 0f 46 47 10 4d 39 6f
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7b30 EFLAGS: 00010202
Nov 08 06:32:34 vserver1592 kernel: RAX: ffffea0001a2eec0 RBX:
ffff8880ff5c1918 RCX: 0000000001a2eec0
Nov 08 06:32:34 vserver1592 kernel: RDX: 80000021775bb167 RSI:
000000c000123000 RDI: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: RBP: 000000c000123000 R08:
000fffffffffffff R09: ffff8881be3ded80
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000002 R11:
0000000000000000 R12: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: R13: 000000c000124000 R14:
ffffea0001a2eec0 R15: ffffc900417a7c70
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000)
GS:ffff8881f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  e030 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: ffff8880ff5c1918 CR3:
000000000220a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  unmap_vmas+0x70/0xd0
Nov 08 06:32:34 vserver1592 kernel:  exit_mmap+0xbe/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  mmput+0x49/0x100
Nov 08 06:32:34 vserver1592 kernel:  do_exit+0x2ad/0xb00
Nov 08 06:32:34 vserver1592 kernel:  do_group_exit+0x33/0xa0
Nov 08 06:32:34 vserver1592 kernel:  get_signal+0x136/0x8d0
Nov 08 06:32:34 vserver1592 kernel:  do_signal+0x43/0x680
Nov 08 06:32:34 vserver1592 kernel:  ? do_nanosleep+0xb7/0x180
Nov 08 06:32:34 vserver1592 kernel:  exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  do_syscall_64+0x189/0x1c0
Nov 08 06:32:34 vserver1592 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Nov 08 06:32:34 vserver1592 kernel: RIP: 0033:0x561579d38023
Nov 08 06:32:34 vserver1592 kernel: Code: Bad RIP value.
Nov 08 06:32:34 vserver1592 kernel: RSP: 002b:00007f0479f0cca0 EFLAGS:
00000286 ORIG_RAX: 00000000000000ca
Nov 08 06:32:34 vserver1592 kernel: RAX: fffffffffffffe00 RBX:
000000c000036a80 RCX: 0000561579d38023
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI:
0000000000000080 RDI: 000000c000036bc8
Nov 08 06:32:34 vserver1592 kernel: RBP: 00007f0479f0cce8 R08:
0000000000000000 R09: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11:
0000000000000286 R12: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000000 R14:
000056157a0745fe R15: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat
xt_tcpudp xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user
xfrm_algo xt_addrtype iptable_filter iptable_nat nf_nat br_netfilter
bridge stp llc overlay nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log
nft_limit nft_ct nf_conntrack nf_defrag_ipv6>
Nov 08 06:32:34 vserver1592 kernel: CR2: ffff8880ff5c1918
Nov 08 06:32:34 vserver1592 kernel: ---[ end trace aa1a39e6c9d34ccf ]---
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:unmap_page_range+0x5db/0xc60
Nov 08 06:32:34 vserver1592 kernel: Code: 2b f8 ff ff 48 83 7c 24 10
00 4c 89 2c 24 49 89 c6 74 09 48 85 c0 0f 85 10 05 00 00 41 f6 47 20
01 0f 84 7a 02 00 00 4c 8b 23 <48> c7 03 00 00 00 00 49 39 6f 10 48 89
e8 49 0f 46 47 10 4d 39 6f
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7b30 EFLAGS: 00010202
Nov 08 06:32:34 vserver1592 kernel: RAX: ffffea0001a2eec0 RBX:
ffff8880ff5c1918 RCX: 0000000001a2eec0
Nov 08 06:32:34 vserver1592 kernel: RDX: 80000021775bb167 RSI:
000000c000123000 RDI: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: RBP: 000000c000123000 R08:
000fffffffffffff R09: ffff8881be3ded80
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000002 R11:
0000000000000000 R12: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: R13: 000000c000124000 R14:
ffffea0001a2eec0 R15: ffffc900417a7c70
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000)
GS:ffff8881f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  e030 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: 0000561579d37ff9 CR3:
000000000220a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Fixing recursive fault but reboot is needed!
Nov 08 06:32:34 vserver1592 kernel: BUG: scheduling while atomic:
runc/1131590/0x00000002
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat
xt_tcpudp xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user
xfrm_algo xt_addrtype iptable_filter iptable_nat nf_nat br_netfilter
bridge stp llc overlay nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log
nft_limit nft_ct nf_conntrack nf_defrag_ipv6>
Nov 08 06:32:34 vserver1592 kernel: Preemption disabled at:
Nov 08 06:32:34 vserver1592 kernel: [<0000000000000000>] 0x0
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc
Tainted: G      D W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  dump_stack+0x5c/0x80
Nov 08 06:32:34 vserver1592 kernel:  __schedule_bug.cold+0x8e/0x9b
Nov 08 06:32:34 vserver1592 kernel:  __schedule+0x59d/0x6d0
Nov 08 06:32:34 vserver1592 kernel:  schedule+0x43/0xd0
Nov 08 06:32:34 vserver1592 kernel:  do_exit.cold+0xb8/0xd3
Nov 08 06:32:34 vserver1592 kernel:  ? exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  rewind_stack_do_exit+0x17/0x20


let me know if you need some more input

best regards

Florijan

--0000000000008bea750596d86e3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>my machine recently cras=
hes randomly. I found this thing in my logs before the crash happened:</div=
><div><br></div><div>Linux vserver1592 5.3.8-arch1-1 #1 SMP PREEMPT @157235=
7769 x86_64 GNU/Linux<br></div><div><pre style=3D"color:rgb(0,0,0);white-sp=
ace:pre-wrap">Nov 08 06:32:34 vserver1592 kernel: ------------[ cut here ]-=
-----------
Nov 08 06:32:34 vserver1592 kernel: WARNING: CPU: 0 PID: 1131590 at arch/x8=
6/xen/multicalls.c:102 xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat xt_tcpud=
p xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user xfrm_algo xt_ad=
drtype iptable_filter iptable_nat nf_nat br_netfilter bridge stp llc overla=
y nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log nft_limit nft_ct nf_conntra=
ck nf_defrag_ipv6&gt;
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc Tainted:=
 G        W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Code: 02 0f 84 74 fe ff ff 0f 0b e8 16 =
2c fe ff eb 8c 48 c7 45 18 ea ff ff ff 41 bd 01 00 00 00 48 c7 c7 30 d2 0a =
82 e8 e8 bc 0d 00 &lt;0f&gt; 0b e8 23 d7 42 00 8b 55 00 44 89 ee 48 c7 c7 6=
0 ff 0a 82 89 c1
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7a88 EFLAGS: 0001=
0046
Nov 08 06:32:34 vserver1592 kernel: RAX: 0000000000000024 RBX: ffff8881f5c1=
5300 RCX: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI: ffff8881f5c1=
7708 RDI: 00000000ffffffff
Nov 08 06:32:34 vserver1592 kernel: RBP: ffff8881f5c15300 R08: 000000000000=
87bb R09: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11: 000000000000=
0001 R12: 000000008000000e
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000013 R14: 000000000000=
0018 R15: 0000000000000020
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000) GS:ffff8881=
f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  10000e030 DS: 0000 ES: 0000 CR0: 0=
000000080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: 00007f0470000010 CR3: 000000000220=
a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  __xen_mc_entry+0x136/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  xen_extend_mmuext_op+0x5c/0xf0
Nov 08 06:32:34 vserver1592 kernel:  xen_do_pin+0x59/0x90
Nov 08 06:32:34 vserver1592 kernel:  xen_unpin_page+0x169/0x180
Nov 08 06:32:34 vserver1592 kernel:  ? xen_dup_mmap+0x10/0x10
Nov 08 06:32:34 vserver1592 kernel:  __xen_pgd_walk+0x230/0x300
Nov 08 06:32:34 vserver1592 kernel:  ? xen_dup_mmap+0x10/0x10
Nov 08 06:32:34 vserver1592 kernel:  __xen_pgd_unpin+0xf7/0x270
Nov 08 06:32:34 vserver1592 kernel:  xen_exit_mmap+0x150/0x170
Nov 08 06:32:34 vserver1592 kernel:  exit_mmap+0x77/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  mmput+0x49/0x100
Nov 08 06:32:34 vserver1592 kernel:  do_exit+0x2ad/0xb00
Nov 08 06:32:34 vserver1592 kernel:  do_group_exit+0x33/0xa0
Nov 08 06:32:34 vserver1592 kernel:  get_signal+0x136/0x8d0
Nov 08 06:32:34 vserver1592 kernel:  do_signal+0x43/0x680
Nov 08 06:32:34 vserver1592 kernel:  ? do_nanosleep+0xb7/0x180
Nov 08 06:32:34 vserver1592 kernel:  exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  do_syscall_64+0x189/0x1c0
Nov 08 06:32:34 vserver1592 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0x=
a9
Nov 08 06:32:34 vserver1592 kernel: RIP: 0033:0x561579d38023
Nov 08 06:32:34 vserver1592 kernel: Code: Bad RIP value.
Nov 08 06:32:34 vserver1592 kernel: RSP: 002b:00007f0479f0cca0 EFLAGS: 0000=
0286 ORIG_RAX: 00000000000000ca
Nov 08 06:32:34 vserver1592 kernel: RAX: fffffffffffffe00 RBX: 000000c00003=
6a80 RCX: 0000561579d38023
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI: 000000000000=
0080 RDI: 000000c000036bc8
Nov 08 06:32:34 vserver1592 kernel: RBP: 00007f0479f0cce8 R08: 000000000000=
0000 R09: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11: 000000000000=
0286 R12: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000000 R14: 000056157a07=
45fe R15: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: ---[ end trace aa1a39e6c9d34ccd ]---
Nov 08 06:32:34 vserver1592 kernel: 19 of 32 multicall(s) failed: cpu 0
Nov 08 06:32:34 vserver1592 kernel:   call  2: op=3D14 arg=3D[ffff888066f22=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  3: op=3D14 arg=3D[ffff8880ff5dd=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  4: op=3D14 arg=3D[ffff888003b19=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  6: op=3D14 arg=3D[ffff8880ff5c1=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  7: op=3D14 arg=3D[ffff8880ff691=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  8: op=3D14 arg=3D[ffff888066f6d=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 10: op=3D14 arg=3D[ffff888003a0b=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 12: op=3D14 arg=3D[ffff888066f46=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 14: op=3D14 arg=3D[ffff8880f8a7b=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 16: op=3D14 arg=3D[ffff8880ff447=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 18: op=3D14 arg=3D[ffff8880abdda=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 20: op=3D14 arg=3D[ffff8880bbb14=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 22: op=3D14 arg=3D[ffff8880f88da=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 23: op=3D14 arg=3D[ffff8880f8982=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 24: op=3D14 arg=3D[ffff8880f8b54=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 26: op=3D14 arg=3D[ffff8880f8872=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 28: op=3D14 arg=3D[ffff8880f8be7=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 30: op=3D14 arg=3D[ffff8880bb9ff=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 32: op=3D14 arg=3D[ffff888003bc2=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel: ------------[ cut here ]------------
Nov 08 06:32:34 vserver1592 kernel: WARNING: CPU: 0 PID: 1131590 at arch/x8=
6/xen/multicalls.c:102 xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat xt_tcpud=
p xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user xfrm_algo xt_ad=
drtype iptable_filter iptable_nat nf_nat br_netfilter bridge stp llc overla=
y nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log nft_limit nft_ct nf_conntra=
ck nf_defrag_ipv6&gt;
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc Tainted:=
 G        W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:xen_mc_flush+0x1e6/0x220
Nov 08 06:32:34 vserver1592 kernel: Code: 02 0f 84 74 fe ff ff 0f 0b e8 16 =
2c fe ff eb 8c 48 c7 45 18 ea ff ff ff 41 bd 01 00 00 00 48 c7 c7 30 d2 0a =
82 e8 e8 bc 0d 00 &lt;0f&gt; 0b e8 23 d7 42 00 8b 55 00 44 89 ee 48 c7 c7 6=
0 ff 0a 82 89 c1
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7bb8 EFLAGS: 0001=
0046
Nov 08 06:32:34 vserver1592 kernel: RAX: 0000000000000024 RBX: ffffea00019b=
c880 RCX: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI: 000000008000=
000c RDI: 00000000ffffffff
Nov 08 06:32:34 vserver1592 kernel: RBP: ffff8881f5c15300 R08: 000000000000=
87fb R09: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11: 000000000000=
0001 R12: 000000008000000b
Nov 08 06:32:34 vserver1592 kernel: R13: 000000000000000d R14: 000000000000=
0000 R15: 0000000000000017
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000) GS:ffff8881=
f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  10000e030 DS: 0000 ES: 0000 CR0: 0=
000000080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: 0000561579d37ff9 CR3: 000000000220=
a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  __xen_pgd_unpin+0x106/0x270
Nov 08 06:32:34 vserver1592 kernel:  xen_exit_mmap+0x150/0x170
Nov 08 06:32:34 vserver1592 kernel:  exit_mmap+0x77/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  mmput+0x49/0x100
Nov 08 06:32:34 vserver1592 kernel:  do_exit+0x2ad/0xb00
Nov 08 06:32:34 vserver1592 kernel:  do_group_exit+0x33/0xa0
Nov 08 06:32:34 vserver1592 kernel:  get_signal+0x136/0x8d0
Nov 08 06:32:34 vserver1592 kernel:  do_signal+0x43/0x680
Nov 08 06:32:34 vserver1592 kernel:  ? do_nanosleep+0xb7/0x180
Nov 08 06:32:34 vserver1592 kernel:  exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  do_syscall_64+0x189/0x1c0
Nov 08 06:32:34 vserver1592 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0x=
a9
Nov 08 06:32:34 vserver1592 kernel: RIP: 0033:0x561579d38023
Nov 08 06:32:34 vserver1592 kernel: Code: Bad RIP value.
Nov 08 06:32:34 vserver1592 kernel: RSP: 002b:00007f0479f0cca0 EFLAGS: 0000=
0286 ORIG_RAX: 00000000000000ca
Nov 08 06:32:34 vserver1592 kernel: RAX: fffffffffffffe00 RBX: 000000c00003=
6a80 RCX: 0000561579d38023
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI: 000000000000=
0080 RDI: 000000c000036bc8
Nov 08 06:32:34 vserver1592 kernel: RBP: 00007f0479f0cce8 R08: 000000000000=
0000 R09: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11: 000000000000=
0286 R12: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000000 R14: 000056157a07=
45fe R15: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: ---[ end trace aa1a39e6c9d34cce ]---
Nov 08 06:32:34 vserver1592 kernel: 13 of 23 multicall(s) failed: cpu 0
Nov 08 06:32:34 vserver1592 kernel:   call  2: op=3D14 arg=3D[ffff8880ff7f9=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  4: op=3D14 arg=3D[ffff8880f890a=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  6: op=3D14 arg=3D[ffff8880f8ae9=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call  8: op=3D14 arg=3D[ffff8880bb8c5=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 10: op=3D14 arg=3D[ffff8880ff709=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 12: op=3D14 arg=3D[ffff888066f60=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 14: op=3D14 arg=3D[ffff888003afb=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 16: op=3D14 arg=3D[ffff8880abdcb=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 18: op=3D14 arg=3D[ffff8880f88f1=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 19: op=3D14 arg=3D[ffff8880f8b46=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 20: op=3D14 arg=3D[ffff8880f8b8b=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 22: op=3D14 arg=3D[ffff8880f8b3f=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel:   call 23: op=3D14 arg=3D[ffff88800395e=
000] result=3D-16
Nov 08 06:32:34 vserver1592 kernel: BUG: unable to handle page fault for ad=
dress: ffff8880ff5c1918
Nov 08 06:32:34 vserver1592 kernel: #PF: supervisor write access in kernel =
mode
Nov 08 06:32:34 vserver1592 kernel: #PF: error_code(0x0003) - permissions v=
iolation
Nov 08 06:32:34 vserver1592 kernel: PGD 220c067 P4D 220c067 PUD 1ff930067 P=
MD 1ff735067 PTE 80100000ff5c1065
Nov 08 06:32:34 vserver1592 kernel: Oops: 0003 [#1] PREEMPT SMP NOPTI
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc Tainted:=
 G        W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:unmap_page_range+0x5db/0xc60
Nov 08 06:32:34 vserver1592 kernel: Code: 2b f8 ff ff 48 83 7c 24 10 00 4c =
89 2c 24 49 89 c6 74 09 48 85 c0 0f 85 10 05 00 00 41 f6 47 20 01 0f 84 7a =
02 00 00 4c 8b 23 &lt;48&gt; c7 03 00 00 00 00 49 39 6f 10 48 89 e8 49 0f 4=
6 47 10 4d 39 6f
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7b30 EFLAGS: 0001=
0202
Nov 08 06:32:34 vserver1592 kernel: RAX: ffffea0001a2eec0 RBX: ffff8880ff5c=
1918 RCX: 0000000001a2eec0
Nov 08 06:32:34 vserver1592 kernel: RDX: 80000021775bb167 RSI: 000000c00012=
3000 RDI: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: RBP: 000000c000123000 R08: 000fffffffff=
ffff R09: ffff8881be3ded80
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000002 R11: 000000000000=
0000 R12: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: R13: 000000c000124000 R14: ffffea0001a2=
eec0 R15: ffffc900417a7c70
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000) GS:ffff8881=
f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  e030 DS: 0000 ES: 0000 CR0: 000000=
0080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: ffff8880ff5c1918 CR3: 000000000220=
a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  unmap_vmas+0x70/0xd0
Nov 08 06:32:34 vserver1592 kernel:  exit_mmap+0xbe/0x1b0
Nov 08 06:32:34 vserver1592 kernel:  mmput+0x49/0x100
Nov 08 06:32:34 vserver1592 kernel:  do_exit+0x2ad/0xb00
Nov 08 06:32:34 vserver1592 kernel:  do_group_exit+0x33/0xa0
Nov 08 06:32:34 vserver1592 kernel:  get_signal+0x136/0x8d0
Nov 08 06:32:34 vserver1592 kernel:  do_signal+0x43/0x680
Nov 08 06:32:34 vserver1592 kernel:  ? do_nanosleep+0xb7/0x180
Nov 08 06:32:34 vserver1592 kernel:  exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  do_syscall_64+0x189/0x1c0
Nov 08 06:32:34 vserver1592 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0x=
a9
Nov 08 06:32:34 vserver1592 kernel: RIP: 0033:0x561579d38023
Nov 08 06:32:34 vserver1592 kernel: Code: Bad RIP value.
Nov 08 06:32:34 vserver1592 kernel: RSP: 002b:00007f0479f0cca0 EFLAGS: 0000=
0286 ORIG_RAX: 00000000000000ca
Nov 08 06:32:34 vserver1592 kernel: RAX: fffffffffffffe00 RBX: 000000c00003=
6a80 RCX: 0000561579d38023
Nov 08 06:32:34 vserver1592 kernel: RDX: 0000000000000000 RSI: 000000000000=
0080 RDI: 000000c000036bc8
Nov 08 06:32:34 vserver1592 kernel: RBP: 00007f0479f0cce8 R08: 000000000000=
0000 R09: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000000 R11: 000000000000=
0286 R12: 0000000000000001
Nov 08 06:32:34 vserver1592 kernel: R13: 0000000000000000 R14: 000056157a07=
45fe R15: 0000000000000000
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat xt_tcpud=
p xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user xfrm_algo xt_ad=
drtype iptable_filter iptable_nat nf_nat br_netfilter bridge stp llc overla=
y nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log nft_limit nft_ct nf_conntra=
ck nf_defrag_ipv6&gt;
Nov 08 06:32:34 vserver1592 kernel: CR2: ffff8880ff5c1918
Nov 08 06:32:34 vserver1592 kernel: ---[ end trace aa1a39e6c9d34ccf ]---
Nov 08 06:32:34 vserver1592 kernel: RIP: e030:unmap_page_range+0x5db/0xc60
Nov 08 06:32:34 vserver1592 kernel: Code: 2b f8 ff ff 48 83 7c 24 10 00 4c =
89 2c 24 49 89 c6 74 09 48 85 c0 0f 85 10 05 00 00 41 f6 47 20 01 0f 84 7a =
02 00 00 4c 8b 23 &lt;48&gt; c7 03 00 00 00 00 49 39 6f 10 48 89 e8 49 0f 4=
6 47 10 4d 39 6f
Nov 08 06:32:34 vserver1592 kernel: RSP: e02b:ffffc900417a7b30 EFLAGS: 0001=
0202
Nov 08 06:32:34 vserver1592 kernel: RAX: ffffea0001a2eec0 RBX: ffff8880ff5c=
1918 RCX: 0000000001a2eec0
Nov 08 06:32:34 vserver1592 kernel: RDX: 80000021775bb167 RSI: 000000c00012=
3000 RDI: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: RBP: 000000c000123000 R08: 000fffffffff=
ffff R09: ffff8881be3ded80
Nov 08 06:32:34 vserver1592 kernel: R10: 0000000000000002 R11: 000000000000=
0000 R12: 80000021775bb167
Nov 08 06:32:34 vserver1592 kernel: R13: 000000c000124000 R14: ffffea0001a2=
eec0 R15: ffffc900417a7c70
Nov 08 06:32:34 vserver1592 kernel: FS:  0000000000000000(0000) GS:ffff8881=
f5c00000(0000) knlGS:0000000000000000
Nov 08 06:32:34 vserver1592 kernel: CS:  e030 DS: 0000 ES: 0000 CR0: 000000=
0080050033
Nov 08 06:32:34 vserver1592 kernel: CR2: 0000561579d37ff9 CR3: 000000000220=
a000 CR4: 0000000000042660
Nov 08 06:32:34 vserver1592 kernel: Fixing recursive fault but reboot is ne=
eded!
Nov 08 06:32:34 vserver1592 kernel: BUG: scheduling while atomic: runc/1131=
590/0x00000002
Nov 08 06:32:34 vserver1592 kernel: Modules linked in: veth xt_nat xt_tcpud=
p xt_conntrack xt_MASQUERADE nf_conntrack_netlink xfrm_user xfrm_algo xt_ad=
drtype iptable_filter iptable_nat nf_nat br_netfilter bridge stp llc overla=
y nf_log_ipv6 nf_log_ipv4 nf_log_common nft_log nft_limit nft_ct nf_conntra=
ck nf_defrag_ipv6&gt;
Nov 08 06:32:34 vserver1592 kernel: Preemption disabled at:
Nov 08 06:32:34 vserver1592 kernel: [&lt;0000000000000000&gt;] 0x0
Nov 08 06:32:34 vserver1592 kernel: CPU: 0 PID: 1131590 Comm: runc Tainted:=
 G      D W         5.3.8-arch1-1 #1
Nov 08 06:32:34 vserver1592 kernel: Call Trace:
Nov 08 06:32:34 vserver1592 kernel:  dump_stack+0x5c/0x80
Nov 08 06:32:34 vserver1592 kernel:  __schedule_bug.cold+0x8e/0x9b
Nov 08 06:32:34 vserver1592 kernel:  __schedule+0x59d/0x6d0
Nov 08 06:32:34 vserver1592 kernel:  schedule+0x43/0xd0
Nov 08 06:32:34 vserver1592 kernel:  do_exit.cold+0xb8/0xd3
Nov 08 06:32:34 vserver1592 kernel:  ? exit_to_usermode_loop+0xbe/0x110
Nov 08 06:32:34 vserver1592 kernel:  rewind_stack_do_exit+0x17/0x20</pre><p=
re style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></pre><pre style=3D"=
color:rgb(0,0,0);white-space:pre-wrap">let me know if you need some more in=
put</pre><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap">best regards<=
/pre><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap">Florijan</pre></d=
iv></div>

--0000000000008bea750596d86e3a--


--===============1758253315028346007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1758253315028346007==--

