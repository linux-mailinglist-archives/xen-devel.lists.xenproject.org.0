Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939ED29CF11
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 09:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13398.34013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhA2-0002R5-TP; Wed, 28 Oct 2020 08:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13398.34013; Wed, 28 Oct 2020 08:50:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXhA2-0002Qk-QF; Wed, 28 Oct 2020 08:50:26 +0000
Received: by outflank-mailman (input) for mailman id 13398;
 Wed, 28 Oct 2020 08:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uak6=ED=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kXhA0-0002Qf-UN
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:50:25 +0000
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fafe5503-2d6e-47e9-a3d3-7948b86efe9a;
 Wed, 28 Oct 2020 08:50:23 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id o70so3635155ybc.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 01:50:23 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Uak6=ED=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
	id 1kXhA0-0002Qf-UN
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:50:25 +0000
X-Inumbo-ID: fafe5503-2d6e-47e9-a3d3-7948b86efe9a
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fafe5503-2d6e-47e9-a3d3-7948b86efe9a;
	Wed, 28 Oct 2020 08:50:23 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id o70so3635155ybc.1
        for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ieqmOtTH2tzg7ChcRoz+nnMCwbn+J69zwhqoR1NXgx8=;
        b=HEK9ynanFA0kNKqLUsZHE+BO4/W4VZzOxLG885P/yQQb0u2+NlCDqmOhHL+j49yKFX
         r19CwtJHC97e69lSKLY3yiDdXt6MOVTeDxZg8YojdwMnIjyHUnZMJCqXR7+f+8wDuv0Z
         ndAjpBB51TslhK6VCLhQNog5+9bs8gYr/wExlrYyk2n832r//GzHnsh0fN9wckLCIzGy
         2gWkrKaBHYrux50YpM7w+PuHHZ6i6sm+GocIU9fDEpdaFG6vCp5BH5gNVCvrTK79jMoL
         MxYBTewvvOdd/dNBUtTveP9bfMuMd3IcqruSvFm1FR3w2kKiSrKS7Xzs0Qn1M0a0agrb
         Vw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ieqmOtTH2tzg7ChcRoz+nnMCwbn+J69zwhqoR1NXgx8=;
        b=WEraeBCsQIqd8uqT5jXBM2sGnd8kOvEAJqQGKaydr54hVk0zPmcocNK72LPdofXVJt
         W3N4cmm0tnT6kUtXuCKRoEzSH1wz6ygWF8Bgkwp/3Veul84G1u2qyGkNrfuYGOVZSH7w
         payMujiSk1iaq+tYFoqBfwKilkDDtCWfusfV2J3OrmT+YnGuung9Evw0M0T4ua1bQXr4
         T13CEL3eUWZZXbwzLbyu/1oSad5fiyqb5kwttDZoxoPFrlVdy12h2YVnZ1nC4J8SqwSN
         F2DXOcOx1vXW1WqchPpqiA3xeRsVPrv+OszouMUhl48nNFnKOgBBAQ3qWefH9MHvzex3
         TSLA==
X-Gm-Message-State: AOAM532rWWjAlkQctu4R/lCOoDr/nkFbGlhJyszi1M5cJyCqpAD7ScqZ
	XqD9uXu6Vrg7MexXOc+d/L8BRIuPj7IecPN1sYts6hLxT1DCKA==
X-Google-Smtp-Source: ABdhPJzVZ41WwXZPYxB8sSVTXxCADIVn/HVtM/c4O+tnQlp9oOuE0HxQcvb2Qy/6HOy2THqmzRqRgvpgkPKDNes6eeg=
X-Received: by 2002:a25:578a:: with SMTP id l132mr8300639ybb.200.1603875022926;
 Wed, 28 Oct 2020 01:50:22 -0700 (PDT)
MIME-Version: 1.0
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Wed, 28 Oct 2020 17:50:12 +0900
Message-ID: <CAA93ih1bgSCNb9X8-NzGJfhFjRH5W5L2wAG0PHfQoUL4qHkZVA@mail.gmail.com>
Subject: [bug report] xen/arm64: singlestep doesn't work on Dom0
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

When I tested the kprobes on Dom0 kernel, it caused a kernel panic.

Here is an example, to clarify the bug is in the single-stepping
(software-step exception), I added a printk() where the kprobes setup
single-stepping.

root@develbox:~# cd /sys/kernel/debug/tracing/
root@develbox:/sys/kernel/debug/tracing# echo p vfs_read > kprobe_events
root@develbox:/sys/kernel/debug/tracing# echo 1 > events/kprobes/enable
root@develbox:/sys/kernel/debug/tracing# [  112.282480] kprobes:
singlestep ool insn at ffff800011785000    <--- This shows single
stepping buffer (trampoline)
[  112.288077] ------------[ cut here ]------------
[  112.292745] kernel BUG at arch/arm64/kernel/traps.c:406!
[  112.298129] Internal error: Oops - BUG: 0 [#1] SMP
[  112.302987] Modules linked in: fuse bridge stp llc binfmt_misc
nls_ascii nls_cp437 vfat fat ahci libahci libata hid_generic udlfb
scsi_mod aes_ce_blk crypto_simd evdev cryptd aes_ce_cipher usbhid
ghash_ce realtek gf128mul hid netsec sha2_ce mdio_devres i2c_algo_bit
of_mdio sha256_arm64 fb_ddc sha1_ce fixed_phy gpio_keys leds_gpio
libphy bpf_preload ip_tables x_tables autofs4 xhci_pci
xhci_pci_renesas xhci_hcd usbcore gpio_mb86s7x
[  112.341097] CPU: 13 PID: 1045 Comm: bash Not tainted 5.10.0-rc1+ #44
[  112.347515] Hardware name: Socionext Developer Box (DT)
[  112.352813] pstate: 00000085 (nzcv daIf -PAN -UAO -TCO BTYPE=--)
[  112.358897] pc : do_undefinstr+0x354/0x378
[  112.363053] lr : do_undefinstr+0x270/0x378
[  112.367218] sp : ffff8000122fbc50
[  112.370603] x29: ffff8000122fbc50 x28: ffff00084bc9e080
[  112.375985] x27: 0000000000000000 x26: 0000000000000000
[  112.381366] x25: 0000000000000000 x24: 0000000000000000
[  112.386748] x23: 0000000080000085 x22: ffff800011785004
[  112.392129] x21: ffff8000122fbe00 x20: ffff8000122fbcc0
[  112.397511] x19: ffff800011249988 x18: 0000000000000000
[  112.402892] x17: 0000000000000000 x16: 0000000000000000
[  112.408274] x15: 0000000000000000 x14: 0000000000000000
[  112.413655] x13: 0000000000000000 x12: 0000000000000000
[  112.419037] x11: 0000000000000000 x10: 0000000000000000
[  112.424426] x9 : ffff800010314614 x8 : 0000000000000000
[  112.429801] x7 : 0000000000000000 x6 : ffff8000122fbca8
[  112.435189] x5 : 0000000000000000 x4 : ffff800011400110
[  112.440564] x3 : 00000000d5300000 x2 : ffff800011255f78
[  112.445946] x1 : ffff800011400110 x0 : 0000000080000085
[  112.451328] Call trace:
[  112.453848]  do_undefinstr+0x354/0x378
[  112.457669]  el1_sync_handler+0xa8/0x138
[  112.461658]  el1_sync+0x7c/0x100
[  112.464958]  0xffff800011785004     /// <- Undefined instruction
error happens on the next instruction of single stepping buffer.
[  112.468172]  __arm64_sys_read+0x24/0x30
[  112.472078]  el0_svc_common.constprop.3+0x94/0x178
[  112.476936]  do_el0_svc+0x2c/0x98
[  112.480321]  el0_sync_handler+0x118/0x168
[  112.484407]  el0_sync+0x158/0x180
[  112.487789] Code: d2801400 17ffffbe a9025bf5 f9001bf7 (d4210000)
[  112.493951] ---[ end trace 3564a3bf75d1618c ]---

So, this seems that the Linux kernel couldn't catch the software-step exception.

I confirmed the same kernel doesn't cause this error without Xen. I
guess Xen is not correctly setting the debug registers when the cpu
goes EL1.
(Or, would we handle debug exceptions in Xen and transfer it to EL1
OS? I'm not sure how it was designed)

Thank you,

-- 
Masami Hiramatsu

