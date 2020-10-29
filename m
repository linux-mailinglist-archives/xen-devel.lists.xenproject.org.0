Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F50329E0B2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 02:25:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13954.34812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXwgY-0005yy-Ee; Thu, 29 Oct 2020 01:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13954.34812; Thu, 29 Oct 2020 01:25:02 +0000
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
	id 1kXwgY-0005yZ-Aw; Thu, 29 Oct 2020 01:25:02 +0000
Received: by outflank-mailman (input) for mailman id 13954;
 Thu, 29 Oct 2020 01:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPBj=EE=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kXwgW-0005yU-Bk
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 01:25:00 +0000
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 802c85e4-cb22-43fe-bb26-7fc1970de970;
 Thu, 29 Oct 2020 01:24:59 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id c129so806562yba.8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 18:24:59 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PPBj=EE=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
	id 1kXwgW-0005yU-Bk
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 01:25:00 +0000
X-Inumbo-ID: 802c85e4-cb22-43fe-bb26-7fc1970de970
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 802c85e4-cb22-43fe-bb26-7fc1970de970;
	Thu, 29 Oct 2020 01:24:59 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id c129so806562yba.8
        for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 18:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iqr6bSZbDIQ+xxqArcK/RJzLYSJYYDFEaIBFrTmTMA8=;
        b=uoQr1EMA0MpG0SFBA7p+4TUd2tItAZrNja56ZafkkeLGmz2/8Z66iIpq8WJNsQZknW
         pYdapNPbtkHxwmP1ZG4cELKEzD+xQuWpbclBeWjkH2b92WQAfwUV9OZ7uT5UTICPHabc
         4R15TEtkLbewUIleQddL7n0mn2kjdD0Zp30iwSffV/qmXRMbxOihohS0RMQzW4XZkM3f
         tQppSvyw+Pmejq8/HcbEFJZLo5gB62HUBEivGRMqDOo22Q6l5fx1COxgaHTsg66NLXfZ
         js8l/xsmMc6MR1ZfZONZzlXgMlMoUgMtdnT/0jTvpgJ4MdGQ5oQzBxCfu7v3pGvg5hKR
         qxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iqr6bSZbDIQ+xxqArcK/RJzLYSJYYDFEaIBFrTmTMA8=;
        b=ft8jI5c3oQbdrhEcd39RMAxuM3M/dEQDVCy7wKjYoyKPHx4aVvWrjriRpgqkcAUp4e
         eVmqIh2Xi6T1eLlrKjktpZnLLR8k9IGU7msRHM8wNXriyKubCXeGpVpnQ9f/FK9teEJu
         Mc211LS7d1NttfBRCs3Ma2D3UBOM1yXro5Te7hi3iUX3iOc5tsCP6I6uRsPTeoz0mm6A
         qlQuWnAW2jG1tvyO69gv5o638+P5+asChLUua/HdREfvHQByohYdxvKYBpp6B5qBXqMC
         QjWEIogJIExf/X60DQYRmM/mHIUhrQMIPSki5ZXf1FJyckCKSDZtQMv01813qkBRKPhs
         lHSQ==
X-Gm-Message-State: AOAM530ZV+iHXB+r7B9EnzD8Bax2y1tghswP0tlQxzhGd1r8hjHLU7RN
	vbTwUqGwrLYiJboRXrjW4TDYcB+ege/fV9F4/F+Frg==
X-Google-Smtp-Source: ABdhPJzvxyOp/9MQYQSYvvleLDxwqG+JUM4HIQMlnTcrDBZTttHHO92Ty0cBongdY30CJpouw3UhO0GIH5dBh4pK3aE=
X-Received: by 2002:a25:578a:: with SMTP id l132mr2569457ybb.200.1603934698904;
 Wed, 28 Oct 2020 18:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAA93ih1bgSCNb9X8-NzGJfhFjRH5W5L2wAG0PHfQoUL4qHkZVA@mail.gmail.com>
 <87imaumubn.fsf@linaro.org>
In-Reply-To: <87imaumubn.fsf@linaro.org>
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Thu, 29 Oct 2020 10:24:48 +0900
Message-ID: <CAA93ih2M3-Lr78C+GN346m=Ox7fbgNOBJ4JSNJFH-3YmyRYiWg@mail.gmail.com>
Subject: Re: [bug report] xen/arm64: singlestep doesn't work on Dom0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: xen-devel@lists.xenproject.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Jassi Brar <jaswinder.singh@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

2020=E5=B9=B410=E6=9C=8828=E6=97=A5(=E6=B0=B4) 21:03 Alex Benn=C3=A9e <alex=
.bennee@linaro.org>:
>
>
> Masami Hiramatsu <masami.hiramatsu@linaro.org> writes:
>
> > Hello,
> >
> > When I tested the kprobes on Dom0 kernel, it caused a kernel panic.
> >
> > Here is an example, to clarify the bug is in the single-stepping
> > (software-step exception), I added a printk() where the kprobes setup
> > single-stepping.
> >
> > root@develbox:~# cd /sys/kernel/debug/tracing/
> > root@develbox:/sys/kernel/debug/tracing# echo p vfs_read > kprobe_event=
s
> > root@develbox:/sys/kernel/debug/tracing# echo 1 > events/kprobes/enable
> > root@develbox:/sys/kernel/debug/tracing# [  112.282480] kprobes:
> > singlestep ool insn at ffff800011785000    <--- This shows single
> > stepping buffer (trampoline)
> > [  112.288077] ------------[ cut here ]------------
> > [  112.292745] kernel BUG at arch/arm64/kernel/traps.c:406!
> > [  112.298129] Internal error: Oops - BUG: 0 [#1] SMP
> > [  112.302987] Modules linked in: fuse bridge stp llc binfmt_misc
> > nls_ascii nls_cp437 vfat fat ahci libahci libata hid_generic udlfb
> > scsi_mod aes_ce_blk crypto_simd evdev cryptd aes_ce_cipher usbhid
> > ghash_ce realtek gf128mul hid netsec sha2_ce mdio_devres i2c_algo_bit
> > of_mdio sha256_arm64 fb_ddc sha1_ce fixed_phy gpio_keys leds_gpio
> > libphy bpf_preload ip_tables x_tables autofs4 xhci_pci
> > xhci_pci_renesas xhci_hcd usbcore gpio_mb86s7x
> > [  112.341097] CPU: 13 PID: 1045 Comm: bash Not tainted 5.10.0-rc1+ #44
> > [  112.347515] Hardware name: Socionext Developer Box (DT)
> > [  112.352813] pstate: 00000085 (nzcv daIf -PAN -UAO -TCO BTYPE=3D--)
> > [  112.358897] pc : do_undefinstr+0x354/0x378
> > [  112.363053] lr : do_undefinstr+0x270/0x378
> > [  112.367218] sp : ffff8000122fbc50
> > [  112.370603] x29: ffff8000122fbc50 x28: ffff00084bc9e080
> > [  112.375985] x27: 0000000000000000 x26: 0000000000000000
> > [  112.381366] x25: 0000000000000000 x24: 0000000000000000
> > [  112.386748] x23: 0000000080000085 x22: ffff800011785004
> > [  112.392129] x21: ffff8000122fbe00 x20: ffff8000122fbcc0
> > [  112.397511] x19: ffff800011249988 x18: 0000000000000000
> > [  112.402892] x17: 0000000000000000 x16: 0000000000000000
> > [  112.408274] x15: 0000000000000000 x14: 0000000000000000
> > [  112.413655] x13: 0000000000000000 x12: 0000000000000000
> > [  112.419037] x11: 0000000000000000 x10: 0000000000000000
> > [  112.424426] x9 : ffff800010314614 x8 : 0000000000000000
> > [  112.429801] x7 : 0000000000000000 x6 : ffff8000122fbca8
> > [  112.435189] x5 : 0000000000000000 x4 : ffff800011400110
> > [  112.440564] x3 : 00000000d5300000 x2 : ffff800011255f78
> > [  112.445946] x1 : ffff800011400110 x0 : 0000000080000085
> > [  112.451328] Call trace:
> > [  112.453848]  do_undefinstr+0x354/0x378
> > [  112.457669]  el1_sync_handler+0xa8/0x138
> > [  112.461658]  el1_sync+0x7c/0x100
> > [  112.464958]  0xffff800011785004     /// <- Undefined instruction
> > error happens on the next instruction of single stepping buffer.
> > [  112.468172]  __arm64_sys_read+0x24/0x30
> > [  112.472078]  el0_svc_common.constprop.3+0x94/0x178
> > [  112.476936]  do_el0_svc+0x2c/0x98
> > [  112.480321]  el0_sync_handler+0x118/0x168
> > [  112.484407]  el0_sync+0x158/0x180
> > [  112.487789] Code: d2801400 17ffffbe a9025bf5 f9001bf7 (d4210000)
> > [  112.493951] ---[ end trace 3564a3bf75d1618c ]---
> >
> > So, this seems that the Linux kernel couldn't catch the software-step e=
xception.
> >
> > I confirmed the same kernel doesn't cause this error without Xen. I
> > guess Xen is not correctly setting the debug registers when the cpu
> > goes EL1.
>
> Having worked on the arm64 KVM debug logic I have a little familiarity
> with how it works on KVM.
>
> > (Or, would we handle debug exceptions in Xen and transfer it to EL1
> > OS? I'm not sure how it was designed)
>
> Xen looks as though it should be trapping a chunk of debug accesses:
>
>     /* Trap Debug and Performance Monitor accesses */
>     WRITE_SYSREG(HDCR_TDRA|HDCR_TDOSA|HDCR_TDA|HDCR_TPM|HDCR_TPMCR,
>                  MDCR_EL2);
>
> but it doesn't set HDCR_TDE so it won't re-route debug exceptions to EL2
> which should be the place that is dealing with them.

Would we need to re-route the debug exception to EL2? I thought it was
OK to send it to EL1 (Dom0 kernel).

> Also I can't see
> where the debug registers are saved/restored. In KVM we maintain a
> shadow copy of the guest debug register state while guest debugging is
> in effect as any breakpoints you want to trigger need to be copied
> across.

Hmm, so KVM will trap the access of the debug registers in EL1?


> I also can't see where CPSR_SS or DBG_MDSCR_SS is set in the mdscr.
>
> FWIW most of the logic in KVM is contained in:
>
>   arch/arm64/kvm/debug.c
>
> with some smatterings of handling the traps and context swapping
> elsewhere in the code.

Thank you,

--=20
Masami Hiramatsu

