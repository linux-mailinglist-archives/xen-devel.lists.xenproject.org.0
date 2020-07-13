Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A421E350
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 00:57:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jv7Mq-0005TJ-LS; Mon, 13 Jul 2020 22:56:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xZO8=AY=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1jv7Mo-0005TE-47
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 22:56:11 +0000
X-Inumbo-ID: 08a03a46-c55c-11ea-bb8b-bc764e2007e4
Received: from aibo.runbox.com (unknown [91.220.196.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08a03a46-c55c-11ea-bb8b-bc764e2007e4;
 Mon, 13 Jul 2020 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com; 
 s=selector2;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:To:Subject:From; bh=guBFdf7SaZKe9dfYA/vayezyCZQor71TAanVYv2h/UM=;
 b=YknaB173KeflUwvXAuuTi7n5HSiHtbFbEJLXDcjvecM9JMjOt3oYJ/EsiDDUCWSVCH2bQLS7gM
 w5LnVyB9atKRDbE1rIWdCgeynaY6tDpHhasKxNUTfnv6KkhfgZuj9Wg/IDz7FmWwLvfw15z7M+C0D
 clp0AXPra/EE5/FgD0CRjk+waqkFe8t/gjQ5JmRK+//KyAkLAGhmdGhkd7bqGNAmYhrCTVkrRm4DZ
 8jPiM2w8NDG3Pi1maaAEotbwjsrrWXfQQK1DSdJtjGDPxx20KZcjMBvL177BpzSTvLDb9ehrXk1mr
 yceo+Y8YaHwc1d50pvEa0sNvHKWNvC7LNQ9Dw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>) id 1jv7Mj-0006Al-Ga
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 00:56:05 +0200
Received: by submission03.runbox with esmtpsa [Authenticated alias (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1jv7Mi-0002AY-3l; Tue, 14 Jul 2020 00:56:04 +0200
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
Subject: Bug involving %fs register and suspend-to-RAM
To: xen-devel@lists.xenproject.org
Message-ID: <6d4a452c-26fa-f204-16fa-4dc630ca3bea@runbox.com>
Date: Tue, 14 Jul 2020 01:56:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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

Hello all,

I encountered an unusual bug involving Xen's and Linux's handling of the
%fs register after resuming from suspend-to-RAM (S2R) with Xen 4.8.y,
and I am reaching out to the xen-devel mailing list, because the bug
appears to affect Xen's master branch too.

In summary, Xen uses/overwrites the %fs register during the resume from
S2R in "xen/arch/x86/boot/wakeup.S", and this register's value is not
restored from the saved context during the context switch to dom0 after
the resume.  Furthermore, Linux running in dom0 appears to leak the %fs
register's value to systemd-sleep, which in turn encounters a
segmentation fault when it attempts to access a variable in thread local
storage. The fault is intermittent. A segfault is observed approximately
once in 10~15 suspend and resume cycles.

Here is the problematic code in context from Xen 4.8.y, where the %fs
register is used:

   xen/arch/x86/boot/wakeup.S
   37
   38  1:      # Show some progress if VGA is resumed
   39          movw    $0xb800, %ax
   40          movw    %ax, %fs
   41          movw    $0x0e00 + 'L', %fs:(0x10)
   42
   43          # boot trampoline is under 1M, and shift its start into
   44          # %fs to reference symbols in that area
   45          mov     wakesym(trampoline_seg), %fs
   46          lidt    %fs:bootsym(idt_48)
   47          lgdt    %fs:bootsym(gdt_48)

And here are some logs obtained from an instrumented version of Linux.
(The magic value 0x9b00 originates from line 45 in the code excerpt
above, which was verified by instrumenting Xen.)

   kernel: Enabling non-boot CPUs ...
   kernel: installing Xen timer for CPU 1
   kernel: xxx: save_fsgs: cpu:0 task:systemd-sleep saved fsindex != 0 (0x9b00)
   kernel: xxx: load_seg_legacy: cpu:0 prev_task:systemd-sleep next_task:swapper/0 next_index: 0 <= 3
   kernel: xxx: load_seg_legacy: cpu:0 prev_task:systemd-sleep next_task:swapper/0 next_base == 0. next_index:0x0 CPU has X86_BUG_NULL_SEG
   kernel: xxx: load_seg_legacy: loading segments. cpu:0. prev_task:swapper/0: next_task:systemd-sleep May cause a segfault... next_index: 39680 > 3 (0x9b00)
   ...
   kernel: PM: suspend exit
   kernel: systemd-sleep[7102]: segfault at 10 ip 00007fb79ac283f9 sp 00007ffd7c1dd508 error 4 in libc-2.24.so[7fb79abb1000+1bd000]

I encountered this bug while testing patches that I had cherry-picked to
Qubes OS's Xen 4.8.y tree to reduce power consumption after S2R by
parking unused CPU hyperthreads. Interestingly, if the changes to park
the CPU's hyperthreads are reverted, then the bug cannot be reproduced
(at least in my experience).

Note that this issue appears to affect recent Xen versions as well. The
%fs register continues to be used in "wakeup.S" to report progress on
the console/VGA, as can be seen in the code listing above. With Xen
4.8.y, unconditionally restoring %fs in the function
restore_rest_processor_state (in file xen/arch/x86/acpi/suspend.c) is
sufficient to resolve this issue.

Some of my debugging notes can be found at [1], and a patch that
resolves this issue in Xen 4.8.y (along with cherry-picked patches to
park hyperthreads) can be found at [2].

All this to say, there appears to be a bug that might negatively affect
Xen's master branch as well, and I wanted to bring this to the attention
of the xen-devel mailing list's subscribers, on the recommendation of
Marek Marczykowski-Górecki of the Qubes OS team.

If there is any further information or assistance I can provide, I would
be happy to help. I would also appreciate any feedback regarding the
last patch at [2] (i.e.,
"patch-0009-x86-acpi-suspend-Unconditionally-restore-fs.patch").

Thank you,

Vefa

[1] https://github.com/QubesOS/qubes-issues/issues/5210
[2] https://github.com/m-v-b/qubes-vmm-xen/commit/9678563a9d099db2879af9c534dbc655ea086d17


