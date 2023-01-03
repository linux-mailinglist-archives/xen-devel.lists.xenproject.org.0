Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59B65C675
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 19:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470695.730277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCmBl-0003Mx-5J; Tue, 03 Jan 2023 18:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470695.730277; Tue, 03 Jan 2023 18:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCmBl-0003KS-2M; Tue, 03 Jan 2023 18:39:05 +0000
Received: by outflank-mailman (input) for mailman id 470695;
 Tue, 03 Jan 2023 18:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Awo3=5A=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pCmBi-0003KM-Tg
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 18:39:03 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1a14f44-8b95-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 19:38:58 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Tue, 3 Jan 2023 18:38:56 +0000
Received: by hermes--production-ne1-7b69748c4d-ljcdv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e8d8eabb7d2095d26a89087287432376; 
 Tue, 03 Jan 2023 18:38:52 +0000 (UTC)
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
X-Inumbo-ID: e1a14f44-8b95-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1672771136; bh=jk/KLNiyy/FQvaIWK2eHg0WptgKxIBRh7IHFHEKYpQE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=hv7CP/giOX1qsGY0VIw1lh1/GYpUIzG/RE4PDQgN5oDHkURma2JkFbatER7UZo6h661DRV0dp/L4GMbmLRuMXCuEtuyt3RMJG7EWROoBbNHxnzMsZkJBLjm1aBJRfZKcypIkntELcAqUq/dxHgvYwE/v5onddTgU0Da3Lh27nqVKuJgTpy+DAL+5iE8vBhyBEe0wctaEG3Wl3+/HN/O1x9ifQd+O32FBoylMWYMkbzs9Rb4QzbqcS7traVjAX87v0yXvE+1jkUKSZkZVKK/C0kRYtCrj3hAQa4mEYtTePktIPWvuCYr/nezRBE5/DshfUxurZZhw+oru/GmFM79vRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1672771136; bh=hRuGRUez3Oizt3ToDFhsg/1SZnSh4jC6hJlllWzQatj=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=IvaoES6iP1QGItnVNQAEOVWCUELU/Dgq6gEpPs2abS1gu2cTAJlZPHjbIi5RM/7/618RBrH8RCHC+6/elZLq1tBFBv3ug2KdCnSNrknqlN9AYOAZ/vFu5edtn4FtUvt243J+Y8r0KPuowkN2Ir50GG7nqktEAapa7il14xrma9z0936wSestfJzL6ILDKII+vgX0CMS7UlaHh0UZ+k5+5I6wnYSFM+4uw5vfWpDqS/Kgh+uYfRqnF1hxXL4zMRthKvLp0pnyVP6WwcJ1q59QFVmBOVPTqMA7WWLKQEslNb24yPVNro/Ud/pmRAciffLNn1bGi0SVLM8+2MyDefazBA==
X-YMail-OSG: Pxqkev0VM1kZ9lcHp3BG8TNw_e4OtoPcljfhZXr9f.UAqZk_9eDy5yZKdcIVkat
 e8rbybkHsnbzus0vOKoiBlRJ1TOHJU6URU7aenVuc9aawjXoGsMzYSRD.Tqjl8OdY14mlbKE7Uj1
 6i6eQqq8CMVTqINo0q7Pp3KYnBvdvRFOs3Gb99icY4PfZbTnLhV3NlyEY7NaKRAKokJqPutPotfz
 qLAVSVYsqs.5MMLzcz8EIp6lestsZw5XGsbG_FhFST7FDHfR_A4At1NYxCsRQd43ythspegLc32N
 eQoZleQrdgUvDxg1xmd0L8rCZpmn6NS4ADNK5qnJTYume4epZXbvOAjnRgiqukd1kkOJb4Ey6RE5
 J6MGKuQVpHSuGhVXTXpJY6h8zV7y5EV3hhxNP9TAgn1LdrrOYNexkbbrcl9SUCK__GH_pYqNF8Wj
 n22tmFEvARbDR_v7AMw4RVwf4stvoM0lYUen6KJSbD40Tg0SiPgdPDLbdOsvdJ_HdP4NJoR4EGz1
 LYFSnnTvVp5utKncHJLBY5CS87bNaHiE.OxVWfu7kGO9rUFtAk2adia2HaFLwq67AxCQHr8FtBai
 _TlmciLzTMwAmHpYikazEDtU48R65SIaougDhaYdtO.S4OKoKvM4Z0fqxWrLtluaFwbabdm1X9t.
 64VbVnqaqzejohCwuyq31dFojfAKYvNSlJhqMLMBKDokuaW5QRTyzxxj6qkPmHhiZ1j2jMSuxpK4
 fD9aBZxlTto8sZclslhKRcfatKhbdDz3uiCkAVey.tHCuKHNzDgmLBRr7ZAr1Uu1jFmy8u87BeAr
 diLKufT_vSVbGGABb49xpHkTVrCtXxNrrzScmJlzdd3BPbhjkAOM38.farQ3J3IhvCdl0nAUFbi_
 4S9SC6jSKlkTK.Pn0578mZLjH154133AKPpcxameaPBLM_RFJevXLWdoaDCtStimet5pWNRnIeaT
 Z044PksPv.B1jo0W7zQi4zg6mGHVCu.asdiqKqDBE6ZajUVU9HfykIl.S5a.jdjGBbjCJSsOow7X
 u0tZx8YyclHQrSN6rxKyTv5uzt9yQMVjuIZ0q0AAWf2EFxtOOAz5U7taRRY7ZUWAraCxFovKbQJL
 S_Cyy5w1i0BBNj9kB0xMrtlkJcoPukOMVYJ_xZGdoT_4Kw7NADoY9AlOvkraqBzTZYO_eievY7Wc
 UXCl2Ns4z6TjVYsYnhotJt1zxEGtN_KenBycSwcS0s6y46Wl0jRO3CKklDZzEWTkJ74aSisFrThe
 gyjiGdlr4NiLGDlyfr2Jszz_5O37Ql6KQZkfl.QcvsmsiIt5VaJq2rPcRWGzccl6u4mwyr2p6go8
 aXcjWVlD7NhuQ.XwdttT7Y3YMgzmM4do969H.qfLSd7KgZ7Hq8jDvnW5weEaat1bS_et7ISeRRy8
 RGtJov3SiBPeVupZY.NAulXJjfirNjozS_hZPO6ax4LyO0DnCciELWuxJ80mYde2CyUwHLe0swOr
 aFPGy7Rt8O2tJj.qEPljplt2wuGN3L5AG_nMCiZ0XrJTDIalwEAsXm9YCCGkGwlRFw9moriwRDkA
 3yd_uCxI2eRh7bwRq1xF8LqncVR6EhTTXBYUSStfHl39U.lTi.Q.1UdQZVQ_whhDdMmSnMZFm6lx
 rMxS54DRavOwxm6nIha87._oytTKn1gACIpvi5A0H2V_x9zyUK7zodw67M31zywb.PzJQD4CC5tZ
 XDZzqPP2V4FwneNvO0UH.eKjjq6CDlonYn.nsjhOgPi6La_2M_bIscIQPrIhIWM6aMu76T648yLg
 ttuAcpvL3XcCjY0EE.e1JngxQcTlhZCLFqWhcacDak2W5CUAQSzLOU0dhOGKjbUV6EeIjp9UKRMq
 G2tVWQRNOJJnRbGuNIKkduMaMzQx7k6cW9yqDzIdTytvyXeBjf8Malgf8k.T9txoreie9ftH02EL
 HcIW.GZjvuc7e3XJS9EC7CW0A_EHaucrEa5XTaiPoB3l8hjFmy5EtQkrl2Cidx3eGCSTtnw.TmQQ
 m.EPiBIgR1U8mQCjTAEaGEZWrcJNp0yuMJhbrFvEna9Wk_0s9P2LH.mOMp0BVgbC7D2sAIK827e8
 gyROrL9kbLBU4GbH8yFSM0bQIkYaFk9ID3tQTkEpyn7G6pFhakrFhfhthhFfvz3D84ZhxsWKdQUr
 EfY3wtOgAS91a4uIAwXCjrm.Qw6Sf5DQmNZgzYTE63jt.STtw0jhdWrCWPT5hGJIl6a98XCK5dIZ
 VIzixOEE7GW1Leho-
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <c1532681-0a37-7812-84f6-fd1e5dd576c0@aol.com>
Date: Tue, 3 Jan 2023 13:38:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, alex.williamson@redhat.com
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <20230102124605-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230102124605-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/2/2023 12:46 PM, Michael S. Tsirkin wrote:
> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
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
> I'm not sure why is the issue xen specific. Can you explain?
> Doesn't it affect kvm too?

Yes, it does, and of course this only applies to using the igd in a
guest in legacy mode as described in docs/igd-assign.txt.

Searching the web, I found this successful report of legacy
igd passthrough using kvm:

https://www.reddit.com/r/VFIO/comments/i9dbyp/this_is_how_i_managed_to_passthrough_my_igd/

That user posted the virtual machine xml on pastebin:

https://pastebin.com/vYf3a1gz

For reference, details of my configuration of legacy igd passthrough on
xen are available on the xenproject wiki:

https://wiki.xenproject.org/wiki/Xen_VGA_Passthrough_Tested_Adapters#Intel_display_adapters

As I expected, with kvm, it is possible to specify the slot number
of every pci device in the guest (as well as domain, bus, and function)
in the xml configuration, but this is not easy to do with xen's
xenlight (libxl) toolstack. That is why this patch is specific to xen.

To further explain this:

On xen, the xl.cfg guest configuration file does not allow the
administrator to specify the slot number of the xen platform
pci device, or of the emulated network device and disk controller,
and one of these devices will grab slot 2 without this patch to
qemu, making it impossible to have the passed through igd at
slot 2 on xen without patching qemu.

Another way to solve this problem on xen is to extend libxl so the
administrator can specify the slot number of the emulated qemu
pci devices, or possibly by using the xl.cfg
device_model_args_hvm=[ "ARG", "ARG", ...] settings which might
allow the administrator to control the slot number of the emulated
qemu pci devices, and I tried that without success.

This solution of patching qemu to reserve slot 2 for the intel igd when
the qemu igd-passthru=on option for the xenfv machine type is set is
a more simple solution to the problem on xen than trying to manually
set all the slot numbers using the device_model_args_hvm option in
xl.cfg.

I think kvm users who desire this feature of legacy igd passthrough
would benefit from something like the qemu igd-passthru=on option
which, as far as I know, only applies to the xenfv machine type that is
enabled with the gfx_passthru setting in the xl.cfg configuration file.
Such an option for kvm could allow for qemu to take care of all the
details of configuring the vm correctly for igd legacy passthrough
on kvm instead of requiring the administrator to manually specify
all the settings correctly in the xml configuration file.

I think making igd legacy passthrough easier to configure on kvm
would be a useful patch, but it is beyond the scope of what this patch
is trying to accomplish.

Chuck

