Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F7E665F51
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 16:41:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475621.737361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFdDS-0000sO-Q9; Wed, 11 Jan 2023 15:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475621.737361; Wed, 11 Jan 2023 15:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFdDS-0000qG-NE; Wed, 11 Jan 2023 15:40:38 +0000
Received: by outflank-mailman (input) for mailman id 475621;
 Wed, 11 Jan 2023 15:40:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNO5=5I=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pFdDQ-0000qA-Su
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 15:40:37 +0000
Received: from sonic307-55.consmr.mail.gq1.yahoo.com
 (sonic307-55.consmr.mail.gq1.yahoo.com [98.137.64.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47c15eb5-91c6-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 16:40:32 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Wed, 11 Jan 2023 15:40:30 +0000
Received: by hermes--production-ne1-5648bd7666-fj7tv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ce1cce5b596248fed3d2923baf1d0f09; 
 Wed, 11 Jan 2023 15:40:26 +0000 (UTC)
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
X-Inumbo-ID: 47c15eb5-91c6-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673451630; bh=s6r8sDYEdbTeLYOFsl5nU8ZnCWpMdTQmdI104oVZvNw=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=jRmQMdEuRFDFQ39ny7YSHp2wuML8TmnCuVUXgYcTsT/EQyrYROgQ+u/2DwiUOj4UL+7aGCEvHVqbv79ce6avA1dYwpaXzbbh2eu/8USXYKd27/wdoqacAxCfV69Fukt0SyW0v0VTrKzTfldVRsxKAsaoAJy65XG0VpuXckDppB7EJny2k5acsVfVkdK1VuRQ9zyyMNeS1CAE0tXnjMLZj+ApFmrgJIy51jBMIy6yQlGuZwzvWNYnIv+g3+e22JGZFm760CdMrIb6T8wHAY53eoE40jmKsiCPwZcUpzN8iLRkSbyv+2o46/qt/M/9IWkpLsfsoCaBUqZc5rOLnhqTiA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673451630; bh=aOL7gpP8uLaEW3P9FsLedafrNgS/BxTOzvqfUf6PCYb=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=JzRwa4+M6y4har9euI9Ci2QQVCz1fZGRVkbf1940ww/tL1YsXY9hPqEjLIc+8yIPYZpnI9dsMst+GP/YKHvvHVaY7xXwS+KoXHAQVjObZSX0kQEEYInwkIgGIgwT3q1BWrfgvRlUpHHNp2cRiHY/BFcJJSTsmPcu7FFi4iCbLHZIYS25ukkQWGQz3yXF9y5MgCgxDjnuRAcEKRfvklT2ZOEgSvfF6pOk0Hq2p7ZQh0CceIDubJSA3RL3bPZ25MNP/OoAg17FM7O3rfcPe6mro4KFkQqoGPrfG5JhKGmDfBXMfskNCsRajOpIGSmgrdb3mSkrk3d97rtbS6JylpnQyQ==
X-YMail-OSG: lYsCu0wVM1k3WaIGZI2L.iu2qG7YRcGMILSxRU5JPKmIxzl6i4pWw0n6uaaqZ5e
 LwF2H5FVE36O17cLqgvLhpPY2KSZlOD0jOBXQWuzE2aORxNhz3n9slMbtEtYFDmGRZaIrzSFiRQh
 N9Y5vP6plZnE6ppOw8m04V8YNTU.ldqdhM7PRwrSYiTYgGOWE41opg9ayUhhyNZ_R8HxYUxm69SG
 ESZuSYGPOJCUtO1ctqwGw6YOQHbdjUxNFd5zch1VV4HWgWQWkIt1jngEcjjPHDr7OK8MaP.ikv_u
 CoiVMeyvFBqmNaMSDyn5UV429_RtCFD_THF1g.6LoohrKy2iPYJAZCmSb2m93rm5ETITf_X5GQve
 d67nMqNKluS_gxdIErIs_W_S2aGfSTtcxkiU7OZ.Urg0pw2izynz_uVOvZel0Q2PZZ6ngYJTMWVX
 PEAqVZ2xmk5c0Th9OLuJYJA7ntTilJ3DW4IBtCCB4YU3OIPFPRl7LzPp56fZXhgs_W7ZyG2YnCbD
 M12j8qbqaErBtF4EL4BA0gxF.AczUTk.ZRlRnyQmUoyPzpgXJZHCA1jfwSxEGdD5SewAwhU4uoNU
 3TEDkliOQ3P9nVqWpvX6OkJE_1ZqvmKU42iGPSl8DbT8rXgYgT82QTX3Fs6OLFWgQjCuqnvZMMzl
 5w0PjjUqAP3LncL1ONGu3qp9YrQGFEuMEVGFK2eMEtlj.DIHP7ZMpfghNRuHpPXzrp3hi8np4B3E
 mn1mInSBQoR.J9WaOjd8sjUz5OR2EWMopLiy8ZGx_MOzCZv64.WbATk6FYX.oHG04xedmp6Th_J3
 SHIUGiOsMT2ABNiXw5GpzWNjF7Uwt6e5ask9aN9vviojGi8QvGEUppU4YJmHxSc0QrFP3bM_1iJS
 lbBbKgvoXt62B9bWyKkhfD0MxdgL.bl2mOVuJoD_3LkDrNsYkM1IjtiUa03T58lt48_WbZcP5lsR
 3_x2XwQMDTeWxRuzjUYgSEkb5zTmBdv0yU_lu6mdlt9EW4VcOKHwzyw3UH4Tp2Butko8p1Y9_cgR
 1XLvcgymX6EhWZhuzR_joqwC_zv0q_MiwmZbrcPAJKM5Jl0lfIGiX_chUQT2udzUce.QadvT1faP
 ZdDyKXj9THauuKmHEmo7yvI9t_AMYBqT9BDZJzTOhkVeH2UTw6_.Qi3pcNhS0JMzAZciULhfJLqD
 A9oMRmW9L_l4BI3BPvWwfOTiZluoRz3hUVxWK3E6QdSiuLzNi4GFWTSckB0_lx.me9L3sYmeKNHq
 jcbOi3pvY8DTQqdfkZDQYXxLH4HCKv5mCyZzOhV0sr9noHkJzkGP62d9KKRSxkBh2Vfg0Dod2nIw
 6bFu_tTxEU2oywhRSzCQe7QhpZmM_w2AG6.bA.MSOKxw_REoxO4m4wF_Kz.T5IELHTAjtw.Eb3KV
 8GO8X2r1N_2TxoxzN0K8XxFK4YYOlRIYRxqm8qD4ZF5ThXOquujUCcoe7pi5HX5UyT9IcZjcft3T
 jBRrIYWf4wQ74ItrBCPX_GnTfL6m0sAVZG1bmn6gUVnGzQVQgqkcSumyzW50S.2hw6W28divjlX7
 GIygfmdgVUti7VWgwTiHTvRw982a.buCK137Dbj1CjYAAWLR9QVjT14hUvjSFnu92W7ATWrzmKTJ
 PDbcP_xloobsPq_LbSbZ0vosDCvjCemWok7muaA8b5eFs9AjLiik3CFY1SDc0G0hi0s8Hri6HDNC
 clBhw_jkaIeBXOaN50LUBZBVILp7lW9ffd5q6zfnvfWmrPqAv56KrfQ53Wtpo8knUlvZuT61f0EX
 y958r_4fyAeukDMHaU8yIGt8PPqqph8B.PqRSdJNSyb8_K704kFVNkLQTSnotN9akVDFWKvCyBhD
 .BRlICshs4UapnpSBSldSLBlrUPNByk4JYsffdWM8Cy1AQUV2CQBfFNjDL3k7ixUJYz6s.8ll4k1
 4eaI9ORQuZbgUpOzTBl5BzlMa6Bi0X._KreaoCmOF6d43qN7ASoUvEYbNOIkUI6dU8Nu5ZTee42r
 4L19QDY_bh9J3R4HX8GV5Vfifc7Si8mXZmcacSvut8bQAWPDVbK3g4DJ0xvU9kE30Az9M1nitlO.
 6b_Iky8YUyRzC.dCgOHKS1D7015zRrYGH7n1XNwkGnJVh7cbgoODU168JwaSR8max3RchS13W4Ss
 Uo_7tMdl2gQ34eZbBdZm1MK1okxDComQ9AHUSL38J5XljbGZKQ61n_4NxxfPmH69j1L6fKvN5WSS
 lJ.NMbXBt0K1peo1teE0RRTN.wg--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
Date: Wed, 11 Jan 2023 10:40:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Bernhard Beschow <shentey@gmail.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230110030331-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/10/23 3:16 AM, Michael S. Tsirkin wrote:
> On Tue, Jan 10, 2023 at 02:08:34AM -0500, Chuck Zmudzinski wrote:
>> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>> as noted in docs/igd-assign.txt in the Qemu source code.
>> 
>> Currently, when the xl toolstack is used to configure a Xen HVM guest with
>> Intel IGD passthrough to the guest with the Qemu upstream device model,
>> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>> a different slot. This problem often prevents the guest from booting.
>> 
>> The only available workaround is not good: Configure Xen HVM guests to use
>> the old and no longer maintained Qemu traditional device model available
>> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>> 
>> To implement this feature in the Qemu upstream device model for Xen HVM
>> guests, introduce the following new functions, types, and macros:
>> 
>> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>> * typedef XenPTQdevRealize function pointer
>> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>> 
>> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>> the xl toolstack with the gfx_passthru option enabled, which sets the
>> igd-passthru=on option to Qemu for the Xen HVM machine type.
>> 
>> The new xen_igd_reserve_slot function also needs to be implemented in
>> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
>> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
>> in which case it does nothing.
>> 
>> The new xen_igd_clear_slot function overrides qdev->realize of the parent
>> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
>> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
>> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
>> 
>> Move the call to xen_host_pci_device_get, and the associated error
>> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
>> initialize the device class and vendor values which enables the checks for
>> the Intel IGD to succeed. The verification that the host device is an
>> Intel IGD to be passed through is done by checking the domain, bus, slot,
>> and function values as well as by checking that gfx_passthru is enabled,
>> the device class is VGA, and the device vendor in Intel.
>> 
>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> ---
>> Notes that might be helpful to reviewers of patched code in hw/xen:
>> 
>> The new functions and types are based on recommendations from Qemu docs:
>> https://qemu.readthedocs.io/en/latest/devel/qom.html
>> 
>> Notes that might be helpful to reviewers of patched code in hw/i386:
>> 
>> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
>> not affect builds that do not have CONFIG_XEN defined.
>> 
>> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
>> existing function that is only true when Qemu is built with
>> xen-pci-passthrough enabled and the administrator has configured the Xen
>> HVM guest with Qemu's igd-passthru=on option.
>> 
>> v2: Remove From: <email address> tag at top of commit message
>> 
>> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
>> 
>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
>> 
>>     is changed to
>> 
>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>>         && (s->hostaddr.function == 0)) {
>> 
>>     I hoped that I could use the test in v2, since it matches the
>>     other tests for the Intel IGD in Qemu and Xen, but those tests
>>     do not work because the necessary data structures are not set with
>>     their values yet. So instead use the test that the administrator
>>     has enabled gfx_passthru and the device address on the host is
>>     02.0. This test does detect the Intel IGD correctly.
>> 
>> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>>     email address to match the address used by the same author in commits
>>     be9c61da and c0e86b76
>>     
>>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
>> 
>> v5: The patch of xen_pt.c was re-worked to allow a more consistent test
>>     for the Intel IGD that uses the same criteria as in other places.
>>     This involved moving the call to xen_host_pci_device_get from
>>     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
>>     Intel IGD in xen_igd_clear_slot:
>>     
>>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>>         && (s->hostaddr.function == 0)) {
>> 
>>     is changed to
>> 
>>     if (is_igd_vga_passthrough(&s->real_device) &&
>>         s->real_device.domain == 0 && s->real_device.bus == 0 &&
>>         s->real_device.dev == 2 && s->real_device.func == 0 &&
>>         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
>> 
>>     Added an explanation for the move of xen_host_pci_device_get from
>>     xen_pt_realize to xen_igd_clear_slot to the commit message.
>> 
>>     Rebase.
>> 
>> v6: Fix logging by removing these lines from the move from xen_pt_realize
>>     to xen_igd_clear_slot that was done in v5:
>> 
>>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
>>                " to devfn 0x%x\n",
>>                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>>                s->dev.devfn);
>> 
>>     This log needs to be in xen_pt_realize because s->dev.devfn is not
>>     set yet in xen_igd_clear_slot.
>> 
>> v7: The v7 that was posted to the mailing list was incorrect. v8 is what
>>     v7 was intended to be.
>> 
>> v8: Inhibit out of context log message and needless processing by
>>     adding 2 lines at the top of the new xen_igd_clear_slot function:
>> 
>>     if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>>         return;
>> 
>>     Rebase. This removed an unnecessary header file from xen_pt.h 
>> 
>>  hw/i386/pc_piix.c    |  3 +++
>>  hw/xen/xen_pt.c      | 49 ++++++++++++++++++++++++++++++++++++--------
>>  hw/xen/xen_pt.h      | 16 +++++++++++++++
>>  hw/xen/xen_pt_stub.c |  4 ++++
>>  4 files changed, 63 insertions(+), 9 deletions(-)
>> 
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index b48047f50c..bc5efa4f59 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>>      }
>>  
>>      pc_xen_hvm_init_pci(machine);
>> +    if (xen_igd_gfx_pt_enabled()) {
>> +        xen_igd_reserve_slot(pcms->bus);
>> +    }
>>      pci_create_simple(pcms->bus, -1, "xen-platform");
>>  }
>>  #endif
> 
> I would even maybe go further and move the whole logic into
> xen_igd_reserve_slot. And I would even just name it
> xen_hvm_init_reserved_slots without worrying about the what
> or why at the pc level.  At this point it will be up to Xen maintainers.

I see to do that would be to resolve the two pc_xen_hvm*
functions in pc_piix.c that are guarded by CONFIG_XEN and
move them to an appropriate place such as xen-hvm.c.

That is along the lines of the work that Bernhard and Philippe
are doing, so I am Cc'ing them. My first inclination is just
to defer to them: I think eventually the little patch I propose
here to pc_piix.c is eventually going to be moved out of pc_piix.c
by Bernhard in a future patch.

What they have been doing is very conservative, and I expect
if and when Bernhard gets here to resolve those functions, they
will do it in a way that keeps the dependency of the xenfv machine
type on the pc machine type and the pc_init1 function.

What I would propose would be to break the dependency of xenfv
on the pc_init1 function. That is, I would propose having a
xenfv_init function in xen-hvm.c, and the first version would
be the current version of pc_init1, so xenfv would still depend
on many i440fx type things, but with the change xen developers
would be free to tweak xenfv_init without affecting the users
of the pc machine type.

Would that be a good idea? If I get posiive feedback for this
idea, I will put it on the table, probably initially as an RFC
patch.

Also, thanks, Michael, for your other suggestions for this patch
about using macros for the devfn constants.

Chuck

> 
>> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
>> index 0ec7e52183..eff38155ef 100644
>> --- a/hw/xen/xen_pt.c
>> +++ b/hw/xen/xen_pt.c
>> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>>                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>>                 s->dev.devfn);
>>  
>> -    xen_host_pci_device_get(&s->real_device,
>> -                            s->hostaddr.domain, s->hostaddr.bus,
>> -                            s->hostaddr.slot, s->hostaddr.function,
>> -                            errp);
>> -    if (*errp) {
>> -        error_append_hint(errp, "Failed to \"open\" the real pci device");
>> -        return;
>> -    }
>> -
>>      s->is_virtfn = s->real_device.is_virtfn;
>>      if (s->is_virtfn) {
>>          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
>> @@ -950,11 +941,50 @@ static void xen_pci_passthrough_instance_init(Object *obj)
>>      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
>>  }
>>  
>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>> +{
>> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
>> +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
>> +}
>> +
>> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
>> +{
>> +    ERRP_GUARD();
>> +    PCIDevice *pci_dev = (PCIDevice *)qdev;
>> +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
>> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
>> +    PCIBus *pci_bus = pci_get_bus(pci_dev);
>> +
>> +    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK))
>> +        return;
>> +
>> +    xen_host_pci_device_get(&s->real_device,
>> +                            s->hostaddr.domain, s->hostaddr.bus,
>> +                            s->hostaddr.slot, s->hostaddr.function,
>> +                            errp);
>> +    if (*errp) {
>> +        error_append_hint(errp, "Failed to \"open\" the real pci device");
>> +        return;
>> +    }
>> +
>> +    if (is_igd_vga_passthrough(&s->real_device) &&
>> +        s->real_device.domain == 0 && s->real_device.bus == 0 &&
>> +        s->real_device.dev == 2 && s->real_device.func == 0 &&
>> +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> 
> how about macros for these?
> 
> #define XEN_PCI_IGD_DOMAIN 0
> #define XEN_PCI_IGD_BUS 0
> #define XEN_PCI_IGD_DEV 2
> #define XEN_PCI_IGD_FN 0
> 
>> +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
> 
> If you are going to do this, you should set it back
> either after pci_qdev_realize or in unrealize,
> for symmetry.
> 
>> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
>> +    }
> 
> 
>> +    xpdc->pci_qdev_realize(qdev, errp);
>> +}
>> +
> 
> 
> 
>>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>  
>> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
>> +    xpdc->pci_qdev_realize = dc->realize;
>> +    dc->realize = xen_igd_clear_slot;
>>      k->realize = xen_pt_realize;
>>      k->exit = xen_pt_unregister_device;
>>      k->config_read = xen_pt_pci_read_config;
>> @@ -977,6 +1007,7 @@ static const TypeInfo xen_pci_passthrough_info = {
>>      .instance_size = sizeof(XenPCIPassthroughState),
>>      .instance_finalize = xen_pci_passthrough_finalize,
>>      .class_init = xen_pci_passthrough_class_init,
>> +    .class_size = sizeof(XenPTDeviceClass),
>>      .instance_init = xen_pci_passthrough_instance_init,
>>      .interfaces = (InterfaceInfo[]) {
>>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
>> index cf10fc7bbf..8c25932b4b 100644
>> --- a/hw/xen/xen_pt.h
>> +++ b/hw/xen/xen_pt.h
>> @@ -2,6 +2,7 @@
>>  #define XEN_PT_H
>>  
>>  #include "hw/xen/xen_common.h"
>> +#include "hw/pci/pci_bus.h"
>>  #include "xen-host-pci-device.h"
>>  #include "qom/object.h"
>>  
>> @@ -40,7 +41,20 @@ typedef struct XenPTReg XenPTReg;
>>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>>  
>> +#define XEN_PT_DEVICE_CLASS(klass) \
>> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
>> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
>> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
>> +
>> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
>> +
>> +typedef struct XenPTDeviceClass {
>> +    PCIDeviceClass parent_class;
>> +    XenPTQdevRealize pci_qdev_realize;
>> +} XenPTDeviceClass;
>> +
>>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
>> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>>                                             XenHostPCIDevice *dev);
>> @@ -75,6 +89,8 @@ typedef int (*xen_pt_conf_byte_read)
>>  
>>  #define XEN_PCI_INTEL_OPREGION 0xfc
>>  
>> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
>> +
> 
> I think you want to calculate this based on dev fn:
> 
> #define XEN_PCI_IGD_SLOT_MASK \
> 	(0x1 << PCI_SLOT(PCI_DEVFN(XEN_PCI_IGD_DEV, XEN_PCI_IGD_FN)))
> 
> 
>>  typedef enum {
>>      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
>>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
>> diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
>> index 2d8cac8d54..5c108446a8 100644
>> --- a/hw/xen/xen_pt_stub.c
>> +++ b/hw/xen/xen_pt_stub.c
>> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>>          error_setg(errp, "Xen PCI passthrough support not built in");
>>      }
>>  }
>> +
>> +void xen_igd_reserve_slot(PCIBus *pci_bus)
>> +{
>> +}
>> -- 
>> 2.39.0
> 


