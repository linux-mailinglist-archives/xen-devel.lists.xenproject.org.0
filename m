Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DFB29CFDB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 13:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13585.34280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXkAc-0004Fm-St; Wed, 28 Oct 2020 12:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13585.34280; Wed, 28 Oct 2020 12:03:14 +0000
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
	id 1kXkAc-0004FR-Pf; Wed, 28 Oct 2020 12:03:14 +0000
Received: by outflank-mailman (input) for mailman id 13585;
 Wed, 28 Oct 2020 12:03:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Ob=ED=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kXkAa-0004FM-Od
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 12:03:12 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3801603f-0f13-4ba0-ad66-75a313cbdc68;
 Wed, 28 Oct 2020 12:03:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l8so2841557wmg.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 05:03:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m9sm6035713wmc.31.2020.10.28.05.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 05:03:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A93581FF7E;
 Wed, 28 Oct 2020 12:03:08 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=i5Ob=ED=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kXkAa-0004FM-Od
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 12:03:12 +0000
X-Inumbo-ID: 3801603f-0f13-4ba0-ad66-75a313cbdc68
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3801603f-0f13-4ba0-ad66-75a313cbdc68;
	Wed, 28 Oct 2020 12:03:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l8so2841557wmg.3
        for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=QeWLWGEtkhvw5bvqcQIIMI9QsC8LiRwtu9MHgUBup78=;
        b=wN3gADAKEPYpx5bjjx+cwXJ7o01OjhCipiWA+mAQ4+QhH7tMsLVNKzM03BVcLztEhK
         I7q5hAbmp4U+YPgMPSBlIdkj/VVgKLZxjnoZDerk2QztHwa2qu35c+4jXi4f/2sZmlM0
         AVci8HOUb7NyP1I49w6S0fP153AZsVRVzcxbJ1GTSmNIo2DImxFXmL/LUAyYg6WM0DUJ
         Kqtf1RXu+d/5DLTJtvQtVAV4aypoPsk6+nbZFNk08+a/AJamdEMYH8A2qtSdGRAVYUan
         UyU1vFCl7RYNVoAIPb+iOn5Srk0pP7Fa3E5j22QCmLPN8t5RB4EwSMGqkts58iHfD/tF
         Sh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=QeWLWGEtkhvw5bvqcQIIMI9QsC8LiRwtu9MHgUBup78=;
        b=gwMXs3rUqgCAwLRHJygBk2jcQc+Ynd/aEhakL3UEMgpk9WS/NqX05rxKlkSRHqi5oh
         d2skUfi3Q2Db4nQQW76lgGoyUU2dPjansproDxuJfqeEpvYWstoSw/RJmmvxzH17ISTo
         JySBD/dI+qM/O0VrUAlBbAY7Lu5l90q58wApyA7uBQwzg3j7x2xHRXPJmeB0XoMpfVe6
         stc8YX8OrDO44HxE1LherO7pU1oTyd6siZ9IlQzicE1f0mdp5kA8Pft37QDMcdQgPQSd
         fwC8Ot3uzp1n7kmXfPAb8XJP19sEZ7+Mjaep6M9ukTcmE+acrWdJjFTQH0VRbF+n0sis
         XgdQ==
X-Gm-Message-State: AOAM530JbR1mRXqNVI4qPmEXEx7+EB+kyVuzcBl1cRht1wj483zV3SiP
	J0Tle0xjExAs4I8WAEq8zl07JA==
X-Google-Smtp-Source: ABdhPJykh6a/PwFNMgxjcMkg6AzM2vsOOxyM4IGxXsdGAz94vshaM0qBDUw9+2cUZYwYDNnY5dWPxQ==
X-Received: by 2002:a05:600c:216:: with SMTP id 22mr7450906wmi.149.1603886590759;
        Wed, 28 Oct 2020 05:03:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m9sm6035713wmc.31.2020.10.28.05.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 05:03:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A93581FF7E;
	Wed, 28 Oct 2020 12:03:08 +0000 (GMT)
References: <CAA93ih1bgSCNb9X8-NzGJfhFjRH5W5L2wAG0PHfQoUL4qHkZVA@mail.gmail.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: xen-devel@lists.xenproject.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Stefano Stabellini
 <stefano.stabellini@linaro.org>
Subject: Re: [bug report] xen/arm64: singlestep doesn't work on Dom0
In-reply-to: <CAA93ih1bgSCNb9X8-NzGJfhFjRH5W5L2wAG0PHfQoUL4qHkZVA@mail.gmail.com>
Date: Wed, 28 Oct 2020 12:03:08 +0000
Message-ID: <87imaumubn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Masami Hiramatsu <masami.hiramatsu@linaro.org> writes:

> Hello,
>
> When I tested the kprobes on Dom0 kernel, it caused a kernel panic.
>
> Here is an example, to clarify the bug is in the single-stepping
> (software-step exception), I added a printk() where the kprobes setup
> single-stepping.
>
> root@develbox:~# cd /sys/kernel/debug/tracing/
> root@develbox:/sys/kernel/debug/tracing# echo p vfs_read > kprobe_events
> root@develbox:/sys/kernel/debug/tracing# echo 1 > events/kprobes/enable
> root@develbox:/sys/kernel/debug/tracing# [  112.282480] kprobes:
> singlestep ool insn at ffff800011785000    <--- This shows single
> stepping buffer (trampoline)
> [  112.288077] ------------[ cut here ]------------
> [  112.292745] kernel BUG at arch/arm64/kernel/traps.c:406!
> [  112.298129] Internal error: Oops - BUG: 0 [#1] SMP
> [  112.302987] Modules linked in: fuse bridge stp llc binfmt_misc
> nls_ascii nls_cp437 vfat fat ahci libahci libata hid_generic udlfb
> scsi_mod aes_ce_blk crypto_simd evdev cryptd aes_ce_cipher usbhid
> ghash_ce realtek gf128mul hid netsec sha2_ce mdio_devres i2c_algo_bit
> of_mdio sha256_arm64 fb_ddc sha1_ce fixed_phy gpio_keys leds_gpio
> libphy bpf_preload ip_tables x_tables autofs4 xhci_pci
> xhci_pci_renesas xhci_hcd usbcore gpio_mb86s7x
> [  112.341097] CPU: 13 PID: 1045 Comm: bash Not tainted 5.10.0-rc1+ #44
> [  112.347515] Hardware name: Socionext Developer Box (DT)
> [  112.352813] pstate: 00000085 (nzcv daIf -PAN -UAO -TCO BTYPE=3D--)
> [  112.358897] pc : do_undefinstr+0x354/0x378
> [  112.363053] lr : do_undefinstr+0x270/0x378
> [  112.367218] sp : ffff8000122fbc50
> [  112.370603] x29: ffff8000122fbc50 x28: ffff00084bc9e080
> [  112.375985] x27: 0000000000000000 x26: 0000000000000000
> [  112.381366] x25: 0000000000000000 x24: 0000000000000000
> [  112.386748] x23: 0000000080000085 x22: ffff800011785004
> [  112.392129] x21: ffff8000122fbe00 x20: ffff8000122fbcc0
> [  112.397511] x19: ffff800011249988 x18: 0000000000000000
> [  112.402892] x17: 0000000000000000 x16: 0000000000000000
> [  112.408274] x15: 0000000000000000 x14: 0000000000000000
> [  112.413655] x13: 0000000000000000 x12: 0000000000000000
> [  112.419037] x11: 0000000000000000 x10: 0000000000000000
> [  112.424426] x9 : ffff800010314614 x8 : 0000000000000000
> [  112.429801] x7 : 0000000000000000 x6 : ffff8000122fbca8
> [  112.435189] x5 : 0000000000000000 x4 : ffff800011400110
> [  112.440564] x3 : 00000000d5300000 x2 : ffff800011255f78
> [  112.445946] x1 : ffff800011400110 x0 : 0000000080000085
> [  112.451328] Call trace:
> [  112.453848]  do_undefinstr+0x354/0x378
> [  112.457669]  el1_sync_handler+0xa8/0x138
> [  112.461658]  el1_sync+0x7c/0x100
> [  112.464958]  0xffff800011785004     /// <- Undefined instruction
> error happens on the next instruction of single stepping buffer.
> [  112.468172]  __arm64_sys_read+0x24/0x30
> [  112.472078]  el0_svc_common.constprop.3+0x94/0x178
> [  112.476936]  do_el0_svc+0x2c/0x98
> [  112.480321]  el0_sync_handler+0x118/0x168
> [  112.484407]  el0_sync+0x158/0x180
> [  112.487789] Code: d2801400 17ffffbe a9025bf5 f9001bf7 (d4210000)
> [  112.493951] ---[ end trace 3564a3bf75d1618c ]---
>
> So, this seems that the Linux kernel couldn't catch the software-step exc=
eption.
>
> I confirmed the same kernel doesn't cause this error without Xen. I
> guess Xen is not correctly setting the debug registers when the cpu
> goes EL1.

Having worked on the arm64 KVM debug logic I have a little familiarity
with how it works on KVM.=20

> (Or, would we handle debug exceptions in Xen and transfer it to EL1
> OS? I'm not sure how it was designed)

Xen looks as though it should be trapping a chunk of debug accesses:

    /* Trap Debug and Performance Monitor accesses */
    WRITE_SYSREG(HDCR_TDRA|HDCR_TDOSA|HDCR_TDA|HDCR_TPM|HDCR_TPMCR,
                 MDCR_EL2);

but it doesn't set HDCR_TDE so it won't re-route debug exceptions to EL2
which should be the place that is dealing with them. Also I can't see
where the debug registers are saved/restored. In KVM we maintain a
shadow copy of the guest debug register state while guest debugging is
in effect as any breakpoints you want to trigger need to be copied
across.

I also can't see where CPSR_SS or DBG_MDSCR_SS is set in the mdscr.

FWIW most of the logic in KVM is contained in:

  arch/arm64/kvm/debug.c

with some smatterings of handling the traps and context swapping
elsewhere in the code.

>
> Thank you,


--=20
Alex Benn=C3=A9e

