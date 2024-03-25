Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E12889EFB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 13:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697731.1088796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rojKu-0003Mp-MZ; Mon, 25 Mar 2024 12:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697731.1088796; Mon, 25 Mar 2024 12:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rojKu-0003KX-K1; Mon, 25 Mar 2024 12:21:56 +0000
Received: by outflank-mailman (input) for mailman id 697731;
 Mon, 25 Mar 2024 12:21:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aIxS=K7=kernel.org=hawk@srs-se1.protection.inumbo.net>)
 id 1rojKt-0003KR-7T
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 12:21:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c2051f-eaa2-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 13:21:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6592060DC4;
 Mon, 25 Mar 2024 12:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB70C433F1;
 Mon, 25 Mar 2024 12:21:49 +0000 (UTC)
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
X-Inumbo-ID: 42c2051f-eaa2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711369311;
	bh=AE1dlvv5b1X/poInI7A8TX+ny663XWX7KjBuB1GkxY4=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=kGwx5TGgfuiYR8ZX8r/AtMyeLggJuegzjC9l/G4X1/Qzv21sh0fTjWZqaC+7XhUf/
	 mZ8cDfDBiUyad17Kal5Xpn9pP1ANsySpsyBLggwXMOef21eBYDRQEsF9qo4FcX3tAp
	 qFz55xt+zFT5zA5whauc4NEZrdQFfTvtAMRFawak1XDU+iC6UGn1NyT86COpmBJYDS
	 9o3qM3Q5YkVM0zzt3qvraD0vBneBuJvjJcjYujUibVLhZeOW7BS5k+3STXip5HjKg9
	 SVUKIO53oQGGji6/gB8keEPd9PeyP+zi13tSRs3Ri4OQkisGd5BiWOtEEoH/WDLG5i
	 UqoCOROiIbH6A==
Message-ID: <1cde0059-d319-4a4f-a68d-3b3ffeb3da20@kernel.org>
Date: Mon, 25 Mar 2024 13:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Xen NIC driver have page_pool memory leaks
Content-Language: en-US
To: Arthur Borsboom <arthurborsboom@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <CALUcmUncphE8v8j1Xme0BcX4JRhqd+gB0UUzS-U=3XXw_3iUiw@mail.gmail.com>
Cc: Netdev <netdev@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wei.liu@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <CALUcmUncphE8v8j1Xme0BcX4JRhqd+gB0UUzS-U=3XXw_3iUiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arthur,

(Answer inlined below, which is custom on this mailing list)

On 23/03/2024 14.23, Arthur Borsboom wrote:
> Hi Jesper,
> 
> After a recent kernel upgrade 6.7.6 > 6.8.1 all my Xen guests on Arch
> Linux are dumping kernel traces.
> It seems to be indirectly caused by the page pool memory leak
> mechanism, which is probably a good thing.
> 
> I have created a bug report, but there is no response.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=218618
> 
> I am uncertain where and to whom I need to report this page leak.
> Can you help me get this issue fixed?

I'm the page_pool maintainer, but as you say yourself in comment 2 then
since dba1b8a7ab68 ("mm/page_pool: catch page_pool memory leaks") this
indicated there is a problem in the xen_netfront driver, which was
previously not visible.

Cc'ing the "XEN NETWORK BACKEND DRIVER" maintainers, as this is a driver
bug.  What confuses me it that I cannot find any modules named
"xen_netfront" in the upstream tree.

IPSEC recently had a similar leak bug. That was fixed in commmit [1]
c3198822c6cb ("net: esp: fix bad handling of pages from page_pool").
This xen_netfront driver likely needs a similar fix.

--Jesper

[1] https://git.kernel.org/torvalds/c/c3198822c6cb


Text copied from bugzilla.kernel.org:
-------------------------------------
[88847.284348] Call Trace:
[88847.284354]  <IRQ>
[88847.284361]  dump_stack_lvl+0x47/0x60
[88847.284378]  bad_page+0x71/0x100
[88847.284393]  free_unref_page_prepare+0x236/0x390
[88847.284405]  free_unref_page+0x34/0x180
[88847.284416]  __pskb_pull_tail+0x3ff/0x4a0
[88847.284432]  xennet_poll+0x909/0xa40 [xen_netfront 
12c02fdcf84c692965d9cd6ca5a6ff0a530b4ce9]
[88847.284470]  __napi_poll+0x28/0x1b0
[88847.284483]  net_rx_action+0x2b5/0x370
[88847.284495]  ? handle_irq_desc+0x3e/0x60
[88847.284511]  __do_softirq+0xc9/0x2c8
[88847.284523]  __irq_exit_rcu+0xa3/0xc0
[88847.284536]  sysvec_xen_hvm_callback+0x72/0x90
[88847.284545]  </IRQ>
[88847.284549]  <TASK>
[88847.284552]  asm_sysvec_xen_hvm_callback+0x1a/0x20
[88847.284562] RIP: 0010:pv_native_safe_halt+0xf/0x20
[88847.284572] Code: 22 d7 c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 
90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d e3 13 27 00 fb 
f4 <c3> cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90
[88847.284579] RSP: 0018:ffffb2a1800c3e58 EFLAGS: 00000246
[88847.284587] RAX: 0000000000004000 RBX: ffff91358033b864 RCX: 
000051404aebd79d
[88847.284594] RDX: ffff9136f9b00000 RSI: ffff91358033b800 RDI: 
0000000000000001
[88847.284599] RBP: ffff91358033b864 R08: ffffffff9b94dca0 R09: 
0000000000000001
[88847.284604] R10: 0000000000000018 R11: ffff9136f9b331a4 R12: 
ffffffff9b94dca0
[88847.284609] R13: ffffffff9b94dd20 R14: 0000000000000001 R15: 
0000000000000000
[88847.284623]  acpi_safe_halt+0x15/0x30
[88847.284634]  acpi_idle_do_entry+0x2f/0x50
[88847.284644]  acpi_idle_enter+0x7f/0xd0
[88847.284655]  cpuidle_enter_state+0x81/0x440
[88847.284667]  cpuidle_enter+0x2d/0x40
[88847.284678]  do_idle+0x1d8/0x230
[88847.284688]  cpu_startup_entry+0x2a/0x30
[88847.284695]  start_secondary+0x11e/0x140
[88847.284705]  secondary_startup_64_no_verify+0x184/0x18b
[88847.284725]  </TASK>

