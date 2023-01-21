Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE38676291
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jan 2023 01:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482252.747659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJ280-0006qt-HO; Sat, 21 Jan 2023 00:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482252.747659; Sat, 21 Jan 2023 00:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJ280-0006oY-DZ; Sat, 21 Jan 2023 00:53:04 +0000
Received: by outflank-mailman (input) for mailman id 482252;
 Sat, 21 Jan 2023 00:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L7i5=5S=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pJ27y-0006oQ-9E
 for xen-devel@lists.xenproject.org; Sat, 21 Jan 2023 00:53:02 +0000
Received: from sonic301-20.consmr.mail.gq1.yahoo.com
 (sonic301-20.consmr.mail.gq1.yahoo.com [98.137.64.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1e1eece-9925-11ed-b8d1-410ff93cb8f0;
 Sat, 21 Jan 2023 01:52:58 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Sat, 21 Jan 2023 00:52:56 +0000
Received: by hermes--production-bf1-6bb65c4965-54llb (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 22943f10d0b4b39ec2c7a268d39e9ecc; 
 Sat, 21 Jan 2023 00:52:52 +0000 (UTC)
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
X-Inumbo-ID: f1e1eece-9925-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1674262376; bh=49WGzloNQn8FAamKCSNbg9g20OI68XYnRq+lyN6caEs=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ZMV3S61U+8nFAeEts2TujSxf7e5dH7ku7oZHj4kNlu4nGXUiiSs+C93svm9jRUqRSWxp+ecQtd7FnM8VQQ8oegqZrfkAi89F0pyKHm8XNcvJmLm6YH8nHXO7NVgLv0X+y7UvTAGjSaAT+AMkbSey+ZqjJf6tM9RC/HiGG3A/8yy+GvUfkWtT4EDXyn9SS9b8tBL4CsJaK1kB00i5IoAhApCImLwm6Qq4fE47IPE8c2EHO5hAnEosVuL7t/bWrfK9opEwTzSl/bO94MUcl48VGNtwJRbDkFjBURyNeabu1nnB81UjD7irZwdyoyTG28Utwgl2af7OcaMRkzzhdLjnQw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1674262376; bh=p+1H5TTVr8rFhgUCBtjM7DGX4rzN4EZKEGrMXpK37Fd=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=OSCNodl6tH1GDlheHHH5x7LUNlWFeSmgjbNcFxVz9+U8RhTVGdt2NqoKjrRKNufmzqBnf9QXBnO8WXnTZywa5NwJdW5UaD5YrJVN1POu0tMyzQMwIkNdSBKrQq3mq030O5kWQglsbMjMmD4KlEMz9g9Qg4S6iXWP22PtLBAAh0zqkl8fsTSA+5EdDJw+OBQ3Ya11rj7hoh8ronjPwxH257ppzO1NL7JzRJklqDiXzsHPh0o1VgSRPUZqTzAQNy8/Vq4sWyyy952z965w6j4u9CmfS3ZBg8ZkyLtDn3IdhbQhu9Ew+y/fu1HILgnmqH6GjImv/y0D4TdsvBLaIS9J6g==
X-YMail-OSG: rAgRK98VM1lbEnhanwcb6DcvIdrCcXBglWBHMEfUEQvUQJ6S7aAw04rC.xIge34
 d8lPiBzWyWIv.DTUh2ErMTRSP42gnBtp.CXoFpHtwwHO09RNwybsZXKV10ZvXo3RR8iqymizFBFa
 v4zkRfrr6AXiXwMNGSmoCBLMX44Pntqo8avVAkqVxP0I6yLT9QGpgGIOOaC2rVVjqsYyDoxfKRos
 Yq_dv31LAZYNb.ftVhfN8cDeXi3dgtDfu2sA9.iTt2qLialACt2r4rT76Yw0CwJ0qQDdGqvVycKV
 EgrdN1rwQNHJzYDrNMehDrykJCiw7I8n9IPCxiOyZICzlw02X3QP79_.d68IMK0.IwUuGZUJYHw0
 pbfG9bYgvmbCuQZkiNCnwel5Wyyuqlp.zsGMMnfXRu_68YqXiy0ARj3Ce9a_5vW7YFe1Bmzovvbw
 Dgy8ADwAVETom8CRJ0Cyc5tpkHDOhMh6s3S8VttuD4k._nMeVD55BuB4A.DtlLGNyUp7okx5iVyB
 UpoWVfCi1B8RcDLTMcDI9nr6ukRcZmY5Hm2kMjnVmps1pbpFJxN2LVUSwHm5TPwmbADw31xdiXwa
 CoQIp5ebRY3rr1rSpU_uNErWZhNXjAsXxzEWPXTj6ykubUjLuc59XvjKBhRecaCrX.nXF1tnkq9F
 9DkLHwMKoaQGf4cqjT3qrJQBYfLOYRYh1J.iRXV2Ojukyvrkn66sR0JZmHHha5aj2L76YWIXGSew
 xlPG0Ywx9Ia_AdecrPfQTE1qLOwX9x3XpO7stewBAP3XBL5ejOVWq7KpcUKZBaDw9Ld_fUW2zaB7
 E8f5PcvfMvn6v5bWY_qwROS2ZLrzQIBLSSf6qQOMuhriubqmKJYr3PN7FGS338U_cpnv8.Fy8eLG
 uG7tSYEuGNa1k7C0Ww2R24oh7M.oNxRfPtIgn_qh1klD1B.qgrGllESotR6qIm09NPXNZr32IS0M
 jcLnGpR08A.Mcc6IcuLpYJo3qE7AnckmPkHiwRncK0OHwHXF6r_BHYG7VGpwO5284vKVG9ul75BQ
 faFNhYolm85RM9BF1DIJYHZPH6nNol1yMDRAoBBxZ_pg.Dx24LkV7GxxGEHpMBldtO7F_iE.xvfs
 xE2kaxRUNneMh8v4y90COjwofMi7_YRW5zA4lWssLSafXnptSHOUi_HkYrCd6ReFaB9rlJCPgtyF
 9Zae02Xi0hwi0GsnlelBgag3kHZ9rmowan5IW0wdWJb6yp0Rlh0cGyXs.ue7Y2w7l72gauOTOSxf
 puOEXrBkWCw8jf2ZI9InnK_HtKuvq8H4jo8EAzDnXj61AaWFNWwkoeKqAg2rijyIGMdd.1GJ_kG2
 EOl1E2U59qHckXI.MTZdFDims_wsM7dKwEApOYhqiSjc66WNsyP7BfNqHupQUdLDq2yaubmEY8l3
 nPHcrUcWWMqhCOYrtwH5KO58hgZn7oMkXfvQ8E_mVMx8qn4RRLOVA72jTG6pMvzaOgV3MYWICkJk
 VbkAaGmwXmn.zZ9gexzAZxgXgx9QceCWcLLZf.Jg3o1PtQUK7inala0Hhmtl1pTS7fiP1tf0KpMg
 DYyTmmsR4jMh0UW0ENn.7.3Ho67ptHqxQpsnRZnk39KEF0D.uzfxbDSw4fe.UtgI.wCCQQ8AjYEW
 8XPXZJnPWu1yjmYn9iX0dnXZRSANJ__o70tE.pogb5CGEXZE1vWb4rC8mr4_pzOIMq3ocl37q3mo
 xRKm_mCHqKt.0g41YJdO977Z3IKP3XOpsNf.0.oDaWpbh4A75IDVUvUQF97m7Q5PGvJB6yKJrzR4
 tJ2zmiDqS96Blm1BvbcYPx1ETlMssbl9wlB45V5wGc3aUEvyV9hJrCIOBxEmcyRI7gkCsXjlJhri
 6EityhwuwSTj9AoCikuQivU2aT9sTYukf2E1.t5A8VzrpaNLUQsFUMsoDeX1zfjpBApQ3wMCqeCd
 8fqJNIN7VNZWxkcSs0O7BaiVRyIkNRBaO5KWBbSfR5PacYlVD8EytterkKyuyTqBcauen8aEsjaA
 t2u_pbyROuxGabdEvR7ZKeqBjcRJsBBTCW0chGIAc4oSkrnuoIjnz8HXjhEFRVi.0cRe2tAogtfM
 AwfshmjUpSwryqVCnrho4yuFw47Avzk8mh4f_q9nR8zEuW7.jvxGEXtyazWHlYQsCdH0MPb54eZE
 _TDlrNsNPE4vtgCDMiVLF3Cw34ItIvWv6uJuHxoxtbNY7yArDvWt4Lappu7JojOiCxXkjlENLUp8
 cJS.POSLgvs.NtBCwVv2RZ2m17Fs-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <669190e6-fbbf-7dd6-b879-8082fa2e5339@netscape.net>
Date: Fri, 20 Jan 2023 19:52:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v9] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-stable@nongnu.org
References: <974c616b8632f1d7ca3917f8143d8cebf946a55c.1673672956.git.brchuckz.ref@aol.com>
 <974c616b8632f1d7ca3917f8143d8cebf946a55c.1673672956.git.brchuckz@aol.com>
 <alpine.DEB.2.22.394.2301201334250.731018@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <alpine.DEB.2.22.394.2301201334250.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21096 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/20/23 4:34 PM, Stefano Stabellini wrote:
> On Sat, 14 Jan 2023, Chuck Zmudzinski wrote:
> > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > as noted in docs/igd-assign.txt in the Qemu source code.
> > 
> > Currently, when the xl toolstack is used to configure a Xen HVM guest with
> > Intel IGD passthrough to the guest with the Qemu upstream device model,
> > a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> > a different slot. This problem often prevents the guest from booting.
> > 
> > The only available workaround is not good: Configure Xen HVM guests to use
> > the old and no longer maintained Qemu traditional device model available
> > from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> > 
> > To implement this feature in the Qemu upstream device model for Xen HVM
> > guests, introduce the following new functions, types, and macros:
> > 
> > * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> > * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> > * typedef XenPTQdevRealize function pointer
> > * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> > * xen_igd_reserve_slot and xen_igd_clear_slot functions
> > 
> > Michael Tsirkin:
> > * Introduce XEN_PCI_IGD_DOMAIN, XEN_PCI_IGD_BUS, XEN_PCI_IGD_DEV, and
> >   XEN_PCI_IGD_FN - use them to compute the value of XEN_PCI_IGD_SLOT_MASK
> > 
> > The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> > member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> > the xl toolstack with the gfx_passthru option enabled, which sets the
> > igd-passthru=on option to Qemu for the Xen HVM machine type.
> > 
> > The new xen_igd_reserve_slot function also needs to be implemented in
> > hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> > when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> > in which case it does nothing.
> > 
> > The new xen_igd_clear_slot function overrides qdev->realize of the parent
> > PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> > since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> > created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> > 
> > Move the call to xen_host_pci_device_get, and the associated error
> > handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> > initialize the device class and vendor values which enables the checks for
> > the Intel IGD to succeed. The verification that the host device is an
> > Intel IGD to be passed through is done by checking the domain, bus, slot,
> > and function values as well as by checking that gfx_passthru is enabled,
> > the device class is VGA, and the device vendor in Intel.
> > 
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>
> Hi Chuck,
>
> The approach looks OK in principle to me. I only have one question: for
> other PCI devices (not Intel IGD), where is xen_host_pci_device_get
> called now?

I think you are right that there might be a problem for the
devices being added after the Intel IGD. I think I only tested
the case when the Intel IGD is the last device being added.
I do expect if I add the Intel IGD first, then there will be
problems when the subsequent type XEN_PT devices are
added because xen_pt_realize will not like it if
xen_host_pci_device_get does not get called. I will check
this over the weekend and, if a change is needed, I will
post it in v10.

I also think there is the same problem when the bit in
slot_reserved_mask is never set, which happens when
the guest has pci devices passed through but without
configuring Qemu with the igd-passthru=on option for
the xenfv machine type. I will also test this over the
weekend.

> It looks like that xen_igd_reserve_slot would return without setting
> slot_reserved_mask, hence xen_igd_clear_slot would also return without
> calling xen_host_pci_device_get. And xen_pt_realize doesn't call
> xen_host_pci_device_get any longer.
>
> Am I missing something?

No, you are not missing anything. You are pointing to some
cases that I need to test that probably would not work.
I think the fix is to have this at the beginning of
xen_igd_clear_slot instead of what I have now:

    xen_host_pci_device_get(&s->real_device,
                            s->hostaddr.domain, s->hostaddr.bus,
                            s->hostaddr.slot, s->hostaddr.function,
                            errp);
    if (*errp) {
        error_append_hint(errp, "Failed to \"open\" the real pci device");
        return;
    }

    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
        return;

That way xen_host_pci_device_get would still get called
when xen_igd_clear_slot returns because the bit in the
mask was not set.

Thanks for your careful review of the patch. I think you
did find a real mistake that needs to be fixed in v10 which
I hope to post with the above mentioned change early next
week.

Chuck
>
>
> > ---
> > Notes that might be helpful to reviewers of patched code in hw/xen:
> > 
> > The new functions and types are based on recommendations from Qemu docs:
> > https://qemu.readthedocs.io/en/latest/devel/qom.html
> > 
> > Notes that might be helpful to reviewers of patched code in hw/i386:
> > 
> > The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
> > not affect builds that do not have CONFIG_XEN defined.
> > 
> > xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
> > existing function that is only true when Qemu is built with
> > xen-pci-passthrough enabled and the administrator has configured the Xen
> > HVM guest with Qemu's igd-passthru=on option.
> > 
> > v2: Remove From: <email address> tag at top of commit message
> > 
> > v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
> > 
> >     if (is_igd_vga_passthrough(&s->real_device) &&
> >         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
> > 
> >     is changed to
> > 
> >     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
> >         && (s->hostaddr.function == 0)) {
> > 
> >     I hoped that I could use the test in v2, since it matches the
> >     other tests for the Intel IGD in Qemu and Xen, but those tests
> >     do not work because the necessary data structures are not set with
> >     their values yet. So instead use the test that the administrator
> >     has enabled gfx_passthru and the device address on the host is
> >     02.0. This test does detect the Intel IGD correctly.
> > 
> > v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
> >     email address to match the address used by the same author in commits
> >     be9c61da and c0e86b76
> >     
> >     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
> > 
> > v5: The patch of xen_pt.c was re-worked to allow a more consistent test
> >     for the Intel IGD that uses the same criteria as in other places.
> >     This involved moving the call to xen_host_pci_device_get from
> >     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
> >     Intel IGD in xen_igd_clear_slot:
> >     
> >     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
> >         && (s->hostaddr.function == 0)) {
> > 
> >     is changed to
> > 
> >     if (is_igd_vga_passthrough(&s->real_device) &&
> >         s->real_device.domain == 0 && s->real_device.bus == 0 &&
> >         s->real_device.dev == 2 && s->real_device.func == 0 &&
> >         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> > 
> >     Added an explanation for the move of xen_host_pci_device_get from
> >     xen_pt_realize to xen_igd_clear_slot to the commit message.
> > 
> >     Rebase.
> > 
> > v6: Fix logging by removing these lines from the move from xen_pt_realize
> >     to xen_igd_clear_slot that was done in v5:
> > 
> >     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
> >                " to devfn 0x%x\n",
> >                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
> >                s->dev.devfn);
> > 
> >     This log needs to be in xen_pt_realize because s->dev.devfn is not
> >     set yet in xen_igd_clear_slot.
> > 
> > v7: The v7 that was posted to the mailing list was incorrect. v8 is what
> >     v7 was intended to be.
> > 
> > v8: Inhibit out of context log message and needless processing by
> >     adding 2 lines at the top of the new xen_igd_clear_slot function:
> > 
> >     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
> >         return;
> > 
> >     Rebase. This removed an unnecessary header file from xen_pt.h 
> > 
> > v9: Move check for xen_igd_gfx_pt_enabled() from pc_piix.c to xen_pt.c
> > 
> >     Move #include "hw/pci/pci_bus.h" from xen_pt.h to xen_pt.c
> > 
> >     Introduce macros for the IGD devfn constants and use them to compute
> >     the value of XEN_PCI_IGD_SLOT_MASK
> > 
> >     Also use the new macros at an appropriate place in xen_pt_realize
> > 
> >     Add Cc: to stable - This has been broken for a long time, ever since
> >                         support for igd-passthru was added to Qemu 7
> >                         years ago.
> > 
> >     Mention new macros in the commit message (Michael Tsirkin)
> > 
> >     N.B.: I could not follow the suggestion to move the statement
> >     pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK; to after
> >     pci_qdev_realize for symmetry. Doing that results in an error when
> >     creating the guest:
> >     
> >     libxl: error: libxl_qmp.c:1837:qmp_ev_parse_error_messages: Domain 4:PCI: slot 2 function 0 not available for xen-pci-passthrough, reserved
> >     libxl: error: libxl_pci.c:1809:device_pci_add_done: Domain 4:libxl__device_pci_add failed for PCI device 0:0:2.0 (rc -28)
> >     libxl: error: libxl_create.c:1921:domcreate_attach_devices: Domain 4:unable to add pci devices
> > 
> >  hw/i386/pc_piix.c    |  1 +
> >  hw/xen/xen_pt.c      | 61 ++++++++++++++++++++++++++++++++++++--------
> >  hw/xen/xen_pt.h      | 20 +++++++++++++++
> >  hw/xen/xen_pt_stub.c |  4 +++
> >  4 files changed, 75 insertions(+), 11 deletions(-)
> > 
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index b48047f50c..8fc96eb63b 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -405,6 +405,7 @@ static void pc_xen_hvm_init(MachineState *machine)
> >      }
> >  
> >      pc_xen_hvm_init_pci(machine);
> > +    xen_igd_reserve_slot(pcms->bus);
> >      pci_create_simple(pcms->bus, -1, "xen-platform");
> >  }
> >  #endif
> > diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> > index 0ec7e52183..51f100f64a 100644
> > --- a/hw/xen/xen_pt.c
> > +++ b/hw/xen/xen_pt.c
> > @@ -57,6 +57,7 @@
> >  #include <sys/ioctl.h>
> >  
> >  #include "hw/pci/pci.h"
> > +#include "hw/pci/pci_bus.h"
> >  #include "hw/qdev-properties.h"
> >  #include "hw/qdev-properties-system.h"
> >  #include "hw/xen/xen.h"
> > @@ -780,15 +781,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
> >                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
> >                 s->dev.devfn);
> >  
> > -    xen_host_pci_device_get(&s->real_device,
> > -                            s->hostaddr.domain, s->hostaddr.bus,
> > -                            s->hostaddr.slot, s->hostaddr.function,
> > -                            errp);
> > -    if (*errp) {
> > -        error_append_hint(errp, "Failed to \"open\" the real pci device");
> > -        return;
> > -    }
> > -
> >      s->is_virtfn = s->real_device.is_virtfn;
> >      if (s->is_virtfn) {
> >          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
> > @@ -803,8 +795,10 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
> >      s->io_listener = xen_pt_io_listener;
> >  
> >      /* Setup VGA bios for passthrough GFX */
> > -    if ((s->real_device.domain == 0) && (s->real_device.bus == 0) &&
> > -        (s->real_device.dev == 2) && (s->real_device.func == 0)) {
> > +    if ((s->real_device.domain == XEN_PCI_IGD_DOMAIN) &&
> > +        (s->real_device.bus == XEN_PCI_IGD_BUS) &&
> > +        (s->real_device.dev == XEN_PCI_IGD_DEV) &&
> > +        (s->real_device.func == XEN_PCI_IGD_FN)) {
> >          if (!is_igd_vga_passthrough(&s->real_device)) {
> >              error_setg(errp, "Need to enable igd-passthru if you're trying"
> >                      " to passthrough IGD GFX");
> > @@ -950,11 +944,55 @@ static void xen_pci_passthrough_instance_init(Object *obj)
> >      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
> >  }
> >  
> > +void xen_igd_reserve_slot(PCIBus *pci_bus)
> > +{
> > +    if (!xen_igd_gfx_pt_enabled())
> > +        return;
> > +
> > +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
> > +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
> > +}
> > +
> > +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
> > +{
> > +    ERRP_GUARD();
> > +    PCIDevice *pci_dev = (PCIDevice *)qdev;
> > +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
> > +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
> > +    PCIBus *pci_bus = pci_get_bus(pci_dev);
> > +
> > +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
> > +        return;
> > +
> > +    xen_host_pci_device_get(&s->real_device,
> > +                            s->hostaddr.domain, s->hostaddr.bus,
> > +                            s->hostaddr.slot, s->hostaddr.function,
> > +                            errp);
> > +    if (*errp) {
> > +        error_append_hint(errp, "Failed to \"open\" the real pci device");
> > +        return;
> > +    }
> > +
> > +    if (is_igd_vga_passthrough(&s->real_device) &&
> > +        s->real_device.domain == XEN_PCI_IGD_DOMAIN &&
> > +        s->real_device.bus == XEN_PCI_IGD_BUS &&
> > +        s->real_device.dev == XEN_PCI_IGD_DEV &&
> > +        s->real_device.func == XEN_PCI_IGD_FN &&
> > +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> > +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
> > +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
> > +    }
> > +    xpdc->pci_qdev_realize(qdev, errp);
> > +}
> > +
> >  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> >      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >  
> > +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
> > +    xpdc->pci_qdev_realize = dc->realize;
> > +    dc->realize = xen_igd_clear_slot;
> >      k->realize = xen_pt_realize;
> >      k->exit = xen_pt_unregister_device;
> >      k->config_read = xen_pt_pci_read_config;
> > @@ -977,6 +1015,7 @@ static const TypeInfo xen_pci_passthrough_info = {
> >      .instance_size = sizeof(XenPCIPassthroughState),
> >      .instance_finalize = xen_pci_passthrough_finalize,
> >      .class_init = xen_pci_passthrough_class_init,
> > +    .class_size = sizeof(XenPTDeviceClass),
> >      .instance_init = xen_pci_passthrough_instance_init,
> >      .interfaces = (InterfaceInfo[]) {
> >          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> > index cf10fc7bbf..e184699740 100644
> > --- a/hw/xen/xen_pt.h
> > +++ b/hw/xen/xen_pt.h
> > @@ -40,7 +40,20 @@ typedef struct XenPTReg XenPTReg;
> >  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
> >  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
> >  
> > +#define XEN_PT_DEVICE_CLASS(klass) \
> > +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
> > +#define XEN_PT_DEVICE_GET_CLASS(obj) \
> > +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
> > +
> > +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
> > +
> > +typedef struct XenPTDeviceClass {
> > +    PCIDeviceClass parent_class;
> > +    XenPTQdevRealize pci_qdev_realize;
> > +} XenPTDeviceClass;
> > +
> >  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
> > +void xen_igd_reserve_slot(PCIBus *pci_bus);
> >  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
> >  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
> >                                             XenHostPCIDevice *dev);
> > @@ -75,6 +88,13 @@ typedef int (*xen_pt_conf_byte_read)
> >  
> >  #define XEN_PCI_INTEL_OPREGION 0xfc
> >  
> > +#define XEN_PCI_IGD_DOMAIN 0
> > +#define XEN_PCI_IGD_BUS 0
> > +#define XEN_PCI_IGD_DEV 2
> > +#define XEN_PCI_IGD_FN 0
> > +#define XEN_PCI_IGD_SLOT_MASK \
> > +    (1UL << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
> > +
> >  typedef enum {
> >      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
> >      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
> > diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
> > index 2d8cac8d54..5c108446a8 100644
> > --- a/hw/xen/xen_pt_stub.c
> > +++ b/hw/xen/xen_pt_stub.c
> > @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
> >          error_setg(errp, "Xen PCI passthrough support not built in");
> >      }
> >  }
> > +
> > +void xen_igd_reserve_slot(PCIBus *pci_bus)
> > +{
> > +}
> > -- 
> > 2.39.0
> > 


